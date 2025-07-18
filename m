Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB1B92E7184
	for <dtrace@lists.linux.dev>; Fri, 18 Jul 2025 17:49:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752860984; cv=fail; b=DJU4ZA1pW0zwoWm461RGHIcMRQw7zHi//0TJVRXzzcFLDqwyMXgQXCTt4V2SPrzvgBbte9sifFtWdHushPRuTlV0aBYtunt3+/4fB5N9dgEsCaK/BP9SjeGSpRppGF3MAYqcX5ejHnUNjazbm9hQyEfkFn769drDfJ4HuXLBhYs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752860984; c=relaxed/simple;
	bh=ZGO0yI+MJtIgfwtCFabjhqW/PVio/I+prJU+RX5u490=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Bed1duzIGVTc+dOl8zsAp6L1wYGnaGuH/o5kNk5LtnMnArv2XkcdZkkbuqC2c7YOes7/JHk1a0gMzsCzoXtPOBtHWnh8TSNOaEGb7lxQYgj2lZZWNorOfSx/4UBLLYSIE/CLZeYJ1kh0Tky5+qH0Zs4s1PTkqQN2U4fVjFodJVc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=ZJdPeRFO; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=OKgcDisv; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="ZJdPeRFO";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="OKgcDisv"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56IHIefF011284
	for <dtrace@lists.linux.dev>; Fri, 18 Jul 2025 17:49:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=0Ud9yG72Hv0B9nD91VMyE7CNulxy8y3pEMAmF0ZeTv0=; b=
	ZJdPeRFOiSZq2FQb+8E798NL7Yn57lOendcs4a++vMjPd3B+xzSn7nPE6Hunw8JY
	6LW1doX1B+eF75KakR4QXwmZhPbk2UXB0E1z87acsUsjLZWL+X2BcMixLXMfYCQd
	BQbCgG29RrtwwLPPGEcG0gGxgJZu5x1/3GeGdB/5j8FlUfkQ54NHXW9OIIHUS+Rk
	Cq1f+ML1LbWZ5mfRqNcTkGfjNPln/EFFp3Xn2nXtAA2KfNSAXi1Lr05gcAH+aciB
	Bmapfe72MI96qmfZ4mYrPx76z0MSgUIThPlAxboIDC85OwoCG4hioLRhVT/Xp4eW
	5ha7mgRONynE2X/L6q7vew==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47uhx85rjm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 18 Jul 2025 17:49:41 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 56IG2sbU011826
	for <dtrace@lists.linux.dev>; Fri, 18 Jul 2025 17:49:40 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12on2070.outbound.protection.outlook.com [40.107.244.70])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 47ue5ed39d-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 18 Jul 2025 17:49:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Fq7nu0xNoJD8Lfl7MpJa8AOV2RfKxh6ZUu4W0pXv2qI3H5VQZA45jJMhybCArDzev48ARyCVzWCBtlj7sff1nxVy7y1GCz1TPD7P9/nd7Z7RlAql6YbtMleHkzwazuvE5VstNE+VvUyaoheq/MenInT/MNYuQQdjFB/6ZPd1dgakazlYlIwUuxrg19IC4Gvd39JNECTG4Kf+bXx/KOf0rJoS1K/LxCdVmXeS7DuClNnlCCA3m0fp91vvmtsZ6pgIvWuBl3AaK0ONYtQ+ljnV5Ffs+UqABD5gUnesfcf+OPRUR+/Fp6IKlBl+sAss91/XT/D8uU7HduESGSlcDhUqhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0Ud9yG72Hv0B9nD91VMyE7CNulxy8y3pEMAmF0ZeTv0=;
 b=u5p6sogBN09jLOYYuZ1RgSZrnh1tKIPhFHbFHeG91FUINoj9SawPOPlgQWD9xoW3Jj25B2musnZvUsTvoiTVuco13Dpx4icazcu6skUrWGmshrKvvL649Gxu5eislIQAIas+W3Zljhojs7N0MpiKE81iYAjfM1yqAQHiBAfImPaaYhYl8E+2plxkqswVkuNrwtYfxBr3p317FfElsscAx3JW31UIoxwfRj8JpiNhs6QXVAOJZn5hZgUZgJbXTbsoZmPY56qUbL29ILI35NeexC7VbkZ5kttntZ2DY62BAcHRIiGSk59EOXUPaTwOHtKFSDfLcyj8g8U4GYDEzMXGaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0Ud9yG72Hv0B9nD91VMyE7CNulxy8y3pEMAmF0ZeTv0=;
 b=OKgcDisvVRGoAdSiMszJTvKQksuYobPeTrSR/uILV7P0PUVGlXzvfDDIPtfiPP+yR9o/qxWQVExZ3MWn2FEE60GsksIDCFLTLnJNFo811dsCVvhj6CBnypoN+GljT6s5fWTnq1mjCTBdjxSk15d8nJcNKIex+CnjRbPLbi9desY=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by SJ0PR10MB4672.namprd10.prod.outlook.com (2603:10b6:a03:2af::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.25; Fri, 18 Jul
 2025 17:49:37 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%6]) with mapi id 15.20.8943.028; Fri, 18 Jul 2025
 17:49:36 +0000
Message-ID: <08d2302b-7f57-eda2-9627-c4a434e1acd2@oracle.com>
Date: Fri, 18 Jul 2025 13:49:35 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH] tstring: fix leaks
Content-Language: en-US
To: Kris Van Hees <kris.van.hees@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
References: <SJ0PR10MB567251942D6CE4D38E71903DC251A@SJ0PR10MB5672.namprd10.prod.outlook.com>
From: Eugene Loh <eugene.loh@oracle.com>
In-Reply-To: <SJ0PR10MB567251942D6CE4D38E71903DC251A@SJ0PR10MB5672.namprd10.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PH7P220CA0054.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:32b::11) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|SJ0PR10MB4672:EE_
X-MS-Office365-Filtering-Correlation-Id: da4d9496-9346-43b4-6824-08ddc6237647
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?L2N5TjkxRGdyYjFXUjArdzYzZS9vcFk4VTFZaHJ2aVlIbmE2emdKc2dzT3Ax?=
 =?utf-8?B?a1pPMGYvbkZrNWVZOWhJM1p6S2hqemdJTHRtYzE0MjRjU3pPcFR3NUJSNnhj?=
 =?utf-8?B?aitjZFNTSHN5cjhDRmJXQ0FNOENqL1RHWk9pZUdhblVldEtYUGRob3pLNmVE?=
 =?utf-8?B?UVBraWFyS01qNm5oUVczYlBTKzBKUUpxaHJZOGxGN0FSNGFBVWhQS3ZJYitG?=
 =?utf-8?B?NlQrS1owMkpZQXBtNGZhSzBJakJFY01kUUlsMTE5Qjg3T1lVbmlSd3BaSnd5?=
 =?utf-8?B?MVNuNDR0TGdoeE1KcVVRbHVtMmp5NlFrWXl2cEtyUk9jeW1KRjZUbWlpYzFV?=
 =?utf-8?B?L09XcWEzUkJzM2VqcExiV1UyRGpYV0QySldHdmdUenhRajdjYVZZQmNadEFi?=
 =?utf-8?B?NlpuK2h5dXJicWU4V2YxU1ZkYlYzUml4c21KT3NpT01aUEEzcjFVb0RUdXpU?=
 =?utf-8?B?ZHd3c0NEeGhKNW1hY1dDZ2hOR2p4TWtQZ1RDUnpLVTBnNDNsclR3UXhYbDNa?=
 =?utf-8?B?OW1nQkp3VjViS2dSc3hOekJReWR3OGtFMWxjUCtCWlZXNEhqaTVhSWhLMjBK?=
 =?utf-8?B?ZUIyai9pa21CRTBUbHZ3MjlEcUZuWEdlbjUxOTcyWnZ5d1lpa3hqME5HcHVF?=
 =?utf-8?B?cUpxaEZaUHFic0xiV21RRGowSjFJTFY3YlpxV0lnUjJQNVM1OG03WE5PSnJK?=
 =?utf-8?B?SXlJcWhKd0FIZktyUVhzUDJsNzJ1Q3dEVjFFYmdod0tJTHl1QmtKSi9Eam9C?=
 =?utf-8?B?RmdNR2tJOWFIV2llRTBzNXlFKzJXR1RWNG5sRUJWM3FkUWJTd3FhYVdUVFl6?=
 =?utf-8?B?S0lyd0xQajZaWEhrRHJqRDZYaXhVOUdZdHlTU3JvQUpGdjkvaHNLOW9jTTVw?=
 =?utf-8?B?ZlV2V2ZCVWxEZUQ4RUVGSHhNdHlFZUswdUpXRm8yaWdwckZnU1FjNFA2Tms3?=
 =?utf-8?B?cGVkSS9PYkE5ck5pWkFoY2FMa2lXc21DK2NrUGo1c2U4d3hFU0FlVERibWh1?=
 =?utf-8?B?V1hnRnhiS2dKYVlNR2ZwUEI2VWZZUVlSbThteGYvQW0weVpGTEZ4c1ZMY29R?=
 =?utf-8?B?SmY1djdkUGZ4aHVJUkRVampxVGp0VGdYZzdjRWxHZGViQmdlSGlqb0p3dEhX?=
 =?utf-8?B?Skh3Ly9JTnZqc3ZGVlk1NEU5VlNPUi9XblJBcjJqWDVDY0pxRVhTSzYvSFU2?=
 =?utf-8?B?aytla0k2Y1pTMmY5MmZRNUUrdThjaGRCTUVWUEpRRUJYTVRtUUwyZmJOWHFY?=
 =?utf-8?B?R3Zvd1d3WlhkYmp6K2h4NVgvVVZKSjh3cE1PTnN3bGUzaHVnSWhUeW9Gd3lP?=
 =?utf-8?B?cUtKYXhWNHJQM2hEV1g1My9XVEJSaWVtS1FrL1ZnaDhZWGt6L1lOQVREd1hx?=
 =?utf-8?B?d0hHT1o2NkhMSzhsb0RwZVE4QTZIN3lxNTJISEZVNmVDZG15MlZUa0s2Nlcw?=
 =?utf-8?B?cjdtM2RmZ0VvWlpaOThaZWxHSStaZmtZUjRnMmtEZ2JTWXJrRlFJcGNRNXBi?=
 =?utf-8?B?bkpjOHNLb3p5UHU4dWxaMjFpTS9uMVVKaU5vWFZHNUxJWXAwVFpsVlhjTGRC?=
 =?utf-8?B?Uk1UbXRqNEl0Nkhud1ZaaDNDeGE0Mys0RkV3djNQWVY3bDVGUVphTUR4NWg2?=
 =?utf-8?B?TThsN2lSOGs4ZW5VcHdvSDdRb0g5TTczaldJOVltUjB3d0dTZWQyREFBNjB0?=
 =?utf-8?B?cjhKQ3pUb3Q1VlFmeU9zRW9hNSswblBJbEd4L041NlpqcVRlZTZKdGpOWWFu?=
 =?utf-8?B?MDFub0Q2Z0R2REpwNEMzbHp6NmsxUmR6bHNRNFZTMDg3UTVZbWJkRFFObDJ5?=
 =?utf-8?B?TGpBd3BoL3RlaGVCMXJ3VkVHcDdzbFZCNGprQnJQVlVrS1dxL0VROXc1b2dZ?=
 =?utf-8?B?V1pRd0drcXByNkVHaHE1ajlSTXBJRU0rbFdrZnhkM1pQU3V5Y0xuOE9scm8v?=
 =?utf-8?Q?+iypm18mdbI=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NnFCVUVJamhyOEtOWE1MZGZ1K1YvODVyWnQraDRUQVMvNFkwSEY1Q21oa3Y0?=
 =?utf-8?B?blhJZzMybEhOSVEwaWVXZ0U4NWVpT2VFZTEvVWI3cWIvcTloaUxJQXF4WlB4?=
 =?utf-8?B?K2hsQzcrU3JuanVZdmllSFJSL1RTSFMzNTN6dlVjYmNqbXQ3Q2FPRzdLbnRV?=
 =?utf-8?B?cjFieEI4eDJ2OFkrNXFlYnVOT25kRGdlc0ZNZGVPRFJxdlJKVFMwL2xCaG9m?=
 =?utf-8?B?d04yMVlORnVYVkhKb28yUldoSUZWd2pPT1N3ZGhmNEZMekdxSU9RL0w1OGg4?=
 =?utf-8?B?UnA5ZDRxOTFmdzZEUzNZU0FHL1JRdE93dDU4dFY4ZENDdFhVa0k2QStkblZl?=
 =?utf-8?B?RWdXMW15ZzltKzk2cGtMQzFTRHBYQU1sR1FNUU5rczNtV2ExZHhyNnBibDRB?=
 =?utf-8?B?VVk4TS9uTURDc0VTdWU0aWFEa3VTVy9ZcnlPeTlEQW1uRmhlK3JZWkZyaDYr?=
 =?utf-8?B?TXlUZ3JzdFlNQUZzMEp0TG1hZ2x0N0VyRmtYaENFd0lQUzZTdGpnaXZnUGdS?=
 =?utf-8?B?WDFHRm0rZU1Gb1FuRk9wczkzR1Y5UzI5cnZXQ1poSzJpbGR0b3QxdENocExS?=
 =?utf-8?B?U3ZlNGJLeG5pK0xNajZiZ2cwelRBQWJFRERVQUdGeStVWExJQ2k5V2d4VldK?=
 =?utf-8?B?Wll3N2JZVnBlVXI1TlV4SXhhWnF6QkpLdGpXNDVjeCtaTlVXYWx0bDVLYlNK?=
 =?utf-8?B?WXZVUkpFNVZhcnVLMno3aGxUOFV5eWphNHUwMzJBTXQrVmk4RUxDdVRLWFhV?=
 =?utf-8?B?TzRLVzVpcVJENkVMRzVFVmJseHFPRWVaR1hzNnVWVXBEdElZZUhtMml0THRi?=
 =?utf-8?B?Qm5OeWY1UW11Z1N6ZWZiNjl2ZUlPNjVmclJmUTE2TnVnRkVuY081QUhYbE0v?=
 =?utf-8?B?enM5aTdrZGt2bWJnWk9KeDhjRXNqZmd2Sk8wSjFaV2VUMm4vZlpzSjcrSndH?=
 =?utf-8?B?QUpnWXg1QnZTdytRcDlGQlA5Wk1vQUlTNDltV050TllCMllhVmx5YnhLQnpC?=
 =?utf-8?B?Q0R3QW9UaWU4bU9VekgyNTdXR2Y3SC9NM05FSnRvRWtvYzEvczBLQlRwVEIx?=
 =?utf-8?B?MkV3c0QxeHZhQzBWbnB5eWY4QUFOeW1oYnhZLzA5YTgvSCtFQ0hXSkxhclRy?=
 =?utf-8?B?NGJvWWE2ZVk2NGV0TytaNzhubkhLMjYrbTl4VXd6SkljbHJSTVBXV1pKeUlq?=
 =?utf-8?B?WDBhL1g5Rkg5L2YrS1ZDRFNlR0VoOXF4QTVQYzN5MXFydXZKNy9XRDJjR3lF?=
 =?utf-8?B?Vm8rM1pRcW8ydHFlNWtnU1hnb25SamZRZ0FzUFRpNWM0RGtEUHIrekt1VDk2?=
 =?utf-8?B?Z2M2eVRvUUR6TS9ScjRqNDl0aVJGM0krRk9kQlRDdzVyL3crM3JoU1VvcFAr?=
 =?utf-8?B?TUpSNlJoQkdwYXllMVdZQ0Zua1F2SzM0SkxMU0FYbTdYRGNSM202YlFoUGNM?=
 =?utf-8?B?ckxwb2xZVEZtQXNYMllEbUFCODV5UlB2UWRTUzhQY1cyL2wxbU41ZXBua216?=
 =?utf-8?B?a0p4WU9paUlFNUdyV2FJQXorZGkvdDVlK1JwQndsQUNwZDZtVEdaMnBWanEw?=
 =?utf-8?B?TWU3dTNYRVp1cmcwbERaclFZbW5iUlhocmJIQjcvd2s5WnRoM1VKQkFpMnBJ?=
 =?utf-8?B?SGpzdGZ3VzNxWDJpSzlHdkJrWWFtaFVlNTdlTmo1RlNLc0RGb0dleUgzdEhE?=
 =?utf-8?B?eERwRlRxVS9NRXRHTldMRW0vVnJsaVJLaG5JMExFRmVWZUZtbDduY3FBNkYr?=
 =?utf-8?B?WDlRb3Z4cnhxejJlb3M5WFp3QW5sdXV1R3hTY2c2Y0publhUVE1vV1Rhazlt?=
 =?utf-8?B?K1JaZ01NTUdvRlNVY3BKNnhnZlVzNFB2Mk93cWk3aHdSaEsrQXRZRXJEMmM1?=
 =?utf-8?B?c0hrM3ptaUEwdHkwbjg1aDVGZ2tCUVJvTE9jODFBS3piT3lSMnRxT3FVSkpu?=
 =?utf-8?B?SU00YTNWc3JsNy9jUSt0V2I1TlZHVHB6STVIRDdNZk03WkhsZDhuT1lxa1Zn?=
 =?utf-8?B?NU0yZVR3dVFMeFdXNFFyRDFhKzF0QVFDU3JSZEpHTk1nOHVMQmU3eVdkWDV2?=
 =?utf-8?B?WW5wUmFTTXVHeExHS0xaZnpkOWg5ZkNxTjZEdzd2WWtsYlBUc003anl0eHdx?=
 =?utf-8?Q?xVkgPfPbW9hkYsNob/5DFAT5e?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	UP+XD95rjTdU7VxPnkBMDME5jjKfK9wuP95hHVyeXSd7VVpBgP+tEUSC23cvhoITLAam6W0dxidSvRXG4vzpnAG6KbuVyyF3V8S6/Bqy3+rHsL2TttTZG8Nv0nGW4MvXuSufyVD42B2ZXRHven4gX/Nd+3etg6XzqpRj3RRKrBabGFI7QRzg9O6Sk/tlIRh1bqT2Ai5vf2I48Sfg8AfNAfzNhJjZKxPoBW0mxgmci4ys1nnrak17C3ot/snBvQR9+0lMVzkKUQqw4li0BTgZqftfpsvdCfec+24Zni0buKwj794CVJzfOwAgjVh7rTzVqf1yn8Xfk+yeh9Bsx3vq9cu+FbXPT3aTpSz15rNDkmxUBTe3Qeu6gyMV414lXpp6eIJt1XnEv8Wt6+W4E7u26pfzhc01RgBGPxvEIJpsgIiLuF+IDHm1lGRjJEHqOZXq4Ducm+8vOnnVWHEF0Vk76Gl3rRB89MZP2AhDSCeFal1Lt+a0avH1xBva1MbSLxGmGczTsufXdkMGD7VX72kDrHiC0EnsMx1V/aeZn29n4h9r9v0AGcTsAPmR0sG7GtPSY6ZvSCfirG8iQd5WRJutdQHH8ForMsFZV0SHTB5cqZg=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: da4d9496-9346-43b4-6824-08ddc6237647
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2025 17:49:36.8785
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9ZF45meDr2Dw2f9nq9NLQM0qhhlJ+2vFM+IEdBKewIzvp+10B5gWIeU/gG9NICxFhz6HE25lbqVnzu/lDoY93Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4672
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-18_04,2025-07-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 malwarescore=0 mlxscore=0
 mlxlogscore=999 adultscore=0 phishscore=0 bulkscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2507180142
X-Authority-Analysis: v=2.4 cv=auKyCTZV c=1 sm=1 tr=0 ts=687a8935 b=1 cx=c_pps a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=vi4WuiLEqtfSZsPwsUEA:9 a=QEXdDO2ut3YA:10 cc=ntf awl=host:12062
X-Proofpoint-ORIG-GUID: 1HvtJXKR9ZQ2wy94suX36x3xNNfM38n_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE4MDE0MSBTYWx0ZWRfX1dGTBYId6bh6 BtYpFbN6sVQ9nF1NPm33Bym829V3qMhUqVbEzgpt0PkB0F6Sxm8JzPDRMwoLPGyPrrlg4KgVPQe TN/BUxrpdHsKEu8ZlLqs8trbZ+bafU0fiZTxwa/b0ZfckZtZa00xogiPNwK23uG1L3BBiXGXWwI
 QX09TmknjNZOAwSc9zA+RocC46Pmad+POyGs2Hk/owk8vD2Ok0/YQlDqwj5MisYP0LHJZZAHliu BiI8moLjIIpnlyJIRxBr3cPdfKHUHktelt9CTRO8gLG22Lqu4X5aW4AMbM/EGG31v3P87TQBrU5 Op3hEXBiTkUypQr/gVYmz/HRQ9RzeTjylPFXpsSpJxGe7I4ChfQZU6yZIBUY5dACyowzGIgVeKT
 tojqs9UIGkYbt1cEXBaMfwIdrOpN6tJFf6fUwaLrqnAEOLM2RrJx+e/Wdu8AVsGfl6ZBzgSm
X-Proofpoint-GUID: 1HvtJXKR9ZQ2wy94suX36x3xNNfM38n_

I don't understand the details, but looks like the road I was heading 
down and the testing looks good.
Reviewed-by: Eugene Loh <eugene.loh@oracle.com>

On 7/17/25 14:16, Kris Van Hees wrote:
> Temporary strings were not being freed in various places.
>
> Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
> ---
>   libdtrace/dt_cg.c     | 12 ++++++------
>   libdtrace/dt_parser.c |  1 +
>   libdtrace/dt_parser.h |  2 +-
>   3 files changed, 8 insertions(+), 7 deletions(-)
>
> diff --git a/libdtrace/dt_cg.c b/libdtrace/dt_cg.c
> index c3376ee9..1a57686f 100644
> --- a/libdtrace/dt_cg.c
> +++ b/libdtrace/dt_cg.c
> @@ -1515,6 +1515,7 @@ dt_cg_tstring_free(dt_pcb_t *pcb, dt_node_t *dnp)
>   	case DT_NODE_OP2:
>   	case DT_NODE_OP3:
>   	case DT_NODE_DEXPR:
> +	case DT_NODE_VAR:
>   		if (dnp->dn_tstring) {
>   			dt_cg_tstring_xfree(pcb, dnp->dn_tstring->dn_value);
>   			dnp->dn_tstring = NULL;
> @@ -4969,12 +4970,6 @@ dt_cg_asgn_op(dt_node_t *dnp, dt_irlist_t *dlp, dt_regset_t *drp)
>   		idp = dt_ident_resolve(dnp->dn_left->dn_ident);
>   
>   		dt_cg_store_var(dnp, dlp, drp, idp);
> -
> -		/*
> -		 * Move the (possibly) tstring from dn_right to the op node.
> -		 */
> -		dnp->dn_tstring = dnp->dn_right->dn_tstring;
> -		dnp->dn_right->dn_tstring = NULL;
>   	} else {
>   		uint_t rbit = dnp->dn_left->dn_flags & DT_NF_REF;
>   
> @@ -5920,6 +5915,7 @@ dt_cg_subr_bcopy_impl(dt_node_t *dnp, dt_node_t *dst, dt_node_t *src,
>   	dt_regset_free(drp, src->dn_reg);
>   	dt_regset_free(drp, dst->dn_reg);
>   	dt_regset_free(drp, size->dn_reg);
> +	dt_cg_tstring_free(yypcb, src);
>   
>   	TRACE_REGSET("      subr-bcopy-impl:End  ");
>   }
> @@ -6958,6 +6954,7 @@ dt_cg_node(dt_node_t *dnp, dt_irlist_t *dlp, dt_regset_t *drp)
>   		dt_cg_node(dnp->dn_right, dlp, drp);
>   		dnp->dn_reg = dnp->dn_right->dn_reg;
>   		dt_cg_asgn_op(dnp, dlp, drp);
> +		dt_cg_tstring_free(yypcb, dnp->dn_right);
>   		break;
>   
>   	case DT_TOK_ADD_EQ:
> @@ -7191,6 +7188,9 @@ dt_cg_node(dt_node_t *dnp, dt_irlist_t *dlp, dt_regset_t *drp)
>   		dt_cg_node(dnp->dn_child, dlp, drp);
>   		dt_cg_check_notnull(dlp, drp, dnp->dn_child->dn_reg);
>   		dnp->dn_reg = dnp->dn_child->dn_reg;
> +		/* Move the tstring (if any) to the result. */
> +		dnp->dn_tstring = dnp->dn_child->dn_tstring;
> +		dnp->dn_child->dn_tstring = NULL;
>   		break;
>   
>   	case DT_TOK_XLATE:
> diff --git a/libdtrace/dt_parser.c b/libdtrace/dt_parser.c
> index f777a910..7e5bac48 100644
> --- a/libdtrace/dt_parser.c
> +++ b/libdtrace/dt_parser.c
> @@ -1238,6 +1238,7 @@ dt_node_is_tstring(const dt_node_t *dnp)
>   	case DT_NODE_OP2:
>   	case DT_NODE_OP3:
>   	case DT_NODE_DEXPR:
> +	case DT_NODE_VAR:
>   		return dnp->dn_tstring != NULL;
>   	}
>   }
> diff --git a/libdtrace/dt_parser.h b/libdtrace/dt_parser.h
> index ff32a84a..297bf6c9 100644
> --- a/libdtrace/dt_parser.h
> +++ b/libdtrace/dt_parser.h
> @@ -105,7 +105,7 @@ typedef struct dt_node {
>   #define	dn_expr		dn_u._nodes._links[2]	/* DT_NODE_OP3, DEXPR */
>   #define	dn_aggfun	dn_u._nodes._links[0]	/* DT_NODE_AGG */
>   #define	dn_aggtup	dn_u._nodes._links[1]	/* DT_NODE_AGG */
> -#define	dn_tstring	dn_u._nodes._links[3]	/* FUNC, OP1, OP2, OP3, DEXPR */
> +#define	dn_tstring	dn_u._nodes._links[3]	/* FUNC,OP1,OP2,OP3,DEXPR,VAR */
>   #define	dn_pdescs	dn_u._clause._descs	/* DT_NODE_CLAUSE */
>   #define	dn_pred		dn_u._clause._pred	/* DT_NODE_CLAUSE */
>   #define	dn_acts		dn_u._clause._acts	/* DT_NODE_CLAUSE */
