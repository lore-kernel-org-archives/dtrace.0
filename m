Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 829DF1B3740
	for <dtrace@lists.linux.dev>; Thu,  1 Aug 2024 17:43:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722534201; cv=fail; b=a7Y+qEI1fFneHBEEMCiObh/zZJEvRt0098lJUhDN60WahNQSoAiTyGyjaLu8g2NkDgsAL7d/cuvsxTyMcRF3Q9p+D7+K0pXE/9/iuoRH5Sr24YXubijD5iToigqMnJ0Fc/a8RT/lknZLd1VPF7UmVg7DU91SKWpKqR6l4/xGE9I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722534201; c=relaxed/simple;
	bh=VQl1+Al8qytGTS6VXrxdjPE1bvIhQEkdjob5d0UsLu4=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=qgwpzLwx2VtrOXgDkro5krBq3lxvRWKc9XzRVRCmHdRE7BRdVM6M2Fc74ZNAgGaoyqntdX9XCfcW6LzQPGuVMi+EQyIfHrRBM46ILSE5aEuhNutGPr+FnBkXu5bgnf6LehHklnnK0XJEunKMTkmwEwZYe2RawoE6xAwgUE9/ni4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=dmQgpvp/; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=j82auDn/; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="dmQgpvp/";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="j82auDn/"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 471H0i9D022230
	for <dtrace@lists.linux.dev>; Thu, 1 Aug 2024 17:43:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	message-id:date:subject:to:references:from:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=
	corp-2023-11-20; bh=dzI1O0OOj/IXS62C3pomvERBq5n26Yf1lA5XjYVb1m8=; b=
	dmQgpvp/lwcuosB/IFW+XLpHyMw6oO5DRtkeXgwEsI1W3WkW0KH4HXrSuskVYmGm
	6l07limKyAqNHJvaUUjmQnOyyRWRIcFrnunxht1xbGBhIuO4uSYTjh9P+a1cMWqD
	5iL1VR4SIeMNHaKc3XRSoVA0oh6coug4NiBtF519RiIlQwUBrIC3zcOdB/Q830Rg
	AeGfX/prRyShNgy1hLHT0nt/obhY9wHO3cq3KwCoMWSIvU56yPRFP1dlmtZFupMS
	EvKIaohe6AtcPE6HyMM+nvtHejLefW4kNUaBL47KFuH6zO80BZ7uUlXDD2JEsV/Q
	SaiZVIT+y4X9Jk9Ob+1hfA==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 40mrxc2f5d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 01 Aug 2024 17:43:18 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 471HJske019046
	for <dtrace@lists.linux.dev>; Thu, 1 Aug 2024 17:43:17 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2169.outbound.protection.outlook.com [104.47.59.169])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 40qjmtyctb-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 01 Aug 2024 17:43:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bgkx+NG3ckLi9SjeaMfznyTiXbMyC9KCrCvBzcjlJgfF0OHJW7VqxDS723xZ7J3nkJ3gpgGwRRaN9cAAaHUu9KSU3tdwOYVPs8SSPhj8nmDpfIkSDXdUhSB2KCwsnhjty4nsvYfW1J3ywE/d9obbkvjKet6TmJWtE+rtEZ65kT3Ut98akGXCSka5uovdBbDdmcQc579lA5IIPpl0k+iRXaSZSyXRp4OqgHEXVse/Eib5tlwvHRs9MbN9eNsFTJ1L/ocNopAQ9gzuAEkPtfS1ubbNem/o6eUGK88xIM/WbcvE42r3c3Jux50lg0cR/SCtH6TCVLL+fVQIghIB6lykrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dzI1O0OOj/IXS62C3pomvERBq5n26Yf1lA5XjYVb1m8=;
 b=Gn9B+mQlrgieuqLg836J2h8+Dp/XxKRGp2xzQTk/HmsHoR7xvn/+kPvcp66Of7taCXwVJVYlPY64vsUW5LxdoXiIJ7D4bXd8q3XHr/ISqvzh9ljliKpu2SzRCIpYjNapCKzZ+T1VThonBSFUJGMm+9c4hpjDqo0qUvYNqaAjBDW95SnkljhWjpAr3jWPvSEim1FPd1/OA6jqNgyX/IuWby0aEVcysP48/hvd1OfJ1HOUDg3FtFOKdPmA043kX+iafsnBRA38Sm342HAWLi4M6p+D25gtMfzM2nu1pvBmPnCEQkInrlrg1tPpV0TJaI4KwibbzPXh2OBvGzVvuUb00A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dzI1O0OOj/IXS62C3pomvERBq5n26Yf1lA5XjYVb1m8=;
 b=j82auDn/299JUk0Iwb+SP5fiCf82IxlJ8t5eRSaXsSqSNEocSkxlWwEvVjyh0VcIzbFOa1RqW0iN0U3WPzj85OW/xiKln2jFUBuMr2MpET/60pEN5jmSMwFcclretlBl54kDK7q2ei1FXjXoo6pOheUn4qeXS/XIde9i7wGG+0w=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by SN7PR10MB6475.namprd10.prod.outlook.com (2603:10b6:806:2a2::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.27; Thu, 1 Aug
 2024 17:42:48 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%5]) with mapi id 15.20.7828.023; Thu, 1 Aug 2024
 17:42:47 +0000
Message-ID: <7592c103-a6ab-d0f5-b85e-027a15f41c93@oracle.com>
Date: Thu, 1 Aug 2024 13:42:46 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH] test: Fix access to kernel variable
Content-Language: en-US
To: Kris Van Hees <kris.van.hees@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
References: <SN7PR10MB6287C0DD69CED888C1ABEB80C2B22@SN7PR10MB6287.namprd10.prod.outlook.com>
From: Eugene Loh <eugene.loh@oracle.com>
In-Reply-To: <SN7PR10MB6287C0DD69CED888C1ABEB80C2B22@SN7PR10MB6287.namprd10.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0243.namprd03.prod.outlook.com
 (2603:10b6:a03:3a0::8) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|SN7PR10MB6475:EE_
X-MS-Office365-Filtering-Correlation-Id: 732e7aa7-ae31-4aab-5f66-08dcb2515b8c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Y29WcElPb0xnM2FNMU5Gb1l1ZytFd1R1M0I5WUEwNXZlUUlhKzdjUEhSOVRr?=
 =?utf-8?B?VktiblR3dys2c2NBbGY3SVNrLzFMUmVOditsZklWRjR6ay9uRTFFamNZL3pU?=
 =?utf-8?B?TXlQYVY4TVRLelJUdytBOGpUd1pEVTFmam9VSjdSUXdWQWgvTkw3aXBpbm5X?=
 =?utf-8?B?WHI2QlF1OHI2bmpzdTlET3RBRjUyZmlIVWZyYkFqNm9EejFsbWd3V2JRT25B?=
 =?utf-8?B?R0QwcmpLNXdUK3FleHFIQTc4b1hGNmRWQ3h3QXpsemtYUFVqYWl3alo1Sy9m?=
 =?utf-8?B?TWJ1eG9Tc1hsZ1dya2h0d2EzTUtWOEhLMzYxUjEyTFZ5blplRW5KYmFiaWVs?=
 =?utf-8?B?ZzhVUnExYU9iZU43NXMwRm5CZDRmVE9WTUwydWpDYnhCZHB5S1pPNUE4WlZm?=
 =?utf-8?B?T0dNejVHNllJMjBjQWRVc0tabEVSeEtCanJYNVg0WkhYNGJuSGFXbHVycG8r?=
 =?utf-8?B?TDdreHhrUnNQNFRhcVJqQXB2amYwWHVtbnlmVzRRNzdOVktReUZiQkNCMnpl?=
 =?utf-8?B?cU5XV0t6NkQ5a0szWDZYSHQwUUd5WkFoT3YvdjM1Tk5BOWtlVjRhR2x1ZklS?=
 =?utf-8?B?WmtQMmt5K0I1aEJ1dTR2S1FIWkVoT0ZRWmd1WmNyZ0NpanB5eWhWZEpFMUF1?=
 =?utf-8?B?amhDQnZQVTZRNnQ0TFNKbWt5QUFMQlhPQ3M1YUtZZkhpUi9CK2ltUTYwZkwv?=
 =?utf-8?B?ZzIxeDZFV3U0cDJQTEtzOHliOWZNeW5BMUI5ekZVMm1mUTNNckZyRU5BT0Vr?=
 =?utf-8?B?bmIrTlZBeS9VNmtVbEsxa0w1b3lsY0t6aVc4dXMzK0piZGNSODhmTTU4SEpS?=
 =?utf-8?B?cDRUdDZyazRCUENWQTM3TWtJU0tCQ2diSVZBMFBaVGhVQk1zdjdSVWJsYzRp?=
 =?utf-8?B?NGdMU1d1aU9wT1BrYmhQUGdSbXNjb2lzbjdaVmlObUQ0K21hNTlMRENWR0RR?=
 =?utf-8?B?RGk3V1l2VFhJRklIQXNoaDNVaUJGSGRic1JreUNrbmRlL0RIeGxucFdxWXlB?=
 =?utf-8?B?SlZiSU9QWkZRU2xKc2pOaS9jMmJxaWNCNkZLYWkyVW1iZmk2cVF5SWFKb1Z6?=
 =?utf-8?B?L0RtRFFZSFZuSVpGbVB5bEJPS3I5K01UMUVOSFlhODZSMGI1Mm5nYWhpZFRD?=
 =?utf-8?B?Mzl4amRYLzR0ZU1Jc1o2OUtsQmtCZHh4MEl5ejlKL1RHSE1GaXd2NVczYzZp?=
 =?utf-8?B?V21TM2FsczBGdWNqVHJnUXRXSzVYSEpiZ0s5RUppTWwwTXNkTno0K3NCVDJn?=
 =?utf-8?B?S1U5S2ljYXltZzArRDhvUUM0c0g4R0wwNm80VkkrUTVrVVRGTnVwUFB4ODBE?=
 =?utf-8?B?NE42TnZQclRSVWNSVVRyQXc0L1dGZFdQNHIyN3JQQnlTd1ROMEZZbENDYWFh?=
 =?utf-8?B?TmNuNmRWemRnLzJDVmhkdjg5SjlUc1VNYnhnOEt2cTVrNm8yN1hiaUEzTzZt?=
 =?utf-8?B?VzNMZ1VDMWFpdlBrWjVUZ1hsWDZFbDJzOGhmLyttQUJtSEwvVjJCdVRoeXFO?=
 =?utf-8?B?NkFPN3dhL2p2Q29IZXUzV0EySWNscHN4Z01sSFVGWlYzKzlkZFBZdVBMSHVr?=
 =?utf-8?B?NTZBY1ZrWDNOa1NHaG92MURoRm9OMGxVUTZqcVVvWTBIeE5DdE5DMUxad29C?=
 =?utf-8?B?VFhxTnhYQmRUTHNaTDYwUlVNZFhEV2UxQmFSNnVOaHFaVnZPMS9DMDFyQnd0?=
 =?utf-8?B?TDFjTEZLYitaK1MwN0U1cmlaZmt1ekQ4alI3VmtJcVdCd3RzZmp5RHBhRExC?=
 =?utf-8?B?blJkYmJhUk1ua2JHdXJ3Q0xYSmVFWE5JWDA5MEx2TjRPclAxS1lxNTA0bFFB?=
 =?utf-8?B?cTZoeHlTdVZ0VlhNMDJpUT09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aDVpSHFnQjlidUlkYWZZbHRhVUUxTGlwcDNPd1RvT1pQamMvSUFsamJtMEU0?=
 =?utf-8?B?YndoQWFucitnUmVmbkF3d0xDenp1OWJjejFycEtKNkdMTklhSjNMQjA2cmI4?=
 =?utf-8?B?OEhXV2Eza2p5amlBUzZycGJ5ek83eENKTkxYMDNOcUx2cWpkdnBRV3YxdE93?=
 =?utf-8?B?RkFxM1ZEd2V6cVA1aE8yanJoZzg1V3dhUG81WDN4TEwzcjFPa0IvWnROM3RN?=
 =?utf-8?B?Z0RGMUVJci9wc1E2aUhFZ1U0Ty9UR3JVRDltWmhHNUZqYlA5djhmRm1UQnBJ?=
 =?utf-8?B?bzlMQnh3U3ZTblRLeWM4NzdVMDBPSFdIOVFjMFVKQjQwTE5VQUYrazVqcTRU?=
 =?utf-8?B?VGxPK25uKytpNVVURkZ2bm8rU2JuejBkT211MkpoZEM1TDBNeFVPUUJiTzY4?=
 =?utf-8?B?VE1MOHM0ZVZjSzJPa1g3NnZUcnQ0ajBQd2Ura09JeVl0bG5IMTgreDQ5UGdU?=
 =?utf-8?B?Y2N3amhTaVBXam00SlpjeXNUN2cyV3FNT1JHNGJaNnNuaWVOUjI5djBpd2Qz?=
 =?utf-8?B?VWlXNjJLaG5FRmhSNXB0YUdiWWtHYW01eTlELzNtNVVaNFpoY0c2Q2JQenRP?=
 =?utf-8?B?cWV5RXJCM29DcGdtc2RSeW5FTkhMTUJ3MEJQakJWblFSTFBwTCtkbVJxamxq?=
 =?utf-8?B?WEhaVFYydTlzSW5obnJSRGNlc3U5YVVnNlhTSUVEZE5xTml6Tm5QbEp2OXRY?=
 =?utf-8?B?Tk1uaGZTMlpOSlp1OVM0eTZ5bkg0NWNQNDZqek5TNUFmbm5veWdUbjZzMm1N?=
 =?utf-8?B?TTFMTlNZY2NYWU5jTjRveHdKMDd6dXhCRTZKQmlQTTNWajhQb1NzcS8wMC9F?=
 =?utf-8?B?aWxvTmh5WjFsaXRmYXJ0T1Z5S1Z6MFRYTWtucDRmeHlQN3RsM3k0dStoeVhU?=
 =?utf-8?B?Z1lka0o5MGZtUHVqTDZmWXluQWk4L09XQU1HTG1taW96eUI3ZHdnNEE3Rmts?=
 =?utf-8?B?aUFPTEVrTmJKSjNRekhRSEdaS1Y5bzlxN0JDcXBKZmlMQ3pSTE9ZWElnRDE1?=
 =?utf-8?B?UU0yTTVlV1B6bERpMkFGRUw5ZVZISm5DOTJuc21TaEdIOVZFdVdQeVYwQlVa?=
 =?utf-8?B?RzBRSVhvZGRtM3NodVdCZzFCdklVUU94L1Z6KythaU5sWllRejlNNWlwUXha?=
 =?utf-8?B?dDBMY1ZRZ3JURzhoQUpneU1Za0VDb3l1ZGpiVWpMUHdGUEtPUWNlbWV3dDVK?=
 =?utf-8?B?aW9JYm11NDd5UlM2Qkh2Y1QzZDFYYnQxWmlXM29NMHY5aU9BUDlrRk5TL1g4?=
 =?utf-8?B?bnVSYUVXeDJnRElzcUFROUpIWXZKd1RlN2RZYWxiWk9kSkJmdmhoOGJZSTB4?=
 =?utf-8?B?ZmIwQ0JCeFhGa1Z4SHdxTklhU2Vuc0llUEFZTVhuT0JPMzIyOStlYlhFa3dx?=
 =?utf-8?B?ampZTzFhekxiNko4cHV5SkczVExhUTZuM2hyLzJGL0p1NTNVTFZtK1NVaTdO?=
 =?utf-8?B?MXRpdU81cS9qTW9GNnNjRUU4S1NuYUdib2l0bmR6dDVFL1VDa3lBNUlPQzdE?=
 =?utf-8?B?WWtlamdXMEJkdTFIWUpyTm5VSE1sSTgxTDcwWE9ibFE0OFVnekF0elVDb2lG?=
 =?utf-8?B?dlV5dlZJVFU1aGZkZ2dOSFV4d0ttY09xQ0NsQ0JFUjdPQWJ0NnF6UnB5V2U4?=
 =?utf-8?B?MkdEWFdybkh5Yi9VZ0QyZVNTT3lUYWZwNUdTenN2ZzZoTGkxOUpFZWZXYTVI?=
 =?utf-8?B?eWYzZmhqQUM0R3EwNVRpZFpmekVlR1ZWdGtuUk5VejduVjVaZkZEWWRRYWNv?=
 =?utf-8?B?THpKTkV4d0l5TnFLQXNKSGtBNEZFaXY4aEFLY0pwbFVhd0JMSEVPY0N5aDRw?=
 =?utf-8?B?YTVzZWdOMjhSUDZxR3dEODAzZkdtVE0xUGt2NDZqQ2ZzVzN1SXpyVStVWWpW?=
 =?utf-8?B?RFY5d25JaTVFT0ZVSmx2VVFrd25ZM0llSndqNnVyMm9jby8rMnZaZG02eWJ6?=
 =?utf-8?B?aDN4aEpTaUJlQUpPUGQ3NUhvSEtIbnNLcERXZThUdFN3V1RKVGpxMzM1NmYr?=
 =?utf-8?B?VDAvem9XdjhxVk9lTkpRVDFYV3RXTG9tNnpCRFQzbzNmcVdibVhGN0NqWVR6?=
 =?utf-8?B?SzVaVkR1L053Wi9yZFMyNnovQ1FPWThuOElLaVlsYXpMQm5YalFVeEpCTEIx?=
 =?utf-8?Q?5081/Ug6tRC09bO7jw4gkNwI+?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	Z7q/G6vZf82wUE3ZP6tS1lmjraitn8SMUf7fqzVERThs9p7ZM/NDvDfTXedhbzWvYt8TQKdVKMqBs+YHH21QmgzH7ONGzfQQIUm+YNKV29sjuoBh+K+T4+xBWRQ/AlwjD6B2YrIKuzo663/L/sGR20tzgo7I5cdtHAuxJPmhh4l1wuQ5SVov1s8oeuVcKf2x18DjnmaaZtZ0HNNsUADkh/zUzwM9FeM1gVpS56+rTcUJ+Tk1qjfpqnE+BEv+pD/2lvJur+2zLLk0BkfYs2LxzFA1vhAFoeXsZ3zT5iVuQ4S2Jm8tX1k1sc1zWqEw7LS+8LnY2vAmW/KfiL1qe1oEBaQd+Hjdamt9AX9+bwfs6mqK3GY22/Dm2F3nW4OKZe8RbZAOdlymLVWbazo7ka0Ar8JpXu53YRBsryuQgkKeT3+NsI/eigmzU6nzQ7dOpghLMl2ZM2+digDdQEOBolDfVhGgjS4uD/7bMoECNDacVFtkHUPStfTI2XMJ8sOrTeCyRxoEfzW3QmM7bGQXlRsnO3rAqplWwexzlxLZ7mtq/sHScGVfTbmYD1qBXCO0DI5IWT8gvDl2BLp48+P6PbXwqFVGJoQvEEDiZb7c2CJu52Q=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 732e7aa7-ae31-4aab-5f66-08dcb2515b8c
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2024 17:42:47.9455
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9XtAKAFyCJdgDftomkzXT2+02vH0ivSglkq1mZRxiSWzQgG7eb68lyzgZwFLcUjGXC6GgJ75C3jiElm3oX6O3g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR10MB6475
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-01_16,2024-08-01_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 malwarescore=0
 suspectscore=0 mlxlogscore=999 phishscore=0 spamscore=0 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2407110000 definitions=main-2408010117
X-Proofpoint-GUID: -o7Z-BhNm2wYHfeq5ZgVjzC7fsASj_Iw
X-Proofpoint-ORIG-GUID: -o7Z-BhNm2wYHfeq5ZgVjzC7fsASj_Iw

Reviewed-by: Eugene Loh <eugene.loh@oracle.com>

On 8/1/24 12:54, Kris Van Hees wrote:
> On systems with kernels that do not provide CTF, access to some kernel
> variables requires an explicit &-operator.
>
> Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
> ---
>   test/unittest/funcs/tst.inet_ntoa_nonDPTR.d | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/test/unittest/funcs/tst.inet_ntoa_nonDPTR.d b/test/unittest/funcs/tst.inet_ntoa_nonDPTR.d
> index c2e5f59a..500c53e8 100644
> --- a/test/unittest/funcs/tst.inet_ntoa_nonDPTR.d
> +++ b/test/unittest/funcs/tst.inet_ntoa_nonDPTR.d
> @@ -1,6 +1,6 @@
>   /*
>    * Oracle Linux DTrace.
> - * Copyright (c) 2022, 2023, Oracle and/or its affiliates. All rights reserved.
> + * Copyright (c) 2022, 2024, Oracle and/or its affiliates. All rights reserved.
>    * Licensed under the Universal Permissive License v 1.0 as shown at
>    * http://oss.oracle.com/licenses/upl.
>    */
> @@ -11,7 +11,7 @@
>   BEGIN
>   {
>   	/* "Linu" will be 76.105.110.117 */
> -	printf("%s\n", inet_ntoa((ipaddr_t *)`linux_banner));
> +	printf("%s\n", inet_ntoa((ipaddr_t *)&`linux_banner));
>   	exit(0);
>   }
>   
