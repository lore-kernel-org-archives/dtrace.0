Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5B9220126A
	for <dtrace@lists.linux.dev>; Mon, 15 Sep 2025 04:56:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757912207; cv=fail; b=l3Vff+YYKCtitpWBC3H0dTc6kPA/mAcZv4mky8hGk2sKp6xnQ2PAabOKSFAZJkFvX1y/aZL/P/ccfo0uCXE/GAw2t8mMz5xfhJpuqnLigwiw8pGAuer54bA2wN1a23Nj48QkY1cehc3LqnzeyUgO5ED3zJPncwMtzL3GNwV/ouI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757912207; c=relaxed/simple;
	bh=cQtJNJB4Bs3Z/FYHu0fWkGvA+nr5vq406XpXqrJ89dc=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=LQ6fApW+9E3/kRAlc3ghmheKYo1B7J7tFv88RNVzhWNItsmiEn0wYHLxkxKAqFXPoLYZqiSv/ID/IpclSgXX7gRmr6kHG1L/8H1P2UbJqOUUYpSJDM30FTwX0zOnJgD3IGMmHfitiZCKT4fnJp+EGskyvx3Xz6a3Lr0MIQHh+XI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=ia4jkvCg; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=gdczHsAE; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="ia4jkvCg";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="gdczHsAE"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58F0eXIN011789
	for <dtrace@lists.linux.dev>; Mon, 15 Sep 2025 04:56:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=9K0nCx4OsC0iudPe0HgE4Dk5qv02MeAXouF/wHFqeuQ=; b=
	ia4jkvCgQScvM8QGLw5mfr5P+R5BLrCzgy86MZ5jWwgOu6+QUirO7PTaNDYqRcQP
	6K+UnxdPG0HxXjUfVM69M61kb8+eo3mHlmWS1mLcdZK5OKk52Itqj6vbSLQwS+df
	w1tlWETB6W1qaCoYEguAq+SewNL41EdYU24J8juICeZALzfm98hoslly43l0dgNw
	/j2LP4mRE0+nvR/MRijpGcp5cwWytWCUAQiEa3hWcYRhHpqCmQTuD5cmszLvEawr
	xRamihtCUIbS7k3Si/qCSX2zWa0vktAz/n25xydK3UYbK/icLJRigXphv/sRd0kh
	XsdO/Id2A/GVxhprLUR/PQ==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 494yd8hgyx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 15 Sep 2025 04:56:44 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 58F3XIdY021377
	for <dtrace@lists.linux.dev>; Mon, 15 Sep 2025 04:56:43 GMT
Received: from bn8pr05cu002.outbound.protection.outlook.com (mail-eastus2azon11011001.outbound.protection.outlook.com [52.101.57.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 494y2ah6uy-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 15 Sep 2025 04:56:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B1EpuhHQVj0PDFQKRDoSwylib6YOh6g6U0DwhsGWDOGFT4mR1w6HOL5aPttG6ewFIc4rPAC9cmGdZul02qoxw/y8HYw3iSl1wYC63VkxH/pPtzPtEPPn2jXeAJU30ex4HAcypjXlLIqy5ST/LynPzR4V6OVaev5o2/i9n4gbnmG1Fatn9IRQ3tkL5/jDZhSesX7GXlssEmtp7RWTZY1lIvcQ/4W6QKyvfniTXQIux3NOqde1BbQO3VKrnteFQPEUhIm8SlZ6y96BSrapPIU6goAc/XmFqUykPECrpP/vOmD4hxvOPmJ+GyxMsYDmzuHVRramK3aILR9VuFU3yq6Sig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9K0nCx4OsC0iudPe0HgE4Dk5qv02MeAXouF/wHFqeuQ=;
 b=RFulJMAqpw5xS+gRETMxtCM8VJfvC8JiDlwF/FGM/72IGJgCy6cLNDQb1EnR/6WZw+HfYPm8pJkgEYBiYL1W7pY2hcuRWBWCY5ip/NQUoA3MgKEoOXtWE+0AmwUkGTUxE913ilN0kMM/BfpKXVn61MzMizJ5dHv9alFsxnwtftC868fw7dyV3R8bkZo/r5vka/YLEiI50TttvII5WM1wBIzkaXVPuTuXhSAyq/MbvkkMUYLN6zJXrJw1aX/xT8Ez2pBLhKhQFnbQ0jhptZOL0k4wBRBRz6ODOysataq1Nuc9chIIdUqFglxF2+UJdoNNglcYCNbUJBO6weGlWFDvoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9K0nCx4OsC0iudPe0HgE4Dk5qv02MeAXouF/wHFqeuQ=;
 b=gdczHsAERjYSWovFhVAyEigtmT2e3I4+Qj1Ri0x4Ecvu9JL5Q7BWveszwBTqtH+s47sUdAbW6DHaoPWgrkfODuCTXnwSEYpikHG1WlRANEiHSzwNwHlHyDd7EtsR6AUfL7TSqLme6eaQuuf0csmD81YymWVDLFEzB5kwGOl+UOs=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by BY5PR10MB4356.namprd10.prod.outlook.com (2603:10b6:a03:210::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.19; Mon, 15 Sep
 2025 04:56:40 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b%6]) with mapi id 15.20.9115.018; Mon, 15 Sep 2025
 04:56:40 +0000
Message-ID: <0e765d14-a6d2-0c26-fcfa-34ecf249ce44@oracle.com>
Date: Mon, 15 Sep 2025 00:56:36 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [DTrace-devel] [PATCH v2 3/3] Add more robust mechanism to skip
 tracepoint common fields
Content-Language: en-US
To: Nick Alcock <nick.alcock@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
References: <20250913155619.22299-1-eugene.loh@oracle.com>
 <20250913155619.22299-3-eugene.loh@oracle.com> <87frcpw4gj.fsf@esperi.org.uk>
From: Eugene Loh <eugene.loh@oracle.com>
In-Reply-To: <87frcpw4gj.fsf@esperi.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BN6PR17CA0028.namprd17.prod.outlook.com
 (2603:10b6:405:75::17) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|BY5PR10MB4356:EE_
X-MS-Office365-Filtering-Correlation-Id: 2c3e66c3-2fa1-4b0f-c788-08ddf414422d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?d0pEMkpINTVoNXlIemhkUE5BeGdhc1J2bzZHQ3VkWUJZR283RE4zVzl6a05P?=
 =?utf-8?B?UFhMUmttRm5NTnhyTHZPdEh5c0l1TFVJYzlMUkFpdFZrNUsybWZ1T2VwVHg4?=
 =?utf-8?B?OHZvQ3NtNUx0VkQwRjZLeTllZXVMamFKY2EzZFRBQWR2Vkt3VG5tNWdidDls?=
 =?utf-8?B?WGNVS3ZPMUZlVTV2dlZKMVFwdFMvWmRXcUJERCtCTDA1VmRqQXBXeE45VGxB?=
 =?utf-8?B?MStZQmZPMHBWUW1kSVhORlBOVW43OHRsQkY1OFZuQWtleGdEUXVoWXFNalJj?=
 =?utf-8?B?RDV1SG12NG1wZXYzd1pYY3JwZTRSbHRySXBtdmVwM3c3YzkxVkJiOFFDdE0v?=
 =?utf-8?B?dFNYNWF3QjJ6aExlVk05bHBaZEZKTnJjWXhoMlNpcEh1K2RjcSsyR1g2eEZq?=
 =?utf-8?B?aE1mZTA2NFFyNVdkZlNlMU9tR3NiRmRpakp2VDNLV1piU290YzJmV0ZyYTgz?=
 =?utf-8?B?QXZpa0E1emJmNGcybE0wajVDZXVPd0puODV2bVIvWXp2bCtXUnZaMTQyem1q?=
 =?utf-8?B?WFVPamxXalpKN0xkSUduTUtjTDNFQjM2ZWdLbWNrd0gvLzVOazg0cFQrckpL?=
 =?utf-8?B?cTVnUlh6U0g1RnNSYWNKVHRjWklDVUVVRHJFZVBjYWozVm0wR09qUEVSNWFP?=
 =?utf-8?B?aVcrdmVBQXFXdW5qbnptK3JkVXFZV1l6NGJQSkFucVdvbFBzYlU5M2prbHRG?=
 =?utf-8?B?cEhpZko2RVNaYWFBWkxEQ2V4dHF5eUtZd3FjUTZLcmVNWWV4T2JuV0hidmll?=
 =?utf-8?B?ekRVMFllTG84MXNVYlN0eTdxSnBFQytxWE9CemQ0YXgvZklpMTdLRlUzN2l3?=
 =?utf-8?B?SW1IQUJrdi90Z282VWpaMDErU0xnUDBzNnpzVmZlbzdENnJ5U3owUFpwQkNI?=
 =?utf-8?B?Vzc0dG1JV3ZHTkJZdDB4anBUcDdZWUF5WkwwQWZ6SDVTdVBpcHNkc2IwNlZi?=
 =?utf-8?B?L0xFU0tsTXdod3QyMDdvZGMxWTZzWFlUMXNMVDhpQVptbk1JRmwzaUNpNDBY?=
 =?utf-8?B?T0RMbGE1bVF3SWRNUkpKdTU2bG0vRUZMVVBkMTdaWXBIbjl4d20yRHpzQlRu?=
 =?utf-8?B?VVJMZkthNUFFN04vR2xtWE9yRGRCQk1XZ3pwUldoelhsUkpQclpLdlZ3bCtC?=
 =?utf-8?B?emdOVDlKa3J3c3A4bWxzeXE4ejNLQnNEUUhzcnp0alM4WG5JVEdZdTllZ3M4?=
 =?utf-8?B?TytRMG5QdC8xL3Z5ZmFIRGd1K0FwYjZTUXRYbmRMOEZyY25pTW1FT1NNSTRO?=
 =?utf-8?B?ejJURUhod3QvbzRUVGJ4eTFkMndYeUV3WmJUOHZqdURvVHRpU1J2aEc4Tjky?=
 =?utf-8?B?bnBaa2o2ZnlYRjVJOEFZYWhQN0ppZUJlSWlFMGFlZXV3eGMrTjBrYzB4Qk1G?=
 =?utf-8?B?UUQvRmx0RnowRm1LOW13MUw4bXlWdUNidXNQQjVJcVlid3BVa0lXVDJQQmF2?=
 =?utf-8?B?dklGTEpWcXUxYmowcEFicXBCVGpycllWNVJmOFBXYjRaRVo5Y1g5NlBBZmgx?=
 =?utf-8?B?Tmd4ckdZMlRYRTRyMUpMVXlCV005UFY0MjlPazNJY3hQQ3Q3TzZJT2VUaC9P?=
 =?utf-8?B?SzA3VGV2U0loRFA0Y0RwaUlJcS9VeVZrdGFMaGNVVHZJTHNBS2NrNmU0U2ow?=
 =?utf-8?B?NDhrV0dOaE9lU2JHa1dZR2JEeXV1dE1JTkpEbVZZS1lyeDlCNlRZcm1iOU9l?=
 =?utf-8?B?cGRPbFZWRENId1FhVHIxSWF5bE53SGMwYVU4WHkyN0prRlJacUI4Rm5IZ3lt?=
 =?utf-8?B?RDFmcVBOT2hCNHFWa0RWL2w4bGFDZ05yTU1EVCt1Q1RIejRTQ01mWWtJUDBy?=
 =?utf-8?B?RWRwRTJFdVorKzl3Qm9Mdm45MmFmaUJ2dlpnckNmWk5ETnJ1STFzN2dWZGVB?=
 =?utf-8?B?YTNrU0ZJbDZmZ1c3U3AwVnZ2KzhsOVhwSy9NVzFOSzBRaHh0MVFVL2VheHlD?=
 =?utf-8?Q?OTtnza2QMQQ=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?clBCTXRad0xsa2RiY2Y0WkU2ZVZ4ZkxLWjRDc1dWQlRjL3Evckh6T1I0VFZy?=
 =?utf-8?B?U21QTjN5eGlOd0FQN3VkQTN5R0JUNEJGbit2N3pwajhGZHZaVlEwVGFXZ282?=
 =?utf-8?B?QWZac0NiRmx0Rk5mRkFVVlBVcU54S3B0Sy9pSHNMMFU3NnpZMmRsMFNWYVpF?=
 =?utf-8?B?MjVwUjZick41aUNxTXJZdUMyVGdNYXEyS0VvczZ6S0E3N2d1YllQUEZJcElu?=
 =?utf-8?B?Z055TTdWemJoWVBCOG85Z1VUeVNvdnVwSW1PZmRpempUekdEdjNRZlliR3NU?=
 =?utf-8?B?NGxHV1BnTzM2MlVOczJXL0ZmblJTeWhkYVQyeG8xSW43NFhLK1o3dmZSRUda?=
 =?utf-8?B?UkJVc0VXUGNxMUlwc3AyVGxuMHZKcUs3NVRRbno3dGhUOHZaaUVSTk9tREFt?=
 =?utf-8?B?ekZJZ2duVXRremIyOHpJMzhiS08ybmV2RTNEQXBVbWwzOWZPTDA3Tld6UTdV?=
 =?utf-8?B?Ry9kSUxOMlJURzIwVFhPbnBEUG5mVm13cC84OHlDcnpWa0hDdHZ4V01uNWJn?=
 =?utf-8?B?enF0VGFCNXo4dmZwTFU2NnI4Q2sxL1RYRHFiRHFvRXVLTTY2L2Q0bm5ZQ3Fj?=
 =?utf-8?B?d0NySGZCaFA5citseG9JQ0F1b1lmMkt5eUNYTFViTmo1dnZ6MXNuNk14M1or?=
 =?utf-8?B?dDBvRlFnblpZclArRU1xUkE1MG5HMTNncWU1d1ZNQzl4WDRWUmFoWktuQnRP?=
 =?utf-8?B?OVplbnpqaXRzWWhzY0JCdHdyVlEwRVJUZm13RXRZUjZIMDhMNFZ5QUIyWnVr?=
 =?utf-8?B?WEpDVFlGZkdKemgxcXA4Y3hZdGwyc1lXRDg0UWh3aGZ3MlNuclFqdEplaVZy?=
 =?utf-8?B?T0F2Y3g4TWFEcFJtLzJKZmhGandnTVpZQkFiQ2d0WjNHQXBvSWlFL3p3MmtY?=
 =?utf-8?B?dk1HaCtmR0RsU1lDam93ZDJSQ1F2QkFXVWlkZ1p6OHJORHFOS1JnRjhxN0VK?=
 =?utf-8?B?dWRTZUU4U3ZWR3hPSFFNZUVnSG1EUUE0Q25xS1BuUVhnUTFad2l4dlZjVzgy?=
 =?utf-8?B?OExRODBjdXczai8vcXlObmd1Q1VwNk5mL0UrZ1I4UUV0R2x5eTBwanIzS2ht?=
 =?utf-8?B?eXZxMG1SOGFBYzF2RXg5U2VpeCtCa3dBOUthMENSVUMyb2swMSt4dTNRRXdh?=
 =?utf-8?B?SG5aemU4VXR0ZVZlaXlmZzdDeUlsUHFId0ZaeG82NUF0NlErRUMyMElnMWZ4?=
 =?utf-8?B?ZnVsa21SRXZGYzBWck9SSjZ1VDE1cERpY2RMVUFGT0xWODUrRWFDZElWaUFO?=
 =?utf-8?B?R2NKN0FCMXhyNHRCM3dqeHhSWjc0VS9OZm1LaE15dko2bGFNMnpDb0k3bUkz?=
 =?utf-8?B?bUUzbUNCUnFKdTdQNUdpajFZTWlDL0ZDd1Z5N0NnNmZFaUZVYitUVEpsMk5x?=
 =?utf-8?B?M1NWWHN5UzZuTWlkQlZtLzBWMDJFY0dNcmtPbUdIYnpmWVVVUDY0ekcrRndy?=
 =?utf-8?B?eWtzNm1NN1Z3cnpmUU1DQmYrZ0Q2OUNBUkpGUThqL2Q4eEJHdTBlQlQ1Vjcx?=
 =?utf-8?B?SUk4ZFpUcVpycW9uZ1F4bE5BUUljYmgzdERZMjVVeUpSTnd1K0xmVVdFdGl1?=
 =?utf-8?B?YlV1MEZyNDd1bzRxTVptV1JSTjlvL1dYT0ZzL1dhNFVRMkRueUlvUlRMcVhi?=
 =?utf-8?B?ajZSeEZEcUsyTVl2SWs4WWthRFJvUkp0Y2ZxYXhyMjVOMFJQUjNTS0FZWFpG?=
 =?utf-8?B?RlBYdGRaRXZGck9mRUlEQ0w3RUhCWUFHVUd2bzhaSGRxYkowck1uSjNZYm5G?=
 =?utf-8?B?S3dLcFBCbHdUOVpDa1V1MUdmQ250ZmpRVHBMaGlZeDNxVjFCTVBuekd0SGc4?=
 =?utf-8?B?c1FtRUwzR0xtQmxxU0FHdkQ2Q1BQWWxVbUxNYUtBY3BsYVhZRzlla1ZaZ3BY?=
 =?utf-8?B?SFR1MDkwb1h6Y0NtSVgzK3RFcjlDQ2ZLZm1xVFhVZFc1anlmb1dqaThEVk5u?=
 =?utf-8?B?WThUMnpFeVhKRms1bHJ5RXB3RkdWbWtIYjdNazZtWHQ3aUhPK090REpVa2cx?=
 =?utf-8?B?Yy84WVMvUFhyby9LYm5TRDJhNG8zT1A0UmhZeTFtbExES1BvVVlUbkhmUDJR?=
 =?utf-8?B?Sm1OVjhocXJlUzdXZnJVcnJCSGhjT2ZsdFBVNnBtME5PbHg4Y09FU21NZFF2?=
 =?utf-8?Q?d7uDj1RlyEgoGdLwESyJITXDl?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	RtQUpvkXsACqaFVPwrH14fQRaKbgpsmKSUvsUcOmvy/TL1Q3fCl7b15QE6lyg5n6Gr7DQy5c5Up4HC62sjaBp+/Y+kaPfBwEtmn0/oJmF2rFj8vF7Un+nD+SM+lqYavsr1E10wZQlQ92Uuf2XfYRKfcCWNql01Z8nxJOMOl7/V+3VP6ONsAL/BRaAwvHa67Eken/QLCm4YlLwZW+PzVvcQf0+lysX0ox1m9LTNI0SlLcf3KymKSZphBl4lANcxd7nel1QmsXhxf3eg7lY5RkYPtCqWqVKpsKOtkZ1HklTKiYpsu6kuZVDnh3xvI8h9hojRhw7tQWmn+pO2TNrMy9wA14xHC1BbCHwIvcLX2xMRSenQynQvZAKdnp0t7boMPg5dSiv11RmsljeZtzTCdYB/Bgy71jSozQB9F5V9TSXurE6/51ElNzf/hgMK7swOHcaXllLv9ijY0sM2wlRMXw1D5YcDTIXppZUyCqBAVXLcbSInJaZWaPRfMuBjFBOlvfOD0mVeLX2WVyflyvasf9VQx0qO3NkDtj7MhnjWD2ZROanxyslBEBbMXO1fqZVtSxLuMG4SOr+J9B7UiiMecUHbEhj8QFYMqsTCtn4funH8k=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c3e66c3-2fa1-4b0f-c788-08ddf414422d
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2025 04:56:40.5440
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QLv3yLYuKa3RVpiabOtgYzu8ryax8FIxNxSf7kCgdJA3RLSeWtEIGU7qCsmSmUHsO2r6WSFFx67uEdp8Kgd+Gw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR10MB4356
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-15_02,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 spamscore=0 phishscore=0
 bulkscore=0 mlxscore=0 suspectscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2508110000
 definitions=main-2509150043
X-Proofpoint-GUID: cT-MT3frxCOZNCfxibH8EYithiN_dXeE
X-Authority-Analysis: v=2.4 cv=M5RNKzws c=1 sm=1 tr=0 ts=68c79c8c cx=c_pps
 a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=LWUe4I_r1E7JtSmNCR4A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: cT-MT3frxCOZNCfxibH8EYithiN_dXeE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTEzMDAxNiBTYWx0ZWRfX2AAuoEu2tSch
 aM+45g100mdFVQOE2CuWBlypK31r6zZHrEYf65LdaDkINU0G6b3F/Bzh7xzGxEtGDxo0H/euKqh
 18f7y95MwqInx+652PD6hojGyxMgjqslFbfKf830JAzudPyOQ6esKuclHSPb6ZqIYInMTek56CP
 zYz4XvIp+F1b8txYqRESTkMrjd0IU4RxNrqEo4225dIGC/fxb8+QuQINCGfH42OdzTpcm6g+wM9
 NarjzpJTQmu1vBhgRUY3LG+aUi1ivQCZqGCJh1e86N7Fx3yGWDw9/tnUe1eUs9WJc7MmQJa+CUN
 XK/+3yEE1BtLwKWuZwf+obuzRJp7tfE8Hn3bspKTmWJhy1pOv7OEDCfPBgAg0bda4gxJ9RujHRS
 u+XHoRYN

On 9/14/25 09:26, Nick Alcock wrote:

> On 13 Sep 2025, eugene loh stated:
>> Implement a more robust mechanism.
>>
>> Specifically, instead of skipping a hardwired (SKIP_FIELDS_COUNT=4)
>> number of common fields, look for "common_" names.  E.g., in
>> kernel/trace/trace_events.c in trace_define_common_fields(), we
>> see the macro __common_field() is used to define common fields,
>> and the names are prepended with "common_".
> (If this turns out not to work, maybe we can hunt for the blank line
> that always seems to follow common_* fields?)
>
>>   	while (getline(&buf, &bufsz, f) >= 0) {
> This is much clearer than it was before!
>
> Reviewed-by: Nick Alcock <nick.alcock@oracle.com>
>
>> @@ -160,14 +150,63 @@ dt_tp_event_info(dtrace_hdl_t *dtp, FILE *f, int skip, tp_probe_t *tpp,
>>   
>>   		if (sscanf(buf, "ID: %u\n", &tpp->id) == 1)
>>   			continue;
>> -
>>   		if (sscanf(buf, " field:%[^;]", p) <= 0)
>>   			continue;
>> -		sscanf(p, "__data_loc %[^;]", p);
>>   
>> -		/* We found a field: description - see if we should skip it. */
>> -		if (argc++ < 0)
>> -			continue;
>> +		/*
>> +		 * If we have only seen common fields to date, keep
>> +		 * looking for a non-common field.
>> +		 */
>> +		if (common == 1) {
> ... ok, I take back the thing I said in the previous mail about moving
> things to a separate loop: the ID/field scan is necessary anyway, given
> the first two lines:
>
> ID: 94
> format:
> 	field:unsigned short common_type;	offset:0;	size:2;	signed:0;
>
> Given the overall format of e.g.
>
> name: sys_enter_iopl
> ID: 94
> format:
> 	field:unsigned short common_type;	offset:0;	size:2;	signed:0;
> 	field:unsigned char common_flags;	offset:2;	size:1;	signed:0;
> 	field:unsigned char common_preempt_count;	offset:3;	size:1;	signed:0;
> 	field:int common_pid;	offset:4;	size:4;	signed:1;
>
> 	field:int __syscall_nr;	offset:8;	size:4;	signed:1;
>
> an alternative approach might be to exploit the format, and always skip
> all lines that do not start with a tab, and/or simply all lines until
> the first entirely blank line? Maybe? (Looking at the kernel source, the
> common fields always seem to be followed by a blank one.)
>
> But this approach will work for now, though it appears to be pure
> coincidence that all common fields start with common_.

Coincidence?  As the patch notes, commons fields are inserted via a 
macro that prepends "common_".  Not a coincidence!

> We definitely
> have workable alternative approaches if this stops working :)
>
> Hmm...
>
> +			/*
> +			 * Strip off any [] array size specifications at the end.
> +			 */
> +			while (*s == ']') {
> +				/* From ']' hunt back to '['.  They are not nested. */
> +				while (s > p && *(--s) != '[') ;
> +
> +				/* Then remove any spaces. */
> +				while (s > p && *(--s) == ' ') ;
> +			}
> +			*(++s) = '\0';
>
> Why is this necessary? We never look at the end of the identifier in the
> common_ search, only the start...

I used to look simply for "common_".  Kris was concerned that a type 
might have this string, messing things up.  So, we want to make sure, 
specifically, that it's the identifier that starts with "common_".  So, 
how do we find the start of the identifier?  It's the last token... 
*after* any trailing [] are stripped off.
