Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ABBA188A3A
	for <dtrace@lists.linux.dev>; Tue, 15 Jul 2025 18:34:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752604464; cv=fail; b=JiPPx0Ztrzmg0E+tnLZPoOFcWG4kkuJhc/9T3oB4ql8135tB9PGMJgPiWm56k5tXiW4KFwiZfTtAHtlGCe9I+ovi6eRfJooa8YfUW6/IFHCWHqN1RhhlVV7BEs+JULZf7msVNLArD0Qa/3Zdb3OsYrdj1XYd4tw6s7Wb60CMegc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752604464; c=relaxed/simple;
	bh=Fcbac8kvquIhTITXzSWYJZXFthgRMv9U0P2J/4FlYDY=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=AUlVUJc3mQkGwGbji4yd1WcfZRN+9yRhWLbIVorhO+QkJxnmPaEw2h6STTDqWfQFD0I6qclwDEz05SX2i3qmwgecVBORashN7dMZ7JxsOuWX2aPX143cHLuV+sCcdWXz+RvG6U6Yj3gHOKyGT941TFA8SDYgI0lmt+ZbHobFBvA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=ICn8bEqM; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=m5V9LONX; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="ICn8bEqM";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="m5V9LONX"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56FDZF5k013531
	for <dtrace@lists.linux.dev>; Tue, 15 Jul 2025 18:34:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=Fcbac8kvquIhTITXzSWYJZXFthgRMv9U0P2J/4FlYDY=; b=
	ICn8bEqMl1LvLjbhHko/jTG4oPUXIBxffoyNPYEix9VodTdiGJWuW6TRD79Ptov6
	j78obxWp/h402KeExj9WxDQdiyyPvRFwUoNDkF3FIMHY6wSbo7Zebfmez7JrH3K4
	5lUTaTRdS/4HltIuVFicNqnVtvuXInpYjSwO74rvgUpm/qPS1DZebmuy6tD4fQvZ
	0z2c/xiFZV7DFv/iVHHqvJtX7nYGdxFrxLfuBUHcEX1LBslq3KzeuqxqiVOZuJWh
	ooHeKcC136ubjLbCgQAA2wliysjRBpZddUG9ZEtyPJ8yJySA929okVSlah+/EIlV
	ETnDQPmydvq1hSzs/qlhdA==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47ufnqr507-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 15 Jul 2025 18:34:20 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 56FHPn3j029769
	for <dtrace@lists.linux.dev>; Tue, 15 Jul 2025 18:34:20 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11on2087.outbound.protection.outlook.com [40.107.236.87])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 47ue5a3x8h-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 15 Jul 2025 18:34:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t6TyEhjVmKzCQI9e/CwAfxFpXihMyOrLNGX7iSUnfk9O08RABx34Ft0LIIJq4iLO5VngAoSq9QcM+1TM1M8pf6C1Dj/SSocTSQuih3Y+cTsmcHPumziDk7UboqbuMl3AgZWYBBJIP1jkRcP+Wv/ChkpVUn1gLb1DY14MrxaIJ5gKsB9uHrMo5kmV0EUYG/mBJkmcJHbZLaX7kO8eGIIx+WLW/u1LUSx7dW/uDLNyiBPfBfe8rbihW67y+Y6H8gXXu05qHWUuJPuKs6JM0kK/HY41xLQkXaWY16HR7HSoCTZS3nx9eUF6jp7pMikO4ilz5tZO0Fxx5WutvaW2ZcQ9Ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Fcbac8kvquIhTITXzSWYJZXFthgRMv9U0P2J/4FlYDY=;
 b=G4aBVJh+4Joo1coYVCebiZPC/1Z/0CtNIvtaO/81GVQExqiJppH/KrIQapEL+oXOuMApnpyBCDzzNTloT9y64hsIu3d49DWmOy6ASSEJzGELXIPi7W6AJItvJcF9tsCYoLuyfsG1xjFge3euR/bGKP+dM7J/b0t1akj13FEFtFd6Isfw9QOn1DSqAiMa5l+ucST185CxP/j4UbgSQ8FCP8lRwZSKZiMb/JuuZdQxioBF3Y3ykj6Gbhm/wGLoJhlNvvmU6/f4TdEzDl34HY7qaTHYnuI3/MltJSrVZYc44HJbqq4sqd8KmFhxkVa4b1oR64GrHYt98JuLXIPwumz45w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fcbac8kvquIhTITXzSWYJZXFthgRMv9U0P2J/4FlYDY=;
 b=m5V9LONXqMAc1lqlRbLtPzgsVXYDT8bh6ao0Mn+NMQeOEcUGcCGjgF9DmNK0hQ92zXGe9AfR/aHS/mP+hH7/xvsV36/y7G6a31i+wF13HCgS1umPVUxQteYMAmJykM9hP7VW36DeLV2sMsXcDqO0sXqIPyqT5/q8nhjhvcVTllo=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by BLAPR10MB4963.namprd10.prod.outlook.com (2603:10b6:208:326::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.33; Tue, 15 Jul
 2025 18:34:17 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%6]) with mapi id 15.20.8922.028; Tue, 15 Jul 2025
 18:34:17 +0000
Message-ID: <bc034e82-6990-c212-0daf-8012a8e527e8@oracle.com>
Date: Tue, 15 Jul 2025 14:34:13 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [DTrace-devel] [PATCH 2/4] provider, cg: add reject_clasue()
 callback
Content-Language: en-US
To: Kris Van Hees <kris.van.hees@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
References: <SJ0PR10MB567290541C554B9145DB3181C257A@SJ0PR10MB5672.namprd10.prod.outlook.com>
From: Eugene Loh <eugene.loh@oracle.com>
In-Reply-To: <SJ0PR10MB567290541C554B9145DB3181C257A@SJ0PR10MB5672.namprd10.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR13CA0160.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::15) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|BLAPR10MB4963:EE_
X-MS-Office365-Filtering-Correlation-Id: 4359ef30-aa95-4151-e6c7-08ddc3ce3499
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MTlXcmxtZi9oL2xrbTdONkNNdms1QThrVnVaWEhUSHZseFFUVzdqS3RnR0ow?=
 =?utf-8?B?Q0gyUkZOT1NJMDNuZExKZm05SHc5bHpsNjFEaHBOYXBGeUZ6c0tkaXhjZ2V3?=
 =?utf-8?B?YnFrSDVVdHhVdkgydVM4TDVEOGI5Z0tZTjBRR2ZRTDEvUzdveWcxTFdiVkRV?=
 =?utf-8?B?QXBqMlZlbS92TCtVR2V1QkRPakNwY3lyRE5DOXJYalpwa0VkSUtGbGdWM2Zv?=
 =?utf-8?B?bWpmMVR1YXBFckVQUVN2ZDN6YWhiY29HRXdzVkxMNDNQYThVUk5SUmpUeE4x?=
 =?utf-8?B?eG1nci8ySlp4TDI1b2FsVk9FSGJUSzk2U0MxbTlQdzI3SlZCeUVEMTZrMnFM?=
 =?utf-8?B?dWt5d1p2V0h0NzA5YmhIZmozVFdFNlVRamNIdVVYaWs5TDZQWE56a0ZqaEdp?=
 =?utf-8?B?dlp4SzRlUlg5VWtXWkVjUXhyVU5vSmN6cEM2Q3g0UDhBenN1MytvalVOcHFV?=
 =?utf-8?B?TDRtdytESFpPWkxFTG1uQVpmOC83VXpXdGYxcDlNeXg1VlNLRS93RXNycWFF?=
 =?utf-8?B?ZVRmZ01hOXl1YmJRNDRYaXBuM3FoYlpaS2RWN3VLUXZBR0JSVnhwdmdLVGxy?=
 =?utf-8?B?Q0ZSNUMwVGhoeWllUU52OEZqNlVSc3ZhUWJCNTU0VHJJcGRET3RyS0R3TEEv?=
 =?utf-8?B?ejJsVTZHM0xwTnY4VFR5a0twKzZDbE9WRkdkbkZYU0d4U3huODhEV1VDay9D?=
 =?utf-8?B?NFZLYi80cmQ1MUk1b0ZUYldCV3d5MGgwSlJHSVhucVN1YUtrN0lSbFJ5SXVK?=
 =?utf-8?B?SzByd0gyRkhoTk5Odm14eENCT1QyYXlleEh2WEg1dDh0MjR3TUhWbEE1Mmwv?=
 =?utf-8?B?U0RSZ25vWjdrZ3c0amx0QmNMcnBhWFZ3dHZFNktaY2NmSGJmTktzWDFJOTRY?=
 =?utf-8?B?alpZQkozUG5JM3h2SmtqK1F5amU1UzF6d25FQzVINDJTeStyT09UMDczZHJV?=
 =?utf-8?B?dzBQOXExNGxTVjFoTVo4Zy9OaGVLU2JVUXhaU09rRGJhN2xDaTFoV3laMXY1?=
 =?utf-8?B?NFAzRWxyejRDdDZnbDZZdWt4VStPQXU5ZU9ZWTlDUld2endXS0VQVWtLVGdG?=
 =?utf-8?B?d0FVOEdmTWN0SWR3YkJPbFhzdHZtRWd5YVVuYk5jZmE4UHNOcFkraG82eTJt?=
 =?utf-8?B?cHpFSjduOEd4VlVoandKbzhhOEZ4M1Q3dWtxeHFLbXBhQjlrVWxFN3dOMHlN?=
 =?utf-8?B?WFpoN3doa2hxd1BrSXhoaVpuaGJublNydEkrQ1BoSDR3dGljbUw1bjNtQjlX?=
 =?utf-8?B?NEg1dkVYa0dRMFZLNGU1TW5QRmRuQ3oxMFpOcUtaUjdMblh5dGY4dWZYaG9w?=
 =?utf-8?B?MzZrMENoeFplZVhBZ1dOREQ1R1ZYOUF1TmE2OHRXUHhzeDA0ekswQ2xSZHlo?=
 =?utf-8?B?QW9qUDQ5SytUbkhNWk1nK25SL0NGZnR6djltY3d5Y3NsRWkvVjBQcEN3TUhh?=
 =?utf-8?B?bTRTdDNYNVBsSW5GQnpLMmJaa21DMmpBQTgwKzdicDNPUDZhaVFST2NoRThv?=
 =?utf-8?B?SnpPVlFGaHR4NS9nTzhWdzlBbGRiUjhXRk5abW84cVBmenhvRjJzMVRHZHZY?=
 =?utf-8?B?WW1SNmFRbklmOXlERFBUbEozazNWRjhVbXpJNHF2bXFSL1V3NlRiOXVJSG81?=
 =?utf-8?B?SzVwYWpMM2VzblJsOWoxK252Y0RKTHA2Q2gvN0QyTzViSUcybEwxbGdSbnJu?=
 =?utf-8?B?SisvQlZPNWltdzFGTHpReURwRFRuL2MycTJqQ290dStoS3RpMWdGNVVhRXRt?=
 =?utf-8?B?Vkc1bHlQMWx5dUpKV3VWVDlKRnpxWVRtSkllWnNGMzZGWE9KZXBnck5XdUs2?=
 =?utf-8?B?NEJiQWdpNkk1YTZaR3djald3NjdYRWJWNVB3UmFaWjdacHNiVEhaNU4vMDND?=
 =?utf-8?B?RWJQMkQxZk9qSmJLSTVvN2Fhem8rVlplbUVGN2hTNm95K2ZQMUVZUUxYc29m?=
 =?utf-8?Q?KBIBqUJfts4=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VnhpVVFocXlldWNNdmpQVVpaQWZOanVGdzdRVEkrQWM3eVBGNWlIb2ZWbTY1?=
 =?utf-8?B?WVFTbFFNSDlOOW42Y1FieVhMUElKdTBhRHY4aFFSTkM1am9LQWU3M1JkaXI0?=
 =?utf-8?B?MFU2aVpmWE9EWm51Rk9ZR0pjUnVMZEtFNUNjWmwxM3cwU09MN0NHQnhHblgy?=
 =?utf-8?B?VmpxZTl1Y3M4aEtoTWRzelhKc3BOdHAxSWh3UFlKc1ViT2gzNXJPUldqUTN4?=
 =?utf-8?B?Q2wyMHg5KzU0NUlWZURZUHpRaXVublk2NjVMbElMdWxCb1g4aHdOZmo3cGta?=
 =?utf-8?B?ajhUd0l4enZaZ09ZVVBwZ2FrdTd1MnBQSjZUaWNHb042MEtQV3M1b1IvejVy?=
 =?utf-8?B?SnVrb2ZHeWFNUHNVUjQwbUl2M1VnQ05LVnNtSVo3QTNBSjRibGl5ZGQ1Rmk0?=
 =?utf-8?B?WWdnS1cxQW5nZnVyZFUvZlJXaTJkd254UjAvaEh5bnRycHFUU2FwWWtYT01x?=
 =?utf-8?B?cDM2cDFzNUY3TjJLZDZZMDdwQk5Oc3JUZ1lyWkk3c0RxZ1FGbEMveHcyVklH?=
 =?utf-8?B?aG9qelBFUUs3TTEzNlFXc1RrOVhpaVpQNkZXQmcwUktNUTlwY2djU2ZRbDZC?=
 =?utf-8?B?SzBsTE5oMlF3UjRQd3hvVmVycU5KY3ZDNjIyY25kN2FFRGdhY2pIWUFQQzJa?=
 =?utf-8?B?UUhMZ2FPTEV2VkJicklDdU42dnhXY2Z1bkt0ZXRaVHZWTUd5TmNTYkNiWEI3?=
 =?utf-8?B?U2paT1BVOWcvdFJra01qYWJaZTFkdFQ2T2hubE9FYXFkcDlFSm5WVElmek1y?=
 =?utf-8?B?aWdJUUcvSDhib0Nxa3l0amhrUkVkNjI1YWF4MmRBeWhYZXJuQVJmR2lyUFBr?=
 =?utf-8?B?SjJyWnF4Q2NRUVRCeGx2M095dmFSQmtJSFBxNjhESGhUVmRkSHMzNG4xdGNV?=
 =?utf-8?B?OWZEdlhuSzMzYUQrTVpITGJoU0IzQnp3Q0xqN2wybUViK2lxRGJ6c1FOS0tX?=
 =?utf-8?B?WldjZGlEVW9xbFcxOEVOMHVZTGNKNXlHOUowZDV6cVN0b0Vnd3JVY0o2VDlv?=
 =?utf-8?B?VHJuTmFoM0hJUk9KSmI0SDRycTZqNTFxdlRWNjBWZk42K1JkTkRXN1RoVTh0?=
 =?utf-8?B?anFZTVpYNnRhZnFNYVhDcHlQbkRNSTJKRzZxbURIU2s3SUNySlByaGZjY2Fp?=
 =?utf-8?B?N3d4djRwNzdtTTJSNDdkSWZvSC9YbmxQK2JvSlB0ODE2cDFoc3lOVnRoN0pS?=
 =?utf-8?B?TkVDR2hwR1NSOFJBb2Y5S0M3SDlTeHJOYTRucjhoWUhkbnhKNW1aSUxvNmRV?=
 =?utf-8?B?SVZyUXQ5Q1ZNVEs4dHkvN04wYVVGQWhUTWExdHZzNUR5elhkdmtPLzRzUkxE?=
 =?utf-8?B?dnpWNm54UjlzeDFHU3h3cVN4cEl0bVpQQ2lWN3VPckZEaEhyZkMxQjVwM0xH?=
 =?utf-8?B?RXRZZTFXNE1aa053RFU5dTh2UGUvb0dmMGdEUzRhNE9jdDllaUlWR29LRTZE?=
 =?utf-8?B?bHhmYSttMzlQVzRxczVUK2s1QVlvZUlDZkhPYmxvTG1IOHZHSW9xRllxRVBn?=
 =?utf-8?B?T2ZMMTY0N2pKWElQQlNyUWlrVFRuYUY4Qi9NbUhkOGREY09xSWdrSTV6OXFC?=
 =?utf-8?B?TjVRdWZLQ2ZNLzIydHk4MFNtRVM5MEdnTGthLzBCZTMzNytnK01sWUlVbVQy?=
 =?utf-8?B?WllYa2M4OFQ5NVlkVjhEK1R3RmxHN0FqNEo2RFNoUm9VZVlDa0xwSWpDZUd4?=
 =?utf-8?B?Y0lHbnhKRHovQXVzcWxTZ0VwSWtWdmFHMmxZU3luM0diekU1MFUvZTgrK21K?=
 =?utf-8?B?RldWdVBvY29rMTBZdkVpOWdZUnRLTENTVktlYmR4WXNxVnpVNE5nT3NXdVo4?=
 =?utf-8?B?U1gwYUJESTEzM1dYWnlhZTMvZGJLQ3I2cUJsdzdyc3lvK2JBUHRYMGM1S21t?=
 =?utf-8?B?TDZhajJqQmV1WDVBSkMwU1diWlo3R2VTRlhwVkZsTjQyZU9RamxKNVRsSkhz?=
 =?utf-8?B?WVJ1TERiYW12bHcvMkRsZ0l5cVBBbUNzZTVOTGVkRTltVEhaQU1SUzRXeHpt?=
 =?utf-8?B?eHlEMWVzSFFNTlNUSmpxTkxWck5udGZzMWE5RXlOKzMrenU2WTBpdVdGdXVq?=
 =?utf-8?B?ZDJHRk11NXpOVjY3TTgrM0tCQ2txZGttOFVaTDJoYWs1Q2ZpRWJTSzg4NWJH?=
 =?utf-8?Q?O5PPYsbosfaTzV2zr17WgJw2j?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	cmrnUHWUK3vxJ+LqkVY2NYepzLnegODH7JuNZW+eo9t9bwK8kYTm90YRD5Pt2YLrE3SmFAYt5O2Q5WAwGpo/Mz94fD8UuPEaF0N32Mm1HUWQ60QNxxO6QFWJ8QhL81fpGMgCrg/BEs7KKmXmpBqxbHxGdy5F2tIMDyWJOD9eWv/bbEQCmlfDyauXkk6HmVU8jlD33q7Y1p/6sO+o8jDePldYgF9No5lkuXIHulrp2ioeDt29TPFTqAXqHwI3x8VHxr+7zUV+42kVRZfSxOdM7KIAtbD7jVgyhYDbZvlJO92XRM6oV3tz7m0YUf+zgs8Xchmlu4IwkZOTbCyhBL/grFzZpVFpHa0Ny9d7YNBeiWE1ruHIvt8szJsNCR389n+/zXUGowPG8jjQrpxIWQV9alObA/dUF2Jf8nKchls6A4k3TIygQiOVIzw65Zwqt+Cfyhz2qI/heGNHyQ4W9lrIVk+iu7Xn5XDFB6rdDTc+4ezS4+1vZ2/bjBd4B5x2uuteKCTU4WjWqx49P+TMn+JVjCsMZ77Ej4w54tSE6kObVaEOtbjJ5/gnU3dW9FtJjFJhIfuP59wFaYIZNf7s1BNqTUjUS1XmcCyOKfEEjJDYmVY=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4359ef30-aa95-4151-e6c7-08ddc3ce3499
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2025 18:34:17.1447
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ES8UY/6iReBTgJRvIpjl6xH38qh799GmtR0e/UhOcCHOC3sJ+70n0cYo+GxcexsvSHqjRjzeQPAGmQTLKWcAcw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR10MB4963
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-15_04,2025-07-15_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 mlxscore=0 spamscore=0
 suspectscore=0 adultscore=0 mlxlogscore=999 bulkscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2507150170
X-Proofpoint-GUID: qw3q3VDUCLgY6PjtM8cHYLFQ84UPfy6G
X-Proofpoint-ORIG-GUID: qw3q3VDUCLgY6PjtM8cHYLFQ84UPfy6G
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE1MDE3MCBTYWx0ZWRfXzeLLXRV7INPm Yvszk1emxcti07oZfbjWluSHjuen5kuW1FCkvwwwC4CIdY3QUQYS62UZ+NpEJIywh5uf4JV5lBi RXVPncPN+8fp31DGPbk8Uyv/usJrgFURTCCCyEXZU/gIA8SraCVQGc0tZuajqTqiGA147ElThxB
 pnD9EJz3BdwL8KRtvh+o6EMEqNJILLCZiSIZVeEfIQKvHVXYMKEBeNbL/8JV9QeQdvWI/Oih5zg qECRRR4y8lx2iVSDnc47pClR+VPVlCa29UGFNYEr5rrtQa0gOsJlUXiX+O1ZNOsuGsGx/boSKLF 8mYPGIR5i4DohQZYaiqTA0J2dUrEDdvDWn6Y9ooMI781MBZluKW4Nlr67gBzJu+d6oZDWwH83XA
 551iEQJfKVfvO1WcO83KCm/LIBdFAuJAf0UCui+kABtY2cVwvlVsaVD+aKoUvXcP37GXodA2
X-Authority-Analysis: v=2.4 cv=U9ySDfru c=1 sm=1 tr=0 ts=68769f2d cx=c_pps a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=GoEa3M9JfhUA:10 a=uLbO65oCH1T_8iF7RIgA:9 a=QEXdDO2ut3YA:10

and the clasue typo in the subject line

On 7/15/25 01:48, Kris Van Hees via DTrace-devel wrote:
> Future providers will require functionality to determine whether a
> clause for one of its probes needs to be rejected for some reason.
