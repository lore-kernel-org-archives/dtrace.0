Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F08E153814
	for <dtrace@lists.linux.dev>; Wed, 28 Aug 2024 21:01:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724878878; cv=fail; b=Ng07SC0yhBKfMFCeHRyRPYCp6y3NsYavUTP94+UbV7OnWykHOkNuxo4pcl52nKlSDGqrUZ2uP2v3B2xPq6IHbZ5rFEXvubQlqWbm24x5xXZHs2WdVBZ3km1O8W29B3vHD6+MS/lCSufdFntPyiqjwn8fiL2/HzwZm3vrRstvKdo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724878878; c=relaxed/simple;
	bh=xzP7ztqzraKQ570VgGL+JUJ20eCzwCx5y8HHjbisotw=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=H2+PSHnmXVWmZQk7ebKGYLKHbUKFiHQKVbbzefRvi69+c7O1H/StkjBz9+gpopnmS+7M6kGvFsPxynzRq1sQ2zFkqWjzPiWygXSjyeGG6uYh+pcHf5IBmFM9ERLrVYF0WWux9wWIZIJIO9WQdulqPOPHFHDCIPQbL5aBdgx5X/s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=C+SosGe6; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=DilNnlsC; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="C+SosGe6";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="DilNnlsC"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47SKiP1k014015
	for <dtrace@lists.linux.dev>; Wed, 28 Aug 2024 21:01:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	message-id:date:subject:to:references:from:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=
	corp-2023-11-20; bh=5QlemI53EiZrquYv5kAnW0xfaTc5YBH1ADj1POvEFR8=; b=
	C+SosGe6QoOtcC2ikSpIGo1pR2E+p8Tk8EKx4QAEDpd9c65T3olDD4i5fE2FiJiW
	48bSfN8T3Jz6NaGpCxSWRQjcWRbVLknvXravXgKzsEK9fx+vHJ3I20YSjKv7m0vD
	o67/Di9YSrlzQHlfmgJL6t+6OaTBtIkdrKPEGnpY/dZYCQx/9CQoZOgRj+dFLxdp
	EE4I2rsS42bkY05BLcZWpJJY5s+DAULq1qaWsDS4rSjE70gdJH3iCo/FifXH9Rur
	UUc1k8hBsTbUBDGkCDN0H0+W9Lm/Ys5TfuwbsCfmidmmK07cEAKyM/T0UMYQP/nx
	8pu30PRO/nT/O1+Gudit0Q==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 419pwyta3p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 28 Aug 2024 21:01:16 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 47SK1kfB016835
	for <dtrace@lists.linux.dev>; Wed, 28 Aug 2024 21:01:15 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2174.outbound.protection.outlook.com [104.47.57.174])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 418a5u999e-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 28 Aug 2024 21:01:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F6VOW4/4uQZzLJj5ikSd4+3rF9Yo7A2by8t5VJio9uR9HHaWoEEpYrCv3ulO8EOQbG/7B1v8AXusd4TXCh9CaPZiVyoh1+jIoZHL674hUnJcGtqvNrz0YaLFSmqRRiezHqj7H047eFVRcnSFy5/VA1zP8gov+A0yK9277pjbHKlpkTtIcA7BchxxQkaEOGaO94vlip7ZpxRKug7LXlCetodZKrAlfb2dppJFu+xW3dS62Aiqo+46Gl2TUoo0rK3TMKeRY0UblIC7zuqYDiAJPMw1Z0Y3xDJxZZcz0nYdT1s39IeWXXcX0Ham5jSPEEVuM0FMGSrcVx0LwA6c7TNGSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5QlemI53EiZrquYv5kAnW0xfaTc5YBH1ADj1POvEFR8=;
 b=WpeV1/sKtPxG9/JxOEDX11APBrZqQQgkJLL88xryYPpQJbGaWOmOazEkxezxK4rbUKzY1U945C1LnxPw9r0zOtiSvkyc0d/p7JZVtJTg2iG03ZUb7k1a3du34AsYsAKvTER9MtnlngA0Dw2PFBYNcb0wLbdgXQMVs1OL+TkRCK7+vwj1oidmyx+NsIRmphTZj/xUTFeiGjLSJyzYoCuTES2QIQUp1BX/NEFgQGnpQwLmDe9yjT4Wk6ytZCpxrbiMZqDeMgZhsfHzYzf30tQTpiw5uXPyExcONLc3R5IM07y7QhcmTOMUGd/P6FE2XmEDZX4hJjMhwy9YduxIRFBJmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5QlemI53EiZrquYv5kAnW0xfaTc5YBH1ADj1POvEFR8=;
 b=DilNnlsC0HOVACvLDoANchcV1SUDA1PKqLZ3HDCg1WOT7jW4phJDlqyx2T/mXJZcefnsIoZMfZIEka4bscq7jPXIu2nuMO4dl0LDXjGIQYN089hLxF5mz93u1Gawr1tjg36CRtJyNqoE77Pe2A3LmXCWRqOOTi3tqXbKkD6xNSg=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by MW5PR10MB5805.namprd10.prod.outlook.com (2603:10b6:303:192::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.10; Wed, 28 Aug
 2024 21:01:12 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%3]) with mapi id 15.20.7918.017; Wed, 28 Aug 2024
 21:01:12 +0000
Message-ID: <1dfc8d6e-4a69-e43b-3c03-f2e55549c567@oracle.com>
Date: Wed, 28 Aug 2024 17:01:06 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH] ident: fix unsigned vs signed comparison
Content-Language: en-US
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
References: <SN7PR10MB62878756B7ECA31ECDD54F00C2952@SN7PR10MB6287.namprd10.prod.outlook.com>
 <ea76fba0-c7eb-de97-685d-ca969d87f784@oracle.com>
 <Zs+KEuRUq5PzktIM@oracle.com>
From: Eugene Loh <eugene.loh@oracle.com>
In-Reply-To: <Zs+KEuRUq5PzktIM@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0279.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a1::27) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|MW5PR10MB5805:EE_
X-MS-Office365-Filtering-Correlation-Id: d56957db-576d-4da8-3dff-08dcc7a48c17
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?QjFQd1pSYTAyTSt1K3BkRjNyVjF1Tk8vWWFWYmNFemdZemplOTFoMUlqSWxZ?=
 =?utf-8?B?R2tmcSt0a0MxbDhEdUgwSUlnaFF4eWhtaThHNThBNWV2bHhFNFdmbHpYOXF3?=
 =?utf-8?B?dnEvOVVzWjhrZmQrTXEyUUY4cUkxOCt4eWpLZU5ZT0IzYWU4eGdYSVdTeTF2?=
 =?utf-8?B?Y0t5cFhGaGZaUnUyUjdYdXZsYi9LbVp4c2xpZFRtRlRnRk1VcGZQK2craTF5?=
 =?utf-8?B?alBKdWtod1lNU3g2UHpLUjBwTVNwcVMxR05Fb21QamtGVlRxWGxmWkNxZDU3?=
 =?utf-8?B?YzFiL0RPbmNsQ3NsbndET21lUG5PU2RDVWVoZU1zU3doV1VEZTlYR2lYcWZx?=
 =?utf-8?B?VlIwYmF0dmlVZkE2TXBtNVN1elphWEtwQWdGZE90SUZQUUY4cXFvQUJvVWpU?=
 =?utf-8?B?U3dIQ1VCVGFpeTR4anZWbDBscTUvY0J6aUI1Ykh1bGxacThueERpWjRmZDYw?=
 =?utf-8?B?cFRMc2REd0JzbW51SFk2UEYyemhPdE9tY0VoeFRZbDBpNllENkh0d2NMR3Nq?=
 =?utf-8?B?TzRudkdDdFRzS3p6eHNpZWx0M0hha2FlOHh3NXl3SnQ5OGR3dDBqQUFHTnZ0?=
 =?utf-8?B?bUY2K3M3SUZ2WkhtRlFHbzBPOTA2L1U0Um5GRzJrVUVyOTNvQk1Id2lJd2I3?=
 =?utf-8?B?MXkrNmJRbmV4VkV2S1BDSjVGZGh3NExqWVZyWGRtSjcxb0I4aU9wOUJudytD?=
 =?utf-8?B?NUJ1MXlTZFBBVW5jRUM1eHFLQm55T1h2T2JBcE1QSUUrUk82VExzbCtrMDRG?=
 =?utf-8?B?ZGRzWVZjSWNZQTU1Mk93V2lMb3lZdTAxbEk3NGFrK1BRanliVm9GUW5heEJL?=
 =?utf-8?B?T2lhbmVLdVJBK2cvS0NmWGlxc0o5WUJOVDFaRnNUR0haZ2I3ZzlnOVNRYko4?=
 =?utf-8?B?KzNxV3NSbzk1SkVoTW81RUp4MUcyektISmhVYk9iUTdBYVIrQmMzNllxdlZN?=
 =?utf-8?B?b3pXNUZWNGwyYXdLQkEyTjJMaDRrNHVYZEZxeTBhWHA1eHpmQ0VUaVl3eUcr?=
 =?utf-8?B?NXZ3dFI4Z3RiSU9KWmxSMkZpcHVGVmVTeHBFdnljeXdEbHdQeEFwN0pacEVa?=
 =?utf-8?B?aTg3OG0wM0NKblV3dUIxRXZobzltWnpJSkwwVHJWRVVKSDk5bndGQmNyTUtM?=
 =?utf-8?B?eE9RY3dvUGRiTHZITEViSVBZTWZZZHVOcWZxdE5hVVdSbGFURWdwS3ZuT0Vw?=
 =?utf-8?B?VlNkdWVrWUlya3l5dUM2cVhtTnNSdFdyUGsyaEtsMVhka0oxMVpzZE9Pc292?=
 =?utf-8?B?SWx1OEYwR0pGSzVjNXJOWjNZdHZidDR5SGlJUEo4QWFHekExempndG9WVG1Y?=
 =?utf-8?B?K3FheEhQc2NlY1ZZMmxvSGFhSGs3R0xDdlJqOGRZOVdXNzlSNjlIK2FINHZD?=
 =?utf-8?B?a1pzMnBweU9MUjdhVTEzdk1qRnlWVk1tWE9RcENyZ3VJTlVKSTR4OFI2ZkZo?=
 =?utf-8?B?aHlYRC9WTFhZR0U3MXdISHRhemxGS0dJemZmdWVUaDl2ZUtBaU1YSEpHc3dj?=
 =?utf-8?B?RElJRVRISisvUlIvc3B3WEhqNVhjRXpBNEd3d29iWjZlTVdKUDkyVE05T2NV?=
 =?utf-8?B?T0RyTUE0RU1tLzJYQzJ4U0J4VTdlSmgvUWtNeE50alIyNTFHQjZnUTlBYmhG?=
 =?utf-8?B?RURzTFVDK3dwQW9DZk13UG5GZHpjaTVVQmxadXhlRSsrU2lwUnlQVSt5K0V0?=
 =?utf-8?B?ZFpIWG9oejJtU0xLTUxXVmlkdjJUbFRYMVBidlBmRzJ3bWFJb3NHa201VkdU?=
 =?utf-8?B?dGRKSXdxUkpxbHVSWFI0OE9ldk5ocnBPd0ZxK3A2WnhhcWFBWkZFU0RaSXB4?=
 =?utf-8?B?emIxaUJtYm9EWTRNWThNQT09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?L3ZEUVlRV0VSRGgwNytLYnRxb0dQanJKb1RaVHZjWnhpRjRJUjJIZzVxcUxN?=
 =?utf-8?B?UU85M2xaeHBDNlU1ZVRSQmR1eTUzU2FuV3RDWk0vUmdzT0pFNDdyeWppa1do?=
 =?utf-8?B?OHFqZDc3SzRzZXZwVkFEeXJoYllhdndOeGl5U1NTY1grcGRCN0NpRDB1TWFE?=
 =?utf-8?B?Q1puZ05ReGx4M0o4d3cxWk1OeVFpSGt0NG56Z0gzemVUN0k3aW9LWGo3VEtw?=
 =?utf-8?B?bC9OZHZFZUFXa09LbjBtV0d4Q1YrOCtMRGIyYVcrN0lFalc3ZUNPVnVkZWFt?=
 =?utf-8?B?NnNsT0U5NG82emoxMWhmU0hPcHdaTnJ2cFlsRWJhYjVMaHVmdWRmTXNDYlAz?=
 =?utf-8?B?c3NHWjJXT05odnBuQ251WHRRbUU3Nkp2NHg3eGR4dEk5dVd5ekNmUmd2VGpp?=
 =?utf-8?B?R2dYYUpoTG1hRHE3WW5YbGdqS09KU3VaSXJZb3FIdmdjTXM3MlBvZktER0hP?=
 =?utf-8?B?Y25TQlAvUm1GSjJmVS9rTEpOREpCeWNPSkFBRmcxU1ZFOVRCZVRzeWhBOUxK?=
 =?utf-8?B?MG1NMUNaWDJxNTRzd3o2YlpmUUlTMm42bnNoU0FONnVtQTcyMjRzeGZGUUZs?=
 =?utf-8?B?THVpSTJpRjFiMHZVSmJGelJNNHlMK21pYWhyOFdUWWZnQnRJN0IvU0NnOEln?=
 =?utf-8?B?aG0wSXpBcnc5OEpWbW5nY1ZLWnlLeVNicVlYZTZoWkM5TjQxYk5DZGQ1Wll0?=
 =?utf-8?B?VWxVMkZ0RStPQ0YwVHdzQmpkWTMrbmUzZGo2OUJicEJwZHo4YTZRL1NSRTB3?=
 =?utf-8?B?djZyVnoyTVFiV2xRMSt6NW8rNU8rQ0k0THJmaHR2SkZDYk5VL1I1R1BTTzJ1?=
 =?utf-8?B?UWt5OHhvMW1uZDFTYmVKNmprTk1Ka1Nhc2h2Y1lYMnluZjY0c0FVVGRMSktP?=
 =?utf-8?B?MEw0UmNkSW0zM2NrNzQ3R0o2Uld6SmlHUnZKcnl4ZUxHSEY5eUZhZUhtK3F2?=
 =?utf-8?B?N1hIL2JSZWM0YkNsMXZwVlFLNW03Qm1lZzJGM293OEx0STdacWlYVjVSQlZz?=
 =?utf-8?B?MEZ4NjlxL2txM1ZKTTU3TVZEWGtnWUZjb0JLVGVjR0RwN3AyemhSTUVoU05x?=
 =?utf-8?B?YlRFZnFSVXloTU5kV1lTVkR5STRDaGxqZmh4NmpKMjU3SDhLTmdERUxQRXpN?=
 =?utf-8?B?Q1FTSGhZRFRXR1NIWFBOd05zdUg0YTRoVDhOWEkxUzRnam1SZUZtRm1IV09p?=
 =?utf-8?B?WmZmWUh0TXNEQzU4UytQamo1aC9QWFBQQVR2QzZrS0l2dnNteWV2RDNVeFNQ?=
 =?utf-8?B?Lzk5RGhrdUd0SjZIK29mRDBQYkhIQkZSRE1CdUNDa0h6MDBZcUxyY0w5TlFt?=
 =?utf-8?B?QUFIYTFqSUxuNkFwZmZsZGRWVEtwRDZHQU5sa3FuZldVV09PNHpUcUhSMHhT?=
 =?utf-8?B?MmRkTmFJbDgzQ0hkQ3VsM0VUZ0xRSWd0WDhHclBobzNwMWovbkJrSEZpTnQx?=
 =?utf-8?B?eGEycWtvMFFkRm9JK2Mvdm9Jbkt4RGJISURqZ1k2Z1dKUHlmazlYSmN2cC8x?=
 =?utf-8?B?WHdsTXNGaFNhMGV0ZXdxUmlqRW5KME5wa1Bjc25EcUpqUVJLbklyc3lBTVlZ?=
 =?utf-8?B?Tjg3T21QdjJ3WEx5NldSNEsvRmkrV1RPTjlCbnhlRkZCdk9xOWkvQ3FIWFFi?=
 =?utf-8?B?dHd2T1FtZytWeXpUSFZUa0JVWFBsSnpSTUF2ZGViSFl4Q0NudjBQSWxhejFy?=
 =?utf-8?B?WG4ycDRUOHN0SkZ6eXpWbzVDVHo2bm5pL21PZnQraDVaNEVJTVlwZG5iRi9y?=
 =?utf-8?B?L0JjY0JwMjBYK3R1aTFtVGZVMzBvMFIzUTNROU5ONWg3UTdBTjI3c1M4cTZE?=
 =?utf-8?B?Szg5L2k4UnM5d3JkeDlCbGpWTFljbC9IeStoZk96ZU92SzV2K0MyRllNdmov?=
 =?utf-8?B?dUZHSGlkVWlaL1JScGdhNi9SZEhBZVJTN0wvWjFmWUN6aFM1d21BcFZ4Sml6?=
 =?utf-8?B?d0F2WjgwVUIyS2FCVkduZ2VJUkQ3bUx6QUhrbTJ3UDNwb1EycXJxTzNhZHd4?=
 =?utf-8?B?Tk5hVDRKSU4vTHJRUzNlL2VXMEFWYy9BK0xZNGF6YTIvTWJ4d3lVcGxmUGgz?=
 =?utf-8?B?UmhjakhZSzlpRTFIU3h4L3V2dGtUazhOcngwUkdTS29mL25yYU5MVVpNVXZO?=
 =?utf-8?Q?KQkUUsOxcdoJC8wze4T6pmAZ1?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	RKythU6mkkHgdrIm8ozixuniIF5D44EV3ryIGtQmLBGznEB1/QnAJiRcyeO/PBFIEwvyqUsTaB1WxODEpct76HWz4qQnyD/9k5VgTrYT/2/Jbbok98mt5uuFf9Ibz69HqXEA/AREDCQ3QeTjBImSNJ8fWKOvvOVRbF6nzmMLJj31d2oUe+X1OChDHijRS4xWtuM9pYIKRBUTBnhlhEGT3m738wjASlj+uj5WjLgut19gyNNMECA7FJJAhUmpp2G66DBLR/dACVmnmsuDtJ1KrMX2jLSa81Jiut6MX6N6rZDmcDAGYb2B/FgWVkva5LAFICHBgXw7YhE5FNIP6Itb6z/V1GoR+wwwMPUStjCVhvj3CW9ne5hDe/5EQ27uHjQsZrbfoUUlSAIWod+OU8GwaVxi3bjnTvnoChnfkDf8+FTlARB181xTKt78t8cxg0w75JZkcv/506EXmpXeHrOy8V1oNKovlCsPwnouFE8I6UFgQOs/401JN2GOdh+3AkVy0M08Dbi1TF7NAkIdp7LrkBKrnW9xVFPIb+/PcQeuVU9NY0VQcJBmZaJx1hgKftWorwtd8z1OoQeeN3HctsIERrQWR8R11ZlHqDPZOlDJe6E=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d56957db-576d-4da8-3dff-08dcc7a48c17
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2024 21:01:12.0765
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MIxQo0prln4VX76/2C86hxGJmYZThC3zOGS7dcAQp2oHw+2HBSSKMDf0tpTlcbLNL7rXPVHCqSv/Z/9b7Cuu3g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR10MB5805
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-28_08,2024-08-28_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 mlxscore=0 mlxlogscore=999
 phishscore=0 bulkscore=0 malwarescore=0 suspectscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2407110000
 definitions=main-2408280152
X-Proofpoint-ORIG-GUID: IG56kppso7VC5ifjgdq1A1oxF1Gos0Li
X-Proofpoint-GUID: IG56kppso7VC5ifjgdq1A1oxF1Gos0Li

On 8/28/24 16:35, Kris Van Hees wrote:

> On Wed, Aug 28, 2024 at 04:20:26PM -0400, Eugene Loh wrote:
>> Reviewed-by: Eugene Loh <eugene.loh@oracle.com>
>>
>> Incidentally, is this related to my "Supply a default probe_info()"?  I'm
>> still in favor of that patch, though if this ident patch goes in first then
>> the commit message for the probe_info() patch needs to be tweaked.  Maybe
>> the two patches should be combined???  (Maybe not.)
> I don't think that patch was ever posted to the list for review?

Hmm.  I think you're right.  Okay, I'll assume this "ident" patch will 
go in first.  I'll tweak the "probe_info()" patch accordingly and post 
for review with other stuff.
