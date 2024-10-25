Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1337679C8
	for <dtrace@lists.linux.dev>; Fri, 25 Oct 2024 02:22:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729822974; cv=fail; b=UPP4FWCY5Lg/P3SQBq2Nzr00LHM05jTf6NyleszwtsCkffyFpNFJRbz6hklzdaZHdWqFKYICXF/RGyLTnuLljNFYylSAUYvwZx9Cy6yvdJTRV/Kqd720gsua14R18NMptOIXAgqfZ8z/EnNIPhBdCQbbU5vpRh64bKRN6EW8Y7A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729822974; c=relaxed/simple;
	bh=btcbWONAR1gRfp3jScq2bBPYZvgfFGe9vojJERASAwA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=SCPh3a7Z1UZi36ooSaGzvMMoolXvtVIyATnhSbKjkK21mQODHJ7Rn34AwFE1jzq0tkfFuACGFQlVKnDH4usOw3hoC4PayHsEwmcmED1Ah92mfsmDlnWshG6wmpL/0Mb3DkjOeKqr4hicYltPV8AvuHDC8+7BBfX1h8SirJl0V1c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=g7dm2coN; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=TEYo67qG; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="g7dm2coN";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="TEYo67qG"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49OLMZuC021698;
	Fri, 25 Oct 2024 02:22:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=vbqVZkDOAssw4H+yn2
	8daeusv10aQa6KocPOM3MFqZQ=; b=g7dm2coNwe1kGIISqKr+35hYwyoeROcijh
	L/dWXd8ISVgpOGbKi5s/+zRc72L6Xl3L9uxDofAv06EFMYoYg4zXxHZhgDRkSSiI
	sBERBTHoC+WHc9D14cHbbtSOf5DeWkGXhVM5m+zuFKe0j1zLPiHT6lf7mL4joBUh
	xQ9s2GvMHD/9a6A6H29avyGEttiBp2vX0GpGQ1I5YZe3K2WN4ZM10M0iAj/X/rcl
	wjB7kg4il8ShAMElA9IQQ0AR7pe/CEnkB1Jt768PRZfpmM3M5VH/z/JJ5++0O20Z
	EHjXClFxo1unF2AGCxtGNlWWeA3SRYIxIhWLjQ41KZvrb6HCtHPw==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 42c55ekvx1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 25 Oct 2024 02:22:50 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 49P0PXiW030942;
	Fri, 25 Oct 2024 02:22:50 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2171.outbound.protection.outlook.com [104.47.57.171])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 42emh3rgah-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 25 Oct 2024 02:22:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aI95ppXfteSEOESyhb9R8BGn+k7+QYRQ089PdgcnJwrx/v23dzS5bHkU/jyqskKqZiGA/jpWRAPiYzr1hr9xmpKcE2viVIP5iFcoXUDok9vIYmjLyHPfgjd7itHQ4TW/rdZqxdzFjTLMvaloYA74IwcEiTnlHFfag5BCF1hqO1Zk0W1pi1H11Dph5IsSwze/5R/7UwQzyudUVuMxPat+EeUERbTgpeBhdUO3Wg8lQeHA8P+79B2sXBAZXSSWQRrtAuBR5GRxGxoXZev7SM3qzhdGv9SA1lFmYJ4YZFjreobsdy6w6oQC8hmAoVMqAR4Dj0dopcua8Vdtw4sCqBKzvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vbqVZkDOAssw4H+yn28daeusv10aQa6KocPOM3MFqZQ=;
 b=ogtNE/c2nSA4+Ir1cDe7c3MskEpb2mwd5uS9bebhQw9hNFgN6tQS+tnXe904MRmgxe3R6oi4liFeg/euHHBIhSWWrvX54VwbIVBxJcfiT/Wh1prH3JHmMc4WiIE+Iai3ohpoHTpCpfIwc/SnebZwn9bB4a8J0Q48wdtnPbX9fBIyy7Urg4UpVJ3cDU0VxvK2ZiA4s+58mvFv9iIfjGyksvqfkekbIPrg7fLr1DU+5fpmyYE0+mwWRUFneR4OyBDkbV8fUEJ5IL70hBDvoan5vntHYJkm0tRdmpSB54t2h4gwfu7MxXasE+gcNUAEKnfwYjElV4FmUzMx7qkIj+QtZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vbqVZkDOAssw4H+yn28daeusv10aQa6KocPOM3MFqZQ=;
 b=TEYo67qGPtmFCc7Di5y1RgXhQQmm/kLnyjeq21R0x1ar9JEwEMA4pUHvGjcJwwLk1Fnn8DXUIFkiPzAjdncyrQ0mBfRULqtWJE94dc3H/2SyUSDNrvGdjbc2UB1u6Lrn5i2iBeb/acBlc07yS1ZNclVxK5Kdsp8Du9M3R2XEtO4=
Received: from CO1PR10MB4769.namprd10.prod.outlook.com (2603:10b6:303:98::16)
 by SJ0PR10MB5552.namprd10.prod.outlook.com (2603:10b6:a03:3da::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.21; Fri, 25 Oct
 2024 02:22:47 +0000
Received: from CO1PR10MB4769.namprd10.prod.outlook.com
 ([fe80::6801:f7c:753b:5a82]) by CO1PR10MB4769.namprd10.prod.outlook.com
 ([fe80::6801:f7c:753b:5a82%6]) with mapi id 15.20.8093.018; Fri, 25 Oct 2024
 02:22:47 +0000
Date: Thu, 24 Oct 2024 22:22:45 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Nick Alcock <nick.alcock@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com, sam@gentoo.org
Subject: Re: [PATCH 02/14] pkgconfig: drop spaces in variable decls
Message-ID: <ZxsA9ee8F2-cJ4yY@kvh-deb-bpf.us.oracle.com>
References: <20241024113758.182050-1-nick.alcock@oracle.com>
 <20241024113758.182050-3-nick.alcock@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241024113758.182050-3-nick.alcock@oracle.com>
X-ClientProxiedBy: BY5PR03CA0029.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::39) To CO1PR10MB4769.namprd10.prod.outlook.com
 (2603:10b6:303:98::16)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR10MB4769:EE_|SJ0PR10MB5552:EE_
X-MS-Office365-Filtering-Correlation-Id: 30cd2d43-cb82-4d92-425a-08dcf49bea62
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?xzS1OCfjlfTYccPNTsC1KP9rWmr5DHuB7orRkYw1ZEhADtpnm96vyYQYpBMx?=
 =?us-ascii?Q?5QqUWYTURIF+3To6CZS/zDdH8kzoBGFlG9t94kTkPxDa8PCG0FGtErw6Ybd/?=
 =?us-ascii?Q?i7TDEKslu3kFfy9nCPVs7pwMkfhPgpqKThmUtYS+CF1eng5Pp8DPJ9M/aeQr?=
 =?us-ascii?Q?VOoimmtlIkNVK+fQi7J+19phHaJjhhnw/yvKbtXlnH5Dx2RMhPAGi/R4ApY5?=
 =?us-ascii?Q?ML/gAnxV0v0YUoees0OPmZ+hE15J1zklBBhRP+aE+Gnn2eKRkR/2SapA/cgd?=
 =?us-ascii?Q?ND7BonQZyGkBUrVp/QTis4CxcGv8rVGqy/TKtKWB+kF+WgSG09PkNLRgU8Ob?=
 =?us-ascii?Q?x34MEE3yQ/WqsBkEW7ySW2iEF4v9pSbtUFwxpaawb5fDC2ZxBRRD0w+tdd9o?=
 =?us-ascii?Q?or4PivnQMyt4Zm93Iw4nnROTn4uPlB+mx7GhQlySd/5KOLvjI+46Gjhmr77Y?=
 =?us-ascii?Q?mZsVsnv1vkLEoVREPkK9Z90e54wc57pv1Caoqd9AJSBOyjsiqOleL/2zZHHU?=
 =?us-ascii?Q?uk+NBNEVjYe17xI3jB9IQgshbTmCMQGkwbj7jEQizmP2wf3c/Yj6SEbvQQbI?=
 =?us-ascii?Q?2A2WuBkTniMPvjWmd4LK8648PFpsz6sNQaDBsFJQ9B73904plfx0L9kjsUFU?=
 =?us-ascii?Q?pFX0U5tm1Tzyz2BojHSaQNvTT1MdY1hxchxg0GraP70taPNxx5ZcjqBAJLcg?=
 =?us-ascii?Q?S/yJHBWZq0jtk0ojy9zYzEllhM2OiuDHx7mKuKgRkxgShJxISX1QJj1fAb2J?=
 =?us-ascii?Q?T09MzzeUyJIamV3G7FNjsy36mqytGuiMdSTlWC2O2NyS2oAoFJ85GOV6zjmS?=
 =?us-ascii?Q?8fulOrU4HdPiFhbAVoQkMo0MPk7DX19f9sCuqDK98Hd9jJKnI5YtF5D6N4xH?=
 =?us-ascii?Q?iY7bPuQ4uZ9VuHYdQILMndjklVAEno10lWozCoj826RCwT3iXP49PSca4xWK?=
 =?us-ascii?Q?UMvjIE+PnNA1K11tEy3DSdcT393nrahU/gIapK+qP6RG3MeVMYy8A7ijNLtb?=
 =?us-ascii?Q?VCF4V/zctoZBY7FuL7QIbG8umK6lmCHRbNUw77dEZoWr+6xSGAjxKnQqYkvj?=
 =?us-ascii?Q?ut//K6Q79UajKhjv8PwwMGDKevU+StyIEGSqdYL30Z3qqZ3ZK8VVwrr31vme?=
 =?us-ascii?Q?xEojdh2umcN4256X56hNcbPB/tl8XXA2trCWZflqH6+lpyusq/j/b4nUsR++?=
 =?us-ascii?Q?JBkN/Tg/tWurkoWTFPKy/XmcgHLwB0gfasvLVEaY3Y1kJiz7Q1l7WOylqzqE?=
 =?us-ascii?Q?UDNQNpgYUetdmTeoqKU8?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR10MB4769.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?qu4HB0SEWkWJKXu0CsgaI8e23DvHqD5TCBqpXE+83xpFvywCn/LDaaf7WwsF?=
 =?us-ascii?Q?yu6Yb62wRk3eZSen41Ok4k1WwoVzHbHiYewDTfdaAkSvB3Ke3iL5CZHeOlkE?=
 =?us-ascii?Q?1sy+57/4YxFER8gXnrrcM5iDoBA3EYRk/1tYfOUkcykUO7Zw8LZPppphu1tm?=
 =?us-ascii?Q?QPlrpUTa/fWy7mstrdT+BHHzVglmz8gXDAqZ1e+HiKsx/RNnowTsGVJj+Yei?=
 =?us-ascii?Q?vJcc+HoJ5ABDajIe+UPjynhVQU4ZhP3YzMBgPEwa+SsSj5kaTOTLzCiclGI1?=
 =?us-ascii?Q?B1u+UMKkQqB+m2TbKiNLRAYYhdBHxY2DNWLiW1OhIkLuZqFamwKfPTKZhJn/?=
 =?us-ascii?Q?+FEZafIEQkSt0eDon08k4D3QLH9G4YntgQSJ6RHFO7HVr8wBZOTof1kiVInB?=
 =?us-ascii?Q?M/uDqDbfMinTisEY+9sqspVDaotrfw68WMW4r9ZkKsL7ziZbwdneYA5MwxNf?=
 =?us-ascii?Q?HKAMw7zoUMjeTfqaicMqlqjTpSW/Z8Umqw61lg43YMTvZ0+q56EmmIZVZgy8?=
 =?us-ascii?Q?ImtlN7cN6pnexUJujyP23aUxXvZfAVxPhHgr77nEx6f1vbSpwzki016NEYPq?=
 =?us-ascii?Q?ac+otT+18+wwkrGRBe/Ns2tSDMObN5rWOLIs6esrihgNj+2FGNhOiJrqaFTB?=
 =?us-ascii?Q?R5bP6/ACMX16PeCCAlSnlwon7HfNlBJPf4NH/NFSAt4drSMO3kCSH2khrIfd?=
 =?us-ascii?Q?AQMr4qpUf8B/yaPuTimJS04nK5TpJOoNUCjz1Hbsruhq/j8WoW84WMgLRQ3L?=
 =?us-ascii?Q?5KvJVNEfJL2CYOxe8IFeeUdiHhtD62m018NF2MPWWiG09KRY7h+NREfONzMX?=
 =?us-ascii?Q?rq+CMguOLMOjrAfj54LD0FlZRR1XpsvDkA78ggQQF/8nJzLBT+AXRlafq0kT?=
 =?us-ascii?Q?PwO+MYPbj+tcN68n+D/nnuM4RGVtIrsgztpNc9nDjiz4YuKWvPv1++WBaAqt?=
 =?us-ascii?Q?W14yPOh0aNbj70Yd5H4/yZ5x656eMkqFOeNnAkUcgSru5N/WeIUkmpbFavMT?=
 =?us-ascii?Q?OedghzwIiGURT4Cjyk1okGpWSP8+W1j5LwBlD4x0h+i+pynWrUUqNpGyQnVI?=
 =?us-ascii?Q?lT/kWKOB1Eam9uWDnLM8G+4jIxUrP2W1e9nehOsCGT6ex7Vzcg3o1Gb5Ntfr?=
 =?us-ascii?Q?cdz1tfyqVwvudHH9frdR08GvLjaQe25bhjFqxdGz+fEgGh1uXVW5kcndkpjQ?=
 =?us-ascii?Q?MNmDMd6FeHO+NqroAxcvjn9zaxc1sRe9rIqEWVSkSdxGQNPRmg4wdOKVHJw7?=
 =?us-ascii?Q?v5YwjbdDiXjJQzKbC+YExT8f//4H0tZ+h3b7p+S3FzO9JrzfXf0Z/YNLLr9W?=
 =?us-ascii?Q?9v/DLaQRz5YdcFOvqIhuUjmxK2va5qruRusRzwOZ5yzJlkf8sn6mj8pQBtM9?=
 =?us-ascii?Q?A0DXRqhPzopOvYbDvOpM8N64CqX9uUakFzMm+RtFXYHVN1RuYBwPU7j5I6qm?=
 =?us-ascii?Q?0kN9PUbD8iTio98XBKIenE/2T21Gb+QeEWPSKkhD+SUWCcXJ9rYzs4JhvLny?=
 =?us-ascii?Q?1GrQgvjqqIQjiL3uOCgxJqLQD2UndEbBvH/jLU5u+8miNrTLH4xARmVwHfd8?=
 =?us-ascii?Q?UyOHf+HfWrsEWbv4XCd4v3Z15pvTjdfNi3Bw4+F2XMinJbPGOJ3pwtG194ly?=
 =?us-ascii?Q?5Q=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	JrChz4y/ifgDNpjc9Qhyu64+PocbqBXKamwiXBddEIbsqMskslZti8eo0Nx+/4w07R72I+AU5OsaUwlIBpR0s/sNWu0e2USzmbGnt81vvtQboAWzl9S5iOGugf6Gqwb4kMMuEeH9WtU4wYA4NgwIBmTbl4NMLSXAvgP07aIfHG5wt4KFJPoI80qh+/KqpvjvikrNsLChqN6SRLS3EVIOWEJnWEHwm2sDpHWvmB2cPOn64kitUJJGoL4JSAI3jdh+ic9dOB3lHtPoHuLMCKiT82YxAW/T8mKRBoOGOxy7wb+G6qxt2BHEGT6XozPvbmxun2jMAq2zm3kWEBWp893QwqgSu2F7sRZq1q6mOd/gGlUEtXZvIkuol2bBuGiJRX1aq6s1FPhnEgxNA7r5rjlXzjZxPzAwUdnNObcSEXF0uDtAELpGNwkMW0exN1Xc7Kjlu1oNz1NfW+V8pe+OYHzr2Lj3qmiwPFn/9cXKJs9no6QU4LUEQ72HKeUfTvXoylE86vaQK8Bh9FSHaKUTJgE7eDXK4jmIXtrzujiNJxHrPnhbE56CYtCNs7AlNC+ArdZSHwNoevV4ulXaHu4NVDg3V9aUa69wQ7m0eW0dZ9bdaWg=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 30cd2d43-cb82-4d92-425a-08dcf49bea62
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4769.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2024 02:22:47.0103
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u5eG/UWcVKvfSAUb9ghi+LNu1bFXAPjWc1H2zuLsdn9a1jp/ohM31Z3zOyaWadNCoDSOQgggHQaWKpFtq2ciJg5YYykBZ/s8TZGxMRVAsC4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB5552
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-25_01,2024-10-24_02,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 mlxlogscore=999
 phishscore=0 suspectscore=0 mlxscore=0 spamscore=0 bulkscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2409260000 definitions=main-2410250017
X-Proofpoint-ORIG-GUID: u1_1PdYMAAHwINZ5BH-CiQNbPOc2_dmh
X-Proofpoint-GUID: u1_1PdYMAAHwINZ5BH-CiQNbPOc2_dmh

On Thu, Oct 24, 2024 at 12:37:46PM +0100, Nick Alcock wrote:
> The requirement to have variable declarations with no spaces in them is not
> documented, nor does pkg-config seem to care, but most pkg-config scripts in
> the wild conform to it and pkgconf --validate complains.
> 
> (pkgconf --validate may also complain about the Version lines. This is a bug
> in pkgconf, <https://todo.sr.ht/~kaniini/pkgconf/15>, and should be
> ignored.)
> 
> Signed-off-by: Nick Alcock <nick.alcock@oracle.com>
> Bug: https://github.com/oracle/dtrace-utils/issues/105

Move Bug before Signed-off-by, for clarity and consistency?

Reviewed-by: Kris Van Hees <kris.van.hees@oracle.com>

> ---
>  uts/dtrace.pc.in     | 6 +++---
>  uts/dtrace_sdt.pc.in | 4 ++--
>  2 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/uts/dtrace.pc.in b/uts/dtrace.pc.in
> index 9977082c5a7c..fda6f755166d 100644
> --- a/uts/dtrace.pc.in
> +++ b/uts/dtrace.pc.in
> @@ -1,6 +1,6 @@
> -includedir = @INCLUDEDIR@
> -libdir = @LIBDIR@
> -dtrace = @DTRACE@
> +includedir=@INCLUDEDIR@
> +libdir=@LIBDIR@
> +dtrace=@DTRACE@
>  
>  Name: DTrace
>  Description: DTrace consumer headers
> diff --git a/uts/dtrace_sdt.pc.in b/uts/dtrace_sdt.pc.in
> index 32474bc3f75d..90977661b761 100644
> --- a/uts/dtrace_sdt.pc.in
> +++ b/uts/dtrace_sdt.pc.in
> @@ -1,5 +1,5 @@
> -sdtincludedir = @SDTINCLUDEDIR@
> -dtrace = @DTRACE@
> +sdtincludedir=@SDTINCLUDEDIR@
> +dtrace=@DTRACE@
>  
>  Name: DTrace SDT
>  Description: DTrace raw SDT headers
> -- 
> 2.46.0.278.g36e3a12567
> 
