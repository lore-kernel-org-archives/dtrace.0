Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F58835977
	for <dtrace@lists.linux.dev>; Thu, 31 Jul 2025 03:44:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753933450; cv=fail; b=iziEu9RtYYcHWPiMGJVVvgb77X8tPmVH0wwocN3LWZIOxMqbOPHpnidYzqWi/D0Z8/RJOSwpKHPU/MeO1oLP1NFXDVJl9jwcoiIhlYEPVrCDotA1qbnXp7wLB31rFpvjLOR/aGpWUSeeEa2b5GrpzxRLCzwtLxEzs0YOCRIfZoo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753933450; c=relaxed/simple;
	bh=d8pb+O50T32+MXxku3EyJzaGpWDJF6NQapMdYshtQJc=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=S6ckmg7m/BvBAKMU3HKY3uUOaQRtr/7gxZGH3bluXHX4PpNbD6dU/9RFmViTtTreWqUDOiPrr/PZmyE2YT/sIYhJ+mgyBdrJW/nU3EF53pkt+qiQVDy592Llx2SYYsTFG1bPrLzpLvlgYRrQFJSASWXbNMR74Fqp6CqKYSkGx/w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=moAYVy+t; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=WQvcZ8Cb; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="moAYVy+t";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="WQvcZ8Cb"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56V2g2br026897
	for <dtrace@lists.linux.dev>; Thu, 31 Jul 2025 03:44:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=iutK5GvHbJNN5dCMOnGRpsYMHqBk6TkoEGtucVS+pzk=; b=
	moAYVy+tQ3Y8OlgB1/ezoUrhfweBhWlTeijrrCwYva7snnEj5BRmxHfJcHvv8R71
	sncziivzBWMuuUpxJg7e3/ydNz9i62Q9OLxut2722NRNIORQi2F996/3f51MJPeX
	fdhnaReUPe6PyJwFVBZcXZQAADKg6ART/XQ7GQgIT2aXQvcl1tou6dtR2w0J37b1
	GrWw5a4GzQDXQWZiTVwE6MKeRef/B657rKqFZ3u0neE/Irg69fo/weOAz5dmU/6G
	Un1SiqgKtxg6W6IKdLANzo7lTb+o0Nk2or/mq0oA2k6uQaboe0xAieP3wab3If8q
	3VYKsSHp+7zdC42v6H7o+A==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 484q5x33f0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 31 Jul 2025 03:44:08 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 56V3CsI0038552
	for <dtrace@lists.linux.dev>; Thu, 31 Jul 2025 03:44:07 GMT
Received: from nam04-mw2-obe.outbound.protection.outlook.com (mail-mw2nam04on2044.outbound.protection.outlook.com [40.107.101.44])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 484nfbqau0-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 31 Jul 2025 03:44:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UszPyF1mS1Mnk7aLckOn7j1JWNxuwHiHlBj+DFPOYZ01iouKwz13Px1esvLB8Kqos9egvOF9Q+vty7mTyQmP/pn2EG9qgGoCnHjCjox9vLEZFCrlWSlxiUvv7so4cIe0yYtetyvBvT1EblHcrXwAcrK4JSzyZS21PsuTNJwyZbiDnKbY9ZrR4a3hKyJPZ7G27h1hPu7nfD9LBivfEMYlP5fY3/aIGWV5p2PbMRyQNcpVVwlLJKEteKu3bIsZ0CqoauL7PgYPO3IvFCJnpBPOGfAjG7jJNP2evTXCUbNfPoIBOlO6Xru7Q/YSy7f4MnEnNqX4VkaRkLWKJUZUiYYuwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iutK5GvHbJNN5dCMOnGRpsYMHqBk6TkoEGtucVS+pzk=;
 b=FjplqksTs6zSSWE/r1bTElcKKsdjQ66PVMHKsTmkUkoKGLH/8BKrxY6uhNqmSoMaAhHGMOvgUFeFhfskFnVJHu9AOnkVxkeoZkhGrLopsMH+xReIOrOZJ9+M8YnjPgFEzfnOHS4EchNDZ7e+ThWDvSjQyD1GoC8XQ69MFS5b7Q4wRX3IcS3CB6gu/3U56Co5226WGDctBx8FBOyGpHkmsbdTEFcdYABi9SBWkGOMlnCjTvhGhX35eE3ofIojHdOY4CIXkyx77KNjEa13v0OQVxdjdbIOEoUaV1j38cv+dmkvlp6gJFtTelaYmKgmT0CC+G8W1YCWQlUuQUD5bKUNdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iutK5GvHbJNN5dCMOnGRpsYMHqBk6TkoEGtucVS+pzk=;
 b=WQvcZ8CbG2K7sInGFmaRGtv7f1P5vwPTB8cSeY1oMnMcFBNc+exemhKlGFD9WQ+51Bnr02A8A49ZHDFRM293tgwa8BULSmW0IWUjyd33zAre7wWB5wsQ8vmUEA84rE1197RrxysA+5j4Fxw+zUmAmNCJh2x/FUT69Tx2KNBwjdY=
Received: from SJ0PR10MB5647.namprd10.prod.outlook.com (2603:10b6:a03:3da::17)
 by DS4PPF9C7B9A88F.namprd10.prod.outlook.com (2603:10b6:f:fc00::d36) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.25; Thu, 31 Jul
 2025 03:44:04 +0000
Received: from SJ0PR10MB5647.namprd10.prod.outlook.com
 ([fe80::8db4:df1d:6afd:e4a7]) by SJ0PR10MB5647.namprd10.prod.outlook.com
 ([fe80::8db4:df1d:6afd:e4a7%5]) with mapi id 15.20.8989.010; Thu, 31 Jul 2025
 03:44:04 +0000
Message-ID: <fecd3737-cb82-a9c0-c6ab-79dedb49b369@oracle.com>
Date: Wed, 30 Jul 2025 23:44:00 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH] bpf: compile BPF library functions with -ffreestanding
Content-Language: en-US
To: Kris Van Hees <kris.van.hees@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
References: <SJ0PR10MB567217E9DF1F38898F33711BC227A@SJ0PR10MB5672.namprd10.prod.outlook.com>
From: Eugene Loh <eugene.loh@oracle.com>
In-Reply-To: <SJ0PR10MB567217E9DF1F38898F33711BC227A@SJ0PR10MB5672.namprd10.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BL1PR13CA0399.namprd13.prod.outlook.com
 (2603:10b6:208:2c2::14) To SJ0PR10MB5647.namprd10.prod.outlook.com
 (2603:10b6:a03:3da::17)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5647:EE_|DS4PPF9C7B9A88F:EE_
X-MS-Office365-Filtering-Correlation-Id: a9c66da4-0bef-4ca9-c6c2-08ddcfe47e69
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?U1hieDRyMmhKVVpHTVJIeHRGdVVyb21aKzhGWU0yam1DMlFuck9hUlRocUZw?=
 =?utf-8?B?dUhEeUcrcWZ0WnVLVDc2ZURSM3drUW80MDNUMTdvR0ZwckV3VkFZdTdxYldY?=
 =?utf-8?B?WlNINGdvOWtzaVNtWlRmRlRqWC9uQTBmcVdCdzhDd0lKc05HV1JpWlBtU0d3?=
 =?utf-8?B?VXM2ZEdWSHpDTktSMENCSVVYMFVpSUdMWlNISk01SE5YRFZ4WVBGTWVFS2lt?=
 =?utf-8?B?eWRtbjAzWGFtNHkvRG1MaXMzWU5CZi9NKzFvUXhveFpob0pqdjNHcjZMZzlX?=
 =?utf-8?B?QmN6elJKdFVGRDU2U3lYdlVMV3FZcm9uWHFjOFVJRU9DdjJCV201RXZRbTJD?=
 =?utf-8?B?ajVNekVxUHUvYkw0NEQ5dUh1SmhEU0U3d3RIbmtJbDNmMExMWkdkQWZrdXRG?=
 =?utf-8?B?d3RpRGdzZlZFZnhVZ1prMGx6MUdrS0xONGZHK202ZmtYbTFFUjdyWnpseDhk?=
 =?utf-8?B?MDlUOFEyTUFjZ3RzMUliVHVVS2Z0NWhQZGJLUzhkTWVKcTdueExRRElScTRh?=
 =?utf-8?B?ZENVOGJtemlUMk5wUWtGRHZsdEJiaXJEcUpUc1I3MVdZVFFVMStjMmErQ05S?=
 =?utf-8?B?Vjk1S3d6OHVDYktjODI3TnlCUEg3OXNLSm0vTTZFeUR3UmdTSVJNL1F3c2JZ?=
 =?utf-8?B?MW9DQlVFbHVZOUcreG01TndXOG90anB1OUhSaU5qWWtrQVRhRmlQSUR6RnBs?=
 =?utf-8?B?aldHTXJ3elllSk9jNEQ2ajJPcEYxajZnaDBmUTdWZDNidXoxQy9UbGJYN2JK?=
 =?utf-8?B?ZHlhYVIyaHZnSG9ZZ3BubVBGSGhRU3hqd0h4dmtON3dXTjlkZkdzNUVkUmVv?=
 =?utf-8?B?NFcxaWd0RFF0YmJST0tabmNwRGp2eHdKdjhBMHZYbUxhSlZpS3dEUDJLKzlx?=
 =?utf-8?B?WkFaRGpia09QRnZubnhucnZ0Uktna1BLOS94eFVJdnZqbFM3YXAyYkwvTDkw?=
 =?utf-8?B?MGVmQU5VNC9zQXBGL2RaTFNvUlFNbTNWdGVWcWVBMGVrUWhZR0JTU1VZVFFD?=
 =?utf-8?B?NzZFak9kTVo4MUhBNmZXRzV4bFMyc0NiZmYyTHFzOWd5SE5FQ2NsakI2VTBI?=
 =?utf-8?B?SDhxT28vcUdJWVEzSjJsVWxqVGdPeUNYY25GaWl2ZzduamNMaUg1NlczUGRN?=
 =?utf-8?B?Sm0vZUp2dTZIaDdLeEp5ci9GdnUzZWpTSG9MZmpYQmUxaHpGb2pMb0hUT25D?=
 =?utf-8?B?c3JYZk00VXAvVnhGL3NuakxZWjBDZjJ5ajRBUWgraVJpNUFRWlAwb25FbVJ0?=
 =?utf-8?B?U3h3S1lXMFVuWnRrTHMzQ1d2eGREbHhmdk1UMlFlOFAwM2F5cktueGZxcXVQ?=
 =?utf-8?B?WkJHajN6NGxUS01QbHJZWWswSUhVMVFBQlRUdnZLVGlkVXpSeDkzamRPUW1r?=
 =?utf-8?B?di9oRjl1dGhXQ2Z3M29SVzNsNzVGZmNZQlQ5cDNXemJZYWtseWlPMzQ2U0N0?=
 =?utf-8?B?UGRQNGtqeWVRNUNqODNqa2RFempuc3VFVlh3VmV1eGxyY3UyMWszWFMrV1BU?=
 =?utf-8?B?SVhMZU91Tm5VWEdYayt3bVM4NnVZcTY2bTJxTFp6aXN6WVpaTFBzWCt0UTRU?=
 =?utf-8?B?SlpaaE9YV0VjdXJ5S1FuekExN2RXdi9GdkxzeG5iQnhwWldTc3NRd1FZNTZo?=
 =?utf-8?B?MzJJbi8zWVNSdUVjajFhVkQ2UUNPa3NwSFpxREx6Vkh3QmVSZnZaQVEzbjN6?=
 =?utf-8?B?M0pXQTAwZmorTFdYdHpFbnFFdDJtbmJwSVZhZndQU3BDNnh1SENMc095ZUxl?=
 =?utf-8?B?OTgyUFdvLzg0czlOZFNYc0dxS3MyV1BGdWROWkdvdW41dUovU0M2Y1V1V1RV?=
 =?utf-8?B?akR4dUdlVjVjdWI2SHV2VFVEanFXN0JSZUZ2cDF2U0FjQU9SYmtxcHJlQWRH?=
 =?utf-8?B?cDZhczMzZ2hIS0crMlFCbEY5TDF1RkNjR1hmWlJJWEN4OHErcXRjR0UwVnNy?=
 =?utf-8?Q?NjRakf+NEjw=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB5647.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?K0w0TDBiWmxZMWU5VnNHK1NlcUVkS3BacFRVU1FTbVhxQ0FVdE5QTGZ6c0FM?=
 =?utf-8?B?cEFkYmhzK0dYaWJiVE9HKytUOTVRdUUyWWE3YkhDcHZabUQ4UFZ4YlVtOFcr?=
 =?utf-8?B?ZXFyeXFmYU9FTTNYd1M2OENUTXNRcE5zZmQzbDV4OG5DTnFOajkrbEZmRXJK?=
 =?utf-8?B?a1BZczlyRUl3OGM2N1NkSDN4VFBZeGo2RXdKZFh6Rk40NlJwRzFlOURsQ0Ur?=
 =?utf-8?B?Y0xjeERJeXBTSFFycVE0OG1NSWIyWTUwclhjdTNJR0pMNGVGUDM3L2FIOHkz?=
 =?utf-8?B?di9qZWx6ZTNzQ2o1SjdQNUtpVU1pcFl6anVkTzJVOWU0bDI1UzBKaC9YZjEz?=
 =?utf-8?B?b1V3OFNVMFNOa2FXcko3VXdDN1d5bENpV3JIdnBWemRKdksxU3h2SEdYelBs?=
 =?utf-8?B?Sk1qZmZBRU1kd0N4dWpvZVZHaGN5RGk3a1RLWjlLWWdCNk1YL3N2NzNMZ1RK?=
 =?utf-8?B?czRTcHNJVHRpc3cybG0vdG13enpyUnE5YnBsbUJqdUNHc3lLS3g1UkhKZnlP?=
 =?utf-8?B?UnB2cDB1WDBMR3UxRjhxd09sZTc0VlBPVUFLR2ozRElnSEtQZU5hSGtyQXVz?=
 =?utf-8?B?Mm1yclhXV3A5RzFDY2JlVys4NkdKYnRpV3ZGOFdZcC9uMnNvQ2RFcC9rRmRJ?=
 =?utf-8?B?TzNMNGlCd01UdDIrMnArWENXMXN2VEhQUVJyUk14YndSQjBnekpBSWdiZ1Uz?=
 =?utf-8?B?dnJwR085UVFjUUpMZ0VERGJqYlYrak9ET2tJZ2pBMEJkRmdjaWVLam9TOVl3?=
 =?utf-8?B?ZWFJcXE0LytBMGw2alhzQTZYdEdHVlVqTlBvbFBaR2FQV1lhYVVSbEdNTWRI?=
 =?utf-8?B?NWljMkk3RjNXSmdtU0k0SW9oYzZIenRuRFU2UzJyUEJ1T09nWUFRZHRYVStm?=
 =?utf-8?B?REc3SFEvdklSZ2c0YnVGQzYySk9mekVYZ04wZTZBWWZudG1aSzVtNEZMRHJ6?=
 =?utf-8?B?NlNQNXlYZDlWbVJsWU9BZU8rckdxY3VXWWk3SmsrL3ViSVJNM0ZJMWRrZURt?=
 =?utf-8?B?WWl2U0xsSjBJYjZaeHJGOE5wbjBIV2VGYllIVWhQcXN0TktWMzhwVnF2czZR?=
 =?utf-8?B?SWh2QmRkd3g2N1NRcnZzekY1WmVSOEkwNjlvVkh2a2E1NlcvKzM4NkxPeVZs?=
 =?utf-8?B?d0lZeWVPVHljS2dpb2pyYnVnNGZWRmR6ME0rL1MwS0FQRWszcXlEYml0RG9X?=
 =?utf-8?B?MzZVZ0xrUjMvMXhBaEh4YlVuUUs2R1ZDUTdWa0VIeVlxRXdISUo1VVdHK0l2?=
 =?utf-8?B?NlNpRWxUUEE0aGxGbEtDUEhPbVhjcDEwVk4zRndQOFp0NlpzLy9ERElLZDd4?=
 =?utf-8?B?R2lObkpIUkRaanVHdlYwcERCdHdnalJ4aGM2SUJXYTBOa2NLcUpPMnBnZXlz?=
 =?utf-8?B?MDExZ2E3MUFhSzg0STNESTJDN3R3eGU4ZUZSbmpjeTB3RERnMlB4Zy9tdVpX?=
 =?utf-8?B?bWo5S2dZOThMN2RnTjVmZEt6YlBBV1BIQ3pzelZDeDYvUU9aNU9YU2J5YUJR?=
 =?utf-8?B?bkFZbGhKU2FPUmdSMFJFdGVEUlJRaVcwL3I3RUFla1c2K0N2UCsvSXhXaW5N?=
 =?utf-8?B?V0RiZjdsTncvYWxlc2w3SW9kdWVMcFo1c3NPMkorTWJaR295Tks2L1NFNTNm?=
 =?utf-8?B?SU15eVVLcnkxZStVSlJuK2llTlFtNDZMa0Y4VkVZVzRvalZsRDVrRjZ0Rk9G?=
 =?utf-8?B?SG12VnpmN042Tlh2bi9iTXE0RmhhUUxKRnBOZVl3ZW5Ha2ZnUVFqY1lmVFM1?=
 =?utf-8?B?aGtCQmZIVldhZUg3b08wUk8xQXJaQVdDMEVzRGhlZy90NnF4YTc1MFFkaENq?=
 =?utf-8?B?TS9zMzJONTVpQ3FST2Z5cVpIRTNWTXhQRkhaK1R5YklGOHRWcUJEQ0JJaWdI?=
 =?utf-8?B?TERFT1l6cU1leXNWM2FHQ1pMMCt3Zyt6WWZVdWFtUEdkTkhFVTFLcm9uRk5o?=
 =?utf-8?B?MWM2eXNLeFF1bmtsVlZpUUZuZDJyZWFzbzlwV1djblR4cmVaTWpucmVQUlBj?=
 =?utf-8?B?QzduaitZUGREWlhlZFk4cm5xcFVBQXFQS24wVU14bGxGRWUyMnlvR2NVQ1ZT?=
 =?utf-8?B?aEw4aGYxN3BPa1RMaGp5bzRZWWFuVXNoN2E5M3I2RXREVGdmVExHY1N5aWVV?=
 =?utf-8?Q?tuF6VynW2Ov/1lPJxpkHKmAF7?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	yzZkQG9SQLh/4r/JQpSVzWAdOM6ABXJid1a5Ep48KWSJA5dQNqqPRA2cC6RsduZpVOu90a1qAEvkwXTCLjwKdIlJXxYHQ1Ham19fI6FgBR4pjG00WIoOLZLVhouGtzJan7HUGLIl5R91JJwFtZ8FqOH9Nvm0J003O4C1djAHfRofrPCZYJwx4YUVxvuogN6MR9Zyh+yBuqrTR2Z2sanV9Lr9ai8MghpCakyDf6hCNyEIbjjquzATWkjokfiC0XMQTLDh0LDlJDqWST0xNzXBFwmrTu5RiEK8+rSlC9KW1+nQUTvnWbtXLKAxnSuNy1j4QL73ZLtZwpl3r1NiAojQM6JnOthi3BRN/9QrHEUrDAvhKSZ5K7tlja5jqm/8EjqIk6tH1xX4QR9hdDOLybceLWkvcUJ2rgqUunx8fsfZQ4dRowWlq1dzoeDzHOPQmKla6kZaFGiEp4IWFDlV8zoUWhY1dij2ahJ7J4q/dvYYhDbGxHpjOvISrNVIxERvync0mlqJwZ7NMLTOm8ZsbBXBLAYrB7Z3ZfMY3M+UXVHD40BCisdDeD3dOP+69l056+oZ5m47y8h5rgmCVxvKJYLid+XiYPRMebb/1TnYXecN364=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a9c66da4-0bef-4ca9-c6c2-08ddcfe47e69
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB5647.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2025 03:44:04.0773
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lGZWLGZt6O8Spc4bc7G6FRoWzkFvpq8lt7R6qRrxLhCT33USCx4siG/dQha0xYtTEToRGV5iuxMoCm+bSkX+2Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF9C7B9A88F
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-31_01,2025-07-30_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 suspectscore=0
 spamscore=0 mlxlogscore=999 phishscore=0 bulkscore=0 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2507310024
X-Authority-Analysis: v=2.4 cv=X+lSKHTe c=1 sm=1 tr=0 ts=688ae688 cx=c_pps
 a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Wb1JkmetP80A:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=2R-2WNDlVgcBftp7RJQA:9
 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: bZ4TKWL9NkFz6AAoqzMrkp26aVc1UjK0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzMxMDAyNCBTYWx0ZWRfXwguVL9HL+yBs
 X738hLiJIby35VzjfzDnSGlR7A2W8YGzpGF3Hm0SKhgKOQqE98geLUBrdBFXg2Rv53/Cxe5GYHQ
 /jvQyyYmhbS01oTxrRXR7qpkTjHb/s/b+0qcLg7z1HWPM9fha6J/X5CYUr46pJpkW+Kdy5lEYI+
 HjoeolTesuwWUg/wl/J3oVPZOxqk7lpp8ZqO6bBnQprtB/gGxy9uP49Y7dP7xK64w5/SYmog+tY
 ZKtHEokw5TnQKhS3VnGGbNSWL9rE+ivIyJ6L6wQjrsu6OFvZl0/Wfx+XCLboiJzb6+70WfM1R8r
 yHF9/ucSpXzgz82ug9Foqczggz1qecH4cojhHbg5zMJ+5SH/bR3Qyrm+GqjRBC0T3OhXAQvFLc/
 9wGj60d0Hu9/tMSEBe6HXcO0rAVGYRIO1/fekflNPE0fGNsLoxTrCh5S3SV2Tai7XRrYdwBL
X-Proofpoint-ORIG-GUID: bZ4TKWL9NkFz6AAoqzMrkp26aVc1UjK0

Reviewed-by: Eugene Loh <eugene.loh@oracle.com>

On 7/30/25 23:09, Kris Van Hees wrote:
> Per Jose, we should be compiling our BPF code with -ffreestanding to
> ensure that BPF-specific standard header files are used instead of
> host-specific ones.
>
> Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
> ---
>   GNUmakefile | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/GNUmakefile b/GNUmakefile
> index b8e09f574..7ad857f88 100644
> --- a/GNUmakefile
> +++ b/GNUmakefile
> @@ -127,7 +127,7 @@ PREPROCESS = $(CC) -E
>   export BPFC ?= bpf-unknown-none-gcc
>   
>   BPFCPPFLAGS += -D$(subst sparc64,__sparc,$(subst aarch64,__aarch64__,$(subst x86_64,__amd64,$(ARCH))))
> -BPFCFLAGS ?= -O2 -Wall -Wno-unknown-pragmas $(if $(HAVE_BPFV3),-mcpu=v3) $(if $(HAVE_BPFMASM),-masm=normal)
> +BPFCFLAGS ?= -O2 -Wall -Wno-unknown-pragmas $(if $(HAVE_BPFV3),-mcpu=v3) $(if $(HAVE_BPFMASM),-masm=normal) -ffreestanding
>   export BPFLD ?= bpf-unknown-none-ld
>   
>   all::
