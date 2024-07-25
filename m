Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0D941741FE
	for <dtrace@lists.linux.dev>; Thu, 25 Jul 2024 10:50:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721904608; cv=fail; b=VTM61259DahzQ8qfP4SqQhghS01NaKg/e69ti0QKkkZeJgRZBdhFM/GOok8wIf/b0mrLSKH/Zg/ositQGRXGSWCkI5BlUTkmK6X0J4nf41Y0AZAadP0keiR8JqFWwae7cSPJoMWVxVhdi4N/l4w5Ik5OVOUfE/Glo8M+Z9slHB8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721904608; c=relaxed/simple;
	bh=6G87O7g8dKtqa3aS9XsMEEwFM+vPvp9FEnBcIj5RJlM=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=gNoB3qlv5aXr6Ob39BX4oLjjMxDCisgAArLxHh6/qb4jNKHPQwFEia1PEYpQjI4m8y0Y/2RleY4/znSQs+Y61VFfo8EAQzX5J8lOpfRoi4l1xuLz09s0kDrFk/bvmSqQ6cnNouOTMcK6AzXOiL8d9nzhKf9w82M/HXup5M+r6O4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=n7twe7Sh; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=peUosTxH; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="n7twe7Sh";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="peUosTxH"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46P8fVVi012625
	for <dtrace@lists.linux.dev>; Thu, 25 Jul 2024 10:50:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	message-id:date:subject:to:references:from:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=
	corp-2023-11-20; bh=aIFztYkWU9MNU04RQNOiuMtH3ke49YwfQMTCMdyVf2c=; b=
	n7twe7ShKR/SAToB1p5dUjeLvbtkx8DoziMklvdv0ehfe0IKY8aXeXlTC7bFtqu4
	J3SZKkIB+kTEzXM1emIZxG7yPfLGm09VR3i+mcrT35p0E3pMDM6I77aF20QBBo6a
	3Ptx5X1kdTvLmJhpv2IYv3HMA0U7WD+SQ5kFZroLXAHgFbiWwVxfSaivREoR+dMM
	Sn/hW1RtT36j2+4AzB278SPBSU2l1FjdzofPbZAYvqOBWtwiFI6z4tlg7fJ2dzcJ
	fkHME4lhAdw6oaR+O0vkY/G0L5KA4ihP7xkjIAVOwV1o/eg0SMQDsFNMJ8xqGYYN
	HML82JujVy7qc6o0MPaK3A==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 40hfe7k805-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 25 Jul 2024 10:50:05 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 46P99GBV039017
	for <dtrace@lists.linux.dev>; Thu, 25 Jul 2024 10:50:04 GMT
Received: from nam02-sn1-obe.outbound.protection.outlook.com (mail-sn1nam02lp2040.outbound.protection.outlook.com [104.47.57.40])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 40h29tw768-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 25 Jul 2024 10:50:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aEMGzGcRyqBGLbtw6sst+JSXTO+dtMjriy7xJZ9/mB98yBs/HyHKujtbWxQ6HHJ1PY42MlccOb+iIYg0wanEep8ET+JeF28nb2x29b1GypUVczAoFgxbGAMhBPoZVcr79aWxVlIgNqo5foMEFdQ+9iue1h8Z5ScuVPAeAj6In+Th++qXxT18K6K8k8Yr2pvDUGbp4JlTt2lQgvR7Qotfh8Qzrvz0vsiHdIXUmt7kFuo3WWkLmLcSo6Oa92JBTSsGU2cO1zc3dsRIDb7iDJzFXy5ZfvSK8Fp3FkMcaqCf7xrsJENPFIgJyHWlGztvbiFlP6GebO28R6lBT0eySiav/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aIFztYkWU9MNU04RQNOiuMtH3ke49YwfQMTCMdyVf2c=;
 b=FbC00RQkn74T4ktajrhlW5jdjEZiR11EmGyZq6dW+0r/iFZRxjwbVm02mAW6DXf/nkKRVXSMw//ungf7xLQs7A2UlAj9pYqQ9qeeTtiUwfEz9FfGlaW3gmpjkWrszOrJcO7eFD8kC2euDLypcqfIUr5B+UVkZi96BDhiHc1kSVYZzDJTi/QkoEp5dKCBlz88RRjkktAsBiMu/aMsKr8LqHbrrD8SbwCYH4GlY7febKK34mwndR9viEDFFKNG7o/aZn7aPZrHMhrmMdm/0jeZMwdHOxDrCM5Yuj1TYwymQ4+Dm70kfLH/odpPjhGQsxpjVjiMAn/xFHMMPRsOtNFXvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aIFztYkWU9MNU04RQNOiuMtH3ke49YwfQMTCMdyVf2c=;
 b=peUosTxHzrMnPlCRJ+9o/luMEd5ICnSKLvKznaERj0b4YQDj2TW2DtcVFUQctLML0y2ZWSW+ADs9P2hG8ED8rA8d23CTjlrazP8VMSuZPeu369USmkSt51zbPcb1GZIdWH+LTmxnYfNysBjtYBAHwOcSSCP+JCq9Cvmc2QCwoog=
Received: from BLAPR10MB5267.namprd10.prod.outlook.com (2603:10b6:208:30e::22)
 by CO1PR10MB4433.namprd10.prod.outlook.com (2603:10b6:303:6e::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.20; Thu, 25 Jul
 2024 10:50:02 +0000
Received: from BLAPR10MB5267.namprd10.prod.outlook.com
 ([fe80::682b:c879:9f97:a34f]) by BLAPR10MB5267.namprd10.prod.outlook.com
 ([fe80::682b:c879:9f97:a34f%7]) with mapi id 15.20.7784.020; Thu, 25 Jul 2024
 10:50:02 +0000
Message-ID: <b95e22cc-0d18-4f53-a544-e7c8b1b13722@oracle.com>
Date: Thu, 25 Jul 2024 11:49:56 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [DTrace-devel] [PATCH] btf: ensure BTF-to-CTF conversion works
 for modules
To: Kris Van Hees <kris.van.hees@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
References: <SN7PR10MB6287CB0F14DD5FBF62319CBDC2AB2@SN7PR10MB6287.namprd10.prod.outlook.com>
Content-Language: en-GB
From: Alan Maguire <alan.maguire@oracle.com>
In-Reply-To: <SN7PR10MB6287CB0F14DD5FBF62319CBDC2AB2@SN7PR10MB6287.namprd10.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS4P251CA0007.EURP251.PROD.OUTLOOK.COM
 (2603:10a6:20b:5d2::11) To BLAPR10MB5267.namprd10.prod.outlook.com
 (2603:10b6:208:30e::22)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BLAPR10MB5267:EE_|CO1PR10MB4433:EE_
X-MS-Office365-Filtering-Correlation-Id: 79d765ce-133b-4794-8b1b-08dcac978901
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aExVVnE5aHVNOE5oTmQ3SEU4clpYdm44MThGNHhMalN3dXM1Zmg1UkdFaFlx?=
 =?utf-8?B?aDgrcktHVitrZmYrQTNVSVZwcUVvbDBjWkVxQ0thYUFzWFd6djBzOXdhYXlP?=
 =?utf-8?B?YTBRTmlXcjdLd3Zkc255a2hxYzMzL3ZFcGx5YkRaZzVncG5hTVlQbktUOXJD?=
 =?utf-8?B?TmVMTUlzVFpIWjdGeWFySnMxWnZvK1FBanV2TzVlelA5ZGxvaTV5OU00a013?=
 =?utf-8?B?a2NhMWZubnRsbHN2dVNFT25oSW5tcC9iQWFQUWhMME5UWmxzeUM5ODVNYmF4?=
 =?utf-8?B?SzRFaWs1NzZrMldrOFJvVjNKKzducGE4bEFhTlVRTXh3MG9UOFdVT0VqZG5t?=
 =?utf-8?B?UWx2alhHem43blZLVGxHdXVRandFOUdkeGJaY3ozbGNWTER1THhsSGYyTHB0?=
 =?utf-8?B?M1o5STVCSUlzMVRXYUczak1rWnphcG1lTytNbHpFU3ZuZ3czbFNHVlR4d2x3?=
 =?utf-8?B?WExiTnlGek9MNDB6VWp5bHI1Nm0vUEFtQkNTMExiRU1oR1dyQVJXRlpRbWRY?=
 =?utf-8?B?dTZsYjN6RktNODRBZlMrL1dUMFFsWUNVenpJRHJnL2V3N2ZDajNyZHpTZyt1?=
 =?utf-8?B?eldscGh6SjkxYVdIWVNwR3VCRTBEV3ZhVCtrQnFYbTY5N21LdG9jNFF5Tmtw?=
 =?utf-8?B?bXF3UWJib25ZNEdFejAyRXN3Slg2dCt4V2h1ZlZGMEJNOGZ6K1lvcE40YUl2?=
 =?utf-8?B?Y09hTzJQS2FxdG9JeElQaWhUY3V2dkJlVEprbEVkTSsvZmZNTWJMUTd2SmVU?=
 =?utf-8?B?MHEwM2ZpYm5lTFpPMWo4czZKVVFQb1lNcUU2bDFsTFFwaFFYU3MxMUkyWUc5?=
 =?utf-8?B?ZVhFZlpTWnRCQkNQdWQ1UThLSk1mdHJjcnZWdTZOSzFONWxXU2dHMEk2N3hR?=
 =?utf-8?B?UEY1TDg2MWdka1ByM0EvV1FKbTBacC9ESDBpRS9oVzNLMlZNMm9Kck9Yb0xK?=
 =?utf-8?B?SC8xdFA3b3N3ZHU5aEFxemk5aTRPOUsyRDEzWGRtTi9TNkNPM3AxcUNaaXg5?=
 =?utf-8?B?aTg5ZmVZWXg5SmxoNVZQUi95MTFoUU8xWW5aSHJUUDV3czVQb2t5WVE0cVg3?=
 =?utf-8?B?N042UmdDT1NkNlF5U0FEdEk0T0ZzYmZyaXBLM1F6OFBxT0tJUitENG1HeSto?=
 =?utf-8?B?SGxMYitXeTcrNzRua0VhTlpxeWQ5SmVYTE1MOHNrTVY5UmpST2ZiN2N0M29l?=
 =?utf-8?B?VzRlUSs5Y3RweUM1eVlKVkhMcVVqQ095TXBiL3lyL1UwdUc3N1Axcm12Nk80?=
 =?utf-8?B?cjJDK0RTS0hkVDhIZXhhYWJrRjA1Z1F4SncyaUlhVXBBVU9EbXR4KzI2VytV?=
 =?utf-8?B?QWtuVnI2T0FuTmFvQ0pqc0Z0dXA5WW1mclVheHllVlEvZW10L3dCaCtaUkpH?=
 =?utf-8?B?c1plL2Qyb0RWdDAzVHR4QXJuR1lzTU5zaDJQaThQd0JiNUt4L1ZjUmNHMCth?=
 =?utf-8?B?YVpPNzZGTUt0dldCVldtMTB3UThPL01JdGV0R3lPOElIMFViTUQ1Yy84YUMr?=
 =?utf-8?B?M0V2cFJ2K3NxUXlVMDlHNWRzcDBKN2QxVEVDUnJVTzR3M2o5YzJveFZ1UUpz?=
 =?utf-8?B?anFuVlptdWx6d3NnbWJ2akpTU1Nrbm53WWlheFl1aEEvL2N6Z0t0NlpmUTBl?=
 =?utf-8?B?UVMvRE5MWlhrMlhQbTV5QTlZZUdPM3JKdkhkaHAwa0UreWN4R05BdVJnVU9R?=
 =?utf-8?B?dVRmQ2Y3Z2c2M2RnclUzUkZLcGRzQkhHVDdPZURmZkpaOEUxV2YvdkgrYkNo?=
 =?utf-8?Q?XEQ7tRKWClfzfQgFsg=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BLAPR10MB5267.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YmZWUkgyVDdyUDY3U1dYWXk2ejFGRkt2c3c2M05qR1dEdlI4WkhETFRickJ1?=
 =?utf-8?B?UmNkUEcyNVdJbUhiNE0rZ0l2SmdRdjUwK3l0VTQ4MTBXczkxeU1ZYWlKMHlP?=
 =?utf-8?B?R2lHK3l6RzdsVHkwTjhWTTNaZDVpZVBadnByMC9ObjNucmpzNVc4bGtrL2o5?=
 =?utf-8?B?eXBKVENoZVE2ZFFERThLQkcrVm1KTWxLSnpKd2hHc0lqelMrSGFyaVA3ckRi?=
 =?utf-8?B?Ym9VU3I0Q3V1WDY3S0o4MXdoNGRieW9mT3hzRGdWcFZCT0YwNlc0SWc0K2RP?=
 =?utf-8?B?S3lkWHpxZ21hNXlubkd1Z2NpQjhVcWJSNFJxNExvNjZub0NuUnhQeXVDbWdK?=
 =?utf-8?B?Z3FSdXpTTDJtUVhBZk9JZXYrM0dDTWRiNTFPT0xHUzdVUkVtN3ZmZEFtODl0?=
 =?utf-8?B?SGJ5dW1VNVBza0Zhckp3eVRRR0dQeVNvRGJ3UmFZeDUydnpZVWg2MmtnOFZ4?=
 =?utf-8?B?VFhQeit0Z01OeWdINnlwRkpBMjBnV1M3ajNPN0hHbkVDTTZWZ0M2azBzV1Qw?=
 =?utf-8?B?dXFvQkFtQTZOSGpXVjhYRWFnM3VHd0dmQkh5UXRRKy9NT2JKUHRDNDh1YWxi?=
 =?utf-8?B?eG1pTjBDczFlcURIeDgvQW9DU1F3V0dCdk9NMFc5SzZJNnJQYUxLOXdaTGZP?=
 =?utf-8?B?Mis4K2lMNGpuY0E5UWIwQWZKWVdCY0xUV2pLMHQxV24vU28ydDNtSTVpelRt?=
 =?utf-8?B?ZWtnMEd0NWpDSjh0Q0RkemtSTjBtQ2orNUlVemwxR0FOOU5jS0JYSWFiRzkx?=
 =?utf-8?B?MWpoblpsS29CSjNGZjNMN2NhMmRyOEdNWUllTGpWdUNkUndFRU5oTndqQ0N6?=
 =?utf-8?B?Q0tDQU9OTHJueGNuNjVWS1EyTUFBaEwvTnVETnBQaXVqbjAwdWRwckJKOFlO?=
 =?utf-8?B?aTBFaGFVWG92VEdRQkw1WTI1Z1FFc1dRVDZlT2FsUFdEQmFRckVyTGFyWUNM?=
 =?utf-8?B?dHdTUXp6b3RpT1NJaHVMSnFpRkd3U3FhWllMbkMxNm1qK041bVptVVJrcllh?=
 =?utf-8?B?VkdvYkFydDFwZ3VCQ1oxV29kUHVnYlFyWGFVeW85RVdyWGxFSm1WcS9QVHYv?=
 =?utf-8?B?VHMxcTRzZlpLaGJna0FCeFk4UE9FenVrQ0dNakVBa3daQUNYeHFkVmtpWldi?=
 =?utf-8?B?UlB4bGdtUmRvZ1MwM0R2SXQwdmpZNnkzVVJCL3k2TVZ3T25LaTU5S0dRMWxs?=
 =?utf-8?B?cHhoZ3JCaWlPOHpmc3hJYnNoQmx0MWp2QUxmUlpvYjFRSkFoWldiZzB3RUVG?=
 =?utf-8?B?S1Z3Smg5WmljMWpCazZjN2o2a2RrMDJscHpuUnprWnB1TmV5L1N4cWhjcHND?=
 =?utf-8?B?MG5IbFlDaWJvL0dacUpjZ1hZWU8zaWc1VkNYOWJydDRaYzNjY2pTUmpqSit4?=
 =?utf-8?B?OW1XcVB1OEJPTmlOWmViWWhORVhkMFlwVll5a2lwMTA0ZzR5NGx5b21GZ3NO?=
 =?utf-8?B?L3pqV2lhblkwU0FXb01vdW5BM25XaFA3SmduTHc3OTExaGQ5WVhjZHFCWFdR?=
 =?utf-8?B?ZEZNVUJ2UjhoUU40Y0ZSdE5LNWcyd0FaaENoK0FFRzA3WU1Kd0UrdXJaaDRV?=
 =?utf-8?B?RlBzcVQzZkliUkRVcktoblpRM3FzVHhvaEJ3NTZxM0wyMDZ3enNYVmFUUm9R?=
 =?utf-8?B?eG5LN2tjUnpZVGYzR2Z4SGJSWFlzRlZHeFdTZ2lpQW1Sdm5rY1JYd2RYWDlG?=
 =?utf-8?B?M3R0MXBydjBIUFBMWWVOU01Denp5OGlMdzBPRXlLbDhFRXVVcFdXVlVqZ09h?=
 =?utf-8?B?VklZUmVnaTBvRndFdmNMTlJZTStvM3AzOXR1ZXdTd2xIK1NBQ2ZLWkRWeVlY?=
 =?utf-8?B?cm0xVnYxdTBvRkh3dzhkNXhmcnRIQXJtNlVDbzYrc1A0L0VLL0xJY245bUJP?=
 =?utf-8?B?ejhvbWM3eXU3NkRIaEg1b2NFbmlPbkc3OUgwWXpGenZUeStYY2gvKys4djNx?=
 =?utf-8?B?cDZ0T2hCT1hraU1GakJEMG1WdDRVVWMxdWRPNFlTeENpQkZRbkl5YjRFazVT?=
 =?utf-8?B?azJSemw1QXI3azlTZHlzcVdKUlBXSXpua1gvazdhaHNYcU5abTJHZ01kUU1q?=
 =?utf-8?B?YnVHamNtZjVLeWtsSW5KdGtnc2R6QWI2TEF6eVdHWmdXUVR4eTFyT2dRZDdk?=
 =?utf-8?B?ekloeTgxb2VINWxGb0poRVFlQWE1YmFTc1NITitvOHFNSi9XYkdWNC9aRVhM?=
 =?utf-8?Q?IlNC7G5XZOO3FtDb4rZsvRg=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	U5uap5TuBPWu4hwI7OF36esMkr/M2jO6w5aJlshTbaP0v6wU/ue/UF6mLkDg45ilZjShE43b/VBWLktUWkbCybEedb9xqF/XgCt2sq84WtLIPO4uZYz2L25oleDZJ1pSvFSr8mdBFeCjdvsE6809mdjSymdtSyCoWX2TCpoFrbEndztFJ5styKHhl7QGmqZtaW8/fNkahmlXObsQrPnli8fsYYa4AQE4MP/TAkQjAuWEKvdcSyBRtp/1SzLp5eLhgRgstfhei+5kOSPSvMXsZLMOdCRGhTGSoV1WYGF/YT77kVj8BynSeZCgGuBDVt1Glqy7LAxUKn+ThIXc0FX2w71W2Xw2gfemBjJ6m8aN07OcWZyWJJjDz/gOWIyAEzxG6eq2JXVLJkLNpTmv/jAE3BEr0XF7fJD7CZlAgo6uw8s7CjyaPG9ymtVn9BC0i+VjeSeJJrHGqVkyXg4LEFJbcpazTnlvFPZeBEEUZWHIqm4kKB4/IMv3Z+ui/3J7VFWfOKbNxATdhHsmnzwmEds0S/UVNsN0XQ7S6D5oWSKwI3+R3HebviZhawdojaOE/KzVUvx4/tm0HAtqusikwA6Ki5mOWXq5K6wPfpVkwSbVF5E=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 79d765ce-133b-4794-8b1b-08dcac978901
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB5267.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2024 10:50:02.0487
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4JYnjzewY5J9Lgh5q/hjSpLxqay1pTjZGSZkZgD2LAsLaR3zEoy0nNByu8zNHn2dZ98gjhl3Qvd0S03jih/nXA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4433
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-25_11,2024-07-25_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 bulkscore=0 adultscore=0
 suspectscore=0 mlxscore=0 mlxlogscore=999 phishscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2407110000
 definitions=main-2407250073
X-Proofpoint-GUID: jyckeo96fy_Blj4Ue22CeCObUOdXfYf5
X-Proofpoint-ORIG-GUID: jyckeo96fy_Blj4Ue22CeCObUOdXfYf5

On 25/07/2024 05:56, Kris Van Hees via DTrace-devel wrote:
> The recent introduction of code to always load BTF data for modules
> broke the BTF-to-CTF conversion for modules.  This patch ensures that
> the BTF-to-CTF convertor code is called from any module that does not
> contain CTF data.
> 
> Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>

Tested-by: Alan Maguire <alan.maguire@oracle.com>

Tested with patches 1 and 3 from [1] applied.

[1]
https://lore.kernel.org/dtrace/20240708145404.1673045-1-alan.maguire@oracle.com/


> ---
>  libdtrace/dt_module.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/libdtrace/dt_module.c b/libdtrace/dt_module.c
> index 5e608446..cbbb1d3c 100644
> --- a/libdtrace/dt_module.c
> +++ b/libdtrace/dt_module.c
> @@ -962,8 +962,8 @@ dt_kern_module_find_ctf(dtrace_hdl_t *dtp, dt_module_t *dmp)
>  			dt_dprintf("Cannot open CTF archive %s: %s; "
>  				   "looking for in-module CTF instead.\n",
>  				   ctfa_name, ctf_errmsg(dtp->dt_ctferr));
> -#endif
>  			return;
> +#endif
>  		}
>  
>  		if (dtp->dt_ctfa_path == NULL)
> @@ -1018,6 +1018,11 @@ dt_kern_module_find_ctf(dtrace_hdl_t *dtp, dt_module_t *dmp)
>  
>  		dmp->dm_flags |= DT_DM_CTF_ARCHIVED;
>  		ctf_setspecific(dmp->dm_ctfp, dmp);
> +#ifdef HAVE_LIBCTF
> +	} else {
> +		/* Generate CTF from BTF for the module. */
> +		dt_kern_module_ctf_from_btf(dtp, dmp);
> +#endif
>  	}
>  
>  	/*
