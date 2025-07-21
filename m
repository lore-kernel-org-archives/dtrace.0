Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 937C52C15B2
	for <dtrace@lists.linux.dev>; Mon, 21 Jul 2025 16:54:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753116889; cv=fail; b=H51Y/FLKRg21FjpIYtSSs8b6jneIiKnuyDL0q+9MZZOVONUlhp2Ir132GFHbFCu3NAy+N0iqCN1OijTgCE9kfRf/hkWfX343kWyWEKml1hHE5z09AXcxxCT7gJWTCQCNs5CdFkXaMSNKU7fHaYW9E0cM79+lWPW4senklB4czWw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753116889; c=relaxed/simple;
	bh=Vqx+rM+dmmWXgthvdqDfEljc7sbw7vy370Mq1Y4mr20=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=BfvOR291VOd6vin9l4buzvJSiGYmCqwIp4mWRTCneKtG18Mgz4SFIx3JgvEYyFqc80ko1kvftQT8X7DthglXpMqHcEIRM5q4RTT8ZGsnr3/TYEVXSgqOqtl6KqSvQpZakV1U32CzrJAsEx8cUfqiz8QJZ6CnG5SWTgw3PZ5H7qg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=JYTalNbk; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=ddgwJzRy; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="JYTalNbk";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="ddgwJzRy"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56LFQd6d027722
	for <dtrace@lists.linux.dev>; Mon, 21 Jul 2025 16:54:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=4f6yzjyYrbC5w1iqYMBMGwWrykH8Rgkqg9uKXSq7gqk=; b=
	JYTalNbkT6WtHYLiIFp5kmJN7wtWoRg9tbqDJlXKyYzMEaeqfU6wzrfIkYAy6G9K
	2FvIzQyBJk6gFC+XJaEAUusLwojLca/RGtYYtBwouphtynqp6JdXp94GQVyCvDAm
	nZY7Pkb/ITTHsM6PhJxnUzr8U7I0+CgBMqmEDwvTYikJKPzAnFUu4fh2l9G2FOxv
	svOSD5chWw6B/ipo1ICNlQQpTWhItVRP+kA5cf9CuYyjZyKR/6H9bBitvtdfEbJC
	e7Ra8eGZccCzO3/IBFlLlZaQOF4rkrl5UIrHXBFWJdxiIHGOKJfKtgmAtqhR/+/x
	MYoqEtLJgTiuNOn7ggNSXQ==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4805hpb7us-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 21 Jul 2025 16:54:46 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 56LG683k014403
	for <dtrace@lists.linux.dev>; Mon, 21 Jul 2025 16:54:45 GMT
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11013060.outbound.protection.outlook.com [40.93.201.60])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4801tejj0f-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 21 Jul 2025 16:54:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uqRYTHuycnQkf2PX3lUK45mUh4juh5Jf0ITC581ld4ZzrlX3m+h6ACZGmBYGgJySacEfjbx/zH94EYWG2Siz7a/M8717xz0eegiUf6uU5NAIIzDxciIpOVZwy9Kl2r6HzpHGJp5i0cIgIOx9fzT+BKTRRKWKJ28hc4QAvU/8U6ka/iJjBKIgQS/59cdTQTQ/Ns7euAMqkbbbVzG4KusVOREnxPBfuPr59Ch3ARrLgu6mPWhZ94o+Vml6Rq0dBmbYwL9HgytD+iFBE8llYRU1VZadtt0lBKevIj+dfA4zqQD+8Qhu5oquBAlrzlvUhIrTElZUO6mcfh/bRAxX3NZIUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4f6yzjyYrbC5w1iqYMBMGwWrykH8Rgkqg9uKXSq7gqk=;
 b=mBiZNkw0vDLr7D1v/ZnzXt4lAId0rmBAYezzG7sXRLv0xY67k8x/oAbLxRoS0uTniXIbRkNvaIpTZrlV3IzXxs+b0vYhbxnXhydQbcCKnDe0zr54OwsDt+q+1u8bTF3Ac8tQLueMC3VRId1/7aA5HX0nvCARZ6p7v7SXywy+3NrKugTg801UMzbz2PIXEeY7P+6y0pM4HP3pzIlUmqBM6zFxvbUhsn+5hCoyWERQnQSKzZvvcE5dfWeVeka6XjE+n9Ij41k8dd2IW4VQi8iZZQFlEWfQHso0PRAE4XaR+86pcaxZZM0EzjqThWv3usStxKNv8017/WFshGBFK7nprA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4f6yzjyYrbC5w1iqYMBMGwWrykH8Rgkqg9uKXSq7gqk=;
 b=ddgwJzRy1p+ibwMgJqRd2NjohZLJebPD/1fCyMb+BbQaSvJ3si7OGM09RqULh+bPckDWEZQwFDDmX5hW3mrGbyQhso3D/SlFwgXCZkcg40/xlOAy+IEdj/vAuxskiG51Q+QwFRbifpQr3G3hz6t20Sg/sHgLn/T/0H9WeVu78Og=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by MW6PR10MB7659.namprd10.prod.outlook.com (2603:10b6:303:246::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.29; Mon, 21 Jul
 2025 16:54:41 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%6]) with mapi id 15.20.8943.029; Mon, 21 Jul 2025
 16:54:41 +0000
Message-ID: <d3791d41-7749-e279-f558-3d9c52e60ea9@oracle.com>
Date: Mon, 21 Jul 2025 12:54:38 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 1/3] dlibs: use explicit vmlinux`major_names
Content-Language: en-US
To: Kris Van Hees <kris.van.hees@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
References: <SJ0PR10MB5672DB80AEB02AF32E7B5A0DC25DA@SJ0PR10MB5672.namprd10.prod.outlook.com>
From: Eugene Loh <eugene.loh@oracle.com>
In-Reply-To: <SJ0PR10MB5672DB80AEB02AF32E7B5A0DC25DA@SJ0PR10MB5672.namprd10.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PH0PR07CA0045.namprd07.prod.outlook.com
 (2603:10b6:510:e::20) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|MW6PR10MB7659:EE_
X-MS-Office365-Filtering-Correlation-Id: f957d2af-58ca-40e6-7b6f-08ddc87748f7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?UzhRQURZQURBTVpGTzh4VHRyUzU0bkxJcE1TZmxvQW5Ha3VzTDRBUWZBL0ZR?=
 =?utf-8?B?Q2ZlYmZIcWFtSUlvUnFpVzNHdkQvcldQOFc1bUNtMlVNL3FURWVNWGhRb2RY?=
 =?utf-8?B?V2w1Q3REL2pJLzhTSW0xTU1SbGtFSEJxRkxRWWFHV1dkUVZ0dFdwbUNwL1RU?=
 =?utf-8?B?RkJZYStjTk9YQlJrSGkzQVVOZ0NnUU12Y0RRQ1RhSUtqelJ5aDRxSlUxV0xB?=
 =?utf-8?B?L1ZMRGcwODhKeHZENmRvclpUWWFiZXVNUERRZ0pKQitnQVdzdjBPbFZPT0Jj?=
 =?utf-8?B?NWlRb2NmQzg5OUh2cXdYRzMxQ1hnejR4UEdlZzZPQ3hkQ290QjBDaEYvYmdJ?=
 =?utf-8?B?NlhXNDlRZC9wdFNnNkdTTUgvN3NTMm1PcjBhcTZwWDh0emY4UldQWUhaOWl6?=
 =?utf-8?B?ZHFLZzVZSXo1K2NhckhmUGRFYXJmQklkZ2tiTEFVVGMwdUxXNVEyaFRnSURN?=
 =?utf-8?B?djJSOHhUdEVYKzE4R1V0a01zakhFOVRaWnBYd3hQWjcxZ0pYcnFkZmRQWVFa?=
 =?utf-8?B?bU5HTjJJSVlFNHBjRlY2Y2hKRGpJSDg1YjNzRk13ZmNqM1c2UTBYTUxFQ0J5?=
 =?utf-8?B?bXhDK1RxSm9nMW8wUHJKZmQrdDkwNWorS3pOdkRjcm1IZHhpY3RvMGp5U0Vy?=
 =?utf-8?B?M3pFTnlaaVh1NmpsQkU4dkRZYnFYa2lsVWE4NFdNOGtoWm9VMzl3bFhNMkFP?=
 =?utf-8?B?T1QzTno3QlJxayttK3JBMGlOY2VkSnJqdmFTWnlpcWdMR1lVVExwWW1KSXAy?=
 =?utf-8?B?ZVc5ZnNzWkpycFdHdHIwdnJOWFh2b2dTdjNoUDdqdVFlQ0t1a2U2K3pheEtU?=
 =?utf-8?B?UzFkMnBjbWZaNUN1NUl1clVtUzIrSitOd3I4eTRyVW5kUjE3NVhYY3ZycmRX?=
 =?utf-8?B?NHVZSnEvbjdmUDJmMVNBYUVnd29qTzlTL3YrcGtDbW8rS3hreEFPK2hseXd1?=
 =?utf-8?B?K1BodWRYS0RUWGZaWkp1SUg2S0ZNRzErL0d5Sm05bHVUNkRoQU1jZjRnS01a?=
 =?utf-8?B?OFZLTEZ0VU55N3F4bnNtTkI0TnVDcWNkV0ZQSjdMUGJkRjJ4RlJFK1RiUUFO?=
 =?utf-8?B?VldwbWovTEJxM1EwTGR3N1lCbGVtTHRqYnhWb21NVGl2dzFvRkp5QzJUWjA2?=
 =?utf-8?B?ZGxmNzY3QUxoc1FjZmppNlJEUi9TUm13cngva3NOb1h6RzBHZStKelFGYkps?=
 =?utf-8?B?NmtHQ3hndFFiaG1obmtHTG9pSVFrdjNna1N5bnpaVUJCZXNWT2g5Z0txaFp4?=
 =?utf-8?B?RWpwanBvendkdHpJQUY0OThLUGxIUGlnbkI1T2Fsc3VtM0FiYkF5ZVltNDdt?=
 =?utf-8?B?b1I5K1l6V1JWc3dnUHFqdk5Ha0YxNGlWTUE4cDNnQnR1REc2UjBUcGtYQW5L?=
 =?utf-8?B?d1pkeVlwbE0ycmVQSzVSaG5jVUVKWkxPVS9BeE5Dc0ZKeElER2FJSHdNeUtP?=
 =?utf-8?B?eUM2VDcvaHZZN1hzTXRCcjdSNVc3ckNNUEZqYWJXRlV1clVtcW5IMmlzMVBp?=
 =?utf-8?B?VU5xVWJVb3NGZkdQeDA1MG44dWhrYmsvazNvQVpMaWlXY2o2dTZYZXpYZUZE?=
 =?utf-8?B?aVJxc0RIWXVZcVF1cXNuZlRpektWZ3EzQlB1RHJKK2c4RG5RNjlvNTVwa0Nq?=
 =?utf-8?B?c1lkTFU1TGZZOE1JL3gxUkpWTXNKckNSRlJxUk8zeFlmdXVJOWlMeWpocUpx?=
 =?utf-8?B?aEtmQlhwUVZZRUpqbm5qbm9raVhKRzJlOEd1OUFSQnRtK1VBekF2N3MzTDJw?=
 =?utf-8?B?YU5hbThabEcyelYrcEpQa1hJenA2ajRkc0xhYmNldjJiZU5sdHJiTFJ6SzNG?=
 =?utf-8?B?NGZvMzl6bDUxWXd0NzBFZy9FaXBqTkRJa0pIclo2WVJBd3NUbXNiMHo4akFy?=
 =?utf-8?B?RHVmaEJEWXUzU04waDVPVFc0VDJSWTRFWDZHZXQrSUJVakI1UWRVcDRKQmZK?=
 =?utf-8?Q?N303brbVLKE=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?QUNUK0JrelkybHk4UHZBWEhxeHhUUW40UjRrczdnMHRhY0NueGhJUFkwTkt1?=
 =?utf-8?B?MFJ2bnp0YmpCVVVMM3dScUZ5aDBOQmdiZ3pSTGlNZEY5dDZSVnNJZDJxQ2Nv?=
 =?utf-8?B?cHY2OXdJRHV5WFc0U1JHU0lrMGV1bGg0WWlGUEdDMlNhZ21tTWVJOHgwU09x?=
 =?utf-8?B?VG1lUlFYVWVsOWVFcmwyV01FaG55dFdmNTQ4cDRGWWd2cVhrSE5ZOGlUcGtr?=
 =?utf-8?B?OU5LTkdQcTZIYWs0a0Y2cXlERW56bnFxN2ZwR0xUOHZrWVJ0d0xsQTlEMVAy?=
 =?utf-8?B?ZlQrRllUZ1V2aEEycERrOTM4ZG0xSEZ4bTQwdCt1N014c2VscUs2KzJnMjBT?=
 =?utf-8?B?Z09iMTgyb2tPWmd2c0N5RUpJT3RpaVkzK0hGQmo3UmdJcUlXcGV2VXIyemxr?=
 =?utf-8?B?OFE1elMyaVJMYVJYUUtjSXRMeVV3K0dXQnQzMStqL2NFcWEzOFZscXpaR3Fs?=
 =?utf-8?B?blhlSVRoM1dSNHhRVUNWM0VTVXVpcFAySTJrVUtzQzdKUHAxQnVsamNKaTBX?=
 =?utf-8?B?SjF0MUNyWVFaL3h2QVlaRUlVeUdhb0xxdGdnMzk0aUNHWG54aFVnZm9qUmNs?=
 =?utf-8?B?K0l0MGp3ckwzMXpDOXp4N2tOMDUrVXFDTTQrV2VBZytTSk94WThTUkNYeW4v?=
 =?utf-8?B?cElsTzBiSUFDOUNGRzJsZmQxY3dOVFJWaTI1T3ZzakdlTHZrU1M3VCs1cjZS?=
 =?utf-8?B?ZEw5TGM4NjM0ZW14WkRzS3B4QVp6NUducGVma2pUaG5PZDBiODRxb1diV1NH?=
 =?utf-8?B?L1VuR0ZQUlhRZ0NzL0MxNndmTzdNVFg5KzhyWE5heW5leWJockZwK3c2V2hH?=
 =?utf-8?B?RWpJZ1NObjJBSkQrZG1HQ0dCa2ozdjRHdmxKNHhsZUI3YzlkZVAraVBPdU1o?=
 =?utf-8?B?Z3lQMEcvci9NVEhuSzl4UktWY3RTZTFFQXhua0ZLTmQ4b2NtSkxSWFpsaFBK?=
 =?utf-8?B?SjU2VDR2bm1zYWRwU0YyWXZhUTZ6Qi84dmFJaTZPRlJ5c1o0Y2R6SzNUdFAw?=
 =?utf-8?B?NWJmRUdoM1U3M0NGamhoKzhsQ0ZSMkpoTEVTYUFhc0J2VWl3bTJIL2dwU3BM?=
 =?utf-8?B?RUNHdHQvbXluUzErVEMrdjBTV05CUUdBL3U4eE4yUCt1K1VOYWlFTGZWRXBu?=
 =?utf-8?B?bExQOFBOY1hvdHdvQ3c1K2lFckE1WlBYYUV4ZmQ0Z3ZSZ1AvTDl1Z3NQMWlk?=
 =?utf-8?B?a09HdjlOMGM0WEFjY2dwbVBWZmsreEUzeHVRK0JFdUxlaTJ1RWVyZnZ0QU16?=
 =?utf-8?B?SkFWYW81YnhXNEJkemovM3RvNG5RaWlTRUtOM0E1ZGVOT3orL045aGRqVFlt?=
 =?utf-8?B?aWVVMkw4Qm5weFhLa1VDS3JPUlJlRzF2ak1BRkhXazR3Zkg4eWlXTUxSZytj?=
 =?utf-8?B?TU9KclJDd0JTVWZBNGY3RVpUWjBGRkJ0bFVwWGh6VkFXWHluVUhHSGRXcHBm?=
 =?utf-8?B?b2Q3bWZYbGJ5NWVsYUJzek90b0dZYWt4Rk9McWtLTjBEZDBOOFJKc3FyU05U?=
 =?utf-8?B?YUs3VG8xSVk0TlJmNHU2ZmptblhxZS9wbVVKeW90RmRnbGFwVnZxVzFkbExa?=
 =?utf-8?B?WEZJWklaTXd3SEFKWWowM2NwQjNjcGc1SFdPWnJBTWN3VGt4S2Z3cndJejg2?=
 =?utf-8?B?QlRobVZRaEU0SXRVVk80WmJiMDZCV3NqYjA2TkxPZjNUU0c1aTVNNmpEZjJq?=
 =?utf-8?B?SGFTcnE2ZndzTkxLWVlad3AyR3RKOE1KSWx2ZjFva2pZK2g4bS9Tc3FkZHZH?=
 =?utf-8?B?U3B0YzJuQml5NW9yYmJ5SHZ5MHE2czNaQlN2Nm4rczlaajgxMG0vc2Q0bXVD?=
 =?utf-8?B?dXBmVi82UGpGWE5kYjkzSGYyc1NINkRHN0t2NFZTcTVPSndjYWo5WGErUnFE?=
 =?utf-8?B?YXFKNHlnU0ZVSGN3QjgrY1VqZzQ2Y0pzcjQ4WEZWRVAvUEE0bFplY2g1ajNa?=
 =?utf-8?B?SDlyRW9wUVYzTUlmWUpYYW5KbEtrQnpmaGNpZk9OZzQ2Y2pUUkxhbUNFbXQx?=
 =?utf-8?B?MXRNdUdVNFFobFhaNm0rMzB2c3BIcGxYWkZpSVlDUHhVbTRrTlVEK0dFUExS?=
 =?utf-8?B?K1A0YVd0aU1Xa0lneFVkMWduY1hqR1YyWU1RZHQwMGx0Z2FCWHdZTCtGbW1Y?=
 =?utf-8?Q?dDqF73I7URKMHvgC2LepNoeBz?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
 D9Htya91KUV05+jEl0mfXZDQA3h9ouN92uwQDRoRYK4OSsOeHRV0RdeqhfZzCs/P8LQTmz662odmk+lkwzmYOaldnTn5eJ2jEDuKirTgX5wUkERhr2SlQa/ZX6kmymFPjloaGIqVu5zObfrY8q+KF1UtD23H7h8NmjcG1J55UlFHZw64mBwD/U9YeXvXvawwBemj6X8iT3R0xw2IhhyTsy4QRRUNWFeQliGl68NyOOketox1Y71fVYmocpFk/GbKk3Nkl3+aw8WUgDo4WnG1fNEslhshI0+Jtbt4//bSy/4WstDmUyo7q3hi7LXXlOqmb9nQoEimU8c1xJMRzRSiKP6FJ/sFv1knQlGo1eoYxnH7ZBe7boQMtfRgQ/2WBdhDchgH6he3v/ioZ0oVk8Ae5STBkbRjytSMVvn01Rpg/PpDcaNzLXmE9oG7XCct5igfaTVrcUBMxRDJK09sydw2s0Gqqyh6VRaJAXZDlf2VfMNnl+rDoLAt07nI5W0Ygebpdo2NA21AWrb45iuVESSmdOYHdezSfDRGcUMxdBAiNtIvSbIyWPAu1/hS6uLsM9HDOs6kEtMC/K0S1LW4QbM7UwrC1fZ5PkHnYwbyD8NJkrU=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f957d2af-58ca-40e6-7b6f-08ddc87748f7
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2025 16:54:41.3654
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: D2hGYjQwsMEEWwT2bya1DKxy8C74sizI24H1UhAjl3ah1VPD8IFW2A1IgYfSS1/9Blyy59CQQdHc6iLalkIajQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR10MB7659
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-21_04,2025-07-21_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 adultscore=0 bulkscore=0
 suspectscore=0 mlxscore=0 phishscore=0 mlxlogscore=999 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2507210150
X-Proofpoint-ORIG-GUID: c4izlKRHnzQN1slICvBYvFg0XcQ2q2eH
X-Authority-Analysis: v=2.4 cv=YY+95xRf c=1 sm=1 tr=0 ts=687e70d6 b=1 cx=c_pps
 a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=GoEa3M9JfhUA:10
 a=yPCof4ZbAAAA:8 a=DgTYiEJHsjON7zdl5z8A:9 a=QEXdDO2ut3YA:10 cc=ntf
 awl=host:12061
X-Proofpoint-GUID: c4izlKRHnzQN1slICvBYvFg0XcQ2q2eH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIxMDE1MCBTYWx0ZWRfXxaFEO+JsWpe9
 ow0eKT0UZBkkJ4mpmclG2BjDlErNo33DeQ0pgMcYld/P6tiwOrYCM9+bF/gfopN/FgWWZ7HeLV9
 NmSQNYRGq2FUUpVwI4uELur/EB87wXd7UwnmqYq4gLFjisVPuZ0w6R9INTZvLGYIGOt7LBi8Elt
 URF7KJg9HE6AVAihijkX6A3CbpO7+pcGJ96bMIz3hIJvC+SMMFsdBhqjXLNW/GF0dKlz1oYJQal
 us+atXOYrthM07kUZ//CehiBX3zRwnSfX9oWg3riKfgHv+widuY3Lwb3t6VPfjUkkFYetF+1+tc
 rEk1iXaR7wrfG2TrUrLbPoHGvSUkfpV9wy8QZ9m9kaFhhxgEGUW+HaKWYhkm4BvdpfYpB6mFHGn
 XHUjxD3gAdYDwRK1zKmOj6PCPAzCURQglcg39ieJUIWm2DQ+u2EEjAyBKaHKNmAn2QL739d2

Reviewed-by: Eugene Loh <eugene.loh@oracle.com>

On 7/21/25 09:34, Kris Van Hees wrote:
> It is better to use explicit module`symbol references in dlibs so as
> to avoid loading modules needlessly.
>
> Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
> ---
>   dlibs/aarch64/5.11/io.d | 2 +-
>   dlibs/aarch64/5.12/io.d | 2 +-
>   dlibs/aarch64/5.14/io.d | 2 +-
>   dlibs/aarch64/5.16/io.d | 2 +-
>   dlibs/aarch64/5.2/io.d  | 2 +-
>   dlibs/aarch64/5.6/io.d  | 2 +-
>   dlibs/aarch64/6.1/io.d  | 2 +-
>   dlibs/aarch64/6.10/io.d | 2 +-
>   dlibs/x86_64/5.11/io.d  | 2 +-
>   dlibs/x86_64/5.12/io.d  | 2 +-
>   dlibs/x86_64/5.14/io.d  | 2 +-
>   dlibs/x86_64/5.16/io.d  | 2 +-
>   dlibs/x86_64/5.2/io.d   | 2 +-
>   dlibs/x86_64/5.6/io.d   | 2 +-
>   dlibs/x86_64/6.1/io.d   | 2 +-
>   dlibs/x86_64/6.10/io.d  | 2 +-
>   libdtrace/io.d.in       | 8 ++++----
>   17 files changed, 20 insertions(+), 20 deletions(-)
>
> diff --git a/dlibs/aarch64/5.11/io.d b/dlibs/aarch64/5.11/io.d
> index c153d5a2..c968a7d3 100644
> --- a/dlibs/aarch64/5.11/io.d
> +++ b/dlibs/aarch64/5.11/io.d
> @@ -131,7 +131,7 @@ translator devinfo_t < struct bio *B > {
>   	dev_instance = 0;
>   	dev_name = B->bi_disk == NULL
>   			? "nfs"
> -			: stringof(((struct blk_major_name **)&`major_names)[
> +			: stringof(((struct blk_major_name **)&vmlinux`major_names)[
>   					getmajor(B->bi_disk->part_tbl->part[B->bi_partno]->bd_dev) % 255
>   				   ]->name);
>   	dev_statname = B->bi_disk == NULL ? "nfs" :
> diff --git a/dlibs/aarch64/5.12/io.d b/dlibs/aarch64/5.12/io.d
> index 09968d5a..6f60ae05 100644
> --- a/dlibs/aarch64/5.12/io.d
> +++ b/dlibs/aarch64/5.12/io.d
> @@ -131,7 +131,7 @@ translator devinfo_t < struct bio *B > {
>   	dev_instance = 0;
>   	dev_name = B->bi_bdev == NULL
>   			? "nfs"
> -			: stringof(((struct blk_major_name **)&`major_names)[
> +			: stringof(((struct blk_major_name **)&vmlinux`major_names)[
>   					getmajor(B->bi_bdev->bd_dev) % 255
>   				   ]->name);
>   	dev_statname = B->bi_bdev == NULL ? "nfs" :
> diff --git a/dlibs/aarch64/5.14/io.d b/dlibs/aarch64/5.14/io.d
> index 09968d5a..6f60ae05 100644
> --- a/dlibs/aarch64/5.14/io.d
> +++ b/dlibs/aarch64/5.14/io.d
> @@ -131,7 +131,7 @@ translator devinfo_t < struct bio *B > {
>   	dev_instance = 0;
>   	dev_name = B->bi_bdev == NULL
>   			? "nfs"
> -			: stringof(((struct blk_major_name **)&`major_names)[
> +			: stringof(((struct blk_major_name **)&vmlinux`major_names)[
>   					getmajor(B->bi_bdev->bd_dev) % 255
>   				   ]->name);
>   	dev_statname = B->bi_bdev == NULL ? "nfs" :
> diff --git a/dlibs/aarch64/5.16/io.d b/dlibs/aarch64/5.16/io.d
> index 09968d5a..6f60ae05 100644
> --- a/dlibs/aarch64/5.16/io.d
> +++ b/dlibs/aarch64/5.16/io.d
> @@ -131,7 +131,7 @@ translator devinfo_t < struct bio *B > {
>   	dev_instance = 0;
>   	dev_name = B->bi_bdev == NULL
>   			? "nfs"
> -			: stringof(((struct blk_major_name **)&`major_names)[
> +			: stringof(((struct blk_major_name **)&vmlinux`major_names)[
>   					getmajor(B->bi_bdev->bd_dev) % 255
>   				   ]->name);
>   	dev_statname = B->bi_bdev == NULL ? "nfs" :
> diff --git a/dlibs/aarch64/5.2/io.d b/dlibs/aarch64/5.2/io.d
> index 5111df28..10666806 100644
> --- a/dlibs/aarch64/5.2/io.d
> +++ b/dlibs/aarch64/5.2/io.d
> @@ -131,7 +131,7 @@ translator devinfo_t < struct bio *B > {
>   	dev_instance = 0;
>   	dev_name = B->bi_disk == NULL
>   			? "nfs"
> -			: stringof(((struct blk_major_name **)&`major_names)[
> +			: stringof(((struct blk_major_name **)&vmlinux`major_names)[
>   					getmajor(B->bi_disk->part_tbl->part[B->bi_partno]->__dev.devt) % 255
>   				   ]->name);
>   	dev_statname = B->bi_disk == NULL ? "nfs" :
> diff --git a/dlibs/aarch64/5.6/io.d b/dlibs/aarch64/5.6/io.d
> index 5111df28..10666806 100644
> --- a/dlibs/aarch64/5.6/io.d
> +++ b/dlibs/aarch64/5.6/io.d
> @@ -131,7 +131,7 @@ translator devinfo_t < struct bio *B > {
>   	dev_instance = 0;
>   	dev_name = B->bi_disk == NULL
>   			? "nfs"
> -			: stringof(((struct blk_major_name **)&`major_names)[
> +			: stringof(((struct blk_major_name **)&vmlinux`major_names)[
>   					getmajor(B->bi_disk->part_tbl->part[B->bi_partno]->__dev.devt) % 255
>   				   ]->name);
>   	dev_statname = B->bi_disk == NULL ? "nfs" :
> diff --git a/dlibs/aarch64/6.1/io.d b/dlibs/aarch64/6.1/io.d
> index 09968d5a..6f60ae05 100644
> --- a/dlibs/aarch64/6.1/io.d
> +++ b/dlibs/aarch64/6.1/io.d
> @@ -131,7 +131,7 @@ translator devinfo_t < struct bio *B > {
>   	dev_instance = 0;
>   	dev_name = B->bi_bdev == NULL
>   			? "nfs"
> -			: stringof(((struct blk_major_name **)&`major_names)[
> +			: stringof(((struct blk_major_name **)&vmlinux`major_names)[
>   					getmajor(B->bi_bdev->bd_dev) % 255
>   				   ]->name);
>   	dev_statname = B->bi_bdev == NULL ? "nfs" :
> diff --git a/dlibs/aarch64/6.10/io.d b/dlibs/aarch64/6.10/io.d
> index a1458d6f..45e7aa63 100644
> --- a/dlibs/aarch64/6.10/io.d
> +++ b/dlibs/aarch64/6.10/io.d
> @@ -131,7 +131,7 @@ translator devinfo_t < struct bio *B > {
>   	dev_instance = 0;
>   	dev_name = B->bi_bdev == NULL
>   			? "nfs"
> -			: stringof(((struct blk_major_name **)&`major_names)[
> +			: stringof(((struct blk_major_name **)&vmlinux`major_names)[
>   					getmajor(B->bi_bdev->bd_dev) % 255
>   				   ]->name);
>   	dev_statname = B->bi_bdev == NULL ? "nfs" :
> diff --git a/dlibs/x86_64/5.11/io.d b/dlibs/x86_64/5.11/io.d
> index ae4b62c3..b9f33433 100644
> --- a/dlibs/x86_64/5.11/io.d
> +++ b/dlibs/x86_64/5.11/io.d
> @@ -131,7 +131,7 @@ translator devinfo_t < struct bio *B > {
>   	dev_instance = 0;
>   	dev_name = B->bi_disk == NULL
>   			? "nfs"
> -			: stringof(((struct blk_major_name **)&`major_names)[
> +			: stringof(((struct blk_major_name **)&vmlinux`major_names)[
>   					getmajor(B->bi_disk->part_tbl->part[B->bi_partno]->bd_dev) % 255
>   				   ]->name);
>   	dev_statname = B->bi_disk == NULL ? "nfs" :
> diff --git a/dlibs/x86_64/5.12/io.d b/dlibs/x86_64/5.12/io.d
> index 0432b02c..7ce005f9 100644
> --- a/dlibs/x86_64/5.12/io.d
> +++ b/dlibs/x86_64/5.12/io.d
> @@ -131,7 +131,7 @@ translator devinfo_t < struct bio *B > {
>   	dev_instance = 0;
>   	dev_name = B->bi_bdev == NULL
>   			? "nfs"
> -			: stringof(((struct blk_major_name **)&`major_names)[
> +			: stringof(((struct blk_major_name **)&vmlinux`major_names)[
>   					getmajor(B->bi_bdev->bd_dev) % 255
>   				   ]->name);
>   	dev_statname = B->bi_bdev == NULL ? "nfs" :
> diff --git a/dlibs/x86_64/5.14/io.d b/dlibs/x86_64/5.14/io.d
> index 0432b02c..7ce005f9 100644
> --- a/dlibs/x86_64/5.14/io.d
> +++ b/dlibs/x86_64/5.14/io.d
> @@ -131,7 +131,7 @@ translator devinfo_t < struct bio *B > {
>   	dev_instance = 0;
>   	dev_name = B->bi_bdev == NULL
>   			? "nfs"
> -			: stringof(((struct blk_major_name **)&`major_names)[
> +			: stringof(((struct blk_major_name **)&vmlinux`major_names)[
>   					getmajor(B->bi_bdev->bd_dev) % 255
>   				   ]->name);
>   	dev_statname = B->bi_bdev == NULL ? "nfs" :
> diff --git a/dlibs/x86_64/5.16/io.d b/dlibs/x86_64/5.16/io.d
> index 0432b02c..7ce005f9 100644
> --- a/dlibs/x86_64/5.16/io.d
> +++ b/dlibs/x86_64/5.16/io.d
> @@ -131,7 +131,7 @@ translator devinfo_t < struct bio *B > {
>   	dev_instance = 0;
>   	dev_name = B->bi_bdev == NULL
>   			? "nfs"
> -			: stringof(((struct blk_major_name **)&`major_names)[
> +			: stringof(((struct blk_major_name **)&vmlinux`major_names)[
>   					getmajor(B->bi_bdev->bd_dev) % 255
>   				   ]->name);
>   	dev_statname = B->bi_bdev == NULL ? "nfs" :
> diff --git a/dlibs/x86_64/5.2/io.d b/dlibs/x86_64/5.2/io.d
> index 415bbb4c..d2af79c8 100644
> --- a/dlibs/x86_64/5.2/io.d
> +++ b/dlibs/x86_64/5.2/io.d
> @@ -131,7 +131,7 @@ translator devinfo_t < struct bio *B > {
>   	dev_instance = 0;
>   	dev_name = B->bi_disk == NULL
>   			? "nfs"
> -			: stringof(((struct blk_major_name **)&`major_names)[
> +			: stringof(((struct blk_major_name **)&vmlinux`major_names)[
>   					getmajor(B->bi_disk->part_tbl->part[B->bi_partno]->__dev.devt) % 255
>   				   ]->name);
>   	dev_statname = B->bi_disk == NULL ? "nfs" :
> diff --git a/dlibs/x86_64/5.6/io.d b/dlibs/x86_64/5.6/io.d
> index 415bbb4c..d2af79c8 100644
> --- a/dlibs/x86_64/5.6/io.d
> +++ b/dlibs/x86_64/5.6/io.d
> @@ -131,7 +131,7 @@ translator devinfo_t < struct bio *B > {
>   	dev_instance = 0;
>   	dev_name = B->bi_disk == NULL
>   			? "nfs"
> -			: stringof(((struct blk_major_name **)&`major_names)[
> +			: stringof(((struct blk_major_name **)&vmlinux`major_names)[
>   					getmajor(B->bi_disk->part_tbl->part[B->bi_partno]->__dev.devt) % 255
>   				   ]->name);
>   	dev_statname = B->bi_disk == NULL ? "nfs" :
> diff --git a/dlibs/x86_64/6.1/io.d b/dlibs/x86_64/6.1/io.d
> index 0432b02c..7ce005f9 100644
> --- a/dlibs/x86_64/6.1/io.d
> +++ b/dlibs/x86_64/6.1/io.d
> @@ -131,7 +131,7 @@ translator devinfo_t < struct bio *B > {
>   	dev_instance = 0;
>   	dev_name = B->bi_bdev == NULL
>   			? "nfs"
> -			: stringof(((struct blk_major_name **)&`major_names)[
> +			: stringof(((struct blk_major_name **)&vmlinux`major_names)[
>   					getmajor(B->bi_bdev->bd_dev) % 255
>   				   ]->name);
>   	dev_statname = B->bi_bdev == NULL ? "nfs" :
> diff --git a/dlibs/x86_64/6.10/io.d b/dlibs/x86_64/6.10/io.d
> index 92704839..716727ce 100644
> --- a/dlibs/x86_64/6.10/io.d
> +++ b/dlibs/x86_64/6.10/io.d
> @@ -131,7 +131,7 @@ translator devinfo_t < struct bio *B > {
>   	dev_instance = 0;
>   	dev_name = B->bi_bdev == NULL
>   			? "nfs"
> -			: stringof(((struct blk_major_name **)&`major_names)[
> +			: stringof(((struct blk_major_name **)&vmlinux`major_names)[
>   					getmajor(B->bi_bdev->bd_dev) % 255
>   				   ]->name);
>   	dev_statname = B->bi_bdev == NULL ? "nfs" :
> diff --git a/libdtrace/io.d.in b/libdtrace/io.d.in
> index 6d43444a..a869ddae 100644
> --- a/libdtrace/io.d.in
> +++ b/libdtrace/io.d.in
> @@ -130,10 +130,10 @@ translator devinfo_t < struct bio *B > {
>   	dev_minor = B->__disk_chk == NULL ? 0 : getminor(B->__bio_part_dev);
>   	dev_instance = 0;
>   	dev_name = B->__disk_chk == NULL
> -			? "nfs"
> -			: stringof(((struct blk_major_name **)`major_names)[
> -					getmajor(B->__bio_part_dev) % 255
> -				   ]->name);
> +		? "nfs"
> +		: stringof(((struct blk_major_name **)vmlinux`major_names)[
> +				getmajor(B->__bio_part_dev) % 255
> +			   ]->name);
>   	dev_statname = B->__disk_chk == NULL ? "nfs" :
>   	    (B->__bio_partno) == 0 ? stringof(B->__disk->disk_name) :
>   	    strjoin(stringof(B->__disk->disk_name), lltostr(B->__bio_partno));
