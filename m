Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AECF942A81
	for <dtrace@lists.linux.dev>; Sat, 28 Sep 2024 02:22:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727490167; cv=fail; b=trby5pBQsNg/qjxd1zEOmrXENQUNlE37RA1ftnnYpA2pH+H0zgzuFfGvkQ3VKAOWOFhn48R8oEB6dIY3PmKsYxnhnZjAsOcCYb0SCUw4ktEn1Z1osSW5KWqDIgSxxpPrDUiY3IED0ko3eg3C/W32DGuL8YWQyRcFp5AB3ywhlJM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727490167; c=relaxed/simple;
	bh=gHth+lDoYz0xz/ECw5t0U7tjBsedfA0lpZOih/nK8xY=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=rC3SUts36Jj+sryDLRRRNSxPDDxFdNC0okq9r/EIcNj814qz/c68n5FTLxaTSP3vNLilqP/DHmAAroqF9e9tpWPWHzcQwyzOsVrczxYu8IoD62toyWp7ldh8u79TfR/ilp9sEbgQN/zDnCYAlImu8+h1M1qAMl8dEOrtuQPw7pM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=jTTeLXzD; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=dMBAJVJX; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="jTTeLXzD";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="dMBAJVJX"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48S262qw021207
	for <dtrace@lists.linux.dev>; Sat, 28 Sep 2024 02:22:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	from:to:subject:date:message-id:in-reply-to:references
	:content-type:mime-version; s=corp-2023-11-20; bh=sXrzqz1a7qbPHA
	T6x8U4bOauUgyhxEGtUxlXvZu+3fU=; b=jTTeLXzDkl1DaED+pbV8T5wxwwXZIf
	oR/DxJoT9d2srN/IJlcUH1bLqMCmdyj1/YmGjqri6IncfTl9Md3tPLSQ5et23zVj
	a6yEARbAUzEtKRoI1lolRN2gvJfIMmvx2xjjBtDj81E+33Hz0jAHUDp58vRGDUQv
	g1dOmsHUhGLhKGPbNXQQCmEg00Oh49Hx3wYApLg9XHEWSzotbTOyS67EWoGoxyKO
	ZhS6096xja1WJKQfGlAz+uldW5sExuJdzG/lya/ZAxxA4AtpKwpW7hm3xU9Wd5Pd
	rS8XPu9DCQAN08/LQL544ix0LjxL20Gm6Bl9mTo9S/ylwQtbmxeu/GPQ==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 41x8qb00b8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Sat, 28 Sep 2024 02:22:44 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 48S1XE5l039128
	for <dtrace@lists.linux.dev>; Sat, 28 Sep 2024 02:22:42 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2170.outbound.protection.outlook.com [104.47.59.170])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 41x8848q4y-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Sat, 28 Sep 2024 02:22:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IIhggSqJG8ECy5fmqFOfrPc3EqZHvAd/tj+W5Dr1KCnfvZMrnK5yKevKaQBkOFB3wfMBCGYkPgNiB9WzQysakWN7TT0xzWa0g3JBhupacwq9PQtkyTGGKevyWNAOh79wI9SCzy0thXqECW7icWWQaU9c6njEETKI8ZiF28Uc8JKsfsNqkRVJxI0SKqlIAhZv0FttINO6hV59puwL2vlfnDetU49M6ln0eYmB/yfTNGtR0QvxTCrf2UJszHxKLCpd6qmAdq0zBIbt7YByoV56wkvnuVw7HvaTAw083a+qEP2EP7duOwUOHTtc5hULus+oM6HJcFAYxNLIqUB0o0J8lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sXrzqz1a7qbPHAT6x8U4bOauUgyhxEGtUxlXvZu+3fU=;
 b=NaS13W0ql3H3a/gORa8mRyY2UUF3rFIhX3bBFaeVIn4s3420GOw7KH1lsTWoIG4wr9fBINvye/rXtyE3w6avNE2Pn9H3BRv0Zu3GNHpUIyjDH98S8p/y8rdtihPYN6syI4XywTP3F3wchJnOEowWyN1Qa9Z4Sf3PLWAPddW9xjH0mMKr5qhfwILrvIcQr+j5dEjK8q10oQCLNvCvQ+BllEXMvFlz4gv4FGcaBpKKTf7ltH2liAKV+LeBSytV/xwdAVh1k4EPOcJ4SauBQ083FTaI9egXyz5aby/NXUnumoVsroNL5MJlAcPrSYfmuvhga9lskpt5Sty//GNoA4yFbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sXrzqz1a7qbPHAT6x8U4bOauUgyhxEGtUxlXvZu+3fU=;
 b=dMBAJVJXu9fUbVwpg7PD+uQZRpYoUtdkglXRXcx/fqACDH0d4icqngwzKxYU7hHDLf18EYMfM07zq1w+YDnyoE9np1uwhIUNru2j8sDkxFt+QZcaUx6xWuWohryM3SmXhlmn79QPcfWzuYlMD7E4pArCIKH3ymUcQe0urRtrtHc=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by SA6PR10MB8206.namprd10.prod.outlook.com (2603:10b6:806:441::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.8; Sat, 28 Sep
 2024 02:22:37 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%3]) with mapi id 15.20.8026.009; Sat, 28 Sep 2024
 02:22:37 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 5/6] test: Add USDT tests for deferred detection
Date: Fri, 27 Sep 2024 22:21:57 -0400
Message-Id: <20240928022158.9206-5-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
In-Reply-To: <20240928022158.9206-1-eugene.loh@oracle.com>
References: <20240928022158.9206-1-eugene.loh@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: LO6P123CA0031.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:2fe::11) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|SA6PR10MB8206:EE_
X-MS-Office365-Filtering-Correlation-Id: 5b584f6c-59f1-44bc-ab53-08dcdf646b53
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?+e/sbd6105qMiFGmP381fHLeP3jFvzoKoH7AKsv7MVoT+Xfg1WdUky+Pjqse?=
 =?us-ascii?Q?UI3sNH4Fsmoq/auOcFNbZrdk3VhV/1yyhTw0+lE6C7QTdE3kr/40w4BbSLMS?=
 =?us-ascii?Q?bwuU+LhyS4hNxKocPocGH0kvo4x/PMxSc1C+H6KCRLUyqQ3R8kxfAnnSbRJA?=
 =?us-ascii?Q?jT6ymVEnoWjIoZhsXNJQOPq5OQA4KJPsEIF4zSfaEeoUzd3wECBLOsPC5T0z?=
 =?us-ascii?Q?2wAy/M893Hmlu5sP1K9SGjsUxyCvowW+xVdIEwK9+ldI7q9+q26xw5INWZ5Z?=
 =?us-ascii?Q?A6v31Ae2ceHD273pDQYfjy+y/UwcaCTfmFhDAXza90Vh+6W6CSdnGHj5n8sV?=
 =?us-ascii?Q?VWAz2/hjUflDjjS70nv5Z3b9mif/7U6t/j1djaiR9P/eq/tqeuzykRWYjuqK?=
 =?us-ascii?Q?A6cs+I0QgFY6b925nOKvzUpeCv0bgtKLjzxeq12NJ2WMD5Pm2uD87BI3DkXH?=
 =?us-ascii?Q?1cSCz3E5DhuEVVX2aK/thhMll8TKQx2jXQJ61qRlAXnJhiNi4eeXkFiSWBwT?=
 =?us-ascii?Q?F1FkmdgNMTETpsphWOTYnAhDqUkgCplI0NvTqmypdIQzHvl9Jwmqc7oSZQJN?=
 =?us-ascii?Q?NqbwN1mdh/0InE6wHtvqPLQSuc33pS57xsDRF+96RMXmSwrolpJ5X/kebcxU?=
 =?us-ascii?Q?XaYWkG0ABld6CAHYmJCxrOKzMd0IYsekH+jCf64xi1mz3a+q7Aur8FKAHcnx?=
 =?us-ascii?Q?YEjmTTSkPQ55apTkLyLvah5cb+tYPaerDpPCau3ds5mZmSykrujEUVcJ57rd?=
 =?us-ascii?Q?AyeGZm+inHPAK6w97HbEFElCL6dpptSEUrcUcns1GMONBBVAtvH3cjyHQ+Qy?=
 =?us-ascii?Q?PUFGxl+6TLk0YQuJtceCSTS6jOTAUllfsuX1VpmH/zwNqNyb+utoguSDRZJq?=
 =?us-ascii?Q?OrYVu3yRmUKjmWp50VByV48Bstc1mfVz9suswQWlj6dkOxuiesFjF+0c2Jkb?=
 =?us-ascii?Q?FuRdP+0x/pX+1nGsqj0L37R7Nf88zMn4cFNrs43/47sl5OIhH/AAXX74eAKZ?=
 =?us-ascii?Q?N87Cw7LxPR9KhJXguv57GjPDT5TAdeP/11nFuHgegKq+5oBkZ7R3ll4hgOap?=
 =?us-ascii?Q?hovohUVS99KWkBrpkmU2QbSoOBC4iWQ8iI1CBzo+ADjfPnfcgeXUxWwIfy5R?=
 =?us-ascii?Q?NtsGx1nfOgQOSGmwN5c/+av0XTLaK+mFtk8gvKC6l04HoEfj1o5Fn2BzkBAm?=
 =?us-ascii?Q?+R+eqATH3GiXi0dkiTPxYkUHK3F3IwRZTzM66Gmn0MeNdyRSNiRHQF4u6Vm0?=
 =?us-ascii?Q?CWUWnaaX8VKVRhGy/xZxOAViGBkE0AOPTzLawpj+sA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?kHVqf+xCa2AS09jQP4ycttsr6RkCXD6glepVZmvCtnwrlzIAPnAGx9RAaCwl?=
 =?us-ascii?Q?blQE1Qg24K/useHhTKotWRJlW355k8PbeWhLCtU+yztv5z9C2lUwbb4PdX06?=
 =?us-ascii?Q?S8c4lTEn/eYTYVTZt95Fh+7+yxBHgxGq5dQgt6i11lBBsI+2Is4ox/368Nek?=
 =?us-ascii?Q?xxgEKOGaHoiN5dE2bCWs+cxaAj30pCa7jzeSAyTKsqo5WZJXhZgnXmLpBzUF?=
 =?us-ascii?Q?C/cMBbZssC1dAn59EOddMieC9c/jHtX/AH7pOju0SIBPr2qkixcdcJe8jqS7?=
 =?us-ascii?Q?ELneIC9fo4cYqBRyM+qV+gbmNcFp+/F9hYX/mxbjm27AJWGZ0dDJ60TofsUU?=
 =?us-ascii?Q?LRIRf1GuBcaP0WBK6QCmjn4d7XgxszkrKXFz5dcIAsgsyBbo+myi350U5wMD?=
 =?us-ascii?Q?iUo48V/UR4qAO5c72mrW0+JuVTd30cTvXRi01fcb0rRbLtvNvAte90dWgJFT?=
 =?us-ascii?Q?r+vJHZy4VlzctZhewmJROb0MimwNg8ELz7Nuu+GS679Um6mNS9EbTJdAGWOl?=
 =?us-ascii?Q?KtzJWCHMCPb1lU2dQXROJmTsHKhjKSN0FyFsvmuRAhpqf1xfDsbTIJKuOaif?=
 =?us-ascii?Q?MSdJb/CB3OQ5ITeH5V8M0moVmsWrXZIh+auMk1U6lwxbumbzLsVR9E+w86po?=
 =?us-ascii?Q?0jE+mcYcLNp0W2x6Tm8M/SOpKkZbmop7d+zWccutiqV50xLm0zKDxxE9BJYM?=
 =?us-ascii?Q?8i3zbeOPET6W0oA+E5Q3WkdLsiMR5ru2lwvmzqm2wAl8AVc/WGhhtwCgiGq1?=
 =?us-ascii?Q?BOMJoMPO9O7dqkIDlv4Wk1CUDVx5ghChsAF4xoRxscW1edN7qT21lbtRITA+?=
 =?us-ascii?Q?gDjV0nvFCizW//gtLSU6Tn43c4vUWo+XLz9enLNVwaBf993hBrL0m9BZ+fZR?=
 =?us-ascii?Q?Cwol9YYSZvXnepsam6zRWPFz1dt/7WWk1+tQT2IwplHU0qbzlaG6u05DbCOZ?=
 =?us-ascii?Q?FGPAUJhbB/gzFAe+pdXRG5kWV3ear10+U/w4fy2nZCAJQrRY8ENLFpfT2QI0?=
 =?us-ascii?Q?EwEP2FNB6SkiPp4ORKWShgt7zfn2jkQCXcOToRFqOFPCZCopbe9QfHb6u6rm?=
 =?us-ascii?Q?ND/Qgf5nt2Z6Z5mLf5rEk/rzEJ6MekEfzSjdBMKTlXo5V22DUt4iSUkdgSbW?=
 =?us-ascii?Q?EPJvqCnDK+5b4uiwnRcZnTEqv1OZa7ho34kmjrJfyUSs5tM0X7G0xhFcd8ZE?=
 =?us-ascii?Q?UL+4s+LMWbIROGMiatnePRCGnSoPsW9LDObX+kfLlR1yFo9hVZWbxXwH1AOk?=
 =?us-ascii?Q?Gp5B+TH4WFajUukDpxvv7FbQ506KSbcl2D7GWh+0fP9PvOD9Jf0UHjbiaV5j?=
 =?us-ascii?Q?xQHT19SXcHeSRC5U5IEVMknmKlyK0WoLiBBqPPpwcfHQE0BYdvGwOChAFirP?=
 =?us-ascii?Q?Q5owCetLPVP/TNQbNTQnrLKPAIxMSoCsPc09y4b2vGR7xKwTd1yGt33KzfJu?=
 =?us-ascii?Q?p6YjYmznaPSaaLeE7ejpjmOH6GFDwKP+ESfZWD6H2hukBc7gudGb56Or9uHz?=
 =?us-ascii?Q?n/vRH7LS3xikH+aPBeGDs5Z16NPpiyyVMrxVycDUICwo/+eCCFhUjg9GhJvS?=
 =?us-ascii?Q?oTrq1cRN1dIEgz3PCZ5hrLCp10HMAPrChbjv/H5H?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	PYCnocBNZ8fcAybPGuP7NN7V84uvawvgk3LARZPVdosyqYHQDeyQ7bQYy1clGftTYgKTnMLCefBmo0m01JC2nSXMMWSY4vkrzJ/Eq5Mf5jT31UY65N4ld4NfvJtEM+kJj5TA+K4Lrrl0v5KAmKY+iWFMof5Wua62ahyx7wZ7P1t/rh3W1DSQviepyz1S8hej9pdQJzTYEA8FxjfGrhK7YJdi//Eo+82DAp2NLU1GC5PfuFAOcwfrP42upyYPjg1399JnB0PX6IbKc2qM26qFAxBGOZgtlAuXukPlIycQIJKgmEaR8MSZ6JK4DVy3lWB+T9Yi6xm06yA0N7kkHDgoE5gTTvNNYmTJdDPDUJkLOtIM+zCFsF41EiFCUvuTXu9jwvCdgnaBSsk2dHtFnnbu72ZlHYau07H+j+TXJPYLsb/4vuLJQzBWsVh19zLHh9HLxagT9tniwwcijEH/1rF74xe6/VN9dAlr8pAA7xa5kTkO+Y/IpEwlT6w75aJtgU+SLG2siBXR/JmIQmkTkWoOl5UJzX71GfinyxhazfFW85mNjtMTrtpcd+hRhfCAhz2bxjrcBMKrqAAxu7txdU7+nBx47YICfym35duflbpkNuQ=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b584f6c-59f1-44bc-ab53-08dcdf646b53
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2024 02:22:37.6616
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qDwD7ZHA1uworaVN7Mt6dh1tucrS3uPzfS1OxB2AL9ZeaPjgdZUS+A2fVpqbNNQYypt6v1nhJzHkQTYti8EOjg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA6PR10MB8206
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-27_08,2024-09-27_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 phishscore=0 malwarescore=0
 adultscore=0 bulkscore=0 mlxscore=0 suspectscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2408220000
 definitions=main-2409280015
X-Proofpoint-GUID: 8eq86WN1oScP31w0YuwZXGVF63tM0acV
X-Proofpoint-ORIG-GUID: 8eq86WN1oScP31w0YuwZXGVF63tM0acV

From: Eugene Loh <eugene.loh@oracle.com>

When new USDT processes start up, we do not immediately trace
them.  First, dtprobed has to see these processes and then dtrace
has to find them.  Hence, many of our tests XFAIL.

Add some tests that check USDT tracing on processes that start
after the dtrace session has started, allowing for the possibility
that tracing does not start until after the trigger is already
underway.

There are two cases to consider.  One is when there is a USDT
process running when the dtrace session starts.  In this case,
an underlying probe is attached and later USDT processes just
get added on.  Another case is when no USDT processes are running
when the dtrace session starts.  In this case, -Z must be specified,
and the underlying probe will not be attached until one of the USDT
processes is detected.

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 test/unittest/usdt/tst.defer-Z.r  |   1 +
 test/unittest/usdt/tst.defer-Z.sh | 153 +++++++++++++++++++++++++++++
 test/unittest/usdt/tst.defer.r    |   1 +
 test/unittest/usdt/tst.defer.sh   | 158 ++++++++++++++++++++++++++++++
 4 files changed, 313 insertions(+)
 create mode 100644 test/unittest/usdt/tst.defer-Z.r
 create mode 100755 test/unittest/usdt/tst.defer-Z.sh
 create mode 100644 test/unittest/usdt/tst.defer.r
 create mode 100755 test/unittest/usdt/tst.defer.sh

diff --git a/test/unittest/usdt/tst.defer-Z.r b/test/unittest/usdt/tst.defer-Z.r
new file mode 100644
index 000000000..2e9ba477f
--- /dev/null
+++ b/test/unittest/usdt/tst.defer-Z.r
@@ -0,0 +1 @@
+success
diff --git a/test/unittest/usdt/tst.defer-Z.sh b/test/unittest/usdt/tst.defer-Z.sh
new file mode 100755
index 000000000..52e92eb6b
--- /dev/null
+++ b/test/unittest/usdt/tst.defer-Z.sh
@@ -0,0 +1,153 @@
+#!/bin/bash
+#
+# Oracle Linux DTrace.
+# Copyright (c) 2024, Oracle and/or its affiliates. All rights reserved.
+# Licensed under the Universal Permissive License v 1.0 as shown at
+# http://oss.oracle.com/licenses/upl.
+#
+# This test verifies that USDT will see new processes, even if detection
+# is deferred -- that is, DTrace does not know about a new USDT process
+# until after it's started running.
+#
+# In this test, all processes are started after the DTrace session has started.
+# So the USDT probes will not be recognized at first and -Z must be used.
+
+dtrace=$1
+trigger=`pwd`/test/triggers/usdt-tst-defer
+
+# Set up test directory.
+
+DIRNAME=$tmpdir/defer-Z.$$.$RANDOM
+mkdir -p $DIRNAME
+cd $DIRNAME
+
+# Make a private copy of the trigger executable so that we get our
+# own DOF stash.
+
+cp $trigger main
+
+# Start dtrace.
+
+$dtrace $dt_flags -Zwq -o dtrace.out -n '
+testprov*:::foo
+{
+	raise(SIGUSR1);
+}
+testprov*0:::bar,
+testprov*1:::bar,
+testprov*2:::bar,
+testprov*3:::bar,
+testprov*4:::bar
+{
+	@[pid, 0] = sum(arg0);
+	@[pid, 1] = sum(arg1);
+	@[pid, 2] = sum(arg2);
+	@[pid, 3] = sum(pid % 100);
+}' &
+dtpid=$!
+sleep 2
+if [[ ! -d /proc/$dtpid ]]; then
+	echo ERROR dtrace died
+	exit 1
+fi
+
+# Start processes concurrently.
+
+num=10
+i=0
+while [ $i -lt $num ]; do
+	./main > main.out$i &
+	pids[$i]=$!
+	i=$(($i + 1))
+done
+
+# Confirm that dtrace is still running (otherwise triggers run forever).
+sleep 2
+if [[ ! -d /proc/$dtpid ]]; then
+	echo ERROR dtrace died after triggers started
+	i=0
+	while [ $i -lt $num ]; do
+		kill -USR1 ${pids[$i]}
+		wait       ${pids[$i]}
+		i=$(($i + 1))
+	done
+	exit 1
+fi
+
+# Wait for processes to complete.
+
+i=0
+while [ $i -lt $num ]; do
+	wait ${pids[$i]}
+	i=$(($i + 1))
+done
+
+# Kill the dtrace process.
+
+kill $dtpid
+wait
+
+# Check the program output (main.out$i files).
+
+i=0
+while [ $i -lt $num ]; do
+	if [ $((${pids[$i]} % 10)) -lt 5 ]; then
+		nphase2bar=10
+	else
+		nphase2bar=0
+	fi
+	echo "${pids[$i]}: undefined 0 0 10 10 $nphase2bar" > main.out$i.expected
+	awk '
+	    $3 == "1" { $3 =   0 }   # in phase 1, round 1 down to 0
+	    $4 == "1" { $4 =   0 }   # in phase 1, round 1 down to 0
+	    { $2 = "undefined"; print }' main.out$i > main.out$i.post
+	if ! diff -q main.out$i.post main.out$i.expected; then
+		echo program output looks wrong for DTrace case $i
+		echo === was ===
+		cat main.out$i
+		echo === got ===
+		cat main.out$i.post
+		echo === expected ===
+		cat main.out$i.expected
+		exit 1
+	fi
+	i=$(($i + 1))
+done
+
+# Check the dtrace output.
+
+#     regularize the dtrace output
+awk 'NF != 0 { print $1, $2, $3 }' dtrace.out | sort > dtrace.out.post
+
+#     determine what to expect
+
+i=0
+while [ $i -lt $num ]; do
+	if [ $((${pids[$i]} % 10)) -lt 5 ]; then
+		x=$(((${pids[$i]} % 100) * 10))
+		echo ${pids[$i]} 0 45 >> dtrace.out.expected
+		echo ${pids[$i]} 1 65 >> dtrace.out.expected
+		echo ${pids[$i]} 2 90 >> dtrace.out.expected
+		echo ${pids[$i]} 3 $x >> dtrace.out.expected
+	fi
+
+	i=$(($i + 1))
+done
+
+#     diff
+if ! sort dtrace.out.expected | diff -q - dtrace.out.post; then
+	echo dtrace output looks wrong for DTrace case $i
+	echo === was ===
+	cat dtrace.out
+	echo === got ===
+	cat dtrace.out.post
+	echo === expected ===
+	sort dtrace.out.expected
+	echo === diff ===
+	sort dtrace.out.expected | diff - dtrace.out.post
+	exit 1
+fi
+
+echo success
+
+exit 0
diff --git a/test/unittest/usdt/tst.defer.r b/test/unittest/usdt/tst.defer.r
new file mode 100644
index 000000000..2e9ba477f
--- /dev/null
+++ b/test/unittest/usdt/tst.defer.r
@@ -0,0 +1 @@
+success
diff --git a/test/unittest/usdt/tst.defer.sh b/test/unittest/usdt/tst.defer.sh
new file mode 100755
index 000000000..6a9012b94
--- /dev/null
+++ b/test/unittest/usdt/tst.defer.sh
@@ -0,0 +1,158 @@
+#!/bin/bash
+#
+# Oracle Linux DTrace.
+# Copyright (c) 2024, Oracle and/or its affiliates. All rights reserved.
+# Licensed under the Universal Permissive License v 1.0 as shown at
+# http://oss.oracle.com/licenses/upl.
+#
+# This test verifies that USDT will see new processes, even if detection
+# is deferred -- that is, DTrace does not know about a new USDT process
+# until after it's started running.
+#
+# In this test, a process is started before the DTrace session has started.
+# So the USDT probes will be recognized at first and -Z need not be used.
+
+dtrace=$1
+trigger=`pwd`/test/triggers/usdt-tst-defer
+
+# Set up test directory.
+
+DIRNAME=$tmpdir/defer.$$.$RANDOM
+mkdir -p $DIRNAME
+cd $DIRNAME
+
+# Make a private copy of the trigger executable so that we get our
+# own DOF stash.
+
+cp $trigger main
+
+# Start one process.
+
+./main > main.out0 &
+pids[0]=$!
+i=1
+
+# Figure out the pid's trailing digit.
+
+lastdigit=$((${pids[0]} % 10))
+
+# Start dtrace.
+
+$dtrace $dt_flags -wq -o dtrace.out -n '
+testprov*:::foo
+{
+	raise(SIGUSR1);
+}
+testprov*'$lastdigit':::bar
+{
+	@[pid, 0] = sum(arg0);
+	@[pid, 1] = sum(arg1);
+	@[pid, 2] = sum(arg2);
+	@[pid, 3] = sum(pid % 100);
+}' &
+dtpid=$!
+sleep 2
+if [[ ! -d /proc/$dtpid ]]; then
+	echo ERROR dtrace died
+	exit 1
+fi
+
+# Start remaining processes.
+
+num=10
+while [ $i -lt $num ]; do
+	./main > main.out$i &
+	pids[$i]=$!
+	i=$(($i + 1))
+done
+
+# Confirm that dtrace is still running (otherwise triggers run forever).
+sleep 2
+if [[ ! -d /proc/$dtpid ]]; then
+	echo ERROR dtrace died after triggers started
+	i=0
+	while [ $i -lt $num ]; do
+		kill -USR1 ${pids[$i]}
+		wait       ${pids[$i]}
+		i=$(($i + 1))
+	done
+	exit 1
+fi
+
+# Wait for processes to complete.
+
+i=0
+while [ $i -lt $num ]; do
+	wait ${pids[$i]}
+	i=$(($i + 1))
+done
+
+# Kill the dtrace process.
+
+kill $dtpid
+wait
+
+# Check the program output (main.out$i files).
+
+i=0
+while [ $i -lt $num ]; do
+	if [ $((${pids[$i]} % 10)) -eq $lastdigit ]; then
+		nphase2bar=10
+	else
+		nphase2bar=0
+	fi
+	echo "${pids[$i]}: undefined 0 0 10 10 $nphase2bar" > main.out$i.expected
+	awk '
+	    $3 == "1" { $3 =   0 }   # in phase 1, round 1 down to 0
+	    $4 == "1" { $4 =   0 }   # in phase 1, round 1 down to 0
+	    { $2 = "undefined"; print }' main.out$i > main.out$i.post
+	if ! diff -q main.out$i.post main.out$i.expected; then
+		echo program output looks wrong for DTrace case $i
+		echo === was ===
+		cat main.out$i
+		echo === got ===
+		cat main.out$i.post
+		echo === expected ===
+		cat main.out$i.expected
+		exit 1
+	fi
+	i=$(($i + 1))
+done
+
+# Check the dtrace output.
+
+#     regularize the dtrace output
+awk 'NF != 0 { print $1, $2, $3 }' dtrace.out | sort > dtrace.out.post
+
+#     determine what to expect
+
+i=0
+while [ $i -lt $num ]; do
+	if [ $((${pids[$i]} % 10)) -eq $lastdigit ]; then
+		x=$(((${pids[$i]} % 100) * 10))
+		echo ${pids[$i]} 0 45 >> dtrace.out.expected
+		echo ${pids[$i]} 1 65 >> dtrace.out.expected
+		echo ${pids[$i]} 2 90 >> dtrace.out.expected
+		echo ${pids[$i]} 3 $x >> dtrace.out.expected
+	fi
+
+	i=$(($i + 1))
+done
+
+#     diff
+if ! sort dtrace.out.expected | diff -q - dtrace.out.post; then
+	echo dtrace output looks wrong for DTrace case $i
+	echo === was ===
+	cat dtrace.out
+	echo === got ===
+	cat dtrace.out.post
+	echo === expected ===
+	sort dtrace.out.expected
+	echo === diff ===
+	sort dtrace.out.expected | diff - dtrace.out.post
+	exit 1
+fi
+
+echo success
+
+exit 0
-- 
2.43.5

