Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E99D057CB1
	for <dtrace@lists.linux.dev>; Thu, 18 Jul 2024 22:36:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721342218; cv=fail; b=k8mLmFPvbVxBCxslWwkm0BymdoOt1NX+ypMNCb6LKDc8RHuAURIWmqsR512yfE8KfdENPjDdfCvUUkFZ5BM9irqInoyzJKsvYbwi8uR2wQCtqBIAZyRid3nLruuYXORcXcuhs7Eep1v2xzxqZ6FBRaw/y1n9XLgMjQbDh6zW1/Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721342218; c=relaxed/simple;
	bh=ZHcZihDHKcPmTGkPXr3kfJ2LHLjd5SvvFmsmaTkYmD4=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=jss1TAuTQJ01EwIktvlL4yxxdGbb/JTE/zb5/x3D+iGikliU7/0RX91R2dvt9Yy08rE/ST782xOZOsP3Z8EvWUVmR148Esz8UA9Q+HTP1De8XNC1JUsz2Rs8FTU18Z42+yLT4Gf1BNfzPzChMr/Y7xclTBmNIVZRgLOWrtwIa1w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=gKKrhRDT; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=KgX1TVpv; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="gKKrhRDT";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="KgX1TVpv"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46IMarnJ009512
	for <dtrace@lists.linux.dev>; Thu, 18 Jul 2024 22:36:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	message-id:date:subject:to:references:from:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=
	corp-2023-11-20; bh=Y7FpSy04QxVd6hMyX5qbmVOG7o097UXKlsoaqszEs8I=; b=
	gKKrhRDTNrHPnzS3X3QCmZMGRqtq6lfUIPR3e9JM/gH7tQVHrrkVyT0gruIaPcoc
	Jf468kylu2pu7bXis1h277bXgoom6Hr9aBSfqEcvdIVFuzu2aPGoJnjCXJ9Wq/ZO
	db/1sbxDLBFGPQnHRDp2BVD9WGL3fTiE+H6ZyJ5r1/WkZuoIPDCLCTn9g4MxiuY3
	2NKb/k6SEycyfYUXnQ2gE7DnWhP3EhxMNOzoTIrd0+dmcwaZb4NC1ugatEoiQQ2E
	j8IP8Zhk2FI+8ALlUId+bwdAKE3GHnomLwcaOq9Z5m0Uc3oDEhjJ7EKko7RqIB0n
	M7LeLiqiIGOQO4zAoIK/JA==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 40fbyp801f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 18 Jul 2024 22:36:55 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 46ILEiq6039623
	for <dtrace@lists.linux.dev>; Thu, 18 Jul 2024 22:36:55 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2100.outbound.protection.outlook.com [104.47.58.100])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 40dwewydq9-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 18 Jul 2024 22:36:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j03HV9lYjLDMiPoFaZCqg7bcqPVgqzKC29wTj3HilrZCskSkBKtgEWpC2gtQ9wQE40i4aDAGAUQA7+UcmzYwclVx7TSu3xm3E9lAxErG7m2F/RGS4bR/Wjog8pJJhGbCCa0yxkitMNjhABrllCmPchKpneUJ/6U/BkCxVDAgSXjS0BPVvCprlXNxqVQZXQ+fN08AIp5zWvEcIFM50k7P22zFyKjpE+Q8wR9lKS6ds/76CHjbnYhqjE3BBaE62mXoS3NQUVSGLO2taGBfFW5JAQHhF+scIxVQtKwvutLF+nF5KwX1UyLawWqO0aXiKRyXuiC6Rsn1WCpodsW4MIglcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y7FpSy04QxVd6hMyX5qbmVOG7o097UXKlsoaqszEs8I=;
 b=HAcdu6eDCQAioT4RU77eOEwheROlx7KlKtMK0qYzqefP+c3T06ra28rEYpC4/YOywl5pE0J1sbTo+mmfRNK0GWV0x/Ez0IcD/9Y/u4BFXqVdaptg67GNlkWr6PJ4sjf96cPqRHusTLhL9s9D7L7XYfXMdt6mhqfP02bWOX3R6YarvrkuMsJkjQnEvaTWo0OHpOUonQ2TeGKB1G5Mv8noNtPxHxiHslvO1gx79djUD7GEXo5u+qV4yl2iL/SBzgMH1azGEyGBwIBXCXkVOgquqhXDIBj+JD1o8mV8KQH1dbXvw9u+ou5Gw2JjUlCCB/ylylFZOetkYPD2+TJkoTOpcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y7FpSy04QxVd6hMyX5qbmVOG7o097UXKlsoaqszEs8I=;
 b=KgX1TVpvah80L56Selsu4jSGmjBtP8CyqVzoNDzoGbQxX/HK2y+kyvCfjAuMihePF4rn473ELzMw2DWkhOylUChuxNRwJ+ettpk3YgKsKjbee9mmfoEzs5iMmkw3MjLQdGe90lqHQQ8965YGYKPAJV8EHMOX+bejnhLVGXxi/Ng=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by CO1PR10MB4723.namprd10.prod.outlook.com (2603:10b6:303:9c::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.16; Thu, 18 Jul
 2024 22:36:51 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%5]) with mapi id 15.20.7784.016; Thu, 18 Jul 2024
 22:36:49 +0000
Message-ID: <0525642b-4a64-9e5b-b02a-125e9b9ed4a3@oracle.com>
Date: Thu, 18 Jul 2024 18:36:46 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 13/38] Hide dtrace_actdesc_t until it is needed
Content-Language: en-US
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
References: <20240627053455.21567-1-eugene.loh@oracle.com>
 <20240627053455.21567-14-eugene.loh@oracle.com> <Zpl00nXBgngkAvHt@oracle.com>
 <4518310b-abf9-2e8b-e2de-8ad358adab00@oracle.com>
 <ZpmI7O/iYc9xaWz2@oracle.com>
From: Eugene Loh <eugene.loh@oracle.com>
In-Reply-To: <ZpmI7O/iYc9xaWz2@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MN2PR16CA0055.namprd16.prod.outlook.com
 (2603:10b6:208:234::24) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|CO1PR10MB4723:EE_
X-MS-Office365-Filtering-Correlation-Id: b18c4c55-b697-4d81-89fa-08dca77a1cb0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?MHpBUlJGYVBTdDdKWnpvQXpTUkphMWw5K2F0SUczRzF4RFZiUE5RQ1VLSi9K?=
 =?utf-8?B?L1B3RjFQNzFOMWRNZHlUYnBqeUhDNlAzY1VCeThFSWpoWmFMeXVkQlRvSVN1?=
 =?utf-8?B?UlNSd2pLbUZrcnBNZW9BV2lMMnI5a29LODRWVjNBeTBBaFBrWFRnaHkzdU03?=
 =?utf-8?B?ckhkbmMvY1dNMkpXemFCZ09HdmJiZWdkSXk4M2pXT0ZPMTNvWksvVHdHNm1o?=
 =?utf-8?B?YXo2U21UamRQYzl5eS9ZV2diN0V1cWFTMDBWc0FPUUY3ZUV0K0FUbnhiQVJJ?=
 =?utf-8?B?MnZuZXpMLzBBa1RJNkdaUGFzTVkwdkRhU091YU5LcCt1NUo4a2JZaFRKR3BO?=
 =?utf-8?B?WjdIR3dnMy9wemJ1MStlT0g2NnZnQlJJczlNN0pGWjUzMklvQjZoZUNHd1Z2?=
 =?utf-8?B?QWZ1NU5XNHpDbGxiaCtVZG50YVZRSmZWOFZzSE9UK0xpSmlxOThqenhZVjNB?=
 =?utf-8?B?RFRxU1ZycVFPell1SzgrZkpvQWVrZmo0WHhBVStqNG9LWGR4dHVqV2RFN1Zz?=
 =?utf-8?B?NnkxUU8xOEpLRk9WM3JvZ1UwOU01Rm5hMTJPM2RMVG1sd2dvNHc0N2F4b1U1?=
 =?utf-8?B?Y2QvUnBvalA0ZXFadVNseHkxREZFWVc1TmRROVQ5MXZVNDdmS0xTY3ZLcGk3?=
 =?utf-8?B?QkZUelZzcnd6WlV5bldydzd2Vk53WWdRTDFVRWhLaGhQTHhhK0o3UmljbVNp?=
 =?utf-8?B?SVJRWngySzNNRHV5TTJBcjdOeHRwa1RyM09Lci9nZWdrZE9YTnMrdXFuM2dW?=
 =?utf-8?B?TnJzaEZiR2pQaUVjN1h4YjMyZ001SVJtdU5WZlk4TFgrcnJ0WFJqS25FVzBD?=
 =?utf-8?B?MUlPczl0S1BCaUFjQXllL1M0V1h3SUdGaCtyWGVFZ1ExTTVON0x2Vno2NDFL?=
 =?utf-8?B?eWxYOU8xRjc1T3d1SzRHS2F4R1ZLQ3o2ODEwenFtS3p2WnVHdjFoeUZhN1R3?=
 =?utf-8?B?MXB5VjkwNFVBTEFrbHBsR3NhN2xRK3pYZGFjSkU2d0xVMGNRY1I1OXJ5K2Vl?=
 =?utf-8?B?UE5RcktVWU5reU9pVEpzQlUzU2NvWlBRRFpnbGJjRmg3eERLaWVTZHJ0Zk9r?=
 =?utf-8?B?Ly9QTnNVazBnYmkxZmFsUzVRckpVQmlIeEtpYnFRZFNYalJDMXFZdW80UTdZ?=
 =?utf-8?B?Y0ttTjBxSE0raWtDZUdYQVludGxZdlFhNHlLa0VyQStZRjIyZHhLTnJTSWhr?=
 =?utf-8?B?TE9NNHVwVHVWcU5XWXc4NytjS2p1aDJwVFVIdHhzaTlZdzhQQXo4NXpzb0J0?=
 =?utf-8?B?R1d3VHI4b2J6Mm55eWswU1ZjR0tWMit2WHR4OVYxckNUNWExK3lqMzNRUGlW?=
 =?utf-8?B?NFE5Q3dEa2FlaVluZFkwSWpxMUNzcWFwbUNEM2tVTURJcWE5Ykp4ZU5SRFBN?=
 =?utf-8?B?NjVyVUdNMm8vSWowbHdYMEJiTmpzbkZ1VFltVDBvNWhmQStXNmZaa3NtcnVj?=
 =?utf-8?B?eHBNamQ5WTM3ZkhHcmJnc3dlMUYyTTR4Rk1MWFlpbEJNQVl1Ly95TFFnOTJ6?=
 =?utf-8?B?Uk9SazVnb2ZaSDRYSXhuTUxzNm9GUHpsRy92bjBEUnFxQkVpRmNjeFFtTEVm?=
 =?utf-8?B?VnZ0eXZpZFpRcldOWVRMQ3gxZUJwTDAwMGIrSExDSEZyZ0t4TEd4VTJyOFBv?=
 =?utf-8?B?V0MveW1xTXpkVCtZYUJ1NkVBTlNsNE1wKzNLNk1HRWF3Qkk1cXRJNDY0Z3Ro?=
 =?utf-8?B?UklkL0laM3puWDdZZkE2ZDFzaU9yN3hZSVpPK2ZILzE5bm5XdTdmRTN0TThz?=
 =?utf-8?Q?grmJejOIncyBu9bG6Y=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?YVB1QnVlck1RTUNZeW01eFdER1ExRThLa0c1YTNpdjUwQ0xqdTBOZ0tWWlF1?=
 =?utf-8?B?Z05XeXo0ZEtqa0JraTNkS21YeW1pTmZxaXdKUm9qSWdlS1hLVnA1bldaanE0?=
 =?utf-8?B?WVdCVmFUdTFQcWxKdEx0eGFQdzBTSUc4R2wvRDd4VWQvdnBqd2JLQlpqZEFq?=
 =?utf-8?B?cFAwK2piMzh6TklkZG12dS84bVVLWGg3aWFxczJDZFp0OUY4SGdKa0plOThh?=
 =?utf-8?B?TzAza2RXbFJpeHptNFBRSVA1a05iVzJ3U0V4Zi8yYi9UYzFQbXVrWjllYjhJ?=
 =?utf-8?B?Wk5rYzBzSDRTTzFTWDVnZE9EM2VhU1J6aTR6d1NPb2ZLVEhWZHhSVGVQU3hj?=
 =?utf-8?B?bTFsZzJxNEE3TitUM2ZhWHN2eitwY3hXTXJNRUpDOEV0ait2UTRYZDBSRDRC?=
 =?utf-8?B?RDBpWGp3MzZCZHF5N0hkTUV0ZFFYVHlhcE8xbUNmanZzb2RlOEtVd1oxWSti?=
 =?utf-8?B?S0tBcWVRZ0h6TUpUa1Y1S212cFRDaUF6VW82ZkJzZ2tJeDdNbFBlaU13ZmFQ?=
 =?utf-8?B?MVgzN2grZWFtTDhiOE8xeVlJRjA5QjhQZW95NkJtTnYxS0g2NjUrcnRsK01a?=
 =?utf-8?B?VXhoRk9uV3Y0RjczZnJnOVdEUTVYU3c0NDN3cmlrVUNUV1M3aml6eXU5Q1pV?=
 =?utf-8?B?Q2JESmN6SStwUGhRaGtidU9oVExwK2JORTJqQ0p6djhFRlg4ZUVZdkJJc2VE?=
 =?utf-8?B?S2xxZ0s1L1NCR21IN1R3TytoQ2MyZDJ4NmtObTVEdUdxeEF6eWJTanhiWEds?=
 =?utf-8?B?ZWJXNnJwSGJNeXV3WURCQmRyV0ZHMW1JbDF5NW9qWEVWVmp2UWJ2dzkwOENk?=
 =?utf-8?B?aHp1NDM1VnBTbkg4K2s0Q2l6enY5L1NHU1lYNFVPN1ZNb3p0N3lOY2lIaUNy?=
 =?utf-8?B?UTR0Ym1QN0NXSjNFaGtvdmNFa2NlbUZIZW8rTWJOSzFIYTRDTjFDQUYvTmdJ?=
 =?utf-8?B?QUJ3KzJGS2x0SkIzZmp4a0JuaWNMMmNVak1ZVm9PRHFuNHozSUlnc3V6TjhX?=
 =?utf-8?B?NmE4aHltaDF6K0lXTkhEVm9QTUhXMzh3ZjJaSnBsMGMwOE8xNmtXcmR1djQ4?=
 =?utf-8?B?VnFXODZkc3lvNUk0TUd2ejV5OVNNVk5tK1FncnVrMzFYQm80YlI0aUdSOHNs?=
 =?utf-8?B?UElUN2ZKV3ltdHBGc0ZxVEV3OHJMdGx3NmhrUGcvK1ZyYVlXbXVaMUVla1ZE?=
 =?utf-8?B?ODBWOWZ5UkFkZGdJSlhCcGloQnRPMU1CNTVZaUR6V2RqOXRydG5BcXRvSSt4?=
 =?utf-8?B?VlRyM2tTd0FNZmxnNWlJRzk2bjJPdVpXZzh0M09wTVQya1ZEWmhMeHEvSGZm?=
 =?utf-8?B?TzJoeUhBUkNnSm5nblgyeGRBdEh3UlFwWndRU2tNT1hXNmJuMCtldTdDOXV3?=
 =?utf-8?B?dldlTFV2UEtmbERGWGtHWC9HOHp0bG4xMlAySmI3ajdBUjdLcitKbWJEbUl1?=
 =?utf-8?B?SGk3aXgyQy9jbWV5RjlsTzFHNnVmdkhqSzBNZEQ3azFwY1FTcVZybUpSZ0lm?=
 =?utf-8?B?TFFaRS9hTFVYajJTNGJ5cVpEM09DWUlXRWU4a1Y0b3R3dTkzZUFTMmhrcU9B?=
 =?utf-8?B?anFKTEVQQjJIUFE2a3VhR3NlU09QNkdoZnVFeGJFcTdrcGFHbzhVMHFKZjNX?=
 =?utf-8?B?MERFQlBFN0xrWUJ5MWlJVDRPMVl5T2RxamNqbDVNT0xmMzJpTEtPTmxSQ0Ur?=
 =?utf-8?B?VGMzVk1BQ1kyUFl2aGRIREhvT2VHZVZDQ0J6bUViQWRkTUFMWDdCMjQ0RDBP?=
 =?utf-8?B?NTB6ZzRkQngyMTYzN2hHaFNxQTlmcjZrRkdZY091S0Z0ek5ubVd6V2I5K2dD?=
 =?utf-8?B?d0RXeGQxQXZZWll2cURjTkRBbno1OWtqOUZSdlM1WTVENmJhTFZCNjAvRGZD?=
 =?utf-8?B?N1NxUTBmV0NldUs2cFlhWlNVTk1TQysyWWFENWtqR2wveWprVWh5SG5iKzM5?=
 =?utf-8?B?b2kxTmtoWHozYXJucFVWMUZ1RlMyNFY0a3htMGtyZVRDUWdvcjhCQ2ZCbjdG?=
 =?utf-8?B?UzVGNlduVUlZcXB5NDMvSGRuWFViQzVBbEN0U2pnN1htT1d4SVFIZzBGRjJu?=
 =?utf-8?B?VWpMVjlSanFKdG9jcEtpei9ZY2ZCVFhzK1cxS1pGRno3NFp5ZGJiWmhGdHZi?=
 =?utf-8?Q?2kyhfPEf6rSyqb6urq0s5Vgwe?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	XUKikg4zFA/6n3nszDRT6+aCUj2oFAz68KWFunub6dsj1AVMjL7kvdH8kPjrsOxSJYVkTf6LCgunFG8WHYK6DL0K1PKg05tyLhahUiQ6mbRBgPYsd0/t5tvLVv4YZHIk5sLY2ovYMZE/e4KVT6hNHqe0zg2UJC69d4i4TJdK0WXfS6jQ/ZXFPjaxYXQJ+QYk4ZVYX+i60A050+HN3etWMJOu5hu4HRU9ze3fkOuUVcrlq4anNCAGBodfvsI4ENclki6s/me1C9l1lO5MRT7oA0xcD+3/9bArG+uZ7zK74fTcVJ2T0hfIRXEwoGaALiqpnVMUHo1fI0QVEI1/alLNcqHsxWQHDgTifq9UMUakCjU8Cky/9A4Bsh6pJKZfbyQgD02TY7E5aJI7+6Da8Ta99P6YHYO4armlWqqQUAFyWwLUmzM79HVTRbezkO2Q706J30xjm5CtMJ/spnPwN1tgfLTcNM0dEyxXnOmlioRVzhcF+//HUKxxDWfI1nDsDLs4QQc1zazCxemltvrmPvXow0fr/UsPZadx4D5uQE92KC5VyTAx7hFigWy0J9WB/dOLV8QK+UmPTs3isG2KgRHdEeThpX+C6g22gRPLykyac+s=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b18c4c55-b697-4d81-89fa-08dca77a1cb0
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2024 22:36:49.0455
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XlQTitI538cgcwr/jK0+DtKgmLHjrh7kkZCZ2EVv1Wzly3VauPycdwYNiXxx0O6j5lc1u+kNt89aQOAa4kLCow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4723
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-18_16,2024-07-18_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 malwarescore=0
 suspectscore=0 spamscore=0 bulkscore=0 mlxscore=0 adultscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2407110000 definitions=main-2407180152
X-Proofpoint-GUID: KwWu4UNA2hnwyGfaByyOydcZ1_lzhcE9
X-Proofpoint-ORIG-GUID: KwWu4UNA2hnwyGfaByyOydcZ1_lzhcE9


On 7/18/24 17:28, Kris Van Hees wrote:
> On Thu, Jul 18, 2024 at 05:06:00PM -0400, Eugene Loh wrote:
>> On 7/18/24 16:02, Kris Van Hees wrote:
>>
>>> On Thu, Jun 27, 2024 at 01:34:30AM -0400, eugene.loh@oracle.com wrote:
>>>> From: Eugene Loh <eugene.loh@oracle.com>
>>>>
>>>> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
>>> I think you should just get rid of it.  Worst case, we can always revert the
>>> patch.  But this type is only used in code that we do not plan to revive since
>>> we no longer do DOF the same way as the older version.  Even if we were to
>>> re-implement the functionality to save compiled probe programs to file, it
>>> would look very different and certainly not be action-based but rather BPF
>>> code based.
>> It would seem to me that the declaration (this patch) and the code that uses
>> it should go together.  So, are you saying the inoperative code that
>> references this declaration should also be removed?  It would seem funny to
>> me to remove the declaration (this patch) while (admittedly inoperative)
>> code that references it is left alone.
> That is a valid point - in which case I think that (for this patch series),
> this is not a relevant patch and thus should be dropped.  Instead, a work item
> ought to be added to either get rid of (most of) dt_dof.c and related code, or
> to actually implement it in a way that makes sense (i.e. do something useful
> and be in line with the new implementation of DTrace).

Okay.  Patch withdrawn.  Issue filed. 
https://github.com/oracle/dtrace-utils/issues/73

>>>> ---
>>>>    include/dtrace/enabling.h | 3 +++
>>>>    1 file changed, 3 insertions(+)
>>>>
>>>> diff --git a/include/dtrace/enabling.h b/include/dtrace/enabling.h
>>>> index f1ec444c..2562c87b 100644
>>>> --- a/include/dtrace/enabling.h
>>>> +++ b/include/dtrace/enabling.h
>>>> @@ -43,6 +43,8 @@ typedef struct dtrace_probedesc {
>>>>    	const char	*prb;			/* probe name */
>>>>    } dtrace_probedesc_t;
>>>> +#ifdef FIXME
>>>> +This type is used only in #ifdef FIXME code.
>>>>    typedef struct dtrace_actdesc {
>>>>    	struct dtrace_difo *dtad_difo;		/* pointer to DIF object */
>>>>    	dtrace_actkind_t dtad_kind;		/* kind of action */
>>>> @@ -50,6 +52,7 @@ typedef struct dtrace_actdesc {
>>>>    	uint64_t dtad_arg;			/* action argument */
>>>>    	uint64_t dtad_uarg;			/* user argument */
>>>>    } dtrace_actdesc_t;
>>>> +#endif
>>>>    typedef struct dtrace_ecbdesc {
>>>>    	dtrace_probedesc_t dted_probe;		/* probe description */
>>>> -- 
>>>> 2.18.4
>>>>
