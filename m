Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 329C3DDA6
	for <dtrace@lists.linux.dev>; Thu, 29 Aug 2024 05:23:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724908998; cv=fail; b=ddEqDBwpj72l67Ybs5Ru+OkbByJ3rxU/njjADslnAZ4GaILa61gaEJES9eM+tfFUi2p4C43Cdt0zmAadFMubSCJb3NREPstbOm7wt8pSwO1Gii80aQOP2QQxBGugIora5ROW1DvBR2IsHAW6no2xQjSubFjzPfHu/fddAt1Iwhg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724908998; c=relaxed/simple;
	bh=AnwgcqpvSlqIhUUNV0fXEKyP/X982vOTQe34Rh0dQhk=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=e06GZh9ueyn92+x7iu8ibydiQBwxAQMd3twwmfVNLUiQI+nNi4l3odlSRpi+JOKMWQvjbJgFzeuTRqvUES8LhWiMotNAg9b/vccKPUoph4blE2mAYJnWOtHyux6X0kN2hkD95/x+nFyrC1+6kSGnbrxYt04Hh2ZgN6AtVy+aROU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=WC6JaJ7/; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=w18lmH04; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="WC6JaJ7/";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="w18lmH04"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47T1fwf2028916
	for <dtrace@lists.linux.dev>; Thu, 29 Aug 2024 05:23:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	from:to:subject:date:message-id:in-reply-to:references
	:content-type:mime-version; s=corp-2023-11-20; bh=RrXyg8OHXNYEe6
	y7uUFLxpepveiqj1C7KHDAuo2/bKM=; b=WC6JaJ7/nx5wASJaOYt6ln/Mudc3qt
	ipYP44TC4+u4Ia94SBDlIYM430c2kln/OSP+ONGZvrELZmmaLybFXNhtRL/VQgpO
	ZqTAkN8OW4S3ABSKw+Ins4t0CSpfrVR7gMaMTwFSk7IbT8kvpANT9Igsj6bbqIy7
	hZ+moDt3hnzfKen9OjQA8p3PMFR+Enj0guXGZtYhS4RHVNy4N+2V5IFq/kIwVLzL
	LvkVsgwBAvyuWhf/hbwkDStrn9MBK6iXgaHxkVeOP5AESj48PXNq3n2JJkrgvF51
	vXT74RI843g5XJh8hcme4HeT+rAurVSadt1dme3Ph5pdJQl107Pn2TVg==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 419pwv39m9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 29 Aug 2024 05:23:15 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 47T42U4i016697
	for <dtrace@lists.linux.dev>; Thu, 29 Aug 2024 05:23:14 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2101.outbound.protection.outlook.com [104.47.58.101])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 418a5ungne-3
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 29 Aug 2024 05:23:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zIik9N+vv9PbokFi0sUDx84/L+/rEbVh5rNhRQ5jl7rJD1O6aPpy9eFDgEn2jpQ1rA5ya5gN+ph1n1tO1bv8WJgR+lcuGJC6MuOCxSjp3gKpAWJdXk3awB7/NfRO1Rq/8mpuh30pg1qaZjWNWBqwub7ShVf6aGGTHZrerQxC3s9xbVEI1T2P9ydYBExFtyyZoTaC19GZVmuu002HWKC/A6NKKih/GEaEGgnGfd7g2WBTfbcIMfgToXhDg+xFfbSr35BqRiggxje8fh1ZzILZ6J7uiUF58WEYkbgmg/f0iVvoBLiMu2xVjVGwZvBgSfSTCKHt5VRF+ShaacgtgdMqiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RrXyg8OHXNYEe6y7uUFLxpepveiqj1C7KHDAuo2/bKM=;
 b=GHYCfM4vEEIXFDBMhiY2WdFUnjQwV0BTg9EKQrVrn5haZr7aFa8dIwFqmxAfFTEzAgR67R1ihfJBFZ7wbcMexKtYALNILDlvUOz7I/m4hZaCWNGeIVKwXR9PnZQabGU3UEw8M7OTjmUwRfDO5v/8PtenkMlA0D3EFKyimqMdEFW2jRdFmJAZJlHDPkZBTeQM5avEksDTb07GCbNWWR5/Wskfc980DyVpzopKo6XtJFMxyJMUfGL4b0HH8vNsL/Bxwa7P/H4ry2yFMj64ZdAri/OYdAAJwaTHduLu/2Pl3HD8xHcD90CB7iYlzVr7QekAhIrgx2426YNMw7xSqWCRww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RrXyg8OHXNYEe6y7uUFLxpepveiqj1C7KHDAuo2/bKM=;
 b=w18lmH04byBvBQFX+munSI5VcOOIjeUmz0jSpakEOXO+DQzV1PtspPxkKsxtT+zRxPY0429/QeAYhFUHezeg1d07C8sAE9hV//+tEhav1PemjldIZYHRp5s2brTWpdlGZkYw9hSC9eo2l6ozwg3gpYTDx18AkZ6bVmL4U++tMCk=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by PH0PR10MB7008.namprd10.prod.outlook.com (2603:10b6:510:287::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.18; Thu, 29 Aug
 2024 05:23:05 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%3]) with mapi id 15.20.7918.017; Thu, 29 Aug 2024
 05:23:05 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 19/22] test: Fix tst.probestar.d trigger
Date: Thu, 29 Aug 2024 01:22:16 -0400
Message-Id: <20240829052219.3234-19-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
In-Reply-To: <20240829052219.3234-1-eugene.loh@oracle.com>
References: <20240829052219.3234-1-eugene.loh@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: BN0PR04CA0027.namprd04.prod.outlook.com
 (2603:10b6:408:ee::32) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|PH0PR10MB7008:EE_
X-MS-Office365-Filtering-Correlation-Id: 8d73f284-edd1-4b13-cf9f-08dcc7eaa92c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Xl87at0eNczsTvsu7MeSLTFO2MeX5HeuH7UNmCNs4Dy83WX8/zKlMyJX5cmX?=
 =?us-ascii?Q?qR6OwRWzYTfvp5/ZWX4xVpqsG3s+VWWSSMjd+yOJowW2OmwQKLQh9R1TUU6y?=
 =?us-ascii?Q?1pns4niQMMsYqq5G00RqToaREUJS7sLk3FC5paclq9aVkpSNWYi2quEwaauN?=
 =?us-ascii?Q?CrL8UcOkc1QyVCMxwcwUQpJv2lT8YEjacj/LYx+/UmePsAlFGkWrGT5OLRlY?=
 =?us-ascii?Q?DnMQYTSYy5xBjMC7/EubDze/0ez2yxrqmCxwa/yvTx7p1Q8W9F+tc+a8Lbwc?=
 =?us-ascii?Q?LNBaVW2q722Ydh1w23H3JUKYqtOOLkrTLcuqKrutsVQ7EXuZV0aSHn3iv9eX?=
 =?us-ascii?Q?HElvY+SxgqqBlnqvu8OFSigqDeETni6vQJcLDLxdTazMe9+1fmkIOOBCGBSv?=
 =?us-ascii?Q?KQGVsQycfpzINEpRy67KNoH35chiwU2iDM2bqc1OaGMw7S6/Ur2rS9Zhn2/3?=
 =?us-ascii?Q?pBZytV5CkYEaoxuEfCXJZBprMDUHq0xZROMJoajfSz7x+igmqotStS0hM8CT?=
 =?us-ascii?Q?Eok37QL4O4sxNAf3WJagy9xWNBEjexbtU45Wd4lHfRUuC5nGkE67/cMCa7bL?=
 =?us-ascii?Q?55p94XPXFKIaoNO1G03M8jFOOLS0g2JpuidTKwTqFz/zUooBdHVtheWI9D27?=
 =?us-ascii?Q?bqii87vRKzI25ulgbfs/EJz46uPgO8TS4DZyU2vuSEDTT1Hy/FiUKx/rJ56H?=
 =?us-ascii?Q?/c05i+iLHTtz5HAv2tvGlK1myFmFVKjEWr7UsvMuRM4eZnJoVJ7v0x3SpdPX?=
 =?us-ascii?Q?dxMKGtNC4wUQWDNZ8xP0cix7fOH3JEM7hJdD5DPQCxlqs9admw51pNOPiC2i?=
 =?us-ascii?Q?bASC5AJNp/lkIl0CjJODJ9HjfPrOx7exm18AytNt/PZzE60RPJAKyMUPn9Ax?=
 =?us-ascii?Q?SZz0O9BzRVPvjZPnLZIaUVnLzZQW57/1Uh7G1KL0LBB22+DwF7qMr6ut5aVY?=
 =?us-ascii?Q?YLGlRKbb4xZfy8j68EEI6oBbc2mWnQoTs3Zom0EpHEw1cl240flwEXDekcm4?=
 =?us-ascii?Q?iWzqWPgUnIx9ZB7XiC/1NB8lFWSfag5no1LRm3IcUzuZQrKpll0JrDtxCTpQ?=
 =?us-ascii?Q?Ij4yRC13u3QvncqMuDnYx/8WM462SvPbT2frEonZlgyhxfjgRQibaC9zaQq0?=
 =?us-ascii?Q?qgawr/4f9o0XZSqQMK3z8XUWSrZ09dp1jClSGmCCPoxYfKH0BvhJXGTz8O+S?=
 =?us-ascii?Q?rOlVltHrUa9+nEjHff93RiR8OOCL1snqdbjSLhqw5mvH3aj4Fp4RSKR7cxh8?=
 =?us-ascii?Q?tCWUDfpjQM4ev3ZigVa9dp3O3SYnI8bDpuhEXPE4K2vyWSGTxm6+zrx2QIyO?=
 =?us-ascii?Q?NMg=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?8/yCT/T/wuUOZlDtXT41iBlLv5CafkuWr4DL1+JRNOxk55eu5yPkRbRjGr6W?=
 =?us-ascii?Q?20Q2VeNCLgwivGTa4wzcN4pFUBi6CR8q9YhoXFV8CFou8nPj+gar3qZszrsf?=
 =?us-ascii?Q?fZTmQ6NtCRQi3ssjZOHqQ6KB6KsKI808+em05CzwHFqpQu8yBNHRxx0Lk5YH?=
 =?us-ascii?Q?2IVh2DjuucW8x2NzZNoBw8vQGVfEx1X+La8ZGhowSvwmPzKOqQCgcVRPkoWv?=
 =?us-ascii?Q?3zywcx0MzY6Gpke9xZCePk2W0Kv+N187BZzeICdxD9NTdkyGhd3ifPrGU/dH?=
 =?us-ascii?Q?FQFz2Rs7QcMTs1+b7sq5mHptI38fvrZHzrTwCrrYyjeHuidUtFrDyAtO8Qfo?=
 =?us-ascii?Q?+DwY9E1/ucHchRlr/4m3/rcQbOB9ifFs+AJBePQQ1NOlAGYr+WnrD+WT01le?=
 =?us-ascii?Q?7PWxwKYUPwdZeMubUqSRL8YgO7+8BCdrtDqJWuYpgDhCnDTBgk9/XdDDvBB5?=
 =?us-ascii?Q?UUSpMU9re8Fg2xOSoK01Gw5p0wxcxGieNAbmryqcYsBORYKJPODOtERotvJ7?=
 =?us-ascii?Q?RXPGxIIoe/x0//Q/chVeTZisWa684OIQTUSKQ3Z31JH+spJCSLB1I9ff7FAX?=
 =?us-ascii?Q?LhB54EogIG4L145e6BIiGG8yeJ8NKJK6O0wsrnRH5nCCxZueTl1uOsoAQlj4?=
 =?us-ascii?Q?PGIdAThzIMrL7H4p631U1BSFGtrjcW2IOHJum1wVfECyjS98m4oGbirRPVJa?=
 =?us-ascii?Q?KW0TlkM0Yq+FZ8i6BctuXFAaQ3PLpToKIw1CP8Ol7GcTSMaKlVJ0+ttdpwlW?=
 =?us-ascii?Q?8a8w8K/Ngu4M5vT7bWX5IExe7JNjRdm2Ml8nLeyX9yTJDepLcm/DyP/6cSC8?=
 =?us-ascii?Q?15kFHXyCT3aoKy8x/YtlFmKknf9aaXOz9qBMLRR2lvEJyuUKfs+N7qm2ZaGa?=
 =?us-ascii?Q?GoxbLQd+L8pzUJ+WBRBmixFJ3htPYs6TBcDAemIYMBZSrdRJ9i6vYi2lKNAP?=
 =?us-ascii?Q?79mTGhxLUAyIL1dmEDyf19oSXDP3Nt9gY+tl3dlYXM8kbo1Y923yYZHg7ZaO?=
 =?us-ascii?Q?tQrkmbDLMnCmum7jcrQiaIC+oASLY9pFK9rpeE8r4dz0LGmzUsLDtIPvhpMw?=
 =?us-ascii?Q?Y2ZER+p67zJpUEWTTb3dzWy2W96NHBOpCNX23FBkEfvX4PAzBBLWUBwy05b8?=
 =?us-ascii?Q?PSC5Cfw3PnULafvrLk7pU7n/OqHe/vM8CHlh7/YY6q7iiDT9F66jOsIFeiHM?=
 =?us-ascii?Q?hRcKE0mH4yR/HIvR3JjegVifXbQf41bA2uS+QQZ1EL8wOSsiI5UH90oH/Txi?=
 =?us-ascii?Q?N0Sd4+KyFNVWuv0TzJRjUbfigsA7fyoZFZvHtWDinTViRjWBDkGRiSQy2MG8?=
 =?us-ascii?Q?3a8A65uG9BZz9s9gZwxPr4A7mwxNxc1DuwAlycWQQKdXQfq1DGdVyHRxxrcD?=
 =?us-ascii?Q?xdEnVk+8cvlGgzY+671p0lbutM/OTPLyN5p5xIDunkkaoDwk1sBwGgu7xtgq?=
 =?us-ascii?Q?XOvutmZqpf7HMkAs3eSrEIdxmHVudem3Zsnwt1TJrSKxi7Bot1qa4nC647mn?=
 =?us-ascii?Q?sLZyRHPm2HD3Unbj/WGYioaazW0fV82uZc9poQM484JfsHcFX6RQRSWtodxW?=
 =?us-ascii?Q?pdswQA3ZyS5+C/XWJCoVm6+2o1684OQTiWHqGb4n?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	j84gQnSax3ZatYD3zpOMyIatb5vo38XsZoFSfLtcmBLnaiZvsth/1bs1nptxOj+mnd/TLmSx/aWTKvymZvpHxDC3qI79e2geodlUs0PhB6b7IcM7+fYUKzrvL/ecTI5SkggstTeUaBzr0qZbGGJW9MJojDVAoul0KyPNvi+6/tjRC7L9tynw9AkvP0OE1P2pcFccJTsNsrWWcAVHiUSZ4ll1gcNxmnZS2Efnai/Z1+6CzzH/KQojbg3EBMZCssaoXoFwwAo10aTT8qSHq+x9yWZLoOvnn6WhWQf0wPPEDS9ycQ3lxq0NMY1UWxW7qjh/DEMAfwhxD5wV9OF+hrvg1+Gdm325sQW0L259OOWa0GE5p+qBkzaRva+Nbn1I3fu4r1VeOC9P11j8b+tBRtv9/g4rdWUXntm2foJoSONOf/ju2STYmAFrP6zuEuNvO9qI7qdO+fUaJiee61Itf2J2qmub0L+TEvCgWdD2G/wMiK33f/Go84q1Vin/YD637YIaeuD7bykwPsgvAKJvQJ9desrZ3SuOhHhyPROFLI924dC0kWyRyLH1QeC3Z/zKCShp9A8DzeRJvpFX+1S9hHNTF/pCwCy+huJlGMPYpIXxqvU=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d73f284-edd1-4b13-cf9f-08dcc7eaa92c
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2024 05:23:05.7023
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qm1NRphZ9QAEk6DkSnZCEEqAleHjn80rbkF1YQ1r1nAAFnOf1g8GXDttfGH6nFRYu68AG75NEPc/t11+3tcHGQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB7008
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-29_02,2024-08-29_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 mlxscore=0 mlxlogscore=999
 phishscore=0 bulkscore=0 malwarescore=0 suspectscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2407110000
 definitions=main-2408290037
X-Proofpoint-GUID: 6mQcAbC8iCtkj3MoeOSjMCP8IlI7qVlF
X-Proofpoint-ORIG-GUID: 6mQcAbC8iCtkj3MoeOSjMCP8IlI7qVlF

From: Eugene Loh <eugene.loh@oracle.com>

This test was relying on a trigger that uses the obsolete
dt_test, even though dt_test is irrelevant to the test.

Use a different trigger.

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 test/unittest/probes/tst.probestar.d | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/test/unittest/probes/tst.probestar.d b/test/unittest/probes/tst.probestar.d
index dad7741e..b6da42e1 100644
--- a/test/unittest/probes/tst.probestar.d
+++ b/test/unittest/probes/tst.probestar.d
@@ -1,11 +1,11 @@
 /*
  * Oracle Linux DTrace.
- * Copyright (c) 2011, 2020, Oracle and/or its affiliates. All rights reserved.
+ * Copyright (c) 2011, 2024, Oracle and/or its affiliates. All rights reserved.
  * Licensed under the Universal Permissive License v 1.0 as shown at
  * http://oss.oracle.com/licenses/upl.
  */
-/* @@xfail: dtv2 */
-/* @@trigger: testprobe */
+/* @@trigger: readwholedir */
+/* FIXME */
 
 /*
  * ASSERTION:
@@ -16,7 +16,6 @@
  *
  */
 
-
 #pragma D option quiet
 
 int i;
-- 
2.43.5

