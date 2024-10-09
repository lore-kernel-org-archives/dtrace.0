Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07BA638DD3
	for <dtrace@lists.linux.dev>; Wed,  9 Oct 2024 04:58:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728449900; cv=fail; b=lptjYgQRjwosbSml51oJEVs9lggK44piyeC/K43uB/p/y0kx0C/5wAdgMWRduVyOLZUBV4QQjgqt/D5H2k5PrFZ77joaPrc6eKCBWxGs/vZUbZ930reNOrHEn5E+bSb3cEvbpwaf3wAmtF/ZqR6NWeR4o9eRMjQqGm0NPPVSuqs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728449900; c=relaxed/simple;
	bh=7gIXNhJrEJxh+ODPIrNMyM8tuJdRooOKTZflWOdklzQ=;
	h=Message-ID:Date:Subject:From:To:References:In-Reply-To:
	 Content-Type:MIME-Version; b=qR4VtjetqEWVmqrBQjEqDNQZr78Hms27STgdUANbZtB2BciZI2W4UT4J1w+ywYaIPVq8BNPy+kuB4x8Apixa+5wvEzUKUr7DvX4oco/llw3E1xVUWqTronKTtWOJqVixk/0KMXVqNG04KkVmhQHj2AfB7NUvdfLUrcq2fiT2x94=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=eKRJiiVM; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=eHmfkNw3; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="eKRJiiVM";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="eHmfkNw3"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4991tdR5032735
	for <dtrace@lists.linux.dev>; Wed, 9 Oct 2024 04:58:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=PpzD+I7ThYim4a8hX4WT+lY2R4EYMPEJXFw+jXyGghc=; b=
	eKRJiiVMXTCmpmSbsC1uzFax/C1Jmj+/faV/3rBPMk0lBb3xSHlXdknb/1/94cCY
	bdcHZZoN2xzeILoiMXVKV+RVdEgDMqOux8fSGwZAmahLDmQ07ONIvsk41Gn0KJp9
	LFaQ+IfhRA11aUyxkP7qhV3byjC6VrEaNzQwkmpfbXj/kyO/cz6XRJ/HLPTduDQq
	RNv/D7aCKSEfeXsGN0SRLPquIKHgWvQeoW/sllBbiaxOw9hatV9WH8aLksx60anT
	hrBn0f7L2uf2gdvrarmivLpBWJx2Uh5iAmn8MoD1vdYwl//y3sSY1j+RmbHONqt1
	/I4RAxNegSwF4IVj0+Xqsw==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 423034qj25-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 09 Oct 2024 04:58:16 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 49930Sub015320
	for <dtrace@lists.linux.dev>; Wed, 9 Oct 2024 04:58:15 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2049.outbound.protection.outlook.com [104.47.66.49])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 422uw82fn0-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 09 Oct 2024 04:58:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C0l5VIBKHTtfo4v+7Bh6O4FoXp987XeaVGa+KtaGwqJhNcfKWPfFbKwV+qd3FwCVs7Bm5wIcpH63q6qGan5sF+FXXGXQuwf9cxMrsWA8CQC3cBVFLRM5bQPk+nA6XZuleI6CS+DuqskrZJpuBBOnRsju+e7KAgfFcvk4hSKmPK5WU9OpApQI4e822FmNMFSC6eS/mzYCVIQp3qAhOXCDBHu0+1Mh5uWMgc9bqkgnuluZu4d6OjX/b/GHvNMTBbuLPbvqp7HjYy+M0QW9QSI1AB1Zx+QP8zX0H9jiLe7c2/f4OAploHX1gZgmiQ7Acnozxuc4BG89C5OrwrXcVX/fVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PpzD+I7ThYim4a8hX4WT+lY2R4EYMPEJXFw+jXyGghc=;
 b=sCfK9Wm47QdvXrh6Jk50jcS5ASUVu9N8qH+HuPEQB4doUNx4Decc3vJLGEUCdZK0UX5kBYbZI7FDk+iUIYtBKy6xPMbnEf1pM0qpWhLJ3eytoUF7xXG1RJFphf0VdBKlwb5J8Fa7KSStxU8Kaf6OlFfKv6A18IcT61GxC1s5Ove9PmwQrAp8InjxnMhgVUn5ysLLPBC/ls+Z1q2WM5kJE/ZJpqLxubZ3n+E+FWvb1IVEFI5hysR95yNTvkAheRykjpscYasRNKI5LswQAsaqQXvnVFhuAK2ub0eUA13ilMdfKeU6frhxvg5xfibs+mJV+BmmkeRw3uu1VbQ1hocYTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PpzD+I7ThYim4a8hX4WT+lY2R4EYMPEJXFw+jXyGghc=;
 b=eHmfkNw3N8XMKl2F8UpKA350vXNU+UzqsUaTwE+tE2ml9BVzumluEisZjJgCvczKbwomOWy4ayb5uJNBP2HptuU7dWZgy7XOUzJNaVQNhaDmZxzwWJH04s+aYaNMZT5WOhpq/fCb2S6IM3seUpGjhiGvm7dSfVdsiZ+oMqjMuZs=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by PH0PR10MB4696.namprd10.prod.outlook.com (2603:10b6:510:3d::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.23; Wed, 9 Oct
 2024 04:58:07 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%5]) with mapi id 15.20.8048.013; Wed, 9 Oct 2024
 04:58:07 +0000
Message-ID: <0e5425e8-1470-7f23-514e-293d47aa7a4c@oracle.com>
Date: Wed, 9 Oct 2024 00:58:03 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [DTrace-devel] [PATCH v4 07/19] Create the BPF usdt_prids map
Content-Language: en-US
From: Eugene Loh <eugene.loh@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
References: <20240928021525.8987-1-eugene.loh@oracle.com>
 <20240928021525.8987-2-eugene.loh@oracle.com> <Zv4lwups32GXQsr2@oracle.com>
 <5cae817c-e793-c56a-209b-1b40d320c39e@oracle.com>
 <ZwQDy3K+BJw6NYRk@oracle.com>
 <acf9e8aa-1d28-8fd5-1092-f8f6b799b821@oracle.com>
In-Reply-To: <acf9e8aa-1d28-8fd5-1092-f8f6b799b821@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BN9PR03CA0986.namprd03.prod.outlook.com
 (2603:10b6:408:109::31) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|PH0PR10MB4696:EE_
X-MS-Office365-Filtering-Correlation-Id: 52a78bc0-eb38-402d-a106-08dce81ef72a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?b1Y2Y3VrcW5YUWhMS1dkM1NFcjNtQ2RzQmlXV2Y2Syt4U1JkcnRMaVQ0UUxq?=
 =?utf-8?B?MUk4Wk95UExIdnJTMGRFVWM4QTZBeE00Wm1JQ3RSaXZ5VTE4UENoSkpYQVpV?=
 =?utf-8?B?bFRITXd3VmlBNFJQRzhHSi9rYTFRSExqb1RBL2t4QXFvYVpZNVErUHMrQmVH?=
 =?utf-8?B?ZXJ0WGdydzVVaTdoOEMrM0JTRUZRak5JVHMwSFUzQis1ZjdnMHZBMnE0eldL?=
 =?utf-8?B?eTVGK2dYMnV3cVhLd2NjZzdZRm5abHRyOWN5WmVhOUJGcGs1U3J6ZzZYUXdF?=
 =?utf-8?B?VVpxMWVTaWJLYkpnKzRjb2t3ZDlKclNieVdNUXJlKzR0REZESDJSc0F4S09s?=
 =?utf-8?B?b09lQ0orT0oyMlRtRWk3cTBPL0J3UDJLZXZyZGNwWGVITTlIbVAyZDZaUHll?=
 =?utf-8?B?RVkzd1ZqUm55STVkY2orMXRvUGc4Yml2ZGQzS1BqT2hLc3R3MjdTa1BoWlQ1?=
 =?utf-8?B?NlVMQzJ0TFBENzVjK2lZRGJ5dGowODg5L1lFckdkRlhLaUdJRG5SQjZ4UVNO?=
 =?utf-8?B?NHRmNFQvYmdGdU0xL3IzTWpzYVJsVmF5bFpVZW5tN1RjTUp0c3BEUVU3U3Nm?=
 =?utf-8?B?eEZ2MElWMWZLVlZnS2Q5TUg4UHUwYTFaN0pBekhxd2pJcVZ6YlpYYnc5RDNp?=
 =?utf-8?B?MjVUUWMxdzM4ZmQ0N3JHY0VFRVd1WnJCU0p1UklydUxqZ3l1ZkxqWDloU3FQ?=
 =?utf-8?B?VFFJQ0tIOVl5QWlkSlRZdDBHdU1yYThaL2ZNNGhwUXNGQlFyUnNrSEh6dnM2?=
 =?utf-8?B?R2hMUjZRWWJhbW4yUmswTzlsbDBGZVF0K2lTbjNLbFI1Y3AwRmg4NjFzUFpl?=
 =?utf-8?B?N096Vy9POXpXOG80NlE2THZKLzV1OEZjeHVCSHB2ZzZGb2lSSWdPaEs0MnpC?=
 =?utf-8?B?TnFUYXRZcnRpSTRpMW5sR3lFZXhuOUQzYUZiS2hISnc1U08rUlBRM3M1M3BB?=
 =?utf-8?B?ZG9aWmVKM29FZnE4UThidVVETWhyT1B3TE5vRzJ0a1M5R05DOUZXTVlTbW9j?=
 =?utf-8?B?U0F1RjFxQXdad3ZRd3FiWVk0ZytHbWtRRGxRaU1PNTV6V0NoUWhaUzF5a3Bv?=
 =?utf-8?B?VVFkNnNUYmJCVCs2UTFpT2dDWFlRdGxXYnJQT0RyWnYyTUd4OGlnVUdjZWwz?=
 =?utf-8?B?a3drZitETm4zTCtoamc3amFENlk0ckx5dE1lRGVVa2VwRjZTWGxicDExRG1l?=
 =?utf-8?B?c2VDNy9NallDYVVmdWViUmZXM1orVDJnZnh4c2xaQ2RCZFcrQXhtNlpvZ0VR?=
 =?utf-8?B?bHovZmxjTDl2ZTZHek9yL2pzZ3NFMTRyWEdyL29QcWU5T0V5OXRTTC9QOW1M?=
 =?utf-8?B?VTk2dGt2dC9SWkpPYjJ1cEtPdlM3N1EzTFpaTmdPYUVsUzhSV2c3SWtnZ0Yx?=
 =?utf-8?B?azdURGpybzhOMGowbDQyakQ1d252SjNTN000TGtibTBBRmI3T25jUFZPLzgv?=
 =?utf-8?B?Y05oVHZlUktFKzFad1k5TWd5NVgrdFNvQzJxZXN4WUdaV2ZlMXB5eWd1WHlC?=
 =?utf-8?B?SjBkMGovZEoxa1FaT0NkQmxpcFZsL0J3Y09CTFNEdEtyV1pqcUtsdlNvVVBZ?=
 =?utf-8?B?QytNSGhsd3dRYkZoMXJ0TUJPOEMxZFFNTWljQm84TmMyMCtENWFFR2hZM1oy?=
 =?utf-8?B?cm14UlNHWmxLcDNONGJQVWlxRFVwY2xZV2NBNUNreFNwMHB2RTBidjJqc1lu?=
 =?utf-8?B?TEhiYm54V2FuK25CeEdkTFFlb01CdDZ4a0x5NTVHSjE5RjBUbVloUFF3PT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Szl2V1VJK2tWQ215c3JEYVFWeVlOUFZGS2xXNk1uaWNYZEoyUWN4Q3Z0MVFJ?=
 =?utf-8?B?VGNhS2tLYXNvZ0F4NjhTb0hQdEdWK0M5N2Q0bUNmbS8vYjZBd2ZZZ1J0V0h4?=
 =?utf-8?B?SzVOMnBpZmJpL0RCUkxDZC9PUms2QVYvZDRTL1BPTEMrZ3MvSW92MFVuUXlF?=
 =?utf-8?B?K1JjcEZGeGFUYWg4cDhwaEYyWElQTUxOSHhobjM1U25HdFVPaWRqdzdZdVQ3?=
 =?utf-8?B?Ry9WQ2NuWm9HL1B5ZzAwRjF1aGd0cW1zM3h0TmdhKzdLdGdXNTdKL05YbzFV?=
 =?utf-8?B?a21MMGVubWVyYmZFNWxTY1RhSXNsd3M2cVJsWW1zMU5Pb3NuWkJJRGlqU1Rj?=
 =?utf-8?B?VDI2YzFETkVFS0FRbUd1MkNOL1JjRHBFR1BNVXpPTEo1SmxxUW1OT2RETGpk?=
 =?utf-8?B?dXIrSXN2dFlSS1dFRW1IeVpNdWFaQXpNWkhzWUNTY0RvNThMQWJvTmFQeHdp?=
 =?utf-8?B?UEFuTlR0ck9hdG1MMThlaXN2RnlHVEJtYlNjQXZnZWIrQlViYzAvMy9NUmRz?=
 =?utf-8?B?MWhjaXQ1NUNIaHJpNWFuWHMzSzY5cDhvWi9mcDBRODU3RXBiV1BGMEt6M0Rn?=
 =?utf-8?B?eUpiOEI4Z3BsNGhnSVB1T2dBWXNzWTd2cmNRZjA2b3JoYTA3TllKL1pHOE9v?=
 =?utf-8?B?TGFZOTZGcUpURXVva2JYNWdGQ3pLa1o1eC9DYVRBQjM2VUtTZXVhZ2hHa253?=
 =?utf-8?B?V0FWYmo0eVg2ZWsvRDZvUVVMNDJmaDZNV0tuWnpFdjB4V1BMUUNkVTBHcG9k?=
 =?utf-8?B?cndYdkczQlJ1NFhpZnNaTEV1N2dqY0ZhWFplQUFGL3l2SjZwNXk3dnp5ZldR?=
 =?utf-8?B?ZEsyWWlHWE1FOSsxcWFoRk9NSUtNMmJRTXZPaXk2OUpVMmo0dFc3Z0h3N2U2?=
 =?utf-8?B?UFFlQU9QVXg4UktJaWYrV284SGZmNlJFUzdwaTVKOUFkVi9JNFlHUVZqV3FJ?=
 =?utf-8?B?YlNVWTFDVHdqSC92VjJTRncxSlBxZGJQNEF1SktsUm5GU0o5WU41V21BNDNK?=
 =?utf-8?B?TzRxZTJEZk82bS91VmFyaE5LbE5DS0E0dldua0NYMHBrSkswZzZRTFJSZytv?=
 =?utf-8?B?bWxkK2QveWRXaUoycGxLbWJ2SFZ3TU1NSUxpTlZKQ21IVzdUekJHZGM0Lzdy?=
 =?utf-8?B?emt1QzIyZEZTUXMyOTEyYmhnWWpTWkE0YkZZY2dCMjZrMHd5QnZ5cFBqM3Nj?=
 =?utf-8?B?SzJaUzFVT0g2RWpwdkhmYmZUY004ME9WSEY3K2FtNHhiYVR5eXNMZjdiaHJ0?=
 =?utf-8?B?OU5peW4va3A0VnBzYkc4RU42Q0tsQlRTS2tNTGo2ai80bkdCbWZDVDkydG5C?=
 =?utf-8?B?eXE4SFltbjNGV2ZVK3NacG1xL01LdVZaU2xaS0lXbWt0MUltOE93eXBHeHNv?=
 =?utf-8?B?MXhWZ1ptNFlKK3lBZFVDMzNPTXZnUmswTEU3RWJ4SVg3ak5HVUQyRFRZVUUr?=
 =?utf-8?B?THdSdFljVHViVVY0bmlrVGdZNGpxTTE4dzRCaUh6WFBnZmhYOW1acmFneS9o?=
 =?utf-8?B?c1JlbzZYejYxc3M3MjF4Vm5XemVqNE1HMWswLzFLOG5KYzMwU0kyRGN6M0ZY?=
 =?utf-8?B?M1VQMVVJd3BVM3B1V0l4SnFJNlRTTnBVckM1bVBQNm5VT1AyVVltTUR5Rzhj?=
 =?utf-8?B?ZnBvWEVtaVIzWUpsejdVL1dNMmM0bUdsamFSdDRmaUdSb2s5bGNMSFdTL0Rz?=
 =?utf-8?B?UTUveDIrMDJlOTNxVStYWFI5NFdmRWNYeVZQYTBvSldoT0RrMC9MZUtPOUVR?=
 =?utf-8?B?VTdtV2FIVW1CS29ZdE5DczdxNzlXcnF5WFordXRucjhUU3Q1MTlBZ0w4cUFZ?=
 =?utf-8?B?R3FTeFE3VDNxV0E1SzM0QlFvcnprR2ptUDZFaU5Uc0lIV1VOTmd2Vm5zSktz?=
 =?utf-8?B?NjNZc0lZSFRPMkhHKzQwVnV4d2pYY1Fzbjl4UWpKTTdjT3VZL2UyZ2syY2xT?=
 =?utf-8?B?N3h3d2dxamg4REpsM1hJOXRaNFZucjU3RWRmZFhkRG85MnllQzlGYW16cmx4?=
 =?utf-8?B?NUdFWmk1K1dnV0RBVk1PZmF2SGt3Tlk3QVJEZGNYdTRrWTl4Nm0vN1JDT000?=
 =?utf-8?B?ZW9zN1RxWjRUbGFDVzdVWnVmQjM0emdoTTkwUktzR0V2NVkrVUx0cFg5NDlt?=
 =?utf-8?Q?rdTLbzkQU2oQW5fMvHkFMrlfP?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	lxcKF7y7UKtBRHad3UoVCij1pu2uUt1T6fbdh+xwiztndC/IyTJEYN0iCFUpr2MkfXVD8k+nr0vmHM1u5lWAsevcVUWcLW9F16HZjXAA9QICzO3gYILDrR/B0FdWi0i9zQrLWE6thSytRIx/zwY9o3lX3GrJ3nQqaVbiwz7oLGOobKT+4lNts0j+4DaQo2gGUJI1EvXdCbjPt8fCr9660ZjKv5lO7XlAs/vuaj4iJs6AtnJIEnlXFNRzoJYiNGWZqL0eswhqg8YEiuMB5Y95hq8plhLfDnVr4pR+pcq0pl1BDZEgCCXPXaWFhD7JscBH6iilB75g56sy9gJHX65vw434r92q2V/f0MF4wmDApeJJJol0pwNU82U4KjxAgy9SE+t4Yv0XTvXtlgVJg3Mo1mIzGQ7/6e4JHHI298kJMKeMdkxMkQy+qwJNYX1Fcg8ZHUb6HH7yven0yjMNZrVNoOOfwUT5XuqajV5tQPtr6kat6vNpmRFNIjcNwB5FQ/Y8FYIWc4JDEQOXuGo8BRq9+1jYiyJr+7xmIsCvHNS6+nAuIegZCmAUm00NV/XrwJ1sUkKH82UcznRs9TL+zpyBmX7B548HgqqEMb6dX+Ocd2M=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 52a78bc0-eb38-402d-a106-08dce81ef72a
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2024 04:58:07.5814
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Nh3dWSNzFAWfQJJ1VlTBwE4P2Jy/EhpSjSbNmlb8ii66qGkuun4yRgBrgedX49ZFwv9Ux6YDfdvl6pBRyEr/AQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB4696
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-09_03,2024-10-08_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 adultscore=0
 phishscore=0 mlxscore=0 suspectscore=0 bulkscore=0 spamscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2409260000 definitions=main-2410090031
X-Proofpoint-GUID: Tcwvj4GIsCN9hwpiJ-A63iCpOCQrjG0e
X-Proofpoint-ORIG-GUID: Tcwvj4GIsCN9hwpiJ-A63iCpOCQrjG0e

Okay, v5 coming up.  It's slightly rebranded as "Create the BPF 
usdt_names and usdt_prids maps".

On 10/7/24 12:57, Eugene Loh wrote:
> On 10/7/24 11:52, Kris Van Hees wrote:
>
>> Yes, I think that works fine.
>
> Cool.  I'm adding a new test but will otherwise just refactor the 
> changes into the patch series and repost this patch (and any other 
> impacted patches) for new review.
>
>> You probably could even just name it
>> dtp->dt_nprobes (meaning the number of probes that is created 
>> statically),
>> and introduce a NPROBES symbol that the relocator will fill in with the
>> dtp->dt_nprobes value.  I assume you assign the dtp->dt_nprobes value 
>> when
>> we start probing (e.g. when the probes BPF map is created)?
>
> Right.
