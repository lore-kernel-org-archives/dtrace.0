Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9DEB1537DA
	for <dtrace@lists.linux.dev>; Fri, 13 Jun 2025 14:23:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749824610; cv=fail; b=Ja1XaO83vWcgBb8pfhF/pFCX7I4/3Dlo6Erb7AweXXFqkKK52Ohncfd5dyilBHFkNQYu2qDRjLQrVYtRNO9l/7HKexI23EgmUh5+ci+JM+3LlW8YM931IMacZbPOVaT0JXhVjxTI29eQAw4Ah2PyuqlzMMXh90LVv3mlHCK2H7I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749824610; c=relaxed/simple;
	bh=DGRrUtmglMsBgaMb4XaSV/6Kl4QaNcE8HWydvlzJsyI=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:Message-ID:
	 Content-Type:MIME-Version; b=NKrykP1GQrxZD90aOABUZ9GhxZ1qldDSUqA5P1+VlqL52WFoxD1i/IGpAFjOfF9jHvjjWgouRauClxqY+uXoB/YVS5lzkZtKEyV30d2I+CnNweMLW1aODvhU/YscVNrMmt93L02bhi/LlzUPbg0Pt8+cTQuPlHOchZFkdAGZCIQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=WciCfqJl; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=kh9/9pjs; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="WciCfqJl";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="kh9/9pjs"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55DCtcsn032698
	for <dtrace@lists.linux.dev>; Fri, 13 Jun 2025 14:23:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=F7qtlJILOVK9Us8lsZ
	u63EFvefYMD/qmC68V0bR0rBI=; b=WciCfqJlqPubQBaZTyTGozIk6A6AbvneQJ
	fjexbg4GpQcwaZhhymR54Jup2CS+aORoHix2CxwcLRkx0WWyGIlNDUa9UYroljD6
	kTfYGnRkVkbmDPXjlEZG7oz4zQb9Vzyzhc/T/FwAbdsDZ/WyWg6iniOoPAj6Rpuy
	cMLHVNiMXhI6Oq2n7SLHbFe56TXKhU8CcIjbbofJBUwB3h5ltc279FK3872Hvupv
	RkZH/PHQeaUhrkQomF4jnBBflM5S58wCgY9GvbkJCw85f6GLxsDAnTuU/aflghUs
	vsl6zLtRY0cD10Y1s1OjAoRcbLX6uHIMbVgXl0U3Au7L07YItmTQ==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 474d1vbpxe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 13 Jun 2025 14:23:27 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55DD4C6r013704
	for <dtrace@lists.linux.dev>; Fri, 13 Jun 2025 14:23:26 GMT
Received: from nam04-mw2-obe.outbound.protection.outlook.com (mail-mw2nam04on2082.outbound.protection.outlook.com [40.107.101.82])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 474bvcqqu9-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 13 Jun 2025 14:23:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y2gT/fa4FVmEGtylCyWGKO0ehUt9Ezm6EmiDBeftRy8aU6YnTzbV/LsjNmr1xgxrfcuR0Sk5OI1yeeGVyeaVlrrs6xlUv/NiKPbukiDjIf8cZw9YHDjqEiNwDNsNRsiqZ2bSrz+N1Md9PHta4Hpwxj0d/kzwCJG/mMia9s4BfCu3YCRdv1UfVhZj1U+ca48wX0oOdDHijKeyPBiVUjC+uh82DYtIOnwaIK6dHBydtEUy+RaKg/fmbejwcJWaHcR+1+/RCVccMBggr5jjVcCbW5R726jtDxy/QRz0I91KHcYikN5F93DZ0+jJ2kVkI24SqSrB/jVVu8rXPKGam00QeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F7qtlJILOVK9Us8lsZu63EFvefYMD/qmC68V0bR0rBI=;
 b=O/teAYqPwjDAauckqcEjxJVDrEVVXWR9DSLfdCkKfv7qaka10cwRNzPLs4Sw7ulWxfvKQ04HkWr63yevl2KANxvyWrzOu1L+ugNKMR4r5nnmeG2hI25Kf/PpYe9aoC9/Ca188P601vwHEZ5oA5QoSpmaIGQ7m4eunX4Qo5gymQoJzR+qPMI/m9MoICIUM/TBtYrpaUJHSLGk6jbyN0ezlwFJu0v++WYdN812K0Xq90QJWj+oDCnQs1eesUHzUj9uvgwuovTbnnhSfB3BwyKV7OvHu/xzjpdj3HsIbkuglz9gu2g75Z59I/TfUqD81op7hM4K7gP01Ay2bLJk+f44SA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F7qtlJILOVK9Us8lsZu63EFvefYMD/qmC68V0bR0rBI=;
 b=kh9/9pjshmRHZ8L2HTlzRP8xflo35VO/F/bH05Tnkffehc98J6Hto0lXv8IyJJZ+hAgom4pvtey8/N+/3oBeRPNghXF9sUJTnZurFIekvubYhBq5S8PCXa1pBgVPFih5IAdmKwYynKKYLbBKoozIot5NcNv4jkag1G6jQRC5dFU=
Received: from DS7PR10MB5037.namprd10.prod.outlook.com (2603:10b6:5:3a9::23)
 by CH3PR10MB7677.namprd10.prod.outlook.com (2603:10b6:610:17a::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.19; Fri, 13 Jun
 2025 14:23:23 +0000
Received: from DS7PR10MB5037.namprd10.prod.outlook.com
 ([fe80::824a:572e:d9d7:e9f1]) by DS7PR10MB5037.namprd10.prod.outlook.com
 ([fe80::824a:572e:d9d7:e9f1%6]) with mapi id 15.20.8835.018; Fri, 13 Jun 2025
 14:23:23 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: eugene.loh@oracle.com
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH] Revert "dt_pid: pid grabs should be shortlived"
References: <20250522181016.27661-1-eugene.loh@oracle.com>
Emacs: a learning curve that you can use as a plumb line.
Date: Fri, 13 Jun 2025 15:23:21 +0100
In-Reply-To: <20250522181016.27661-1-eugene.loh@oracle.com> (eugene loh's
	message of "Thu, 22 May 2025 14:10:16 -0400")
Message-ID: <87wm9fd8km.fsf@esperi.org.uk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.3 (gnu/linux)
Content-Type: text/plain
X-ClientProxiedBy: LO2P265CA0317.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a4::17) To DS7PR10MB5037.namprd10.prod.outlook.com
 (2603:10b6:5:3a9::23)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR10MB5037:EE_|CH3PR10MB7677:EE_
X-MS-Office365-Filtering-Correlation-Id: ee0c7ec9-88de-4c19-b744-08ddaa85dad8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|10070799003|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?4OIrZg1ttPG1QDA+lheQqEnr6gMogLWjfkIk4EiJeN921V9X4n5mvr7feimP?=
 =?us-ascii?Q?1KeB0iE2dOjiSP6YitnURIkH+xoD6oseEN4qKzxNNWeXhqNKIfqQfDlQ0Wqn?=
 =?us-ascii?Q?A7Mev00uiGjGHjSeH2fjE+IB/M9HAFYuCTUAUpzitzXZqshmDplLFL1ylc6W?=
 =?us-ascii?Q?lwPXUjPQrYuT1olK3Oh5s2htxnrkLxsG9Sd9gcF8yfh/lNTLwbfKCKgObrkE?=
 =?us-ascii?Q?IdS/h/kRUrwToGUA3INio/1e4fWSGQRrVu0nW7oT6a3w6pTcZMVtcUQbUsu6?=
 =?us-ascii?Q?URBG5PmkxtiYw9A9tX4+4YzchEvCxenC8yJ6OHUxzE75HPvPtH6/xH93eU7c?=
 =?us-ascii?Q?72QRXIvJcXq59PGxVecWzXbIMCclJ/06gYr4MJUD/W3n/WBiwQYf66sT+Yok?=
 =?us-ascii?Q?B0TKsvkCJucl7eIjngXwJVi14ruP8iKV4v0skVlZT5Jfwx2Wk/CUV7ll/b+x?=
 =?us-ascii?Q?fBfWbfXdOvt4qlSkhWR0jaTqKkGDXWikQ1aCUTr1f1vNUXLrUEyX2Opf7OSj?=
 =?us-ascii?Q?XTHrKxfdXArGElKtVOIM4Z+SrP2hDjsbrslOgmu0Mq3eiMS11Ql6s0ZGTsC8?=
 =?us-ascii?Q?OcbA6a2WMMNkMjeL+stl394iwtKUlNqk6byhKxZXk2Fmvj4HNJGTIJsPIqIv?=
 =?us-ascii?Q?cCiE01MgL2CFSQfF0sLfDEY4tl/9j/AajOV+KA3ibnNIlhwgRaguFxzMETnL?=
 =?us-ascii?Q?bK6JZHuElNRC3BQNbtsG1naHSiWuUdB7lH00jBjNW5oVjBkVwwg+ltHiC3b2?=
 =?us-ascii?Q?HMUS3OKFf/xE3ZMnBQD1ZOfuzhnS7oA8rwyfnl2mxDqFhrqRT/Lfch2dWk4t?=
 =?us-ascii?Q?9drsVnhp8AmOFyUeNhgk4c2swhMbsiF4MUc5+8SneIIPQR7YsG3kr1enCly7?=
 =?us-ascii?Q?sLMVJfFIoiZiV+Oem/9DUIJzBZH7VsK/PWa/nGxZ8tWSwVbQwBWE+wrdS7yy?=
 =?us-ascii?Q?e9QIvtLloFKU19N5lts+58KE8XkANUSkw72B+vIRuCO6R61bMtsJR7czd8yo?=
 =?us-ascii?Q?idz58aTyUIfM9vKH1g76SJLv0ZkbvlYx5BRWdZN0cmqtLV+zlaloPE6ZiXlx?=
 =?us-ascii?Q?FgwIL+Gl5myVtOZnPWWzvQQ6nVnoFA5LdMmqNTI7uyiyjYYd2m5V8N8tffow?=
 =?us-ascii?Q?Do8KLNgtMKVx3a3jJeR9sei8Xz/r6+qF4hmTzyo8PmNfMnAzKYcJwI05Fyi9?=
 =?us-ascii?Q?PEz4yzeKhS5QS5pv11IVEJaL/ThtK62eKOjZRtLXVTvQHYZzVuz6gI8EdKPu?=
 =?us-ascii?Q?q2WI/y+R1Tx+EDuItod8RhhEAuu9RxXSMXp9rH/+peBpOTieS5nWoCnHtvX7?=
 =?us-ascii?Q?cPeR3Cu8PKSq6dsDPhc3XK+LFdY5onUl/pWBRnZegewdHsfxsLFqB/RqlRCR?=
 =?us-ascii?Q?nWk0XhN4Q/gI2vXZBdrbuH6LRtx9Uuo8kBY9KRJPc6zi47noWEj0CVms5oRV?=
 =?us-ascii?Q?iSsT3J8jkaU=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR10MB5037.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?0v3u152C+C3lcIc62ut5s20fLhCCUSv8XJ+QetnSTy0YaYqjtZ/DUjP6qBDV?=
 =?us-ascii?Q?2UD2kG/sO+NsWevSm7h+VR+ng3Mwq1sFXcBtJb9I/9a5SubKWeTwCC5POyHo?=
 =?us-ascii?Q?hkdyMSqkyIO1JmwEVr02q65OaIfuRqxfNHeYkYRN+hvDHwnAIun0tWRDchkR?=
 =?us-ascii?Q?kYrhhvhwp4rwXjBBw6iMnayZl4XgPslOkieP40fNKjpa5JhOEJAY22LcAl6j?=
 =?us-ascii?Q?v403bocmJoC5ByFmXQB8LPQD0mtJ5DgU2OU02XuIfWjinBigG2CRfo9BrylZ?=
 =?us-ascii?Q?pU+M6Qv8OA1XAHWHtAbQzXwVDH01jZnWH4lIRiLW25DDpSRExiXwpBGk6UIG?=
 =?us-ascii?Q?PIP8TV3A3R5Pvo9OiLhPHVgJ8BazwxqO+rJ5me44RS4fe0MxB5OZRsEET2cv?=
 =?us-ascii?Q?4XPQgSG0ksQ358Jchw6MAAUpHG3fLCoyxXimXkxTGHzfkQ9/rf9J9HrElKW2?=
 =?us-ascii?Q?2qcgIkQ+A9gN/fkxrruhjxTMwKYNnDDhLB1E1n3YtL9cTfDWeypRMoIeo/1C?=
 =?us-ascii?Q?ydDNlT94kUFfkY2nO56I/4FYZkQqy57H1mU5YFtT/uPgbsPbfhb5OR8p2yIz?=
 =?us-ascii?Q?1n73fK8JYoeijSaI16IzemCUx5rPo1fRqQ5Ecq8NrPRHNdDaS25oGIZiIIy/?=
 =?us-ascii?Q?UE6HBXkEfN3ZHueEnCrbo9vbRQzOH3M/H9cYQvTKVm1F8CBevGp197d4NG57?=
 =?us-ascii?Q?F+oG6r9dyjxvn/VGT6MV/k77vzlCXeN3NFJM7xiY+7txgcGli7WG+feU1QGb?=
 =?us-ascii?Q?UA8EqWWM48Zj/P0L0DjUdNnE4xO8OTsLjkZ67o4BKLsVBYpNnKkXln4b4CNg?=
 =?us-ascii?Q?zBWQWMs3pHpxbAz2q3cg7EkE//3Ic5d/kp9T766Lw8WH4t3VBv6THww0We9w?=
 =?us-ascii?Q?+gCc3SyWUn6faGZerhfSSrTh8wk8XChvPZK4VWRZVd5ujOk96W2tc0ws4BwE?=
 =?us-ascii?Q?gMiZLAOpedLpNUDUzI7PLTkAwykTgw1s/kTdR1V/jATS3nnNsFjxXVpuPbjU?=
 =?us-ascii?Q?hj+CRO5Vua6jRJUIkOAgLtIFVtgKr2e1c571TifpXIRlssvthrBmcZyBc0OA?=
 =?us-ascii?Q?+zFBKkAkzRogtAv4CKdiTv6uS2vmOOQypBuuENQ4N0W5v9F9HwI3eW6DzRrc?=
 =?us-ascii?Q?1t/Sp+QVcn2ly8fv5PbeAjJT3QFKOzsqvh/8FB8T+AGxXV8r6DJDvPjxFSLW?=
 =?us-ascii?Q?ocmAayLDivnZhyARemF4wVOXIrHxFVz3ED52Fm2b8scT6CPFaIkvBhHCAyzY?=
 =?us-ascii?Q?6MND2Vi+keD9ic39LBXxPsjX11WnZHT5WF+oFdOAJtnOthPvRtP9POyywIdL?=
 =?us-ascii?Q?uGP5NnD3bnh4nhawXwAlxB2WD24Y77WsIyx2gwChJpf3+gGN5PH4tRjRJZ3O?=
 =?us-ascii?Q?KQQMyHd+HU6VZbKyXtcG9Dze/mzVIFrLCqUNvjOSMpD1K9/OPxxKClVqrkSU?=
 =?us-ascii?Q?x/Tlo6pg6TOUcXxWA+nZ9ilOkH/RXNJtxegIJWoXmf9DoZjXNmddvJ0jOTcR?=
 =?us-ascii?Q?TG+uZrPkPdHRrBDz7GoyEWSj41tI/gLdxRZPn65XEaCmJYbRjTpqhUbVxKiG?=
 =?us-ascii?Q?HjrRBbH77RtgWS9UvL/5U9MbCW4U9OPmHP7U6s4WQ+hMLaCGk3GZ2z7FXAc9?=
 =?us-ascii?Q?xA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	SRQXpiFFJZb25GfyzGUJo92+TuLjrBZXCJ6E4g+QBoIQhoY4jGdt2kjoWmmA/kMqG9JgVBlkg40pm9ooc68uUcy6S82cehSj0zrb2zr1KByuMLHPIeu76mjN6Mjpx6UTQu33mL1UTA9JZirDCm17CtJ2QD8dAzrK1el8IPVx21sS/30mRFZiLIzb7olgWxkK8KRNfYgZG3Y5ibmbKkCjQcIC3Hv3hm9u4OwmxjzgcYgD1n+Qmble9FfYbOTukyd5qoRYxN6g3K0PEc0KmOIAeSJPUNm7wp+GKjv0YGe201hkEPqKMCYV3jI0r8l8TJW1pT94ekIyOWt+Ha4NTnTV2jO7wXjkDlxOEu/t8C6cmhMJc94MKLTAcHLsaaauQUBPUjEF50oI1RVvXxn1RY4rjZjDrtVzUm5gqUHZ6yUxEDrVLjZQbW8NmMfg4vnGcWZPPYZO6QLJLGJhzD698ANrncQjAx8f1avK7wV1n9Zl7Y5aWl9jfkUOSvT5pKdlM4tMMA+XtU43kGpmYrmjBrS78SM/ULQ++ZtBBiYDQWRyESiCRgHU74prN1+Emor2mxP3Pf5tyGSGwLbUdd/uXuPGA5op36193bzeKOX0ElZphhw=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ee0c7ec9-88de-4c19-b744-08ddaa85dad8
X-MS-Exchange-CrossTenant-AuthSource: DS7PR10MB5037.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2025 14:23:23.6850
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: au97CEB43BpVb+m6/rHJWAHXxaZMzopStPZQ0fooiJ4YR9rZ7nqv50Q2IcIIHNkoGQY9ykNDtFvFkwmaxw273A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB7677
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-13_01,2025-06-12_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 phishscore=0
 malwarescore=0 suspectscore=0 spamscore=0 mlxscore=0 bulkscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2506130105
X-Proofpoint-GUID: VolkgZMOv3N9pIZt2up6Adu_sBUOZWmV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEzMDEwNSBTYWx0ZWRfXxVWuIpKP9UdY aXWKpbAEpgLymtybL4J3jWAivzEMFpdLO5S3p5+GaQH6qIa/moVU9fdBBBFHuXUHJc9ntUO1F1N fANZkpC5WlthxsAOwA3NE2mOEghFW+lppZ5JHV3HhWOn/QcgiKrNpOPNW7fMt7L5GQVcILG4f7A
 qAI+M9eaxURgKYfiB0qYE92VcUp6kKIzuSC3jwMK8qN+D2A+YXmcOeWlVmbqGcrCtwyKs/3/rR6 pt8u+HyIVUq0ACMbya+FIgG8MaVE41Gps33RJHdjL4AuAwiy4hQX6hmn/W5qyUwf+qItbCSnD4B 1IC3WpVlmjd5botXZ7akuva/jdk3pyPxnnA9MM6Gm+PpA9my+RycNVKNixjunLmgrOu+p0NL6aq
 ebcWu0zlnp7OkiCfSpTIXhFAUm2ph6OLk+YUScQAWWEUMPrdGTup0OHvhwJZrtQw6KUG0PCJ
X-Proofpoint-ORIG-GUID: VolkgZMOv3N9pIZt2up6Adu_sBUOZWmV
X-Authority-Analysis: v=2.4 cv=d731yQjE c=1 sm=1 tr=0 ts=684c345f cx=c_pps a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=aSD8cYOpu3AViaNc-aYA:9

On 22 May 2025, eugene loh verbalised:

> From: Eugene Loh <eugene.loh@oracle.com>
>
> Commit 4aec5c9931eb ("dt_pid: pid grabs should be shortlived") made
> grabs short-lived.  No test cases show the utility of this patch.
> Meanwhile, the patch causes roughly a dozen tests to fail on OL9
> when the test suite is started remotely using ssh, closing ttys.  The

I think this is a consequence of another bug (Psystem_daemon() was
failing to detect that systemd was running correctly on systemd v2
systems, and we were falling back to the old approach, which is indeed
going to conclude that processes in system groups without controlling
terminals or associated TTYs are system daemons).

I have a fix for this detection failure under test now and will post it
shortly.

-- 
NULL && (void)
