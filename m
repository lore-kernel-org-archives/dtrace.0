Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86E5D2DF13C
	for <dtrace@lists.linux.dev>; Mon,  1 Sep 2025 16:50:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756745461; cv=fail; b=mFrj6023cXFRIl9n7KKHvgQN6wU2IWp7bIfVTXNgAJaNhGFrLRwdbpBVDBfN3WhlJM5XnRgmKTqZlCCgDP4iR/DWPzkm4F3dZlY71zncnK9fK1YfptrBzxYPq6kY9PSSZw4nW2TLS/zTavcCdoPkLAfeWLM44z8UejB2n9pUmps=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756745461; c=relaxed/simple;
	bh=uPmucwmCp/sNF01crxUgrKIfNVuxyBneb771Vwu1qvc=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=O6Sz0DrvuT2zdtEoApygvKy+Rs0AShk14fc7kYxjmO4fp48D1OhXlYOg+0JLgA3qnOF//cp8iaGjerIaBAgM86llToIRiBOV7gu5AxUXne7Giqhw1JXgQsSQ/7cg7bNgEaFli3wdJPOLewMgoYbIcKajDGYmHzfn8Zcgcuz8iJE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Hi2c1veW; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=W3U1b0Oz; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Hi2c1veW";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="W3U1b0Oz"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 581FNdBo031742
	for <dtrace@lists.linux.dev>; Mon, 1 Sep 2025 16:50:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=H8n+6UyhW1Ww6/qHY2YccFTn/D+9A4fyeV/siIIVXU4=; b=
	Hi2c1veWwqE29fnmyvTn/+/5t5+yIALZwHNoxMI2ZWNopktr/3O08ZHu3gh50gdw
	sH9URrwDAmyh91s6ISQ/Mq8BnjW34+ULtu/kEy/JsKQtRb+hLOvTsmHCU8GkTZJw
	esiUKcQWTg30APFSaaVJhN/Dgm9Be9mwF2vOz916FH2AaRZeaR1xWeMj4Qn0mdIG
	kuhGftQelEBC2qLPxtxHAvRO9WPUik4B/hTrSd/xcfOQpLm7VxYsKOTljObEtT3c
	HOp86IoPQlB1oJ8sg6qL4Z8cmBKYRbxxmemOV8Tbc4XUWdQdEYU8FoF+yrTnnKnW
	J8KBtDCjTGW1S+qMv0CnJw==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 48usmnaqaf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 01 Sep 2025 16:50:58 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 581F5Xio004127
	for <dtrace@lists.linux.dev>; Mon, 1 Sep 2025 16:50:58 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12on2080.outbound.protection.outlook.com [40.107.244.80])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 48uqr899e4-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 01 Sep 2025 16:50:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A7OFTzkXiNZvFiAz3wDj0EF78GzW253lEb4i9m7cyL5cEI5W3/9V2jtfd1otsrlylArjtptL5XMunEWwhqe2UO3LoBcI6LcsS2vEQB3Dd12cFM/7n6qNsnLhyy+1F3bjdj23R3RfDib1QbRVuNTQtzAWLSft+NBqqBpN1ZP8F7sVhFy2HzekTuQuqveCPS2v5P4J6fKdVvHeiJtCGjw7Y26mqDY8hHfnJeD86NHrVKaUc+7jH8tk5zaSmMBRh4/cF+MsU5HYLoDyVkLwQjMobCeGVtH3yWR9yeVpR6krj6dKEmLATXEyjsqLuSAMALKQ2wd49crP+zb4x1EtLQqECg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H8n+6UyhW1Ww6/qHY2YccFTn/D+9A4fyeV/siIIVXU4=;
 b=B0r4nAZ2jh9Xl35Qh4MAOTMWBblONjuD9XoWKm8gZXJMcxcKmEpoWBm33x4cqtk3Uyng34/TunRrEA3kCx7Sqx4VRjLqOHqsLLeeTn0XjANNObk17jx1Tif57vMEWDDr30nHiWOQxxCJTyvgza8kefB7/87gAqO/+gkhY+49j2ssigpA/ZSsQSrdb7COzD0T96QqeYOJZiNd5OldO1CkJ7fbGu99T/TSWhZKkhnd/YmbkSsH77N0iGFEIcpcuzBzkaSMnP3r4nV2SqLuONtyh1b/cIreJdHCkfAGl+FARI4gPL2Yx6PuqYRC6PczNkLm8AFqBDxAwimTDPXpuL/1ng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H8n+6UyhW1Ww6/qHY2YccFTn/D+9A4fyeV/siIIVXU4=;
 b=W3U1b0OzQINZhe0miFuJjByQwcjzxBMZc8KGgr5U4qvFog0G6bq4lsTe/C+eEGl37nWeszWfzcab2V35WzQ7JpBOdp0IdorhWfBVrMvYZXph5eVFGPmYnAnHU3nFhBRcfQQwQrFPG69AsYRSgUtetGUGZyu7A+Uu4tCgF/T6r6M=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by PH0PR10MB4488.namprd10.prod.outlook.com (2603:10b6:510:35::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.27; Mon, 1 Sep
 2025 16:50:47 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%6]) with mapi id 15.20.9073.026; Mon, 1 Sep 2025
 16:50:46 +0000
Message-ID: <910bd676-8e06-b31b-9142-4bb3c67c2693@oracle.com>
Date: Mon, 1 Sep 2025 12:50:43 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH] version: fix DTrace version string
Content-Language: en-US
To: Elena Zannoni <elena.zannoni@oracle.com>,
        Kris Van Hees <kris.van.hees@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
References: <SJ0PR10MB567255EF643A5D1909C838B4C23AA@SJ0PR10MB5672.namprd10.prod.outlook.com>
 <b316fd19-8d1f-495d-8a9b-94449830a055@oracle.com>
From: Eugene Loh <eugene.loh@oracle.com>
In-Reply-To: <b316fd19-8d1f-495d-8a9b-94449830a055@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PH8P221CA0058.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:510:349::7) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|PH0PR10MB4488:EE_
X-MS-Office365-Filtering-Correlation-Id: 3bdbb0c4-a219-448f-d13b-08dde977b2be
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZHo0bEdqcnhHb2ZpV0k3eVE2R0cwbDQwZ1V1d2kzMFBIZDQzdytpdEpoRU91?=
 =?utf-8?B?Nitldko3QnAzRS9Pd1hVcElaMmw0d0swb0JSMkN1UTV3U0NYR29LdE1rTVhD?=
 =?utf-8?B?a3FHek1RckNoeCs3WUl5ck5oTE8yN3d0ZWcwekRCcGpoRi93MTM5cmt3eVlL?=
 =?utf-8?B?Z25JNEZ4QmtHUUxpQjd2ZExTQ1ZtekZEckM2ak03c2U0dVJNU2N2WHJCYkNC?=
 =?utf-8?B?MWFBU0NFVWErSk1veVlrY3ZyalJZaC9YMUlYQmRubWt6ZFRhZnZwN3lEUFNk?=
 =?utf-8?B?SElnajBrRllKdDU1aE10TlBXWGZxYXRRMlFRbU9tN0RNcHNsUVlucmFJa210?=
 =?utf-8?B?d0pPTVozNFVEY0tkK2p4Mjd4cEJkY3k5MjBWOWhsMWtuVDJweHNnVmYzMlVt?=
 =?utf-8?B?OGlaNzFxdlNmRE1FemZnNHZRSGlEZ1A4SkNyNThDK29wb2Z1NDlRTnBZOUtM?=
 =?utf-8?B?eTBVRHJ5UTEvMVZpNVF3b1QvSjdDeFUwYk1hdm5mSFFCNDBZUVB1NjhlZ0ZE?=
 =?utf-8?B?Qi8vQmNZVW1ZdVBVZ1I2OWdFMm5ZQU9namNpS2F2S1Y2QUR4a2pEdGlzOVh5?=
 =?utf-8?B?NzB2b3BBTk80TGxkWVJVbTV4NktKRDJ4RXQrNjVQL2FUYUw1bjJrQVdnRHI4?=
 =?utf-8?B?NTVHRE40ZkFKM1QxZ3k2Y3o3UHpqL1hjMm9TU3RhbjR1RnZtZVdZZ3hqMkIy?=
 =?utf-8?B?a3ZXZlkrMVUzUEZ6M3hjdFlUZXlhYmdmWitzWGg5SGp0S0hGR01iSExzL3Iz?=
 =?utf-8?B?NFV0Q0U2VUtTcVJJbVB5RU9MbTliK0hjakdZN2N4Z0FLVkVvaFdSemFPTDhE?=
 =?utf-8?B?bmNlVFlXUnpPMXJjTldyMkVMSUtpOCtPSURhcjhzSVViME5yMjRMVXRJTkFU?=
 =?utf-8?B?dHF0Z0NSMFFQK1YrR0FQWWxGS1J4MmpLWkpIZ01vdWVJU0ZNZHh6cU5rMXNO?=
 =?utf-8?B?QWUrNDFDR3ZzdXRsTEhUVDRXMlRRenlNOE1QckVxSzlqdC9JdkIvc1JmS3N0?=
 =?utf-8?B?MmdTanFjRG1lcHZKOUNFSlZwTk5yNWNRdkk2bUMwTGhra0pSbHVEL0FsNHEx?=
 =?utf-8?B?N0ppa2NwVjY4Q1BnaWlURkJaR3pTa0d1TXAyZGdKK1NhcUdIYnZtWXE4RkRJ?=
 =?utf-8?B?dm9lTEJJd3E2Q2hSZHVNc3paZkVCTlA4WVJGdUhXbnVQMVVWREtjMmIvYmlh?=
 =?utf-8?B?czZCOWlJYmY2dHdIWUoyRkp3enZpM082aE9iR2dMSi9xRkl5dW1yMTk2aDJK?=
 =?utf-8?B?STVqYkpoQUdoNUxpZll0dFpSVTgwTWUzRjBLbmFTeWJiUVNha0pNa0JCSFds?=
 =?utf-8?B?WnlzdlN0MXoxUzhHU2dUQjdaODJYMDZPcGUxakZFNFlkelhscnJ2cFlTUHlO?=
 =?utf-8?B?MVh0WUZWdnpQZWh0Z1hZMGhpbHNkMXRDYXZiWHdTa2NsSzJKS1NXZ2NxYXk4?=
 =?utf-8?B?RE13eUxSQUlkTG5QK3NWRCtTMmxZVnFKTUhBNUVEOXhheDNITU5OT0cwNkt2?=
 =?utf-8?B?SGJUbXpZUEJJNHN0NmZDUzdMNzRmeXpYWTZJMjRDUDF4eDVOZWxmWkJZdGxL?=
 =?utf-8?B?RmNZVGZBQUN1clRoU2l5UXplelJrbDhlYmtpcHFVNXlnRVdYNU11RGNmaGtQ?=
 =?utf-8?B?enZMTTVTejJvV1JQVTJuWFJDdW8yUzloSlhacWtWMlh3UmI5VWFmaTZtR2Fa?=
 =?utf-8?B?RU5HRjVTTUIwenhQcmsrMVJEUVg2bDF4T1BuSHdxemlzYkkxQTdzbU1FdTh2?=
 =?utf-8?B?NVpCYjdEUXZnVUFtU0p5djlIdG5qVmN1OVdGM2tUQzlpb1dxcXhuWTdGL3c1?=
 =?utf-8?B?M1k3NTdCclhEb2tWQUtYUWRUNXE2aUFITSs1ZU1kT3ZKMWlKV01rV0xGM2tQ?=
 =?utf-8?B?VVg4SFlkS3pSMHZWM3hnaHYxbXdTbndNaGdPQ1VRcTlBT0p6azljWTdPTWtS?=
 =?utf-8?Q?aQDfzgyJa0E=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?K2JmbnErZEJoRjFGMW0rY2MxMlNWWU5vSUhHR1NGcGs4VFF5b2hPdExET1lx?=
 =?utf-8?B?a21KbCtuaEpjSlVkc0F5dzhvRlJTTnpFejVvOENybkNRMW5xQ3lXZjVRdnAv?=
 =?utf-8?B?RFd3UCtvd2pwbFVlclA5a0RKNUhuZnptV00rUjhpSWM1MCtZUzk0ZCtSM0tt?=
 =?utf-8?B?SXJBTTF4TTg4M21WMUZuUFlqOXJlM0RHUytPdHJ5cFhSZkRySWx0VHZQL1da?=
 =?utf-8?B?N05CNVEvNlBaVkQvM3d5UTBmYmdpQzlISEl1SnF5ZWlETFp5cjRrc1V5ZEZk?=
 =?utf-8?B?WmdNWCt4bWxOVGtESTVBaTdVLzZzWjAvay9LL2pncGpEN2cwZm00SnVxVldr?=
 =?utf-8?B?L1p0L1RUdnVTbC9KRlhiRkphUklZeHFZd3FkbE81dHhrRHhJMEp0NkFpeVRF?=
 =?utf-8?B?UXpvSHFEbDFpVktlNlRoQTFWSG1vYmJSR2l4NEF3OHhLcnoraUZEVmdrYlZX?=
 =?utf-8?B?UzFCUGFEVlY0RmpQNGxqVkdzRnZKMWFGWkZBeUVoMTY0aTdiWWFNTGZsU2FL?=
 =?utf-8?B?U2k5ZmZwazFPSWZvaWdqRlNuRE1Ed0ZyQUxwMENQeXZxbkszaEMvU0EvejNW?=
 =?utf-8?B?UnkyaTNRSTM3dEl3OGx3cWY4ZDNBaERQdnIyU0VEOU9CY05XRml4dGw5RzRa?=
 =?utf-8?B?enpOYlZkVGFhaGt5T3doS081NW90bG5vYXBzMjN6WVU2R2lheHhXUlM5WGFv?=
 =?utf-8?B?cFlheVFBVkxSNzJYV01naTdpaGJVN2lTbDJic1Nwc1A0OXVTTDRrdkJ3aEp3?=
 =?utf-8?B?bEpVd2Vha1c0eHVFWVFObXBoQ0RuRkUveHV1dllTdW1seGJDSHFHY2dSTjZn?=
 =?utf-8?B?UFpMQXpjYmZhRmpDYVh6MXJnVkZRSXk1QTBoNDVwTlE0N0JzYlVHQnIzM0RW?=
 =?utf-8?B?VWxMRjE5WWYrd1NzUlhjT2Y5d0ZpQ2RBRXYxV1NORUVQUnZSQ1lscE1vUVJL?=
 =?utf-8?B?RzhVcDRqaU5iOWNqRkgvVnhhR0xMc3RiM0xtOUFoR3JQL25XWTVTNVpTTWRa?=
 =?utf-8?B?Q1REeE9nNkgvd1lUMzVwU3BaV3o4NVVVOFZ1WEZXRUhIN0p0NDdiWFo1MDhC?=
 =?utf-8?B?dmdEdm5mTFRzTk95dm1mR1ZvUFlhY00wbDhsUis2bTBpSlVtbzFmaGtoL3E3?=
 =?utf-8?B?UitETnZnWVdzbUJOc05FMU5PVUsrT0ducTM1UFBOMmRLMnJYT0hvTWYwMXFX?=
 =?utf-8?B?bHVDTlJPOFlNdFE0OGJWcnQvNGhXTW5sY3RwQk9uNDh4NXhDVUhIVVB6TENl?=
 =?utf-8?B?cDlPUEVybVd5djlmcHQwYVNFT1VTNEpneHdpZ3JoMEZ3a3JEbEthdmo0b3Jy?=
 =?utf-8?B?VjJhTDJVejlKajVaVVFtVlhDb2tYdHVSWWpOay84cWY2SW9Va3VaME5kaU9G?=
 =?utf-8?B?UFZienNtWnBhaGZyUnJZUjMvZlRNNlJxU0wzRmlzaUlkSmQyWmloSXhtR3pt?=
 =?utf-8?B?TWVzQk9IbDByYjBhUnU3WW0xTUt6QUtzYmFCcEF5SnBaUGlvbU95Z3Y4TmEw?=
 =?utf-8?B?UjJqNll1Q2lMZkd4TjROK3d3cm04OUJVR0gvZExqM3lRazZnMVorb0dIT2xP?=
 =?utf-8?B?eElFQkJlZ0RaNTlET0xBcmVWWEhHM20wVmk3K0d0ZDM5dmlRbmpPeHl6amF0?=
 =?utf-8?B?YXJpWjBZZUZEZUVqMEkvVXpQaWMycGFnbFhPR2J2Mms5elUya1pLWGxnRTFQ?=
 =?utf-8?B?cnlUT3VBOUhENVdhOHgwajlHUHc1WTZEY2laMXRmQ0hPRERCRUFoajZQVk1C?=
 =?utf-8?B?Y3kxdUJXSGUzOEgwTzMza1VSWlZPRXZ3ck1Da3VTdkJtaGdGN29kcGE1L2wy?=
 =?utf-8?B?UFBnZVFKWWJZc0E4SHhlVTRxeUlUYXVUejl6K2YrWFJGYzh6dW9MKzJneFY3?=
 =?utf-8?B?K3BFMThmbWE3UytNNzlpVDk1dFlXSUNKbnFXRXd2Y0J2SENPUG5xRkpIeVNr?=
 =?utf-8?B?Q09QZTBZZ3JWM2dyNXRwL1M3VWtwWml2YVRQSGpjUGdoalBlRkFLaHpDNzRz?=
 =?utf-8?B?Q1lOSnozYTRXTGxTYjA2czhlT3Vod3dHK2wydC9yc2ZmbUU2M2ZYd3B5aVA4?=
 =?utf-8?B?UENKWE8vUXFJWmlMZXd6a0Y2WUkwVUVjNmRxY0tIamo2NGx5aXJZcVV1aFhM?=
 =?utf-8?Q?oxcQz+d5DtV6newtpeWjZ279/?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	DtrDzb0WQAQonNMCmNtOflMM8VtmujulvwT2//ElbikSCVfOGHI6nV+0yAPAlSWSdNAwYmDSQeNXoibIepKG5eTZa5Q60PelBRgxYPg1DAa68Iivn6kJUj9H//RNFVggIgAoAPE3dHxxEhSxTzTRvjfIsQ6jwVUAIlHEGB8Bsjq1nZrUwQpwCq2prsZ09lDT9mIuZ7yOaS+PyZwyORyjXhpjB7uEgBceokVz4A90U0QLUl1pQl1XvTANRHPfyZwOxPgkogYLnzKjTr0A/yZd+EAIguzzrLXvH9+Pt4GZjeg6a0b5mDSgPcFDADQd4OA+YCvB26v0CTgsUixbmlxVs6I76dKP/ZswcoVDbQNoz6eMYP5MStPZLkfW+tyUOx+9UYlnjteX82nk791rgjuxXkTkogSgfXc1yBGPmkUSphMXRXCPMFVxPHi3o5rVWOEWmYUXa5Y80ts77I9yUXLhKaT6jCeU+0XnhTcKHHNKQL1LpvFV+GxaWc/YgyVCtGEYmCxJo4uNOLpmiFsKSVFHBrNiV60+ACTz6S8NE0hOHLPn/PINYaZFnzExWNSpi2PlAfwThN6h1tPE/Cwsu96eB5EA5OI2aDAR9OaOLzhZkew=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3bdbb0c4-a219-448f-d13b-08dde977b2be
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2025 16:50:46.8126
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZYYu6eaM7I1YfYQ4DHS/OldrZi4+3zLbBp3T4lzNUMw5KUJ2xyFQAURknf1EbMy0ZoLuDUa76rjCixVJTNHCoQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB4488
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-01_06,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 adultscore=0
 suspectscore=0 mlxlogscore=999 spamscore=0 bulkscore=0 mlxscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2508110000 definitions=main-2509010177
X-Authority-Analysis: v=2.4 cv=D8xHKuRj c=1 sm=1 tr=0 ts=68b5cef2 b=1 cx=c_pps
 a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=viDEXNKlutdU3rGqUcUA:9
 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: anXEownvLPfk68BcOgtKXwLsssdbuYtT
X-Proofpoint-ORIG-GUID: anXEownvLPfk68BcOgtKXwLsssdbuYtT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAzMiBTYWx0ZWRfX+ryqsx0llkDV
 eiEQFLHIYBp3qFwcFbe36m2HQnlxLFbOmyiTUm8kXB8RV/82TSoxc5UYhfLBRAze7Y0Jk6Fn7cQ
 09CJRs8NwRhipawoVTkadyUsg7+MVyrfl2JshGBdBdKn7qH16xggQleWSmplyO+I5CMyh78ci3O
 keLeuIA9k/aXDu0joQYldvxerRU/44bekX2bNGz+C1Ove12Ky6JGoXAtfrCR/3kJZCmysdZsE6c
 F+maYSAhZTld8vY9AnnvcZ87An4ehv/YSltoNUmpApoRZn0sWNXm05FgHnTwDAuW1M8kWQb2zDL
 yxpsrh/xocrIckDPqjVAhQ0wuy93X57OmEHrXnFk4GWpIrPXCpSlILNs+CqCkEU1JJ1ivooIF67
 tU9OTcQ4

But this patch fails testing.

test/unittest/dtrace-util/tst.APIVersion.d
Diff against expected:
-dtrace: Oracle D x.y.z
+dtrace: D x.y.z

On 8/29/25 15:44, Elena Zannoni wrote:
> Reviewed-by: Elena Zannoni <elena.zannoni@oracle.com>
>
> On 8/29/25 12:45 PM, Kris Van Hees wrote:
>> Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
>>
>> diff --git a/libdtrace/mkvers b/libdtrace/mkvers
>>   	if ($3 == 0) {
>>   		printf "\n#define DT_VERS_LATEST\tDT_VERS_%d_%d\n", $1, $2;
>> -		printf "#define DT_VERS_STRING\t\"Oracle D %d.%d\"\n", $1, $2;
>> +		printf "#define DT_VERS_STRING\t\"D %d.%d\"\n", $1, $2;
>>   	} else {
>>   		printf "\n#define DT_VERS_LATEST\tDT_VERS_%d_%d_%d\n", $1, $2, $3;
>> -		printf "#define DT_VERS_STRING\t\"Oracle D %d.%d.%d\"\n", $1, $2, $3;
>> +		printf "#define DT_VERS_STRING\t\"D %d.%d.%d\"\n", $1, $2, $3;
>>   	}
