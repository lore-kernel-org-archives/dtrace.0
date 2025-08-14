Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2E3323CEE5
	for <dtrace@lists.linux.dev>; Thu, 14 Aug 2025 16:32:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755189136; cv=fail; b=qBUWHyRBOMEjJPFgW7UddMvtOzXsOuynvgMxWAHDko8vc4dBi/A4s3ewAhnf36sr4biVO6UTgCz/1y+FsJdb5oOIGU5NrVyA9YMvyUnwAuZIu8k9wfMnHVVeHC7QMUrffE3lITVAmM4zitvA+c3qFqtPBVNX+NsVXLmhNBvNteQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755189136; c=relaxed/simple;
	bh=kQJA6Brbas0kUgPeOL0OsEpU7HSp8PToeEzME1U5E5E=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=D5UxjedDiVMmrNSHni4uHSvb78qBx+7r5stM5fdhNcLapUpMlaeXghSLxnSH235nouE5LfvRiHyvzfpKPTaR+2Y8flZt3hSvM2ut8C4503lNUFUeE7VmsQi4skhSo5pRF0flzg+9tnSeeEFNGqVLzcs4FoBHywzAm7mRDMbf0B0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=QgnGFcX2; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=putK9pbf; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="QgnGFcX2";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="putK9pbf"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57ECg2OF028200
	for <dtrace@lists.linux.dev>; Thu, 14 Aug 2025 16:32:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=xaUWw41fEA03RK26Hu8psnXkEZReB6aTsiofBB2v2OI=; b=
	QgnGFcX2jKzA0JoDK9c7qSPORo1UGtGjQMFwNM5ypzw+bF8akril5LhveuBbYlDk
	KTfdzrd1Rl+1iS1JJ0vyX7EUQCClzMRLf95noCQhnI74lTvEgsspueqH6P1BnKIe
	OM+q107YpeGaLoOswwJOYfGYTCmdDXkWbEJJ/QnfIgmscnM6GaNKcf9+UI9s01bi
	ufeh9KlZQlarkosMcM7Oh8zYdagjogUFGyT2OYM22FGcymwY8osucH8ykAELAhql
	RwnWthOFCEEyLMMS+TbE7D6UNMkXAgnImwGUREZZt+zwsYFqKUbtwviVivNhbfGz
	y87pBj+RgI8b1/awWi766A==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 48guchavv1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 14 Aug 2025 16:32:13 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 57EGWA5e006369
	for <dtrace@lists.linux.dev>; Thu, 14 Aug 2025 16:32:12 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11on2080.outbound.protection.outlook.com [40.107.223.80])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 48dvsct6yr-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 14 Aug 2025 16:32:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sIRUQUB019BKUIOcenw0x1qxRQZJ/YG6dC0gq+lc0npd+lupbmpCVTiiCaHpaKmTqiQ0ul9cJouIt3aIlNk8yNhw9xXx4rzGarz3ZxcvcO2rKVbGVkWe5Y4y+7rSbpnH85wKpoXlHLkM5UiQNHK39d7/+QdeeO2H+6PxYtBCH24dNpltKKqGmJ8FIH+ORgaAa3KZo3vHUwRKBrGs94MPiJ2sdDMLm9dQHzBzVogDRuwWJVDI8ybVtfR9N90bbGIJAp0lwNleAjCDj6wchtIQgbKIfU3VHio1kM8ofHoxMa/OkLaYLmmva5Lq4oxIe8yOjhqqoae3NEgnj/VDnFO+Kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xaUWw41fEA03RK26Hu8psnXkEZReB6aTsiofBB2v2OI=;
 b=FMiWx/SO8J8R/JMuaP6FQUHrnM3o+eNHMKnaDyG+2zQ1fYlrG3IAUz1ZTlsJBX5+oBCiiZYTjoh2/Z5u6f1f84ZNK9hgWazaBBUNj7ERFj3UUae87GZn39WRpXkT1DJVOLAuTxi0e+zRuzFXfiGMO50V+tDGe6BHX6L89K5Q+gGsXYVkQHtBOEdMkGT2L5NGKenIElu7YCK88w7sNE4MSWVQfBVYccPVMOKmKU82RF2niiXwrnLlXh7BOT0nj7bcBDhhDMubQn78J5uMn0u6Zl91bnMPz8T4B+xOlSxeYLLFrlPcbyLrCA9cF+nhMMKzif4HDx/tZnOseo1w2oC9Iw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xaUWw41fEA03RK26Hu8psnXkEZReB6aTsiofBB2v2OI=;
 b=putK9pbfBqg2jDVBCI9qx50+2IcJhymoF/1pxbUUONQzr8JYmGZcLG9mIRWuzyFPOyp7kvBgo5iOgZ8B3V65UAdpf/ngE6Hw43HCWdtnULGWmph9M730h8YF+uAyzmfmgHJ7Xrjsz8psieqR2Tuh+kVoMSqyciozET/7b8ug3NA=
Received: from SJ0PR10MB5647.namprd10.prod.outlook.com (2603:10b6:a03:3da::17)
 by PH3PPFAA02B7A0B.namprd10.prod.outlook.com (2603:10b6:518:1::7bc) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.15; Thu, 14 Aug
 2025 16:32:08 +0000
Received: from SJ0PR10MB5647.namprd10.prod.outlook.com
 ([fe80::8db4:df1d:6afd:e4a7]) by SJ0PR10MB5647.namprd10.prod.outlook.com
 ([fe80::8db4:df1d:6afd:e4a7%6]) with mapi id 15.20.9031.012; Thu, 14 Aug 2025
 16:32:08 +0000
Message-ID: <27dd03ed-216e-5032-20a2-aae6b26081bb@oracle.com>
Date: Thu, 14 Aug 2025 12:32:07 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH] bpf: force generating code that all verifiers accept
Content-Language: en-US
To: Kris Van Hees <kris.van.hees@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
References: <SJ0PR10MB5672B2F52AD47A7F26420D14C22AA@SJ0PR10MB5672.namprd10.prod.outlook.com>
From: Eugene Loh <eugene.loh@oracle.com>
In-Reply-To: <SJ0PR10MB5672B2F52AD47A7F26420D14C22AA@SJ0PR10MB5672.namprd10.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0052.namprd03.prod.outlook.com
 (2603:10b6:a03:33e::27) To SJ0PR10MB5647.namprd10.prod.outlook.com
 (2603:10b6:a03:3da::17)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5647:EE_|PH3PPFAA02B7A0B:EE_
X-MS-Office365-Filtering-Correlation-Id: 4af47344-b35d-492b-e08f-08dddb501cef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RjNiTkppV0J4Qkw5QVBsNkc1S0RwRmxHeXB3c3VWejlRdzZ6eVZYNU9Fa0o2?=
 =?utf-8?B?QTB4bjNvMGl0UmxlR3R0N1M3M0p4YjRRNVdBdFYrK0J4U1F4UElXb3hOQkRE?=
 =?utf-8?B?eElUVHFoejlSZW1rKzg2cDdVSlMzOGhpUllNVkEya0JBOURZYkk2SjR1alJJ?=
 =?utf-8?B?SXh3SWl6UTNQaUQwNDlHbGVkTW91TUVtaVZZVnU1MEsrWDNUeXA2ejM4WU9R?=
 =?utf-8?B?RFhqS2RsRy9Va0ZmQ3ZtSHVBWENJNHlaOXhrOVZpeVdsSGpPSytVVllyYlJ3?=
 =?utf-8?B?Q0ZqL3JDSmR4RjJXNjJtRU5oMjUweHZXbU5CbndDSHhuam9IaTFobkhTNjhK?=
 =?utf-8?B?QmZPYlVyZFowMTVVWm9tS2p3OGp2SEthSEI1cXE5dENVaXhKM0ljSXdMNEtv?=
 =?utf-8?B?REQycFlPNmMxUVRTNXZzT1JFRk5sSm0yZmpXWmxRMFlNMUNsZUZ6Q3hhQ0dh?=
 =?utf-8?B?YVI3SmJSYjQxSzUrQkQ3TkNLOFU3ZGZzdThoU2ZtWmF1THFMMlZKNndZdCt3?=
 =?utf-8?B?b1p5WEgvS1k3cXh3U3hvQUtNM0NFeVFaSmI3eWw4L05QL0JmbmhMVk43czg0?=
 =?utf-8?B?alBYZVRaaEhQNk04a1NoeTBJd05tRlNvais3K1B4YnJTMUFLWThmdXBxM0tJ?=
 =?utf-8?B?WndmOG1abitOVE9oTTBtUHZmWVlrd0NOM2grZHVWcHZGL3RabXllTjdMbG5N?=
 =?utf-8?B?VUtxaUh2QllWQ1NuQ1ZoRUlUb1lNNWJFN3gyT0hDc2NPeDNReW1pdzc4MjVP?=
 =?utf-8?B?TUN1SmZzMklXWkNjbkMvNTFBOGNIaWU4a1ZkNlYwREN0S01HajdrYkIvZ051?=
 =?utf-8?B?bllvSTQ0aVYyS3NoUmVXQlQwUURyVFVTZ2lsOHRMMTdKVWtueFBacmpUSGs5?=
 =?utf-8?B?THNnSU1FUHBZK1RxRFU0VmxvczJHQTdBOVd6enNSbzRkejNFdVhwWWd0Mk9t?=
 =?utf-8?B?eldPOFVwR1FjYUF3Zi9pM0N2OTdISmFXd3BDQUNOKzhsMVU4WE1IbXVKRENS?=
 =?utf-8?B?RmtsY1hObUcwNFhVOWg3RkpTYkdLSjg2TWxtaS9ZbnJERkRRNFk4b0lRMDkx?=
 =?utf-8?B?QWo4ejdGdXdrTE1ETHhGbXpwbWxVSXdmaEh1TW1EelBBRlpiZXNONk5BQU0r?=
 =?utf-8?B?SUlFYnFoVDhJTUp2YXdnRDRNYzVYOStiS3JnSzJpaUthQXpDNWlRRHFDb1Fj?=
 =?utf-8?B?S2s2SjRSZzlEN2dRM0c4ZXRUWEl3eXMrdFYxS0dsM0Q5aCtTMldmeEdDNDRi?=
 =?utf-8?B?N3Z3Q29nbmJSZjBHMWdoazRaSmNlY0kwVmwwZWN4bmlwRjJMZGFDUDMzb0ZE?=
 =?utf-8?B?RDR3RGZOWTVrdGkyT2hhMnlRekpxZC9sdk1Vak9KRGZPcTZDMVc1VXZ6SnhS?=
 =?utf-8?B?ZXdwazB0V2hPd2tUUitucHFiem9OcHc0ZDJHZTdvdVVUbDFqTm5LOVUzbG10?=
 =?utf-8?B?Mktyb2dmQ2pSYUNacmlGMXdNOFNiMlg5TjlqWWJacjdFbExSTXBNZ0c3bWRN?=
 =?utf-8?B?Y2Z0RkRsajA4UmpWWStDdkpnaTZYUU9GQlZYRUlpR2wxT1ZQSFN5OUdYUkZB?=
 =?utf-8?B?VDc1RDdkVWI2TXNScEFDL01DY0xxKzV4N3BUY0RtajczTlU4RmJlQks2K3R4?=
 =?utf-8?B?QnJIb1NIaTFKUHIrdEpsWEp2eWJjdE9mY1ZqeDRHYmhqdTlGMWN4bVoxSjhL?=
 =?utf-8?B?dGpjQmNRK0dhd21RRDRmdnBMbFpaSGM4V3p6c2orVlJZTlZxNkJGYjFSakRP?=
 =?utf-8?B?N1ZTeGozalBoVm83RThHcnNNNWIvL2xEWHdRVUh4ODhBUCtKRVpaY09jcmds?=
 =?utf-8?B?R3V2R1VMdFUrU3UzaERwU29LeW9ZYk1TNHlWVFprbmk1aGVoNEdhdW1BSExP?=
 =?utf-8?B?Qk56eWdvczhTRVdKbEJocDJwRXkvQnN3UVJRLzhOMjA2NFlEWklxc3Rtc3l4?=
 =?utf-8?Q?2LfCuoHDZxI=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB5647.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eDZ3UTJJVEJUaXZyelZra3VlemNwVGYvaVVBaHlFbUhnWDRoc01TUDFJL21G?=
 =?utf-8?B?eDgvVlpMSTFEOWpaVUp3VFREL3BQR1FuZGZzeWxFcDNOTXFNU2pNazNqcVZu?=
 =?utf-8?B?ZTFxaTFDM0xSTFVKdGU3RWxJNWxPaG4vdHc1a205eE9ZN3VRZmJweHlyeDdL?=
 =?utf-8?B?V0QraWxzUjdGQzBJQWcrRW9LeFN5SGdxRG5HTWwyWUxxZG9jbU50V1F5OTRH?=
 =?utf-8?B?UHZYNlBDNTBoTUJucTMxYTJmNjNSSEY5UlJ2ajZSRU5GUmVyR0JxdEwrOHVt?=
 =?utf-8?B?MGVQdklYZlNzNko5WFZVd3hwa1pESUN3ZlhTUEZaYUZ6ZmtEbGdaZFRRTEI1?=
 =?utf-8?B?UHpxUS8vaWhPS2YwemtMYnpTZVRwRFNCVXJONzhKcWw1R0RvNzZXOGJ6N05w?=
 =?utf-8?B?MHZWcXNwczQySXlTWU5JdFQrcnVjWS9KYkJmYkdQbmJMUG1IdjdJQi9nTmZX?=
 =?utf-8?B?N3I4d00yNnBtWlBVUXU4RkR4clhibGRYZG1RbFBpZS9FRXJBR2xsTGc5M3RN?=
 =?utf-8?B?UEV3QTgzOEpvZVdXOHIvSUYxaHU4dTJ1bjFhSkg5cXBZYlNqSUhtSU1Pcy9B?=
 =?utf-8?B?U1h4MFdxcTJxSnVkdllqUnlpQkw3c3hKemJKcEg0bURrbDQxK2pJWDBmVzdG?=
 =?utf-8?B?T2JKU0pzWG9FTm9pL2c2aU9pOWg0RUZCQklSK1VSKzVWRU9XT09qeXJqUDZJ?=
 =?utf-8?B?b1lXRTNOYjJKZ2ZHMXF6Z29sZTY3K1RrYWRDb1NtSGNJY2lwTXVWNTRJb2Fj?=
 =?utf-8?B?bEUzTGJIR01CcG11SDMrZGIxZlNLeXN4TVBIR3UxeGtMSmxNVnAyQk1GUkQx?=
 =?utf-8?B?NDdnWjZkZjEwVW8zRGEyY3R2YUh2RmdTR3dJL0pKWE9KVjk0cFVuN1VxbjM5?=
 =?utf-8?B?MkYzYmVWWEtrZHdzdnJTcG5lZVBvWTRzSXVxYkpOaHE5K0NFZThhMXVkRWhN?=
 =?utf-8?B?OFo2WHhFbjQ2cStTWW5SeXlUS3lvN09TMHBhRzZlZDQrS1IzajhNR0hWTWpT?=
 =?utf-8?B?Uno3bHRHbjN4SDdEbkRWYkN6MmJjeFM2cHE3dE4rUW1Cb3FHd0dtVlFwT3lQ?=
 =?utf-8?B?aDVDc0VPY0VXcGU5OUxKRURYN1l0K0ZGd0tVNU5nd2NNT0Q1bjQ1eW5OVFV3?=
 =?utf-8?B?bDkyN255Tllqd1NqTjh6T0dKeDVUQ2xncDYxWjBySVZaMkI4Q0dVU29IWG1o?=
 =?utf-8?B?ZzRxY3ZOQW1YMXQyQmhSem5pNFMrTzJRREg2SjU4UjRuZElJeG9LN2R3aXdr?=
 =?utf-8?B?WHFYemZOYko2S2xlZ3VRQjdvUEU4dmRLMWg1QmY5WjNocFhlK3kvS1ZpdkZx?=
 =?utf-8?B?ZzhENkUwSFdjaDNjUUpvYTNCY2VmcmtTWnVDTllpUTZTYk9aOEc5Z0wvbFZM?=
 =?utf-8?B?djlhVHRPdHBmWjlwS04waVdtemdxUjVBeXJUNkF2bEFlTW1NYlRlY1RPVkhi?=
 =?utf-8?B?TklYK2o1NlJKdXpNNjNwclVRWHJCbkUxeGdCcWJVeFYraWN5cmlxOXBhZzdq?=
 =?utf-8?B?UXh3VW9UeXpuQk9BdjdlUG5mZnhHN0hMYzlJVlJ4emVIRVBsejA5KzNxc1Qw?=
 =?utf-8?B?UEV2RE5LSkMxenNSekNuNTV4b3UvMFhIcXdYVForVnpQRGltdGY0UjlCZ29D?=
 =?utf-8?B?eUxqV1JZNXlWQy95OTJqMThSQ0s3b0RrVllVTFRMZVB4UTJJZmN0OFFEVlZX?=
 =?utf-8?B?Vm82RTUrSEFYY254V1VMTWVEQ0VnZncrVnRwaGsvT0JVWlN0bmRTenBmaFBT?=
 =?utf-8?B?NWVBcVRNbkhuMEVJWU9ueVo2OGg5MFVIbm1QUUJwVFJKYUFGUUxadnc5UzZx?=
 =?utf-8?B?NnlGT05hcGhNaDlHWnZ1VXE0cEpPZmRYb0xzWGkwYjlKZjhncHlXRHdRMGNk?=
 =?utf-8?B?ZkJGSU1nV1pGNUJETVRWTWxiby85MTRuUEI4UGptS3Bla1dieFpjdEIzS1lp?=
 =?utf-8?B?b3pZWHFGZVlWellZV2VGM3NucDFEWW9peW5DaXRMRWdMQmppUXFPcHFMbU1M?=
 =?utf-8?B?ZHBqUFdXOXpqZnMrenV4dy91cU9HNmtwUmk2Q3ZGN2ZlSWRzYVJlbnhhTVZX?=
 =?utf-8?B?TnJaSUpseDUwL2VGaGk5YTJQY1lTdVNQeHFQTUJVMHVQL0NWOUJxQTZEbWFJ?=
 =?utf-8?Q?vUpUkCdAx8Mty7uhXiijbBku+?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	uq2Kx98BgqRyQhfvKeRit3IBp7AeYsi0Lk4ZoYHMmmD3tRGw4Cuo3pP+TrYftXpVF1iPjVX2V2RQlEkd1FSEpoeAbAhsuBYmhBnljCjQcjIHA+aXaQQdfFHa8wobGdKanCJBaYD1Mi1ccH9km6oACv3JMUq8Bq62YoJ9gu3Rzn/u70svEAHS4I5Etsj8cHfEMqSpF7WiloiWmQRp5FzqzjcBzB2qr1g7LlfWJTBwESatl6MC65V6OJHX/9jCbEonFb/bpwsRkUelsJj0RkhY1xhw9/JLBjNoEoH64v1gGhTzoWc9EtBw7sHF9gEtTbU/RucyUBcPJhG45ocrdaplvHVk5IeNn51q3VXFV+Ft+AUzvXOlqpCNfbPMmIKcThiVysBZv0b8qG7GbRpB1l2nuBwut7PVaWwpGhGO3sd8Rqtvn3qLtLkdm1WbsRKORKMBkUXnUM4LOXPzsn/5/tCeeGRFC+WAhMGLdkyGEGsIUhRa5o/+Qq4nSM4P51reELcQGu2y6O3bqxbZVullnH4CDz7YIs+Zn+Fu+gqatzC1LN1ryt0kTWt1Pa0mb8Tkp+js430KDpXeo8YOMofSqqGwWRmLut23pSPCOUmJZtp5aME=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4af47344-b35d-492b-e08f-08dddb501cef
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB5647.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2025 16:32:08.7486
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5MjnrctiDGDG6J3/uFih+AB16DllctGbVatpz2CyTsGlP/kZ/SwAwM+3Wz+zGViw1st1S2zPT1hhAiStfNEKoA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPFAA02B7A0B
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-13_02,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 adultscore=0 malwarescore=0
 spamscore=0 bulkscore=0 suspectscore=0 mlxlogscore=999 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2507300000
 definitions=main-2508140141
X-Authority-Analysis: v=2.4 cv=Eo/SrTcA c=1 sm=1 tr=0 ts=689e0f8d b=1 cx=c_pps
 a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=rq0txSFZt77rFPtEGdgA:9
 a=QEXdDO2ut3YA:10 cc=ntf awl=host:13600
X-Proofpoint-ORIG-GUID: zGn68q_JFsCjo5RbXuWUskuVKhMHmF2V
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE0MDE0MSBTYWx0ZWRfXwdECvRndjD0s
 LTGHtMGzRHEbKFTHjGik4m8xRMAvDS9gC66Vm0gcV8IIoK9X811AQc7jnVRKcszs4oFJ1x8auRA
 QHb/BlwNMqXhsZ9fWqNIpO4cudNfdq038EpI3RIb4HJwXMURsHXK0mmXUvXO+TcS+1HijgY3wnH
 aMAf+QnGR2vZVVrlWSNm/xmpTSbaoI+MQ0upYr8tmm+5jFx17qPAQb3Cn4AuvSg/JxhnCJuP9z9
 wdrivOU6/7+k1ver0kR5MBmfuaSn1dz4gZFzKfypc1UUHG6TtmIJnC44m3/L3u0cwLji2xK9GYQ
 EhYzT7wMHKIEbwIMruV6wASVKAvkNH2mGK/vkBe1EPhY2Jq27SpwOFFNx42EcP9+/b+rzo9f+QI
 xPSiPOZnE39zccKUQgADAdsJ/DMeiEPS+YeZCQ02vam/F/ghaG5F6eFwB7GJWTJTJSls2jq7
X-Proofpoint-GUID: zGn68q_JFsCjo5RbXuWUskuVKhMHmF2V

Reviewed-by: Eugene Loh <eugene.loh@oracle.com>

On 8/13/25 17:18, Kris Van Hees wrote:
> The compiler could optimize val = *valp in a way where the verifier on
> older kernels would complain.  We use inline assembler to force the
> not optimize this expression and instead to always read the value as a
> scalar.
>
> Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
> ---
>   bpf/get_dvar.c | 19 ++++++++++++++++++-
>   1 file changed, 18 insertions(+), 1 deletion(-)
>
> diff --git a/bpf/get_dvar.c b/bpf/get_dvar.c
> index 073cca57c..aa14eca58 100644
> --- a/bpf/get_dvar.c
> +++ b/bpf/get_dvar.c
> @@ -150,7 +150,24 @@ noinline void *dt_get_assoc(uint32_t id, const char *tuple, uint64_t store,
>   		if (valp == 0)
>   			return dt_no_dvar();
>   		*valp = (uint64_t)valp;
> -		val = *valp;
> +		/*
> +		 * We used to do:
> +		 *	val = *valp;
> +		 * but the compiler could use knowledge that *valp is valp from
> +		 * the assignment above, and use that same value (whith is a
> +		 * map_value address).  Older kernels do not allow a map_value
> +		 * address to be used as map key, and a verifier failure would
> +		 * be triggered by this code optimization.
> +		 *
> +		 * We use inline assembler to force reading the value from the
> +		 * map value rather than allowing the compiler to optimize this
> +		 * code.  This works for all kernels.
> +		 */
> +		asm ("ldxdw %0, %1" \
> +			: "=r" (val) \
> +			: "m" (*valp) \
> +			: /* no clobber */
> +		);
>   	} else {
>   		/*
>   		 * Record the value (used as key into the dvars map), and if we
