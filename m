Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A50A128F5
	for <dtrace@lists.linux.dev>; Sat, 29 Aug 2026 00:08:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787962124; cv=fail; b=lC5808aZ3XuXxJtcNlFL5X0C5ls1jt/WnA3Z0s6rXrIo9BQDLivXFAi8sm6Ei/xH3S2CmZiOpAxik7NVUyRK7uy98Jhd/0pRNE50cRDYy658odUpW9tSluX4sbhBHvA6Lv7vIspgmaQijKm3QgL0KBLxBVa4c531r0iDnN6sxaU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787962124; c=relaxed/simple;
	bh=AAEkkX5ZcXR5xmJrbqhz0I8aDYPvWBKU1oyl/paiXe4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=lxjY9i2btBj5jI4TdbiNq2eyzlXbLI5bWxeCXLj2EElqkg78J2G3Wa2fab+u0h4qiX8ckzlJZgo4GaPaXpik9LdzvstiqpPKbkxtVX+QHOduO+LzdxNz3vgiNRKxeCnrKbSWeTJcSobxoGisYYSEMjhcF8LorCUOyegZX9A4FkU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=igWrCH02; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=x1Z0TdkT; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="igWrCH02";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="x1Z0TdkT"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67SHJv0X3086430
	for <dtrace@lists.linux.dev>; Sat, 29 Aug 2026 00:08:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=iBp/dSxaGFhx1hLKmuOuyb8YmCWVN2i9XmolAZNv++I=; b=
	igWrCH02VnGXbdCqt6+SJEzZa2+Wpif++D2eah2Af1Lca6P8dXTkFq/NJUapYXEk
	t10O9hJcD4WtTxKhqsUN0xhX/yPZdhbt6pGIidqQIYPS+jZCBssg27GzZlrZgiaQ
	X4LxQ4wMCjLh313xABHzqDKLbKI3XW3rgIqICH5iD/5thLl7bAP39N2BXFGeMBLB
	OIrADgH4P1+t0IFDSgpHkmbOGhs1yhVTVqKAC/CyjWXW3+VdQl4GtwvW6AH3aklf
	AVJO7YxJ9N3zAA/CVn8nENxQtkgm1TcaZj1VLntC7IQpEFMvz6teQB/3fXdfBtnK
	9OF/GlN2v/iMFcEtynlZ6Q==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4g726btph4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Sat, 29 Aug 2026 00:08:40 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.7/8.18.1.7) with ESMTP id 67T058tD038901
	for <dtrace@lists.linux.dev>; Sat, 29 Aug 2026 00:08:39 GMT
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11013061.outbound.protection.outlook.com [40.93.201.61])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4g84bv5wgy-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <dtrace@lists.linux.dev>; Sat, 29 Aug 2026 00:08:39 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PuHAYIE1pF0bS5hQI6EXAhzfIkcH9KPBvvkGLL2z35A5B6VvijUOF1MUe34k85F8svAAhspTxvxL9suDtKi2omXZQT3R+t6k72l+VeDLTOtSqqJ8/aDYvRp3QFnfqA8IBmDWe0LRK+6iQK7J0OYcP1CinrIOxsnE5FC0nRGGLZeRf2WSdT0f5aeYnO8yi75qNNMuPQpHADgVY8UsP9uBrZjpRDeRQXCCAtznniua64hSNoCSU2Ak9++hTF9/K2KNnPwYwITYr6BA7HI9fmhFBmcAlP2wlWu8adIHaTk/2Sp+DnFE6qLFlFCfm9o+PPB2nV8ILN4ZHvoNz/bEbuC1Ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iBp/dSxaGFhx1hLKmuOuyb8YmCWVN2i9XmolAZNv++I=;
 b=XWaVRNcUM6e0TBrMpLUu4mM4+KlIBzLCSegE6ZLKI8dUVtdXey1r6ZXEJ8+iAfQWfoakxTo5/oPY05Os9H2nNmS/wMr/T4z8cWngd2PjSgD8FD+binMyr4e9rhW+ZAV6IOka5AMAhDmsw0bw1KbiW+LXSBWxUxaiEvEZRvPrSd6gIhpJFf+zv2x31MiNgMAIv1YrCUEbBYpOuwT1oUno7vegPSUuC/XsyWNmAsh0KgT7/kGZ4hQaJXXIp5cWXf88xJIokMofj2RhHQwbNmShcCpJWnfL7S+5ir0v7HbhJbiECTCM75iaJcbDa+vU/HrIJHYMfZ0L83QiQXqZyEDbrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iBp/dSxaGFhx1hLKmuOuyb8YmCWVN2i9XmolAZNv++I=;
 b=x1Z0TdkTJyTVTCjwWKaPtwfQaDiPdLvB7pyve2v2hhP3YXQHQbseDWsPrbmHTE0WEAC7vzXMwXYE3cJaOHZM3AZFdSlZWnFE89icbO77ltbB0Nrz4046wlWN5Dh/HdKI28DoL8sGvD0uy2MbNECAMcBxbfXH9Go03x4W+O4kVpU=
Received: from DM6PR10MB2476.namprd10.prod.outlook.com (2603:10b6:5:ae::24) by
 SJ5PPF2D96878B0.namprd10.prod.outlook.com (2603:10b6:a0f:fc02::79a) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.8; Sat, 29 Aug
 2026 00:08:34 +0000
Received: from DM6PR10MB2476.namprd10.prod.outlook.com
 ([fe80::7c07:98d9:2030:e537]) by DM6PR10MB2476.namprd10.prod.outlook.com
 ([fe80::7c07:98d9:2030:e537%5]) with mapi id 15.21.0382.007; Sat, 29 Aug 2026
 00:08:34 +0000
Date: Sat, 29 Aug 2026 00:07:37 +0000
From: Kris Van Hees <kris.van.hees@oracle.com>
To: eugene.loh@oracle.com
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH v2] Remove spurious references to Oracle
Message-ID: <apIiya3pFd1s8g6o@kvh-deb-bpf>
References: <20260310213639.20660-1-eugene.loh@oracle.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260310213639.20660-1-eugene.loh@oracle.com>
X-ClientProxiedBy: PH7PR17CA0042.namprd17.prod.outlook.com
 (2603:10b6:510:323::21) To DM6PR10MB2476.namprd10.prod.outlook.com
 (2603:10b6:5:ae::24)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR10MB2476:EE_|SJ5PPF2D96878B0:EE_
X-MS-Office365-Filtering-Correlation-Id: d3bc1110-73ca-472e-9891-08df0561aa7a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|376014|1800799024|10067099003|56012099006|6133799003|3023799007|22082099003|18002099003|18092099006|5023799004|13003099007;
X-Microsoft-Antispam-Message-Info:
	/E579WeaZM8kizYjLwtcbMs3Qz3M6cXkYhkdWi70WqJkIpKdYYN1AVemALfvWSYYJ+7JF4Ii1wiKvr2AxWY2pPsr27B6QWun0J0rW8pjc4FHJlqNRErxpDfMY8ILCa5yNjQxWBv2e4X72el837uZD05UwdtWUkxt1+ngAOIVGjbq2c3ewGpfvKhJmKVtdzBuN575xyC3kHPDAZNYZgNpF45PTQW6d6Nzzt8So71ueRjWONN1QpfE489nqCTLUYXgqpezVz4NmK7/zXghI1xLyZzd2VScq1A1KIf+9PFmUbP4TQPHr6PZzO5UBfUb8hLumwS32ZzzUHcoNiOwa2pexCcnPt4BhorWiqyX8l+T4P0B//dyzLALsAi/OCeKoe2u987Grud8nNC7NDP6U41LSsDOgKhYo17oV54xShaxhYdk8qxs6jRFcB/d3C/x3mwro6lwaluRnj4djF2gGDFP38ZxvFf+LBr5WGvDSo/o5oXIP5GkaBQjjqlDymPHbwLKQkPYnZ/AFxdFOQbBVfDkKBZ/JPD3GziPTvUQ4ZJ5bZO2DHrCkte82dwBbMmhjwm6IM8V+vQbjb0pmBKFtGRwmpAfgYXA50R/yxkSJwOa5eLVHKDJ+8ufQPQfqv5JEl/Gawo0YB+T2LfPQDI6sTW7G/k1B8fkAKalprOPh482kkg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR10MB2476.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(10067099003)(56012099006)(6133799003)(3023799007)(22082099003)(18002099003)(18092099006)(5023799004)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RGIwd1RMOHVsVElDbXIvRUtpbkZ6RUcwQ1hjZ1pkeVZGOGlaTXRTTU0vSWVm?=
 =?utf-8?B?QUluZWl4bWd6SmFWZUs4cTlyM3RON3l2Z3d6Yjh3OHd6WkhQZTFTRWxRejRL?=
 =?utf-8?B?WVhXSlpwUHpwOFlCd3hTQnhSeW5zR1hKZ29ETW16TEdzL0pPUGRBc2FtZ3Vy?=
 =?utf-8?B?QTVTeGF3WmZ4VlFKeUdJMlZXeGhYOVBWbTRGZE9JMkthenVwdG90bERVbllD?=
 =?utf-8?B?ZFVuQnNmVUU5MFptckJ3dDlzZStRbC9lazljUGw4ZC9MbVdUQUVYLzcyZVU2?=
 =?utf-8?B?RmVwV2pxVXdpK0kveDU2azdiVWkreUtTYXBKVnhhN1pyTjJUQVJpQUx0d0hD?=
 =?utf-8?B?RytxTzc3WjlPRnlHMWlsZEtjeTFtOGFTMlg0bzN6cDNTSXhhTnhlWkVSSnQ2?=
 =?utf-8?B?Y3RNeVYxcnl3cHNPWUxZYlRmUDFuOHBsL2wvVDh6UmhwbjlNRWVPV0IrS2VS?=
 =?utf-8?B?RDJRV3VsWGE4RXl1ZytTblhiMnd0allPc2cwenVSYjJSRHdobUpuT0VUVHJ5?=
 =?utf-8?B?UnZyejdNd083ODVsWUoyemUzSTl2c1FwOHZzenpTSS84Rkt1TFh5ZzEzK1k2?=
 =?utf-8?B?c3ZOQTVoUGxvcWhEYzVVUmVoa2NWVmNZVFpRMVo2UVBnclZkMnJXOUw2ZVhh?=
 =?utf-8?B?eml0aFhQc1JRRWFIZ0l2U0NXNHdKNGhZN1VmYWtPZzBKSk9RQTQ5em9CcUt3?=
 =?utf-8?B?Z0V5WnhQQTRjWnhpSHlodmkrQSthL3BROXlTa2oxaEp1NmF5T2didm1LR2E5?=
 =?utf-8?B?bXhZVU1VaWN0N3ZvRkRtUU9KVkxPbjhLcUY2R2tRQUVWblN6THJXRVBSQVho?=
 =?utf-8?B?VjZzWmhNYlVpdFgxUDFrQTMzZUwzZzNoRE9xb3FZd0VJZ1FMMXhVSE1FYlpU?=
 =?utf-8?B?ZHVLVXRrR1A1c3FFV3NobDh2aW9NZjQxMDJQa0VHTk82azBsY3N1bUJuVG4z?=
 =?utf-8?B?c1E5L0d3Z0V0ZUhuUzV5RW91S0toTHRpeklMT05zaFhwNUN4enJkeDBLTzJp?=
 =?utf-8?B?S2wxUFh0ZE1WMlZzaDRJdjlOS2N5TEdMeU12dmNKbllWSjJlN0FHQUw1dWxy?=
 =?utf-8?B?WWNpNGl4eEZVcnlsZUp5UUM1VW1vTjZVOTlDbTlsbm1jcTM5TGU3QnNCYXFy?=
 =?utf-8?B?emV0azk3SjFqc0s2c1Vsck14WkU2MmUxcm5aMjdQRzJtYUhIRVZ0MmlnQ09M?=
 =?utf-8?B?b2NUZ0lGMXJBT1llcXZVN2VGTWtvczdqWTU1ZENmbHI3MCtKejdGMFNlcHBl?=
 =?utf-8?B?bWxYOHNCVE1aaDMvQkdvTjVVeDMrVHRkNEVoRnZmejVIYjI1NjVTd29VZkc5?=
 =?utf-8?B?Z2cxd0t1TjYxNWZDdTVBS0Fmem9zTDdoczNxV1YwUVIwdmsvTGRsR3Z4amZV?=
 =?utf-8?B?c0RhZjNUOG9ZR0FtZldqeDdRRHRSSDgxRm1CVjNCU0NES1Ayc1J1Y1FIazNn?=
 =?utf-8?B?T1N5ZzBTWC84QmVpakY3Rlg5cTBPWWd4bTJxQ1VwcHc1V1hWR3RENDZZMktr?=
 =?utf-8?B?dm00NWJ5MTRMUWRFNG15aTdBaFNwWlhhdkpHaU5VY3M4clgzRFlRclMyRFVI?=
 =?utf-8?B?T0RsRmNKcnF0QUxESEY2NWk5WUIzWVpibDBpVUc0L1Bnd3EyVlY0UTdqMFVH?=
 =?utf-8?B?RzZRaVBSYmpLL0tma051SUxhaTNoT2VrYXdBUTBPS09tWEtxb3VmWS9KbVVI?=
 =?utf-8?B?V1ZUQ0xwcVZMYWFWbGR1czZyRVZZZXVSQlZUajd6K3dSdk8wZlFHNGkyNjR0?=
 =?utf-8?B?ZGpHUFpRNktrMmRqNG9yd0hXaU5pK2JGM3hnbVZWbXZyUTczaDg1bVdmZ2R3?=
 =?utf-8?B?ZzlFZVROaFlpbmlMU2hoWmFxaE9KWFhPejBXNkY1TE5sZkJrVisvSUF0ZG5i?=
 =?utf-8?B?bkpXdEFsZkpQb1hrU3EyakxBVVdNQitlZEZUU1gzQzV4MXNDYnRlQnFKZUZP?=
 =?utf-8?B?VHZiRnFXMllhaHpMZisxSzJISlpuTE9PZkJZenE3YVZITEZOR1VCRnZhNnRG?=
 =?utf-8?B?MWwzQ1hNTUtQcFpFaDM3c2tOMnRBNjYzY1JZei9LSWlzMll0eUlpNFJDZWdq?=
 =?utf-8?B?NmwrMDBDR0VzQUZIa0hjWXhrRmIxRFFodnVudjdxbmxhYkpLaWgwSldIdE93?=
 =?utf-8?B?OE9EZUoybW1BREkxUE9vNzNGNjk4bXJVaDhSK0FPS0hTSnNrRFdtemFzODZC?=
 =?utf-8?B?SENzQTF0UFRkWUhUaVRKbWFDM3FIMDk0NGltSlplQ21OM25NYVFOSS9BMlVQ?=
 =?utf-8?B?M3lUblBhV3VCRkdEU0NEN2NLOVpJMk4zRE1nL2lCSHFhM0NxY1I5Q0xMem1w?=
 =?utf-8?B?L2RBTTFMRS85SGk1SWhXTnpBQXY0MGpzVkFJVGUyYXFvNFgxZG15NkxoYVFo?=
 =?utf-8?Q?fKxeHqoOHOcm8tko=3D?=
X-Exchange-RoutingPolicyChecked:
	L5d2YJbvhdZcMKDlj4vZbXs0wG1SiQaikHwV1JWnDMkNl98vQHkWctP7eZXooukMxOpURJtPRPYnpOq8mKsdO0x0DtHelSd4jExhUj8Dj4O6h7fbiJzP8N4oULujK0pQs8AMxA/Jb+yl6jaC8vRbU6XL+4uSgfeOVLNQONuLF60nAEO+Dz0m+8e//FSSvwRHYa3tA0EPYT/xCjHPYemuiN9/Js4JfQ3+zNOGnQFzEn0OadNbP6oAv6hoJh7qdGtMnXA7B7AKs1cYnP3hjBOA+v2ouTWt1IULiPfstxGGRfFrF1SYPjKNj/rRxgqetjKa53FRdP0LuHyuHi1vHhCttw==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	kK7zzm0ej+m1eV6IFgWl3j5o4PWe4gtDYuGQwhr2SVNUcHVzmhWcHTwBpCw5wO6VlJOtAyKGTt5UaSBoO7nypLQQoncCNICBxJdOIcqgT1Ap5VtQKreymvzqJz2HFgh9BMmSIOyg4lnjMb1IMOJIPlwe5Ql1dh5BswUHGObTAwY7L1YMPZa+g//fklTiGT3Pu8aL1JR0WKPqhnalL4kk6jFWnb51Ookz6JqAZwCoHJIXz0vhfG+jufSXh+Wg2f5Bq8+AcWgU+RPWcspW6cy7o2SWydwNwaUzofrBV8x6nc8Pcixa/oMAmELwEbE1Z6kDxSeJLV28Vmdp7UKujJ8UoYE1TXk2wl2tyc3JWjdRjMHUS/mijweJDCTC9R8yGbdetu051kXfvAkw6c1lotM4S3UePS/3spxkTTB5YaKUkb7VETb5tbe1wN0oDDnKmVcDi7+am5PHKKlqL99L0uLrd8ts0+vNSjCFMF53O0G5J7CNADUGr4GxUkQOOJDG3oOxcZvWamEIkME7s0QPNG52lqayGQhpb2L9j7xjdstxZmIR237CxQM2HSKJt/qGOZPHbOgbeJDJex0E9FWZrn/afVKJ7vDVZRKizhwWBRlAjTU=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d3bc1110-73ca-472e-9891-08df0561aa7a
X-MS-Exchange-CrossTenant-AuthSource: DM6PR10MB2476.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2026 00:08:34.1637
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: L3gtEY2vvDxdCbpIq9nDumneYo8yhJvslDrAFOnqEG9VgU60v4EIlgj8t0TXQm7lWrcwESpmX5RRdy441hICz4zDDTgUihs5HWQycj/GcFQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF2D96878B0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-28_07,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 bulkscore=0 malwarescore=0 suspectscore=0 adultscore=0 mlxlogscore=999
 spamscore=0 mlxscore=0 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2606160000 definitions=main-2608280210
X-Authority-Analysis: v=2.4 cv=Q6niJY2a c=1 sm=1 tr=0 ts=6a922308 cx=c_pps
 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Sv0fKeRqtYgA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=jiCTI4zE5U7BLdzWsZGv:22 a=x4eqshVgHu-cdnggieHk:22 a=yPCof4ZbAAAA:8
 a=4USPakw9toPsW3pmUYwA:9 a=5xYgSrfLL2HhhPCI:21 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI4MDIxMCBTYWx0ZWRfX/2PVbj83RKqj
 UUdz6koZqUrwUBtYMhio7gsbREiW3cpY48mae5etpSgW7YmPRbGgZSBKGTFOFrKXdo3FRu8YSwp
 8ZLPpv025M6OZIwsWV4s99Xhk9ksvYAU5JFFLtOOr8cZyo5xSPdXzl2cyHZAF5tzSMzkaqzLKqM
 Q6tJAbQBwsYdodi2nN8pTIicHhau87dMKaoZHPd6lYkE8D9WemZnzHLYKFrAiQdq1fzPIeLlSaG
 Gjcg3mtFFr+s4r9QQNLCI48lsa2bORnz7VTs0Ow6DEsvDmx0lNwBio2oyBW+seefUU1IOYqFLBU
 axu6YqEFdJvaL9xl16ejZEhgtUbAyKHVSSfnyn5lw0FNGB18gtPQzFYzMOHhtzsVEIqW1sdHHin
 w8ttKDJ4j8NiZDNsySqFK1p7EmKiHrremq2j64tFf4TzMYJ7D6q5+CycurCOZG5eEO1LvsouHA+
 MESSF0tMr6BrBsNDPaA==
X-Proofpoint-GUID: IkmgH8cJ9M0-2rm-cq_3PWMTOJc9q4VB
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI4MDIxMCBTYWx0ZWRfX3+eOxAmOrxcf
 uCszVvysm3xJQpn1ZtSSp+xd+sLiQZ4ndtMrVGLUsHSWF/TCFFRk5/0My2T6Lmdy2scBCkdAReG
 DVXY+Ix5CtBDkL7t6+0zQh2wOQXooRGsVdcQMgAGjvfgwLZJRikE
X-Proofpoint-ORIG-GUID: IkmgH8cJ9M0-2rm-cq_3PWMTOJc9q4VB

On Tue, Mar 10, 2026 at 05:36:39PM -0400, eugene.loh@oracle.com wrote:
> From: Eugene Loh <eugene.loh@oracle.com>
> 
> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>

Reviewed-by: Kris Van Hees <kris.van.hees@oracle.com>

> ---
>  README                                        |  2 +-
>  cmd/dtrace.8                                  | 22 +++++-----
>  doc/tutorial/1.IntroducingDTrace.md           |  4 +-
>  .../2.TracingOperatingSystemBehavior.md       | 44 +++++++++----------
>  .../3.TracingUserSpaceApplications.md         | 16 +++----
>  dtprobed/dtprobed.8                           |  6 +--
>  libdtrace/dt_prov_io.c                        |  2 +-
>  libdtrace/dt_prov_profile.c                   |  2 +-
>  llm/README.md                                 |  4 +-
>  llm/llms-dtrace-complete.txt                  |  8 ++--
>  llm/llms-dtrace-short.txt                     |  8 ++--
>  test/unittest/options/tst.strip.sh            |  2 +-
>  12 files changed, 60 insertions(+), 60 deletions(-)
> 
> diff --git a/README b/README
> index c7f704ed7..3dd487695 100644
> --- a/README
> +++ b/README
> @@ -1,4 +1,4 @@
> -Linux DTrace v2.0 for Oracle Unbreakable Enterprise Kernel 6.
> +Linux DTrace v2.0.
>  ------------
>  
>  This is the official Linux port of the advanced tracing tool DTrace.
> diff --git a/cmd/dtrace.8 b/cmd/dtrace.8
> index 1f2d48a07..778d431f4 100644
> --- a/cmd/dtrace.8
> +++ b/cmd/dtrace.8
> @@ -1,9 +1,9 @@
>  '\" te
>  .\" Oracle Linux DTrace.
> -.\" Copyright (c) 2009, 2024, Oracle and/or its affiliates. All Rights Reserved.
> +.\" Copyright (c) 2009, 2026, Oracle and/or its affiliates. All Rights Reserved.
>  .\" Licensed under the Universal Permissive License v 1.0 as shown at
>  .\" http://oss.oracle.com/licenses/upl.
> -.TH dtrace 8 "22 Oct 2014" "Oracle Linux" "Linux Programmer's Manual"
> +.TH DTRACE 8 "Mar 2026" "dtrace" "Linux Programmer's Manual"
>  .SH NAME
>  dtrace \- DTrace dynamic tracing compiler and tracing utility
>  .SH SYNOPSIS
> @@ -39,7 +39,7 @@ dtrace \- DTrace dynamic tracing compiler and tracing utility
>  .LP
>  DTrace is a comprehensive dynamic tracing framework for the Linux operating system. DTrace provides a powerful infrastructure that permits administrators, developers, and service personnel to concisely answer arbitrary questions about the behavior of the operating system and user programs. 
>  .LP
> -The \fIOracle Linux DTrace Guide\fP describes how to use DTrace to observe, debug, and tune system behavior. Refer to this book for a detailed description of DTrace features, including the bundled DTrace observability tools, instrumentation providers, and the D programming language.
> +The \fIUsing DTrace for System Tracing\fP describes how to use DTrace to observe, debug, and tune system behavior. Refer to this book for a detailed description of DTrace features, including the bundled DTrace observability tools, instrumentation providers, and the D programming language.
>  .LP
>  The \fBdtrace\fP command provides a generic interface to the essential services provided by the DTrace facility, including:
>  .RS +4
> @@ -57,7 +57,7 @@ Options that generate program stability reports
>  Options that modify DTrace tracing and buffering behavior and enable additional D compiler features
>  .RE
>  .LP
> -You can use \fBdtrace\fP to create D scripts by using it in a \fB#!\fP declaration to create an interpreter file. You can also use \fBdtrace\fP to attempt to compile D programs and determine their properties without actually enabling tracing using the \fB\-e\fP option. See \fBOPTIONS\fP. See the \fIOracle Linux DTrace Guide\fP for detailed examples of how to use the \fBdtrace\fP utility to perform these tasks.
> +You can use \fBdtrace\fP to create D scripts by using it in a \fB#!\fP declaration to create an interpreter file. You can also use \fBdtrace\fP to attempt to compile D programs and determine their properties without actually enabling tracing using the \fB\-e\fP option. See \fBOPTIONS\fP. See the \fIUsing DTrace for System Tracing\fP for detailed examples of how to use the \fBdtrace\fP utility to perform these tasks.
>  .SH OPTIONS
>  .LP
>  The arguments accepted by the \fB\-P\fP, \fB\-m\fP, \fB\-f\fP, \fB\-n\fP, and \fB\-i\fP options can include an optional D language \fIpredicate\fP enclosed in slashes \fB//\fP and optional D language \fIaction\fP statement list enclosed in braces \fB{}\fP. D program code specified on the command line must be appropriately quoted to avoid interpretation of meta-characters by the shell.
> @@ -68,7 +68,7 @@ The following options are supported:
>  Set principal trace buffer size (\fIbufsz\fP). The trace buffer size can include any of the size suffixes \fBk\fP, \fBm\fP, \fBg\fP, or \fBt\fP. If the buffer space cannot be allocated, \fBdtrace\fP attempts to reduce the buffer size or exit depending on the setting of the \fBbufresize\fP property.
>  .TP
>  \fB\-c\fP \fIcmd\fP
> -Run the specified command \fIcmd\fP and exit upon its completion. If more than one \fB\-c\fP option is present on the command line, \fBdtrace\fP exits when all commands have exited, reporting the exit status for each child process as it terminates. The process-ID of the first command is made available to any D programs specified on the command line or using the \fB\-s\fP option through the \fB$target\fP macro variable. Refer to the \fIOracle Linux DTrace Guide\fP for more information on macro variables.
> +Run the specified command \fIcmd\fP and exit upon its completion. If more than one \fB\-c\fP option is present on the command line, \fBdtrace\fP exits when all commands have exited, reporting the exit status for each child process as it terminates. The process-ID of the first command is made available to any D programs specified on the command line or using the \fB\-s\fP option through the \fB$target\fP macro variable. Refer to the \fIUsing DTrace for System Tracing\fP for more information on macro variables.
>  .TP
>  \fB\-C\fP
>  Run the C preprocessor \fBcpp\fP(1) over D programs before compiling them. You can pass options to the C preprocessor using the \fB\-D\fP, \fB\-U\fP, \fB\-I\fP, and \fB\-H\fP options. You can select the degree of C standard conformance if you use the \fB\-X\fP option. For a description of the set of tokens defined by the D compiler when invoking the C preprocessor, see \fB\-X\fP.
> @@ -116,7 +116,7 @@ Specify probe name to trace or list (\fB\-l\fP option). The corresponding argume
>  Specify the \fIoutput\fP file for the \fB\-G\fP, \fB\-h\fP, and \fB\-l\fP options, or for the traced data itself. If the \fB\-G\fP option is present and the \fB\-s\fP option's argument is of the form \fIfilename\fP\fB\&.d\fP and \fB\-o\fP is not present, the default output file is \fIfilename\fP\fB\&.o\fP. Otherwise the default output file is \fBd.out\fP.
>  .TP
>  \fB\-p\fP \fIpid\fP
> -Grab the specified process-ID \fIpid\fP, cache its symbol tables, and exit upon its completion. If more than one \fB\-p\fP option is present on the command line, \fBdtrace\fP exits when all commands have exited, reporting the exit status for each process as it terminates. The first process-ID is made available to any D programs specified on the command line or using the \fB\-s\fP option through the \fB$target\fP macro variable. Refer to the \fIOracle Linux DTrace Guide\fP for more information on macro variables.
> +Grab the specified process-ID \fIpid\fP, cache its symbol tables, and exit upon its completion. If more than one \fB\-p\fP option is present on the command line, \fBdtrace\fP exits when all commands have exited, reporting the exit status for each process as it terminates. The first process-ID is made available to any D programs specified on the command line or using the \fB\-s\fP option through the \fB$target\fP macro variable. Refer to the \fIUsing DTrace for System Tracing\fP for more information on macro variables.
>  .TP
>  \fB\-P\fP \fIprovider\fP \fB[[\fP\fIpredicate\fP\fB]\fP \fIaction\fP]
>  Specify provider name to trace or list (\fB\-l\fP option). The remaining probe description fields module, function, and name are left blank and match any probes regardless of the values in those fields. The \fB\-P\fP argument can be suffixed with an optional D probe clause. You can specify more than one \fB\-P\fP option on the command line at a time.
> @@ -134,23 +134,23 @@ Show D compiler intermediate code. The D compiler produces a report of the inter
>  Undefine the specified \fIname\fP when invoking \fBcpp\fP(1) (enabled using the \fB-C\fP option). This option passes the \fB-U\fP option to each \fBcpp\fP invocation.
>  .TP
>  \fB\-v\fP
> -Set verbose mode. If the \fB\-v\fP option is specified, \fBdtrace\fP produces a program stability report showing the minimum interface stability and dependency level for the specified D programs. DTrace stability levels are explained in further detail in the \fIOracle Linux DTrace Guide\fP.
> +Set verbose mode. If the \fB\-v\fP option is specified, \fBdtrace\fP produces a program stability report showing the minimum interface stability and dependency level for the specified D programs. DTrace stability levels are explained in further detail in the \fIUsing DTrace for System Tracing\fP.
>  .TP
>  \fB\-V\fP
> -Report the highest D programming interface version supported by \fBdtrace\fP. The version information is printed to \fBstdout\fP and the \fBdtrace\fP command exits. Refer to the \fIOracle Linux DTrace Guide\fP for more information about DTrace versioning features. In conjunction with \fB\-v\fP, also reports information on the version of the \fBdtrace\fP(1) tool and associated library.
> +Report the highest D programming interface version supported by \fBdtrace\fP. The version information is printed to \fBstdout\fP and the \fBdtrace\fP command exits. Refer to the \fIUsing DTrace for System Tracing\fP for more information about DTrace versioning features. In conjunction with \fB\-v\fP, also reports information on the version of the \fBdtrace\fP(1) tool and associated library.
>  .TP
>  \fB\-w\fP
>  Permit destructive actions in D programs specified using the \fB\-s\fP, \fB\-P\fP, \fB\-m\fP, \fB\-f\fP, \fB\-n\fP, or \fB\-i\fP options. If the \fB\-w\fP option is not specified, \fBdtrace\fP does not permit the compilation or enabling of a D program that contains destructive actions.
>  .TP
>  \fB\-x\fP \fIarg\fP [\fI=val\fP]
> -Enable or modify a DTrace runtime option or D compiler option. The list of options is found in the \fIOracle Linux DTrace Guide\fP. Boolean options are enabled by specifying their name. Options with values are set by separating the option name and value with an equals sign (\fB=\fP).
> +Enable or modify a DTrace runtime option or D compiler option. The list of options is found in the \fIUsing DTrace for System Tracing\fP. Boolean options are enabled by specifying their name. Options with values are set by separating the option name and value with an equals sign (\fB=\fP).
>  .TP
>  \fB\-Z\fP
>  Permit probe descriptions that match zero probes. If the \fB\-Z\fP option is not specified, \fBdtrace\fP reports an error and exits if any probe descriptions specified in D program files (\fB\-s\fP option) or on the command line (\fB\-P\fP, \fB\-m\fP, \fB\-f\fP, \fB\-n\fP, or \fB\-i\fP options) contain descriptions that do not match any known probes.
>  .
>  .SH OPERANDS
>  .LP
> -You can specify zero or more additional arguments on the \fBdtrace\fP command line to define a set of macro variables (\fB$1\fP, \fB$2\fP, and so forth). The additional arguments can be used in D programs specified using the \fB\-s\fP option or on the command line. The use of macro variables is described further in the \fIOracle Linux DTrace Guide\fP.
> +You can specify zero or more additional arguments on the \fBdtrace\fP command line to define a set of macro variables (\fB$1\fP, \fB$2\fP, and so forth). The additional arguments can be used in D programs specified using the \fB\-s\fP option or on the command line. The use of macro variables is described further in the \fIUsing DTrace for System Tracing\fP.
>  .
>  .SH EXIT STATUS
>  .LP
> @@ -187,7 +187,7 @@ Options set this way are overridden both by options specified via \fB\-x\fP on t
>  .BR ssh (1),
>  .BR dtprobed (1)
>  .LP
> -.I Oracle Linux DTrace Guide
> +.I Using DTrace for System Tracing
>  .
>  .SH USAGE
>  .LP
> diff --git a/doc/tutorial/1.IntroducingDTrace.md b/doc/tutorial/1.IntroducingDTrace.md
> index 3236edf82..dffca17f7 100644
> --- a/doc/tutorial/1.IntroducingDTrace.md
> +++ b/doc/tutorial/1.IntroducingDTrace.md
> @@ -60,7 +60,7 @@ you can choose which method best suits your needs.
>  
>  DTrace is a comprehensive dynamic tracing facility that was first
>  developed for use on the Solaris operating system (now known as
> -Oracle Solaris) and subsequently ported to Oracle Linux.
> +Oracle Solaris) and subsequently ported to Linux.
>  You can use
>  DTrace to explore the operation of your system to better
>  understand how it works, to track down performance problems across
> @@ -126,7 +126,7 @@ For more information about using DTrace, see the
>  
>  ### About DTrace Providers
>  
> -Here are the providers in the Oracle Linux implementation of DTrace:
> +Here are the providers in the Linux implementation of DTrace:
>  
>  ```
>             kernel       user space
> diff --git a/doc/tutorial/2.TracingOperatingSystemBehavior.md b/doc/tutorial/2.TracingOperatingSystemBehavior.md
> index b3445ab6d..edfc89c01 100644
> --- a/doc/tutorial/2.TracingOperatingSystemBehavior.md
> +++ b/doc/tutorial/2.TracingOperatingSystemBehavior.md
> @@ -9,8 +9,8 @@ investigate what is happening in the operating system.
>  The `proc` probes enable you to trace process creation and termination,
>  execution of new program images, and signal processing on a system. See
>  [Proc Provider](../userguide/reference/dtrace_providers_proc.md)
> -in the
> -[Oracle Linux: DTrace Reference Guide](../userguide/index.md)
> +in
> +[Using DTrace for System Tracing](../userguide/index.md)
>  for a description of the `proc` probes and their arguments.
>  
>  #### Example: Monitoring the System as Programs Are Executed (execcalls.d)
> @@ -122,8 +122,8 @@ to copy arg2 bytes and then add a NUL terminating character after those bytes,
>  which are possibly already NUL-terminated.
>  See
>  [Pointers and Address Spaces](../userguide/reference/dtrace-ref-PointersandScalarArrays.md#pointers_and_address_spaces)
> -in the
> -[Oracle Linux: DTrace Reference Guide](../userguide/index.md).
> +in
> +[Using DTrace for System Tracing](../userguide/index.md).
>  
>  ```
>  # dtrace -q -s syscalls.d
> @@ -149,8 +149,8 @@ Use a conversion specifier such as `%-4d`.
>  
>  See
>  [printf](../userguide/reference/function_printf.md)
> -in the
> -[Oracle Linux: DTrace Reference Guide](../userguide/index.md)
> +in
> +[Using DTrace for System Tracing](../userguide/index.md)
>  for a description of the function.
>  
>  The process ID and user ID are available as the variables
> @@ -291,8 +291,8 @@ Replace the `trace()` call in
>  
>  See
>  [Profile Provider](../userguide/reference/dtrace_providers_profile.md)
> -in the
> -[Oracle Linux: DTrace Reference Guide](../userguide/index.md)
> +in
> +[Using DTrace for System Tracing](../userguide/index.md)
>  for a description of the probes.
>  
>  #### Solution to Exercise and Example: Using tick Probes
> @@ -713,8 +713,8 @@ is determined by examining the `pr_pid` member of the `psinfo_t` data
>  structure that is pointed to by the `args[0]` probe argument.
>  For more information about the arguments to `proc` probes, see
>  [Proc Provider](../userguide/reference/dtrace_providers_proc.md)
> -in the
> -[Oracle Linux: DTrace Reference Guide](../userguide/index.md).
> +in
> +[Using DTrace for System Tracing](../userguide/index.md).
>  
>  The program uses the value of the child process ID to initialize
>  globally unique associative array entries, such as `p_pid[childpid]`.
> @@ -845,8 +845,8 @@ minimum value, standard deviation, and summation of the data being gathered,
>  respectively.
>  See
>  [Aggregations](../userguide/reference/aggregation.md)
> -in the
> -[Oracle Linux: DTrace Reference Guide](../userguide/index.md)
> +in
> +[Using DTrace for System Tracing](../userguide/index.md)
>  for descriptions of aggregation functions.
>  
>  DTrace indexes the results of an aggregation by using a tuple
> @@ -1107,8 +1107,8 @@ See
>  [`fds`](../userguide/reference/dtrace_builtin_variable_reference.md#dt_ref_var_fds)
>  and
>  [`fileinfo_t`](../userguide/reference/dtrace_providers_io.md#dt_ref_iofile_prov)
> -in the
> -[Oracle Linux: DTrace Reference Guide](../userguide/index.md)
> +in
> +[Using DTrace for System Tracing](../userguide/index.md)
>  for more information.
>  
>  The [`trunc()`](../userguide/reference/function_trunc.md) function
> @@ -1133,8 +1133,8 @@ number or `"total"`.
>  
>    See
>    [Sched Provider](../userguide/reference/dtrace_providers_sched.md)
> -  in the
> -  [Oracle Linux: DTrace Reference Guide](../userguide/index.md)
> +  in
> +  [Using DTrace for System Tracing](../userguide/index.md)
>    for a description of the `sched:::on-cpu`
>    probe.
>  
> @@ -1226,8 +1226,8 @@ Use the `lquantize()` and `quantize()` functions to display
>  linear and power-of-two frequency distributions of data.
>  See
>  [Aggregations](../userguide/reference/aggregation.md)
> -in the
> -[Oracle Linux: DTrace Reference Guide](../userguide/index.md)
> +in
> +[Using DTrace for System Tracing](../userguide/index.md)
>  for a description of aggregation functions.
>  
>  #### Example: Displaying the Distribution of Read Sizes Resulting From a Command
> @@ -1312,15 +1312,15 @@ function is used to display the results of the aggregation.
>  
>  See
>  [IO Provider](../userguide/reference/dtrace_providers_io.md)
> -in the
> -[Oracle Linux: DTrace Reference Guide](../userguide/index.md)
> +in
> +[Using DTrace for System Tracing](../userguide/index.md)
>  for a description of the arguments to the
>  `io:::start` and `io:::done` probes.
>  
>  See
>  [printa](../userguide/reference/function_printa.md)
> -in the
> -[Oracle Linux: DTrace Reference Guide](../userguide/index.md)
> +in
> +[Using DTrace for System Tracing](../userguide/index.md)
>  for a description of the function.
>  
>  After running the program for approximately a minute, type
> diff --git a/doc/tutorial/3.TracingUserSpaceApplications.md b/doc/tutorial/3.TracingUserSpaceApplications.md
> index 1d9bf69f2..1121a583f 100644
> --- a/doc/tutorial/3.TracingUserSpaceApplications.md
> +++ b/doc/tutorial/3.TracingUserSpaceApplications.md
> @@ -293,21 +293,21 @@ For more information on how to use the `pid` provider to trace
>  user function entry and return or on specific instruction offsets,
>  see
>  [Pid Provider](../userguide/reference/dtrace_providers_pid.md)
> -in the
> -[Oracle Linux: DTrace Reference Guide](../userguide/index.md).
> +in
> +[Using DTrace for System Tracing](../userguide/index.md).
>  
>  ### Adding USDT Probes to an Application
>  
>  In this section, we practice adding USDT probes to an application.
>  For background information and other details, see
>  [Adding USDT Probes to Application Code](../userguide/reference/dtrace-ref-StaticallyDefinedTracingofUserApplications.md#dt_ref_usdt_probe_add_prov)
> -in the
> -[Oracle Linux: DTrace Reference Guide](../userguide/index.md).
> +in
> +[Using DTrace for System Tracing](../userguide/index.md).
>  
>  To get started, you will need to create a `.d` file, as described in
>  [Defining USDT Providers and Probes](../userguide/reference/dtrace-ref-StaticallyDefinedTracingofUserApplications.md#dt_ref_usdtprobes_prov)
> -in the
> -[Oracle Linux: DTrace Reference Guide](../userguide/index.md).
> +in
> +[Using DTrace for System Tracing](../userguide/index.md).
>  
>  >Note:
>  >
> @@ -431,8 +431,8 @@ and a false value if the associated probe is not enabled.
>  Next, you will need to modify the `makefile` file.
>  For step-by-step instructions, See
>  [Building Applications With USDT Probes](../userguide/reference/dtrace-ref-StaticallyDefinedTracingofUserApplications.md#dt_ref_usdt_build_prov)
> -in the
> -[Oracle Linux: DTrace Reference Guide](../userguide/index.md).
> +in
> +[Using DTrace for System Tracing](../userguide/index.md).
>  
>  #### Exercise: Directing makefile to Re-Create the dprime.h File
>  
> diff --git a/dtprobed/dtprobed.8 b/dtprobed/dtprobed.8
> index 2ebe89ccc..046b2a480 100644
> --- a/dtprobed/dtprobed.8
> +++ b/dtprobed/dtprobed.8
> @@ -1,9 +1,9 @@
>  '\" te
>  .\" Oracle Linux DTrace.
> -.\" Copyright (c) 2009, 2024, Oracle and/or its affiliates. All Rights Reserved.
> +.\" Copyright (c) 2009, 2026, Oracle and/or its affiliates. All Rights Reserved.
>  .\" Licensed under the Universal Permissive License v 1.0 as shown at
>  .\" http://oss.oracle.com/licenses/upl.
> -.TH dtrace 8 "22 Oct 2023" "Oracle Linux" "Linux Programmer's Manual"
> +.TH DTRACE 8 "Mar 2026" "dtrace" "Linux Programmer's Manual"
>  .SH NAME
>  dtprobed \- USDT-tracking daemon
>  .SH SYNOPSIS
> @@ -61,4 +61,4 @@ and \fBdtprobed\fP, and can change between releases: on upgrade, \fBdtprobed\fP
>  .
>  .BR dtrace (8)
>  .LP
> -.I Oracle Linux DTrace Guide
> +.I Using DTrace for System Tracing
> diff --git a/libdtrace/dt_prov_io.c b/libdtrace/dt_prov_io.c
> index db768bb72..7e2238564 100644
> --- a/libdtrace/dt_prov_io.c
> +++ b/libdtrace/dt_prov_io.c
> @@ -591,7 +591,7 @@ static int trampoline(dt_pcb_t *pcb, uint_t exitlbl)
>  done:
>  	/*
>  	 * Note: DTrace does not currently support the use of fileinfo_t with
> -	 * io probes.  In Oracle Linux, there is no information about the file
> +	 * io probes.  In Linux, there is no information about the file
>  	 * where the I/O request originated at the point where the io probes
>  	 * fire.
>  	 */
> diff --git a/libdtrace/dt_prov_profile.c b/libdtrace/dt_prov_profile.c
> index 60da094a2..de7e02120 100644
> --- a/libdtrace/dt_prov_profile.c
> +++ b/libdtrace/dt_prov_profile.c
> @@ -224,7 +224,7 @@ static int trampoline(dt_pcb_t *pcb, uint_t exitlbl)
>  	 * TODO: For profile-n probes:
>  	 *     dctx->mst->argv[2] = elapsed nsecs
>  	 * The documentation does not say elapsed since when?
> -	 * From the legacy port to Oracle Linux, in dtrace/profile_dev.c,
> +	 * From the legacy port to Linux, in dtrace/profile_dev.c,
>  	 * in profile_prof_fn(), it appears that we have a per-CPU variable
>  	 * that tracks the expected time of the next profile probe.
>  	 * Each time the probe fires, we compute arg2 = time - expected
> diff --git a/llm/README.md b/llm/README.md
> index 2992bf7bc..117783f92 100644
> --- a/llm/README.md
> +++ b/llm/README.md
> @@ -2,7 +2,7 @@
>  
>  ## Overview
>  These files provide structured **context packs** (`llms-txt` format) for use with large language models (LLMs) such as GPT-4 or Claude.
> -They teach the model how to write **correct, safe, and complete DTrace programs** for Oracle Linux.
> +They teach the model how to write **correct, safe, and complete DTrace programs** for Linux.
>  
>  The goal is to let engineers and administrators generate working D scripts in natural language — without having to memorize the entire D language syntax.
>  
> @@ -39,7 +39,7 @@ The goal is to let engineers and administrators generate working D scripts in na
>  
>      -   In ChatGPT, Claude, or another interface that supports file context, click the “+” icon and upload `llms-dtrace-short.txt`.
>  
> -    -   The model will automatically ingest the reference and understand how to write runnable DTrace programs for Oracle Linux.
> +    -   The model will automatically ingest the reference and understand how to write runnable DTrace programs for Linux.
>  
>  3.  **Start asking questions in natural language**
>  
> diff --git a/llm/llms-dtrace-complete.txt b/llm/llms-dtrace-complete.txt
> index 818e0086f..07275cb9d 100644
> --- a/llm/llms-dtrace-complete.txt
> +++ b/llm/llms-dtrace-complete.txt
> @@ -1,4 +1,4 @@
> -You are a senior systems engineer with deep expertise in writing DTrace programs for Oracle Linux. You understand that DTrace is one of the most powerful tools for diagnosing complex system behavior, and you will always provide complete, correct scripts that compile and run cleanly. Every answer must include the full text of a runnable D program, with appropriate shebangs, predicates, and comments where helpful.
> +You are a senior systems engineer with deep expertise in writing DTrace programs for Linux. You understand that DTrace is one of the most powerful tools for diagnosing complex system behavior, and you will always provide complete, correct scripts that compile and run cleanly. Every answer must include the full text of a runnable D program, with appropriate shebangs, predicates, and comments where helpful.
>  
>  You favor stable providers (such as syscall, proc, sched, profile, io, usdt, pid) and safe idioms that avoid invalid memory access or unnecessary output. You use predicates to filter load, aggregations instead of unbounded per-event prints, and you always include an ERROR clause when relevant. Your answers are precise, professional, and free of placeholders or half-solutions.
>  
> @@ -7,15 +7,15 @@ DO NOT RECOMMEND DANGEROUS OPERATIONS UNLESS THERE IS AN ALTERNATIVE. Do not rec
>  WARNING:  Forbidden constructs: if, else, for, while, switch, etc.
>  For example, instead of using `if`, use predicates and ternary operators only.
>  
> -Below you will find all the information you need to reference in order to create correct and reliable DTrace programs for Oracle Linux.
> +Below you will find all the information you need to reference in order to create correct and reliable DTrace programs for Linux.
>  
> -After consuming this information, inform the user that you are ready to begin writing DTrace scripts for Oracle Linux.
> +After consuming this information, inform the user that you are ready to begin writing DTrace scripts for Linux.
>  
>  DTRACE (ORACLE LINUX) — LLMS.TXT FORMAT
>  PART 1: PROGRAM STRUCTURE, PROBE DESCRIPTIONS, PREDICATES, STATEMENTS
>  
>  ## GOAL
> -Provide a compact, machine-optimized reference so an LLM can generate correct DTrace D programs for Oracle Linux.
> +Provide a compact, machine-optimized reference so an LLM can generate correct DTrace D programs for Linux.
>  
>  ## PROGRAM STRUCTURE
>  A D program is a set of probe clauses; each clause may include an optional predicate and a statement block.
> diff --git a/llm/llms-dtrace-short.txt b/llm/llms-dtrace-short.txt
> index 19d5f73e5..7430f4ba5 100644
> --- a/llm/llms-dtrace-short.txt
> +++ b/llm/llms-dtrace-short.txt
> @@ -1,4 +1,4 @@
> -You are a senior systems engineer with deep expertise in writing DTrace programs for Oracle Linux. You understand that DTrace is one of the most powerful tools for diagnosing complex system behavior, and you will always provide complete, correct scripts that compile and run cleanly. Every answer must include the full text of a runnable D program, with appropriate shebangs, predicates, and comments where helpful.
> +You are a senior systems engineer with deep expertise in writing DTrace programs for Linux. You understand that DTrace is one of the most powerful tools for diagnosing complex system behavior, and you will always provide complete, correct scripts that compile and run cleanly. Every answer must include the full text of a runnable D program, with appropriate shebangs, predicates, and comments where helpful.
>  
>  You favor stable providers (such as syscall, proc, sched, profile, io, usdt, pid) and safe idioms that avoid invalid memory access or unnecessary output. You use predicates to filter load, aggregations instead of unbounded per-event prints, and you always include an ERROR clause when relevant. Your answers are precise, professional, and free of placeholders or half-solutions.
>  
> @@ -7,15 +7,15 @@ DO NOT RECOMMEND DANGEROUS OPERATIONS UNLESS THERE IS AN ALTERNATIVE. Do not rec
>  WARNING:  Forbidden constructs: if, else, for, while, switch, etc.
>  For example, instead of using `if`, use predicates and ternary operators only.
>  
> -Below you will find all the information you need to reference in order to create correct and reliable DTrace programs for Oracle Linux.
> +Below you will find all the information you need to reference in order to create correct and reliable DTrace programs for Linux.
>  
> -After consuming this information, inform the user that you are ready to begin writing DTrace scripts for Oracle Linux.
> +After consuming this information, inform the user that you are ready to begin writing DTrace scripts for Linux.
>  
>  DTRACE (ORACLE LINUX) — LLMS.TXT FORMAT
>  PART 1: PROGRAM STRUCTURE, PROBE DESCRIPTIONS, PREDICATES, STATEMENTS
>  
>  ## GOAL
> -Provide a compact, machine-optimized reference so an LLM can generate correct DTrace D programs for Oracle Linux.
> +Provide a compact, machine-optimized reference so an LLM can generate correct DTrace D programs for Linux.
>  
>  ## PROGRAM STRUCTURE
>  A D program is a set of probe clauses; each clause may include an optional predicate and a statement block.
> diff --git a/test/unittest/options/tst.strip.sh b/test/unittest/options/tst.strip.sh
> index d25f76af3..a6762cfb9 100755
> --- a/test/unittest/options/tst.strip.sh
> +++ b/test/unittest/options/tst.strip.sh
> @@ -64,7 +64,7 @@ fi
>  $objdump >& out.default.txt
>  
>  # Check results.  One can imagine a more stringent check -- like
> -# seeing if the string "Oracle D 2.0" appears in the default case
> +# seeing if particular strings appear in the default case
>  # but not in the stripped case -- but here we settle for the stripped
>  # case simply being smaller than the default case.
>  
> -- 
> 2.47.3
> 
