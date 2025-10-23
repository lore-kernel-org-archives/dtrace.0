Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 422871DA0E1
	for <dtrace@lists.linux.dev>; Thu, 23 Oct 2025 19:34:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761248092; cv=fail; b=QJeqiG1Fa73o9bnnmGKc6hYXJec42FRTUVRFx/WqbuHwCU6rhoE5njcQX8+GaEJ4Vle532QX8c7LkO6mt5W0dAIv3N0KA37DFhF96MWN4/Dsqs1pFOWix9EMJyN8NAqpKVuFYR5qo3YET3Pum8xcryAhJPnc1QbThfBWWqFcYDg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761248092; c=relaxed/simple;
	bh=RAdTuvHMEh/AnPJLEBONYd/YLUa6cXD3q697QilEHbQ=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=ibymKolRLKbBGhkhNrMHbLGfIxMcBa68Wm4quu+uSVoMHO1RO8ba1LM7TmwkQMBQaqOvTsXd0rh4hKH0SmWUaizuMkWWxopfwpHIb0wrdSs12vsTvapBFG8ariAxlqdYKkb4BjE+Xn2s8j2plRmVjtKLnY2DKOLWLGpKWFJQ9+4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=kBKYKJIe; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=an88qWcU; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="kBKYKJIe";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="an88qWcU"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59NIBvBE017916
	for <dtrace@lists.linux.dev>; Thu, 23 Oct 2025 19:34:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=M8x0GAjUcvwqetIYxC2uwn8DzEWYtmQulmh9Yg7IJns=; b=
	kBKYKJIez8orcdVQNlN6FtpisLq6XsBxyX4+LnkaWB4N8JPoyoGbMl7XW91KyWrm
	vCMC/KJEaM4o2xHw/l/sRPGSNcAIUSoP714AkaKk3YP7W8FAZpWG1W5mJ+4G5Rxj
	yT9oPQBY591nMyV1Fa3UZ6LCp7EVU0VIr6XJVrudWzTqvkH0rvLrGaMAiQY2ZZaF
	2hvldSSaCGGsQlXLRCS01QY1/u696hyyj6ri+SW4vOPXit9xGcCyq7kmugeJdFG2
	AvAi5eQl78y5kacTvHNjgbb9C0t11/sdB4tFndmDAHA4VHzKdpwuqAG3kxgIRB6C
	bQ8InvoKWY7UOj0luX+4Tg==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 49xvcybb76-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 23 Oct 2025 19:34:49 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 59NIEM4d012439
	for <dtrace@lists.linux.dev>; Thu, 23 Oct 2025 19:34:48 GMT
Received: from mw6pr02cu001.outbound.protection.outlook.com (mail-westus2azon11012002.outbound.protection.outlook.com [52.101.48.2])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 49v1bf0sdk-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 23 Oct 2025 19:34:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZeqHb8T/rbYWOBfC/THKMJyazrEjYvVetwxH/VqSUVCIpM4WbXc/LucNMj1KLZRD1AelHZxIPt50GiS0AuXpVTB5TWB83rKWYQ5/Z/94ulnIAdsTcodEbSZNZ5VlZsH0CykctDhvf5ta++GHYiwZElI3aKtCYAQriD1DYqWWH0YNj2CZXGOO4LVxI8bpip87vHk39XBtRLDqcquUhnFw/uqSxzxg6aJ/n/QNzICMyBTCb6upzIG8thWqgbB5B+QnPZ/dy7fvYSROiA3O3iPXGGmVmXSh/QAwaJliIcQMF0u9t7NT/wigHJUd1lXE32ukjL1zz4J0baDbWphVxHUeFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M8x0GAjUcvwqetIYxC2uwn8DzEWYtmQulmh9Yg7IJns=;
 b=We7cRfbWDANoQNU3DyEkum+Z2LiXFGgurmCij600ENbdgqnOB2g1f+2Q9ni7sbH2tdvGlbjitrbeQuefh8QxF/rahF4tC3ks9qqOAfDXn5YTa+Wwvhc5m0FvfaRURk8NHuiFSKZqpSzA49/FYse7JMISIS0OiRpHJ1n3lVijS0JtwWw5wxpFbIlMbBAU4EgEZpbffEf/hKEVDl5Eevupy3DoV3cr3RQRC4rm3tipBrAGjOvZHYmKECMVLk6H071sXIpSfIxtShad8ov6gWCSfeQRMvsgnrICUsEKyCQPc00T5ew7QB0vv5iAZQrFKHQJY8+7ahP9GJzzn4ATrGIpjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M8x0GAjUcvwqetIYxC2uwn8DzEWYtmQulmh9Yg7IJns=;
 b=an88qWcU2KaUdEdNjisyi0WsVsvGGPGl5JiObrmvrU6pHDGcrk3l7UILfdt+AfWFXmGBrA/aLZDdwxHiGEMykauAMQCmDWUTXELuy3iZQe9rxFwRs148f2p9oFQcXNyq3VZiSdGchEj9xKIo+LK7sTZoASc2w5uNWko47JUagvI=
Received: from BLAPR10MB5075.namprd10.prod.outlook.com (2603:10b6:208:322::19)
 by SJ0PR10MB4669.namprd10.prod.outlook.com (2603:10b6:a03:2ae::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.17; Thu, 23 Oct
 2025 19:34:46 +0000
Received: from BLAPR10MB5075.namprd10.prod.outlook.com
 ([fe80::8f5:4de9:81ce:f5c6]) by BLAPR10MB5075.namprd10.prod.outlook.com
 ([fe80::8f5:4de9:81ce:f5c6%5]) with mapi id 15.20.9228.010; Thu, 23 Oct 2025
 19:34:45 +0000
Message-ID: <1a9c3daf-c89b-4555-958a-014fca136411@oracle.com>
Date: Thu, 23 Oct 2025 13:34:42 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 16/20] doc: Clean up undefined anchor links
To: eugene.loh@oracle.com, dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
References: <20251022032251.2010-1-eugene.loh@oracle.com>
 <20251022032251.2010-11-eugene.loh@oracle.com>
Content-Language: en-US
From: Elena Zannoni <elena.zannoni@oracle.com>
Organization: Oracle USA Inc.
In-Reply-To: <20251022032251.2010-11-eugene.loh@oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CYZPR19CA0003.namprd19.prod.outlook.com
 (2603:10b6:930:8e::27) To BLAPR10MB5075.namprd10.prod.outlook.com
 (2603:10b6:208:322::19)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BLAPR10MB5075:EE_|SJ0PR10MB4669:EE_
X-MS-Office365-Filtering-Correlation-Id: 75a3222c-1c0e-4928-27ea-08de126b38bd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|10070799003|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?K2krdFN4Q2hMVTFOYnU0M29CcVJRbG01Q21kMkJ5cE5zYlFCcDk1ODFDN2Z0?=
 =?utf-8?B?K0JyVDFPTWxVVzRGSGFBcFo0SUdOMC9JaFlobjRTY3RoaFFOQXg0ZjNCaVEy?=
 =?utf-8?B?NVhJZ2hxbFZSSWdFYzVOT3dxcFdWRHhPY1dEZDRVL0dVVGs5eStWYzJmTnRP?=
 =?utf-8?B?VTQ0c25QbGJpMVVsYlc4aWRNblNobUc2VGNnZEhOVHlEQURQTUN4dWlsMDhu?=
 =?utf-8?B?b1B0OUU4ZjMrSW50WHRibnJzaE9ocFpWR3pRL1hqSXZ3ZnlZaWU4QldNVTJi?=
 =?utf-8?B?VkxoamV1SEljZE55SHhleHh3TDNtem5UTWFNNGV6dDdhTDAyb3FHbExMWlNO?=
 =?utf-8?B?SWx3clF3b0lkKzF0cTRvVm82M2JYQldRaytyK0JvUENUckhMb1dnMXZLUm00?=
 =?utf-8?B?LzNESUs2bHJIVVBxaytzMWZzZUczZklBNTdkQUJZZkdrTVh3TkY0cFBIOERJ?=
 =?utf-8?B?cFdCcEFrR0IyTlpJQ0JZTkdraDJEd1d3VURoR1orbmdtK2FUVG93dUZNdzdE?=
 =?utf-8?B?ZG9lYk9sM2hmS1EwVGpXcVo1OU9NZ2FvZHlXS0l2M3VPemJDNDRtc3ZqUWlF?=
 =?utf-8?B?K3FCVkV1aWRCWXF6VlJmNndMcUUwbHVmQ0V4YVo4SjlRUUVoOG53YkxRcjZi?=
 =?utf-8?B?dmo5OUc1QStPTmFYaDJRTWlEUDJXNTQ5V3g4TFpRMUorZnE5cGY2aVc2M2tG?=
 =?utf-8?B?YVRxNjhvUHNYdXZuNUh3bmlLMFBqY3pmaHFWa0lMd015OCtyU0pTdG5VLzdS?=
 =?utf-8?B?L1duVWttRGhyUzZxdm1KWkJQYzhCOXVKTXVWTkhITVpUNUgxZ3htTk9xdWVS?=
 =?utf-8?B?S1V4UVVEZGpkd3luUmRhVEpqZmdYM3pVVVIvN3BUd0lqUkJEdkY4RzdsNCtZ?=
 =?utf-8?B?OWJ6WlBIVnE4ZkNPMUY4bldWSWZlWkljZzdrd1dVTi8zVE42MkxoSHMyRDBW?=
 =?utf-8?B?YjMrQjdkUmZPd1pKRThJL0tONzRDOEM1d3hlN3pTck1YWDd6YmRtM3J2Y2JT?=
 =?utf-8?B?WXBJck9xNWNMNEZxRWE3andQalhkcG1HNlBVREw5aS8yV1FzSFhKeEZkZGp5?=
 =?utf-8?B?RXB0bG9ybDBHcEw0dklsbTRjcG5CdUZxMHZvMXYvVTFBMzlRZVo5a0lTYjVx?=
 =?utf-8?B?VVRlVjJlMVBpbUc2RlBtQVpXeDJlZDhhR2FWYmVFdjVQQzFlWWd2VG9ieDgx?=
 =?utf-8?B?SS9MVUEwWThwekI4VXNpVnkwNnNMSlRnYlBrY0N0azREdjd0eEFaRVZPbHVD?=
 =?utf-8?B?QkVxblR3eWMzY09JVE9uWkY4Umo3ZEJ3NkxJTnVscHVhd05EUGhuZkNFcEZH?=
 =?utf-8?B?RG9SS3ppb3VFa1dKYVZOc2R1Y2kwUDdQK2t3Y2EvdWgxaGVIUExKakd6TElH?=
 =?utf-8?B?ZFJCVk0vNThFMmZpMkd6anBFL20zcXhkOWRTVXlHSzBHaWVKK0tJcTZQSEEv?=
 =?utf-8?B?Z3E2cVlUME83K1JDK25HUVBzb1hsWWF1T1gvTExQclRXeUNsVTlzcGJsWUYz?=
 =?utf-8?B?T1VZSzhJY0c0OHU3QWhwUjhETGczY3gwL0VrblhVV2VyZjQ3azE0QmNocHBn?=
 =?utf-8?B?T1NGeDkxNkVLZzBIdzM3aTlpVkJEU1I0OE9VWFlFTTE0dFBwV2dWTUYxV3lZ?=
 =?utf-8?B?bUJvenR6WlRwK1FYeEZib2V1MWtqT3RUMVpudHZ3YzF0Ujc0TUZ0V1dBSUpS?=
 =?utf-8?B?eXF0NW5jcy90N0RZRmdOUklHQlZMa0xzTW5iYkpnMzNPcERubDdpM2JmTTJ5?=
 =?utf-8?B?SWV3ek5GbXB3dHdZY3pjbldxMDFrckU2ZWxBNXFYMXNVYnFKU1ZnaXZwdFQ2?=
 =?utf-8?B?Wk1wOE1FNE1GenhsMGkzRGpURUdUM0VSMUhGcHY3d090eU8yRTJYWDVlUDl0?=
 =?utf-8?B?aTB5dEpWZFNqMWJsTjI2Z2hmRHVYR081bU0vQ1kySGNFK21hYzRTY2d4Sjlr?=
 =?utf-8?Q?Two91oKyoi6yCrTOKb+NZTcCItSRFCO9?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BLAPR10MB5075.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(10070799003)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bStGR3Nwb2lia0dyQ2NxWmlNQjBOZjBsdjBudlRwb1ppc1pHdUdWdkU4cTla?=
 =?utf-8?B?WkxHRzBRSXpFaTdPOE5MZGxvRjN1RytySFh6cEtNUkIyaTB2cjdtTTNiRWFN?=
 =?utf-8?B?eHpWWDMvUWt6aldSTndJaDNQUjRLbEtkcWYwSEtzMmJjbWllaWxPMXNaUkdZ?=
 =?utf-8?B?RC9aVC9wcHk4TDhzZEtXc3AwMGYzbW1FQlJNaTkzaS8wSnJxR1FzSXJMM3dX?=
 =?utf-8?B?eGo5aysvMEVuWklldG9SS2EwalRiaEpQaWxqZVVXQnZRM1pSK1hGU29oSW1U?=
 =?utf-8?B?SUdkdTBDaFBZZndhRjRrUWlrRUpnNi9DNjJFRlZIaHJHL0MrL2xNKzk4ZWVT?=
 =?utf-8?B?R0htQk0xMmttYTZlNnd4dGxlZVh1bkNuRzVhZjhZMzhhc2VtWmxkcEx6RWRN?=
 =?utf-8?B?cmZtcWFZZ0Q0bGdYZVRhUDFyV3luUk44b2YxODJyTWE5bzJsMzg1Q2lVS0t2?=
 =?utf-8?B?K1lycXJ3V29zNUNWZVNHeHVFeFFRNiszWnM1SmJNS1RzSGR6S1ZLT3ZRY0xs?=
 =?utf-8?B?SDFvYk15Nk5qU09UR0lnRStsQXdrYytuay9Md1d3OUhoQzBZY0E1Z2l6Tjlx?=
 =?utf-8?B?N0RHZTBqamFXMUxoclFHaTFnNHp1TnlyaEtRb29WV2NTQytzUHhHc2FOYmQy?=
 =?utf-8?B?TE1LdUJ0ZzJXWWVMd2RPYzF3bm9ZaGNHS3lEUGtrRUZJSnBNMW1QTTQwbnV6?=
 =?utf-8?B?d0F3b1pXcDNHZVRhUTZkZ1VRTEdRMXI5L3FFRTlBTk9EZEY5alArdm9CNjBL?=
 =?utf-8?B?UStGeTE2c29vUm1VNUlheENCMXNKMUp1anppUjhEd1VSVE5idEZwT0htRHY2?=
 =?utf-8?B?VGw4aXR2RlAwY2NtcGNQQ1J4NVpZdjNIdWhKb3hOYXJXeEUydmRqTU1admxM?=
 =?utf-8?B?WGcrb1pWbDh2WGowbGJhbzNkTi9DWmF0QjgvTEpGWS95TnAybjNNMzFYQWVu?=
 =?utf-8?B?b3Z3UFVpUkFYTE1PUEtPUHJyRlZFUDFjUXFESDUzTTNON2tQbkh1R3hlcURa?=
 =?utf-8?B?KzJnQzl5MFJTSG5jWnFGK3VRUG5MZU1RRXA3SVV5VXdjcSs3dGpMb2htUWJU?=
 =?utf-8?B?Y0daOFRiZkdKc3VyK1hFVHdLUlFnQ0lWNmNNRzVDbDhOS2NMUTlsb3FkTkNs?=
 =?utf-8?B?UzlkSHlGeHAyMHV5WTIzUHpoTXdkbVRGL0g4OEhTWnhFT3NDY1NJYlRublZJ?=
 =?utf-8?B?d3QrWHFtL04ySU1sT0I5WkJWcWRiOVlNbDVEVGhiNGdQS2ZTV3JDMzZGNUV0?=
 =?utf-8?B?OE9QekxzbU9RaDZEOHRhVzl2Y0lyQmhDM2xjV3VDODV3YWtVZGpQT1ZSM2c0?=
 =?utf-8?B?U1Z0UmNaWDlTUWVKTDFVemphT21SUGhNOXM2TDNoMzZ2ZjFOZDQ0VlA3N3Qx?=
 =?utf-8?B?Y1RpcXNxaXFTeVpiTTljNlhMMDZqdXdFZTF2ZUVDOXF1RHI3L21GL200SXJ4?=
 =?utf-8?B?MHk4YzFmdkhOelJsekc1LzdONElwMjRBMkxiUVM5RnRFZW15M2JEK3R1S0ox?=
 =?utf-8?B?ZWcxZ1h0bkRuM1N3d201dC8vWHVOS1BjdUN6dlNqUXBxaWlmSGhZQmVudXV1?=
 =?utf-8?B?d2ZqRnM3OXFjY0xGTGdka2c1UmM2VExnR2crRWw5aHN3d2plWS80bEFzaHk4?=
 =?utf-8?B?aEd3eFZvVUFVcDdOenBnNkZyVkFPL1RhTjVFT21uQWtPdWFCUEFpMnpEZ2I4?=
 =?utf-8?B?N0hHY2M1VjBJcWFXbWdVaDltR2FPaDJZMVU0bHVBWWxKR1k4cFIxM3hiQWRw?=
 =?utf-8?B?VmRIODlsU0tBRUJwZDlOVG9XWHEyVk93NURmTHhxbjVibE5RSVpTaWdUTXNB?=
 =?utf-8?B?TlB2bEpiS1RmZTFmY1ZOb01yVHFhOVhFeGFEaXlRVk94Zndvc2hpUE1KMnVH?=
 =?utf-8?B?d1dPSWdLT1ZnU2g2N3RRRTZPWFU2akRUdm1GSjdsejJqNUU5cGpkVC95UHJo?=
 =?utf-8?B?TWFzMjRENEFBaSsvaEJ4UVd6UVZpekl6aHlIeGwvRnVjdlA1bVA4NWlOOTdu?=
 =?utf-8?B?Y3ZFT1NnNkZMdnVLaGE1RzdzL2NwUTJmTzZTb1E5R2psdDkyZFB3Ry9UNWho?=
 =?utf-8?B?RHJwd2NjOXcwQjZrcXVyRVZiN0c4SDNCZm43enNBUjY3cmtWc0RwSHRHUUxU?=
 =?utf-8?B?alJPdFFINHBCcEpqaDYxVzZ2SDVJTVFhZGhiNzlVQURNd3BEWDZtZzJOMkNP?=
 =?utf-8?Q?O5NN2aq8iSWil6b4x7k+gFw=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	Krncz7EPgq6EWzjUvYwdf834LWnC5xMdG+jhBfXYqEjzMErtZOgwbAIXva6Ze27S3UM5b3nRJY+MFvleIXN6rjvsXQJjmQLhEdNIfnyRwTJHXWS1FnDQKZido/aqHkYEjwtgVgWV8z/PLakkWL1MfpI/l9U2bvAKpRW7ZtrTlsckWWfq/hT/Vz+uEUVSdjhg9KpFg7K0mGBsbitjqNq1kWvEHKGIQItziT/8utcpwmw/Z/6UhkYOYuScIr7/0UeVXdiMa9R7DJ4ad/B8vBAF6+1xK4y1mH/9PySkzHr0JwNgyS/Xh6qG6ieK4mZdLPwzpt//O8ztaeTFViMUFTpfMtwtr3hcyf7JuFht7s4i6WiMqxYE/lDLN74bnyiK3SyMIz9Z8Bt91pq0QMOjJc4c2DLdBcT9y6g6ZMpfErPkUzslvLlT2cUBjs4QUXC8d489iWKr8QVyBH3Ud6pcDNMEEYa8pnRBXmt94bDydceDRgvJeK84sM0HnPQpN64nmD1qeKGrfQDp+AepB4XIJevDTdezNZr23IeKA19LddPv9HlFQ0P389rZC6pSppWsRS6p/WIaquliXTmerydHU6DjzdhXkNe9tACYXToqsbcq9yo=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 75a3222c-1c0e-4928-27ea-08de126b38bd
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB5075.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2025 19:34:45.8326
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: J01W/cdT5cXcqLzq307AZbd/sv0ktHLrf4QQdZyMpBCtAsmm7uHN5T66uswUfzzsl8CIBqrlRr/njrL3fMSgvfk4SV0fXSWTCVefQkz5uEM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4669
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-23_02,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 mlxscore=0 spamscore=0
 adultscore=0 suspectscore=0 malwarescore=0 mlxlogscore=999 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2510020000
 definitions=main-2510230179
X-Authority-Analysis: v=2.4 cv=GqlPO01C c=1 sm=1 tr=0 ts=68fa8359 cx=c_pps
 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=x6icFKpwvdMA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=yPCof4ZbAAAA:8 a=dkJz4eVfnv28PJlA3MIA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDIyMDA3MyBTYWx0ZWRfXy/HDIOleMr7m
 5MZ1J9yE9OwUc+UqpfFAOhmNhgBrAUm3UZL5/9NpJ4OWvPFCgEVsi3ZERTsKi1sMHBIet1q1lnO
 7AJ/vx7dWSsAXC3WRbvvAF5+zQLo7GC2w5tML8Ncnerf0wpMjVuVkV16nqIWH0fdB/Z/eGe+ZfN
 pg6z40Q8x1MmK2qbLyppzfNuhui61O3LMzEEKMVP2e750smteGtTod3PeNznR+PJBlQQvAW+CPk
 DFP70seLYUwxxRdZKo+BgYnpheqzAdSw57r1vJelHKnkg5pw3fq71wS3N6BSrH+0aJnEjk9ElFI
 itbgplcIjqrzfDneWzcLJ2jf+jECxlrsyMDoO88ZGjKJewPtufWeAVaqUjTe0Kz1UOE7ku5VD4h
 gFJkZLVCASBE0pTXJqckMlZjs6IfMA==
X-Proofpoint-GUID: kRMrRXHWlCqYehEK0aE8HEEgtewleSuA
X-Proofpoint-ORIG-GUID: kRMrRXHWlCqYehEK0aE8HEEgtewleSuA


Reviewed-by: Elena Zannoni <elena.zannoni@oracle.com>

On 10/21/25 9:22 PM, eugene.loh@oracle.com wrote:
> From: Eugene Loh <eugene.loh@oracle.com>
> 
> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
> ---
>  doc/userguide/index.md                                      | 2 +-
>  .../reference/dtrace_builtin_variable_reference.md          | 6 +++---
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/doc/userguide/index.md b/doc/userguide/index.md
> index abd1096db..ef1489f5e 100644
> --- a/doc/userguide/index.md
> +++ b/doc/userguide/index.md
> @@ -7,7 +7,7 @@
>          -   [Install DTrace on Oracle Linux 9](how-to/dtrace-howto-install-dtrace.md#install_dtrace_oracle_linux_9)
>          -   [Install DTrace on Oracle Linux 8](how-to/dtrace-howto-install-dtrace.md#install_dtrace_oracle_linux_8)
>          -   [Install DTrace on Oracle Linux 7](how-to/dtrace-howto-install-dtrace.md#install_dtrace_oracle_linux_7)
> -        -   [Verify the DTrace Installation](how-to/dtrace-howto-install-_dtrace.md#verify_install)
> +        -   [Verify the DTrace Installation](how-to/dtrace-howto-install-dtrace.md#verify_install)
>      -   [List and Enable Probes](how-to/dtrace-howto-list-and-enable-probes.md#list_enable_probes)
>      -   [Create a DTrace Script](how-to/dtrace-howto-create-a-dtrace-script.md#dt_create_script)
>      -   [Use Predicates For Control Flow](how-to/dtrace-howto-use-predicates.md#dt_preds_dlang)
> diff --git a/doc/userguide/reference/dtrace_builtin_variable_reference.md b/doc/userguide/reference/dtrace_builtin_variable_reference.md
> index aecd2308c..0cbfc4252 100644
> --- a/doc/userguide/reference/dtrace_builtin_variable_reference.md
> +++ b/doc/userguide/reference/dtrace_builtin_variable_reference.md
> @@ -31,7 +31,7 @@ Macro arguments
>  
>  </td><td>
>  
> -See [Macro Arguments](dtrace_builtin_variable_reference.md#macro_arguments)
> +See [Macro Arguments](dtrace_builtin_variable_reference.md#dt_macroa_scrpt)
>  
>  </td></tr><tr><td>
>  
> @@ -127,7 +127,7 @@ Target process ID
>  
>  </td><td>
>  
> -See [Target Process ID](dtrace_builtin_variable_reference.md#target_process)
> +See [Target Process ID](dtrace_builtin_variable_reference.md#targ_proc_id)
>  </td></tr><tr><td>
>  
>  `$uid`
> @@ -231,7 +231,7 @@ regardless of whether they're referenced by using the `$arg` or `$$arg` form of
>  If the `defaultargs` option is set,
>  unspecified arguments that are referenced with the `$$arg` form have the value of the empty string \(`""`\).
>  
> -### Target Process ID
> +### Target Process ID <a id="targ_proc_id">
>  
>  Use the `$target` macro variable to create scripts to be applied to the user process of interest that you specify with the `-p` option or that you create by using the `dtrace` command with the `-c` option. The D programs that you specify on the command line or by using the `-s` option are compiled after processes are created or grabbed, and the `$target` variable expands to the integer process ID of the first such process.
>  

