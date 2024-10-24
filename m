Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7B331FE0F6
	for <dtrace@lists.linux.dev>; Thu, 24 Oct 2024 17:51:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729792308; cv=fail; b=bxcjd0xVpGAqph/n9cXSVpZutFySN6AuHABuMnU8+neVKlFrZCnJUQtM+ymOw6J1qv8txNUQERXZEM2uVZ/1SzSjaE+aOOlz74MR89ll+KGqQAf5i9GIKxIuTxRmAecVX3L1rxxEJpykVZXAYLvom9Hoj82+1Bx4hLsdCY5gHmc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729792308; c=relaxed/simple;
	bh=3MHd7l/1bP2BHo7Dag8CpZpmNiViuHoTUwm5jMKgcbc=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=sAN84Vhl4aHOQdiLuYx1xqzUQ9Naokcxu6hfr+jEMcRAyz6hAyWqW7U4KrFynXVu+vaSbfV+d7ZDLOSFLenDj/Wut9Cbhiv+QAFCxsCCjfAk1kD35AFR4klQcIPdMhWjP/ptBxd/je8amtxA9nnKeVd7R/6nzBZTsGHG918zyUA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=aH9K1srv; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=Xea/ruvo; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="aH9K1srv";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="Xea/ruvo"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49OHmYKK014305
	for <dtrace@lists.linux.dev>; Thu, 24 Oct 2024 17:51:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=mQ96c3zpzTH0vsAi9p3o8oH8bxOmU4bkal0o8YFSJ1I=; b=
	aH9K1srvPujO5a7y0wescT4v8lqn1j87rIKGObnP/QwRrMwZCdFPKAtDxGvcqDPK
	fRmuRGipB9HLo8LRZJ1MtcQ3jwbI17+Yi5UdG/qgHFjIG6hYECFFB1oZN88s5RhM
	VFXs+GsOc9+nj7VRiPQLa6YwMWkeUimr2lqgNNXbzh20icL/P6E92aaBMnGlTolj
	0gkoVd6Jwhl/tQ3+0klokqSpBPLzDtyYROAxF3mY7PGFCjwSbkWC/w1TANvbI5Wt
	79Y+rNqcv6IljliDqrQKDCoW3zMxsptoMLdBO1GJXRStM0Ay7PQabnU9LeThYHf6
	FjVeCOCU5jPhvANJDe/91g==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 42c545bdag-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 24 Oct 2024 17:51:44 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 49OHkesp027471
	for <dtrace@lists.linux.dev>; Thu, 24 Oct 2024 17:51:43 GMT
Received: from nam04-bn8-obe.outbound.protection.outlook.com (mail-bn8nam04lp2048.outbound.protection.outlook.com [104.47.74.48])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 42emh4papt-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 24 Oct 2024 17:51:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qMwoK49OIsIdinC4FGRIannUvHdrFRNLZSOSZPXO7JNtOAXOE8o59xbgw2a7NeBrzxP0VcYbIeSM1FOiK2kHteV1IXuBcX6HRd+s1PnaVMHclZkehK6eSeF7EdoZeLoltLHnXzUxbj89oeyyOKi39fsir+Tcy4pq544b8JQIteqcqf3IqDdrkctKbOmAI8FhxXdxfE9iDRAOclGsVoKAUMcowSbuaH+J0B39eTqdFi2mtK98TKUN4KlLIIFBfnpeSG42ANfjUslFjsIw4H32Pu15nNzvWqJwW3xI+eNKlqAhaT+wKd5K6QQYesH/QzeAQARyVxfpvvXvrdJYSOSlhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mQ96c3zpzTH0vsAi9p3o8oH8bxOmU4bkal0o8YFSJ1I=;
 b=iLNZ2KO6gjsI82Pf/QxHEWZeHXh0EZmC47RPyHCBp/BQIY0JfmsGHWOkLEL1kmYlikLSxwyS6rdJglWPfTQGM5W5mMHhIVg0kA9oNtjRCfEcxHOWdPQ0qwcOPl6jPIIOTgFFJuOkP3b2AdBcrG+R3h+1SaemkEO3qRfBdC2JhCjiX4ifW/Xi1v/AlekA/1xlWjJIuDZXHaK4f7gwP7QQHvoZ6R7338pVzjkJ71FgZKCv31KaEHf+n3pWhDZ8XDd0tc5Yk1/oejmNicvRVt2g8R/RfARBAW+Fj9DTq6Cyj9Al2CDCgCnuCD4o3hP9OkhReh2GjpqvFMfVvnTbT4KXsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mQ96c3zpzTH0vsAi9p3o8oH8bxOmU4bkal0o8YFSJ1I=;
 b=Xea/ruvoQPksDkf037W1s6AwYjq0YeI1XYnYP1IK+XunLK640rWRT5QuAfdX0OUChGqkzZn/IDXe8zC6FfkiExnKMOTI/Yn9wBzentFTGRzu2N8kL4MoQc34cH8tNHyC4y5Rsb3RfZIGf7o8Hn0A1PfR4DM18SHl8exgzw3M+zM=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by DS0PR10MB6895.namprd10.prod.outlook.com (2603:10b6:8:131::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.20; Thu, 24 Oct
 2024 17:51:41 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%3]) with mapi id 15.20.8093.014; Thu, 24 Oct 2024
 17:51:41 +0000
Message-ID: <fd0d8597-4ef0-c051-7f6b-1e0f15dbf99e@oracle.com>
Date: Thu, 24 Oct 2024 13:51:37 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [DTrace-devel] [PATCH v2 19/19] test: Add another USDT open/close
 test
Content-Language: en-US
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
References: <20241024172143.14091-1-eugene.loh@oracle.com>
 <ZxqHJVSTO4Hp0Vs6@oracle.com>
From: Eugene Loh <eugene.loh@oracle.com>
In-Reply-To: <ZxqHJVSTO4Hp0Vs6@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BL1PR13CA0391.namprd13.prod.outlook.com
 (2603:10b6:208:2c2::6) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|DS0PR10MB6895:EE_
X-MS-Office365-Filtering-Correlation-Id: 2d6a92af-22d8-4957-d6e0-08dcf454844c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?M1VqRk9pcjNsWngwV2VIMEQ0Z2s1eHdOZ3h3ZGtrQkNsdythZGQ1aElrSmZY?=
 =?utf-8?B?ZTh3OWdHenJkY3NYL0hTUndWMFFCSzgzMWh5aWkxZGpyYUY4ZUxXQ1RBSUxm?=
 =?utf-8?B?c2pGOWJySS9hbW5BSXdrMllXZ0pXYll3Vk1sTWo3K2R6RU5KRUROZGI0SnR4?=
 =?utf-8?B?Sy90WldsaDZVSG81b3NrbzFveGsrMm9LTjNXMnIrdFFXall1U0dxUy82SXNS?=
 =?utf-8?B?cURiMVpzWnZaQWcrY3BKaVI5VlQwSnNyZk9VOFBTZnBLaWdFTnBHNUkzQkZH?=
 =?utf-8?B?NVQrQWRRZ2ZTNzFKRm94cGhUdEVZT2ZKeWFrVmo2elc5YzJkVStuMGZUMSty?=
 =?utf-8?B?Rk1jZXpVTHFmS2tQUnMvekVuZGI3dUdFNGdCN0FIWDFHZ0pMRHhKcVBaTitr?=
 =?utf-8?B?RUNmWG9wUmN6REFuWVBXMjBRdjY5RmZCeFM1dW1QMFlMaVF3cCszTjEveFJV?=
 =?utf-8?B?TFppVHR3bURqTzlhaUF0bVROc1hOeHBsaXM4UittZWVnc1IxYStFMlVXQjFO?=
 =?utf-8?B?bjJ4a2cxdER1UVlneFF3U0U3dWJKSG5jdkhnY3BBNmJVU2grOTJsR2NJRFJ6?=
 =?utf-8?B?R1Baem11L0NVc2M0bkVlL1RzWEswMmdiNVZETVBHS1V2c2JlRGZtamJqUnpY?=
 =?utf-8?B?TlNkZ0NTc2wwdHdodHdQT24vSkdjdi9ZYlZIZ1dDNHhteXZoc0c5eDhCMFoy?=
 =?utf-8?B?dHl3LzNrazdlb1NjblhxSEp3ZCsrUmVOU3NKdFNncVlwMmlYTXltU0FZbUtB?=
 =?utf-8?B?OHJiR0hIYUhBaHBKbm5LQ0kwcEdzbWRrQnJJSFFtQnJDTkFqTyt1K2k0ODRL?=
 =?utf-8?B?MkhKcFN3ejQvd0JacEI1Q0lyQkJ1VVN3dFhnMVhOZ0pPRmQ1bERaMVRIN1RY?=
 =?utf-8?B?S2w4UStjVnIxNVI5VUF0TzZIQmtjQUFEMWU1b2NSKzg3Nkg4VmJJTjFObG9D?=
 =?utf-8?B?c2VkZDg1aXNKWHlRWnI2T2pDNWFVMVNFbWpMcWptV01lVTZjU1ZIdzkwck1N?=
 =?utf-8?B?WXB4cE8rSVJkU0p1VDYzV3pjWFVsQUN3a01lYnZ6RnBoL0JEY3dGaUMrT3g3?=
 =?utf-8?B?ZmJnV3pkMTBnbk4yMTFjeDJIRE8xV3NRdFZVam93RU8xU1dsWkRpSkVxOUda?=
 =?utf-8?B?azZ6Zlg1RXVnMXVpNDFsQmszbzdOejR2TTZVQ1ZubkZKbzFPTUtnY2ozNEo0?=
 =?utf-8?B?NGw0dkw4V3IrZWhwY2FvS1BiSTR5RFd6M29rMXFoWjV6ejJuS1NjWVBlYVhU?=
 =?utf-8?B?aUlvUWZwRnRqNDRoeVZMMVVWT3FhL21oc1ZxajA3aHhVMmZlcFZueFV6MTVC?=
 =?utf-8?B?ZWdlQUx6WkltbWRPY1NMVzZ3T052S3UwNmVSOExZN2wrRmc2OUNUdVBTWXk2?=
 =?utf-8?B?U0owd1lFVTVVTUhkTnZoQ3VzeVpmakZ5Vml1cEZBU1ZDM2NuVHFuUCtXSXJ6?=
 =?utf-8?B?TmpYWmt1ZWdmUWNqWUc1VlJCOHB0eXFlOEV4S3ErRVJHanJ1MmJHZy84eUdZ?=
 =?utf-8?B?Szh5eW5vK0YxQjFxM0Rud05IT1NZS0FBWDVHRzBwcUZrUGVCZ1RNdUVkSDJK?=
 =?utf-8?B?SGF3VkRMYkJ0WjZkVmh3NENRQ1F1cXNNY0dOZ21Wa2c4QytUWkUzWE55WnJL?=
 =?utf-8?B?YzI2NmVwK0hYWGFobUl4K2RQbzYwUU5KUGFWbkRad1VsOU1NTXpmazF5QWdI?=
 =?utf-8?B?UFQ3dzJWQmtTOE4rS1hNWE5JVmhCV2toV05QN0swQ24wN0JDTnhyK3BYOVRu?=
 =?utf-8?Q?a4oUq8ySOxHq5AA5GE=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cEl5eDkwMG1wUDBsZE9kSkRjb2pQSm5HM1pLOU1lTzZGV2NINjJPcmU1UWsy?=
 =?utf-8?B?RFhIWVRjTGljaE5GeldKa1dQZFY1UnBrZFV3a09qVTlIbEErWnNteWdhWlox?=
 =?utf-8?B?Zjh4Rzl0NGFqOFVjb1o1Z0Mwc2U4TEpOODZ5My9jS1lLYk9yZ3JHcXBLU3BI?=
 =?utf-8?B?eG5kYU8yY2hjOGRpUTVIRHBQdlZvTGo2WHFIczBXMXdIbDVGOWxUaDFoTmdu?=
 =?utf-8?B?N0t1bG1yU3Z2dWZUQTJJdUtLTXhRZUhYeTIzcEMzck1ISGhTRDJjVGI1ZzV1?=
 =?utf-8?B?S0gyNUlrOStMZnRmSnhYWXVGUzQ5RVh3bUJQRFhvd0ozVzlZdjhBVDlLQ0dr?=
 =?utf-8?B?ZTVaQlJPQjhldGhoMFA0cEl0aTlDQkZDTjR3RlduMWRibzI2N25obFUyRWtS?=
 =?utf-8?B?ZHZkeDhSYWJURDVHWVNGblZlb3dzMnVNUnZtWllldW9oWDM0Qm5BeFJwNDFx?=
 =?utf-8?B?cThIdE1JK1N5S1kzQ0RuZnA3cTM0Ykgwa2lrVS9ldE85T01kd21jVGNjY2Vi?=
 =?utf-8?B?YWhlZCt4KzhIRTdLcjMyQ0hDclV0NzhteWIvZ2hNZDlBeHkxV1JXWDRVTTFW?=
 =?utf-8?B?RG1LY1RkVDlmMmlHRG9vazJGdzcvWE0yZ1A3WmUxVWhwMGFmcit3VzhtckVX?=
 =?utf-8?B?SHA3NDlpT1FaQWRFQnEwVHd6S0dJOEFpNTZ2UWV2dzJoK1lrb1kzLy9RMm85?=
 =?utf-8?B?clE1cmxjNy9TbEJFYzhjVDVpYXFmSy8wQjlNeFlhUmJuNDJUV0M5SndpMXZt?=
 =?utf-8?B?TDYxa0ZtUXBRU3pKcTFMRHRkRUNVWHZwRm5BL2o5eGVnNEwyRTl5eEhsck9s?=
 =?utf-8?B?LytVQzZTQnoyaUZNc3RqQWp0aHVEOVQycmJOQ1lDa2M3aU9sL0ZFK2c3Vy9Q?=
 =?utf-8?B?ZDQ3VHpEL3lueGozdTFITnJuTDVJdWdTK0YvWnJqalZKenF3eUp5SEJlMVdE?=
 =?utf-8?B?QWp6bktvcGNDRXRnQk1Nc2lyTDY2TjcwUUlLc3pWUUNGaE8vZ2YwWUgySWFv?=
 =?utf-8?B?VFljWjNyKzFnRFpXQ2p6cnJzV0JTL1BrcGYwZm1BZFRrNmxaT0VGVjhkem4x?=
 =?utf-8?B?dTY4VkovNENJUy9kUytveXQ1WXZ2S2o5aU1qTUNPQjJmSTNGenVhNm5TVnJF?=
 =?utf-8?B?MVhPMzdyUkFXQ3RLSkVSUG9Fd2U3c0RoQXNEZDY0eDVxMGljL1EzdG52Zngx?=
 =?utf-8?B?ZHh4VzUyZWNXNWhsaHkvTkdhMDBkWVFmQm9yd3FwalVjaW9sWmQ1K1FOT2l2?=
 =?utf-8?B?bGhUMnZ1d0lZajBvMktCUTdTanNmS2M1NERweEFPTGJMTFNRdERNdmxBMnJW?=
 =?utf-8?B?RjdkRTlmV1JXK3RQSGtkQXRpaXBjcjlpYmpsYUJrcUsvTWg2MU8ybnJUblBi?=
 =?utf-8?B?b01KTWxVVW5OcEtRSUtMNGtqMkRxY3hJT1I2UVlsTFF1NVVNNlVwSGViTHJP?=
 =?utf-8?B?OWhmYnVWekZEOGxHVnhVV2tacU9hTWs0M3duQWtNakxHWnRuUHNQOUFreHJP?=
 =?utf-8?B?SnZhZTRWYTMycXRxdVVESU1kbnpOYVpJUXBCQnN5d3F5SHdBRnlzc0JSZWdI?=
 =?utf-8?B?elRCczN0ZWV0a0R3YmhYTEtZN3lPTktLOVg0UWpuNU5iTmVKMXdhUWppMzVn?=
 =?utf-8?B?Qy9KeU9mRjlETVgxOXVyRG1OeiszRGNFR3VkTWJFUEdhZjJpZk4yT3R1bFpP?=
 =?utf-8?B?NUVCNVN5K3JoK1Z1NHZJOU12OUgzd2RrVUtkTk9KZWxTR3VuSmdSbTdiTDBy?=
 =?utf-8?B?U1VXK29nWFYvRUZWV2pRakpiQzBzeUhjd0NYSkxKWi9GMndMTEo3L3dLTnRJ?=
 =?utf-8?B?emtaUjV1cEJ6cTVGMDJLN0t0R3h2NHdISzV4S1E2aDIvenZ3TmxuUG1hNGJq?=
 =?utf-8?B?Z0hyUTJOZ1g2UVkvUlg0MTVDeXc1NmhUSEMyTks0L0xwc28xcERmNDNITTJY?=
 =?utf-8?B?NkRkTEYzRFVWMVpqZHh6Vit4dmhiYWJKcTY2WXB4VjBXRXQ3RUswRWNtQ0Fw?=
 =?utf-8?B?aDBJbGpGelUyQVhkYTB4R1k0WXN2bTZnTXFhOEtJeHIyUzNyc0JtclpNY3ph?=
 =?utf-8?B?YVdoWmNVYWd2SVgrTWtPNy9QMzVaN1VNdVNGdXJaUFVQZzVUSUk0Uk1GZzJB?=
 =?utf-8?Q?DPtL7s4I+kzb8cRhV2WpNQ5x9?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	MJuZ5WdQScP1gsXNDcE+XMqaedCN8hyavIvtVYvC1SSWZgc+JOX4Mo8Qbq+AOLvHCINztmb/iJe3amgMpdogUgTkI06PitA4wmg32qVCKK0Z7ykJ17QqWBbyMCw9/0kea7sPeuQPP96pa1/Rt4wusj38DxevBH4Tn2UXKI6FQkMHy6BsKHrM1Ewu1myLYIO53+z/0t2vnkXHGT2oB3gBI+jtfC2tCs9/6vusSi7HGL5YR2RF8cFiaaNK9wW9hv2An2vQfCaPp113dWnzfVPs3lObn/XHdM6YuaF71kTQmMcjVT1T8qj1sWfWChAJF3czJFehAgym7EnpEr6AeQ4fNLx/U66dJ/f6DJKrRBdtpu1uIsTbFTjq42IG3QqGP1lCq2oXAM+hkikTFpypRWPWwF0VZ7/+Frh9izO1U0hmMn/yh2WUmKMla5woe0a4SNtLbaQRoLJ2PLIFXkHmHul9st7MH2HSDrW98a/qlSIzQVrvrVvLFMxaJ7CWe+5OhEeUx5hwv4CPSoxFDoXsKhzOwZcXqDFRztXGPubcDmAC3uVr3y1B/AovSL6dUf8Kihmgm+cXc0Fyulx/vZJO3nGxDs5035KvY/k9yLPIKNqT0PM=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d6a92af-22d8-4957-d6e0-08dcf454844c
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2024 17:51:41.5216
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: K/VX+tiy2Cdv/+1xBHzr095DvBo4sIp+nwle6vPTvn4WviVcQa5Rm9EhRdkGzsAAzib//RGc0U9+4RdOGmEsHA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB6895
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-24_16,2024-10-24_02,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 phishscore=0
 malwarescore=0 adultscore=0 mlxscore=0 mlxlogscore=999 spamscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2409260000 definitions=main-2410240147
X-Proofpoint-ORIG-GUID: L8tiprfSj75st6NbamJqTQVyjfIt27mI
X-Proofpoint-GUID: L8tiprfSj75st6NbamJqTQVyjfIt27mI

On 10/24/24 13:43, Kris Van Hees wrote:

> On Thu, Oct 24, 2024 at 01:21:43PM -0400, eugene.loh--- via DTrace-devel wrote:
>> From: Eugene Loh <eugene.loh@oracle.com>
>>
>> There is already a test to check that "dtrace -l" sees USDT
>> probes come and go as an executable loads and unloads a shared
>> library with USDT probes.  (See dlclose1.sh.)  But it could
>> also fail if DTrace does not immediately notice USDT probes
>> coming or going.
>>
>> Introduce a test that allows a grace period before DTrace
>> notices a USDT probe come or go.
>>
>> There is a deadlib.so here.  It is not needed for the test.
>> It simply mimics other, similar tests.  The real thing to do
>> might be to put these shared libraries, common to multiple
>> tests, in test/triggers.
> It seems like you removed deadlib, so why paragraph should go also.

Oops.  Right.  I thought about that... and then forgot to remove it.

> With that removed...
>
> Reviewed-by: Kris Van Hees <kris.van.hees@oracle.com>
