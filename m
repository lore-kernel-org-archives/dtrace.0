Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E91F801
	for <dtrace@lists.linux.dev>; Tue,  8 Jul 2025 19:04:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752001494; cv=fail; b=P0LtlOkUPS+CL86RGRyfA3ZNG3NRebC7c398+Mo7xRf17tmt9W5euRpKSVgmCbRkzGSvH1gXU9aDTSsxOvTzfr8d0bqbnp+xgiPPAc5678PDAniSxupn0SOuXiJsVFJwmrcf547osNV8Jf4DUOrkLNJop4EqIdZWGQ7aFWkFrCM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752001494; c=relaxed/simple;
	bh=dDxY5y/C8BU5iau0IJPdQ1vfmRfJabFaTNm3SyRZMtM=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=BDChjeu3CVwmWUh/xA/bDu70Jov26b2Fns7scDbjcMCxVDroP0qVQPCQRu6FGd5kTJ2tzzirvlC5ElcWLsC8EPbhQYQkjKUSPytJxo1o7szuVfqlvuveR/kzMwkDbKfSDT2cd0JRhKa7HMWq2DbbXL9EjPeZOzonbRkHESZZLco=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=eGUG7SIs; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=Vg44Cyji; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="eGUG7SIs";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="Vg44Cyji"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 568Ig6Qv004744
	for <dtrace@lists.linux.dev>; Tue, 8 Jul 2025 19:04:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=h5aocP7uqBuax1YEf01EZ8+e9ynN8w8vP7heWI59K3w=; b=
	eGUG7SIsbUz342mY+KPVEP2bB0wyZY51L+2n/PY4IQboK30uaXppS1aO2aCMFTke
	r9+ebLTPu0RouDttIiWabjBiLBoiinQA2MAIpe5ScZlG3yMcDQ7eH/t9cRb70Qck
	SoLPS39BW3muO999Zkz26axVamLbZjq4Dr+/5FpcX3yQQ87XYHHW3Ay1NEz3mdKG
	SiCHfHvTPhWjP85Nd/EGmnFTCsb3HBa8I6v8sUVfWkO7WF0tLOfdZ9LyTVKCnRRu
	bCVxrbqh1uqKZb1OpSWGCvXGf0EzwW0psr+CS3FbPNInbzAt/A++6TpPxHSakfFK
	aXa3v+SFeEG6XADwLK7mJQ==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47s8u7r1bg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 08 Jul 2025 19:04:51 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 568HBmsj024387
	for <dtrace@lists.linux.dev>; Tue, 8 Jul 2025 19:04:50 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12on2061.outbound.protection.outlook.com [40.107.243.61])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 47ptga921j-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 08 Jul 2025 19:04:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=To7Cg+5cPb7JqCtzQnYm4M2DN+wnBcEG5ECgzWtsQaP+vGG+tmNhhEXnySFkTi/9n2MOXUip+XydC2NzxRb1c/5UuijOW0b9dVg/ndj+wJNEaL/Puibxd/AtjHnhRYMCeM8Lx+Xrpg74/xnua1PAq1WPXLCzdkt9YzQWzhbBTN8G1MIDD9LykM5fhRiyxHU6QCHe19+GR1Bdc4D0DlUFz7QIkQSTX0LME+1IIQWqNcudzZ2j3hZ1g7os+XN+4/CUZt3G4CRItua9o3hyiG7+vXWKvVvHanL+gVbs7AQVNk5WueNkzYc5mJR2EcoVThst1k67Pw2FTnAy4ND58fPs7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h5aocP7uqBuax1YEf01EZ8+e9ynN8w8vP7heWI59K3w=;
 b=IV2J2V9eyDTT9t6Ho43qchD9jc87veDfYuW7AP6itE6Y+oJpDcNMXo7CfY9QKuRM97Mx+spZwaRHaYxzqNyMfriJcOGMb2ZQxHBSASW7i6qEmiPSHba8mFblfGO6kH/RCj1dpIKkvj9/M9FYc/+EXkJF9OOq7aMLwgiTRtVjxzrlkSfJ7G6Kn5fWVykFTRUUWsT9GBwoLMnoeJUSTD99NZ8UZFQqBkuBBjVkrQI31YDNDmOQYYELn38GyQTe5zykRgLlEJVLjqMdsAMwSqjp/yZVfLMoeAx4ZzX1yumy6gYnf0fshFcNAvXALlVeEvUViVmIOPoH0kTirgbkdPG5aA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h5aocP7uqBuax1YEf01EZ8+e9ynN8w8vP7heWI59K3w=;
 b=Vg44Cyji51q/fZ4q76tM6m4QZ2X6N9u3kCL3xfL3++NCFAwpKbpDTt+GWKA2ETme5qIcWaA7Rn9ICrfRf7RZ+tLiPDdvfjshN+bc0771NXu5BeYwcPgWYvT7Rfe3VZptPm8/8zg8NDFQySrrXqTszBP9biWpn47To3JH2xGQkWE=
Received: from DS0PR10MB6271.namprd10.prod.outlook.com (2603:10b6:8:d1::15) by
 CO1PR10MB4724.namprd10.prod.outlook.com (2603:10b6:303:96::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8901.27; Tue, 8 Jul 2025 19:04:47 +0000
Received: from DS0PR10MB6271.namprd10.prod.outlook.com
 ([fe80::940b:88ca:dd2d:6b0c]) by DS0PR10MB6271.namprd10.prod.outlook.com
 ([fe80::940b:88ca:dd2d:6b0c%6]) with mapi id 15.20.8901.024; Tue, 8 Jul 2025
 19:04:47 +0000
Message-ID: <db9e497a-b2b5-4b44-840c-efdead15fb9e@oracle.com>
Date: Tue, 8 Jul 2025 20:04:41 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [DTrace-devel] [PATCH] test/utils: add more reliable "get remote
 address" approach
To: Kris Van Hees <kris.van.hees@oracle.com>
Cc: Eugene Loh <eugene.loh@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
References: <077a08c1-e999-4782-9269-62a269d76f65@oracle.com>
 <aGbvQAmqsLA5+LaH@oracle.com> <aGcF67vQ8M942gh0@oracle.com>
 <21b12943-a166-41f4-8f30-8bb44e12317a@oracle.com>
 <aGv7kQqlPZt6Kmw6@oracle.com>
 <d74b40a6-0834-4edb-8cf9-dac28500a7cb@oracle.com>
 <aGwmKfOPU+NZ+ekf@oracle.com>
 <a2c14fbc-ac46-4e0b-804e-fb6e6c3e0751@oracle.com>
 <aGx1n+VfTcUaHIq6@oracle.com>
 <7acf8a29-0ccd-4efb-8b82-92b0bac6cebc@oracle.com>
 <aG1VxM+BhwPPv9hv@oracle.com>
Content-Language: en-GB
From: Alan Maguire <alan.maguire@oracle.com>
In-Reply-To: <aG1VxM+BhwPPv9hv@oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS4P251CA0019.EURP251.PROD.OUTLOOK.COM
 (2603:10a6:20b:5d3::7) To DS0PR10MB6271.namprd10.prod.outlook.com
 (2603:10b6:8:d1::15)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR10MB6271:EE_|CO1PR10MB4724:EE_
X-MS-Office365-Filtering-Correlation-Id: 0ba94ab1-10a7-47e0-955a-08ddbe524e9f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?eXZ0ZjBFWVRxWlpaTG9zeFdUL3hXRkZ0cldlcElROWFMcEFiSkxBZnJTNEJt?=
 =?utf-8?B?TjV5bTBQa29KWlIvV1ZDdVZwMzMrTGF3K1U4YUZ4cmF6eTZPYllUeml5d0Ri?=
 =?utf-8?B?d3BhNzN4WlFWeTlCQnBqYWFZTzAraEVBSzJNRGx1QnZBd0J2U2dFNEFSVUdR?=
 =?utf-8?B?QnZ0V3VMSkpBRTBqdlNTeWtPTlRXMHJsaHBsVE5qeWNGMmFSUnI0YmN2M29w?=
 =?utf-8?B?UHZZU1FpL3NUSm1Mb21jMXYrQStqZEdCQzdsMFR2Z2dKaDNkbXg2UEc2YXdy?=
 =?utf-8?B?N3NOSFlaZktTODhLcENkS3Nock9BSUd0VnpUZFo0ajQ4WlBmRlJvQ3l1R2Fk?=
 =?utf-8?B?V1hKeVZXalZFZ1dUQU4zNnpWQmVQMC9wSnR3ZjZXTGR4N0xEcG9DMnpmYlFD?=
 =?utf-8?B?dS9jNW94eXF6L1lrSkphS1RjbHZRVHFUMG80cWpDbnZ5aEhoYXdzYXJ0KzNk?=
 =?utf-8?B?clhlOVBXN05ZZkVRTnY5TUhIL053akRvL2xaRVdlY1A0WDAxcFdDTTVrMTg5?=
 =?utf-8?B?Tk1JM0hYUFlZZDJ3TVBGc0NkOE10Y0JIY3V4MDYvUXJFdTIxMGFxZVAvek9C?=
 =?utf-8?B?bjFVS0lIand4bUNIK2tNdmpVeVFnYTVuYWU1YS9mMmEvTGpEZ0xhWDRPTXd3?=
 =?utf-8?B?VFVzSXl0aUlMZk0vUWMvWHNUWjlwVE1Xc0dSVTVnM2x1TjBJN1VHS0JQNnl1?=
 =?utf-8?B?UjdIYmRBalZCeVNXNzZBTFduNTFkVklEZDEwNlV6OWU2SThCUjBxV2xOZEla?=
 =?utf-8?B?d0E3V3prYWRGRWxrUVFxWERqSW05b2Zya1RxZDdwMC9IUUFxQnhPcVBHbkJz?=
 =?utf-8?B?b1FPbFpWTkJXb1ZMTzQxeDlFT25rWlhleS95ZkFURjNFOGJVUmxCM0R3RkdF?=
 =?utf-8?B?WWhISVI1YmVrRis2aVRoNjdZbW5Kd2pJelA1UGcvREJnUlVDT3BZU3VFTmhY?=
 =?utf-8?B?TmZQWURGZVFQeXZQaWRTUUJxdmpOQ0lZMlp2dU9qWlh3azdBT3daTUR3VGFx?=
 =?utf-8?B?WnZCSHVFYlBCaGV2aXhDVk5uYnZETHB3UFB6MFBiVmt1dzJXdWxTUjA4MEk5?=
 =?utf-8?B?VWdBcHJTSFZnNSs0ak12ZE1TY25WRVJxbVZDYmIyR3pyaVlpVEtVWkk5ZVMw?=
 =?utf-8?B?QSttY21oYjB1KzljeVV1K3dUcFd3WW1pK3l6V1FKU0FSR3BkajRBS3pXT0U5?=
 =?utf-8?B?MCtaSlMxUGd3dDJ0VnVQTFlmWTNXVno3bUp4d2tCM21FVUZ3QnRXUmxodVBK?=
 =?utf-8?B?MksyWStLTG92czBQOUs4bXJINkJheGQ2cldsOWdLNDdFeXlhWmZpTXRleWdi?=
 =?utf-8?B?YXB0UTFyN1kvdTNCWktiVWh5Mi9wNW1iaFVUVXZwK3RXOEVES1lCcFgvTXhn?=
 =?utf-8?B?L3hhdVFDUTF2VUxWdC9ydi9ES0gzeHRMSmdTM2FUWklYbmIzbnlmb3FqR1Vn?=
 =?utf-8?B?OVEzV0ZzWE9UVFRNMnNtS2lOVGhKWk5lV3pwNmFxdTJEMEVyMEZXV1hucUZL?=
 =?utf-8?B?RUVldENTZWF2MjFQY1BtUDFsUmtza05JUVpqRTRqQkF3aFZ1d1Q0ZEc4ZzZ2?=
 =?utf-8?B?MVB5aHVMSzlTeGFWdEtIV0lCZ3l3Tk5nMCtmcHpkd2lvZkM0aTc5cmJRQm45?=
 =?utf-8?B?QlJ1bmp6Wk85cG1KWjUrZVBsUFN0bFhBNDFQZnVrZlAzZFNxSDZwZEw3Z01p?=
 =?utf-8?B?bEpFZTNWSGJ4dkZ2NmprdmxQRHNZNStMaVd2Sk1SUGlqSVlxczUvRCtRMGU1?=
 =?utf-8?B?bkE2TE0wYzR6NmlKYmpGeHdtazdVTXJXNjV4NTladzBVS3dWVUVNcUtlVjdQ?=
 =?utf-8?B?a1F4RGpiMmFUZlhaaWVKenNnWHZqNUEvNGFlM2lMNzhaVlVySEhpRk5XNEo3?=
 =?utf-8?B?VUd6STJSaW1BTXY0Y1QxOVNzWmIzMGVJVWkwdjV1Q25SY3Fvd0UrUTIxZzZl?=
 =?utf-8?Q?+JcrU6s7hWs=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR10MB6271.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dFdpaWUwTUx4VmlheCtDZzdSYmxTaS9uNDhvNzJCQkljRFdLRnNnQzV6MUFG?=
 =?utf-8?B?L2pzSjA4dVM1em4ybGVoYVZPbHROS014Mjh0eVZmM3BxT1Z2YzhoQUF4ZFQ2?=
 =?utf-8?B?cjJTRVFndmFwQ1hmSWczUXZoRHpQNjZkRnpDUE0yaGhzZVErN010WnoyQkdr?=
 =?utf-8?B?UUQ0VUYvUVpkUHVjOUpiaHd4NVYrMXVHSnEwUGtudlRQTnNIRnBTNHBCMzJv?=
 =?utf-8?B?N2RSWmJoVlQvV2g5ZmlLLzE0N3dKSUU1TzFWVnB6SDVMTUwrUnYyVTJYenM4?=
 =?utf-8?B?aEdzY1AzbHYwYW1pOWpaUlNoWlY5THdyeFRGV2ZzOGMwKzFEQ0c2MURXaWI2?=
 =?utf-8?B?VDdHZTE1WmU5cjZ2KzIxVlZ3NFpRbVkyT2VOaXQ5dVpha0tMb0NqTmFnQm9v?=
 =?utf-8?B?Nm5QOUhYUUthbTBzN1ljek03UjQxeEtoblMxVisxdTk3NStnK1h0UDdocDl2?=
 =?utf-8?B?WDY0RW5GTnpmN21NTUNIVGpEU1BiTXV5YnV1ZytxMTllRjJSZUFHU3pSbTBM?=
 =?utf-8?B?M3VLWm9jaGI5Mk1GU0tCSHJwa09IK3pTS1NIN2VRMDNtZ0hDWVBWRGZBb0JS?=
 =?utf-8?B?ZXlUODNOdEgvckNKZ2I4Sm1kM2p4V010TUlDSjlGaU1Vcis1RUdVbjZEeVRS?=
 =?utf-8?B?cXczZUVvaU5XaFdVZzBzOEFtb1E3djdjY0JvOU9FUnRLcTVmRnpyMFBUT1hP?=
 =?utf-8?B?UThhdmdMWFMyR2dYeDNXTzRiYytzZ2t0Qy9SQ3dWMG85dEx4alI4aUNkWWY5?=
 =?utf-8?B?U3VhOVcyK045MlZFZ21JVEU5akg4NkFRUytWMTBzMUlIZ1AyU1laOURlcjBs?=
 =?utf-8?B?T0VwNDRzUVpDTHQ0a25lbmU3bUlBVllFK29YbGsvU2FTR1NKZitUeHJHcUNo?=
 =?utf-8?B?Nkp2UzdkOW94eGVnSUNjOVBMSUN6VWUrQmRWR0hrZ3RaamJDblZRV0Yyckgv?=
 =?utf-8?B?R2xENEN1a005L3V4K0cvRkZrWW5YVExmbGtCRDNUeTcwVFVOR0ZqNzdyMnlO?=
 =?utf-8?B?ZVFZTUh2ekZuYnBXUHJyOXdyWjhKYjVoSCtxazdIaEpYT3NPaXZjd1UxdE54?=
 =?utf-8?B?RWpLK3NiZW1LbmtGMzM2dHFzR3VZY2laTUlLaUdBSWRXWWo3ODdQVFlpMnRH?=
 =?utf-8?B?aGZxWTVGY21LSFIyZXBHVzFyQ1BOK3lnK1RzaEJidTdJKzZSRHJUTnh1U0la?=
 =?utf-8?B?Q2RuWHIvUzdWTzEvcFREamhMcGx5akRlV255TTdKYjBtbVNIZUU0Vk95dzhL?=
 =?utf-8?B?YlphUG9pZFJsQWZSTE1RSWFoUFFQS3BjREhYenlBNUFsbVFseTRnY0xkek5F?=
 =?utf-8?B?Zkl4STBabjlVRVI0OFM0VlpXWTlROWZ6OTMvc1AwZzlqTzdTQ3V1UThFckow?=
 =?utf-8?B?bG96R25sWGZqU2h0a01SSmQ0Q09Cb2tIeHBtM2lBUDJCN245aFJJdWtrc3hO?=
 =?utf-8?B?REJmNGdVTmwwSksrRVVzVDFpUXd5amFhMDhoaDVPM054T2lFaWdOcitQYUtI?=
 =?utf-8?B?cG5ENEp1R2VGOTBGRjI4UW9VSmQ4VHpZbE1na05YQWRHNVdpMzllSmFEdUxO?=
 =?utf-8?B?T1NxcFU1ZzJpR3d1aDRmNkFWRUIrWVorYm5kaDZkY1c4czFRWm9uRm1WWm11?=
 =?utf-8?B?VXVWM1VhU2tLdEhGUG9ZNE1pRzdTRWo4UmF3Nm1mM21mbTRzdVlqbDZSRG1z?=
 =?utf-8?B?TEViNm5vUEVYWFhhd3Jha2JmQ2FHdTkwbXBDMzJyNUpGWnJrTVliYUhsOHNX?=
 =?utf-8?B?ZldOUERPam9IcCtSMzlod0xwYzBWMmx2MzIrWXRXb21PT1plMDVMV1ZQSjZx?=
 =?utf-8?B?eTZnL2txMGdWY0RWbDlqYW1CdG0rVGVReHYxNmowSG81K241TFJJdGdkWEky?=
 =?utf-8?B?QXhaWGFIemJtVlQ4dEt5TW03MWZCbTJJejdtcTFGTkZkT2VuNVYzNVNYdTZy?=
 =?utf-8?B?R3MyaFgwU1FLWU5Gd1BHWTlYNEVrOHpsaHFqSTVYbnBiSjl2K1N3bEcrM2VB?=
 =?utf-8?B?ekxFVzF6WFpmWlZkZTBKbmxrcGswdm9pOGlGQ0RGS1VNNTFQMm5ablVPK1V0?=
 =?utf-8?B?YnNoQ0tJYzR4N1BTRko2Y2UxV2hWWFNUS3ZWVGZsYTdoeFd6bXBDKzFxSFc0?=
 =?utf-8?B?ako2djlLQXJJQ1A5WklRNTVvejN4UzJDY2I2M0Vmem5oaEdlOHZtN1JSdXFE?=
 =?utf-8?B?WkE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	T2BK9ZyyR+Ug6Ia5eqtq98ZDxXzA5OOIXmlfXpQ885ulivwADOlYhwfUq0o33bWeY+/+QtlDyev0fiI+FAs7ipulaelc1FhFwHb0+WRVbxnlV8/e3rfFeI27s5pZ0MUwe7YyzH1w/Jw7Vzj6jFg2FI6JkVC5jkYq5VrcZkHsIVahXtlqzKJkUnc3te+lN1FmRfPXoZ9OkPvpnRpnDbP5dwyvQVyBeM9fSawNBilcy5QgQi5RoHlzjn10xXAEOMqy30hTa7buTCJz4vK0TFIhWCuxEqvN0jV/6lyGCt5uhPbIdU4MmGYni4X6nHtSbxXYZciBSDGDCCvFdSj3NSvPdTfc9wNSmSNhhrFL8RfHh+UqqTbM+Jik734KGbNQFc46DS4wWPn51ATGhGFcqTaqK9yVr3W+n4o2CBWEq1S3wtOa4ifdM6jKnQQpMQ1gLvH7u2RVXxtO26xMkNPhpKV2ENaGjpJMNFY85xAOsUWyDajOt4B//iTePINzBzMU5pow/9gxDTBnp9fKVUkbv5fa1Y2INkTCuFS1eoiM06Is+n8LaJod45dhTQgwotpwkUvi9YKsZy/30siJPCxA0M9cpvKacC90mUpU6QkSKG0GO30=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ba94ab1-10a7-47e0-955a-08ddbe524e9f
X-MS-Exchange-CrossTenant-AuthSource: DS0PR10MB6271.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2025 19:04:47.4446
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: StHEDvRPCrc8kocEb3IEdx3SKrsiKD/2fMHtib7+3Z1u7CEnujmVgGW44BwjuxeA7pT7u7WC6iSy4N1FoqKEzA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4724
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-08_05,2025-07-08_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 phishscore=0 bulkscore=0
 malwarescore=0 mlxscore=0 mlxlogscore=999 adultscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2507080160
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA4MDE1OSBTYWx0ZWRfX9maZsli908BK dKX9uAhsFKuMAR7gvCHrIwAXcMtmH/4DNUDaJUxOcUlNXArGkEEELVELeHBuxnj98YBRPbEuPJi CfppDEe79oACS2QxdPn70g78pqLkTd+K4VQyXoCCbzqylsCyxBtPqveO1tW+Pi8eylfFmNkBAWK
 U/FLFT5IEacg7h8FQ/a2BM6zsfIoDo5IWixDW0QuhJbN+iYt9BthMNODfObvGGeIJOvfB6kMV18 aLopDKcTq0KwVFElnY3Ai7JQDPgb5jJJD44Fx2DV9fGQwnRF1+oir6F5bBeYJBlmllYOujov15k QfXnJibJLoXVmA2i4pzaPbanoQzFOkQdC+03vrGKKfFleuYgM3Sd6fHzLkV8HwR63FWf2Q+d4XC
 f5aeCVmb1+SgDwPir8Ok9xcWzAfW1UuzOzZGO5Hp2SebEDONvkM1Pa+O09H/HIzi0mEmHnNj
X-Proofpoint-GUID: i83qB_ECfSJzJfoNOdjcoyZAlX14mt4l
X-Proofpoint-ORIG-GUID: i83qB_ECfSJzJfoNOdjcoyZAlX14mt4l
X-Authority-Analysis: v=2.4 cv=LIVmQIW9 c=1 sm=1 tr=0 ts=686d6bd3 b=1 cx=c_pps a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=GoEa3M9JfhUA:10 a=NEAV23lmAAAA:8 a=cTfD564R86gSDLOGgdgA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10

On 08/07/2025 18:30, Kris Van Hees wrote:
> On Tue, Jul 08, 2025 at 06:19:25PM +0100, Alan Maguire wrote:
>> On 08/07/2025 02:34, Kris Van Hees wrote:
>>> On Mon, Jul 07, 2025 at 10:51:10PM +0100, Alan Maguire wrote:
>>>> On 07/07/2025 20:55, Kris Van Hees wrote:
>>>>> On Mon, Jul 07, 2025 at 07:14:35PM +0100, Alan Maguire wrote:
>>>>>> On 07/07/2025 17:53, Kris Van Hees wrote:
>>>>>>> On Mon, Jul 07, 2025 at 05:32:19PM +0100, Alan Maguire wrote:
>>>>>>>> On 03/07/2025 23:36, Kris Van Hees wrote:
>>>>>>>>> On Thu, Jul 03, 2025 at 04:59:44PM -0400, Kris Van Hees wrote:
>>>>>>>>>> On Thu, Jul 03, 2025 at 09:23:46PM +0100, Alan Maguire wrote:
>>>>>>>>>>> On 03/07/2025 20:03, Kris Van Hees wrote:
>>>>>>>>>>>> On Thu, Jul 03, 2025 at 07:41:41PM +0100, Alan Maguire wrote:
>>>>>>>>>>>>> On 03/07/2025 19:26, Kris Van Hees wrote:
>>>>>>>>>>>>>> On Thu, Jul 03, 2025 at 07:02:57PM +0100, Alan Maguire wrote:
>>>>>>>>>>>>>>> On 03/07/2025 18:06, Eugene Loh wrote:
>>>>>>>>>>>>>>>> On 7/3/25 12:59, Alan Maguire wrote:
>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>> On 03/07/2025 17:43, Eugene Loh wrote:
>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>> I tested and it looks good (modulo the OL8 UEK6 issue mentioned in the
>>>>>>>>>>>>>>>>>> patch 3/4 feedback).
>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>> Sorry I couldn't find that issue; is this the 5.15 problem with the ip
>>>>>>>>>>>>>>>>> send probes?
>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>     dtrace: failed to compile script /dev/stdin:
>>>>>>>>>>>>>>>>     ".../build/dlibs/5.2/tcp.d", line 177: failed to resolve type of
>>>>>>>>>>>>>>>> inet_ntoa arg#1 (ipaddr_t *):
>>>>>>>>>>>>>>>>     Unknown type name
>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>> Ah, sorry yep I have a fix for that one in the next round. Basically we
>>>>>>>>>>>>>>> need to add it to the core set of typedefs and add a type for a pointer
>>>>>>>>>>>>>>> to ipaddr_t; we can't rely on the #pragma to include net.d unfortunately.
>>>>>>>>>>>>>>
>>>>>>>>>>>>>> Why can't we rely on the pragma?  That is how e.g. the ip provider manages
>>>>>>>>>>>>>> this I believe?
>>>>>>>>>>>>>>
>>>>>>>>>>>>>
>>>>>>>>>>>>> Unfortunately the #pragma include doesn't do enough; it just defines a
>>>>>>>>>>>>> type for ipaddr_t , not a type for a _pointer_ to an ipaddr_t , which is
>>>>>>>>>>>>> what we need as a parameter to inet_ntoa(). I tried adding the ipaddr_t
>>>>>>>>>>>>> typedef to net.d and doing the pointer lookup/addition but that doesn't
>>>>>>>>>>>>> work either. Seems we need the core typedef + pointer addition or we hit
>>>>>>>>>>>>> this failure.
>>>>>>>>>>>>
>>>>>>>>>>>> Actually, if you move 'typedef __be32          ipaddr_t;' from ip.d to net.d,
>>>>>>>>>>>> you should be set.  That is what I did in my priliminary tcp provider impl.
>>>>>>>>>>>> I do believe that works.  Either way, we use inet_ntoa() in the ip.d
>>>>>>>>>>>> translators and that works with that typedef in the file, so this really ought
>>>>>>>>>>>> to work.
>>>>>>>>>>
>>>>>>>>>>> Yep, I tried that in the v2 patch series; Eugene hit the undefined error
>>>>>>>>>>> in one test and I now hit it consistently for all tcp/ip tests
>>>>>>>>>>> unfortunately with "typedef __be32 ipaddr_t;" in net.d.
>>>>>>>>>>>
>>>>>>>>>>> My assumption (probably wrong) is that the include of the library does
>>>>>>>>>>> happen but nothing triggers the pointer type generation for "ipaddr *"
>>>>>>>>>>> in the CTF dict. If there was a way to force that type generation at the
>>>>>>>>>>> .d file level that would be great, not sure I see a way currently tho.
>>>>>>>>>>
>>>>>>>>>> Well, like I said, it does work for ip.d so I don't see why this would be
>>>>>>>>>> any different.  I'll have a look and see if I can figure something out.
>>>>>>>>>
>>>>>>>>> Looking into this more, I think the problem is simply that you did not sync
>>>>>>>>> all the dlibs for the various kernel versions with the updated ip.d, net.d, and
>>>>>>>>> tcp.d files.  So, if the kernel on the OL8 instance you test on does not have
>>>>>>>>> your change, it will fail.
>>>>>>>>>
>>>>>>>>
>>>>>>>> No, don't think that's it; the .d files that matched the kernel I tested
>>>>>>>> on (6.10) were synced; the use of the 6.10 .d files was visible in the
>>>>>>>> error message. The problem appears to be around the fact that tcp.d uses
>>>>>>>> the ipaddr_t * in inet_ntoa(), but unlike ip.d (which uses ipaddr_t in
>>>>>>>> translated types) it does not have any other mention of ipaddr_t.
>>>>>>>> Adding an explicit cast in tcp.d to the argument to inet_ntoa() to
>>>>>>>> ipaddr_t * resolves the issue without having to add ipaddr_t to the core
>>>>>>>> type list.
>>>>>>>
>>>>>>> Can you reproduce this at will?  Can you give me specifics on OL version,
>>>>>>> kernel version, etc?  I'd like to be able to reproduce what you see, because
>>>>>>> so far, all I tried actually works once the ipaddr_t typedef is in net.d.
>>>>>>>
>>>>>>
>>>>>> Yep, it's 100% reproducible for me on an upstream (bpf-next 6.15) kernel
>>>>>> + OL9. Moving ipaddr_t to net.d works for ip.d but not tcp.d in that
>>>>>> environment. The extra casts for the inet_ntoa() parameters that I
>>>>>> mention above are needed in tcp.d to get things to work properly for me.
>>>>>>
>>>>>> I pushed a branch to
>>>>>>
>>>>>> https://github.com/alan-maguire/dtrace-utils/tree/remote-tcp-v3-wip-broken
>>>>>>
>>>>>> that illustrates the failure.
>>>>>>
>>>>>> Relative to devel, it consists of 6 commits
>>>>>>
>>>>>> 1: the v2 of the remote IP address change (ensuring the remote address
>>>>>> tests won't fail);
>>>>>> 2-4: a few prep patches for the tcp provider; and
>>>>>> 5: the tcp provider patch (in a v3 work-in-progress form); and finally
>>>>>> 6: the top-level commit then removes the casts I added to tcp.d in the
>>>>>> previous "tcp: new provider" commit. With that change in place on my
>>>>>> system, the previously-passing IP tests start failing.
>>>>>>
>>>>>> If I "git reset --hard HEAD~1" on that branch (reestablishing those
>>>>>> ipaddr_t * casts) and rebuild, the failures go away for me.
>>>>>
>>>>> I tested your tree on Debian with the 6.15 kernel, and this is the result:
>>>>>
>>>>> $ uname -a
>>>>> Linux kvh-deb-bpf3 6.15.0 #1 SMP PREEMPT_DYNAMIC Mon Jul  7 15:19:59 EDT 2025 x86_64 GNU/Linux
>>>>> $ cat test/log/current/runtest.sum 
>>>>> dtrace: Oracle D 2.0
>>>>> This is DTrace 2.0.1
>>>>> dtrace(1) version-control ID: cf3219c3069ac51c6f03f7a6dcb50958213466fc
>>>>> libdtrace version-control ID: cf3219c3069ac51c6f03f7a6dcb50958213466fc
>>>>> Linux kvh-deb-bpf3 6.15.0 #1 SMP PREEMPT_DYNAMIC Mon Jul  7 15:19:59 EDT 2025 x86_64 GNU/Linux
>>>>> testsuite version-control ID: cf3219c3069ac51c6f03f7a6dcb50958213466fc
>>>>>
>>>>> test/unittest/tcp/tst.ipv4localtcp.sh: PASS.
>>>>> test/unittest/tcp/tst.ipv4localtcpstate.sh: PASS.
>>>>> test/unittest/tcp/tst.ipv4remotetcp.sh: PASS.
>>>>> test/unittest/tcp/tst.ipv4remotetcpstate.sh: PASS.
>>>>> test/unittest/tcp/tst.ipv6localtcp.sh: PASS.
>>>>> test/unittest/tcp/tst.ipv6localtcpstate.sh: PASS.
>>>>> 6 cases (6 PASS, 0 FAIL, 0 XPASS, 0 XFAIL, 0 SKIP)
>>>>>
>>>>> I will try to get 6.15 on an OL9 instance and try there, but either way, I
>>>>> have a feeling there is a binutils (libctf) discrepancy somewhere?  What
>>>>
>>>> could be; see below..
>>>>
>>>>> version of binutils is installed on your system (nm -V)?
>>>>
>>>> $ nm -V
>>>> GNU nm version 2.35.2-42.0.1.el9
>>>> Copyright (C) 2020 Free Software Foundation, Inc.
>>>> This program is free software; you may redistribute it under the terms of
>>>> the GNU General Public License version 3 or (at your option) any later
>>>> version.
>>>> This program has absolutely no warranty.
>>>>
>>>> Let me know if you need any more info. Thanks!
>>>>
>>>> Alan
>>>
>>>
>>> Tried it on OL9 with 6.15.4 kernel, and aside from some probes not firing,
>>> the tests work.
>>>
>>> $ nm -V
>>> GNU nm version 2.35.2-63.0.1.el9
>>> Copyright (C) 2020 Free Software Foundation, Inc.
>>> This program is free software; you may redistribute it under the terms of
>>> the GNU General Public License version 3 or (at your option) any later version.
>>> This program has absolutely no warranty.
>>>
>>> So I think you need to yum update your system?
>>
>> I think I may have found another clue to why it's happening. I tried on
>> a gcc-toolset-14 -built system, with
>>
>> $ nm -V
>> GNU nm version 2.41-3.el9
>> Copyright (C) 2023 Free Software Foundation, Inc.
>> This program is free software; you may redistribute it under the terms of
>> the GNU General Public License version 3 or (at your option) any later
>> version.
>> This program has absolutely no warranty.
>>
>>
>> Now I can run the following fine:
>>
>> # build/dtrace -n 'ip:::send /args[4]->ipv4_protocol == IPPROTO_TCP/ {
>> @c[args[2]->ip_saddr, args[4]->ipv4_protocol] = count(); } END {
>> printa(@c); }'
>> dtrace: description 'ip:::send ' matched 2 probes
>>
>> However, if I add a syslibdir path - as the tests do when they execute -
>> I see
>>
>> $ build/dtrace -xsyslibdir=$(pwd)/build/dlibs -n 'ip:::send
>> /args[4]->ipv4_protocol == IPPROTO_TCP/ { @c[args[2]->ip_saddr,
>> args[4]->ipv4_protocol] = count(); } END { printa(@c); }'
>> dtrace: invalid probe specifier ip:::send /args[4]->ipv4_protocol ==
>> IPPROTO_TCP/ { @c[args[2]->ip_saddr, args[4]->ipv4_protocol] = count();
>> } END { printa(@c); }:
>> "/home/opc/src/dtrace-utils/build/dlibs/6.10/tcp.d", line 183: failed to
>> resolve type of inet_ntoa arg#1 (ipaddr_t *): Unknown type name
>>
>> using -xdebug I see a lot less types added in the error case; i.e. only
>> the following are added when processing .d files:
>>
>> libdtrace DEBUG 1751994411: typedef conninfo_t added as id 2147483678
>> libdtrace DEBUG 1751994411: typedef netstackid_t added as id 2147483679
>> libdtrace DEBUG 1751994411: typedef ipaddr_t added as id 2147483683
>> libdtrace DEBUG 1751994411: typedef in6_addr_t added as id 2147483695
>> libdtrace DEBUG 1751994411: typedef pktinfo_t added as id 2147483697
>> libdtrace DEBUG 1751994411: typedef csinfo_t added as id 2147483699
>> libdtrace DEBUG 1751994411: typedef tcpinfo_t added as id 2147483701
>> libdtrace DEBUG 1751994411: typedef tcpsinfo_t added as id 2147483703
>> libdtrace DEBUG 1751994411: typedef tcplsinfo_t added as id 2147483705
>>
>>
>> versus the good case:
>>
>> libdtrace DEBUG 1751994399: typedef processorid_t added as id 2147483677
>> libdtrace DEBUG 1751994399: typedef psetid_t added as id 2147483678
>> libdtrace DEBUG 1751994399: typedef chipid_t added as id 2147483679
>> libdtrace DEBUG 1751994399: typedef lgrp_id_t added as id 2147483680
>> libdtrace DEBUG 1751994399: typedef cpuinfo_t added as id 2147483682
>> libdtrace DEBUG 1751994399: typedef cpuinfo_t_p added as id 2147483684
>> libdtrace DEBUG 1751994399: typedef time_t added as id 2147483688
>> libdtrace DEBUG 1751994399: typedef timestruc_t added as id 2147483690
>> libdtrace DEBUG 1751994399: typedef lwpsinfo_t added as id 2147483695
>> libdtrace DEBUG 1751994399: typedef taskid_t added as id 2147483696
>> libdtrace DEBUG 1751994399: typedef dprojid_t added as id 2147483697
>> libdtrace DEBUG 1751994399: typedef poolid_t added as id 2147483698
>> libdtrace DEBUG 1751994399: typedef zoneid_t added as id 2147483699
>> libdtrace DEBUG 1751994399: typedef psinfo_t added as id 2147490324
>> libdtrace DEBUG 1751994399: typedef conninfo_t added as id 2147490329
>> libdtrace DEBUG 1751994399: typedef netstackid_t added as id 2147490330
>> libdtrace DEBUG 1751994399: typedef ipaddr_t added as id 2147490331
>> libdtrace DEBUG 1751994399: typedef in6_addr_t added as id 2147490332
>> libdtrace DEBUG 1751994399: typedef pktinfo_t added as id 2147490334
>> libdtrace DEBUG 1751994399: typedef csinfo_t added as id 2147490336
>> libdtrace DEBUG 1751994399: skipping library
>> /usr/lib64/dtrace/6.10/udp.d: "/usr/lib64/dtrace/6.10/udp.d", line 10:
>> program requires provider udp
>> libdtrace DEBUG 1751994399: typedef tcpinfo_t added as id 2147490338
>> libdtrace DEBUG 1751994399: typedef tcpsinfo_t added as id 2147490340
>> libdtrace DEBUG 1751994399: typedef tcplsinfo_t added as id 2147490342
>> libdtrace DEBUG 1751994399: typedef ipinfo_t added as id 2147490350
>> libdtrace DEBUG 1751994399: typedef ifinfo_t added as id 2147490352
>> libdtrace DEBUG 1751994399: typedef ipv4info_t added as id 2147490361
>> libdtrace DEBUG 1751994399: typedef ipv6info_t added as id 2147490369
>> libdtrace DEBUG 1751994399: typedef void_ip_t added as id 2147490370
>> libdtrace DEBUG 1751994399: typedef __dtrace_tcp_void_ip_t added as id
>> 2147490371
>> libdtrace DEBUG 1751994399: typedef caddr_t added as id 2147490380
>> libdtrace DEBUG 1751994399: typedef bufinfo_t added as id 2147490382
>> libdtrace DEBUG 1751994399: typedef devinfo_t added as id 2147490385
>>
>> So it looks like sched.d wasn't processed for example, but weirdly in
>> the failing case net.d (containing the typedef ipaddr_t) and tcp.d were.
>>
>> The actual error comes later though, after processing kernel/module BTF:
>>
>> dtrace: invalid probe specifier ip:::send /args[4]->ipv4_protocol ==
>> IPPROTO_TCP/ { @c[args[2]->ip_saddr, args[4]->ipv4_protocol] = count();
>> } END { printa(@c); }:
>> "/home/opc/src/dtrace-utils/build/dlibs/6.10/tcp.d", line 183: failed to
>> resolve type of inet_ntoa arg#1 (ipaddr_t *): Unknown type name
>>
>> And so I checked for differences in the build/dlibs files versus what is
>> installed, and found none. Maybe the above might help reproduce this at
>> least. Thanks!
> 
> I'll have a look, but when you are using a locally built dtrace, you should use
> ./build/run-dtrace so that the correct paths are set up for libdtrace.so and
> the dlibs to be found.  Otherwise, you end up using the locally built frontend
> (dtrace) with the installed libdtrace.so and dlibs.  And even when passing
> the -xsyslibdir, you still end up using the installed libdtrace.so, so your
> testing is not based on the locally built dtrace.
> 
> 	Kris

thanks; tried with build/run-dtrace with same result. However by adding
some debug logging I think I've discovered the root cause; the order of
.d file sorting seems to be different in the build/dlibs versus
/usr/lib64/dtrace case, and the problem is that tcp.d actually
implicitly relies on ip.d for ipinfo_t . We get lucky in the sort order for
/usr/lib64/dtrace, and because an ipaddr_t * gets added during ip.d
processing, by the time we lookup "ipaddr_t *" in tcp.d it's already in
the D CTF dict. I _think_ the ipaddr_t * gets added as a side effect of
the fact that there are fields of type ipaddr_t in the translated
ipv4info_t in ip.d

However in the problematic case with build/run-dtrace , net.d is still
loaded first, and then tcp.d is loaded immediately after without an
intervening load of ip.d. As a result we have no "ipaddr_t *", hence

dtrace: invalid probe specifier ip:::send /args[4]->ipv4_protocol ==
IPPROTO_TCP/ { @c[args[2]->ip_saddr, args[4]->ipv4_protocol] = count();
} END { printa(@c); }:
"/home/opc/src/dtrace-utils/build/dlibs/6.10/tcp.d", line 183: failed to
resolve type of inet_ntoa arg#1 (ipaddr_t *): Unknown type name

To fix this I think the right answer is to change the dependency tcp.d
has on ip.d, from

#pragma D depends_on provider ip

to

#pragma D depends_on library ip.d

This is needed for other reasons (ipinfo_t declaration for example), but
with that change the problem is resolved.

Alan
