Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 349C3339A0
	for <dtrace@lists.linux.dev>; Thu, 24 Oct 2024 02:42:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729737767; cv=fail; b=F6JuuG8ul9vrw485lZroRfAGGdmS2v0B3UI3r3r0RWl5munRpGFv8UhBQsnxyqf+PeBgwKoxvoeEIU2kTAtuoR3mEDUz7z0p8sMNtPO8vYJofhIoAZ0aMHR2WoRGGeIZbzXAa9UMqptAhSZtZBvELeOAaxzV41q54fSJfT0JLzU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729737767; c=relaxed/simple;
	bh=Sccn7ojxfmN/gKCSWvfjlsyILmxRwc6FuaJwYh++GEE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Yd/i3681oukHLBIvHhSxCRhoM4P91752AZL/tDfmJnrPYUy7OkPG0aOXEFaDxuBNc4HSkbMjMqiRBI8/VOOZhLBmGN6yXioSQ5/6s013I7xM6/HQJo+bhTioQGCfKJMR0aUVJZW5yLh/HXtY0+qb95CIsel95FtMs0qP+oGUE7w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=CfZJbzeq; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=GTYl4WHF; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="CfZJbzeq";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="GTYl4WHF"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49O2fdPc011992
	for <dtrace@lists.linux.dev>; Thu, 24 Oct 2024 02:42:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=5e0TFuZn35z2/iFcss
	hpk0fVk1brZmoVjsthBIV1lMk=; b=CfZJbzeqSH8takDRKojGIET2A1KAyi8zwf
	m6VmbB4igPSWA0U/JXlmBoygcUrlFpL8YWFQ8p32CFRQeITZLoSK8z6ZTNmtEH0f
	/hrxOLQHePbSxa3/xVsj10ylfhvkucqGInz4DGssuSzfNxBDc2HDb32SfU9nBj+f
	vlBGfi4SuNNDDfubL/bXTcYUfLUHGZFt7A0xyj16c8xQ9tNolTsLASe11Chqo4bi
	EmhoTeTUVWl6sDEMtrl5HwQanVHjypFWBy7neSw5RTQQd89ZAVnxuyBzekLimMZC
	i1Y5F1EMakqiwXOBJHv9Y6notniW6JImxCef+WIMSYu3X4Y6F3Ig==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 42c53usgwv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 24 Oct 2024 02:42:42 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 49O1LWhe036047
	for <dtrace@lists.linux.dev>; Thu, 24 Oct 2024 02:42:41 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2040.outbound.protection.outlook.com [104.47.66.40])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 42emh39s4h-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 24 Oct 2024 02:42:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fptujsshhjMuZqoGNF/6MqWVsyAzBDkoYcuX7BuUo1bMa06YO5H6SqDRktcOqBD2usF7NmK5PBA0XmX49vi3IzZ8m4KBOH3JDttgWALyLgEbDFGhjTNpRzk9mEEQe2Re63Sc5N9ZeLWX/NqEVcqNrS0uehAzEppn/2e3NWtNbrxKXmllLs93liZE54PpWJjZz2axgmwC5qzx1O4y2Mps1R9ISZEXARjER807ewiE84uP9SBdOsaIUbggvdO2uQQlPQCTcOY+b6LEHDnLTeaUS0MOndXCQc9Kyl6Tv1mCQ14u/XB+DLGeGXz8PoZ1pPncZpuvAXVnCF2bNGonX++dew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5e0TFuZn35z2/iFcsshpk0fVk1brZmoVjsthBIV1lMk=;
 b=LBCknd+wJIoZNPIU+q6YAjwQQeeW3b3QGb8UiS/h3SHbf5UeJBgSZyNxO1u8dusHtvAhd24BexEKvc5WEfSySbElvLJvvnOhr4FRfE5MGbLDNZRXkoq+jgcVeac2UwJ3bCsz3xBDkINgj8xVErE8yQ75wBqPkkr3h8N+p9PWGJI2gFKKBTSaDFaWpywq+keC2cOtC0fILLol1+pV0UdQ+pm+D6HA0bqQqXvTtofsuLQtseUSsB4YGxg4cp0atxMoozAtfrKC5JE0iB+6epy0ZSN8T5N57L/wvKRf15E0CM/OwR4yp96MfcLfF5QbCDgmOY3U6vHYeeLkrc/B6/aRuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5e0TFuZn35z2/iFcsshpk0fVk1brZmoVjsthBIV1lMk=;
 b=GTYl4WHFa4dWGlSsmEEyM0c4XjoJ5lonL/Lk+pCS4GJwHvgSFp4MX6tXiFDUDJbZgS+3S8o6lUssbemNSPRGE3uKrjkjBD07YYslSZ/m/Io+2jW3H8GcOrzGYVNbO1mQiiVUI0e+AMt5KWgLUBI0X1vuyEvdZtaB0mqo2dcHy5A=
Received: from CO1PR10MB4769.namprd10.prod.outlook.com (2603:10b6:303:98::16)
 by MN6PR10MB8093.namprd10.prod.outlook.com (2603:10b6:208:4f5::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.16; Thu, 24 Oct
 2024 02:42:37 +0000
Received: from CO1PR10MB4769.namprd10.prod.outlook.com
 ([fe80::6801:f7c:753b:5a82]) by CO1PR10MB4769.namprd10.prod.outlook.com
 ([fe80::6801:f7c:753b:5a82%6]) with mapi id 15.20.8093.014; Thu, 24 Oct 2024
 02:42:36 +0000
Date: Wed, 23 Oct 2024 22:42:34 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: eugene.loh@oracle.com
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH 08/19] Support multiple overlying probes in the uprobe
 trampoline
Message-ID: <Zxm0GsvMqDP0lO8c@kvh-deb-bpf.us.oracle.com>
References: <20240829052558.3525-1-eugene.loh@oracle.com>
 <20240829052558.3525-8-eugene.loh@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240829052558.3525-8-eugene.loh@oracle.com>
X-ClientProxiedBy: BYAPR05CA0073.namprd05.prod.outlook.com
 (2603:10b6:a03:e0::14) To CO1PR10MB4769.namprd10.prod.outlook.com
 (2603:10b6:303:98::16)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR10MB4769:EE_|MN6PR10MB8093:EE_
X-MS-Office365-Filtering-Correlation-Id: 85979c94-7f31-42a5-1656-08dcf3d58530
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?nFZHAyBii0ulEhK40vUhXn8564XILH+Awsf5F2w5zyfJ7yRZLs6ENrMa5rHt?=
 =?us-ascii?Q?QZaVZ1s9L9iMUJzOtWa98BBdZ+Q2/8tYTHWbnxatCyYrPypjJHNRWNBth5+L?=
 =?us-ascii?Q?NbERk66qBjEUmh0ch/ULBoocm8DXZdvV8pxLI8aH/KMvhlmuxyPOdenN/iG3?=
 =?us-ascii?Q?uxjLWtfVu9Jc/hbZRh1GheXIxutfwXFElveTnW6pv3a+ZuApGfp4QuYuxhJ2?=
 =?us-ascii?Q?IR9y8K/kgZXqJaG6+Y01n7YhANyWRB+HXtNJHprWZSjstiG0pM9DRrn0Qclp?=
 =?us-ascii?Q?mfunbq3VPCas7xZOa7NTQ/e8domQStZWCTSpVfSQMc9F3VICCuSqdVjPDmWa?=
 =?us-ascii?Q?k/1FA9Ywl23Fqb3F4tlm9yp9VF0f1OlbL9BInoX78hEB+V026Vw9+HiHtC9a?=
 =?us-ascii?Q?XdJI0p97/ErUNDdWNzUURJ5pSEO8j6LHxEzAkyPqqmlZ8Rcjn6jKisuxOnGK?=
 =?us-ascii?Q?hdaN0BidDzuv2X+ziPWoSqw8rJLKNhAQFdbkFDonaUPWjus5CFTXYnJBcsM4?=
 =?us-ascii?Q?EGE5fvDuu4QmciWqMVOuYVjnOU559ltQgS1+TGRU7YYkYYUxkfpZlTvRePy1?=
 =?us-ascii?Q?P19Y4qAEd3khZiltedSZsYCqxqJoWuhKTWG/luORRaO6rhPjs0UFzuINozc1?=
 =?us-ascii?Q?cNwlqp7xrY7lUyjMWCnlyCye3FN5IxCsr6FKohy1EmIpH05XBfQ6NwILgQkW?=
 =?us-ascii?Q?+9KDxUKi2PK+MgHrXM0wmQ6xyynVx7DKMG86QWBLbsPp1QEeJJHNRN9xBpsm?=
 =?us-ascii?Q?OwsKda2lLrASK0jyHG98IHq7d+xHIE2VkRHPeEZ0qAL9w0kNr60MJxr73shk?=
 =?us-ascii?Q?/zuEv7kgAkFiMus8/v5SyiQBRWjmLUgkzYM+aRiiVUMfbIel7n/t9+a8lb44?=
 =?us-ascii?Q?1VQZ54Ee/U2pLQQ33WvCV7FiYXRjGBAA/iXkk/sf1rzAVtfKq1eH8WYTWhlZ?=
 =?us-ascii?Q?xmFbfK7MQ7DUSna0Wsr+WudpIMWXEoIgt8VPkOCQfZgGp3F+sAAofgoZqufA?=
 =?us-ascii?Q?zJRqEbpTpOe3TKzHbvKODOl38cLCFeIBPTkgUucY4omfCUXHhCQ6VphpKMfV?=
 =?us-ascii?Q?vQPgGY3MyMCaagbyEMH5vOdi2mA0JEsxrUi2zub11ZmAxv4/hnjTLruAh81D?=
 =?us-ascii?Q?939VxQ/7TiuE3p3zh9cXiTDpoFg+BYKyhJqANZt5cJ6aKMDpfDUwYhyQ7LhU?=
 =?us-ascii?Q?FGt4IWHjeds+2+9JvC4PIPaPoO+9eX+yT/sdl3D2UU5sQAm7ciMVJRdmCiIf?=
 =?us-ascii?Q?4eAEZ2BOH+/gCPhbyUNk1x5+/5Z1OGsmw9+aNoO6a9CG+JKMNeO9QfEZ5++e?=
 =?us-ascii?Q?TTR7+VShJ+ZHoQqjnw2HAq9r?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR10MB4769.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?bqoO7WYrCOgPQVEv1tKWpX+THhgzxC2Bv+3zqChJWYETEe8q0NpCNHJvnvAL?=
 =?us-ascii?Q?QYxCuqCflPaF+dFiXnR6lxYLML6MVrU1Oq/Qy/vHcCLgssYGQ4z30LM5Y9N0?=
 =?us-ascii?Q?vJyPsMkz0bka48E3dPr1q6VyVEvcLky+Ppxyb4VG6q/8un9MZrbQDjtTwg8N?=
 =?us-ascii?Q?v3QtY0ZIvLfma8X2nF1jOfqaCZ3CbdJJytPk9ATSaPU4EaKNetCeANPb9wtK?=
 =?us-ascii?Q?4gbQuuaMLc81JWivMy07T8l1xwG681iURjCcnnrkFdZ/76PPoR+I/afyOn0n?=
 =?us-ascii?Q?bFR9AZj2Xz+MUfQCHkabBlgf+O1/8B25LtPOPQKAi0+94WKM5P/p0PGLiy0A?=
 =?us-ascii?Q?J5bdOj/aq520hNj5NF19K8rivgramLStZ5xqi4MrD0O/WRwGBF92qH5tJDSH?=
 =?us-ascii?Q?iWFIULEHlP7O8kMA8K+ia9tGlpno+QbXyUe5D7etqeqSs6TWUmTZJPBTBBvt?=
 =?us-ascii?Q?4JtJi/THZstR2SPrKXd2KVpYqXmrp5f/Gk9Nk4l+3/b++11Gr2H7GhwiCUQZ?=
 =?us-ascii?Q?CTY0dl1I1dcKpVV7mK0A+hWwNJA7jqyUaOUrkNMAfNoLR8U/NSr+24cfQ011?=
 =?us-ascii?Q?lBBia8AkRf/9kEfUyQ4PArWqcN+5/IOBje34t2e7EN30ZRLXELnGuj89XoMC?=
 =?us-ascii?Q?hNi2FrJFYdtGO6+o0LFnKGgtj78uMt4OiKzhuNgoB3o9k5gqWYRPXk7ABbBD?=
 =?us-ascii?Q?Q2JL8/xgWDwU8w1dJND21pg+6piC1WIQRGM0g6VisEmCoqMcrTCaHV3VMX3R?=
 =?us-ascii?Q?XNN1nEuOlV9Vp/3x+qvZbE6e/ZlB+gggkahe09DQ7djx1y1bMKLEWaJPUQyk?=
 =?us-ascii?Q?lJQv/J8Pq5K7sTObkPLFQFyXLog0JfSwJX5YPbdXzO0mBOV94tW0qWjkupHI?=
 =?us-ascii?Q?JuM4VI8umq1M6mHWIQ8gOurXZATQXfI2BJxmCuaI8sF7yyHDYd6nLLjBvTUO?=
 =?us-ascii?Q?GRmXVF9JDgIK0RW8+td1lC1L9UWpTDoEBfeDpZW7ELoglaoieXo6S//GEK88?=
 =?us-ascii?Q?R+PtSZNoPSuh5+xYeE/OMy94jWOVpDHzc7cFrEPBdMQZAHIkzDvf1iQGvo7n?=
 =?us-ascii?Q?iou2LODsLFvmhjDheG+uWvZ7EBx2d9hIe/fS6RTBt+KEGB6vXzA4v4ykmusR?=
 =?us-ascii?Q?RJs/C/9jnOF7P0xdpU9WXR5p7x54QpFr06OskLIp6rJMHf+D/4kY4hxG/EAg?=
 =?us-ascii?Q?8qCoBX7sO0rIHkfrVuUnUzVhlajpeaS4NKkAC0MRDkJHKSYwx2U7WMmAxKKt?=
 =?us-ascii?Q?TDSU4cxzakGib1I5VeNu10ABpz/ivaFOWs+EBFmfKdUx3ZSZJ1U2bsDwc38I?=
 =?us-ascii?Q?iuB51WeEs/YBZw76QSW/VUo+0zq/4I63N74c00SIyz6Jzsu1aQaeODUO76He?=
 =?us-ascii?Q?DdS+2Lp2G9AiAkEMkEWdWyiFNBXlfEfIqNqIZC5LbX8VXwmetJNX2Y1+/xJ5?=
 =?us-ascii?Q?wjxB4wpSQb120uLCNBH5Mo8/rR9G/XBdUJzv9XAzgu5/JoF4fxi6dMuiAJea?=
 =?us-ascii?Q?YLWW8o5UKIg4ZZ5jjxAU/Dk94AfQIPdXP9KB8wQ1HvOdR4kDShja69M5RAOl?=
 =?us-ascii?Q?tHbqD+g3Y+dDLt5dTUmGh7u1kyRGGaxvREpdLDe9ACNnTbnAHYtmFJavJEap?=
 =?us-ascii?Q?gw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	r+gKAC7lElQdVy/HNZ2Wey1g9xYsVWVUERxEkHlPA0kraOfCVs+w/ktLPjxywmpIkaSsOxbJ3iRY3PbBbSSLqYVcrKKLlPCKqReClF8ZZUBYrLzvBqsWPgwsX/66t/XuNS1pup4LIhsEudlqYOlRb88XNnpna6nw/wOrN58OuhtFHN5rLy87GpC6kGwg5+6QpuMiNLbhCY5VSb+2TVAIuslbPTGccnnzVrAbEePmphzY+hrHY1Rw0rj8NQ/vceOgy2BkoJ2gLcVUBV97wG28kCzySBsvhV/O6Tmojidv2ER14TAvOMUpkavQQoinTeiqzOWY/C0Yx0b98qRpE2gPHE03STHYs9Jph+C1mRRKOSJkKAIQE0RNFOO+FoTBovZHaquCzvRyX2xdXoHJ9G4DKjPyHEMLuG+xlne6jY57IkdTWOUyCPg9BFFkrAzxE3YLQHWbyDLByo1lhC7/9Sb4Eun/9hC8iW1TVdXL7c+ohqVgwqtV92uyepj9CqhoxJ7EEJq38UByjcib84NPhV4CEOujuY1/Dq1DlOjkiCHaL5HEAtRn+8udEmfFTGBWNakiwPkS+F5JKaRkXBbe57iIBSKoTYFLb/F9X2bIR3FMZus=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 85979c94-7f31-42a5-1656-08dcf3d58530
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4769.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2024 02:42:36.9008
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: d0Mh12YnPEhl6SkZwEXjSkC/0GpYrH6u8hgWgRqnJO7me/MFsIRBOvsK7IsZ9wqtB9NbLR1g0dE3rwCg99bMrRBQzxw2fsiYKToMGUmVafE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR10MB8093
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-24_02,2024-10-23_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 adultscore=0
 mlxlogscore=999 mlxscore=0 bulkscore=0 spamscore=0 phishscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2409260000 definitions=main-2410240018
X-Proofpoint-GUID: mGYbJ9eAf9s54cNLXbXZzeyvqofI1EBN
X-Proofpoint-ORIG-GUID: mGYbJ9eAf9s54cNLXbXZzeyvqofI1EBN

On Thu, Aug 29, 2024 at 01:25:47AM -0400, eugene.loh@oracle.com wrote:
> From: Eugene Loh <eugene.loh@oracle.com>
> 
> An underlying probe could support all sorts of overlying probes:
>   - pid entry
>   - pid return
>   - pid offset
>   - USDT
>   - USDT is-enabled
> 
> The overlying probes belonging to an underlying probe match the
> underlying probe -- except possibly in pid.  So, an underlying
> probe loops over its overlying probes, looking for a pid match.
> 
> The trampoline would look for only one match.
> 
> However, more than one overlying probe might match.  Therefore,
> change the loop to keep going even after a match has been found.
> 
> Incidentally, it is actually only pid offset probes that could
> "collide" with any other overlying probes for a given pid:
> 
> -)  pid return probes are implemented with uretprobes
>     and so cannot "collide" with any other probes
> 
> -)  no two USDT probes -- is-enabled or not -- can map
>     to the same underlying probe for any pid
> 
> -)  no USDT probe -- is-enabled or not -- can map to
>     to the same underlying probe as a pid entry
> 
> So, possibly one could optimize the trampoline -- e.g., by adding
> BPF code to exit once two matches have been made.
> 
> Incidentally, there is a small error in the patch.  The flag we
> pass in to dt_cg_tramp_copy_args_from_regs() should depend on
> whether the overlying probe is a pid or USDT probe.  We used to
> check PP_IS_FUNCALL, the upp could be for both.  Instead of
> fixing this problem, let us simply pretend it's a pid probe --
> a later patch will move USDT probes to a different mechanism anyhow.

I think it is more clear to just keep the logic that is there for passing the
flag, even if it is not exactly correct.  At least it is not a change from
something that might be wrong to something that is more likely to be wrong.
Either way, you are changing it in a subsequent patch so the change to a
hardcoded 1 is not really helping anything other than making someone perhaps
wonder why you changed it.

Alternatively, you could perhaps change the check for the PP_IS_FUNCALL flag
to checking the prp->prov->impl, and selecting 1 for dt_pid and 0 for dt_usdt?
Yes, you will change that in the subsequent patch, but it would be actually
fixing this to be the correct condition anyway, right?

Summary, wrong -> different-wrong seems silly, wrong -> wrong (keeping it
the same) is reasonable, wrong -> correct is of course preferred.

> 
> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
> ---
>  libdtrace/dt_prov_uprobe.c          |  53 +++++-------
>  test/unittest/pid/tst.entry_off0.sh | 125 ++++++++++++++++++++++++++++
>  2 files changed, 147 insertions(+), 31 deletions(-)
>  create mode 100755 test/unittest/pid/tst.entry_off0.sh
> 
> diff --git a/libdtrace/dt_prov_uprobe.c b/libdtrace/dt_prov_uprobe.c
> index 70e5c32d..bc5545fb 100644
> --- a/libdtrace/dt_prov_uprobe.c
> +++ b/libdtrace/dt_prov_uprobe.c
> @@ -687,45 +687,23 @@ static int trampoline(dt_pcb_t *pcb, uint_t exitlbl)
>  	const list_probe_t	*pop;
>  	uint_t			lbl_exit = pcb->pcb_exitlbl;
>  
> -	dt_cg_tramp_prologue(pcb);
> +	dt_cg_tramp_prologue(pcb);                             // call this only once... is PRID set/relocated correctly?

I do not believe this change is needed (adding the comment).  A trampoline can
only ever have a single prologue.

>  
>  	/*
>  	 * After the dt_cg_tramp_prologue() call, we have:
>  	 *				//     (%r7 = dctx->mst)
>  	 *				//     (%r8 = dctx->ctx)
>  	 */
> -
> -	dt_cg_tramp_copy_regs(pcb);
> -	if (upp->flags & PP_IS_RETURN)
> -		dt_cg_tramp_copy_rval_from_regs(pcb);
> -	else
> -		dt_cg_tramp_copy_args_from_regs(pcb,
> -						!(upp->flags & PP_IS_FUNCALL));
> -
> -	/*
> -	 * Retrieve the PID of the process that caused the probe to fire.
> -	 */
> -	emit(dlp,  BPF_CALL_HELPER(BPF_FUNC_get_current_pid_tgid));
> -	emit(dlp,  BPF_ALU64_IMM(BPF_RSH, BPF_REG_0, 32));
> +	dt_cg_tramp_copy_regs(pcb);                            // call this only once for all clauses?
>  
>  	/*
> -	 * Generate a composite conditional clause:
> -	 *
> -	 *	if (pid == PID1) {
> -	 *		dctx->mst->prid = PRID1;
> -	 *		< any number of clause calls >
> -	 *		goto exit;
> -	 *	} else if (pid == PID2) {
> -	 *		dctx->mst->prid = PRID2;
> -	 *		< any number of clause calls >
> -	 *		goto exit;
> -	 *	} else if (pid == ...) {
> -	 *		< ... >
> -	 *	}
> +	 * Loop over overlying probes, calling clauses for those that match:
>  	 *
> -	 * It is valid and safe to use %r0 to hold the pid value because there
> -	 * are no assignments to %r0 possible in between the conditional
> -	 * statements.
> +	 *	for overlying probes (that match except possibly for pid)
> +	 *		if (pid matches) {
> +	 *			dctx->mst->prid = PRID1;
> +	 *			< any number of clause calls >
> +	 *		}
>  	 */
>  	for (pop = dt_list_next(&upp->probes); pop != NULL;
>  	     pop = dt_list_next(pop)) {
> @@ -740,6 +718,20 @@ static int trampoline(dt_pcb_t *pcb, uint_t exitlbl)
>  		idp = dt_dlib_add_probe_var(pcb->pcb_hdl, prp);
>  		assert(idp != NULL);
>  
> +		/*
> +		 * Register copies.  FIXME:  What can be optimized?
> +		 */

I would drop the FIXME.  There is not really much of anything that can be
optimized because we need the register content in case some clause makes use
of regs[].  And arguments need to be copied for argN and args[], unless we
want to implement arg-access using a provider callback during CG, and that
would be an optimization across all providers so definitely not something for
now.  So, no need to have a FIXME.  It's biger than USDT :)

> +		if (upp->flags & PP_IS_RETURN)
> +			dt_cg_tramp_copy_rval_from_regs(pcb);
> +		else
> +			dt_cg_tramp_copy_args_from_regs(pcb, 1);

Per my comment above, I think this should still retain the code that was here
before (well, higher up) to select the correct flag to pass rather than just
hardcoding it as 1 and mentioning it is a bug.  It is easy enough to just keep
what was there as logic, and then change that in a subsequent patch.

Using (prp->prov->impl == &dt_pid ? 1 : 0) would do the trick, right?

> +
> +		/*
> +		 * Retrieve the PID of the process that caused the probe to fire.
> +		 */
> +		emit(dlp,  BPF_CALL_HELPER(BPF_FUNC_get_current_pid_tgid));
> +		emit(dlp,  BPF_ALU64_IMM(BPF_RSH, BPF_REG_0, 32));

Wouldn't it be better to retrieve the PID once, and store it in %r6, and then
use it at every branch rather than retrieving the PID for every case?

> +
>  		/*
>  		 * Check whether this pid-provider probe serves the current
>  		 * process, and emit a sequence of clauses for it when it does.
> @@ -747,7 +739,6 @@ static int trampoline(dt_pcb_t *pcb, uint_t exitlbl)
>  		emit(dlp,  BPF_BRANCH_IMM(BPF_JNE, BPF_REG_0, pid, lbl_next));
>  		emite(dlp, BPF_STORE_IMM(BPF_W, BPF_REG_7, DMST_PRID, prp->desc->id), idp);
>  		dt_cg_tramp_call_clauses(pcb, prp, DT_ACTIVITY_ACTIVE);
> -		emit(dlp,  BPF_JUMP(lbl_exit));
>  		emitl(dlp, lbl_next,
>  			   BPF_NOP());
>  	}
> diff --git a/test/unittest/pid/tst.entry_off0.sh b/test/unittest/pid/tst.entry_off0.sh
> new file mode 100755
> index 00000000..f1a75b6a
> --- /dev/null
> +++ b/test/unittest/pid/tst.entry_off0.sh
> @@ -0,0 +1,125 @@
> +#!/bin/bash
> +#
> +# Oracle Linux DTrace.
> +# Copyright (c) 2024, Oracle and/or its affiliates. All rights reserved.
> +# Licensed under the Universal Permissive License v 1.0 as shown at
> +# http://oss.oracle.com/licenses/upl.
> +#
> +
> +dtrace=$1
> +
> +trig=`pwd`/test/triggers/ustack-tst-basic
> +
> +DIRNAME="$tmpdir/enter_off0.$$.$RANDOM"
> +mkdir -p $DIRNAME
> +cd $DIRNAME
> +
> +# Run DTrace, dumping all probe functions and names, plus PC, in a.out.
> +
> +$dtrace $dt_flags -c $trig -n '
> +pid$target:a.out::
> +{
> +	@[probefunc, probename, uregs[R_PC]] = count();
> +}
> +
> +profile:::tick-1s
> +{
> +	exit(0);
> +}' > D.out
> +if [ $? -ne 0 ]; then
> +	echo ERROR: dtrace
> +	cat D.out
> +	exit 1
> +fi
> +
> +# Generate the expected list of functions for our trigger program.
> +
> +echo main > expected.tmp
> +echo mycallee >> expected.tmp
> +for x in 0 1 2 3 4 5 6 7 8 9 \
> +         a b c d e f g h i j k l m n o p q r s t u v w x y z \
> +         A B C D E F G H I J K L M N O P Q R S T U V W X Y Z; do
> +    echo myfunc_$x >> expected.tmp
> +done
> +sort expected.tmp > expected.txt
> +
> +# Check output for probe name "0" or "entry".
> +
> +awk '$2 == "0" || $2 == "entry"' D.out | awk '
> +{
> +	fun = $1;
> +	prb = $2;
> +	PC = $3;
> +	cnt = $4;
> +}
> +
> +# Check that the count is 1.
> +cnt != 1 {
> +	print "ERROR: count is not 1";
> +	print;
> +	exit(1);
> +}
> +
> +# Check that we have not gotten the same (fun,prb) already.
> +prb == "0" && fun in PC0 {
> +	print "ERROR: already have offset 0 for this func";
> +	print;
> +	exit(1);
> +}
> +prb == "entry" && fun in PCentry {
> +	print "ERROR: already have entry for this func";
> +	print;
> +	exit(1);
> +}
> +
> +# Record the PC.
> +prb ==   "0"   { PC0[fun] = PC; }
> +prb == "entry" { PCentry[fun] = PC; }
> +
> +# Do final matchup.
> +END {
> +	# Walk functions for the offset-0 probes.
> +	for (fun in PC0) {
> +		# Make sure each offset-0 probe has a matching entry probe.
> +		if (!(fun in PCentry)) {
> +			print "ERROR: func", fun, "has offset-0 but no entry";
> +			exit(1);
> +		}
> +
> +		# Make sure the matching probes report the same PC.
> +		if (PC0[fun] != PCentry[fun]) {
> +			print "ERROR: func", fun, "has mismatching PCs for offset-0 and entry:", PC0[fun], PCentry[fun];
> +			exit(1);
> +		}
> +
> +		# Dump the function name and delete these entries.
> +		print fun;
> +		delete PC0[fun];
> +		delete PCentry[fun];
> +	}
> +
> +	# Check if there are any leftover entry probes.
> +	for (fun in PCentry) {
> +		print "ERROR: func", fun, "has entry but no offset-0";
> +		exit(1);
> +	}
> +}
> +' | sort > awk.out
> +
> +# Report any problems.
> +
> +if ! diff -q awk.out expected.txt; then
> +	echo ERROR: diff failure
> +	echo ==== function list
> +	cat awk.out
> +	echo ==== expected function list
> +	cat expected.txt
> +	echo ==== diff
> +	diff awk.out expected.txt
> +	echo ==== DTrace output
> +	cat D.out
> +	exit 1
> +fi
> +
> +echo success
> +exit 0
> -- 
> 2.43.5
> 
