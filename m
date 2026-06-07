Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 953242571C0
	for <dtrace@lists.linux.dev>; Sun,  7 Jun 2026 15:35:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780846513; cv=fail; b=XvT8z9lylGicwUOCN+zB4cBO2X3/hDQvPeOYyNW51qQjKEnDhLmWzFwZ1CSxGqVGjDQHqIwwmQ60pOHyH1zHp5ttOJ3JQ53m61wQhuJLhjZrUZh8FvxNxIK66JcvBRwtcfXH4AGhyMd02MMmG39pNNHOZOii6PkwSm8S8ykSii4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780846513; c=relaxed/simple;
	bh=qWbLgJlrDYobLTH7m04bWv28JGSTa52DLUDN5zAi1QA=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=ObELmemUvSb09OG2WLqot6Wcru7h+TJlDlGtD/UM+/AxIrzGIyJ8zbTP0SzdUTbwhS9IuGBTv+KBYaLWSBnibjK1NW6E1lnBs7+NLEnwDz+IbFLHyX8Y4I8vcxHWgb+VZjAee+cZ1Z5AOrqNMWgKb/4FQCmbl9UJyAC1F3fyMm8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=YSs46UEF; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=gdRtawIz; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="YSs46UEF";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="gdRtawIz"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 657Eosoa2509276;
	Sun, 7 Jun 2026 15:35:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=WF7HZy0eQYxkxKtt4T2uKrPnZuHKM5h+iyMLJf6OUms=; b=
	YSs46UEFKkLl61Mw+aEbA6tFTxpYaBn16eU1uWlhoCaMGanvIBWmywkAp2HBggwB
	l3cCq5oRE+dhxxSYQqMm34Z0G3PEYyjdciXMGRn1E9x6Y4n44pLLBF/l8/OHPXru
	q+Fvs6LjadDZ/XAnJNdh+bCoNP8lbiuipvKm7zn5bZ9Iyj2eDXsTFdsKYzKGqCKn
	R4hhaz4gb63nGIlECTpkLoZXho9zkk2nxKfVIcl0WTrBuf8p6JAi+NY+nPd5VRJV
	eiR6ZepgZMMy0amZGMtnO/JpfLNto0+WCfDPzqDlNWJaEIQuDjjRMo8iH1QOFHKl
	XKGOIm+MwuylW4MKewfhIQ==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4emaf91axr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 07 Jun 2026 15:35:10 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.7/8.18.1.7) with ESMTP id 657FXVQw040279;
	Sun, 7 Jun 2026 15:35:09 GMT
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11011029.outbound.protection.outlook.com [52.101.62.29])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4ema0n0414-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 07 Jun 2026 15:35:09 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i7OLyhPHOGh6oPh+r6JIWUUVjg46LYKahFAv0ueiGarTs2GYkrV9euwL+vivwDWJFa5RAHO9tQf7Zn1ddlsLiDA/9Lr3qacsH5u8stiK6dAP3l2Ykv0XVAJs1qlaomwDCh8m9erJbTV1kA59vGmsEV5bSKWFwhgL0OLV3j9IXcaQFvNwRi0ZqSHch1J0RluxfwiTTRC+oQmqRuclN4AXIQU7haOEqHMVz/I43IFFh/ISXuNox1xbXsx3YlAtv/qjv6BJS5qDJ8g71wnHrD3iJ3tADqkU0K+hqzhhSeUAWpv5xoo8Gm0Q0Cv31AyYyxEEElaKcMtF4M9//ZKmuTdSlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WF7HZy0eQYxkxKtt4T2uKrPnZuHKM5h+iyMLJf6OUms=;
 b=kKZ7utvUNXCBOPZKGi5EaUyLuMFv37KXW5lSIuukFX3yv3S0z8ijUZF3IQvcOP3sb6SsmIlqKBkdszRAwoHv6NdJI9OoYNkYJsanfubIy1FtIn6P7BWtLwQboLIvzGkSx5rICWDyFAvValIf30wHDzNyQFs1G/3bqKedqss4lMQ/EKUKiLKc/idtSkxO+Tger/b9fffHj2aqNDKJ+NrIZgt+2FaHEVip0oefSE60A41jiz9hYIGX4a6P1gBFZnSiNQNls7cVgnsXagx7Xw39ymgAlIqXFK03aogVSQgrWd5m9oY1R2Iqunv5ViuDuRgTXFZc/rX0vXs8uZIrzYZRrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WF7HZy0eQYxkxKtt4T2uKrPnZuHKM5h+iyMLJf6OUms=;
 b=gdRtawIzmA+lqB7QqEsWRVoU4QLrJifvprN6Da1B1ntjobiWLVc7iSRFifwNCMlyZwrO/ZSgPRZ403L5EZ0ZgUsKAF9h15czsDvtXgnLdL1R/p10Z7HVO+KSl6w1PHgfKYo4jBgr45Zkxrj6FjnFXZNdP0XFCBTLTfMItedcxWg=
Received: from BN0PR10MB4901.namprd10.prod.outlook.com (2603:10b6:408:126::19)
 by SA1PR10MB7595.namprd10.prod.outlook.com (2603:10b6:806:388::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.12; Sun, 7 Jun 2026
 15:35:06 +0000
Received: from BN0PR10MB4901.namprd10.prod.outlook.com
 ([fe80::19a8:41b4:f519:1b79]) by BN0PR10MB4901.namprd10.prod.outlook.com
 ([fe80::19a8:41b4:f519:1b79%3]) with mapi id 15.21.0092.011; Sun, 7 Jun 2026
 15:35:06 +0000
Message-ID: <5407459e-e5a8-4575-aa96-876d8a2217e3@oracle.com>
Date: Sun, 7 Jun 2026 16:35:02 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] libdtrace: Pack declared bitfields into C storage
 units
To: Kris Van Hees <kris.van.hees@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com,
        OpenAI Codex <codex@openai.com>
References: <20260605221217.1211791-1-alan.maguire@oracle.com>
 <20260605221217.1211791-2-alan.maguire@oracle.com>
 <aiN9y6yDFK3JVKoI@oracle.com>
Content-Language: en-GB
From: Alan Maguire <alan.maguire@oracle.com>
In-Reply-To: <aiN9y6yDFK3JVKoI@oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P265CA0090.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2bc::11) To BN0PR10MB4901.namprd10.prod.outlook.com
 (2603:10b6:408:126::19)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN0PR10MB4901:EE_|SA1PR10MB7595:EE_
X-MS-Office365-Filtering-Correlation-Id: 08f050df-2817-4109-a685-08dec4aa5984
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|366016|3023799007|6133799003|56012099006|4143699003|5023799004|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	pC1h4EV4vz1b34VMoa19ljnerCi2dNtpf+7irh8JsGNExX4+G1BF3J/yUb12RnPkoThZDWlaQ/XEmKDqBkQB53WkR8gKnCqPVTwjeunwcFrZFMlMk+p9PxkAPIWLZp5JEqskbGlmNQ9DYSXhnC38h2DM9VD1WxHUxRdJsnnsUjjorUz8fMUdBXdsY6K25yG3caM3r5GLWcK6yz6HTyC/dkt7d0NpozPZzZNGgjC9AWOfDjPcJCVr5FnkrL0z4+hNv32p6n1ZQNdomKyDUGHdbKH8omCEauAWg3FBPOq6b5LANMIoMSrys4CdqgX+Tf3Br7WMMenzrzLLEjPR7VaJ+F5EpQD7Y1EUHb3liR42op68Az3X2yNzhffd2wljnxwhVpCYSEW+n9RyeHMTKI3TaKzoxCllkiRXEBgIYuoCr6hUU3veCXMcUkCzSsNlWJSy+1ZnWr98sa3SqP/hNL4fepDsmtr7AXW6OiwGaUbh/XN8sAgPD30X1e/2nzD/mANqAqUiqrSvAI7/lSdtfZWWLKvVEwWoobSZM+1yygxgRL78IUbY0jbFnC0pZrzF8EGdNGd5UsonRBn5nT6QynXjOA62umm08B1kTX8CaY2LDgaSMCJ4WNuoW0ap04eY8Bu53YO07YQUzGVWg6ywvE5ksUy6ouVZ/qTB1lKYQ+LpPVsKkZ9jxs/usCvHaMZoHp4f
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN0PR10MB4901.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(3023799007)(6133799003)(56012099006)(4143699003)(5023799004)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SWRtZmR2Ym1la3BzQnNUN1dkVTFwNDNYbWZUY2ZDNzlueExmMjdHSXRVY2Zj?=
 =?utf-8?B?dUNDa0tUcTg2dHdtRXNRVWJXVjFHRXo0NUNZSjNwdk0wTHc4aGlXUHFmNmdG?=
 =?utf-8?B?TlBNMmxEbWp2Wlh0WXFHdGxvWGRTQURnNGhoc1NXbkRzbkp5cFlXRDVkNWkv?=
 =?utf-8?B?VTdvZmJPUUliQTc1aTIveVJJQjdDRGR6Q0d1RXJaOVFvUTdkeW9wTFR6N2lu?=
 =?utf-8?B?ZDRoRGNVcXI3WFFEMTFRb3RnN3ZEOGZSbS9NS3N6UTBqaW9pNjBDQksxRGlR?=
 =?utf-8?B?cGdxaVVWVDVnMTdPdkN5ZmxwMGxpQitUYmMycnVJZ3lpODBXbWhKVENjUXdH?=
 =?utf-8?B?eElWQmNwNFcvajdKZzN5VUZWRmFHL21VYnIyQWNVVzZSMCtlYm5WSElsSTJs?=
 =?utf-8?B?b2dkOFBBWkNxUENEUncwaGZiZWx6czlMWlozbkZGNjFHemNVTzI2Wm1WNVpT?=
 =?utf-8?B?NXR5b0wrR3MyZTJwS0RkWHdDeTczdmUrQVF3cE1EZERLc0lNM2ZrTUlhaXRI?=
 =?utf-8?B?bWVXNTYwNitYeG5kcG1idUlmRVZ3OEJOQWgzZUJUQ1JCcDR0a1k4MVhEYTl0?=
 =?utf-8?B?VjFGeEZIVk5PczNFZmd6aGExTVMrMHoyU01taVZLTGlmejJNN0ttVDNKd3VZ?=
 =?utf-8?B?akRaV01IVHFOaENlRlVSa0ZKOWJBOTRnRnZCZlRhNUFzdkJZdXVoTUdqMWMx?=
 =?utf-8?B?V3FWdkJyNEZIVm1KK0hSZTVIUDZBTitHbDMvRkxRY0VjZFlOSzJ2UU40SmhH?=
 =?utf-8?B?Skx2alBudjRGWEIxVFU3eWZBMDdkUmw2RWlzbXEzSktNV0NhaFZqSUxOMGVO?=
 =?utf-8?B?b2Voc2lsZHZCVW1rd1FjbW5jRSt2cjJiWThmSmJrQTBLa0s4SnVQajJ0WmZN?=
 =?utf-8?B?Z3hxdEF4Q25RbXlLWURhemUveDhoVDNQNzc1dld1OGEybTdHejRJRUZYQVAz?=
 =?utf-8?B?NURWSmhLdnlEOWFzbm4xZy9yWG0rS2g4RVRwVTJzWlhYNllhSTV0WElzWkJk?=
 =?utf-8?B?M2pUM3h6VnNuamRmWVlDdFREb3pSeFJTSllNNHNZbDI3d0dWRVN0ZEJpT1lO?=
 =?utf-8?B?aDFRcGJ0N1JyRXp6MklFak5GcTJVZ2kxS2tJR2RjNzZraWI5TjFhOGZ1VTdK?=
 =?utf-8?B?aFZMYWUrSlcybG1ScldDbjM5UU04anN2KzF4Z0Nkd0szby9BMDZsd3o3dDli?=
 =?utf-8?B?aW9sZDBqNHBjUzdlenRTWWZkSVYvTTdpMjYrbC81eWcraStKYUFWNmNSaXBl?=
 =?utf-8?B?YVFvU09xSmhGb1RQYkdGbTg3amt4d2RIa0xJVDZpRlRteVJvUzlJSjZpS0E4?=
 =?utf-8?B?OFUwSFhPaDMvR1ZLTzJ5R0hhaW5GbXVtSHVHQnl5VXYyRHRUaDhyUUZjS1gx?=
 =?utf-8?B?SzZuc25nQ0REaG95OUhwWTNOY0NMZlg5eGtXbGlmOVdzeWZtK2lhbVpRcXNr?=
 =?utf-8?B?OS9BdUF1dUUwaklNdFF3UzhZSlBOSzhVRkdWQk1FZERuNWdsTElvem00cXRG?=
 =?utf-8?B?RjBDY3gwaUZ0dUtwQVBrVzlYVGd0REpOYVNiNVJDd3QxeTlXenZZZk1FZGdw?=
 =?utf-8?B?dXoyZzc3VVlDZjViZmFTNlYzN3BYaDdsZEZQVlpyLzN3M1I4V3lYYTYwbDgv?=
 =?utf-8?B?bDd0bXRXdUFaN1BuNmR4WGI1TTlvbDlROEJ3WFJKclFjZEhOa1NYQTM2SnVK?=
 =?utf-8?B?SE1rWmlGUGVFcytrelY4YlByYndHYUZscE9xa2xRUjlCOHlML0dIdVJRN2J6?=
 =?utf-8?B?M3hrZ1loWmo1dzlQMi9CL2V5emlZNW1MYzFRSVZMaEw3L29qN2d1R2R1VEpr?=
 =?utf-8?B?RHk1RjBNQzVTWHlYQTNhM3hFR1B1YWQxRE9GK3JVZlFtRDBocmttN1VObjZk?=
 =?utf-8?B?OTdreUhHZnZETmpMbXRSYmswZWNJaUgrZC9DSkljdnZHQU8rTUVNaXY3NVdO?=
 =?utf-8?B?bVIrZGphKzExa3pMQWFDcS9vSEMxWVNrRUVPeHZTclZQMmJMY3I3V3p0QjAy?=
 =?utf-8?B?ZHpDNzBMNHVUeVVXekJBYk92amhHYlFld3hDN2VuQ0JDQjh3YUN4OFlmZ2k0?=
 =?utf-8?B?c2ZjZ3JtOTFQN0JUYm9PU0dKUEhwZDZDSEhoM2hzU3VuY21sU0wvQXpaa2Yz?=
 =?utf-8?B?dHgxeUpmU082LzFFMmFMNDdDWkNwVXFiTXQ3V0ROQXZZTFB2d2R0Qzg3dWI0?=
 =?utf-8?B?M1psTTMybFYyRmNkSkZYaXFYTVBQUjRFamowTlA1ZkdDTzdDekl5VldxcEdz?=
 =?utf-8?B?NXQwQnNNNlF2TWtnbGttMlhWTnBkZlZ1YisxWll1RDBpNjZIeFB1dTJBYzU3?=
 =?utf-8?B?Ny9qTVA3MDkraExvK0FYN3c4T3d0ZDFVbkxBTWFQZW4rb0tXclNLdz09?=
X-Exchange-RoutingPolicyChecked:
	B6Ye0Le4qTuKys3h+08/DrkW5zKMyBAo4iPJXBgNzFbe+MZBNH/u6oqT4kiqo01IpXJZYSNnchzuVTsBZNZoZLO5UZPopsoe8dTyG0qN0IA6uR9v2JOLCol47MUeNMwL+HBL6zrKC32nC6hQWCU/eG4rtaF4uDOG1xoKtRwRGFSSZfNwwMKWcS7NHgF4e8KYmBAB9lPU1bV/wKUZgADy1R8o+EHBYluxSMUkqI0kbJ7vTGUoTht2HPot4mypiCLdAbZXY/6sZkXNYUQ6QVwFYSHjNlZ8qR08AiA50xGf+41Kptqc9GVhAcGGmCUKQjEwWt5PhvETisJ9e6KwxdbZMQ==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	Wk/Gu0li6suRQmgOXgOR9F9fIj9xQJg2YBI7uA5k0ViMU50VXZFnCjtoxQBomJvoivxeV5le+FYcLBFlre0TNdJueKuLtp0otMMj5ylfiySg5lQ/B/4jYv/Jk+KdHqWgqupLwP5qjN0xZPuK7+wgu4DIvjCBbf+lbbtpe+qx7gvCUsxk/U8hKbxY3bmH/XNY5E650uMLwr0++89pUNl/h4SIHWW9a5iZO0FonZKzVGL+g4sKAjbRMF7HZuf/VnRPkbosG+s1c1JsAKH+Ln2gsg5t1OzDU3GxMOmRjtoA/yJY5AeWGDL5NhoyKHMqoij+jzlwX2555sOMlIkGymWl+Mv8UobrObYzNXnXZfFLisxsI0/foNWzabdvgbvkRDE0ZCPqJ+0JPindCZTqlpWlN+ngvmxUvqUoFltW9Bgwd+ONwB2tJERKNHnSr3LPDA4Kf2kt3bPr6GoR8byMCWBTOz8UlrlWQGZr6QiQkrqqACEN6pUIth3aXxszxE5TfaymSierZdpP8scS2rqSGkDU32bnATBDOjH8/nUWr0BvpXpaDL8bXYoA1K2WU33vUOcEMPGquhtVvo13pAMs8KA76qA4w7J+txMmo09z9Q0m/R0=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 08f050df-2817-4109-a685-08dec4aa5984
X-MS-Exchange-CrossTenant-AuthSource: BN0PR10MB4901.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2026 15:35:05.9782
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Af+fB7hgbvp8piZA3HhWx9p3+mD32VfWnWXxLsDZpwlk2cqBj0WQ4yxsiQ86y0ocrxGlPNvtCgu5xJoG/fOHZw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB7595
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-07_04,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 mlxlogscore=999 phishscore=0 spamscore=0 mlxscore=0 bulkscore=0
 malwarescore=0 adultscore=0 lowpriorityscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.19.0-2605130000 definitions=main-2606070155
X-Proofpoint-GUID: rQ-IfIcOBtmXbywDiW0YJX1_6-eFaGkJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA3MDE1NSBTYWx0ZWRfX71jJ3bXnfbex
 kNkoHjCzZg4dJ6VlMswMI15+L3tYVY1lRqVTR73FsvJhDEybysDazPCZi9RqQGEGoJbQv4Q6Qpb
 FkxZDVk8yTXjxCzqlWjPRX9qU+XaHdhwGGwk/W1l80ezVmsvdjd2Rbjag124wbFPTtLCAYZZ54L
 TN40lkYfVlF7kU4s+UiV3vhGiwVUKmNzuDkUCEfBgCugN+5/fYvnk1A31D1rA5x+Bxb9oOhkkhZ
 AzAXO35jZSDnNmyhZChwQar1qyyX8qJuASL4NR5TfPOjgqZwROm7SNBY/8tUE3Ax302ssSFy/cK
 NPD6LLht1+yzPA9M4eZi4AC/GK3NuovEvG4LEIv+RdII7+9ZaseUC40gor2565VlIyVY0vs+dyd
 mL2pS0Ak8HpqpqGxSATJ7L+WUjZq5l6euMDVM188Z9dxzLlU4r1kig7qHAy/TKKgi3uFvHiFYzu
 BoCseLciyrQRUelXgchaPCCTaeo4K4Id8e575NAs=
X-Proofpoint-ORIG-GUID: rQ-IfIcOBtmXbywDiW0YJX1_6-eFaGkJ
X-Authority-Analysis: v=2.4 cv=OYeoyBTY c=1 sm=1 tr=0 ts=6a258fae b=1 cx=c_pps
 a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=jiCTI4zE5U7BLdzWsZGv:22 a=x0eKOSpe3m1H3M0S9YoZ:22 a=yPCof4ZbAAAA:8
 a=LG5T7v2SAAAA:8 a=ROtbKcUCyL51--iOy4kA:9 a=QEXdDO2ut3YA:10
 a=5yU3S35YU4bGjq-dph-N:22 a=Bho9c0fBagfJEIQBS7DQ:22 cc=ntf awl=host:12312

On 06/06/2026 02:54, Kris Van Hees wrote:
> I hope that Nick is able to comment on this (he is on the list) because I seem
> to recall that he has mentioned in the past that the packing of bitfields is
> not strictly defined and that we therefore cannot always know how the compiler
> performs the layout.  In other words, yes, we could change this but it is not
> at all guaranteed to be correct for anything other than the compiler we test it
> with.
> 
> If my recollection on this is correct, then it becomes a matter of making an
> informed decision on what the "best" representation is as opposed to the
> "correct" one (where "best" is defined as "most commonly used").
>

Right; as I understand it the ISO C ABI is not definitive here, but the platform-specific
ABI interfaces are clearer. For ISO C an addressable storage unit large enough to hold
the bitfield is required, whereas for SysV ABI for Linux 

int f:1;

...will always respect the 4-byte int size. This change lines us up better with
compiler behaviour by merging bitfield values across storage unit as appropriate.
In the below case for example, the clear intent is to pack the 32 bits of bitfield
values into the same 4-byte unsigned int. However current D behaviour is to
oversize it by 8 bytes rather than merge bitfields across storage units where possible.
 
> Also, if it is indeed implementation specific, that should certainly be
> mentioned in comments and the commit message, so that it is clear that this is
> a matter of a choice having been made rather than implementing a particular
> standard-defined feature.
> 
> On Fri, Jun 05, 2026 at 11:12:12PM +0100, Alan Maguire wrote:
>> dt_decl_member() represented each D-declared bitfield as a standalone
>> integer type sized to the field width, then let libctf auto-place the
>> member.  That made adjacent bitfields consume whole bytes instead of
>> sharing the declared C storage unit.  Unnamed padding fields such as
>> `unsigned int :24` were therefore treated as additional storage, causing
>> ABI-visible layout drift; for example CPython's PyASCIIObject was sized
>> as 56 bytes instead of 48 for python 3.6 when associated python3.6
>> headers were included.
>>
>> The problem in that case was the "state" bitfield which had the form:
>>
>>   struct {
>>       unsigned int interned:2;
>>       unsigned int kind:3;
>>       unsigned int compact:1;
>>       unsigned int ascii:1;
>>       unsigned int ready:1;
>>       unsigned int :24;
>>   } state;
>>
>> i.e. it should have been a packed unsigned int (4 bytes) but DTrace
>> was using adding 8 bytes to the representation size, also throwing
>> off field offsets that followed.
>>
>> Track bitfield allocation state while declaring struct/union members.
>> For each storage unit, add an empty-name CTF member using the original
>> base type to force the containing type to the C ABI size, and add named
>> bitfields as CTF slices at explicit bit offsets within that unit.  Reset
>> the allocation state for zero-width unnamed fields and non-bitfield
>> members.
>>
>> Also make bitfield code generation choose load/store sizes from both the
>> field width and its intra-byte offset, since packed fields can now cross
>> byte boundaries.
>>
>> Update the bitfield sizeof test expectations to C ABI sizes and add a
>> regression test for unnamed padding matching the PyASCIIObject layout:
>> state size 4, wstr offset 40, total size 48.
>>
>> Signed-off-by: Alan Maguire <alan.maguire@oracle.com>
>> Assisted-by: OpenAI Codex (GPT-5) <codex@openai.com>
>> ---
>>  libdtrace/dt_cg.c                            |  33 ++--
>>  libdtrace/dt_decl.c                          | 198 ++++++++++++++++---
>>  libdtrace/dt_decl.h                          |   6 +
>>  test/unittest/bitfields/tst.SizeofBitField.d |   6 +-
>>  test/unittest/bitfields/tst.SizeofBitField.r |  12 +-
>>  5 files changed, 201 insertions(+), 54 deletions(-)
>>
>> diff --git a/libdtrace/dt_cg.c b/libdtrace/dt_cg.c
>> index a77c022c..0859e9cb 100644
>> --- a/libdtrace/dt_cg.c
>> +++ b/libdtrace/dt_cg.c
>> @@ -92,6 +92,12 @@ clp2(size_t x)
>>  	return x + 1;
>>  }
>>  
>> +static size_t
>> +dt_cg_bitfield_size(uint_t offset, uint_t bits)
>> +{
>> +	return clp2(P2ROUNDUP((offset % NBBY) + bits, NBBY) / NBBY);
>> +}
>> +
>>  /*
>>   * Determine the load size for the specified node and CTF type, and return the
>>   * equivalent BPF size specifier.
>> @@ -104,13 +110,13 @@ dt_cg_ldsize(dt_node_t *dnp, ctf_file_t *ctfp, ctf_id_t type, ssize_t *ret_size)
>>  
>>  	/*
>>  	 * If we're loading a bit-field, the size of our load is found by
>> -	 * rounding cte_bits up to a byte boundary and then finding the
>> -	 * nearest power of two to this value (see clp2(), above).
>> +	 * rounding the bit offset and size up to a byte boundary and then
>> +	 * finding the nearest power of two to this value (see clp2(), above).
>>  	 */
>>  	if (dnp &&
>>  	    (dnp->dn_flags & DT_NF_BITFIELD) &&
>>  	    ctf_type_encoding(ctfp, type, &e) != CTF_ERR)
>> -		size = clp2(P2ROUNDUP(e.cte_bits, NBBY) / NBBY);
>> +		size = dt_cg_bitfield_size(e.cte_offset, e.cte_bits);
>>  	else
>>  		size = ctf_type_size(ctfp, type);
>>  
>> @@ -3586,7 +3592,8 @@ dt_cg_field_get(dt_node_t *dnp, dt_irlist_t *dlp, dt_regset_t *drp,
>>  	if (dnp->dn_flags & DT_NF_REF)
>>  		return;
>>  
>> -	op = dt_cg_ldsize(dnp, fp, mp->ctm_type, &size);
>> +	size = dt_cg_bitfield_size(offset, e.cte_bits);
>> +	op = bpf_ldst_size(size, 0);
>>  	if (dnp->dn_left->dn_flags & (DT_NF_ALLOCA | DT_NF_DPTR))
>>  		emit(dlp, BPF_LOAD(op, reg, reg, 0));
>>  	else
>> @@ -3653,8 +3660,7 @@ dt_cg_field_get(dt_node_t *dnp, dt_irlist_t *dlp, dt_regset_t *drp,
>>  	 * nearest power of two to this value (see clp2(), above).
>>  	 */
>>  #ifdef _BIG_ENDIAN
>> -	shift = clp2(P2ROUNDUP(e.cte_bits, NBBY) / NBBY) * NBBY -
>> -		(offset + e.cte_bits);
>> +	shift = size * NBBY - (offset + e.cte_bits);
>>  #else
>>  	shift = offset;
>>  #endif
>> @@ -3686,7 +3692,7 @@ dt_cg_field_set(dt_node_t *src, dt_irlist_t *dlp,
>>  {
>>  	uint64_t cmask, fmask, shift;
>>  	int r1, r2;
>> -	size_t offset;
>> +	size_t offset, size;
>>  
>>  	ctf_membinfo_t m;
>>  	ctf_encoding_t e;
>> @@ -3731,9 +3737,10 @@ dt_cg_field_set(dt_node_t *src, dt_irlist_t *dlp,
>>  	 * pass through the containing bits and zero the field bits.
>>  	 */
>>  #ifdef _BIG_ENDIAN
>> -	shift = clp2(P2ROUNDUP(e.cte_bits, NBBY) / NBBY) * NBBY -
>> -		(offset % NBBY + e.cte_bits);
>> +	size = dt_cg_bitfield_size(offset, e.cte_bits);
>> +	shift = size * NBBY - (offset % NBBY + e.cte_bits);
>>  #else
>> +	size = dt_cg_bitfield_size(offset, e.cte_bits);
>>  	shift = offset % NBBY;
>>  #endif
>>  	fmask = (1ULL << e.cte_bits) - 1;
>> @@ -3748,7 +3755,7 @@ dt_cg_field_set(dt_node_t *src, dt_irlist_t *dlp,
>>  	 * r2 <<= shift
>>  	 * r1 |= r2
>>  	 */
>> -	emit(dlp, BPF_LOAD(dt_cg_ldsize(dst, fp, m.ctm_type, NULL), r1, dst->dn_reg, 0));
>> +	emit(dlp, BPF_LOAD(bpf_ldst_size(size, 0), r1, dst->dn_reg, 0));
>>  	dt_cg_setx(dlp, r2, cmask);
>>  	emit(dlp, BPF_ALU64_REG(BPF_AND, r1, r2));
>>  	dt_cg_setx(dlp, r2, fmask);
>> @@ -3770,12 +3777,12 @@ dt_cg_store(dt_node_t *src, dt_irlist_t *dlp, dt_regset_t *drp, dt_node_t *dst)
>>  
>>  	/*
>>  	 * If we're storing into a bit-field, the size of our store is found by
>> -	 * rounding dst's cte_bits up to a byte boundary and then finding the
>> -	 * nearest power of two to this value (see clp2(), above).
>> +	 * rounding dst's bit offset and size up to a byte boundary and then
>> +	 * finding the nearest power of two to this value (see clp2(), above).
>>  	 */
>>  	if ((dst->dn_flags & DT_NF_BITFIELD) &&
>>  	    ctf_type_encoding(dst->dn_ctfp, dst->dn_type, &e) != CTF_ERR)
>> -		size = clp2(P2ROUNDUP(e.cte_bits, NBBY) / NBBY);
>> +		size = dt_cg_bitfield_size(e.cte_offset, e.cte_bits);
>>  	else
>>  		size = dt_node_type_size(dst);
>>  
>> diff --git a/libdtrace/dt_decl.c b/libdtrace/dt_decl.c
>> index 1f4936dd..29c58189 100644
>> --- a/libdtrace/dt_decl.c
>> +++ b/libdtrace/dt_decl.c
>> @@ -16,6 +16,8 @@
>>  #include <dt_module.h>
>>  #include <dt_impl.h>
>>  
>> +static void dt_decl_bf_reset(dt_scope_t *);
>> +
>>  static dt_decl_t *
>>  dt_decl_check(dt_decl_t *ddp)
>>  {
>> @@ -129,6 +131,7 @@ dt_decl_pop(void)
>>  	dsp->ds_type = CTF_ERR;
>>  	dsp->ds_class = DT_DC_DEFAULT;
>>  	dsp->ds_enumval = -1;
>> +	dt_decl_bf_reset(dsp);
>>  
>>  	return ddp;
>>  }
>> @@ -483,6 +486,89 @@ dt_decl_sou(uint_t kind, char *name)
>>  	return ddp;
>>  }
>>  
>> +static ulong_t
>> +dt_decl_bf_align(ulong_t off, ulong_t align)
>> +{
>> +	return align == 0 ? off : ((off + align - 1) / align) * align;
>> +}
>> +
>> +static void
>> +dt_decl_bf_reset(dt_scope_t *dsp)
>> +{
>> +	dsp->ds_bf_active = 0;
>> +	dsp->ds_bf_base = CTF_ERR;
>> +	dsp->ds_bf_unit_off = 0;
>> +	dsp->ds_bf_unit_bits = 0;
>> +	dsp->ds_bf_unit_align = 0;
>> +	dsp->ds_bf_next = 0;
>> +}
>> +
>> +static ulong_t
>> +dt_decl_bf_size(dt_scope_t *dsp)
>> +{
>> +	ssize_t size = ctf_type_size(dsp->ds_ctfp, dsp->ds_type);
>> +
>> +	if (size < 0) {
>> +		xyerror(D_UNKNOWN, "failed to determine struct size: %s\n",
>> +		    ctf_errmsg(ctf_errno(dsp->ds_ctfp)));
>> +	}
>> +
>> +	return (ulong_t)size * CHAR_BIT;
>> +}
>> +
>> +static void
>> +dt_decl_bf_anchor(dt_scope_t *dsp, ctf_id_t base, ulong_t off,
>> +    const char *idname)
>> +{
>> +	if (ctf_add_member_offset(dsp->ds_ctfp, dsp->ds_type, "",
>> +	    base, off) == CTF_ERR) {
>> +		xyerror(D_UNKNOWN, "failed to define storage for "
>> +		    "bit-field '%s': %s\n", idname,
>> +		    ctf_errmsg(ctf_errno(dsp->ds_ctfp)));
>> +	}
>> +}
>> +
>> +static void
>> +dt_decl_bf_start(dt_scope_t *dsp, ctf_id_t base, uint_t unit_bits,
>> +    uint_t unit_align, const char *idname)
>> +{
>> +	ulong_t off = dt_decl_bf_align(dt_decl_bf_size(dsp), unit_align);
>> +
>> +	dt_decl_bf_anchor(dsp, base, off, idname);
>> +
>> +	dsp->ds_bf_active = 1;
>> +	dsp->ds_bf_base = base;
>> +	dsp->ds_bf_unit_off = off;
>> +	dsp->ds_bf_unit_bits = unit_bits;
>> +	dsp->ds_bf_unit_align = unit_align;
>> +	dsp->ds_bf_next = 0;
>> +}
>> +
>> +static void
>> +dt_decl_member_copy(dt_scope_t *dsp, dtrace_typeinfo_t *dtt,
>> +    const char *idname)
>> +{
>> +	/*
>> +	 * If the member type is not defined in the same CTF container as the
>> +	 * one associated with the current scope (i.e. the container for the
>> +	 * struct or union itself) or its parent, copy the member type into
>> +	 * this container and reset dtt to refer to the copied type.
>> +	 */
>> +	if (dtt->dtt_ctfp != dsp->ds_ctfp &&
>> +	    dtt->dtt_ctfp != ctf_parent_file(dsp->ds_ctfp)) {
>> +
>> +		dtt->dtt_type = ctf_add_type(dsp->ds_ctfp,
>> +		    dtt->dtt_ctfp, dtt->dtt_type);
>> +		dtt->dtt_ctfp = dsp->ds_ctfp;
>> +
>> +		if (dtt->dtt_type == CTF_ERR ||
>> +		    ctf_update(dtt->dtt_ctfp) == CTF_ERR) {
>> +			xyerror(D_UNKNOWN, "failed to copy type of '%s': %s\n",
>> +			    idname, ctf_errmsg(ctf_errno(dtt->dtt_ctfp)));
>> +		}
>> +	}
>> +}
>> +
>>  void
>>  dt_decl_member(dt_node_t *dnp)
>>  {
>> @@ -542,22 +628,28 @@ dt_decl_member(dt_node_t *dnp)
>>  		xyerror(D_DECL_VOIDOBJ, "cannot have void member: %s\n", ident);
>>  
>>  	/*
>> -	 * If a bit-field qualifier was part of the member declaration, create
>> -	 * a new integer type of the same name and attributes as the base type
>> -	 * and size equal to the specified number of bits.  We reset 'dtt' to
>> -	 * refer to this new bit-field type and continue on to add the member.
>> +	 * If a bit-field qualifier was part of the member declaration, add a
>> +	 * hidden storage-unit member to force the containing type to the C ABI
>> +	 * size, and add the named field as a CTF slice at the corresponding bit
>> +	 * offset within that unit.
>>  	 */
>>  	if (dnp != NULL) {
>> +		ctf_id_t bftype;
>> +		uint_t unit_bits, unit_align, width;
>> +		ulong_t bitoff, memberoff;
>> +		ssize_t align;
>> +		int is_union;
>> +
>>  		dnp = dt_node_cook(dnp, DT_IDFLG_REF);
>>  
>>  		/*
>>  		 * A bit-field member with no declarator is permitted to have
>>  		 * size zero and indicates that no more fields are to be packed
>> -		 * into the current storage unit.  We ignore these directives
>> -		 * as the underlying ctf code currently does so for all fields.
>> +		 * into the current storage unit.
>>  		 */
>>  		if (ident == NULL && dnp->dn_kind == DT_NODE_INT &&
>>  		    dnp->dn_value == 0) {
>> +			dt_decl_bf_reset(dsp);
>>  			dt_node_free(dnp);
>>  			goto done;
>>  		}
>> @@ -579,43 +671,77 @@ dt_decl_member(dt_node_t *dnp)
>>  			    "for type: %s\n", idname);
>>  		}
>>  
>> +		dt_decl_member_copy(dsp, &dtt, idname);
>> +
>> +		base = ctf_type_resolve(dtt.dtt_ctfp, dtt.dtt_type);
>> +		unit_bits = cte.cte_bits;
>> +		width = (uint_t)dnp->dn_value;
>> +		align = ctf_type_align(dtt.dtt_ctfp, base);
>> +		if (align < 0)
>> +			align = size;
>> +		unit_align = (uint_t)align * CHAR_BIT;
>> +		if (unit_align == 0)
>> +			unit_align = CHAR_BIT;
>> +		is_union = ctf_type_kind(dsp->ds_ctfp, dsp->ds_type) ==
>> +		    CTF_K_UNION;
>> +
>> +		if (is_union) {
>> +			dt_decl_bf_anchor(dsp, base, 0, idname);
>> +			bitoff = 0;
>> +		} else {
>> +			if (!dsp->ds_bf_active) {
>> +				dt_decl_bf_start(dsp, base, unit_bits,
>> +				    unit_align, idname);
>> +			} else if (unit_bits > dsp->ds_bf_unit_bits &&
>> +			    dsp->ds_bf_next + width <= unit_bits &&
>> +			    dsp->ds_bf_unit_off % unit_align == 0) {
>> +				dt_decl_bf_anchor(dsp, base,
>> +				    dsp->ds_bf_unit_off, idname);
>> +				dsp->ds_bf_base = base;
>> +				dsp->ds_bf_unit_bits = unit_bits;
>> +				dsp->ds_bf_unit_align = unit_align;
>> +			} else if (dsp->ds_bf_next + width >
>> +			    dsp->ds_bf_unit_bits) {
>> +				dt_decl_bf_start(dsp, base, unit_bits,
>> +				    unit_align, idname);
>> +			}
>> +
>> +			bitoff = dsp->ds_bf_next;
>> +			dsp->ds_bf_next += width;
>> +		}
>> +
>> +		if (ident == NULL) {
>> +			dt_node_free(dnp);
>> +			goto done;
>> +		}
>> +
>>  		cte.cte_offset = 0;
>> -		cte.cte_bits = (uint_t)dnp->dn_value;
>> +		cte.cte_bits = width;
>> +		memberoff = is_union ? 0 :
>> +		    dsp->ds_bf_unit_off + (bitoff / CHAR_BIT) * CHAR_BIT;
>> +		cte.cte_offset = bitoff % CHAR_BIT;
>>  
>> -		dtt.dtt_type = ctf_add_integer(dsp->ds_ctfp,
>> -		    CTF_ADD_NONROOT, ctf_type_name(dtt.dtt_ctfp,
>> -		    dtt.dtt_type, n, sizeof(n)), &cte);
>> +		bftype = ctf_add_slice(dsp->ds_ctfp, CTF_ADD_NONROOT,
>> +		    base, &cte);
>>  
>> -		if (dtt.dtt_type == CTF_ERR ||
>> -		    ctf_update(dsp->ds_ctfp) == CTF_ERR) {
>> +		if (bftype == CTF_ERR) {
>>  			xyerror(D_UNKNOWN, "failed to create type for "
>>  			    "member '%s': %s\n", idname,
>>  			    ctf_errmsg(ctf_errno(dsp->ds_ctfp)));
>>  		}
>>  
>> -		dtt.dtt_ctfp = dsp->ds_ctfp;
>> +		if (ctf_add_member_offset(dsp->ds_ctfp, dsp->ds_type,
>> +		    ident, bftype, memberoff) == CTF_ERR) {
>> +			xyerror(D_UNKNOWN, "failed to define member '%s': %s\n",
>> +			    idname, ctf_errmsg(ctf_errno(dsp->ds_ctfp)));
>> +		}
>> +
>>  		dt_node_free(dnp);
>> +		goto done;
>>  	}
>>  
>> -	/*
>> -	 * If the member type is not defined in the same CTF container as the
>> -	 * one associated with the current scope (i.e. the container for the
>> -	 * struct or union itself) or its parent, copy the member type into
>> -	 * this container and reset dtt to refer to the copied type.
>> -	 */
>> -	if (dtt.dtt_ctfp != dsp->ds_ctfp &&
>> -	    dtt.dtt_ctfp != ctf_parent_file(dsp->ds_ctfp)) {
>> -
>> -		dtt.dtt_type = ctf_add_type(dsp->ds_ctfp,
>> -		    dtt.dtt_ctfp, dtt.dtt_type);
>> -		dtt.dtt_ctfp = dsp->ds_ctfp;
>> -
>> -		if (dtt.dtt_type == CTF_ERR ||
>> -		    ctf_update(dtt.dtt_ctfp) == CTF_ERR) {
>> -			xyerror(D_UNKNOWN, "failed to copy type of '%s': %s\n",
>> -			    idname, ctf_errmsg(ctf_errno(dtt.dtt_ctfp)));
>> -		}
>> -	}
>> +	dt_decl_bf_reset(dsp);
>> +	dt_decl_member_copy(dsp, &dtt, idname);
>>  
>>  	if (ctf_add_member(dsp->ds_ctfp, dsp->ds_type,
>>  	    ident, dtt.dtt_type) == CTF_ERR) {
>> @@ -1040,6 +1166,7 @@ dt_scope_create(dt_scope_t *dsp)
>>  	dsp->ds_type = CTF_ERR;
>>  	dsp->ds_class = DT_DC_DEFAULT;
>>  	dsp->ds_enumval = -1;
>> +	dt_decl_bf_reset(dsp);
>>  }
>>  
>>  void
>> @@ -1072,6 +1199,7 @@ dt_scope_push(ctf_file_t *ctfp, ctf_id_t type)
>>  	dsp->ds_type = type;
>>  	dsp->ds_class = rsp->ds_class;
>>  	dsp->ds_enumval = rsp->ds_enumval;
>> +	dt_decl_bf_reset(dsp);
>>  
>>  	dt_scope_create(rsp);
>>  	rsp->ds_next = dsp;
>> @@ -1101,6 +1229,12 @@ dt_scope_pop(void)
>>  	rsp->ds_type = dsp->ds_type;
>>  	rsp->ds_class = dsp->ds_class;
>>  	rsp->ds_enumval = dsp->ds_enumval;
>> +	rsp->ds_bf_active = dsp->ds_bf_active;
>> +	rsp->ds_bf_base = dsp->ds_bf_base;
>> +	rsp->ds_bf_unit_off = dsp->ds_bf_unit_off;
>> +	rsp->ds_bf_unit_bits = dsp->ds_bf_unit_bits;
>> +	rsp->ds_bf_unit_align = dsp->ds_bf_unit_align;
>> +	rsp->ds_bf_next = dsp->ds_bf_next;
>>  
>>  	free(dsp);
>>  	return rsp->ds_decl;
>> diff --git a/libdtrace/dt_decl.h b/libdtrace/dt_decl.h
>> index 0bec183b..4be31158 100644
>> --- a/libdtrace/dt_decl.h
>> +++ b/libdtrace/dt_decl.h
>> @@ -58,6 +58,12 @@ typedef struct dt_scope {
>>  	ctf_id_t ds_type;		/* CTF id of enclosing type */
>>  	dt_dclass_t ds_class;		/* declaration class for this scope */
>>  	int ds_enumval;			/* most recent enumerator value */
>> +	int ds_bf_active;		/* bit-field allocation unit is active */
>> +	ctf_id_t ds_bf_base;		/* bit-field allocation unit base type */
>> +	ulong_t ds_bf_unit_off;		/* bit offset of bit-field unit */
>> +	uint_t ds_bf_unit_bits;		/* size in bits of bit-field unit */
>> +	uint_t ds_bf_unit_align;		/* alignment in bits of bit-field unit */
>> +	uint_t ds_bf_next;		/* next bit offset in bit-field unit */
>>  } dt_scope_t;
>>  
>>  extern dt_decl_t *dt_decl_alloc(ushort_t, char *);
>> diff --git a/test/unittest/bitfields/tst.SizeofBitField.d b/test/unittest/bitfields/tst.SizeofBitField.d
>> index 1eb4ab5d..2ad7df02 100644
>> --- a/test/unittest/bitfields/tst.SizeofBitField.d
>> +++ b/test/unittest/bitfields/tst.SizeofBitField.d
>> @@ -80,9 +80,9 @@ BEGIN
>>  }
>>  
>>  END
>> -/(1 != sizeof(var1)) || (2 != sizeof(var2)) || (3 != sizeof(var3)) ||
>> -    (4 != sizeof(var4)) || (5 != sizeof(var5)) || (6 != sizeof(var6))
>> -    || (7 != sizeof(var7)) || (8 != sizeof(var8)) || (12 != sizeof(var12))/
>> +/(4 != sizeof(var1)) || (4 != sizeof(var2)) || (4 != sizeof(var3)) ||
>> +    (4 != sizeof(var4)) || (4 != sizeof(var5)) || (8 != sizeof(var6))
>> +    || (8 != sizeof(var7)) || (8 != sizeof(var8)) || (12 != sizeof(var12))/
>>  {
>>  	exit(1);
>>  }
>> diff --git a/test/unittest/bitfields/tst.SizeofBitField.r b/test/unittest/bitfields/tst.SizeofBitField.r
>> index 9d97b2aa..a5e4007b 100644
>> --- a/test/unittest/bitfields/tst.SizeofBitField.r
>> +++ b/test/unittest/bitfields/tst.SizeofBitField.r
>> @@ -1,10 +1,10 @@
>> -sizeof(bitRecord1): 1
>> -sizeof(bitRecord2): 2
>> -sizeof(bitRecord3): 3
>> +sizeof(bitRecord1): 4
>> +sizeof(bitRecord2): 4
>> +sizeof(bitRecord3): 4
>>  sizeof(bitRecord4): 4
>> -sizeof(bitRecord5): 5
>> -sizeof(bitRecord6): 6
>> -sizeof(bitRecord7): 7
>> +sizeof(bitRecord5): 4
>> +sizeof(bitRecord6): 8
>> +sizeof(bitRecord7): 8
>>  sizeof(bitRecord8): 8
>>  sizeof(bitRecord12): 12
>>  
>> -- 
>> 2.43.5
>>

