Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 025D22FF653
	for <dtrace@lists.linux.dev>; Thu, 14 Aug 2025 01:01:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755133272; cv=fail; b=JA0DpFQWCqRo3qoigdhMCztYfeFKHj5Hog1DYmt992Hkck4JoTNMlPjhpi3LCiPyDIX6tShjauSWAu5sb1U2dMS0yQl/Lqe7AJ0IqoorYmRiLdACg7ipTiLHC1xKrgqMsWnpfdWdyow1qkqhFe4lelj3K7RDIyRmRF6VfUglUiU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755133272; c=relaxed/simple;
	bh=QohGb5fgLvh4/pV3xRQ/wDRRM7LQDENuGzB1kvm8XNw=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=kJXI+2TSDhPaOvY42lB9CrW/x0JXa1XAfOtODLFQZ/0YF5oOVrunLiXv1+Hbip1gAYeFlMou2hycqEuISkPpHk/TDub9+EFAzskzPHOKN6o99V+plEkVyuPRZa+/hFhcIO2D3ATsJTHsawQwGW3p+PJpFVv/PcUUkq+TBwCACMk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=DEqq1i7V; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=zTenA1WO; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="DEqq1i7V";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="zTenA1WO"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57DLuXRa030916
	for <dtrace@lists.linux.dev>; Thu, 14 Aug 2025 01:01:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=AUOUzjpBsW+Pzi6wV5Lc1ouDF34HMzQzoGPlw2zhKuA=; b=
	DEqq1i7VeJI5QG9DlGGz3IVztP5QqAj1IW6Z5b73hZu+XWeaF/uLHfPixYXBTFpE
	YbElOg+IkS2ww+YMBaQ2366BR0hib4n1V1ivpFiTd4gBjQC213d++wQpetkPxN+v
	aVG3eH11Pj85uC0FXIIk+xWH1AyQhT6LqKrf4z4FbfkGzxhlgR7Yjm2/+0arDYPc
	tBgq0DriB0iWfAOcMcojoVA5DDFXnVGmBlx6F/J0dWAppX1CY5sjkudJdXREls6m
	UzDmq2vkoOtASgpv4XUi9Jh2MQKPMbKBvWDsuohjalfI7xY+RpaDSepcIM69ZEKJ
	SvjqdCoKVOw5FjpNc20P/Q==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 48dvx4grf2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 14 Aug 2025 01:01:08 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 57E0s3nN038683
	for <dtrace@lists.linux.dev>; Thu, 14 Aug 2025 01:01:07 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12on2082.outbound.protection.outlook.com [40.107.243.82])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 48dvsjmvet-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 14 Aug 2025 01:01:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b8toucDqolkgT6RdoZhXVWr+crTWox+cXRKJiPOZW9DzxKG0ZAO9RYH1wJsSlv7I7+S7Jb2QcJj70/ydYd3hvqv3rL8nYUEyFPEIbQpHtK0NZ0/Sdn5Yjg7HVYQcUDQTfsAl7UZE8/rOkchEsdz81jBVkj2AHew7xpQNFSdIBoS3EU5TgsFEGL5yVhUEA9HEeGw6f9wsulxMV8h/xxTb83xiV46gdVDLG+jDfUzFqi2ew6i9n8NzrGXXqgeke26Dd++J+Djy2JhLyFEgafZjhuiT9Wx++AiToEmp68C62YPjhTXRmNCpv7SxELNKjlScPQBYFL3Ivf566pqLzGTG6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AUOUzjpBsW+Pzi6wV5Lc1ouDF34HMzQzoGPlw2zhKuA=;
 b=Uh/JDgHDK5cvhJ9oNYDs1svHy7tzPBEMdrItAgQGW/uU3zyq7Sop5/9LceEXHmPfcE0IAjXNocoB54izb9pVAcIZkPXbgNHfLNxd0eqeRhOaCxK2bOD4zTjJ4l0JjjPbh+iJmDj9ytr8465X55Yu/hjax6DG8hD7LPWXI6uxkV2IVnPIJ2vWKHMDKq6QmHmViYyCwG7xsrXj0PlIdJ2Sb6DwXt1c1mTsEjN7UNhyFzAWLAD/vqVdAWrhN+qaZW9Odp485IeORCz0atBI4begHn3NRoxGhyDbaRI/XvTchBwd5tjmmLX0xeV59gRdRSC63FBPUOkPKN0cGXhTZiItBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AUOUzjpBsW+Pzi6wV5Lc1ouDF34HMzQzoGPlw2zhKuA=;
 b=zTenA1WOiU2A5+Q1wt3KzMQX/3H1M4x4kkn4tdrVJSm/SIevxsj085QrHfeDzkoaI2VtNAfhpJr3dLd0SfKyi2EQ2LDbIciiCVIBoNXYkRO5xyLl6nlqbtJcfansx+4LGMd1NlPZCWadKh656oKwp5EK7SkOefemD/ltuYqa5s4=
Received: from SJ0PR10MB5647.namprd10.prod.outlook.com (2603:10b6:a03:3da::17)
 by SA2PR10MB4682.namprd10.prod.outlook.com (2603:10b6:806:110::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.15; Thu, 14 Aug
 2025 01:01:04 +0000
Received: from SJ0PR10MB5647.namprd10.prod.outlook.com
 ([fe80::8db4:df1d:6afd:e4a7]) by SJ0PR10MB5647.namprd10.prod.outlook.com
 ([fe80::8db4:df1d:6afd:e4a7%6]) with mapi id 15.20.9031.012; Thu, 14 Aug 2025
 01:01:04 +0000
Message-ID: <26f0b540-cda1-3f55-9317-3ebf639aa3dc@oracle.com>
Date: Wed, 13 Aug 2025 21:00:54 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [DTrace-devel] [PATCH 5/5] string: ensure string size is handled
 correctly
Content-Language: en-US
To: Kris Van Hees <kris.van.hees@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
References: <SJ0PR10MB56727E2012F343B19177481BC22AA@SJ0PR10MB5672.namprd10.prod.outlook.com>
 <aJ0NEMc2msMNKoRf@oracle.com>
From: Eugene Loh <eugene.loh@oracle.com>
In-Reply-To: <aJ0NEMc2msMNKoRf@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0201.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:318::10) To SJ0PR10MB5647.namprd10.prod.outlook.com
 (2603:10b6:a03:3da::17)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5647:EE_|SA2PR10MB4682:EE_
X-MS-Office365-Filtering-Correlation-Id: 882f5562-6c8d-43dd-1fca-08dddace0ada
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UFp3eFlTZ2hNYm8vdUs0UEo4VnpSalFjakw3K2pqTWZKZ0xBaW9QWXRVR0RG?=
 =?utf-8?B?UkZyOFNqNkFSNzhZQXJCNHNwVFg4dWdYNW9RUHJNME5jL0tWbU9UMkUyRG05?=
 =?utf-8?B?RitITTNyL3p5VnJzK0tvM0pXMTNWSmhnTTBlZlpCR21DYTF1cnRDYk1yRzJ6?=
 =?utf-8?B?UHBFd2J6L2V3RFZjSEp0bWlWVEFFMlZYOUgzRElrMFUycUM1dTl3NWpnUUJn?=
 =?utf-8?B?ekh5R3dzb3g1SXlFNlVxcEdBbVA4MVdGb2V1TkVuVXFKWGVrZ0t0Smp3SjNS?=
 =?utf-8?B?WVFXdTNLUDU1SVFkMENTQ3R5UWVuQ2ovb3JKNER0VjAwb29GbjFpRFJUaEFD?=
 =?utf-8?B?R1JTYnQ4bUZOaFlEUnJRd2hxL2o0MFRNQ0tSV1A3TW93TGtRbVdPU0FQYi9y?=
 =?utf-8?B?SWphQWlvdEVQRm1VdEhOU0YrL0h6QXlycmJpMkZPa0h1R3JSRnRiSlN5cXZs?=
 =?utf-8?B?THF4bnRXdDRLQm5VL2F5ZDA2d1ZkQzgyNXFTVzBDLzF4eUFacE9sdnNRMlRt?=
 =?utf-8?B?SUxBNUJhOS9YazFRZWFJZ241NU1ualRGdFY5L2x6Slp1R1VPUndUcWNTSVUv?=
 =?utf-8?B?ditZaERKRDloNzRjRjh4UTF2UXNQMHZqVkhFVWxnbVJmZVRDeUZlYVN6VkN3?=
 =?utf-8?B?K25qc3pVMmdTRjltai94d0FXcHpnZ1p1ZlA2VHVocmRYa0NoVytYNDFNaEQx?=
 =?utf-8?B?Z2lFMWtLZkNTTjZBa0hCRmFKL0NKUUhTUFdyZ2Y2U2orVlJDZlFMdFpQaURQ?=
 =?utf-8?B?VXJnQWxIa0tFZkJlSVoxbEtSdEdPNWw2OGQ0ejMrS2UrbVROR0NPRWh3U245?=
 =?utf-8?B?N3BZcTUwWExtRUVBQ0s0SWlHS09QTnNmRU8zUU5lZzJiMEduQmdlNEpFZTFM?=
 =?utf-8?B?UlpsTEg4TTNRT3hDRE44UjhBOEtuaEJQY1IvYWNWTEx2cmV2N1N1aEx1UXc4?=
 =?utf-8?B?cEh1T005ZlZtRUNNQ0FrbitkZWRaNjUweDBoOC9PTWZuYjJSM1JLMjRTakcr?=
 =?utf-8?B?aGs0Yml1UldPeUdDTDNrVVVxTTFsWjU0SHVtVk0xVzZ2MnNWajE5ZjBsLzBE?=
 =?utf-8?B?VWJiUUl0SVBpZGlmZWZpbTZIYVdSbUtBdTgzQ0tLQnV5NDVIZnRRNjd5Nmsx?=
 =?utf-8?B?b3lQRHFmT2tkN1FjM0RjeEZmSWZXcDBCTjQ0V05DN2xkcFhhSmkvb2ZCZjVQ?=
 =?utf-8?B?aHJhWG5kaFhXWmoyMDZxL0wrNFpuSG1vcXFwbXZqdzltTi9qZWdlcFJKQ2hZ?=
 =?utf-8?B?TWNaTlYyUDNaSU9GNitGL0E2WHpzL3FuNWdjRWYyWUxhT3k3UTN6L1pXYTNW?=
 =?utf-8?B?b3NVelhwYTNxV1VSVHE2WDI2SXhPQ3FxVVdQTWVMOVNXZE1LM3ZuU0duWk43?=
 =?utf-8?B?VnpGa3BsRE1mYjBOMlM2TFJsYWh4d3VtaS9oMnhUNnpVbW9iYkU1VEIzWmd4?=
 =?utf-8?B?UWwyOEdSaE95a1FOaUQzbTZiRWFkS2tsSFBQODVjb2RwaW9ZU1hkREwwWThG?=
 =?utf-8?B?SWVVMlhyM1IxQXd0V3BacFVGaUZ5eDJBS3Y5eHgrQlN2YUhnWEpqNEhjeStu?=
 =?utf-8?B?UldoMUp1UmR4ZXZ3cDdIenoyZ2lKM0p0T0xZdjRQZ2RzL3BPa3Byb0x2UW0v?=
 =?utf-8?B?dExaNTNUVEx5cnd4MDZ1YW5pOHMxNHRtWUUyelpuSHB2YThwL09VejlsbFRQ?=
 =?utf-8?B?OWhOeDg0RjJiS2RLRUxtdjJIWXl0aFFyTHZEOWx1WkFMS0RVaHJzTlJsUjFD?=
 =?utf-8?B?N3hUYXIraUNwSTVnNTRpWWgwYTJpYld3NVNoN1Z0YW1kRkhWVWVrTFZ5VEk3?=
 =?utf-8?B?WkhQbnNZZTVTWWxsVndXSTdwallCSmxqWUFRU2dmMWFTdVVCRm0reFlycEdv?=
 =?utf-8?B?RGJvem1pdG1SamRReFNKLzljWVlSNEU5ZzRpaEVnZkxjL01OTElQMzhZZGpl?=
 =?utf-8?Q?O94wV0s4ARo=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB5647.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZEZEZjkxN0JkbW51VzZrVU9QNCtXOExrbkE5dE9yQUExcXJnYTZnZVNOajVO?=
 =?utf-8?B?ZW51QTJ0VnBBZ296NzJ1Vzc0UzU3c0RGVk40Y2p3UWxiaVhsMjJybFhlM05B?=
 =?utf-8?B?S2liVW5ETFRPUHZxRUdUb016ajZDVkVNSnZjMzJORnVKZGk4MTlkbU1WeTVV?=
 =?utf-8?B?ZjE3VXJ5SjBoelJZbzRUUkwzSmpjMm1jZFNTb004aUJjUXhZZ01RYUZuRkJx?=
 =?utf-8?B?VVMxY3N1U1N0RzN2UmRYYVRTa2ZPdHlSZy9VN2JpSDdtNGU0ZkFXNTB4K1pO?=
 =?utf-8?B?MUkrTyt1Rkp4aDNqU2NrZGZWdmFkN3JIL3ZEdUx3ejk5MWl2ZTF1UzZZZ29a?=
 =?utf-8?B?dmVkcVB1ZDJtR2JZWm9nVW5QNzc2WGF3eU9FL2V0MXZZSE5BeGJNbDJQVmdy?=
 =?utf-8?B?YkEvQTMxUHFhRWJSWHN4VjVHR2gyOE9HZE1SalRSaVZsMUZJSjFQNkhkWmIx?=
 =?utf-8?B?Q1M5QjlDTnNyQkVpcFV5ZGNETW9iTG9XazRHeFVCbDRnNHJ6c2RHRGhnOUpq?=
 =?utf-8?B?WThlQ1ZPczdvR3ZiaVZKNjRINTJvNEkxelM4TzJNWWZoZFdOVmxZQS8wY242?=
 =?utf-8?B?Tkdvb1dqTkRFZTV0TzZtUFJWME10S21XSDZGcE1hUUlFZXNVWUNjT3V6N0ll?=
 =?utf-8?B?TEdTUTJIWXhaOWc5U2J3TXVDcXRaQnBKQlN2RUZuY1ZvN1ZOeUhvSUhPck5F?=
 =?utf-8?B?a1NQZkIvdjFNWXFOUFZMVzNDSVVEN1Q0TDk4R3RJNWNOMWptaTFpak10c3E1?=
 =?utf-8?B?bkRHb3huK2ZMRWZUM0JlWXdCbExPNUZocE1pZm5hQlVPSG5uSmh2VkQvRWgw?=
 =?utf-8?B?eGg3bitsMWpnQVBzK1lOdDNUTllYdlZ4eDNNY1UrRk4zYmtGcHFrZWREOTVu?=
 =?utf-8?B?OVozUGcwUUVmYUo5VVRSbzNEb3NyNkgxNHhXVC9IclNEK3hNZlBpL2JqK0FM?=
 =?utf-8?B?ZnQxRk9EQm9INVRTVlVEWlVBVzZBM2VLWnAxVTB0cS9qMHRBd01UL1o0d0lN?=
 =?utf-8?B?R09kcVpwZTlhVjFtUUorV2xnZFIzRjJOd2E5Z0hVdnI4RlowOVIxOGtYSzll?=
 =?utf-8?B?OWpnbE44TDg5T3VhZEhoS1c0YTNNdzBBQXduR0w5NzZHRmhMWDdhNDE2OGVh?=
 =?utf-8?B?ZklVVStkVVc5QlFYTUtXd3NsQXJzaXBLT0xOOFdkR1dzR080dHA1eTU3NzBW?=
 =?utf-8?B?WVlSNVFMMVp2SXpHR3grd0xLRXNDSmhjZGhtS0xhSTlhakw3TUFkWDd6UllZ?=
 =?utf-8?B?azRYZEVFRWFLb2hVNERmcGRmOG5oREpTYTZKR0xHcTk5OUJVcVZoLy9VM1M3?=
 =?utf-8?B?V2NuOVZEQnJDaXFlek84a2ZUL1VoTkNPNkVzMWVscitYcUpPTEs0VzB4YnpR?=
 =?utf-8?B?WkF5SUVpQW12Z2VGVW5LcGdRdmRlRW5LRDZDTFZhRWF1WXlGbzZQQjg0ektV?=
 =?utf-8?B?MTdRYnNXTzkxZll0bXNWUlJRaDRZVW15WENpUU5uOTcxUDRtTThMTW8vckV0?=
 =?utf-8?B?SUY4c0ZHYTRnYXF0ZVpZam9HMkJtL3BOQTdWNldHVXJQOTN5QXhGNGtGSVox?=
 =?utf-8?B?ZU8vV2xycmxKQjZVWXFoYkdEeU5CQUx1WGdaREV4U3hDdGQwM0E3UDkwVW1l?=
 =?utf-8?B?K2RtV0xWZ3F4d1pqWjBwSTl6OFUzMnBiMk5aS2VBUU1VQUZxZXRpSmRJcSt4?=
 =?utf-8?B?YW9SeFFGR2NtZDR2QXhvWXZtWTBFbk9iZVAvMWI3dTZNcms3TXpsQklNaG1K?=
 =?utf-8?B?ZkpERkVzV3dpTFNpMktjU0hCVTZHRk1EMmQzeG5NM3pXM2gwT2o1aHV4MWgz?=
 =?utf-8?B?RmtlM2Q2ajZwTFJmOXdpRndqdEppaFRwSENjaEZYN0ZsNXJHSmI2Z25UUmM3?=
 =?utf-8?B?T0FFaVRjODJ1Z09rRGV6WVpFb0pGVmlEMW1Gb1BFdjlROEJ2UUVHbWI2eXhp?=
 =?utf-8?B?VUFmemJJNUhHck9qZGUwalkxR0pqV3ZpUjFhTGtQN0NmQ0g2T3ZHbHZTellW?=
 =?utf-8?B?SHlVN3NlMWlwQnZuWEhZVWNpYmRZSjZyR3AvVFd6Ny95cTAraHZLS3UwS3RK?=
 =?utf-8?B?QWV1SXZwSGxYWWFKbThnYTF2anBERDVuVEU4d01MWUFDWnBlS3lSZ05Kazh5?=
 =?utf-8?Q?WpQIjmDEr2hm1aU4L/E2bwUBy?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	ugVLIzVjyB/zNFkrrZNBeHC6trNIOoJSoiX016Xz9ZqZlsUwpUWSNOVvLtNZnkRpnMsGI5c3lNIuE3+gO/e7Qm/3sZAcEyoeN08/97v3OvdGDBPbb3Q8jKSVwaqH3IK8hUPrSnZwJEIrijOMFOjOy4C7O/wEyg+PlH1I63QEEu2ILYYhxPpZdl+uXEWg5rwZsoTzEyma0FuZf+jxQQNWV4dVfd5N2kFX4+JLcR1r8FRLD1B7k7p395Wyow0mYHDKtXkMJ6dfAv9Od3PkxAmk6uYKvihPoehOtZwUB4trRCkXvKCrjIOONFMyt2+1mH/U3n3YlAmw5S2nJBO+kurhtlInEeETrhf68eTlxwXLxXqjA1026FKPsUPDqHZgOY1232+tlV5elQ+TY+ZutlO4jVdW4Xx73Iu0I5ZOnMShYSWwDxfg/N8J038OuEef6AzpcE593B6qbfmQjCWlPAGp3u1CxjaOPVDeZEm85v3NFuY4GoHeKmQ7nnBbOGwJmWNhLIJUdc8b2P5jWv9vrfRDJXIoMp4aESrJhYKJBioC2i07x9y/yoFqdyvrdyGOqzHU9DbSuDBJ8yqHkZ4DN7clTyq0rlacwjfBBB8+oMWuF/8=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 882f5562-6c8d-43dd-1fca-08dddace0ada
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB5647.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2025 01:01:03.9447
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: c6gFnZYybrmB62d7QOX7NFKM0SKHQtFu20gOOTCVyWziZ7LfVvYuFh8grYUSDky2m/yttAB9DBuFRI6ZnL0BQQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR10MB4682
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-13_02,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 mlxscore=0 phishscore=0
 spamscore=0 suspectscore=0 mlxlogscore=999 adultscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2507300000
 definitions=main-2508140005
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE0MDAwNiBTYWx0ZWRfX7q7cfAaFSJgI
 BicuhAW1j0za4gzpFVqwq5L9U4IImCgEVs1Aj4MPfn7AFb0Qcf+0J4WD5AmYwxX+5HUJCWUREnI
 UoVaKUBkKbACyT0wa/QvHJlSv+z+YqbDs1j4HlBM96uzxuaL2aTaFCCNDHy45AeJTuUFccqCRcF
 pLCo3TFPoXFp0Yr+GH57R06K75PvHUr7wVM23wvdMa2axTA6AshT4de2WCrBhfoMY5n5ZVqWqXc
 j5cMmfWaeIqpnJOON7au9YFS/0/nxsFofHhYKzW+3qIo26yLTZUUgIb0JT/HKyC8XKJ/4bLdqwU
 R+YV+EcVchPV9nMz5Y0PZKrm+lnLiI6/JPMduj3/X9XmpBlDzIgerP7k879PaaddvZTwypAG95D
 Q1i+sdAmyg9A25D2gSDqO1Lo3r9oln1Hh+qS8NogEDZCKEKDYChbjH08pWLzzZxLWssn5XLR
X-Authority-Analysis: v=2.4 cv=eIsTjGp1 c=1 sm=1 tr=0 ts=689d3555 b=1 cx=c_pps
 a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=FNQEmvyvX0amp-lJfpgA:9
 a=zaDm8kx9EmDbiU77:21 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 cc=ntf
 awl=host:12070
X-Proofpoint-GUID: kCqymvrh6CwkYjR12M6hBqKPW98pwTvP
X-Proofpoint-ORIG-GUID: kCqymvrh6CwkYjR12M6hBqKPW98pwTvP

Cool.  Can the v2 change s/strsuze/strsize/?

On 8/13/25 18:09, Kris Van Hees wrote:
> A v2 coming soon - I needed to cover a few more cases of tests that I failed to
> notice.
>
> On Wed, Aug 13, 2025 at 11:57:33AM -0400, Kris Van Hees via DTrace-devel wrote:
>> A string is defined as a character array of size strsize.  Strings
>> that are less that strsize in length are terminated by a NUL byte.
>> This implies that the NUL byte is part of the array and therefore,
>> strsuze is indeed the size of the array and not the maximum number
>> of characters in the string.
>>
>> Tests are adjusted to reflect this behaviour.
>>
>> Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
>> ---
>>   libdtrace/dt_cg.c                                     | 11 +++++------
>>   .../funcs/inet_ntoa6/tst.inet_ntoa6.strsize_10.r      |  6 +++---
>>   test/unittest/funcs/strjoin/tst.strjoin-bordercases.d |  2 +-
>>   .../funcs/strjoin/tst.strjoin-capped-size-2.d         |  2 +-
>>   .../funcs/strjoin/tst.strjoin-capped-size-3.d         |  2 +-
>>   test/unittest/funcs/strjoin/tst.strjoin-capped-size.d |  2 +-
>>   test/unittest/funcs/strjoin/tst.strjoin_nonDPTR.d     |  2 +-
>>   test/unittest/funcs/strtok/tst.strtok_long.d          |  4 ++--
>>   test/unittest/funcs/strtok/tst.strtok_long.r          |  4 ++--
>>   test/unittest/funcs/substr/tst.substr-stored-len.d    |  2 +-
>>   test/unittest/funcs/substr/tst.substr-strsize.d       |  2 +-
>>   test/unittest/funcs/substr/tst.substr_nonDPTR.d       |  2 +-
>>   test/unittest/funcs/tst.basename_nonDPTR.d            |  2 +-
>>   test/unittest/funcs/tst.inet_ntoa_nonDPTR.d           |  2 +-
>>   test/unittest/funcs/tst.lltostr-short.d               |  2 +-
>>   15 files changed, 23 insertions(+), 24 deletions(-)
>>
>> diff --git a/libdtrace/dt_cg.c b/libdtrace/dt_cg.c
>> index 88dddb087..cd9e7f4e9 100644
>> --- a/libdtrace/dt_cg.c
>> +++ b/libdtrace/dt_cg.c
>> @@ -1741,11 +1741,10 @@ dt_cg_store_val(dt_pcb_t *pcb, dt_node_t *dnp, dtrace_actkind_t kind,
>>   			dt_cg_check_ptr_arg(dlp, drp, dnp, NULL);
>>   
>>   		TRACE_REGSET("store_val(): Begin ");
>> -		off = dt_rec_add(dtp, dt_cg_fill_gap, kind, size + 1, 1, pfp,
>> -				 arg);
>> +		off = dt_rec_add(dtp, dt_cg_fill_gap, kind, size, 1, pfp, arg);
>>   
>>   		/*
>> -		 * Copy the string data (no more than STRSIZE + 1 bytes) to the
>> +		 * Copy the string data (no more than STRSIZE bytes) to the
>>   		 * buffer at (%r9 + off).  We depend on the fact that
>>   		 * probe_read_str() stops at the terminating NUL byte.
>>   		 */
>> @@ -1754,7 +1753,7 @@ dt_cg_store_val(dt_pcb_t *pcb, dt_node_t *dnp, dtrace_actkind_t kind,
>>   
>>   		emit(dlp, BPF_MOV_REG(BPF_REG_1, BPF_REG_9));
>>   		emit(dlp, BPF_ALU64_IMM(BPF_ADD, BPF_REG_1, off));
>> -		emit(dlp, BPF_MOV_IMM(BPF_REG_2, strsize + 1));
>> +		emit(dlp, BPF_MOV_IMM(BPF_REG_2, strsize));
>>   		emit(dlp, BPF_MOV_REG(BPF_REG_3, dnp->dn_reg));
>>   		dt_regset_free(drp, dnp->dn_reg);
>>   		dt_cg_tstring_free(pcb, dnp);
>> @@ -1765,13 +1764,13 @@ dt_cg_store_val(dt_pcb_t *pcb, dt_node_t *dnp, dtrace_actkind_t kind,
>>   		/*
>>   		 * Pad the rest with zeroes, if necessary.
>>   		 */
>> -		emit(dlp,  BPF_BRANCH_IMM(BPF_JGE, BPF_REG_0, strsize + 1, lbl_ok));
>> +		emit(dlp,  BPF_BRANCH_IMM(BPF_JGE, BPF_REG_0, strsize, lbl_ok));
>>   		if (dt_regset_xalloc_args(drp) == -1)
>>   			longjmp(yypcb->pcb_jmpbuf, EDT_NOREG);
>>   		emit(dlp,  BPF_MOV_REG(BPF_REG_1, BPF_REG_9));
>>   		emit(dlp,  BPF_ALU64_IMM(BPF_ADD, BPF_REG_1, off));
>>   		emit(dlp,  BPF_ALU64_REG(BPF_ADD, BPF_REG_1, BPF_REG_0));
>> -		emit(dlp,  BPF_MOV_IMM(BPF_REG_2, strsize + 1));
>> +		emit(dlp,  BPF_MOV_IMM(BPF_REG_2, strsize));
>>   		emit(dlp,  BPF_ALU64_REG(BPF_SUB, BPF_REG_2, BPF_REG_0));
>>   		dt_cg_zerosptr(BPF_REG_3, dlp, drp);
>>   		emit(dlp,  BPF_CALL_HELPER(dtp->dt_bpfhelper[BPF_FUNC_probe_read_kernel]));
>> diff --git a/test/unittest/funcs/inet_ntoa6/tst.inet_ntoa6.strsize_10.r b/test/unittest/funcs/inet_ntoa6/tst.inet_ntoa6.strsize_10.r
>> index 5e7d49b03..8090daad6 100644
>> --- a/test/unittest/funcs/inet_ntoa6/tst.inet_ntoa6.strsize_10.r
>> +++ b/test/unittest/funcs/inet_ntoa6/tst.inet_ntoa6.strsize_10.r
>> @@ -1,8 +1,8 @@
>> -fe80:7060:
>> -1080::808:
>> +fe80:7060
>> +1080::808
>>   ::1
>>   ::
>>   127.0.0.1
>>   127.0.0.1
>> -::fffe:7f0
>> +::fffe:7f
>>   
>> diff --git a/test/unittest/funcs/strjoin/tst.strjoin-bordercases.d b/test/unittest/funcs/strjoin/tst.strjoin-bordercases.d
>> index 253b2d6ef..1ac5ffd12 100644
>> --- a/test/unittest/funcs/strjoin/tst.strjoin-bordercases.d
>> +++ b/test/unittest/funcs/strjoin/tst.strjoin-bordercases.d
>> @@ -6,7 +6,7 @@
>>    */
>>   
>>   #pragma D option rawbytes
>> -#pragma D option strsize=5
>> +#pragma D option strsize=6
>>   #pragma D option quiet
>>   
>>   BEGIN
>> diff --git a/test/unittest/funcs/strjoin/tst.strjoin-capped-size-2.d b/test/unittest/funcs/strjoin/tst.strjoin-capped-size-2.d
>> index 625c786b6..44a6acd88 100644
>> --- a/test/unittest/funcs/strjoin/tst.strjoin-capped-size-2.d
>> +++ b/test/unittest/funcs/strjoin/tst.strjoin-capped-size-2.d
>> @@ -6,7 +6,7 @@
>>    */
>>   
>>   #pragma D option rawbytes
>> -#pragma D option strsize=6
>> +#pragma D option strsize=7
>>   #pragma D option quiet
>>   
>>   BEGIN
>> diff --git a/test/unittest/funcs/strjoin/tst.strjoin-capped-size-3.d b/test/unittest/funcs/strjoin/tst.strjoin-capped-size-3.d
>> index 52718325a..d2982a70b 100644
>> --- a/test/unittest/funcs/strjoin/tst.strjoin-capped-size-3.d
>> +++ b/test/unittest/funcs/strjoin/tst.strjoin-capped-size-3.d
>> @@ -6,7 +6,7 @@
>>    */
>>   
>>   #pragma D option rawbytes
>> -#pragma D option strsize=6
>> +#pragma D option strsize=7
>>   #pragma D option quiet
>>   
>>   BEGIN
>> diff --git a/test/unittest/funcs/strjoin/tst.strjoin-capped-size.d b/test/unittest/funcs/strjoin/tst.strjoin-capped-size.d
>> index fe5b323f7..b54fd2f29 100644
>> --- a/test/unittest/funcs/strjoin/tst.strjoin-capped-size.d
>> +++ b/test/unittest/funcs/strjoin/tst.strjoin-capped-size.d
>> @@ -6,7 +6,7 @@
>>    */
>>   
>>   #pragma D option rawbytes
>> -#pragma D option strsize=10
>> +#pragma D option strsize=11
>>   #pragma D option quiet
>>   
>>   BEGIN
>> diff --git a/test/unittest/funcs/strjoin/tst.strjoin_nonDPTR.d b/test/unittest/funcs/strjoin/tst.strjoin_nonDPTR.d
>> index a1816f975..2b700a5a8 100644
>> --- a/test/unittest/funcs/strjoin/tst.strjoin_nonDPTR.d
>> +++ b/test/unittest/funcs/strjoin/tst.strjoin_nonDPTR.d
>> @@ -6,7 +6,7 @@
>>    */
>>   
>>   #pragma D option quiet
>> -#pragma D option strsize=14
>> +#pragma D option strsize=15
>>   
>>   BEGIN
>>   {
>> diff --git a/test/unittest/funcs/strtok/tst.strtok_long.d b/test/unittest/funcs/strtok/tst.strtok_long.d
>> index 1fbe415dc..254a65485 100644
>> --- a/test/unittest/funcs/strtok/tst.strtok_long.d
>> +++ b/test/unittest/funcs/strtok/tst.strtok_long.d
>> @@ -9,8 +9,8 @@
>>   
>>   BEGIN
>>   {
>> -	/* 256-char string ending in "XYZ" */
>> -	x = "_____________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________XYZ";
>> +	/* 256-char string ending in "XYZ" (255 chars + NUL byte)*/
>> +	x = "____________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________XYZ";
>>   
>>   	/* check whether the last char of a long string is seen */
>>   	y = "a";
>> diff --git a/test/unittest/funcs/strtok/tst.strtok_long.r b/test/unittest/funcs/strtok/tst.strtok_long.r
>> index a752554e8..4b172ca1b 100644
>> --- a/test/unittest/funcs/strtok/tst.strtok_long.r
>> +++ b/test/unittest/funcs/strtok/tst.strtok_long.r
>> @@ -1,5 +1,5 @@
>> -_____________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________XYZ
>> +____________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________XYZ
>>   zyxwvutsrqponmlkjihgfedcba
>> -_____________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________XY
>> +____________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________XY
>>   Z
>>   
>> diff --git a/test/unittest/funcs/substr/tst.substr-stored-len.d b/test/unittest/funcs/substr/tst.substr-stored-len.d
>> index 97d2b0f61..fa3e5337c 100644
>> --- a/test/unittest/funcs/substr/tst.substr-stored-len.d
>> +++ b/test/unittest/funcs/substr/tst.substr-stored-len.d
>> @@ -13,7 +13,7 @@
>>   
>>   #pragma D option quiet
>>   #pragma D option rawbytes
>> -#pragma D option strsize=13
>> +#pragma D option strsize=14
>>   
>>   BEGIN
>>   {
>> diff --git a/test/unittest/funcs/substr/tst.substr-strsize.d b/test/unittest/funcs/substr/tst.substr-strsize.d
>> index b4d0cc63e..04eab4297 100644
>> --- a/test/unittest/funcs/substr/tst.substr-strsize.d
>> +++ b/test/unittest/funcs/substr/tst.substr-strsize.d
>> @@ -15,7 +15,7 @@
>>   
>>   #pragma D option quiet
>>   #pragma D option rawbytes
>> -#pragma D option strsize=13
>> +#pragma D option strsize=14
>>   
>>   BEGIN
>>   {
>> diff --git a/test/unittest/funcs/substr/tst.substr_nonDPTR.d b/test/unittest/funcs/substr/tst.substr_nonDPTR.d
>> index 9d847ab6f..3e10af08e 100644
>> --- a/test/unittest/funcs/substr/tst.substr_nonDPTR.d
>> +++ b/test/unittest/funcs/substr/tst.substr_nonDPTR.d
>> @@ -6,7 +6,7 @@
>>    */
>>   
>>   #pragma D option quiet
>> -#pragma D option strsize=13
>> +#pragma D option strsize=14
>>   
>>   BEGIN
>>   {
>> diff --git a/test/unittest/funcs/tst.basename_nonDPTR.d b/test/unittest/funcs/tst.basename_nonDPTR.d
>> index 4f93685f7..cecef827b 100644
>> --- a/test/unittest/funcs/tst.basename_nonDPTR.d
>> +++ b/test/unittest/funcs/tst.basename_nonDPTR.d
>> @@ -6,7 +6,7 @@
>>    */
>>   
>>   #pragma D option quiet
>> -#pragma D option strsize=14
>> +#pragma D option strsize=15
>>   
>>   BEGIN
>>   {
>> diff --git a/test/unittest/funcs/tst.inet_ntoa_nonDPTR.d b/test/unittest/funcs/tst.inet_ntoa_nonDPTR.d
>> index 500c53e86..f079c7ef4 100644
>> --- a/test/unittest/funcs/tst.inet_ntoa_nonDPTR.d
>> +++ b/test/unittest/funcs/tst.inet_ntoa_nonDPTR.d
>> @@ -6,7 +6,7 @@
>>    */
>>   
>>   #pragma D option quiet
>> -#pragma D option strsize=14
>> +#pragma D option strsize=15
>>   
>>   BEGIN
>>   {
>> diff --git a/test/unittest/funcs/tst.lltostr-short.d b/test/unittest/funcs/tst.lltostr-short.d
>> index 969045667..65a5714c2 100644
>> --- a/test/unittest/funcs/tst.lltostr-short.d
>> +++ b/test/unittest/funcs/tst.lltostr-short.d
>> @@ -6,7 +6,7 @@
>>    */
>>   
>>   #pragma D option quiet
>> -#pragma D option strsize=7
>> +#pragma D option strsize=8
>>   
>>   BEGIN
>>   {
>> -- 
>> 2.45.2
>>
>>
>> _______________________________________________
>> DTrace-devel mailing list
>> DTrace-devel@oss.oracle.com
>> https://oss.oracle.com/mailman/listinfo/dtrace-devel
