Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 245E23D6F
	for <dtrace@lists.linux.dev>; Mon, 21 Jul 2025 18:46:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753123606; cv=fail; b=lb6JN8J8awyOwM8CVyACiH2SKSz4YdOKrR/fnChUGlLgExubkN5AFutabsuGSlK6q8LFI8hmBdca+E1rUtKZscsgvptAjcMDwkKIRPxO5VBiRIPaK+slm3ihyU6iE8nH27PvWR8IVZfZPqGF0VwkcuAAjVcjRx4KlUXIlS2BAA8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753123606; c=relaxed/simple;
	bh=KwsgzDIfM6QffLvM02+qJOUAVOJJILgtudUZnB8AmD8=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=uu8CGn+z0n0z9xCyCSpNR6aWbbCzPorTETNuMo3HNPi/L8wvzicqOUmTi+4qFuX4V9oGbb43+HG+SThz6ojiNNayQoSeW04e5yZEAj961roJBc83wiEO032NghPP0QcXRje614zB/yhHKLGWZIWPvokRDzb9aZgllC5NM8HTDoc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=fH7j9CMW; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=sPk9TejJ; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="fH7j9CMW";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="sPk9TejJ"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56LHg3sA016619
	for <dtrace@lists.linux.dev>; Mon, 21 Jul 2025 18:46:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=GwERkBz6aJaTWiITvHaFm9zfxK38vz4u0i2x0d4H7ik=; b=
	fH7j9CMWzsrxPDum9kATiXPzMn9oWHjfdz+K+HPcGNN2q9C9pKhP4qeHuNuS3Ty+
	J3ao0bZ0X4PiqmLkpWC9jRyt/BYIPjd32usiBiOVzJTSd9nw6QN2e4imR30i8x/R
	D7hjv0/zsJF/I36CzaEBFDrMY6CNv1NsjPbFqiFsYqsS7ln904M/hzcXuVi3Y0xO
	kXV1gQ25+WD1Fok/uZsD0LOPA7BQ3cmvb21BReyXqZx8//ViBDImeRCPBjB79LcZ
	mju0eAizjlNxGjzMB8qhAYlYhXaivYftUEKpwHxG7Bz9zmIyIDK71zOXTsKURXKs
	t0iaT3zDA46kkv6i1N0yeA==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4805gpkh1u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 21 Jul 2025 18:46:43 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 56LIdTDm005737
	for <dtrace@lists.linux.dev>; Mon, 21 Jul 2025 18:46:42 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10on2083.outbound.protection.outlook.com [40.107.92.83])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4801t8dby7-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 21 Jul 2025 18:46:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hPsJVDD41wUJnLN681KgeRCN0OKEu+aR3HzHyBAsbnr8CAZnMWOORHH1VuFaMAFWeuiLs4BYHIFQNT/+tM0SUYoMXxPcMLo5tl0Aa2jXk8au8LqZg75d+Hxu/Q+Gexmg/bdUIvgb7hViAq9VZXTo37dTPfnOx0z+Z15p0DXIsQzEKMks1jiYSZrgjm3s/7ZVoqMtKXV/cv3Me1rLZszG5ljvjBbWcFl7DhM7faRiv0H6WIl9qmCLEOYUYzWLUz1hITv9Gsd04paRstv0EyAeHBs8m5YvR1es8Y5BAN0dPPFUZ7AIYyT4r52RYF099f6RjdQkD14GcWrS7vJfBhDaew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GwERkBz6aJaTWiITvHaFm9zfxK38vz4u0i2x0d4H7ik=;
 b=KJWeBXLSFkovV8JsW8rY8P4hSq2LKGnYcs5TuSUqQU5lc2aiRw5Cu1AuLeL+OJUDqjLWjoVB9edEah5OetGXn/+FUGeCnFtZNfe5cQ1a/+WkbVpYnEuRLfUo/KWjBVoEsOESTWUulh/We5h1pqrk9/AeB8dNa+qf4bFa1dCL+7SFHIolRWifNFCwm6APjlFveSDm6OCsL6qIRGf3oqZfV4l5QnG/DHgxPDBnqztmUNFE9EEVYzFx3kiJIGUMvUDN9Q+v+lI8gvMh8tlfBnyk+gVfCMy5LTFn8c/PTNnsSQ8YepoCyGCEjZZPwFsq4rszUoBvHm1Aec3aeixJ4nRO6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GwERkBz6aJaTWiITvHaFm9zfxK38vz4u0i2x0d4H7ik=;
 b=sPk9TejJhR43yCFst3bxp1SHcSr2V0WdeS+SeyX2YU+CCNnzDGYjl5AibqR8OAadgtKjHBlO40NORQenfLNS+0bP210B/WrOVtIvUJWgaTw1oYUHMSc1biqshQPH1gOZ0RbVKmvm0u7zscOElRuRSRo27VR7tFSSaCvL9IYShZ0=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by BN0PR10MB4997.namprd10.prod.outlook.com (2603:10b6:408:12b::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.29; Mon, 21 Jul
 2025 18:46:39 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%6]) with mapi id 15.20.8943.029; Mon, 21 Jul 2025
 18:46:39 +0000
Message-ID: <d77caddc-865d-7031-9c40-9f3db87803be@oracle.com>
Date: Mon, 21 Jul 2025 14:46:37 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 2/3] test: change .r.p files from /bin/sh to /bin/bash
Content-Language: en-US
To: Kris Van Hees <kris.van.hees@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
References: <SJ0PR10MB5672FA7CA4991AE52AD88A9CC25DA@SJ0PR10MB5672.namprd10.prod.outlook.com>
 <ddc2bce7-0907-509b-c32c-00430e49305a@oracle.com>
 <aH6HTeEhawujUg4U@oracle.com>
From: Eugene Loh <eugene.loh@oracle.com>
In-Reply-To: <aH6HTeEhawujUg4U@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PH8PR07CA0029.namprd07.prod.outlook.com
 (2603:10b6:510:2cf::27) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|BN0PR10MB4997:EE_
X-MS-Office365-Filtering-Correlation-Id: fea0dfe9-2374-4990-aa5b-08ddc886edb0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UjN2WTdLbjJ3S2tqM3BFSGtjR1FCcHV4ZnAxdWx1OEo0YlRZaEVKc211L1h4?=
 =?utf-8?B?YXdsV1g2QU1CUkhoQnVpOFViTzM5cm8yMVRJVmxtdlhGbURvYzhHRzM5TTRw?=
 =?utf-8?B?eWJyN1NGYXVDRDFKRG1HSDZaVFRtQTVjRjgrOTJJZ0NxL1ZyT2gweGNhazJM?=
 =?utf-8?B?eVI1WWgwUzFuMjlVcG1WNzhoaW1peGoxanFXL0grNDhreXRZV09oT1BENmJq?=
 =?utf-8?B?Vm9oUUJDQjdId0dyejhHYzFzVjRlWko4a05qQS9VejRzRU1zSi9ZRGpjdkpv?=
 =?utf-8?B?RlJhSTA1UzdKSjM5YzROQkFTUmxjRXJYVWRHNjlXYVNCbUpmL3ZTNVRFbjZo?=
 =?utf-8?B?MXlKQ1JpSTNydjI3SDNFOHV2Rk1iaEo4bVZYWVlqWWVKM001YVZIVHowcW11?=
 =?utf-8?B?ZDhZVzdFTGNJZlhiZG56VWxZRXA5SUhQUDBuOVhDN0xGTEZMVW92bU9Zb3VZ?=
 =?utf-8?B?eGVKVzN2dUxZZmQ4M0JUZFcyVStsTHJOdkkxUWZ0S25GZ2k1VVJHdjhEMVU5?=
 =?utf-8?B?UXdGVDZZYTJMUlEwSytNSHQ2K21Yd2NTNHgwUzh6c1l0bXJwRFdZcUJLSUkx?=
 =?utf-8?B?ZHA0OFBtTXJ5TnRBaDBTUkZFbWlTOWw3OHlqdnVKWTVGVi8zZHd2Nm5jZE5G?=
 =?utf-8?B?bVZwZUdvTGZUaFNRQys2ZFdqdW8wQXZVcEtsYlo4cEM1WWlaUEFRT3JSaCtQ?=
 =?utf-8?B?THpzN0pGK2sxWDVzL0s0UHBrNnltbDVFQ1RKYVoxZVVuZVRGcmMrakZHQ0JY?=
 =?utf-8?B?MDJSa2FocStBMGJUUzUzSWEwNWk1Yk04SjNpR1d5NExYanJnd2U4RjUxNW9k?=
 =?utf-8?B?dkM4YXc3N3FPeVBpaitxV3JDSnJFVVhiZmZSdTV0b0xqclp1clBtSVhEMG9r?=
 =?utf-8?B?NHd6TnNvS0NYRS9ZK0VHQldsWm5lNDBhemsvQWFQTWwrbThTaVBwWGl2aXNP?=
 =?utf-8?B?WjEreEY2dkc5L3Zma1ZTV0FGbGtUdCsweFJxakR3TEhDcHF2QWZSM09FeW12?=
 =?utf-8?B?eHppK1cwT283QnQwWXo1VU9TUXZxMVlWRWRyQVV2RzNhRmdMQmN3NnlmUSs4?=
 =?utf-8?B?VUs1OCttRGxFSXlJSHRSajh3ZlVhb0djRVVMMWp5TWJjNDdRVGFqQ2NyS2xK?=
 =?utf-8?B?azR2UE4weDVIbXdqYkRsSlZhVFVCS0w5TitESFVVQmZMRllFbTdqSjEvaEE4?=
 =?utf-8?B?cmRTR3NwVFF1V0JqVlVXelpsZG15S2hQT09UOHIzT1ljaEJZczhLTklFdkNL?=
 =?utf-8?B?Z1hsUklZNWlJZXVuTmpyak1qWGJvaDFhTnRmcjhDdDVFL0NMeXJ5dVFvZkRq?=
 =?utf-8?B?SjFlcXhUN09OdjRSWFkwRWJvV2lOUHlDVVAxMi82S1lVSGRGclBHWXoydFps?=
 =?utf-8?B?bDB2UGdEbUJUSThacmR2ai94NVB6cmFOc2Qxam9Oa3BtRVd2NVFYK0gwVTNv?=
 =?utf-8?B?OTdIdU9seDNaMnQzalAvaGMvbmpHN1p0ZE13QUt5VWhnUnVhV1BnbEJRQWZZ?=
 =?utf-8?B?YlB3SmhqV0g4bkFCV3ptdHZ4VENVbEtCSHJSeFg5OUZDa0pjWmM1K3laZU5X?=
 =?utf-8?B?RHYxcFZxeGx2MnhRemxWVXRSamFKclNlT21FOUJsRzBiN0pqUUREeEJZNUhF?=
 =?utf-8?B?TGVsS1QvbmRTaS9ITDNUQ2R4MTd3UHBRSkxCeG9ZTTUxL08rb1c4d0xDVFRI?=
 =?utf-8?B?RGhFVnVWOFQrUU51cWZqMGd6UEc3ZW5NYVF2UTdOSGpXV0lSVmdaU09zcGNm?=
 =?utf-8?B?R2lCM1VUYmY1Y1pySW5SVGkvWk43UFhpemRnbnFwUktRakptaW42ZGFSZk1D?=
 =?utf-8?B?YU85MDNSNzQzSHkwQzdCaEk5Si9wZlZOZ2IxOFViWFQ2d3VjTEFwZFkvYWdB?=
 =?utf-8?B?WHErSk4vZlNWOEFBcDNibG4yeVZ1UXk4Vk5aL2FhTklpVnNSdUx4OFV1bXN6?=
 =?utf-8?Q?I6FaqHabaTo=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UlRBRDJnMUd4VlFjQ0xzQ0RaM3gwZUZ6NXJtNEpYanhBS05Ba05adzYwNkJ5?=
 =?utf-8?B?S0pwV2xQV1JEM0hHNEJYSEJDc0x2clhvR0NrWVRoeVY1RUlvVU9DZ1VOcmNx?=
 =?utf-8?B?TFk1a2pNSmcwQmc5VGlCTjZpYm0rWXREOVpvM3I2SEZpZU1PZlFRbi9OdXhz?=
 =?utf-8?B?VjViYlBUUzRXRzN5MWlDVnpyREhscVBONEdyVk5GMUdTaWpYMFVTdm5wYllS?=
 =?utf-8?B?T0JNMkNWQW1KSVBJMndsK0JrTWVoaFhQM2U4TU1Mc1FPaHVuOEZ1Mnk1Y0la?=
 =?utf-8?B?dlhZTFNycStFWmYzUmFVV1VYR0J2ZGxKeTZTdWdmRTFJb2lqa3poRmlRUU5i?=
 =?utf-8?B?ZVNPUW5PeSt5Qlc5U2hGaTNJclI1eTNONUpGSDJmN05JOHpkZDkzTGNtNlYx?=
 =?utf-8?B?TFRUVHFEMXcrT1MwejhHVU9qU1h0YnVWNk42SUIzTHppaGVESWRPRDZGVmMv?=
 =?utf-8?B?UFV0TVZTd0JYZ0xUMWVranVnU0dzS3FvV2ppODFmbzNQd2pKWlpBWDErL1B6?=
 =?utf-8?B?Z1ZjbmRER3IwYWphRzArMy94SVNoZzVIRWExbzZlWXBrOU94Z1B1eC9SNCtr?=
 =?utf-8?B?RGlqWUZNY0I1RHZOTUJldUtCZ0NLTlBWaGVXeTFBL085eS9ZSmlxSXozcGlu?=
 =?utf-8?B?MjRhSThxOFEyMW83NWpydWJUTm1mRjBiUTFxZjFVNDI2Vzh3bFJHZnVZVDRs?=
 =?utf-8?B?N0lieDBqaUNUVm5VYyt1UjZQU3dHTnlZTnNGa09ZUXlDN1dSb0JSS1NjbC9h?=
 =?utf-8?B?bnQvejlDajByVkxNVmlVTEtxbGwrZWwwRCt6WXJpQWVWTmRNVUFoT3FBbi9Z?=
 =?utf-8?B?aWZUU1FTaGJPL0d5aGd6N0lVdHJsUXdWQnd0aWRGK1R5OUNYbUdFK3N6ajg2?=
 =?utf-8?B?RXNhNHZmU3IrU1F0aEJNOXU5Q2ZCR0h3MWJFMHlqMFE1VWRtL2VIUEdpaEdi?=
 =?utf-8?B?UE1yOE8zcHE5MkVXSWNJVEpRWmFwRVBlSU1YZnU2dnpRa2kyUkFDRDR1ZW1H?=
 =?utf-8?B?QzQ2MUpGcTA5UDFIVUx3S2NLS0hFZHd4MzNTTE1EYnF3TE1xb016bGpCUHdW?=
 =?utf-8?B?MjduWUlsenlGcG5jRmlsV2lBMnBEenlGZW5SNm9IcVJieCtZWFNLenR0QUFT?=
 =?utf-8?B?SkExZ1A1TVlKK01PZ2VZa28wN1RUWVJKaGgxak9YMWpEVlJpNlFWakgzVUdP?=
 =?utf-8?B?YkxDWXhJL0I0eTJncjFXZ0lZSjR1Vk00OS9XZzJxbGlRNnlPVjZIeTJBbWx5?=
 =?utf-8?B?QVQ1ZzByWlRucWNzSkY0V2Jsd3kremc1WGVWaGhFeEJPdDBqbGdzT0dkRlNK?=
 =?utf-8?B?a2QrSHZCbjI1SVF3Y1pyZlZUaGFPNy9VS3VmR3U4KzR1Z3k1elZyU0RhdGJU?=
 =?utf-8?B?aGI3Z21CM2Z6ZXhiakJYdnJ5NW9sMGRxbDl1TzU3VmcvblZFMzRpbis3UlZu?=
 =?utf-8?B?Zmk4SC9Zd2hrdDJhdEVDZWZMdUFrZzh0ZGxFRnovcUxCUjMzWDNMZTdPbXRZ?=
 =?utf-8?B?d3VMRyszaFJNWmVpOE04NVR3bW45WTZ6WG4yeHJ3NmtmbkZTZWZiOEhDcnZQ?=
 =?utf-8?B?MkRMaWlydzRTT0FnQVgyL1RHczNnQzVIZURRWm45Q1V2RGh2MjNXS2h3L1pU?=
 =?utf-8?B?K2hjbFZ4QlNXQ0xMOGVmd2UxVTkySVQ4TFFkRHErWlJqdUdUbll2Y0I2Q1Az?=
 =?utf-8?B?VHZFenhnZFc0VnlIcUVmSmFWS0t3WXA5V2NhYjZ5VWJFUmFPUGZ2ZXV2SmFi?=
 =?utf-8?B?ZVBaOFEwTjQwOWRBYmgrSU1rSWw5cE1oUFBLN1BjZkZXQ2swNTU1akJ6M0F4?=
 =?utf-8?B?TzBuWGVrZ2hOOW43Sms0K0ZIeWRlbXlxQWRybGo0Q0xyRWoxaDRQdHh0NFB2?=
 =?utf-8?B?RStNUGF4SkxjT29JR1FsalFnNkhrSmJIa2pUZ20ycFNJOTBDOVJ0UWxLYVA4?=
 =?utf-8?B?N0dvUGFaNk9sV1RGbUEwM1JZMnlBM0tzWHdIbFBlZW5PTDdSMUJYejhVdWV1?=
 =?utf-8?B?bWVnMy9DNnhSbThxWHNyTGhGb1RsZXdDS1VEWHhRRDRsRnpwZGVOVHRxZGVH?=
 =?utf-8?B?K3lLMzd2a01VZ09VcGRsYjFVcVlsSGlTZ01FTmUyank3N09ybjNuNWtiOEpJ?=
 =?utf-8?Q?keJuJ7kVcxTGmvw5jbXoKhb0j?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	n102rmy5yIpDXKqRQAS/wFbkRKxh14RGRoWglxOZGsUvy/GqtvuniYyXZ3Qeo2w6zah1ee0ZfuiBmXnSdy4YzNhDXQUEOfYHJfPLDB1Vg4dDLqhS6wQYYfvtJSMRXEt4vj6FobzIhf3p2NwdVq+kf9Qk5SwDJxQIKDG2eq2X/PeU9nFTlZx7565N1JpPRyl+QowzEfvcUAn+NbhzvgSw1bVsWU0wV5OphLj4mxZtr8r1rc9DbYDlIiP4mnmxEOplQJv/XPhbhsPVCmSivQAwdjUGxldoUTc5cmJW/1USlMzIlkJuSMBfyM8EID/xNvFsD7j83bO4bqC9ah4qpRq0LuwmxirUaCMp77aIwrED2Nn1sKbiKQeHm5Z794rIC0kPh6xTIOV3gHz8Mqd5SQ0fRdQvQHw/dhKGZcHGNOiPnwgx5nEIzus2A6QoLig+xkEviI4I1irVdxlBEsYcTHmBNsFeVaFtht2IP6KFziFfiuIzPfpdsd0LaigkDAVNnpbwYGi4KTI5S0mQRj/dfy8n5c3fub8pjkRsTTezhPp2w7aOJ5wXoMjTBRazBszHN/W1uKW874EvmpqCYRaBUkZJ7a6N6lqCiZhv7x7Qz8930kI=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fea0dfe9-2374-4990-aa5b-08ddc886edb0
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2025 18:46:39.7006
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 53PxeQJXW19U1z61uU5yO9BqkNfH4+9b09z/GRqk2vlXfmIPH87OQIiaoqDUXKZ+Cd0GaxxNvHheuurUYz2iQA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR10MB4997
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-21_05,2025-07-21_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 mlxlogscore=999
 bulkscore=0 phishscore=0 adultscore=0 suspectscore=0 spamscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2507210166
X-Authority-Analysis: v=2.4 cv=TfGWtQQh c=1 sm=1 tr=0 ts=687e8b13 cx=c_pps
 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=GoEa3M9JfhUA:10
 a=yPCof4ZbAAAA:8 a=9gYzOnSNyajgD9jLOP4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: g16-iI-T9a7HNptoqBAe7C_ubCG72dzu
X-Proofpoint-ORIG-GUID: g16-iI-T9a7HNptoqBAe7C_ubCG72dzu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIxMDE2NiBTYWx0ZWRfX0lR3ZkAYR16N
 ox/MmsR5ASTq84mnwzzVat5p1jPxN43qoEg4J+5ipK9GwwcPmOX0Gk/JEbBVGPtYckqmfbVF/wA
 9hHKVbz/gxSrtixmsZzsD7QzOkfShMhKsCFriT2m5t7wLUo5+cQoDuqyjVrksDVNTMWajOefLxL
 n4Rd0fDRQZl2Wo4gxN630RB6KYyaYQCpif0zAHIiDSlcurlKaq9QzvRKLWx0j49ESD4DhbuNzsG
 vLwHrGa/peUBqgiCzd2GDFkLJzN26YsIM3Of02DcbDrP/bOyj3CcYcWSoBvVXXIVwwJ6uYHpTvq
 K+8KSDxnotKXvwwmBwsIrtSzX5yOvY7L+QbXjm+CaJmOKtc1LaxOqCOcFhl2JkX84f2vLyxWd3k
 gSAJ8Fv/cxNa0s72TIhpaWOslXJPbLDfkf5EmKCYf907a8v8j1Vkvxa1w2RNKv0v6S5+7iYs

Okay, thanks.  Add this sentence to commit msg?

On 7/21/25 14:30, Kris Van Hees wrote:
> On Mon, Jul 21, 2025 at 01:01:00PM -0400, Eugene Loh wrote:
>> Reviewed-by: Eugene Loh <eugene.loh@oracle.com>
>> I guess what I mean is that I cannot think particularly of any objection,
>> but what's the rationale?  Certainly, there is still a lot of /bin/sh left.
> These are some that I was ble to identify tht trigger errors or unwanted
> baheviour on other distributions that do not use bash as default sh.
>
>> On 7/21/25 09:34, Kris Van Hees wrote:
>>> Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
>>> ---
>>>    test/unittest/ip/tst.ipv6localicmp.r.p                  | 2 +-
>>>    test/unittest/proc/tst.signals.r.p                      | 2 +-
>>>    test/unittest/providers/rawfbt/tst.synthetic-entry.r.p  | 2 +-
>>>    test/unittest/providers/rawfbt/tst.synthetic-return.r.p | 4 +---
>>>    test/unittest/ustack/tst.ustack25_pid.r.p               | 2 +-
>>>    test/unittest/vars/tst.ucaller.r.p                      | 2 +-
>>>    6 files changed, 6 insertions(+), 8 deletions(-)
>>>    mode change 100755 => 120000 test/unittest/providers/rawfbt/tst.synthetic-return.r.p
>>>
>>> diff --git a/test/unittest/ip/tst.ipv6localicmp.r.p b/test/unittest/ip/tst.ipv6localicmp.r.p
>>> index 904102ac..fd1ef30e 100755
>>> --- a/test/unittest/ip/tst.ipv6localicmp.r.p
>>> +++ b/test/unittest/ip/tst.ipv6localicmp.r.p
>>> @@ -1,2 +1,2 @@
>>> -#!/bin/sh
>>> +#!/bin/bash
>>>    grep -vE '^$|data bytes|bytes from|ping statistics|packets transmitted|^rtt min'
>>> diff --git a/test/unittest/proc/tst.signals.r.p b/test/unittest/proc/tst.signals.r.p
>>> index 7798fa25..4044a64f 100755
>>> --- a/test/unittest/proc/tst.signals.r.p
>>> +++ b/test/unittest/proc/tst.signals.r.p
>>> @@ -1,4 +1,4 @@
>>> -#!/bin/sh
>>> +#!/bin/bash
>>>    #
>>>    # Eliminate blank lines and the monitor messages emitted by bash.
>>>    # (Turning off monitor mode should quash these, but it doesn't seem
>>> diff --git a/test/unittest/providers/rawfbt/tst.synthetic-entry.r.p b/test/unittest/providers/rawfbt/tst.synthetic-entry.r.p
>>> index 18171f04..59dc63b4 100755
>>> --- a/test/unittest/providers/rawfbt/tst.synthetic-entry.r.p
>>> +++ b/test/unittest/providers/rawfbt/tst.synthetic-entry.r.p
>>> @@ -1,3 +1,3 @@
>>> -#!/bin/sh
>>> +#!/bin/bash
>>>    uniq
>>> diff --git a/test/unittest/providers/rawfbt/tst.synthetic-return.r.p b/test/unittest/providers/rawfbt/tst.synthetic-return.r.p
>>> deleted file mode 100755
>>> index 18171f04..00000000
>>> --- a/test/unittest/providers/rawfbt/tst.synthetic-return.r.p
>>> +++ /dev/null
>>> @@ -1,3 +0,0 @@
>>> -#!/bin/sh
>>> -
>>> -uniq
>>> diff --git a/test/unittest/providers/rawfbt/tst.synthetic-return.r.p b/test/unittest/providers/rawfbt/tst.synthetic-return.r.p
>>> new file mode 120000
>>> index 00000000..7ba3ffbb
>>> --- /dev/null
>>> +++ b/test/unittest/providers/rawfbt/tst.synthetic-return.r.p
>>> @@ -0,0 +1 @@
>>> +tst.synthetic-entry.r.p
>>> \ No newline at end of file
>>> diff --git a/test/unittest/ustack/tst.ustack25_pid.r.p b/test/unittest/ustack/tst.ustack25_pid.r.p
>>> index 6486f7ec..c0110e00 100755
>>> --- a/test/unittest/ustack/tst.ustack25_pid.r.p
>>> +++ b/test/unittest/ustack/tst.ustack25_pid.r.p
>>> @@ -1,4 +1,4 @@
>>> -#!/bin/sh
>>> +#!/bin/bash
>>>    # A pid entry probe places a uprobe on the first instruction of a function.
>>>    # Unfortunately, this is so early in the function preamble that the function
>>> diff --git a/test/unittest/vars/tst.ucaller.r.p b/test/unittest/vars/tst.ucaller.r.p
>>> index 8e03f110..23255a14 100755
>>> --- a/test/unittest/vars/tst.ucaller.r.p
>>> +++ b/test/unittest/vars/tst.ucaller.r.p
>>> @@ -1,4 +1,4 @@
>>> -#!/bin/sh
>>> +#!/bin/bash
>>>    # A pid entry probe places a uprobe on the first instruction of a function.
>>>    # Unfortunately, this is so early in the function preamble that the function
