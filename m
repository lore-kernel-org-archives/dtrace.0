Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96FDA18DB1E
	for <dtrace@lists.linux.dev>; Tue, 15 Apr 2025 15:32:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744731169; cv=fail; b=nO3LLJZiAoKN6nkEMck0JnHkUPaegSrUEtq8ZTyKA8a0ML7crI732Tp8t3DuRWncn5mw8R/aXuoNiVvsNhZRVo4TodbBljVEXxit78DxZ7CKpwBmFmIAFDjRWmdynHPijNcj3xHfqvLHReksPhK4ECRkLtKYPzs+lio5zYEkFqI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744731169; c=relaxed/simple;
	bh=1BIUV+blhrQ1QV/WA4gq2x1c7OuT7TpW39DTP0tP5iU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=FNSOvh/wFVQqnET9V4oCYRd6uV8lSAtI/7Kv5+LmZxpS1wayz7/7Xd5Y+rjR6ZgSygiPie2dL6XzMI1gqObX+91OJSC+0trvOx2jk8IS5Bs3PPskCAZyNbYTS7XVrk7FLPL9MT1F9ls0NjiU0xUSs8c4f+FcYxdvIfhUOqia9X0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Han6TiIT; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=NaCzRw2a; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Han6TiIT";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="NaCzRw2a"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53FFMgtC011477
	for <dtrace@lists.linux.dev>; Tue, 15 Apr 2025 15:32:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=ZWAUNJ0tnjdIM1C9h3
	PKNBDHRRgds2O/9X6ieprUbys=; b=Han6TiITCe1oxxftDKY+xx0rHkcy9ZdhhW
	aavyUjEI17fsTXQbUgtVIlBi0lyNPF845NeuSpaDRnhQaBfuQun60RBLOqhE+jYQ
	LMbo1FZl1Y4+UI4CUilHJ3L0l3BuUImUM7/KgAMnrf7qQPKVPzH6PIquoxu425tD
	IZP0x6O6KRa7sWev6/jXGLsxu9WWFEoKMVq5noY4/jM2S7eizAzSwrOVeHcsyN+4
	CmbWSTqXicNdt1gGDsGsGf3wprJb6dNArgbG4KAfoWsTM1icee8zDpjwEdLDL0rW
	bOKMZgdqMHha8Es/Shf0FJHZ0tcE7mtp4ksRM+QdNBVrgLdsM3/g==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46187xsy1b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 15 Apr 2025 15:32:45 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 53FEQfc4008550
	for <dtrace@lists.linux.dev>; Tue, 15 Apr 2025 15:32:45 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2044.outbound.protection.outlook.com [104.47.55.44])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 460d2q93vx-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 15 Apr 2025 15:32:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YmRElzeIjtZXMcGoRT2HZ46WEdfUeQfRLMyw9sBMNO50mf9zz5wU7j5Q0JQxwzm0669xiL3xDisQcHe3zv8WyrMFDTPhKqqwbr7Ry9DpRZ9TQ+3cs/DVOAVMfmNG2w+rks4gYq20YqI7yE+ral5c2UmkVjI09z9JFrwp1D+3nX5RdJySvamOPcpXzBSTsFJhA4OmUMNaqshY06yxlWIkiqvo26sLrqGbolt/pEBKHQNhIWLekUyb/QTy6SuUr6rQmst63XNYeKefu403auy2m7q0/XRGrlJK/xPqd008dOfTcDZdBeetHK/sOPTZRQb+ha7JKsspK/8GdxDw4YjIoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZWAUNJ0tnjdIM1C9h3PKNBDHRRgds2O/9X6ieprUbys=;
 b=a4ofctQx3I6PKKKN6P0rhUQaK9i8IovpmyhGREwk+X79ICZ5i4QdD7FkikUI14swNq4u0llzB23YOl6g2kSkRJUbO+BnA1936dlzYSfWKSn+kFoh2lkZ3q06zJv62twbmT7dHkLyEu3rqx3xDNyKiDvx4PaaxF1zqFUYXC7OGD4wDwdzDJ0J36Nb9zwS8OBO9XPqETCJx1Ck03L9mqYpS/0OyMm9JHSquHaB5ZIMyCoC1PloCIzAGdAC0fx2m9sAc1oPZFliKnR7YJCV+f0uypj258nVtmjywwITuaNeFAY2c4wQmuZ/u7mwsuXe3K+B3Qt919uFYy7962u9g/6/pA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZWAUNJ0tnjdIM1C9h3PKNBDHRRgds2O/9X6ieprUbys=;
 b=NaCzRw2afT/x2lOzBgGb+8+PVsnV9t7/N7nenxJ99WIq6PvqBE40E7aBHxUnFfgyZVmaFFUA71j7Usf9WFXFcVdJ4o0HE/aXKhVk7HtywnOFeWXa+huZTlR2Re/q90WPbqkr9786FRl7jetVF9/rv6ycug2TNPwhtfGJ+PgXi8k=
Received: from PH8PR10MB6337.namprd10.prod.outlook.com (2603:10b6:510:1cc::10)
 by CH2PR10MB4262.namprd10.prod.outlook.com (2603:10b6:610:a5::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.35; Tue, 15 Apr
 2025 15:32:41 +0000
Received: from PH8PR10MB6337.namprd10.prod.outlook.com
 ([fe80::5aad:120e:fe7c:ea88]) by PH8PR10MB6337.namprd10.prod.outlook.com
 ([fe80::5aad:120e:fe7c:ea88%3]) with mapi id 15.20.8632.030; Tue, 15 Apr 2025
 15:32:41 +0000
Date: Tue, 15 Apr 2025 11:32:38 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: eugene.loh@oracle.com
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [DTrace-devel] [PATCH 2/2] test: Skip pid-0 tests on
 oversubscribed systems
Message-ID: <Z/58FonIo0WSzzUh@oracle.com>
References: <20250414201959.31327-1-eugene.loh@oracle.com>
 <20250414201959.31327-2-eugene.loh@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250414201959.31327-2-eugene.loh@oracle.com>
X-ClientProxiedBy: BLAPR05CA0021.namprd05.prod.outlook.com
 (2603:10b6:208:36e::17) To PH8PR10MB6337.namprd10.prod.outlook.com
 (2603:10b6:510:1cc::10)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR10MB6337:EE_|CH2PR10MB4262:EE_
X-MS-Office365-Filtering-Correlation-Id: 5aff491f-eea2-48a4-8425-08dd7c32c273
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?1/WZ3wtJCaqNzMHXsLutr1pnzv+hCvJcz1cN3XNvfQ0QzYdP9CXGOLGeJP+N?=
 =?us-ascii?Q?ungYyV4zYfw+6N074upVN+R+NzjrTIc1DyhQBiMsSCTMOfcbJ9voFOR5Y0mi?=
 =?us-ascii?Q?lhi2DbQqLlYG6TlI298Sar6mjdz8m883x7MtMUVyErHZUou80LKKxWpOHk/k?=
 =?us-ascii?Q?VnVzc1If2qha7Jv1eswweNAUmvEYQhR1TfUVdoKjYUmlRqbMT8gXx81ert0B?=
 =?us-ascii?Q?xn2CRvu8J4PLg9lSLnLV8lprRb482HmhIGPKWiu/Je5IvLPfQVBIfz1DOfww?=
 =?us-ascii?Q?18ANhoQr6rGjmEaR9h/9qqhIEHPxh0ZxHIqjbum1m1/eY5JTmqE1lttCtu/m?=
 =?us-ascii?Q?y2WdM9HFpuW1GotHMQ6/Qgdr3RczAGfaJcnpH5ZqfpPr3I4nk4osi9g/FfrH?=
 =?us-ascii?Q?6bdEdvwSB82mhXKd1DWZZiWPYKgUNM4OWzlOHPh3YmwDMnKikjuEv3fGt+db?=
 =?us-ascii?Q?JlQ36uaR01NtGbtnY2+mWBeB5HyjCE9PXBn2gubZuhFg3cQEEgqRY/zE4Rr/?=
 =?us-ascii?Q?/87BLUC6odp1ikGNaNKbEjA/S5zyIqAFcJMyMqYK7Kfp0zmmvU6N/BEr/iVj?=
 =?us-ascii?Q?JzvtqxYTEbzcJ9jYm1JDQHTBpV8Ei9RkSUHJOZamDXBvif2pdIZzLmnJGhwg?=
 =?us-ascii?Q?DwNucRjrx9fmeQ9FHx1QoqRz/ALcH67ji90gddAzlNMnrZY4o6PJzNBSWSMY?=
 =?us-ascii?Q?AEwu87538OHVhrVWz2OPuwh0dD4iN+m9DUIFJr5iQkjuJPWjzK/jh1a5UdwX?=
 =?us-ascii?Q?bbXB13gfr8fopEgY3xDsNvZ4TIEh8rNU1VSGQZsgrTQ8stABNIpX0SqNTt2W?=
 =?us-ascii?Q?zeB+z7xrILZdFi/3ACH36tCJ21o6R5jAVg20TP/i7f3+wYwzajlDuUqYIKQy?=
 =?us-ascii?Q?sNhpTk9KrbR3gB6vnnyM/HM2LfrT6TNPRfYtMRDyPPHc+BtckF+75Cv3zadq?=
 =?us-ascii?Q?V0qFpNdhGTtliKc47l317fjo9vlampvpg6Rw7FJ3vjoeX0aQOC7uDSTM5RTq?=
 =?us-ascii?Q?G4tLdR3o4nw6M7/tQf98JTGESq7YjweSeABxKTXsGmC6dq6cpnzJfA7lGzd4?=
 =?us-ascii?Q?5xPKWAggvVwWhu9Jhj1IUZ7aSTz9Z3GZIh0eLlghbuEvbK4yX5QKFkXIZhvt?=
 =?us-ascii?Q?nhG1xnU3JPZB8EahbJIyNXfqK5SBZgGMQzjiWkm67BbmACZ9BiREIjsvZ99K?=
 =?us-ascii?Q?Dnzfb4pmfEZWPUDlhXsEbOmVku/h+zcOvPGnmhRdYpkhbf2MuxmUsf6iijNW?=
 =?us-ascii?Q?lOefWTKzpSJINF2/fpPs2ZBYPquazgO5xsjgqN2qeS6f3B1aC3j7tFBhmOYB?=
 =?us-ascii?Q?1/eE1YzKfdHiFld+Su0UCL3nqKxe9t7ifZz0gRL8FPb1ClkEvwNFFl9oQow/?=
 =?us-ascii?Q?RBR4fobEIT8wje6LYM34kivlFhLsjx/1Z9Hy1S+2/BWJRkH1ighWqhjO9hIe?=
 =?us-ascii?Q?/VsmytIvt+LEa8EJl5M8ES0DS5QKAcDp?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR10MB6337.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?zP5esyWUmNUDP2vr0oelJV9n0gdrKtrSuUwh5eRMO22N5NlFx2c442NWn6la?=
 =?us-ascii?Q?cN9IqgemezVcTgUSD06s2MJd9RNU9SmONGowLoLurZXYyVq56sXiJJS240sX?=
 =?us-ascii?Q?jizVrx9zipdAdv28BCJBX1JbMKH7Tj2Dreb4GXDS3oVXZ4gCGUkc+eYcWuC6?=
 =?us-ascii?Q?Mw8Scb2UES7L/JgLJGgMlCSM1YZhmtRPbg/poY0CE3cBViJraok8Zdlc8D/0?=
 =?us-ascii?Q?pl4AteHYk/KUID3aqRHwzkYbQuYOjZRewXh8qiSqKwNin5yS4doDqTgQ1cFb?=
 =?us-ascii?Q?ZcZ8dj2MdMTOXsGYjy/5SRwi9IsvScSsKcLFJgJa4xm1BOqO9NXK4bgYaWmL?=
 =?us-ascii?Q?+2kvekmafeDX30okbmwVXLz0DiUytpkbxyFyH3fYl8jS0HsQdfTpTTUaauEt?=
 =?us-ascii?Q?uLWFN1mZ+P6ZmJ+LByXbwqYNIDKWP+f6ULDqEZs3cLZWWm6Vt5DzyO0x6uxi?=
 =?us-ascii?Q?PffUQhU9jlJ6cmRGWMWD9nwp4zLtWvK+OvcZXf3LgUFMVO/JIMjlLBYPvLJv?=
 =?us-ascii?Q?v3ZT2xCRaL3J3IvpMDXzpASOwesA2c3qwtl4RxCxVt166jNAZ44hrEb94FWP?=
 =?us-ascii?Q?Zz2zGLUnJuvj/bPO3lrXeG0ZsQDdu0PfWD5ZM0KPTc/lFzZShVEGgXm7d3xh?=
 =?us-ascii?Q?kFNW3LDp//3iftTf4tTKlfjxBJtYfw4x+jG9YZQlbg55UTbIEScu26SRdnRo?=
 =?us-ascii?Q?lTDIM/4EbWCM1oqV4Pf6BLKBEimHEfW+kdite6j1inDJ0mqvwfq4sIf3XbKy?=
 =?us-ascii?Q?WFv+X6Uo6Fdl/XBASL/FvuRifCo6bBp/Ov4C4IvZsK8g5Ko6WgmZdZlyYYEH?=
 =?us-ascii?Q?uN1mxUsGnUrQAJ29+LitbgnutnweFiO3IbeTHJT9bI8pHkp6eiW9w4RSd2iI?=
 =?us-ascii?Q?s06uBzrRa7/GENMDxer8puJkfWfheWZlVd6vHFaqz4ad6MzebshuIM75C/2x?=
 =?us-ascii?Q?TTmQp4+FVayi343SYIQ1miOclKULN+CBdlO//hRzix+RElZQQzzwXHhw0x+/?=
 =?us-ascii?Q?6JXrLOhyIwEzcvUgaxG3vXFiCcasiR5Wf8bPqr4lubClWFHYvK0Xx5yqLETH?=
 =?us-ascii?Q?lv+c2SIfoRZ94S/fdootFn0jDl+L7z4Q1P8+o0UeVP6aU2+7ww2VYRwjrJ4s?=
 =?us-ascii?Q?0kYxWY1aMaIeLdkfX0kxMWVuUjxWLbFbiO5Ayuvl/4alpn/fNTc3CdYaVGtt?=
 =?us-ascii?Q?nM3E/8ZdARCMEEvUquLTdDmCyPsvAS8Ad7oJVIuZkW8zRqmvdjlEiaYDyKft?=
 =?us-ascii?Q?Hw5nssWX38pJJeBw6XhHvy8tfY1TPQGWbqLtaKVmxR+KtdMsKAAufQFKgIT3?=
 =?us-ascii?Q?hzy8kXrC7PpY+TwP9sMNzJH4oYSIhYF5WJLtlf7H9E7yUFwby3MN7wJHAdWH?=
 =?us-ascii?Q?ilarmeCAl/k8XOio7iG5jZ/iBeFGn6L8PdOjdJih7VPVibUtVQBwREnF3xWJ?=
 =?us-ascii?Q?Lt1mPgQkTTXee8gnXLmVsERazuubcfjoQVWzQEivxr+thUXsw7KP4f2AmWuu?=
 =?us-ascii?Q?KFnzNkZurL2EhfwsCFRUvB5/vt2LkeHy5LTmdKyuldImlc2aZX8EHYas9O9e?=
 =?us-ascii?Q?yYN8o0BklCjhuwljwO4/IKmcP33wqbAD1jcTfG29QYS4g3TYpR1kYW1+hxK5?=
 =?us-ascii?Q?1g=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	626SktGIAyScWn+gucgApUlo88FGFssyNnZp3YoJWMrBvfKuJYHqT+9k8RyWDJYaj3vSUVNyiGjey1vAaCcb5k0T8X7n5iEC7mhJrigHrxoBZCYpiS2BAaPqCRTgr6zSaitHi13Uzm+M9+tpqLXSR51FYWPX5FKuZxGJvNwXJt+z/3htRCl+LJN2THZZS5dWpuGUF4CZUvDkD3ItvLGsZSQWMLopXVAzzdKQ40oArNQvkySJN654ysbCinLhJMZhCiXzYyyIM9zP6M8L1VXTg4mGZGCG2cCErreflixX9e6TDMu+6/OQIHkdgrWGnin8cu/efm0pnKH0jqbunHbuUZJd7IWOH1hd7+4OvzaqluPEdxsVS0KO06MrgbBweNwj7tegjopk+ifcILt4uOFKGoV/uspdww8xGHhzGWqLZrSe1sdnZmcpEYfbLZjRqXrhpVXc6+ctQrIByBmgPMI1kQ5hH77Bm+vAlbs5YxujLQ/OKR7m09wXpMkazA4qYyLUMUd1lS3ryHyUxoXkoAYd1N8RvmTbuR2uCsRFFtFcZKr38JOORV2yiMzxusVotqjGXVsEjp4cERcUbjfKMpTn/t+W3KkjD7hNcWfisA0+yS4=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5aff491f-eea2-48a4-8425-08dd7c32c273
X-MS-Exchange-CrossTenant-AuthSource: PH8PR10MB6337.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2025 15:32:41.0681
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lXSAxQ05YK/f3KDPgIJAnjEomvireFbv1bJ1PL5/lnZkFa+hYIDbXJWIhkuvq1LJJlXf47N7CTFpwC8L+iEWwy9DRWcjGvpp6dBgnekd0KU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR10MB4262
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-15_06,2025-04-15_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 adultscore=0
 phishscore=0 bulkscore=0 suspectscore=0 mlxscore=0 mlxlogscore=999
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2502280000 definitions=main-2504150108
X-Proofpoint-GUID: G3EtIRgF-sdnCd0PW9V91B_xkjwGAi4-
X-Proofpoint-ORIG-GUID: G3EtIRgF-sdnCd0PW9V91B_xkjwGAi4-

On Mon, Apr 14, 2025 at 04:19:59PM -0400, eugene.loh--- via DTrace-devel wrote:
> From: Eugene Loh <eugene.loh@oracle.com>
> 
> A number of tests check "tick-n /pid==0/" probes.  The problem
> with this is that a tick-n probe runs on a specific CPU.  If that
> CPU is fully subscribed, then pid 0 (swapper) will not run.  Thus,
> the test will take a long time, only to time out.
> 
> Change these tests to use profile-n instead of tick-n probes,
> improving chances that the test probe will fire on a less subscribed
> CPU.
> 
> Therefore, also change the .r.p post-processing file so that it uses
> only one output line (in case two CPUs manage to write output).
> 
> Finally, add skip files in case pid 0 does not fire on any CPU.
> 
> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>

Reviewed-by: Kris Van Hees <kris.van.hees@oracle.com>

... although I think it would be best to have a single .x file and then
create symbolic links for its copies under different names.

> ---
>  test/unittest/ustack/tst.kthread.d      | 4 ++--
>  test/unittest/ustack/tst.kthread.x      | 5 +++++
>  test/unittest/ustack/tst.uaddr-pid0.d   | 4 ++--
>  test/unittest/ustack/tst.uaddr-pid0.r.p | 4 ++--
>  test/unittest/ustack/tst.uaddr-pid0.x   | 5 +++++
>  test/unittest/ustack/tst.ufunc-pid0.d   | 4 ++--
>  test/unittest/ustack/tst.ufunc-pid0.r.p | 4 ++--
>  test/unittest/ustack/tst.ufunc-pid0.x   | 5 +++++
>  test/unittest/ustack/tst.usym-pid0.d    | 4 ++--
>  test/unittest/ustack/tst.usym-pid0.r.p  | 4 ++--
>  test/unittest/ustack/tst.usym-pid0.x    | 5 +++++
>  11 files changed, 34 insertions(+), 14 deletions(-)
>  create mode 100755 test/unittest/ustack/tst.kthread.x
>  create mode 100755 test/unittest/ustack/tst.uaddr-pid0.x
>  create mode 100755 test/unittest/ustack/tst.ufunc-pid0.x
>  create mode 100755 test/unittest/ustack/tst.usym-pid0.x
> 
> diff --git a/test/unittest/ustack/tst.kthread.d b/test/unittest/ustack/tst.kthread.d
> index c6252b742..83ae6f7c6 100644
> --- a/test/unittest/ustack/tst.kthread.d
> +++ b/test/unittest/ustack/tst.kthread.d
> @@ -1,6 +1,6 @@
>  /*
>   * Oracle Linux DTrace.
> - * Copyright (c) 2013, 2020, Oracle and/or its affiliates. All rights reserved.
> + * Copyright (c) 2013, 2025, Oracle and/or its affiliates. All rights reserved.
>   * Licensed under the Universal Permissive License v 1.0 as shown at
>   * http://oss.oracle.com/licenses/upl.
>   */
> @@ -16,4 +16,4 @@
>  
>  #pragma D option quiet
>  
> -tick-100msec / pid == 0 / { ustack(); exit(0); }
> +profile-100msec / pid == 0 / { ustack(); exit(0); }
> diff --git a/test/unittest/ustack/tst.kthread.x b/test/unittest/ustack/tst.kthread.x
> new file mode 100755
> index 000000000..b5fe7177a
> --- /dev/null
> +++ b/test/unittest/ustack/tst.kthread.x
> @@ -0,0 +1,5 @@
> +#!/bin/sh
> +
> +$dtrace -qn 'profile-100ms /pid == 0/ { exit(0) }
> +             tick-1s { trace("cannot profile pid 0; oversubscribed system?"); exit(2) }'
> +exit $?
> diff --git a/test/unittest/ustack/tst.uaddr-pid0.d b/test/unittest/ustack/tst.uaddr-pid0.d
> index 263a7ca94..ab54eea40 100644
> --- a/test/unittest/ustack/tst.uaddr-pid0.d
> +++ b/test/unittest/ustack/tst.uaddr-pid0.d
> @@ -1,6 +1,6 @@
>  /*
>   * Oracle Linux DTrace.
> - * Copyright (c) 2023, Oracle and/or its affiliates. All rights reserved.
> + * Copyright (c) 2023, 2025, Oracle and/or its affiliates. All rights reserved.
>   * Licensed under the Universal Permissive License v 1.0 as shown at
>   * http://oss.oracle.com/licenses/upl.
>   */
> @@ -9,7 +9,7 @@
>  
>  #pragma D option quiet
>  
> -tick-1
> +profile-1
>  /pid == $target/
>  {
>      uaddr(ucaller);
> diff --git a/test/unittest/ustack/tst.uaddr-pid0.r.p b/test/unittest/ustack/tst.uaddr-pid0.r.p
> index 9203dc824..78ab8e59d 100755
> --- a/test/unittest/ustack/tst.uaddr-pid0.r.p
> +++ b/test/unittest/ustack/tst.uaddr-pid0.r.p
> @@ -1,4 +1,4 @@
>  #!/usr/bin/gawk -f
>  
> -# remove trailing blanks
> -{ sub(" *$", ""); print }
> +# remove trailing blanks, use only one line
> +{ sub(" *$", ""); print; exit }
> diff --git a/test/unittest/ustack/tst.uaddr-pid0.x b/test/unittest/ustack/tst.uaddr-pid0.x
> new file mode 100755
> index 000000000..b5fe7177a
> --- /dev/null
> +++ b/test/unittest/ustack/tst.uaddr-pid0.x
> @@ -0,0 +1,5 @@
> +#!/bin/sh
> +
> +$dtrace -qn 'profile-100ms /pid == 0/ { exit(0) }
> +             tick-1s { trace("cannot profile pid 0; oversubscribed system?"); exit(2) }'
> +exit $?
> diff --git a/test/unittest/ustack/tst.ufunc-pid0.d b/test/unittest/ustack/tst.ufunc-pid0.d
> index f076782aa..cd34275f1 100644
> --- a/test/unittest/ustack/tst.ufunc-pid0.d
> +++ b/test/unittest/ustack/tst.ufunc-pid0.d
> @@ -1,6 +1,6 @@
>  /*
>   * Oracle Linux DTrace.
> - * Copyright (c) 2023, Oracle and/or its affiliates. All rights reserved.
> + * Copyright (c) 2023, 2025, Oracle and/or its affiliates. All rights reserved.
>   * Licensed under the Universal Permissive License v 1.0 as shown at
>   * http://oss.oracle.com/licenses/upl.
>   */
> @@ -9,7 +9,7 @@
>  
>  #pragma D option quiet
>  
> -tick-1
> +profile-1
>  /pid == $target/
>  {
>      ufunc(ucaller);
> diff --git a/test/unittest/ustack/tst.ufunc-pid0.r.p b/test/unittest/ustack/tst.ufunc-pid0.r.p
> index 9203dc824..78ab8e59d 100755
> --- a/test/unittest/ustack/tst.ufunc-pid0.r.p
> +++ b/test/unittest/ustack/tst.ufunc-pid0.r.p
> @@ -1,4 +1,4 @@
>  #!/usr/bin/gawk -f
>  
> -# remove trailing blanks
> -{ sub(" *$", ""); print }
> +# remove trailing blanks, use only one line
> +{ sub(" *$", ""); print; exit }
> diff --git a/test/unittest/ustack/tst.ufunc-pid0.x b/test/unittest/ustack/tst.ufunc-pid0.x
> new file mode 100755
> index 000000000..b5fe7177a
> --- /dev/null
> +++ b/test/unittest/ustack/tst.ufunc-pid0.x
> @@ -0,0 +1,5 @@
> +#!/bin/sh
> +
> +$dtrace -qn 'profile-100ms /pid == 0/ { exit(0) }
> +             tick-1s { trace("cannot profile pid 0; oversubscribed system?"); exit(2) }'
> +exit $?
> diff --git a/test/unittest/ustack/tst.usym-pid0.d b/test/unittest/ustack/tst.usym-pid0.d
> index d2f5ec5de..9aceab355 100644
> --- a/test/unittest/ustack/tst.usym-pid0.d
> +++ b/test/unittest/ustack/tst.usym-pid0.d
> @@ -1,6 +1,6 @@
>  /*
>   * Oracle Linux DTrace.
> - * Copyright (c) 2023, Oracle and/or its affiliates. All rights reserved.
> + * Copyright (c) 2023, 2025, Oracle and/or its affiliates. All rights reserved.
>   * Licensed under the Universal Permissive License v 1.0 as shown at
>   * http://oss.oracle.com/licenses/upl.
>   */
> @@ -9,7 +9,7 @@
>  
>  #pragma D option quiet
>  
> -tick-1
> +profile-1
>  /pid == $target/
>  {
>      usym(ucaller);
> diff --git a/test/unittest/ustack/tst.usym-pid0.r.p b/test/unittest/ustack/tst.usym-pid0.r.p
> index 9203dc824..78ab8e59d 100755
> --- a/test/unittest/ustack/tst.usym-pid0.r.p
> +++ b/test/unittest/ustack/tst.usym-pid0.r.p
> @@ -1,4 +1,4 @@
>  #!/usr/bin/gawk -f
>  
> -# remove trailing blanks
> -{ sub(" *$", ""); print }
> +# remove trailing blanks, use only one line
> +{ sub(" *$", ""); print; exit }
> diff --git a/test/unittest/ustack/tst.usym-pid0.x b/test/unittest/ustack/tst.usym-pid0.x
> new file mode 100755
> index 000000000..b5fe7177a
> --- /dev/null
> +++ b/test/unittest/ustack/tst.usym-pid0.x
> @@ -0,0 +1,5 @@
> +#!/bin/sh
> +
> +$dtrace -qn 'profile-100ms /pid == 0/ { exit(0) }
> +             tick-1s { trace("cannot profile pid 0; oversubscribed system?"); exit(2) }'
> +exit $?
> -- 
> 2.43.5
> 
> 
> _______________________________________________
> DTrace-devel mailing list
> DTrace-devel@oss.oracle.com
> https://oss.oracle.com/mailman/listinfo/dtrace-devel
