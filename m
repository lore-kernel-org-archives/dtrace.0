Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1784A18E76C
	for <dtrace@lists.linux.dev>; Fri, 25 Oct 2024 14:31:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729866702; cv=fail; b=gCGx9rPQuoXXuT/SklSC+46ESHeuHOD+UE4CIX/4unOD3eEuPZ1mluVPrNTJFpra1R5w5GbIwAIkfC0Klc8YKt/GOytnQ2G9GeqKARKcvArgzbesnpmIBByEG8IN6f7Pr2aBr++RI7Hp9jufuyM/lL7VT+Xkq/gpJ2ZruN9JGPA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729866702; c=relaxed/simple;
	bh=IwmuX5OOES7MSjfy0OCtNSXZT/X1EBG0Jye+2Ofx8eo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=PxYOywmXlqZrRbU5F9RSYGs+POPjsinj9ZYJ39q9VcXTQvpOGWVSNZJ1eiQx01EClRyiOqRiYGmKUF/DCi1KuUa2R4pp71HS9SMBAnQewbvmJLoEaTN2V/xCmuOUqCJwkLrmVI9g9sJkK1b7+Qj8yZg0RUneJ9NPOXrevFGQnvc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=BAsxTQJa; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=Q+J9tRVX; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="BAsxTQJa";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="Q+J9tRVX"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49PDhjAf031722
	for <dtrace@lists.linux.dev>; Fri, 25 Oct 2024 14:31:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=VkY8iLGsSsFD+Pd8Bz
	QwrwvqzKiWyN44z87XECxHcWY=; b=BAsxTQJavXHO0o4XfGSDzq0T7SUzxEi7vx
	RtG2lj/BWJ0lMsRc8/QvrvyxN6R8a4ukPyeluDTmof1EhlCuYjMSvG6SgvzZuZbD
	QbpdwJVHJ21o43FyA2IjgCQzr2edn4HEqDNznaqmaiMxnmO9hh9BMA/vCBijTODR
	Gwqm7sH8YY5cyCEqIps/bhpJE1xseB2Ne8fdjbWe6imrH34hKapmi0iB4rtIs6sq
	AhoD9tCG7dbAHBQZgXgulOpSai4/MJl/dWvNWzxp6CFH58KA+gd749bzH0FTW/DX
	79fVkqqF3XtNorfFlVBaAmD/rslYYRkGUOUkGeivWVmF4WYcSgEA==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 42ckkr4atv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 25 Oct 2024 14:31:37 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 49PE1SAh008794
	for <dtrace@lists.linux.dev>; Fri, 25 Oct 2024 14:31:36 GMT
Received: from nam02-sn1-obe.outbound.protection.outlook.com (mail-sn1nam02lp2046.outbound.protection.outlook.com [104.47.57.46])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 42g36aju66-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 25 Oct 2024 14:31:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Rt+8aTSt1sjDXB8ZvDUAXRXfMxwxchnud52MH2U9FxbaFAbM/k3mJS3XSxMsjkEdNV+gLr8/pisHAo2FsgxYC7IohJhjRadWR3fBW3n/nQ7JP5ocFE02KI6aMK2L9frd6ibk9PgmAIJ+8BAhvaFlwt9AIF9nBpsFCZt/oY3d29sA3iRsWazM+5b24k6jn2XM36OouvwgtIp9/iOzFQ1xYpCwLcqXtBgfN/GiLOzflKXps/Y0nP5B6OYR19uYPB68s2swwNV2BTyvxip/CnbUDAlth/rg7T0qJKT7Zfo/nsv7rmeKy6hPfYnUQa8E1aJoToxhtmnCU94ODfXcSPnPlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VkY8iLGsSsFD+Pd8BzQwrwvqzKiWyN44z87XECxHcWY=;
 b=DJwfkggU7qLcVNXn86pm+sd7uEUjWA+fDYI/KJTH6wv0N48athdgDt22gn31qCNa3n6tuP32ZBEvhQkNCZIrlo+H6UmQh9LdHS3hpFUwYea2y7wN+PwRqBasxUmfHASbqenZfNS2Dl1GCPN9R7bRVswnaJp38szgGYi59uldjCtKMz3WGAqOjNzG0ad7v3hqo+RlmmTC7HGpUCYHnJ8xAyYU/L1OSa9nHrUskW7bVD2AGeucaFRnYUqZsmjMoMsKBhDE65ZfU46SzNequIXpdqQAilQ4O98vveF2hi4tCft2LyMlxdQoiZEPnZb4mNok8P9kVKob8O2WF4TjNH4yUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VkY8iLGsSsFD+Pd8BzQwrwvqzKiWyN44z87XECxHcWY=;
 b=Q+J9tRVXWoWzqnIf2XEO32JyCouabZYDsHXeUDk9jNctXjQw7xBmNTI7a67pnuUJBBnlpmaKC8alJfOjC5KQX3ZEzFfpk+VVPjURAkcMP9ZnTs5nHBxKoifZ9daAooZGaUEcnV77zNcOaU0bbaW8PX6mNgkGg6PGImKqEj5qbrk=
Received: from CO1PR10MB4769.namprd10.prod.outlook.com (2603:10b6:303:98::16)
 by PH7PR10MB5697.namprd10.prod.outlook.com (2603:10b6:510:130::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.20; Fri, 25 Oct
 2024 14:31:33 +0000
Received: from CO1PR10MB4769.namprd10.prod.outlook.com
 ([fe80::6801:f7c:753b:5a82]) by CO1PR10MB4769.namprd10.prod.outlook.com
 ([fe80::6801:f7c:753b:5a82%6]) with mapi id 15.20.8093.021; Fri, 25 Oct 2024
 14:31:33 +0000
Date: Fri, 25 Oct 2024 10:31:31 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: eugene.loh@oracle.com
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH v4 11/19] Support USDT wildcard provider descriptions
Message-ID: <Zxurw2VzAO5__LkO@kvh-deb-bpf.us.oracle.com>
References: <20241025063423.20479-1-eugene.loh@oracle.com>
 <20241025063423.20479-2-eugene.loh@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241025063423.20479-2-eugene.loh@oracle.com>
X-ClientProxiedBy: BYAPR11CA0097.namprd11.prod.outlook.com
 (2603:10b6:a03:f4::38) To CO1PR10MB4769.namprd10.prod.outlook.com
 (2603:10b6:303:98::16)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR10MB4769:EE_|PH7PR10MB5697:EE_
X-MS-Office365-Filtering-Correlation-Id: c2d3b48f-16cb-4c17-386b-08dcf501b964
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?qNBd4oYbyZRABEmmbgDgTA5pGlI0dOW6AF59Q+1r16+jbohSKg9yZPfoDKY4?=
 =?us-ascii?Q?iQkjjHUYZXtesu7uk2oSBOosZai8kT7oB/Xn19FKdhi1bmNRxqvtVIfLlfj/?=
 =?us-ascii?Q?6KPmUzezwf8e6wi8BXPw/SjaYkzaHcuDxh//jr64Snz1tj/vvdY4eA5gvw0p?=
 =?us-ascii?Q?64qQd/Xz/hCzooyNJcIDe+3qAiks/igvfDdrjm+5tPKkiNp0KkwgEc03ISWR?=
 =?us-ascii?Q?MPLsFix45iT6wM/2MUEuAwDD0yxWfqQPpEpO71z+VRpTuOV8t/cXu33Xa1oN?=
 =?us-ascii?Q?/0sqiFMAc64qOFmJ2I1GheupDQRaIhn3jYQDY1+5Wratn/OnYdcaTLIGk/vb?=
 =?us-ascii?Q?hwSahoDOJ7SY9jbma12QRwu5TOChgmbojs29jrwBjwpF8+pPj2sk9Jx6tSJp?=
 =?us-ascii?Q?HdF1V1SKSgVjpAjnKbPIM9kccq9kStdPm7cLuZ9BW0t2tedn8h4ATV9TjaCt?=
 =?us-ascii?Q?mxFQiDsElVaCZUvf5niopG+wzUeJ4Wm29zvAsMAqdrA3N8qe89zRsyt/DuOe?=
 =?us-ascii?Q?fSGl0sp3J295zddZzDIAM2jvq4XxSyl71h/OdHC4s14aong0RyFbefdbT2+E?=
 =?us-ascii?Q?nut9N0PXpkF+pYFAcKPLyLhet1vOJDxCqDgCFRam8qO+L1mdnwG4Z80qxGwK?=
 =?us-ascii?Q?ajvoKQIrNn5BD2N9felCQCH+IGn+hl2rQYtQpeOMHxpkqTmoRNBBs3CpIWNT?=
 =?us-ascii?Q?mtmls9U37+2azWvDytCFjfZTicqmAoHA4kmAajHVgUClU6xnJBkMfB5ElLci?=
 =?us-ascii?Q?GnmcmWkYc6kMnjlk4RpQ+jXAuqalI27+T4YTROBbBzNUH2pbGj2s+dJEzW0w?=
 =?us-ascii?Q?0a1ZVW+a77gA6KjjZh8HRyUQ0T1cUgiEGn5hW+QA04XGEjfWx/0R4k035JVO?=
 =?us-ascii?Q?ERQPy6xw7vSE4KL8CU4l4Lfbzxu9Qse1A3ucUfGti/3u88OhxuDMWa2m8aIY?=
 =?us-ascii?Q?SbN84XZxtlPFRabrKW16nXdCZiro+R8LU+IzfwUwTfYgh8hhzrZjAzeZrfql?=
 =?us-ascii?Q?PoO3opTpg+tg0hH2Sm/kJvKUY3gK62D1h9qth17DMT4E5deKe69IIyQPv02n?=
 =?us-ascii?Q?PTyN/mONYyiTbMk4mPHBTacOzJCntfuxxpyYDbl/wDTFV/v5UBBX6xTZ5HAN?=
 =?us-ascii?Q?IbyNABsM5imVsCTmZc/JhRYrdCfjJLCr8935Dv0UR3/EtmQUr7tftJrt9BeP?=
 =?us-ascii?Q?HfeFmo4DcgFS9GJFAXVSzmkCjra6/fQY8CfLNCkBk9tZtiHlmIY4aydNkr+m?=
 =?us-ascii?Q?S3ArpZhbRNtdZwycqUiZdMIprL1RLQ+jbU0snk5qpE1K9wfFLASH5YdgQsON?=
 =?us-ascii?Q?IwvYz2/lyd9gjUY+bokskxXy?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR10MB4769.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?WI07rm2v7qb3qTiSn9WSsgZyGbbQZN11OKpd2oswl469vEsCYPd/xoZ6CsUU?=
 =?us-ascii?Q?QfCPYQmsRM43ZvHQlWY/udlLPfHSyy3/Y87pkxo1qhKkOVa+uvKNSDA4OrxE?=
 =?us-ascii?Q?0q2Ew59yQT/3JeURN01dtGqaBqpLtwbysMMqfmWY9gNl5v97PfMDlunE/Yju?=
 =?us-ascii?Q?icW+KQjD4E9nGOLOMnMKSAWBJE37l+osHxVS2LF4znnazQP6npB5JOBv6LdO?=
 =?us-ascii?Q?EQBugJxQlawIkJZKVbWyv6S5VKrsQ/NJFZI06o6N/dD+sWWJQp13PC14+Rlf?=
 =?us-ascii?Q?cyP/FVuGanWG+wUHkAvLOs+dd0sPm/8w09MXfi/b46TTYHT5mKuybxe35nVp?=
 =?us-ascii?Q?09hXBzP1SACeYAN46XhrQp/oiPpaJl+eyswUn2Mi6pUN+BqunE9e5qMY9Jwr?=
 =?us-ascii?Q?jmrw6JWejJGFN1QywThVjNvcwXdtT/NdAHjpYu99Cih+XgQCYnhGa4adunKu?=
 =?us-ascii?Q?aM8IpgD/1tTSzTTZkSC2a+mDlADeuSwa+Z1iL1ZA0ODPWa4mX319hzQw8R0f?=
 =?us-ascii?Q?emKMOdlhchDGtYI2dSaU++g79DjRilJ5YlvQHViiVlhwIuPyfrBiuDUYbrc4?=
 =?us-ascii?Q?jPNTWQOCarcjBQNjj5v0wwNQawKjjehpoGAe5wc5HHdxIGVkUT1d5+2llAuD?=
 =?us-ascii?Q?PUwdtMFVmXedBLX13BLek1tfEM+PR6S0+TuRX4Ps9X/lFE1F0dgadxxjfGgx?=
 =?us-ascii?Q?n/OKwpZuofXOS/75/P7A70HTcS7pvOSUnFYBiBvnjKDMLp925XBKV39oaQq0?=
 =?us-ascii?Q?pcBt47PB2cnqSdv8bfE6UowYTIvd7rzWwAH6YGr6y19dUpYBl848++PTZEC2?=
 =?us-ascii?Q?NVvd81dqn1w1PJYSrhzm+pWBEgzbBZyOIt5bANLS3j8yhozFrFXaJrMOW2Yg?=
 =?us-ascii?Q?iLYNwKXAnqnDAmTm8jC0SpQ/Nx0DCBGq8TS/6u/cGPym3EmgO6UZW4UxfuEn?=
 =?us-ascii?Q?EE/bx+ZvE3AURFa+zELgOaaOL8MN0ot/DYXQiGdhY6f03oVzqs1DUev9OgCs?=
 =?us-ascii?Q?+49VGKMSRbl4bzcGG2IABddobvpl5a3o9K14TUNBEIHnENZc8+405I97QXTf?=
 =?us-ascii?Q?XzCWp0Pi4bCLz+5khjZ2u0dYnna/RVeFfMNLzO0w+RTUFzHtbeTJRSGUZr4D?=
 =?us-ascii?Q?xPyZ737VOrqXEtRqgctLaqcdcwZ+f7yLd1g6Zi8eEOyv4NeUl+laHfy6t8Nq?=
 =?us-ascii?Q?C8Pbt2uW/DelzL3AMRgMsAVfyp2F6H0wg9riKQ3G0UjXz1DbDeIsCHuRqFwq?=
 =?us-ascii?Q?I/SVBOGPc1gpTNEHcO/kkM/YJoJpliHNJwfM1LvPzBcLIsAxlq2g8jqrmh8H?=
 =?us-ascii?Q?gE2nTb5DFQ8tQRMf1Mqse8ziW5cDcGDDPhQFn+M04ROfO8e3iLqykC0D5Zon?=
 =?us-ascii?Q?nCBo18EHlXzUXTuCWudVEW2Mb3PCw7qUXBXuaXIYBZDriKni6fJoG3Ei1F9t?=
 =?us-ascii?Q?v0IH4vTr7gIhz2EcsCSzhAtDsbtqr2N8sITnt7qdJduaGSok49XeBZWCMOg3?=
 =?us-ascii?Q?cnFLffU2k+5LkWwadPkdjAAV8BxclJqs/J4fEBzGoibTovlOk2ZVegxQAcJS?=
 =?us-ascii?Q?RKC8BLTtTUFdxTfe/NDHI7Wt8pCHY6xbj4fJGOixzn35u6ev8EWv+t2SaHRq?=
 =?us-ascii?Q?Gg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	XntH4A2z5y1MsSt9n4K0lcPImeT2uh4nQ3CauO5Z3GHJZUhGGwxRvJw3HloTueDYkYR5LQ4mIuP779XSSk0sxrcu8+ch5TjbZ4LUjvdGX87p+ymQD3T2YVAJSuUBfr6aSDlc8FtlLTYRTR8+rOd4KfyazfQnlqii6nxOgXnFwZ6qGXwCgJ9Ak63GxYClPIrigLmHuEDMYp4nQnmKUGmNt3di5J/KFObXN8DTk/ZLJ+5kExYjiRz4s1iXkHe0Y7+HG1Wi2QYRvHWGPmbbvSB6WDfDIwr63KtG+VrI5i1sBviv+yy/FoImKt+AaAyBpcyOaNogHeD9Gezxs/6nkNB9TaeS8aHbSQ5+Wi5BzNZTKP9ZQ5tqPdcqCZX1W5jDM6N9KdhMHuLGIoMDRZU4ADkfWZx5ntuZYxPi+ZZLgcTD9LSxefwFxwUGI8hOyqYcmizRE+l/UzepQTtgjuNUBARvQoc1odD8sEkGbS075q6wAa0rIMNwwkxNrT44t2K535vzfOKdbMyKADQ1WcJdPNcXMq2zxbkEGGeHjcTzuKyIjlxQAme648dLV37ieYErM8yrv8RxM/94VEuMT2tt45OVsAc4zOwmH1quPkWB2bBFuMI=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c2d3b48f-16cb-4c17-386b-08dcf501b964
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4769.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2024 14:31:33.5510
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xbi68ER6o8SRJMwHJdtlgVi5fdQZ00tNX6hCpX4AG4zGl+9KHvpHuSJPYQ4SbzspwgZEp2Li4aCnunnOJ0xK/iCrjZuJwwYTf/zn6kzm76M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB5697
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-25_13,2024-10-25_02,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 mlxscore=0 mlxlogscore=999
 suspectscore=0 bulkscore=0 malwarescore=0 adultscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2409260000
 definitions=main-2410250112
X-Proofpoint-GUID: zfW6cV-g5yMzcqdJFdHTGE7W3sKOEiZ2
X-Proofpoint-ORIG-GUID: zfW6cV-g5yMzcqdJFdHTGE7W3sKOEiZ2

On Fri, Oct 25, 2024 at 02:34:22AM -0400, eugene.loh@oracle.com wrote:
> From: Eugene Loh <eugene.loh@oracle.com>
> 
> To look for pid probes, whose pid values must be specified explicitly,
> we can require that the provider description should end in a digit.
> 
> For USDT probes, however, there can be wildcard descriptions.  This
> includes a blank provider description as well as a description that
> ends in an '*'.
> 
> So, get rid of dt_pid_create_probes(), replacing it with
>     dt_pid_create_pid_probes()
>     dt_pid_create_usdt_probes()
> calling each one appropriately.
> 
> This is rudimentary support.  We still need to:
> - handle globs in dt_pid_create_probes_module()
> - add process monitoring / inotify
> 
> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>

Reviewed-by: Kris Van Hees <kris.van.hees@oracle.com>

> ---
>  libdtrace/dt_cc.c                               | 17 ++++++++++-------
>  libdtrace/dt_pid.c                              |  8 --------
>  libdtrace/dt_pid.h                              |  4 ++--
>  .../dtrace-util/tst.ListProbesFuncUSDT.sh       |  1 -
>  .../dtrace-util/tst.ListProbesModuleUSDT.sh     |  1 -
>  .../dtrace-util/tst.ListProbesNameUSDT.sh       |  1 -
>  .../dtrace-util/tst.ListProbesProviderUSDT.sh   |  1 -
>  test/unittest/usdt/tst.forker.sh                |  1 -
>  8 files changed, 12 insertions(+), 22 deletions(-)
> 
> diff --git a/libdtrace/dt_cc.c b/libdtrace/dt_cc.c
> index fa16f8e5f..eebd923ce 100644
> --- a/libdtrace/dt_cc.c
> +++ b/libdtrace/dt_cc.c
> @@ -262,24 +262,27 @@ dt_setcontext(dtrace_hdl_t *dtp, const dtrace_probedesc_t *pdp)
>  	int err;
>  
>  	/*
> -	 * Both kernel and pid based providers are allowed to have names
> -	 * ending with what could be interpreted as a number. We assume it's
> -	 * a pid and that we may need to dynamically create probes for
> -	 * that process if:
> +	 * A provider name ending in a digit could be for a pid provider.
> +	 * We may need to dynamically create probes for that process if:
>  	 *
>  	 * (1) The provider doesn't exist, or,
>  	 * (2) The provider exists and has DT_PROVIDER_PID flag set.
>  	 *
> -	 * On an error, dt_pid_create_probes() will set the error message
> +	 * On an error, dt_pid_create_pid_probes() will set the error message
>  	 * and tag -- we just have to longjmp() out of here.
>  	 */
>  	if (pdp->prv && pdp->prv[0] &&
>  	    isdigit(pdp->prv[strlen(pdp->prv) - 1]) &&
>  	    ((pvp = dt_provider_lookup(dtp, pdp->prv)) == NULL ||
>  	     pvp->pv_flags & DT_PROVIDER_PID) &&
> -	    dt_pid_create_probes((dtrace_probedesc_t *)pdp, dtp, yypcb) != 0) {
> +	    dt_pid_create_pid_probes((dtrace_probedesc_t *)pdp, dtp, yypcb) != 0)
> +		longjmp(yypcb->pcb_jmpbuf, EDT_COMPILER);
> +
> +	/*
> +	 * USDT probes.
> +	 */
> +	if (dt_pid_create_usdt_probes((dtrace_probedesc_t *)pdp, dtp, yypcb) != 0)
>  		longjmp(yypcb->pcb_jmpbuf, EDT_COMPILER);
> -	}
>  
>  	/*
>  	 * Call dt_probe_info() to get the probe arguments and attributes.  If
> diff --git a/libdtrace/dt_pid.c b/libdtrace/dt_pid.c
> index 62060b592..35cf73ee8 100644
> --- a/libdtrace/dt_pid.c
> +++ b/libdtrace/dt_pid.c
> @@ -1207,14 +1207,6 @@ dt_pid_create_usdt_probes(dtrace_probedesc_t *pdp, dtrace_hdl_t *dtp, dt_pcb_t *
>  	return err ? -1 : 0;
>  }
>  
> -int
> -dt_pid_create_probes(dtrace_probedesc_t *pdp, dtrace_hdl_t *dtp, dt_pcb_t *pcb)
> -{
> -	if (dt_pid_create_pid_probes(pdp, dtp, pcb))
> -		return -1;
> -	return dt_pid_create_usdt_probes(pdp, dtp, pcb);
> -}
> -
>  int
>  dt_pid_create_probes_module(dtrace_hdl_t *dtp, dt_proc_t *dpr)
>  {
> diff --git a/libdtrace/dt_pid.h b/libdtrace/dt_pid.h
> index 9277c6bc0..c35adc2c0 100644
> --- a/libdtrace/dt_pid.h
> +++ b/libdtrace/dt_pid.h
> @@ -16,10 +16,10 @@
>  extern "C" {
>  #endif
>  
> +extern int dt_pid_create_pid_probes(dtrace_probedesc_t *, dtrace_hdl_t *,
> +				    dt_pcb_t *);
>  extern int dt_pid_create_usdt_probes(dtrace_probedesc_t *, dtrace_hdl_t *,
>  				     dt_pcb_t *);
> -extern int dt_pid_create_probes(dtrace_probedesc_t *, dtrace_hdl_t *,
> -				dt_pcb_t *);
>  extern int dt_pid_create_probes_module(dtrace_hdl_t *, dt_proc_t *);
>  extern pid_t dt_pid_get_pid(const dtrace_probedesc_t *, dtrace_hdl_t *, dt_pcb_t *,
>  			    dt_proc_t *);
> diff --git a/test/unittest/dtrace-util/tst.ListProbesFuncUSDT.sh b/test/unittest/dtrace-util/tst.ListProbesFuncUSDT.sh
> index bd0552dca..99ae995eb 100755
> --- a/test/unittest/dtrace-util/tst.ListProbesFuncUSDT.sh
> +++ b/test/unittest/dtrace-util/tst.ListProbesFuncUSDT.sh
> @@ -5,7 +5,6 @@
>  # Licensed under the Universal Permissive License v 1.0 as shown at
>  # http://oss.oracle.com/licenses/upl.
>  #
> -# @@xfail: dtv2
>  
>  ##
>  #
> diff --git a/test/unittest/dtrace-util/tst.ListProbesModuleUSDT.sh b/test/unittest/dtrace-util/tst.ListProbesModuleUSDT.sh
> index 7b9c6a5fc..5ae087fbf 100755
> --- a/test/unittest/dtrace-util/tst.ListProbesModuleUSDT.sh
> +++ b/test/unittest/dtrace-util/tst.ListProbesModuleUSDT.sh
> @@ -5,7 +5,6 @@
>  # Licensed under the Universal Permissive License v 1.0 as shown at
>  # http://oss.oracle.com/licenses/upl.
>  #
> -# @@xfail: dtv2
>  
>  ##
>  #
> diff --git a/test/unittest/dtrace-util/tst.ListProbesNameUSDT.sh b/test/unittest/dtrace-util/tst.ListProbesNameUSDT.sh
> index f9b1d8bf8..5c0509d89 100755
> --- a/test/unittest/dtrace-util/tst.ListProbesNameUSDT.sh
> +++ b/test/unittest/dtrace-util/tst.ListProbesNameUSDT.sh
> @@ -5,7 +5,6 @@
>  # Licensed under the Universal Permissive License v 1.0 as shown at
>  # http://oss.oracle.com/licenses/upl.
>  #
> -# @@xfail: dtv2
>  
>  ##
>  #
> diff --git a/test/unittest/dtrace-util/tst.ListProbesProviderUSDT.sh b/test/unittest/dtrace-util/tst.ListProbesProviderUSDT.sh
> index 644da2ac2..6eae82ed9 100755
> --- a/test/unittest/dtrace-util/tst.ListProbesProviderUSDT.sh
> +++ b/test/unittest/dtrace-util/tst.ListProbesProviderUSDT.sh
> @@ -5,7 +5,6 @@
>  # Licensed under the Universal Permissive License v 1.0 as shown at
>  # http://oss.oracle.com/licenses/upl.
>  #
> -# @@xfail: dtv2
>  
>  ##
>  #
> diff --git a/test/unittest/usdt/tst.forker.sh b/test/unittest/usdt/tst.forker.sh
> index 7cfa9eb5f..92513eb5d 100755
> --- a/test/unittest/usdt/tst.forker.sh
> +++ b/test/unittest/usdt/tst.forker.sh
> @@ -7,7 +7,6 @@
>  #
>  #
>  # @@timeout: 120
> -# @@xfail: dtv2 USDT wildcard
>  
>  if [ $# != 1 ]; then
>  	echo expected one argument: '<'dtrace-path'>'
> -- 
> 2.43.5
> 
