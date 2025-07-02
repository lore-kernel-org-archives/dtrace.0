Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEAF830AAB5
	for <dtrace@lists.linux.dev>; Wed,  2 Jul 2025 14:52:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751467946; cv=fail; b=ro3IKt/NtSAwQedpeubFtdaIcbT4Tz+5p+15Ebqi1TZt9IK5wcsYvUK0AoxVY0S/zU+JZE2EQlUoV7LnuzhMSss+dOkD9oCLPRrq8S1RyUpzPbNyzaxunjLDdhJXaPqWjwNhx2jQQL0ycrUZeOGdf2yGj2gjI3QCavLxH0Ia+s0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751467946; c=relaxed/simple;
	bh=qn66Z1AkoYZsYpxQkigZEl3D3TGS/3vy/s9Az9WQyxA=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=XedewO+YPw5DrnmPm0WjYic8AYJZuuDh3K/R5vcIYoCL8SNWCOTfTKJnvxcstxwmRZNEUHO2q65bdoiaBX9frzm8jbMss7MTrnVsqPX2XJvb9mXovV2nhT1a1eq7PrKV4dt9uI0t8PKlf48bOP/W0czXYtuuxLpNHBD3DhRl6S8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=BbIbtVZf; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=XVAKDrbv; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="BbIbtVZf";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="XVAKDrbv"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 562BiS0h027339
	for <dtrace@lists.linux.dev>; Wed, 2 Jul 2025 14:52:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=fZ6qUA0/SEJ9cDziT3mjE1f7nkqlLxvmKBrGVRdbcHI=; b=
	BbIbtVZfs0Cl2TsScR1bSLvfp1cQ+Il/b+zEItWlahb2wdgAydghA1ZJccnhocYp
	uCPIteQcOuq35wLXn30O1q+bei+vcXR3yociemXp2nj/udnFviauJZyG3B8+uKYk
	jFHqcf0glBak0oRbUQKWHXNIMoQGnRkbKLbo1p+J/UY2+su2xhB8w5eP+g3JXDpS
	4lI+QTvVK+9XqJIU+MVIqL68czYfHT7jlE+UYt89RvPvuZ1zRN7Ly4FBgeFDT/LY
	AEh6C0O+2aQmVkPXJqsHHmp5PmjgPdBY4GVUjAO/tnbUcfW8d3+Nz5p84LNyXPyY
	vPqDRQsICmTZXO2x65RgVg==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47j766f5t6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 02 Jul 2025 14:52:23 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 562EenoD027539
	for <dtrace@lists.linux.dev>; Wed, 2 Jul 2025 14:52:22 GMT
Received: from nam04-dm6-obe.outbound.protection.outlook.com (mail-dm6nam04on2083.outbound.protection.outlook.com [40.107.102.83])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 47j6ubab3x-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 02 Jul 2025 14:52:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PQuDn++wLibuP3YZ//tHlIfP2+Yc70l2V9V4ePE0Eos12iVuD4Kk9gyUz552/tW/YodsHFA48T260mbkiIjGTo+oonXg5Q1lGeK4gD4fbYbFPEU4idcTWuhYOFPXdbqGzGbGezJcYIaRKeD/7+Johnqvt9TMHyXUHVYi0jvVdLfLPaIg1z2l3nNW8NACCSc//ok6eou1SyWLz8KXGvi3smCDYhdeHaa3FhdJsBmv6aj6xNl15jEPcjxKki0m0V2vbwji7MizahovhtaNoRmfOyUabeoHLhLDVF7KdjatVadDtEhMDSORwSdq5VgKiQ1cNmzaybx5JjrBcE/AGafigw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fZ6qUA0/SEJ9cDziT3mjE1f7nkqlLxvmKBrGVRdbcHI=;
 b=ViSKdSPtpnUNBHgEtFjJffKxSOJfx7IWrN2lTZ52VQ14uWpSU9v3b4z5vzCKQwc5NVEvdDBXIZcRPRfcXzH7zU8koUDXbYRlPSUTDrtC6nu/qFoRc15Ffou9eEdEj+YjxpPXmXFr7jNqgzkNBJ6emI1ugH3G9QEzCMhRgr65pxD1TYoyeGFaVtREFNcgnvx+RS6iqR3S4t7a3FgtzbkohtfbN/lwFazyJia/7oohutrO5PZcJdL+vETummmlXZkT+lSTNDpqgx7MFravwump2NERcO8XyIZVAOPosIQSRkioFeLvI69+mCcnSSUK5vS7GWkLcK+EtgcFaEO0bA6oeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fZ6qUA0/SEJ9cDziT3mjE1f7nkqlLxvmKBrGVRdbcHI=;
 b=XVAKDrbvis1FM5ylP3cyoqnaTAXnlBEUsm+aJRBkREjqYHGqgF3+fvG+l5XNHtJPjqF6l15z9oRriXjs2Nns+hRasA+4EXH1QXqzOcA2ukt9DQu6h6maGqLVtoDqmBF3O2U+DAISWsEFA3HW8sza+MIyyFm8gI+toRGShNcps8E=
Received: from DS0PR10MB6271.namprd10.prod.outlook.com (2603:10b6:8:d1::15) by
 BN0PR10MB5031.namprd10.prod.outlook.com (2603:10b6:408:117::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8880.21; Wed, 2 Jul 2025 14:52:19 +0000
Received: from DS0PR10MB6271.namprd10.prod.outlook.com
 ([fe80::940b:88ca:dd2d:6b0c]) by DS0PR10MB6271.namprd10.prod.outlook.com
 ([fe80::940b:88ca:dd2d:6b0c%6]) with mapi id 15.20.8880.027; Wed, 2 Jul 2025
 14:52:19 +0000
Message-ID: <d886c84d-f208-465f-a95a-0f6f8133ef1a@oracle.com>
Date: Wed, 2 Jul 2025 15:52:09 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] dt_impl: bump number of TSLOTS to 8
To: Eugene Loh <eugene.loh@oracle.com>, dtrace@lists.linux.dev
Cc: dtrace-devel@oss.oracle.com
References: <20250610135813.15746-1-alan.maguire@oracle.com>
 <20250610135813.15746-3-alan.maguire@oracle.com>
 <4a079f61-5806-68b8-9051-af918a822adc@oracle.com>
Content-Language: en-GB
From: Alan Maguire <alan.maguire@oracle.com>
In-Reply-To: <4a079f61-5806-68b8-9051-af918a822adc@oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN4PR01CA0059.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:274::9) To DS0PR10MB6271.namprd10.prod.outlook.com
 (2603:10b6:8:d1::15)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR10MB6271:EE_|BN0PR10MB5031:EE_
X-MS-Office365-Filtering-Correlation-Id: ae7739b2-0fdc-47d3-9452-08ddb9780b47
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Z09pR3pGaTN5K08wTE81M3NVNkdPdkpwcGFScTVQWUF5Tk1BdHVwREJINjRD?=
 =?utf-8?B?anRjNEFxSzBaTUR5dUxtMEJxeW9vakZ0UnhGVEFHSUlzTnAxZmpXdFNNU3JC?=
 =?utf-8?B?TFluWm8wRTJLVVVpR3duZ1d2aWJQOUNLVVIzeVJuVmozWUdoTVdKeE01eDZr?=
 =?utf-8?B?UENIekJyQmtaS1VIWDgvQ25NSTlMMjIyVWVwUjc0S3Q5Si8yL3dHRE5NUFQz?=
 =?utf-8?B?SFVJa2JUd2lYdnpYcWFpZ0p3V28vT2JIeEVzb2kxZW9NQzlkdHJIN0o0SEtm?=
 =?utf-8?B?dCt5V000aTRvdGFrN3FEMXdLTDA5ZzRWakxiZkFSdW9BeGd3ZmFNcktESGxn?=
 =?utf-8?B?SHFuajBWUmxwN1FhdEg4d3pKTndJZ21TZWRSaUtlMkxRTnBLTmRWT3NDK2Q0?=
 =?utf-8?B?dXl2dUdSWmY3VnZtcUJZa2oxUHVYbEY0N1MyUVB4K3crcWNmYXFWL1UxSGFv?=
 =?utf-8?B?TGpNNWY4VmYvY21pOTU5UDlqY1dYQkxCaU1BRG9DVFM2bzZLNWZLcjY1d21s?=
 =?utf-8?B?QXNtaDZDTVZJZU5mamlsc21Vek1KYkFXSVFobEY3a2dDR1hvMXN6ZXZNSklB?=
 =?utf-8?B?UVNIM3p5YWlicW5sdzE2MjU4L0FGbzNTd21jMVV0TDAwcDVhTW9zZnRxeTNu?=
 =?utf-8?B?azIxdWFmNm9jMXJvQnlCcE5xaDRJQVFzR1E1bUxtOVFYcVRmeHExQXFOcnB6?=
 =?utf-8?B?U3pYak1FM1dZa3dLWXExamtkazJyakNwWXZ4ZHlqZ0hpTVJsRUc1dlFMZjV5?=
 =?utf-8?B?dEZmYllpbHFYdnh6bERpRkFLNW5BLzIwR1hacitWRlJ3Z0J3eDhqTCtZZW5X?=
 =?utf-8?B?QzFsNUk5dDF2ZjJBL0JoSHkvOGV3RTJWQS9pRC9UMGd4K1pJdk5xejNJM3hH?=
 =?utf-8?B?M3RjWnZMUXVRdnZZWkc3bEtVMU1ZSXNQLzgxZTlOdGFPYzN0MFlZV2JoREdn?=
 =?utf-8?B?NVQ1RXdpc0VCZkw1U041RHJtZy9VbTRVcjh6bGRSeCtodW02VklvdHRiSE5T?=
 =?utf-8?B?T0YwanFOemF4N05adHVwMGJEZGMrSFNRaytMbWZyU2c5MW53cXhBSnRSaGhM?=
 =?utf-8?B?aVFCOGtLaWlPbWhTc2J5UWZrcTFJNE1oKzFYQlNBams0Mk1WNVVUMjkwZ2tI?=
 =?utf-8?B?QUltSFNTQWZ3Wk5TcFRvbnM3MkNpUmVvQkVWZllYU1dPS2dLNm11QnFhM2No?=
 =?utf-8?B?TEIvZU9VNDRpdW9sL2hHNFMrMTc1cXpwY1ZCMWJWaXVXU3dER3JNUDJuMy9t?=
 =?utf-8?B?YUVBZDNDS2RJWWU2RjJTQnZpdVFDamxUdU5wMnpWcXFRRlNoYi9odXJ0cW82?=
 =?utf-8?B?cGxQVldzM2FNYTFIRXB5WEhaSjl6VFk2dFByNW8wMmZhYzIzbm1UOTFxUnJ6?=
 =?utf-8?B?NTd4YkE1ZEhqNlNaalFWR0VwNWpKV2sxTHQ1TFlYakZhNUt0WEMrVjFMZERo?=
 =?utf-8?B?aHg5SDA2YmMzdGYwaWNvb3I3Wm04clQzRFY0clFMbHp0K2xMcnNPODE0dXNF?=
 =?utf-8?B?b3B5cHZhbmZNQ1VWTWNONGtVeEwzalZIdHcxNmF0ZFJUWlVpa2RRUkcybFJD?=
 =?utf-8?B?dURWOFV5bnAxd2l0bWRpMDY4bDdkUkE3L1RnSTBjbzRrZnh0VldxY0lRczli?=
 =?utf-8?B?TmNiZHkrZlEvb2NCWS9zaTdZQjIrb3pVbWk2N1VLZDViU29wNVlLMWZRU2w3?=
 =?utf-8?B?eDdJUXBZOVpjWENtM0wwQXJiRkQ1RWw3SWIycjFsc3hSa1hnQXFyeTFFYTB4?=
 =?utf-8?B?Ri8vT2NCTy83YnVteTZ1eTBzaFM2ck0rUy9WbmEzemc5WlVoVmwyanpCbXU5?=
 =?utf-8?B?Rk4vaUdhbDF4Sk9iQncreDNBc09kZzI0ZHFoSXluRUhidk9HMW9rQkRRN0ox?=
 =?utf-8?B?cU82T2xYZ3l3OWVHMGRjVzRWbWhmd0RETkc1N3ZRY01GYWNxR0Z3emRRcXhk?=
 =?utf-8?Q?JhhzuNKREBc=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR10MB6271.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dG9sVVppMDEraC9EcDl4dm1sd0VNRGdqZzdOWkdGeHpTZ3o3TXVqSU53dm9X?=
 =?utf-8?B?ajQ3Q1N6OTdsdTBoVXE5c1BRZDZwRFZ4dVphbUpuVmtXeTU3aWlXbGNmejNw?=
 =?utf-8?B?RnZ0ZUQ5NGRNdXBmcGlJOG02VWMva2NINDNJblJNaW83cXBqZ3hBYnoyWmth?=
 =?utf-8?B?Z1NCaHBtQXhhc0ZJR1p1NHVEYW1JQzk3eFlJYysxNXRXUGUzbDlERENLVTFH?=
 =?utf-8?B?YlFIUzJCVmYxbFZLTTN3dHUralJudkVHdXE3SC95bG5aRG90cG9xVUpHa2Zh?=
 =?utf-8?B?NEZ4cGxnSGRZVDVrVlJEVFZvTW5UNXVrbk10ZEhPeEFPNFYxK2FhRnMwUDhV?=
 =?utf-8?B?ZG9KUWxzemJscGFpSG9hZzZLMTBNTFgwVTczOE9QWk9BWFhwWktITVhyc2ho?=
 =?utf-8?B?eEtVYmw4TjBjbnc5WTYvL0I0clFieVdzci83NTZKNnhseW1yZVl4YTliOXBS?=
 =?utf-8?B?NmM2V3JPMmdVK1RsTnBLdExSNXJBem01ZDRoZGh4QkgzclBvM2h0RERuVEs5?=
 =?utf-8?B?emFJd2V6Vm9JQVhEQU82SEpxUXhnaWtiamJsV0lsUW5XQWVlVER1a2tiaG5Y?=
 =?utf-8?B?T3pWUmIyYmRzZEdGL0k5aXNScUs3eU8zUi9mUTNaY2dwamVwcnc0Y1R4cGNi?=
 =?utf-8?B?c0pMUzkwTFc5c1lWa0RJYStyMENCaEVGRkl1clVaU1dMcUkwYVRDSVM4M1Y3?=
 =?utf-8?B?UGl1bkhvK0NPU2RKTXJtRHBQYjBkV09qWDRkY0JpRVM2L0x5djQ4SkNhN0FX?=
 =?utf-8?B?L3hPeUN5M3Zaeml2c3M2R3BQY1JVU1VrV1BETEpUMThMS1hVQnhRenpnMHM5?=
 =?utf-8?B?N2sxOWROdHg0bm5MYW5jcU16d2VlakluOHlrYmZNNFRSSmNmWURFQ05aMUVh?=
 =?utf-8?B?VktvZURENmVoa1pxTmc5bVBTYVc0a1pqWDVKSlpOSGMvYUcxYUFwMlY0Ni9T?=
 =?utf-8?B?SUN2Q1luRkVmWjVvQ0VEbWpPdlB4N0JNTjZmR1BCYkJtL0ErS2JrNkJ6TFI2?=
 =?utf-8?B?MFdHdjBnd203bFVxMTBrbEM3RUZOT0JJNVAwckFCb1pINEo2WW4wbXQwL2xN?=
 =?utf-8?B?cWNjVlVKb01adTBDbjdSYUd3QU90VmlNUXQyWTNwbzkrSkcyd0ptVTR1M1dl?=
 =?utf-8?B?ZVFmSDZzbDdvL1VMaGNONWNSWGRYbGVLRFNnenNvRWx5TCtZa0dldXpRTXha?=
 =?utf-8?B?MEUwc3hvOHdkalVIRXh2QWFSUTBoZm42MkdHb1h0NEIvRnEzQ0dOUjBHRU9K?=
 =?utf-8?B?R1ZZdHR0NE9kcXVVa3dpQmdMd04rNEhkUFBJdEFTaEVLODRaRWRVOHJGaUpY?=
 =?utf-8?B?dGQyRFRmVE1heGo0WHZWZ3JsdkpNZUlxQ3FCaWNnWTN6ODVZZGtETFBYK1lS?=
 =?utf-8?B?L08rRTNVVktRdjk2bUYyUkEzaGFtZWZtc1cwNmZGQ1dCODEvNHdKVkR2Rmpz?=
 =?utf-8?B?QjhzRDhtSXord0swa3JpM0orQ1pWV2xOMmM4T3J6Y001bGZJNDRYQmRIU2NU?=
 =?utf-8?B?Y1ZBSExhZDBYODc5c1RJazNmc29pR0NSQjd5RW1ZdlJURHpoYnl4OXlxTlFR?=
 =?utf-8?B?YjN4TXpSS0tPaGs1c3ZrNC9KSjhyUTl0U3RGRDBxRkg0OWlXRGJDcW5EdHZm?=
 =?utf-8?B?V2R3UytXdDVnTjFjclJHcnp4b2VnYVZkM3V4d0orRGlsYXkxbWRHWUxjdVZh?=
 =?utf-8?B?NWVjVm1JNGJ2OVRkRmpvOXUxZDhtMGZ2T212a0xEeEpmUDg2Rm42UXFRNUR1?=
 =?utf-8?B?NUFzSUhXY1Zya3hlZjNqWEtBYzEyUzllTkNYVUFWTHkwQjdlWCsyQmVMcE1C?=
 =?utf-8?B?My9KNVZKWjU3bDBPRVVWUkgxaDVpNDZVTVVtT1BsalMyQitNbUxLZGF6WnNJ?=
 =?utf-8?B?MkE5VGtwRUc2VzZVSjd0RHR3c20rakY2Y3dvNEdhWTcrWE5uWmk0V3dCWEdL?=
 =?utf-8?B?WC92RkRDanU4MHJQcnBiZU8yNXBLUUkyVnZENEhWMnorRVp0ZkcrMjJKZ1Np?=
 =?utf-8?B?YU5ZdWtad2pGZ01mNFBLdE5Yam1YRGpKU0tETGp5VFJIUUlTNlh5QzlITk53?=
 =?utf-8?B?SFA1b0xhcEFOTGtvL0ZVelRiNXByRUlBenBJaXFXUGl0Tm41L2N6MUJhZE9W?=
 =?utf-8?B?dHEzd0xkSlZla3RGdkFiN2VJUEFTdUM2ZjdzdDI1TWJkdDZEYzJoYTU5TVRL?=
 =?utf-8?B?NFE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	XLng21dowQnPel0Y4tIL1ZVQ00ySPS4W/HFSLuGJUKrsgFo9trJ7Y660SlFwTpHlHfRi2w6kqRO6D/s6yV62Yq7OxzVIXHNHJQ5vCpkepHfKWvDeuogHfNtq8p4Xn01aD936kteQ/Q8ft1+crqTn2lAdwkeY0q9u3jIilAwaLX+OYom2Bzr4VfRFJ3oEK2p/bA7VH/CyLwdCaeRYcI90WhbVI/VwD4iqkSXdxtcODLm2AXaKAyzExmrA8p9RWcSJKijJM3+EwJO15Pj98q9y9D7rb9KSZjnH4YU4E2nOsPROALQe2wBCM2lxXVkraKqlMEDZOMcBM4jxbC2QlFJjFQ+R8KHUqpP1x7Sh0bfK/dsbEGIWDDTIZP6Nkux4i7q4ikH0k16glw0DP39FL/hMc+1pXwncTkKxof9/V+0f9IAOkzULobl1R/UiRNfUF7+ZUZSZQ+fVsXTgX+VZgUS0wtEU+8aJc7/hYjjHrjbYo02qGyVEn47MbxySrK0N0tfeCPQVVJk4cKa2c7Gc/33NVfApebOIq/OHegJYtt5MvjmgggRMTXUc5RetC86eZQR8O9shIvlvOyqALEFuq3924NofxOkf9N/qlFqxsiuDWWw=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ae7739b2-0fdc-47d3-9452-08ddb9780b47
X-MS-Exchange-CrossTenant-AuthSource: DS0PR10MB6271.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2025 14:52:19.6960
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yExGC3Xrb3ZcIJhuzg+G/o5SiyhVaLVDa+vdnnJFwRY2ar4Uudgi0RD0XQ8bqBI/l2xOIWg7zcXe60s0tFbBpQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR10MB5031
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-02_02,2025-07-02_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 spamscore=0
 mlxlogscore=999 malwarescore=0 mlxscore=0 adultscore=0 bulkscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2507020121
X-Proofpoint-GUID: auVyMQA0Yzija30E4_CbGUKrJ4dz2UvZ
X-Proofpoint-ORIG-GUID: auVyMQA0Yzija30E4_CbGUKrJ4dz2UvZ
X-Authority-Analysis: v=2.4 cv=b82y4sGx c=1 sm=1 tr=0 ts=686547a7 cx=c_pps a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=5O_HXVI5q9PNTBITXfAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAyMDEyMiBTYWx0ZWRfX1EkINCJYq2YI rYwRBzPy5S/D2fK9golDwwSR9LAayPc3pvYM63kOr6AJ1duEXU7W58GRz8lBC0A0Jnr2UQJo/6F U5rdCgU6L4dBAGClrOFtOFYqeWe9jQR0ivMAOvXIy2LNk3HLFPY/E2Wu1cBKmv+3YnkdZJekPVI
 LZ5r2FoGZmPX01Q9SPinU7PnppVzR9nVnwrnyyH4CuNIMG/N67wEL0D7mVXbr/AukfBF6sY6U6C oieQy9XSd1uHOq4Ce1/BPM4k+KB9poF3f8/ikCrmYKtGpKBj6XEIHSkhs+MAJ8vpm6G076dCN/H m9ddJkNDOp0gZWQxxx7BxPWCgdoZOO1KUXO1FA/5IpNs6fKdsrXG0YypCSoElAL659bldpVPAQS
 FsRyCFbi05IFKvexORRNb1r3wI+g9roZQCUAxq2vwwPC1x+DjKxEC+YWVsLjsVAZg6obj/SB

On 01/07/2025 19:31, Eugene Loh wrote:
> Very simple patch, but one key problem.  The changed line is preceded by
> a huge comment block that goes to excruciating pains to explain why the
> value should be 4.  So, I'm fine with the change itself and I think the
> "Because of the complexity..." sentence in the commit message can be
> dropped, but the comment block in the file needs to be updated to
> explain (with corresponding pains?) why we need 8 (not 9, not 7).
>

Ah good catch, forgot to do this. I actually think 6 is enough.
The additional seems to be a result of the various complex inet_ntoa*()
calls in the tcp.d translators; some have ternary operators with
multiple inet_ntoa*()s. The origin appears to be dt_cg_ternary_op() and
that has the comment:

        /*
         * Strings complicate things a bit because dn_left and dn_right
might
         * actually be temporary strings (tstring) *and* in different slots.
         * We need to allocate a new tstring to hold the result, and
copy the
         * value into the new tstring (and free any tstrings in dn_left and
         * dn_right).
         */

So if we have a left and right ternary and both allocate 3 tstring slots
for inet_ntoa*()s that means 3*2 = 6 tstring slots should actually be
enough. Additional testing suggests that is so; does the above make
sense or are there additional things to consider here? I'll update the
next version with a comment describing the above anyhow. Thanks for the
review!

Alan


> On 6/10/25 09:58, Alan Maguire wrote:
>> Because of the complexity of the TCP translators, more tslots are
>> needed.
>>
>> Signed-off-by: Alan Maguire <alan.maguire@oracle.com>
>> ---
>>   libdtrace/dt_impl.h | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/libdtrace/dt_impl.h b/libdtrace/dt_impl.h
>> index 68fb8ec5..10424f9c 100644
>> --- a/libdtrace/dt_impl.h
>> +++ b/libdtrace/dt_impl.h
>> @@ -218,7 +218,7 @@ typedef struct dt_kern_path {
>>    * - cleanpath() holds a prepended '/' char, a string, an appended
>> '/' char,
>>    *   and a terminating NUL char, or STRSZ + 3 chars altogether
>>    */
>> -#define DT_TSTRING_SLOTS    4
>> +#define DT_TSTRING_SLOTS    8
>>   #define DT_TSTRING_SIZE(dtp)    \
>>           MAX(P2ROUNDUP((dtp)->dt_options[DTRACEOPT_STRSIZE] + 3, 8), \
>>               72)

