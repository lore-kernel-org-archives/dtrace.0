Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 783B7AD5A
	for <dtrace@lists.linux.dev>; Mon, 21 Jul 2025 17:01:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753117276; cv=fail; b=izVBsfoDjDc6OjkPD8JDCfK86pATx/A7I7PFH/H8Q8sXYtrLs7pW+HDwXqAQmC6edvrhjXO/z2DD+KUI4KHpRMi7+roMvxq19nFvWxd5YMb3OYVRMDQbGqYxe+CEhVNrj72Mjd7AkiB9zPOokvvqikschqF1b/yQKyy12zvt/gs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753117276; c=relaxed/simple;
	bh=W/RSXo0mRRvKV4ifcFH/XVs1jILtDnhSDt5Wbo9mJM0=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=GnzwkQrhNObZr8KNrvFMzVVv2VgFXMA5tTGvPTzYNMnzaGVId8uJ2yU6kdUibd8RqG+IZvsuQhfpwg6o1ddVma6cxY78SZ+bgpgao4/IUuSpbmwSXVM4FTCLZX/YyDrUNCRRs4KHBLaEPxqTu/wzIXw0iWbryBtCTucWYYeaWD8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=bHDUyzOX; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=BO/JQyg9; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="bHDUyzOX";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="BO/JQyg9"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56LFQft7001345
	for <dtrace@lists.linux.dev>; Mon, 21 Jul 2025 17:01:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=Vos0C5kOwdm6TaepUn09EZ7u2fAm4Am+KW69CnMjOns=; b=
	bHDUyzOXY7xzpiamM8P8Xl2+S1wAYahtCUDbYxrRpCPJf58cgmHi4gW5N/wHPjcN
	R/CTQwQILsqkYi50UAZ3Dz1q4Xd7ehwk0VWYRzT8EU6dfGHWEgQUOeYqSz9qwZq/
	cRWyViR6FrQ+m0hyvgb6EQHeCOPdEG7scX9kH3hd/tVySZSRKY3BbPDp0yMUT7lV
	6A8abwqeVcYgjKd28UlJUnNbHkISA5PZloZN70z/oTqqyVMOZYvF4PtDUaP07Vpm
	3PTLOSR4WyFaF/7lonIrI/wVgoTF5DV+kUIzKwmTSFqdyXZnPFuEaczvTRjZLxXB
	nJ9NpJWiiPU5AREbXWBVXQ==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4805e2b72h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 21 Jul 2025 17:01:12 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 56LFw0Z9014405
	for <dtrace@lists.linux.dev>; Mon, 21 Jul 2025 17:01:12 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11on2077.outbound.protection.outlook.com [40.107.223.77])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4801tejsnh-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 21 Jul 2025 17:01:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nZF+IOeeDx7O/1CUCXZndTau3st/SjYMI2if6PsqAVL50jiPnIz1Y4mQb9qa9P0YouNwuoxudQLpSxnDcqJb6C7RbdnZSNvWpqPyhKOfwxTS7w1G3Scf6rhqRrswA2jzUagAeE+QwvJqNQpiRu458b/wyRzPvYKz/YLAcFc3MLyZp8AmjfvD36nQxNLsy/H4YWPYWCFKaL6DR4dfU6c9/+QAInhY3zVSceO4aOBFQPCFl8Kldi92IVB96sI+veBQDDg7I2JADhsxS8UU+cWKc7XwF4+NbeoFHZ1MSrEfd35NcKE4sfBD78kYRMQU7VHo43L4pDg137OF1vdEi94gng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vos0C5kOwdm6TaepUn09EZ7u2fAm4Am+KW69CnMjOns=;
 b=Wrhj7tbP0mr2q2HxJskfzS5N3tdzAP0D8xGpIe1Xgsj5OSaouOkT1GD2UD8EFsmfH+B2u6DWEbWU4Uk2ZY9udwUHP6fcqgPiy6wzpn+gSBCSuw2rYFHu7acmzw8PuieOIa25C5ZiKOnYyZ4eeeP7bR1w3UoxiBaPghZoX6GAtZt2iMlv7xHEjvoACuMVmUAtt8SSapnyBIrJ2sHQEp7gqio7uENv7RG0i8f//eiemgTCaWtGIztymTbigbjbWfvHCSlQdtHB1MfkPT81qDgkjxokhEYMlUjIPt1SGTqhahFjXuK1lPtz9UeAisRfy/7aMKrQSSVYAYAZKjfXTGuY3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vos0C5kOwdm6TaepUn09EZ7u2fAm4Am+KW69CnMjOns=;
 b=BO/JQyg9DrwcOqAlk2IaXH0OLDSITiSlIl0SLGbASNi76sSML4t3Tc0W3NLk5RPapS+EKOBgSY/qJ5J9aVTYf2XgnFKGeUEOD+6n+wnHNvk6ZEvHErCBgjBAnYfbCAYaZ/JQYaYOFJJHO//c2RHzoZfZ0wtd3Uv6mIwTSuzhH+8=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by SA2PR10MB4506.namprd10.prod.outlook.com (2603:10b6:806:111::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.30; Mon, 21 Jul
 2025 17:01:04 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%6]) with mapi id 15.20.8943.029; Mon, 21 Jul 2025
 17:01:04 +0000
Message-ID: <ddc2bce7-0907-509b-c32c-00430e49305a@oracle.com>
Date: Mon, 21 Jul 2025 13:01:00 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 2/3] test: change .r.p files from /bin/sh to /bin/bash
Content-Language: en-US
To: Kris Van Hees <kris.van.hees@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
References: <SJ0PR10MB5672FA7CA4991AE52AD88A9CC25DA@SJ0PR10MB5672.namprd10.prod.outlook.com>
From: Eugene Loh <eugene.loh@oracle.com>
In-Reply-To: <SJ0PR10MB5672FA7CA4991AE52AD88A9CC25DA@SJ0PR10MB5672.namprd10.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR03CA0167.namprd03.prod.outlook.com
 (2603:10b6:a03:338::22) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|SA2PR10MB4506:EE_
X-MS-Office365-Filtering-Correlation-Id: ec52cc20-c180-4617-3e7b-08ddc8782d9c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cS8zOGdVcHRCck5keC9DeWRSOXQ0TWNvL1FPY2JFU3pWTFN4eklIMjY4cmtq?=
 =?utf-8?B?VE0xZVEzQWd2c3BxM1hxcXplU0FNQzBzRU05cllROU0xMGVRTGtRd2VrMW5y?=
 =?utf-8?B?SHRvY01MM0dPNUxPN1lnWEwrbXBGT0NlRzdHSVRZOEQ5UzNKMXlnTHltaElx?=
 =?utf-8?B?WHE1enBVNXlZSGtSTndiamMrTGxyNHRqNDQyRmFDbVl2bHBEak1BcW1iaGJx?=
 =?utf-8?B?KzFFa3M2TUZSVzhXdC84eW5XbExQMnVweUlBRUJFZ3JZRDRnS3lBaG0veGti?=
 =?utf-8?B?cUhWdEVIUFFoY3l1dG01WVRVSVpueFgrMitBYUpuSUs3d21Vc1ZUY0k2Yzk5?=
 =?utf-8?B?ZXJod2x2ZVVYSXBmTHJGcFMxUXNxc2JsRVdFb2dGalMwd1FuVGRSVG9FbFRo?=
 =?utf-8?B?NTJqUTF3eXdFTEZZZFJ3alY1YS9GUEFVWjdzVkkzZ0dOZzVYaDdtZU9SOHg5?=
 =?utf-8?B?WUV4MU41dlloQmU2cVpNNCtKbnFOczBwaWVOWnptOVg0V2N6d25jcVdZTHVX?=
 =?utf-8?B?K2lBb3hLNlNaTDJnYkRMWk4zVHplQiszTjNzV3dtSG1lcUdVT0pTcE1IYm9Z?=
 =?utf-8?B?dytiV1BTdDdHVjA3QkdZdXd4RkdMMXpvN29GNE56Sng0WFYyUmZ0QXN5NnBz?=
 =?utf-8?B?bGNFUkt3RWhGQXF4dDF1dmMzemdCRENhUmprQnd4aVRzWm5nQUdzT245ZlY4?=
 =?utf-8?B?OU5KKzZDTjFPU1Y3dTc5eGRQVUhYUGxSdXpkY285TWZkenlqNkY3MmQyYUVp?=
 =?utf-8?B?U2kzMlExNVUwUXJUa0pEYUFHd0xFZ1gwcUhWcC84allweVpxRmRlV1N1M09H?=
 =?utf-8?B?OGI5VWJVbEVWOVdOcVo0YWNBa1FyM2RxZDNaRWd6ejVlV1JGT0xlUUNpTURw?=
 =?utf-8?B?K3djT1drL1ZYYnhla25BVGZoUFZCSmxibGVjZFAyWjA4ZEFDZ1EzMWxkMnJr?=
 =?utf-8?B?dUF3UE1qMGhHREE4cjY3TUJ0cFRpNWlOK3ZRMzMrbDhZQmxWZU01NUFEMW53?=
 =?utf-8?B?WmlBNE4zNTJtMHA3TDdNTmt5RG5QYlB4a2RkMDlsY1d0RkxVOFM1WXFnVW5E?=
 =?utf-8?B?U1RMV1R6YUlVL1hkdk5JMTRoTUdFSktDVXdHN3grTzM5K1YzcHRWVjdhSmlt?=
 =?utf-8?B?c0FXZVovSnVZYlUwbVF0RjBJL0Evc0EvWndWY1UydENXSmlsbC9sT2hYR2lk?=
 =?utf-8?B?QTk5ZlVUcTU4THFTN0lrRExCN0hLNGVHRi9wUjlxTUMwUE9qMkRHWDcrRWxl?=
 =?utf-8?B?NnJNQ0x1YTRFODJUODFNVGR2SmxuZ0U5czFDd0h6MEdFQUpBSDRGVGJZeHJr?=
 =?utf-8?B?MGRick8zbWJzVW1XT0hFOW9NZHdTV1U2WlorTENPQ05DRi9Xb21ESVZPRHlN?=
 =?utf-8?B?NFZqTGJ5amJKbE1JQW4zcGViRGtGK1FQZXNDV3VHbndSOS8vR2wxblBJak5q?=
 =?utf-8?B?R2NFUUU3Uml0ZlE4bE1KSnNGcWFRUS9VZFh2ZlZCeGhtTHN5ZWp4NDVEakV5?=
 =?utf-8?B?RHFNWk1OK2Q5UVN6U1lyRWt5cE1kNitvaTZIUDliVWVXUHNhOFNyeGlFdHMz?=
 =?utf-8?B?TUVRbko3MHNOM3I4b0ZNT0s0eVZyc0tjZ0VCMVlhMjBkZ0xKVXhTQVRjTDJR?=
 =?utf-8?B?R0g3TFJkZWNBRWMrVXpPTDN4TDFjS2R1c0xBL09zbTB3SDYzRnZwcjNDUzZE?=
 =?utf-8?B?OC9ReHVtWlRUaXBqUnczZ3B1bXJ3TE55K0lEWEtaU3NpZThuZCtHbHZGME9E?=
 =?utf-8?B?THp1UFZtbU9GRjlnVG55V1NDbDE1RjR6T0hYc1FTNGh1Zm9YQTl6TUs0WGJX?=
 =?utf-8?B?MGxrdEdSWXloOXBuMzFqRGRhTlVWU1VyRVdGZzVBVWNjbTViTERXeTVTK2Qz?=
 =?utf-8?B?bUtENEo1eGNaSDBPRVhrTmNnOER5bkVJUy96TjM3dWZyQWo0ejVJZmNxYkVJ?=
 =?utf-8?Q?jY+xNnkUO6M=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QlN2bEhybkxDMzdldDc3eDYwQkZlWG1rS1RvWlphSDdETDB4bFg5cEtzK0N1?=
 =?utf-8?B?aGd0VWlxUWYvdEFTMUNSVmpNUjdxYTVWbUw3aERPam0yYWliV2pNekIxSEJs?=
 =?utf-8?B?elk1T2hKUWhoSElZUi9QQXdQM096TW5qYmVjTlhxS1Y2clFlV2RWMkhmS0d2?=
 =?utf-8?B?aXd2SDBpUGNWb2dSN21IditqT3NJcVZVVGhuQnNDbUYwQjF3OHVNQk5PbDhs?=
 =?utf-8?B?RlFvMVdweTVXd2YwNXNoSFY2c1Vpb3pkTzlmekErQVl3aythT1g5Y3AzeGxt?=
 =?utf-8?B?a1FRTGtSVlhQL2tOT1RGTjZoWlVKMW9LZzh4TUhYUllBTmg2MklWSFdLNEsy?=
 =?utf-8?B?eWU5UFhTY050NDJPVGpTK1k5NHNVRFZpYlRqbUlPWjh6UVAwSkhKMGlJNnFJ?=
 =?utf-8?B?aTJrTzU4bkxYc2FYQmllV2FvSW5KdTExUW00dHNnZVJvRjY4MG16emx3ZnpB?=
 =?utf-8?B?L1JkbHJjaU5YVW8ranBlMVM3UFRVUnk1MitINGQ1Zkh3Nit4UTZPblp1K3g0?=
 =?utf-8?B?K0N1K1RYSGJGT0VUQWFRR1hDQ1l2Slg3Z0ZGb2ZKTnNoSWhnazVpUlNDMGRG?=
 =?utf-8?B?SytTTng0M09Tb0gzYitDeHJZcDducFdIVWxIMTR3eER3a1A4VzVpOXBjTmhh?=
 =?utf-8?B?UFJnek1La3R0b3Z6Z0JOVWRFbVBQbkhqYS8xdWtrdk9lVnF6Wlp3OEpNSC9V?=
 =?utf-8?B?bTVkM0pybVdaQmxHcCtkbm1KOG90Y1cvQ0dQbXdGZkc5L0ZCS3hwQ2JWOUxE?=
 =?utf-8?B?SXVUSVBUdjlBdE8vSWlGZUVJdDdMVWFad0RTRk5UTWYyblBydEhFNHpqVGZK?=
 =?utf-8?B?Tnh3U05ORzdZVi9Kc2ZmU0pPeFppSktOZVF0TTlhZVpkdHppU2VHaE1ON0x4?=
 =?utf-8?B?UnZ1SkVNc2w1RXo0ZlNrb2h4d1VKR25ndVYweXFHS0tzbGl0cDVWc2MxaC9Z?=
 =?utf-8?B?aEtOV3duOFhnQkcyZmRIcnJidUZEV01WcjdOZG5wMVBhdTNqVlFZR0dJZlA4?=
 =?utf-8?B?bzRRRVBGQ2NCQXUzeDM3cnVSNW9QY1ZQYjU4OTdwUGhnajlNUHRiV29pSDVW?=
 =?utf-8?B?VVhRQzd3azBPWWZqSGlpSXU1cHJsRzJxTW5nZHpEQzc4UjNuYTg5dlZoNVNC?=
 =?utf-8?B?MnJIQkswRTl5QkJMMjUxYUNscnZhNTMySW5oOXppQVRxWjJYeGhQd2picGtr?=
 =?utf-8?B?cVl1SFUwTW80RGQvRzIxdzdoOFBLeWxGT1VRNzU5YjVaWHNKdi9kanBaWG1l?=
 =?utf-8?B?TGIva2pBZ0N0bE1BUWRUTloxeDRqSWtuOFg4cUdFM09pR2FzQVQySGdFSWZB?=
 =?utf-8?B?cTFLMVJ3bFVTZDRhTnJ0d0hKY3pPejZOTWtnYThjVmVBTkpTYktLclBReG5X?=
 =?utf-8?B?N28reG0vVytYTTRyZVNQOGd6NlRERjR0VUdGUHh6NnU5SDBHdlVsSkVUZkNF?=
 =?utf-8?B?V0VWSkZCdDNzQTJLcnlRVmw0ZEpMbU5XWFpHck9yK3czZ25aYlNkVG5hUjhI?=
 =?utf-8?B?RGV4Ry9VZFJvcGp1dVFpSzNvRm1paVBwMEkzb21CUFhJMmI2ZEI0RmtKTG1P?=
 =?utf-8?B?NGJxQXZmT2lhSzhMc0JNSzd6Tmp4KzdERTFoT0k3UStUdFZGcitwTmlOTlgr?=
 =?utf-8?B?R0p1a2tkOWd4ZWFjaE1PTXVncmN2RmFhalI4YnRqMm1SeXVodGpnTzVkSEpo?=
 =?utf-8?B?b2YzdzZIaXRlc2YybnlGRHlMQ0RINjlyRUphRmMvb0xKeXBVTUMxZnRwdmE2?=
 =?utf-8?B?ejlMT0JtRS9aaXh0TWlyRHlxbnVERmZOaXpqcVZlL0hWbGxIMkZKN1lEdnEr?=
 =?utf-8?B?NzBtMHpjS2piRG9DQlhaeC9QWUw4SUo4cWgzRDJhSnBrOHdWb2R3bXVsWmV4?=
 =?utf-8?B?OG9CS2w2eVdRTENpSFZ2SkVIQ0wreTJyMDNVcDBzT0E0MG5aZ25qY2hxSUdZ?=
 =?utf-8?B?dzB2N3VnRE8rQjlPRGt3dkRLMkZxR0ZhV0tqZWVVNU96aW4waG8yRW9LY3B6?=
 =?utf-8?B?SnMxeFdaTlhCeUt3Tm1CbUxOYnQ2bi9XRjZKa3I4SkVwOUI2NW5KdzQyWnE1?=
 =?utf-8?B?ZHN1S0RTYU9rWjlKSElwcnVVZmFiNmpmRUZwSVZvYnJ6WHlHNHh1UTkyMVpK?=
 =?utf-8?Q?yRK9uJmjuDVSasaxQOCwfv5CG?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	qBh5BNLLg1LgmhN2vr4p9RGw/MeUVuG/dTEVLP12XV/xv7gANW5qH5NYLnh+thOsBxYZXt2f1xB+q2RhHbySA9B39dHp2E+iWorcYF1PpXLMfzoOor5eklce1//YzfV9xyOmulQsQAIWDyP6YidIH2bXBQ00kGSkv61Jo4wxxGSUwwxcvUJKkm5r2jMzDpnUfmoQ0ay6KphHaTDmMF+vhKwi0CTLuK2dFuxnkMKXSJ2Wnn5xYQahp1A/hO65QUabMWIpxW7Zmb9vguv03QAeiIJBGetXqWc0CZQoI5uFrrcbfi24GmaDB6thvzGzIVol9TsTcWJo5w0uMA8h3HVhJiG7tlAA0CoSZ/mjO0NyBv8UR+Bx8noGvrSweAOum4a4Ykx/oiYsLKZuuF6UCvXbNLqlzkVJL+HW3ZIfjRMPLmhNknh2E17SddCAWWCUHqafpFE3aKt1ZfCJsQwm95K2bUD1mepJKG/j6ZnJSIx9wQNqhoQBWD+tL4JtiIkHHt5Qo1RmtJRcRYW1dZyI5WkASFUmbUg+/eXpvBI9eNnspKjbZ+jh5HLEduMKqwr4mdC2U3A57fpVb2FktH2W5/MFu7KWD7CfFMNC2iwGynOjvlE=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ec52cc20-c180-4617-3e7b-08ddc8782d9c
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2025 17:01:04.6019
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vx1uAGTKln4Tgdprjn9N1XsDLmRDqgSzoloH8n5YRUyzCpPtPHdB+lVE/wiI4+HbkdNUwjqjo+p7YrZz5KHq0w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR10MB4506
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-21_04,2025-07-21_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 adultscore=0 bulkscore=0
 suspectscore=0 mlxscore=0 phishscore=0 mlxlogscore=999 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2507210151
X-Authority-Analysis: v=2.4 cv=WaYMa1hX c=1 sm=1 tr=0 ts=687e7258 b=1 cx=c_pps
 a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=GoEa3M9JfhUA:10
 a=yPCof4ZbAAAA:8 a=KkEFKC4U-qW1PrwOZeIA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 cc=ntf awl=host:12061
X-Proofpoint-GUID: QIRsK9B6tWWbhfn2_NxTF7ltSzw-BVpz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIxMDE1MSBTYWx0ZWRfX86Ouz5QNP5Ad
 KQyT/P6YkT1hfsBrF7Svl/PB2sbamtPeVtOpJwQoEyIdO9r43kSoB04pPemZasz5NUQ3f/dGCs5
 6/O1ZcptwAbHk1exLgRi5uSAqPJ/u2KiJy4lOLPyiZMbmqzv8GYMul7vWWdXJ9TMLtDgZbnOXXY
 xj8yvmS1KvANT2WRfOxOsA9M9kib0Ql+ICKQkQJlrDG054ddQiifJ+rYzBFzMtNJzOZNt4B8pab
 KivU3n5+0hB0iAM24LlJ1jT3+cKFjqBny2R54louM4sOYJ8UbgmFTyOvJFYLOGPV6RZxrZ6rQEv
 khr1MrrHOpWaFNQvg9IlEd59Q54U4TWautAN5oTmCvIR9tCWqmG77jkzgMe0jP5UTiN17UFcxBG
 xqCiBkKjbNAczdbSFJNdqLZDIR1xpLZVbakwuyBtlzKi/tkyLWbgwiqMSECYxwf1dogGC7nc
X-Proofpoint-ORIG-GUID: QIRsK9B6tWWbhfn2_NxTF7ltSzw-BVpz

Reviewed-by: Eugene Loh <eugene.loh@oracle.com>
I guess what I mean is that I cannot think particularly of any 
objection, but what's the rationale?  Certainly, there is still a lot of 
/bin/sh left.

On 7/21/25 09:34, Kris Van Hees wrote:
> Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
> ---
>   test/unittest/ip/tst.ipv6localicmp.r.p                  | 2 +-
>   test/unittest/proc/tst.signals.r.p                      | 2 +-
>   test/unittest/providers/rawfbt/tst.synthetic-entry.r.p  | 2 +-
>   test/unittest/providers/rawfbt/tst.synthetic-return.r.p | 4 +---
>   test/unittest/ustack/tst.ustack25_pid.r.p               | 2 +-
>   test/unittest/vars/tst.ucaller.r.p                      | 2 +-
>   6 files changed, 6 insertions(+), 8 deletions(-)
>   mode change 100755 => 120000 test/unittest/providers/rawfbt/tst.synthetic-return.r.p
>
> diff --git a/test/unittest/ip/tst.ipv6localicmp.r.p b/test/unittest/ip/tst.ipv6localicmp.r.p
> index 904102ac..fd1ef30e 100755
> --- a/test/unittest/ip/tst.ipv6localicmp.r.p
> +++ b/test/unittest/ip/tst.ipv6localicmp.r.p
> @@ -1,2 +1,2 @@
> -#!/bin/sh
> +#!/bin/bash
>   grep -vE '^$|data bytes|bytes from|ping statistics|packets transmitted|^rtt min'
> diff --git a/test/unittest/proc/tst.signals.r.p b/test/unittest/proc/tst.signals.r.p
> index 7798fa25..4044a64f 100755
> --- a/test/unittest/proc/tst.signals.r.p
> +++ b/test/unittest/proc/tst.signals.r.p
> @@ -1,4 +1,4 @@
> -#!/bin/sh
> +#!/bin/bash
>   #
>   # Eliminate blank lines and the monitor messages emitted by bash.
>   # (Turning off monitor mode should quash these, but it doesn't seem
> diff --git a/test/unittest/providers/rawfbt/tst.synthetic-entry.r.p b/test/unittest/providers/rawfbt/tst.synthetic-entry.r.p
> index 18171f04..59dc63b4 100755
> --- a/test/unittest/providers/rawfbt/tst.synthetic-entry.r.p
> +++ b/test/unittest/providers/rawfbt/tst.synthetic-entry.r.p
> @@ -1,3 +1,3 @@
> -#!/bin/sh
> +#!/bin/bash
>   
>   uniq
> diff --git a/test/unittest/providers/rawfbt/tst.synthetic-return.r.p b/test/unittest/providers/rawfbt/tst.synthetic-return.r.p
> deleted file mode 100755
> index 18171f04..00000000
> --- a/test/unittest/providers/rawfbt/tst.synthetic-return.r.p
> +++ /dev/null
> @@ -1,3 +0,0 @@
> -#!/bin/sh
> -
> -uniq
> diff --git a/test/unittest/providers/rawfbt/tst.synthetic-return.r.p b/test/unittest/providers/rawfbt/tst.synthetic-return.r.p
> new file mode 120000
> index 00000000..7ba3ffbb
> --- /dev/null
> +++ b/test/unittest/providers/rawfbt/tst.synthetic-return.r.p
> @@ -0,0 +1 @@
> +tst.synthetic-entry.r.p
> \ No newline at end of file
> diff --git a/test/unittest/ustack/tst.ustack25_pid.r.p b/test/unittest/ustack/tst.ustack25_pid.r.p
> index 6486f7ec..c0110e00 100755
> --- a/test/unittest/ustack/tst.ustack25_pid.r.p
> +++ b/test/unittest/ustack/tst.ustack25_pid.r.p
> @@ -1,4 +1,4 @@
> -#!/bin/sh
> +#!/bin/bash
>   
>   # A pid entry probe places a uprobe on the first instruction of a function.
>   # Unfortunately, this is so early in the function preamble that the function
> diff --git a/test/unittest/vars/tst.ucaller.r.p b/test/unittest/vars/tst.ucaller.r.p
> index 8e03f110..23255a14 100755
> --- a/test/unittest/vars/tst.ucaller.r.p
> +++ b/test/unittest/vars/tst.ucaller.r.p
> @@ -1,4 +1,4 @@
> -#!/bin/sh
> +#!/bin/bash
>   
>   # A pid entry probe places a uprobe on the first instruction of a function.
>   # Unfortunately, this is so early in the function preamble that the function
