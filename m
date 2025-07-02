Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CEC019E7F9
	for <dtrace@lists.linux.dev>; Wed,  2 Jul 2025 20:22:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751487762; cv=fail; b=HZG07t9dylqvh3zsYM6sZ3oM4Kwb5aoPAkE7idni+p/OJn0S57URfBWnEHevyO0P9pHGZUxfkroZV7WvGYM+4BUL45LXsphoVln7/3IyZ7WK+AJI7WHlDMJZg2LmXqYhwxkRiNuEzFXEWDPfimvTWZdxFWW/x5JktjkOdTVImHY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751487762; c=relaxed/simple;
	bh=u9LgppfT75ZvaTi35UoDQwFGJ34IvTesEQYeiDEpgMQ=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=X2/A2fr8XeK2OPqI5b+6FUlaoxMLNNGX5TiE8PgY0cvFKWiBaznsYWeQENB6qxr0XvQV8/HYc5tIXGXdSqy/jwKnVh2yP/ae3ppH+aGrayZsrUulahvjjc31LG7igDGZ9TIazxjRKxZOHmlooeDLXykHoSVe520y7MoArYpMifc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=B4Mlnuue; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=ec2weX/p; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="B4Mlnuue";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="ec2weX/p"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 562JhOlQ024972
	for <dtrace@lists.linux.dev>; Wed, 2 Jul 2025 20:22:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=S895440uEez/Yebq0DqJvJwqrWiMPTxyVPQ4Gm8cB4E=; b=
	B4Mlnuue1aRGB/a4Z+N1hP4+9+ekEpdxmYvQM1lYhHamEjR7IZ/zWBfXI65hRKLl
	BqjPDV7RjqQHpMkQzfur8rIVlu67QZl5IuS95zazog6Qv+fcMCtugzWwtVc6NwW7
	EbYkxg9HQV4HuC59O+CAre606ys7GEOuR/ihTODyA0sAXPaf+v//oafuF9oDU+/M
	7ApcI1DotZb6ErzduJp2tNWQQpdsCkwxPYlXClhby0N4OERC21+//mQj6hsYEiKe
	5WlKWfwkR5v4PW9w9GEhmTyePYk6P38vdXK354DZEYXeY3JPl5Bgv+3o34ogX8HP
	kcAHwGts0RZEc4K2NLks9Q==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47j8xx7r91-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 02 Jul 2025 20:22:35 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 562J0Qmt027485
	for <dtrace@lists.linux.dev>; Wed, 2 Jul 2025 20:22:35 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10on2061.outbound.protection.outlook.com [40.107.94.61])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 47j6ubq1nh-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 02 Jul 2025 20:22:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F3ywUH8E6E16YZI2gc+N+f/CJgzUZJ6MDweOXHuhmEsYiS3mcefiuri/0zf+JeqwSBQbEiDbNk5n5PReC0rHhV5EYdeVaSxlEuApPdz4Ewgmzo7wEqUp/a0pjOSlmay1lWcbBjxXWx+hEYP/ZikmUOiqeczx8TyeCpzhDBR2Vv9JZsfVa184qiRa3sknFGMu5mEM4cSK2X4r5rngWGHuBVAG7XoAlT3DXm2rVcije/oNTl84ftXF84Tqgcfyr1xpoOm/fUf6KtpVHYRelQkm1+fom2xBr6KtMYWLGTiFGQ7aIHlUWGsvyPEkrAE7S7/kL8z5VsmK29q2QgRqRKnZ/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S895440uEez/Yebq0DqJvJwqrWiMPTxyVPQ4Gm8cB4E=;
 b=HK9jUrTXfjB7FE0iwYSGaCuZAN2wQPkWa3s0XVR1AiMIO6+Ef1sPqH/AUCIA26DAZqbmlDOTlKW44LAIfpyGVG/yuB6YZ15WvGsP8DTxl2GfWPKpN5IVwSooOVdo+b8UY0lYx3H9lB0Nfu/C8ZXV9IQiKH2YIRFJePyPbhYyYrow3ZXeO9h/FwcbRamKENc1Wv0QkOVqWCoxCqP/mTfr8pvAxnFbdPKMSWbcluJh9a977W0S6iREeR+qYg+uTbzKK0/c8Iv+VNfXED4gQflOWbmYoHHa4UfxMrbIG+mhnMIn3ErZlfZI/SgYBQgo/lZZpjXH5QIfUNlHuoAS0yfFDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S895440uEez/Yebq0DqJvJwqrWiMPTxyVPQ4Gm8cB4E=;
 b=ec2weX/prxM68c17PbnuQ/WBXGHsYxTwiPzm939GNnR5ogbZjDFw3INK5nPNc6xK5pHzwGQJ7z9BEgHtucGRsHcF138UFQekk1RHe/XSU8kMZs82C0zD/yruAPQ/XTNtKp1jBACh2gIDAP8U9t3FmGDhOXiWNcQIJHzGGreYh3c=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by PH7PR10MB7804.namprd10.prod.outlook.com (2603:10b6:510:2fe::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.34; Wed, 2 Jul
 2025 20:22:31 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%2]) with mapi id 15.20.8901.018; Wed, 2 Jul 2025
 20:22:31 +0000
Message-ID: <2d8d7b61-29ef-04ae-bffd-0dcb0709a106@oracle.com>
Date: Wed, 2 Jul 2025 16:22:27 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v2 2/4] dt_impl: bump number of TSLOTS to 8
Content-Language: en-US
To: Alan Maguire <alan.maguire@oracle.com>, dtrace@lists.linux.dev
Cc: dtrace-devel@oss.oracle.com
References: <20250610135813.15746-1-alan.maguire@oracle.com>
 <20250610135813.15746-3-alan.maguire@oracle.com>
 <4a079f61-5806-68b8-9051-af918a822adc@oracle.com>
 <d886c84d-f208-465f-a95a-0f6f8133ef1a@oracle.com>
From: Eugene Loh <eugene.loh@oracle.com>
In-Reply-To: <d886c84d-f208-465f-a95a-0f6f8133ef1a@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PH8PR02CA0010.namprd02.prod.outlook.com
 (2603:10b6:510:2d0::21) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|PH7PR10MB7804:EE_
X-MS-Office365-Filtering-Correlation-Id: f5f52de3-0dcc-4307-0798-08ddb9a62c0b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?M2dhK3lIaUc4Z1B4bHhBaHQwYktCdmhicU1kSDFJd1RnTEN4aHgyV2JleVdm?=
 =?utf-8?B?L29WbnB2S2lBR2Zac2FyWlloM1FWMkU4RjcwWUhSN0JwSmNCR1lrMGRUNnJB?=
 =?utf-8?B?NFYvSUhFU05SRHJwdjBlR3E1UmUyUU5PbEJoeStRVU9iN0ZUdVYyUFBLU1dY?=
 =?utf-8?B?VzM4SjJSdDNaZ3dTRTNVUzFmanRybExvM2FKYkZBYWM3eGp6SlpxSlp1dWpU?=
 =?utf-8?B?amF0Mk9IbnVNR051QXdNV0lQakM5bWVFUmVZYm1ybnZUVU1TNHFNUDdxM0Fi?=
 =?utf-8?B?cllmNVIyREs1TWFVS2NTQmh2WE14WmRPLy9jdU9KYmEweTcyazNReUJ6L0xt?=
 =?utf-8?B?YUtvV0p4VEdmTXQxMG5SMVVFeXpoeFF3QWNtNDlKRnFTSkUwZ0VEQkdxaHJE?=
 =?utf-8?B?RXRYYkdOVXF4TXlTcThpKzJvZUV0OEZWUERDUUNqRktHR3pzNDhyVkJ6RUFu?=
 =?utf-8?B?aTNPQTNUVVlpVXZOOE5wQk40L0JrWGZIYTFZcVBQbDBpQng4UGk2NzZ1TTA1?=
 =?utf-8?B?RUxIUHc3WTA2RUxlc0dHNCsxQ1gwYlFacmlHK0pqVE1nRUVRMXNyK0tWRCtT?=
 =?utf-8?B?aWVaZGVIaERXMEZ6YWkyT2FuVTJYVzVMbWQ2R0kvUWxtb1pQM0hLdkNGUlp3?=
 =?utf-8?B?ZkY3REpqcDRNU3VocE9hS0ZZUkQ4eGxHcCswdkRSQXBydDV3OGZCQWw0alFF?=
 =?utf-8?B?MFFNbmRUMzRyeHJMdFFOWlppU01nNzY3U09xckZhMmpwWFhCc24ydmNYL1h6?=
 =?utf-8?B?a1J0dkIyU09CclNJRUpXZzhQR2NkQ3B2bnBtSWZYQkhXZFdwT0ZIUnhlc1pz?=
 =?utf-8?B?TlEwMDhaSExWaURETkFWeW9vVW9iR3RBM2ZLcjN3OWFuUWc5TVVDNFQ4bkNF?=
 =?utf-8?B?OXYvK3o0OFAybko3bGFXbDNNY1VabXBqNllrMklDWCtwd1cveXRURnE2VkFP?=
 =?utf-8?B?MWFuTnlqbzc0czVXdXJmWDZFOVZHaFNhVUVtM2Frb0JNSG9BaFZ5Y20vTXBy?=
 =?utf-8?B?WmdaV2hhSG5pTlZoSDdiNDE2Wm5pZElEaUw2cFpVbmFsbGNiOGZVUXlYNDQ0?=
 =?utf-8?B?aFRXcjNMcFdyRDQvanZTeGtrSUlmbmhNR2hpdDdCQW1GTG1aTFM3N3ozOXpF?=
 =?utf-8?B?cXJYa0xhdW9heTZ6RThCMWhSSDl2cU5Jc0cwSEhIK2VXc0tpUVcwVjV5Z1BZ?=
 =?utf-8?B?YnRld25nc1lkZ2NCaGNwdVZUWFd4d0RCeWJtOVdteUJEZU5hZ1hGN21UQ0ZW?=
 =?utf-8?B?amNZeG13TzFHVWpkKzZrcTY2NVlOSVAxakFqTllGNzU4S2F0Rlk4TC8vNGh0?=
 =?utf-8?B?cm5aRmxHeU4ra25mOWhRVzJOSU45RHpwcllpbkV3TzlsRGNEN0dCK0dvRHZn?=
 =?utf-8?B?WkFlSThvcjlVTFE2QXBRNm1PL1FvTkx2YytFOWlTNjZCSjlwN1EwclFmRmM3?=
 =?utf-8?B?VUY0a1VpeXdZd3ZvczdYUTk4UTZPS1RaNDJhazhZbFEyV2R0YXY3aXE1cHVa?=
 =?utf-8?B?T1VqUmtxdVZucnNnRmxZNjcrdDEvRGthQ0RYT3FyZzhaNUJENllublNjZ0w3?=
 =?utf-8?B?WVFsUSsvVnZDdXBUTDlOYlB1OHNzYVlKWU9xK1AyZkVvVHBkSUVXT0NUbGlz?=
 =?utf-8?B?c1ZFNDVBRmp0OFpoM1lMQzNieExoWkE0K3V6ZXR3bTlQdjJ0UW92OGxLemhV?=
 =?utf-8?B?OEl4S2xzVHVDK2NFaW54WCs2STJrdWNkRTQvekx3VHg0TC9uckprZ2hYczk0?=
 =?utf-8?B?YUJIZ3RXeFBEbzZSbjZvT3ZoaEx1VUQydDk3RCs0VmhZWHlWSWVBbVFVM1Rl?=
 =?utf-8?B?dUNPcnk5VS9aVHBVSThiTVJVWUNTbGVtT2lHdC9ldnh5QTdJaThGQm9JYkVq?=
 =?utf-8?B?ekhueTZPb2NwN29na2FkSWJaOEwvcUlEekVUd1UxTTFDYVl6RXYrMHFZVjlN?=
 =?utf-8?Q?wnmRkB1DgpU=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QVF5QWNxYjhTMUJvTExKTU90ZzBDZ3ZaR3dCVDhxMHBtNCtPL0ZKTGl6bVZC?=
 =?utf-8?B?emRvT1NOMG51RU8vTkRGb20rYS9wUE14ZXV6ZHR1dHQ1WDZSc3lXUm4rVnU4?=
 =?utf-8?B?ZXZuZ1AxZnRRSzRESnMrMWlFQ1pxcWxBdTI1My9UdVRRNGo4TnlQZHh1WGJV?=
 =?utf-8?B?T0xXQW94eTJ2ZVNTSWtaczZMK09IZDdpM0NEV215MHJVRVhmVUpsYW4vdDlV?=
 =?utf-8?B?cGZNRmFTUDQzNG5wcUJDcTlkd2VZcEFENEhTVlE3Rmw1K0cxM2NrWk9xNmVr?=
 =?utf-8?B?WWc0Uk9IZGRjSHp4OWlXbGJ0bXZJV2NBTFVQd3ZzS2pPQmxYZURGVWlBc0N3?=
 =?utf-8?B?MWdHVk5ZMCtxVzBUSWFudkY5KzhGVXpiSXF1cHFxN2FDL2hyQ3psdjFKbjE3?=
 =?utf-8?B?UG00Y2NtNVgwcFRxdEFWaWxDSTdRR3pmR05BMjIveENiUmk4bnZaQWluYWdn?=
 =?utf-8?B?R1kxaU9sRFZ0dTcrSHlrUWpEMjZUb3VBdjlPK3M4M1ZxckQwOHdFbWJwK3pU?=
 =?utf-8?B?bldNSHp4WjZHNC9iQ3BFV2FmczRMQXJmSGp1V3BLc0N5UnVFa0dDNlhuR2U3?=
 =?utf-8?B?SEFDK3FJTys4cERmZEVBMVg1Um0rV0V1Z2VZaXMwM3M4S0F5RXh6STAzR0x0?=
 =?utf-8?B?Zk5NbmR0TmpkNmRJYWhBT1dpS3lDaUppdzNlK3Qxd21vbjNGODdHaUUvOW1l?=
 =?utf-8?B?cXBKeTcxZE53Qm9pbnhtci8vUjIzTUpUL2xKV1dqaXdKdmNVcytVeVhleVVC?=
 =?utf-8?B?QlJiYjFtMllhRVFNekRYS2kzL0FreVBTQjQ1S0VUWWdSSGl5STZvQUl2emlQ?=
 =?utf-8?B?ZFp1UklLMkg3aUVyaERqVzc2dDZ1UXlCY2RPczQrVG1ya2krN2xZVitYaXJ2?=
 =?utf-8?B?U0V3clA0ellMNU50NVk4YzhpMzd6NW0zSmg1QWx4UDNUbUcwVm8xN3Q4UDZq?=
 =?utf-8?B?Z3Vrb2tQeS9WcEtaUFUxeHBrczd6bzUzenpHVkxDN3IvOENCZHl6eGtEMGhZ?=
 =?utf-8?B?UnExKzFGTlZCL0FtN25ManNvSzBqY0NYN29wT0xNcTc3dnZtdDQwd1NaUllt?=
 =?utf-8?B?NGRJYjZDYk5MVTJ3eWFaTjNVb1BsVEM0Nk5KQ0YxUEZlY1dQY1ZrZWw4eU4v?=
 =?utf-8?B?YWVvS3NaNW0rM3lSSWxTYzJhRnVTK2FEZWxyNElac09MVG95RXAwbmlkL2t6?=
 =?utf-8?B?SkNOTE1ObC9rRVpraU5oL0ZJRGZIRmxLR0c2UGRGRGNRa3VGZEJSMXJZeGtW?=
 =?utf-8?B?NzJzUDY4UmNTZk41U3VVL3dlSlJvSkl0NlQvVE5NWFlUUi9NenphTzR5YXNz?=
 =?utf-8?B?bllvSEg1Rk5SOG9uN1JKU0ZCVTlyMFVOcExXckkzZTdjQmErekJLOGl0YXl4?=
 =?utf-8?B?alpiOWUxdVhOemEyaWNrNmNxSk5XMTZoK2t3SklaMWVNK0t2SHI1aFZVaFl5?=
 =?utf-8?B?am9sS1hzanhzR0JYaUdFUmdaZkFQeS9WcXBLUUptd3lNaVVMM2E3NFJmV2ky?=
 =?utf-8?B?bWNud1JCVjZYbGJhYUFQVDhJNHRWVFhwTk8yL2RKZFlLNG1PL01TRVRaM0x6?=
 =?utf-8?B?cFJHSmQzdEY1NHpqWGxLTldpbzhOdE5PVCt6ZUJBcHJVbzNpRkgzRHMvSm01?=
 =?utf-8?B?T2lzVG5US1J2RGZzN2pid0plcWNDUHRwTTdyRHN1ZjdaTW4zQklOZVQ5UlNX?=
 =?utf-8?B?L0UzaFdaY05QdnFFVnpiZVE1bDhjdlpHTVdIV05FczVWelBNQWtFOGRtazJt?=
 =?utf-8?B?ZjRuVmVrcVdWd1pZZTBaYmFROE9mODRFQWYyTmJRcVl2VDBHalU0bU0waUJE?=
 =?utf-8?B?SXBPV0JuL3NhUFlJcVhWRTNVbHUxODduZm9BbjJDUVAvVmlDQldpMk8waEJz?=
 =?utf-8?B?WldtM2M4NFl2Y1N6UWRoV2JDa1pMbVJoOXpoT1ovbTJneVlHWk5OU2tGSDRr?=
 =?utf-8?B?SGNseGR1d080UU03ZUU5d24rQzZzQ0tmRmlxanREOFhsQVhka2VaWEtua3Fk?=
 =?utf-8?B?VjlXK0FJbEk1UEM1anEzZHN6T2J4cGxhTkdhL0JxRVZPUURXeEZXQUpEUytt?=
 =?utf-8?B?YUJwU2pJRWhQU2VCNkZKcDhOaEdnc3NXa2pvUktBK0MxR0hUb3NocE9US3Rl?=
 =?utf-8?Q?I2TG1RwwGv27SOcXv44gjf41J?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	2C1lJwlxSvd90xPo+KK1WY8xXxtZQQLhG1JfqLiF8ySLBn7W69NVyqgh7lGdwUdbrDfqL8b7llksWxF3QDzDL0uI08DmokDAQ3OHxwnbP3nr+SvMFw/o1+hwSosd6cShXWNKU4l2tPWcFJZ7E1T/SQWlGO20yDG282pscNOCD/BYpwcX3UCp6XIlldX//i4Nsua4wLuJJjxJfm0pG1yfQgk5yM8YVQERbExMAtJaAJg+EUbhGzN4LTFANiPdNScPQEDOpndT4xNjC292rapsTYTyoAL8nvX6IqH/ldn2iOaed5VSXkyDoNP4PGGfLaLY7ws6nk8Fj2Wd6waKMJgSh6cA8gbeHyAqhGd//JSUGnjJbvAVNU/69qesoBW5djayL4B5liQAkXVMw44UnXSsBQgJ4SG39niHlB2jwCba9F6lVKvgGQH//blrofyNIHglchv7eykX3BvIj3R/hqeGAZCjKslnq78qVfQO1NBC70s4HlfDZaKJi8p/XFP+DDgMeFhOundSXip+mBiHxCOJvhB4NuDip97/UCpjINkW7tvY6Xlz74PlPNTOO/jt8aX6yZCPW0e5WT0GUQWNNFrL4jzglroS+M3Z8+OinceC3Ic=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f5f52de3-0dcc-4307-0798-08ddb9a62c0b
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2025 20:22:31.3396
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cPv8slvlJWz18wZ6YlXhKZ7H98Oq0xz0WTdZ4oigfqFaaPSyx3oIHU1TstnFa0wUTANP3qkcf3D6rGgVVaGNJg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB7804
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-02_03,2025-07-02_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 spamscore=0
 mlxlogscore=999 malwarescore=0 mlxscore=0 adultscore=0 bulkscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2507020167
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAyMDE2OCBTYWx0ZWRfX2taCNCY4SZgy bbRpYoIuJFBxpvlXLfZUP+Sc6p4/6e0V3TYor+YlZ8MHgBx2mjpRu2u/fBzUyGF1rO3XgRD8MoC oSg7Xufxv3nJOkgjk2lHf+LD/OrpSasUPZnXiujW1X02OCvDGLSz+A2UZ6ZZcYwe5juY+mwQ9Jv
 ArL2bvVJVGr1CKLwRhv3QysdPogy9x6tAIG+E+qOaZg5pv/qC2DpoOgIJTW11EQkGrBYkdsUJNF HiYxfjKabvvBN7PqLhzi6F9Fot3fkRwFJroc9j8mwR/qjYZsD76fCIyOEP/eCZIGNA/4mwIkoXX Vkm/w5QjzdyAMbWsygFGPsuAwOyB0UBC0Nc2YYKIgReGVoYgUQ3VrkTG8KIONfHbeDXM+v2dSi3
 InGYe+bHyW93zblZBLBl0XCGM/5uqQtRU7tKECcX6/cMseXNwMoya+9vv8encUZYblcs5KbB
X-Proofpoint-ORIG-GUID: oH8WzJiRfTjgltbSCJVENP5jrsLol-I3
X-Proofpoint-GUID: oH8WzJiRfTjgltbSCJVENP5jrsLol-I3
X-Authority-Analysis: v=2.4 cv=QfRmvtbv c=1 sm=1 tr=0 ts=6865950b cx=c_pps a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=4LI-T4ooyjUurB_qkkEA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10

On 7/2/25 10:52, Alan Maguire wrote:

> On 01/07/2025 19:31, Eugene Loh wrote:
>> Very simple patch, but one key problem.  The changed line is preceded by
>> a huge comment block that goes to excruciating pains to explain why the
>> value should be 4.  So, I'm fine with the change itself and I think the
>> "Because of the complexity..." sentence in the commit message can be
>> dropped, but the comment block in the file needs to be updated to
>> explain (with corresponding pains?) why we need 8 (not 9, not 7).
>>
> Ah good catch, forgot to do this. I actually think 6 is enough.
> The additional seems to be a result of the various complex inet_ntoa*()
> calls in the tcp.d translators; some have ternary operators with
> multiple inet_ntoa*()s. The origin appears to be dt_cg_ternary_op() and
> that has the comment:
>
>          /*
>           * Strings complicate things a bit because dn_left and dn_right
> might
>           * actually be temporary strings (tstring) *and* in different slots.
>           * We need to allocate a new tstring to hold the result, and
> copy the
>           * value into the new tstring (and free any tstrings in dn_left and
>           * dn_right).
>           */
>
> So if we have a left and right ternary and both allocate 3 tstring slots
> for inet_ntoa*()s that means 3*2 = 6 tstring slots should actually be
> enough. Additional testing suggests that is so; does the above make
> sense or are there additional things to consider here?

Ha!  I do not know;  I prefer NOT to have a headache.  But maybe there 
should also be some tstring stress test using inet_ntoa*() and ternary ops.

> I'll update the
> next version with a comment describing the above anyhow. Thanks for the
> review!
> Alan
>
>
>> On 6/10/25 09:58, Alan Maguire wrote:
>>> Because of the complexity of the TCP translators, more tslots are
>>> needed.
>>>
>>> Signed-off-by: Alan Maguire <alan.maguire@oracle.com>
>>> ---
>>>    libdtrace/dt_impl.h | 2 +-
>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/libdtrace/dt_impl.h b/libdtrace/dt_impl.h
>>> index 68fb8ec5..10424f9c 100644
>>> --- a/libdtrace/dt_impl.h
>>> +++ b/libdtrace/dt_impl.h
>>> @@ -218,7 +218,7 @@ typedef struct dt_kern_path {
>>>     * - cleanpath() holds a prepended '/' char, a string, an appended
>>> '/' char,
>>>     *   and a terminating NUL char, or STRSZ + 3 chars altogether
>>>     */
>>> -#define DT_TSTRING_SLOTS    4
>>> +#define DT_TSTRING_SLOTS    8
>>>    #define DT_TSTRING_SIZE(dtp)    \
>>>            MAX(P2ROUNDUP((dtp)->dt_options[DTRACEOPT_STRSIZE] + 3, 8), \
>>>                72)
