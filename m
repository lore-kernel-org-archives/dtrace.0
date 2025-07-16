Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F4AD2B9BA
	for <dtrace@lists.linux.dev>; Wed, 16 Jul 2025 23:08:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752707294; cv=fail; b=S/zbNdGAjAnsFZhxCQLy0K5Jay4BJ2SV98u4BBpMJPLy0RqrCRVuz7AWTqH4Odae4wgBQQKxORUwTFNdJPF2ZlCbLz1ew7u+pGNDZDYQG0k1ki2d5TKdXf+bZxeQZQ0OBxEr8oyaJL9nBIOIxQhMZ2VtYdcz+e5qf8NHamiicjA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752707294; c=relaxed/simple;
	bh=16+EiFfrmGF06knsPN3PkWGjIza8XwvOr5gCRzzTpk0=;
	h=Message-ID:Date:Subject:From:To:References:In-Reply-To:
	 Content-Type:MIME-Version; b=nFb9fDjUqZNkclGKt4+g7GgErq9BaT4VEWCTyVfpUZGAKhkaAKhwABwqalywOveBZCKNVVD6LZkXN0rwJ1ETa50Rgy+zpjzSMcFx6VEC1LBM03IRmL4bVIBkc+dkMFmJekNq28nmG/iInI0C6G8MWpiB3qGy7rWLUijWKdQjZRc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=HqI2h3D6; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=aNIMhUBn; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="HqI2h3D6";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="aNIMhUBn"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56GLfoYb023493
	for <dtrace@lists.linux.dev>; Wed, 16 Jul 2025 23:08:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=xPny75xOAQY/UAmNWoKPqKBztp/71J1YETq+7F4US/k=; b=
	HqI2h3D61tVPhUlWD2a5n8pnzhNrT8MLA1uMEgR8lGAtM++OHI4yhuOojt8QV8qT
	abFg9ThqjvQVsb7t4+cjBej9VrMAkMmj/rWtxMLMG378Hev/9mepb7L1J4TH+Ay8
	C6DkONb+cPa13CKm5WiU5knsmqa2JlwRucb1DddUKXCntcOPlnovzRvYNY+Syy4U
	b4RdrTCjR61h6uTbcOVyeQcsJ4MVosMceNHZ0ozUK85IqmE+zGT/dK+YilapHuG4
	bfnkbuALP8aUQlKuAc8AcstW7PxTSITkzacCMzU+ilG3YsX1rgTkfWoJXPdOqfQV
	wPBQ8PJsB7fhbjSRITqZLg==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47uk8g20mb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 16 Jul 2025 23:08:12 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 56GKpFKN030555
	for <dtrace@lists.linux.dev>; Wed, 16 Jul 2025 23:08:11 GMT
Received: from ch1pr05cu001.outbound.protection.outlook.com (mail-northcentralusazon11010004.outbound.protection.outlook.com [52.101.193.4])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 47ue5bx84a-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 16 Jul 2025 23:08:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JDZOpdGSlbIv1R/GDNUB1sDYh3qn/g7whkNhRQwj1uBw2mTg7HJ04P9EYXe3k3asrPmVHLwnEOrpTv548zDWs8HAbLn9ajS9MLP7fimpENRZ/Qwb3nSYjDbiArYOGV7t/cwp8rUqws/R7SZN7Om72mpI8Kc5OhHRkIs15qD03iig0zayM+6yxqIYCKy5CFASZwOURzC58K9SgS9RRSAK5eKdwDSRm97yOnxB5Js6xb2MpRxrRX/BXHXh3HSlsGAJopqov+iuMT8UbRSOAmZoAFC235S7Q7GItbwhJMwTXjfswsbInnqku4+WA9ihqvNnpZQYnuQJ7wQQeUb0GOslTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xPny75xOAQY/UAmNWoKPqKBztp/71J1YETq+7F4US/k=;
 b=p/7KVK4/rrwP0xNBMnWoeTcJUL337xFnFCAdPdqDbWo4pAd5NsSJxzIyREYTqnkuLf+p5C8vCNhJIP5NC4VjnG+foRiQqHsgvYswM49k8vk1iVGRF6waKoskpcuuPZa+1rqLzO9qb7wXndDfvJWUpR2Q4e/ceNmYVijj4nnTsW4wdymD5bEydpgHvckiNOUa9N5YLTrrnDxKJpoiG9Xz56hMC5HqlvndKQF2OSyPFyP+/gMUuzkU4DpwXD8khdBwFHKa4lDcPKZAKiCgAoWW96h7euUCUx4CmRHo6e0Ir+ZSkfA4Ns3+93lC1ELuzThdFl4qpefz9qfuFsOz0Psdtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xPny75xOAQY/UAmNWoKPqKBztp/71J1YETq+7F4US/k=;
 b=aNIMhUBnlM1C7Xeo9LJSHXYml6cki1qyHEiA9njknERlN48e0Lf+pDYMhrihDfeTV7pnRHyzXNzg7uKypR/QqKrLDD5GijLmzKQQkrDDEIqUJbdUZF64WOGoFK2JHZkIIXAPdaka/QiTdqINn9HaTcC7hmXyPLDmgth+RBbN0ck=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by DS0PR10MB7935.namprd10.prod.outlook.com (2603:10b6:8:1b3::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.35; Wed, 16 Jul
 2025 23:08:02 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%6]) with mapi id 15.20.8922.035; Wed, 16 Jul 2025
 23:08:01 +0000
Message-ID: <529c8de5-2eaa-6bbd-1dfb-392ab4d4a4d0@oracle.com>
Date: Wed, 16 Jul 2025 19:07:59 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 2/3] cg: validate tstring alloc/free
Content-Language: en-US
From: Eugene Loh <eugene.loh@oracle.com>
To: Kris Van Hees <kris.van.hees@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
References: <SJ0PR10MB567277E28590C437C8E1955FC257A@SJ0PR10MB5672.namprd10.prod.outlook.com>
 <2032c9f8-aaa5-91ad-64ef-53ba665613b6@oracle.com>
In-Reply-To: <2032c9f8-aaa5-91ad-64ef-53ba665613b6@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR03CA0334.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::9) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|DS0PR10MB7935:EE_
X-MS-Office365-Filtering-Correlation-Id: bf930d93-53a0-473d-2360-08ddc4bd9cbb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?OXNzZ3A5bDdpZ0MyZE0wSGhNNjM2em5ZZWovelNmaFNyYTBMeHg0Q0FFLzdP?=
 =?utf-8?B?amxWN0hPazZtWFJlbnNMWTFCTURKdXFXd0dScUppTnFpMm54VFRaVHREcmt0?=
 =?utf-8?B?RUhrL3ZPU2lrN25wNitBcDkzUkEza3EwWUlVMXlsLzFYSkFVZkVUQ29wK3NI?=
 =?utf-8?B?MWNvVGNUamJxb1JZZXVFdTZ1T0Nic2VTY2VNOEl0VHprVGNBNXpsakd2OTJJ?=
 =?utf-8?B?Uy84Nk01NExZc2VRc1l0ZUVtNHJnYTI2em05RlRMNHdBa2FHbEVRRyszSUdi?=
 =?utf-8?B?Z05xcThaamRyZlJSY2huR3VheUkzZWhtRzMyMmJRTFRMbndHc0Z1MXVzcGRC?=
 =?utf-8?B?SzFaMmpMeTNTSTNHY0NRdVV4dGkrWVF2SUw2dUpURnJMdGJhODh1MXVzVXpE?=
 =?utf-8?B?WGw0YWhjalBxek5UM0EvYldnQjdSUkdqckF3THNvNFpndzk3cEltWmd2YkQ1?=
 =?utf-8?B?L2pRYmxXRWg3dTl2a05yQmVhdklXUUM1QkNFVytwYzVFK2JabVgzNmlOWmV5?=
 =?utf-8?B?NFIxSU1jd1RCVTVNMG5TZlN2OFVvSXZ6R3haQmZDdklhS3FuWE5ZZjh0VE5r?=
 =?utf-8?B?QmRMUmVSdWtSdzV3Y1NnLzA2TFhpR055K3gzdXFaWXMwRVhwaWVnNHJmVThS?=
 =?utf-8?B?NXJkMGNORkRxa05QWG5jL2RYMm85a2tUemRIT056aG15UTMweVlVc20xYWNw?=
 =?utf-8?B?T2RUdTFHY1ZFc2VEZC8wcUFkYWZaUFVjV3pmU1dMdFdWL09YYk0xZVVCUy8z?=
 =?utf-8?B?VEhKYms4bHV2UGlJU2xYK2NueXc0MDJBN3dJTzBnK05CYmlYajhRdDJaZlAr?=
 =?utf-8?B?NGUxOTUyd0h2NHc0cVNrQUxoUk83NVNlblQyQlBFUjNkL1JqWXZCRjNwNW9o?=
 =?utf-8?B?U1VaWEVVRzh4VFR1bjZQdDV4NmdJb2t0Wng1WTlITDByTjFIZis3c1JDVDRh?=
 =?utf-8?B?MXFUMy8rTmpPT0dxcTNNcXRGTDl5STJZZEozeWpqcGQwdmpuTjRPdklxZVFZ?=
 =?utf-8?B?UXdEWHk0YS95TjVPSVFLRTRNN1ExbkVzY0RZS0JSaEYzU0JhbXRtSUYzQlJi?=
 =?utf-8?B?UHRkaXJkOFMwakFxSDU2MlBYcDJrdlVZTzhtQmRVSDM1L0ExQ1M3UXRlTHY1?=
 =?utf-8?B?V3hsNDMyQ1U3Nm1JWFBhMG1tVEdVeUsrT3ZYbTN2UjVEWTQvMVFhS2tscjBP?=
 =?utf-8?B?Njg4TXVZTldjT3N6WU0xbzRhdnlIQXh4TUJYK1dtd0F4QVArYWpJaWxOY3pW?=
 =?utf-8?B?enhTWjlHdG1iclRyY3NPYWlhN28xWitkSktzWE0xVFVZZnRENnZTN1hZUzlI?=
 =?utf-8?B?eTBuVk1EL2hLNHB2UnBuWTZSYUc3ODJ2dHBkU29rL1JCcGQvdlV6WWpCbVZN?=
 =?utf-8?B?bzN0WG5pdUY2Ylh1cWtPdzcwUTBuenpjc1dneTJjaWFNbU1iMkl4Z0dNaE40?=
 =?utf-8?B?TEF6a3FUQWtpenk4R1RsbC9TWG1RQ0dEbzN3VFdydHM1ZEJkMkZOeFIrdVBz?=
 =?utf-8?B?aXdYa0grcVM0ZlNmTVVIR2x4S1VFTThDdGowVElZZEVzTm5uMERCb2dNaWxh?=
 =?utf-8?B?aE54SDhMSTNibmhCdFIwYU1zeWdxNFc1a3J0S250WnZ3cHVWSWVXS0ZvMUQx?=
 =?utf-8?B?RGMvQ3FhbGpkb0pLeWQ5dGJJTUJGT2tBT2w1dnRSVWdqN1o4U1Z4MG9HNzVv?=
 =?utf-8?B?YnlWTmpEZ0d3cEdoUDFmd1pBM3dlNlFXUnEzcFRadlBtR3FJY2tsSFlMSlgx?=
 =?utf-8?B?WFpSNzQ4YXJ3WFZRQ2lJL1FWR1VFVW53Wm51MEFNUFFLcjJoL1BOU0hZTVlE?=
 =?utf-8?B?K1BzdnZST0dRcDA5NmxXZUhVakhXcWIxRWxJaUpBWXRoZ0p4cnkxeThhWTNx?=
 =?utf-8?B?ZnZEK1htMnRTbzAzdElYUXA3d2F1RUF2QS85K1dUd2xLNExjR01peEJXTDVB?=
 =?utf-8?Q?gwUbEGeegds=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?amw3eVEyN2pSYXFVeXJ2WUtFMFhTOXpNaWJZeXUvcUdYK004ZmxzTWdQazRP?=
 =?utf-8?B?MGZ6YmkwamkvYkJISkdNbk5LaTk1LzFYOGU5YVMvSzl6eDMxMm5JTERka2hn?=
 =?utf-8?B?ZThPb2VyNVFYUlpObVFiSFVVM3lWdlV1NFJUTWlrSWZNbTc1ZWRNNzkrUjRq?=
 =?utf-8?B?Q0Nvd05CQVFiSGVTdHZyUmxsQW11Y3dPMkY1TmlXZ1JSRW9MQlpSYjdzS1Ba?=
 =?utf-8?B?dnVsMnB5VTlnMlZIMjVZazFaMUtjM0IvTURCMG9qQVE1YS9sQllOODQwODlQ?=
 =?utf-8?B?MzVRdmNIOEpaaEx4U2tjY0JXUmNzOFRzaTduTXg0RTRZR2dsTmhMZk05TGZB?=
 =?utf-8?B?VXNZRWZrQXhDMkEwb1pEall3VllRWVB5US9uR21TTHk5VHM4NjkrajhXY0Jz?=
 =?utf-8?B?aFY4ZEdGbmZNdWtuMTBwbDRKRDQrc012blNkL2Q3ZkxOUzlSQ1VzaE9hclJ0?=
 =?utf-8?B?RHNqc1FiT0U4NUUyUGhCeHhoMXJJOE9iaVhSVXArNGdkZGJXODlsZnQxdGpT?=
 =?utf-8?B?L2ZVNndpZjJJM29CNHdMK1ROSlJBUFBjRjJnRiszRkx0a0xBTU54aFA0OHZE?=
 =?utf-8?B?bklJdXMxZ2svTVNFWG0xOFNDU2FkWHlTa2RjMk1lYXdvb2s0QnVRcmxJSTlV?=
 =?utf-8?B?L3BqZmlaRWVzeWdYaVJ0ZEZXNTJrbHBvZHh4cnpHWnd4RTFoT2VJWGp3ak5k?=
 =?utf-8?B?UFluRWorektwcjU1dFJ6NmNlSWFRWWY2WVo5RDMzeWhGSWp0eUF6djUzVGZt?=
 =?utf-8?B?dVNBNDliSngxY09oMFU4Y0tFckV5MnZkNjZqZm95V1AvV1p2MndCZENTTzVI?=
 =?utf-8?B?bElFVVMydTRRTHpuV1FtazFtbm1xcEcvYjZFWnhjWk1kd01wMXQwSm1hbnll?=
 =?utf-8?B?b0FMWHo5bTdremZ5QjZRemwyU0pTQm5JaWdNUVFDSnZrS3ZWZTdGRWRld0dv?=
 =?utf-8?B?RXphRWZ5Qm1pa1ljWlR6QWFhbU1CUUQ5eURQb0Y5dlowdzZhdEZSakNuNlI3?=
 =?utf-8?B?UXFVTnpWT1FWbUUwaVU2SkdlajNyaGVIZXF5TE0vd2RpMU0rUWtzelFOdm5X?=
 =?utf-8?B?c0R6VFhWaTJJWi9YSldEZjQ0alExd1ZOQkJKR1F3Wkl4QitDMHljREJyM3Bj?=
 =?utf-8?B?OVhiRFZNcmU0VWpyanQ0SzJ0dG1MZzVENG5haFdpcnl3MHlHYzZWQno0VmR2?=
 =?utf-8?B?ODh1a3BZbGVHM1BLUlMyWTN1YlFIeThOOE9sS0NWU29lVVRTWUdXemIwY1VE?=
 =?utf-8?B?V2svRVlUdlhIU09abTA2Vysvemw4c0VhMWhGTmp0c2VKNHpZUXQrcFVMYS90?=
 =?utf-8?B?WDMyTE9IS3I2bnNRT3d6MTJLU05SemRLTEdPdGptMVNyT05JUEYrZFBiV1hj?=
 =?utf-8?B?WGVUT2NnNHdjQkdmNGoxUGRzd2d5WEVFQk1ENmswUm9aUEUxNFNOUnY4blQ3?=
 =?utf-8?B?UVhjQWpNUUg2d3lza1NrUTFVTlUxMVc4bzVKa0NMSGVtenR5RDdwOXRpWHd4?=
 =?utf-8?B?ZURVZno3NldqRE1zQXdJcFlLZ2VxcUY0d0k3bER2YmpaenVLQzZtaStBWlhF?=
 =?utf-8?B?U0hiczZ5OFJnNGw1aXJnVk1QTTM0enBWTnExdk1qNi8rRVdOL2ZxSnlkT3pS?=
 =?utf-8?B?aXFMWjdkQWdBTzNlWlZJZUhiTExqYmVXYTFHUUNWMlBzajZXZzVLSzJTUnAw?=
 =?utf-8?B?Y051VnA3NVp0dTRwRGtWN2tldXU1bEJsakFOMldlMWtjTE9TMGhGWGp4cHdG?=
 =?utf-8?B?NVViK24vVE1OSEJxMjFVWG9rYWlwRkdxNFB6eU40L1hFNDhNQTFtMERHUjdC?=
 =?utf-8?B?dGNXaG5LS21raWtuZjNid2pDRC9xbittRWpaUWovVy8yRld0RHBmaC9SMkVK?=
 =?utf-8?B?TVRLcG9Ibm1WeS9lNmplU0dpRTY0WWRGNU1oNmJVNWg1OFEwUDdMMHd4L1p4?=
 =?utf-8?B?SEdIbTYzWDl4S1daRnFQUlBxZXZoRGxpZFZlMVc5Qi9zZnZOb21KYVZFcXRE?=
 =?utf-8?B?RHJqbWNKL3gwQzdYeUlsZUdGVDY4ZlEreno4NjQrNGxjNUpvNURIZ21Welg4?=
 =?utf-8?B?SndPTUREUDhEc3p5ZmpvL0xQN3MrZWVzZ3dXLzd4ejl4bU1QNGxDc3Vib29p?=
 =?utf-8?Q?6Na3GpIcHwIIDov657lPRjWS/?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	hdbBiNIGCiWf+9ZUjHVEtK/n9s5rmTdVwnalQROtgeO79sGf7FR2ENchAHXB4jb15Iz6ieFJNRaNXZHawxGAeKZLtobC9Ob680bJKhz04OMiFvduahAHum7CyaWIWjMgk68KLLQTPrQXcZfA+9Gmr0Go3iOaptHuYL6vBB5fpzGQcQhSLEgl64fYn9U7Uv/D8IELzaJBXhNd0wbcB4hzRq1lqYz3uIjzQCUX4ZxOvGtAI/n0DkzvP4MnCbBrnORnlCG9d9eoGdlwSVvy/uOVJ8BofnmT6My6S27m3Tqm2dp/wFh+ZMF/ar3yrpSbxKB9caWX3SFz7nGHNMv6asdXsrCzF7U8kxP+QSnfpYjyYrKvmnTfmedCFMfTuzCD1Vsadez4JPvzjccQ5B7gKL6kiwEckFziyIENVyrEk9yLa68S1YJZfQBnwnFCB1JQA3ylSoQesmqFXZh2O9jPTC4z8GPZkza2dH0jKuDqj/yvupCrKyx+FsrCva4y/UNmhm1r/bRTXIs9jwNmGPkuZT7IDEROPyR5jZUHeENpwNm2XjhaNcjCmP27JGdtNoMzW1CI55k5BMe2bMAA2JhzCsEadhWAXLA0EN8aTe41yMUIvBo=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bf930d93-53a0-473d-2360-08ddc4bd9cbb
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2025 23:08:01.5905
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0zK5jdWejo3/jN+axqQzOOveV3rOj8b7l/860FJKaIcY4dG7EwRCjnql8ffERHj5Q+49ODkTQO8KgPTpB95uIg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB7935
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-16_05,2025-07-16_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 suspectscore=0
 malwarescore=0 bulkscore=0 adultscore=0 spamscore=0 mlxlogscore=999
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2507160210
X-Proofpoint-ORIG-GUID: L1GoqphLt35sUUDVUxGHc6vXPPNjMfuc
X-Authority-Analysis: v=2.4 cv=Of+YDgTY c=1 sm=1 tr=0 ts=687830dc cx=c_pps a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=jyy9b-zK4IqRu7J_M08A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: L1GoqphLt35sUUDVUxGHc6vXPPNjMfuc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE2MDIxMCBTYWx0ZWRfX5bYO3ud1Durm RgibalBFgPafwS0ocPPXq2tsXQhV40/QndeVdX4ODzDmCGWn+Wypr6kwu4QFO7I6wMCZDbprKqj /i3KHad8UoNnUltuHyAUECo4j4sC36sLsvzUVaEYa44/Eb5bjvT8LKwxPU/aqdwVW8rSDmwX+aw
 83/RSpTBMXA6QbiXIpQbmUMTPu7a8S4kftXFBQ3rUqs8REwbJha4ufOwXr9wnVeuxFq+zEfTGOj nrorERbqmFz7MrAVBM1d5283dVPmL3W9ZjQ8R8vQOZa6i4v64vLTSn+kn1DeaW+8j3TfFLAb2/x j8S1SFMvgAIYEQVHUOTzc7d13aOLs5Wa079/A/iQSRAfyLKvI6t+ivXhm0dT53zjCM1EGtprN1m
 J0OYsK2WVWtFs4WcW3osspegHxTPKRifMXdrpANc7LaX9/lg+iYQx5Bd6ZfI/XsS8Z70M1Ws

I was a little concerned about this patch, but also wanted to expedite 
review.  FWIW, testing shows

test/unittest/builtinvar/tst.psinfo-bug21974606.d:
test/unittest/builtinvar/tst.psinfo-bug22561297.d:
test/unittest/builtinvar/tst.psinfo.d:
test/unittest/builtinvar/tst.psinfo1.d:
test/unittest/fbtprovider/tst.entryargs2.sh:
test/unittest/funcs/copyinstr/tst.copyinstr-high-maxsize.d:
test/unittest/funcs/copyinstr/tst.copyinstr-low-maxsize.d:
test/unittest/funcs/copyinstr/tst.copyinstr-no-maxsize.d:
test/unittest/funcs/copyinstr/tst.copyinstr.d:
test/unittest/proc/tst.exec.sh:
test/unittest/proc/tst.execfail.ENOENT.sh:
test/unittest/proc/tst.execfail.sh:
test/unittest/proc/tst.pr_psargs.d:
test/unittest/proc/tst.pr_psargs_other_task.d:
test/unittest/usdt/tst.argmap-typed-partial.d:
test/unittest/usdt/tst.argmap-typed.d:
test/unittest/variables/bvar/tst.execargs.d:
test/demo/spec/specopen.d:

test/unittest/dif/bcopy.d:

failing on every VM.  (Well, bcopy is listed separately since we skip it 
on ARM.)  I'll try to put together a patch, but let me know if you 
already knew about this and have a fix.

On 7/16/25 00:45, Eugene Loh wrote:
> Reviewed-by: Eugene Loh <eugene.loh@oracle.com>
> though apparently
> undiscriminantly ->
> indiscriminately
>
> On 7/15/25 15:50, Kris Van Hees wrote:
>> Rather than undiscriminantly resetting tstring allocations at the
>> beginning of a compilation, actually verify that alloc/free of
>> tstrings is done correctly, i.e. that none are left allocated after
>> compilation is done.
>>
>> Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
>> ---
>>   libdtrace/dt_cg.c | 9 +++++----
>>   1 file changed, 5 insertions(+), 4 deletions(-)
>>
>> diff --git a/libdtrace/dt_cg.c b/libdtrace/dt_cg.c
>> index bd0763d6..6c7ad076 100644
>> --- a/libdtrace/dt_cg.c
>> +++ b/libdtrace/dt_cg.c
>> @@ -1432,11 +1432,12 @@ dt_cg_tstring_reset(dtrace_hdl_t *dtp)
>>           ts = dtp->dt_tstrings;
>>           for (i = 0; i < DT_TSTRING_SLOTS; i++, ts++)
>>               ts->offset = i * size;
>> +    } else {
>> +        /* Ensure that all allocated tstrings were freed correctly. */
>> +        ts = dtp->dt_tstrings;
>> +        for (i = 0; i < DT_TSTRING_SLOTS; i++, ts++)
>> +            assert(ts->in_use == 0);
>>       }
>> -
>> -    ts = dtp->dt_tstrings;
>> -    for (i = 0; i < DT_TSTRING_SLOTS; i++, ts++)
>> -        ts->in_use = 0;
>>   }
>>     /*
