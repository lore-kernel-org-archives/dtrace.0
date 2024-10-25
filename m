Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0032118BB89
	for <dtrace@lists.linux.dev>; Fri, 25 Oct 2024 05:56:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729835805; cv=fail; b=qzDPbtdShHAg9JYEecuUpTOwKBZJLFURnRxmeMxK9lAPxIJH5seQFnI1ulHfmy/s3maoq3P3KeF7d3N5WWvBh93CaXReb1TXRq8Kx+3V58d/X8OQHQDqpuoM6BzNLjzJX3pgRse54y9srMy7zGwBXrS8eyndrVVzfm1zYn06rAA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729835805; c=relaxed/simple;
	bh=tQxjePA7WXrmJZMDVEYGQ7sv+sAE8g0bPLlar9b9EJw=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=F3aPMaLSvwhO2q/cpwvPCUH38yxArQobkMdfxRDoYAcSc40kGVBL9YmwwqSY9eqv45WFfMqAzjraEzzzA4Jxalikjh1hv3N+S9X5W7IC0T7cGPHtiCR1srx84NncRQ3KOhBNt8vnqB+AglkTygx/7XAyu+uxsS6Pn21h1vYXJFw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=OsT307Wa; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=A+fVmHN3; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="OsT307Wa";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="A+fVmHN3"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49P2fdeV030105
	for <dtrace@lists.linux.dev>; Fri, 25 Oct 2024 05:56:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=gOLzSB1uCsiCKcaJjCtesGOPWSkqqclVGtNsiaBZxk8=; b=
	OsT307Wat1ONzsjF3GRu3L4w+fmK2LxrlP352fKQ4CGAreZRe9o4hXXxuTwLvdK0
	5amPOHJRpiLJmGXSqaR2SKQkuAazog2zDoKGU1sRj/TASXnzc5UwF0sbtDAKAQpo
	Y/g2zOJxS3xKpSpnnCLieTn0XU6WaDYSw00xV6hDfktpd+oj1SKWt7iVQsxiAp/F
	/F40yD2mXnqvp1wpzp2eGXUxDdtUyZuIoHt79M5XNHblDc9Tk4dkyFxsijT/eKXS
	G8B0hwoWR5Ni0H5jKjsEMJL1FqM7WJcwQwZU/dlu1DiRO2BBXmrjnJ9rwGzqesfN
	2mlWglUOn8lgaOQqI8s0Aw==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 42c53uv6gr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 25 Oct 2024 05:56:41 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 49P3v0T9027527
	for <dtrace@lists.linux.dev>; Fri, 25 Oct 2024 05:56:40 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2174.outbound.protection.outlook.com [104.47.55.174])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 42emh5as8j-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 25 Oct 2024 05:56:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TwKk7zZ7H0kRtxwL6HbZNcDGZWgjkFD8UPUWmkcMsN9VSd4pN+0wBTZHRDOaxiH1RcuvNusUsosNSjKA/9dRwpQx6WAfQva2lph8+DOI3bGUGE49wEvdTakDp4D6p7hjwFS50OhCAL9Qr3Kre923w7eEgbSYqUTkz4Tb6CvyX6HnWfcGtNaipMszoeBaCv8ME16Abd6u5fG86t+tJOjj3/0tnJ4M2hBsTB0w8Eihr/fSDVdM2iSN19NRcjZ0ajXIJBN9FBuw1KV9LRezyPInueQNaUzNuwCXSU6QbHWWA7627VTy0eCXiKLPyuqBxAPvINppTclPk8/NRrBj21Amng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gOLzSB1uCsiCKcaJjCtesGOPWSkqqclVGtNsiaBZxk8=;
 b=yWV6PdIl7SEMuEfH5ZywttJ6jcTCP5lXgXTBQTxWQ3XXfE5u90QlV4HwEobM86McPjrdUoT2OiHyQyHp/TsbWw7PbffmnNKq/Bl1Q/GHxudD31+2vfAuGY/YkVokqsQfFt/KhQHWPCHAf0JV2o+mIbKwLoGzGT1ayZ0h5WmAV9mwt5kBnYC64PZ8ddEn3ETXLSTqo5sPDQYaohbKnpMqBfriVKzX7HPgpo75ks4o/cIM9kx27fT55R4RNVWqC8g5x0QDMTNXlBawRIBvgExXoT8cttf73zHl4Kib9sjO83R2FaQazRqP5UlODDKzYG+G0+ToWODCgSfArWpCcBuXjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gOLzSB1uCsiCKcaJjCtesGOPWSkqqclVGtNsiaBZxk8=;
 b=A+fVmHN3dMpVovIW+x/WaWGuK4NnwWpzQOq+mXOhN7cvx1vyKrU/KZdQZ9GoWxV5uCQ4Q2yOs6I7PtqZbRP1iuSAm5ULS0txLrk+d0xFo5ueqDjblPZda87r7wj1kMkCZr4R/T15HmZAx+7myK4ZV8voOrGv3HT5Lm86QcAmDK4=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by DS0PR10MB8176.namprd10.prod.outlook.com (2603:10b6:8:201::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.18; Fri, 25 Oct
 2024 05:56:38 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%3]) with mapi id 15.20.8093.018; Fri, 25 Oct 2024
 05:56:38 +0000
Message-ID: <2367490a-554f-6bd0-c7cb-9ff3b5480c0d@oracle.com>
Date: Fri, 25 Oct 2024 01:56:34 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v3 11/19] Support USDT wildcard provider descriptions
Content-Language: en-US
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
References: <20240924202554.7011-1-eugene.loh@oracle.com>
 <20240924202554.7011-5-eugene.loh@oracle.com>
 <Zxp4AmW2HB8G0CBd@kvh-deb-bpf.us.oracle.com>
From: Eugene Loh <eugene.loh@oracle.com>
In-Reply-To: <Zxp4AmW2HB8G0CBd@kvh-deb-bpf.us.oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BL0PR01CA0003.prod.exchangelabs.com (2603:10b6:208:71::16)
 To CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|DS0PR10MB8176:EE_
X-MS-Office365-Filtering-Correlation-Id: 5dd2485e-8074-4707-e523-08dcf4b9ca4c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WEZpQ3ZFaXRnLzZCMnFET2l5T2JFY3k1TW8zUXRwenhRNGZWZ3hReVIrV2dP?=
 =?utf-8?B?aG9UTjBlWkY2MUpic25ET0JyM3ZHYzdwbi81ZVpEblF6Snllam0zNy9SVnJQ?=
 =?utf-8?B?Uy8zYlBaM3ZlRHJRU3JPUWE4UjZ2UzhPZi9hWU9HSHFGT1NMbUtZZFMzNDRN?=
 =?utf-8?B?YUZzODREY0JZUm9NMzI5OUdiWXA5N0JIRWo4RjRrTXpDN2IyNjJvZXIvb0Nm?=
 =?utf-8?B?c3JveVVuZCtEeHVOVGhLMFpYWVZJb1I3WDIrdnNoTkJHZ0J4WHZvZTBLcUZ0?=
 =?utf-8?B?MUx4c0MzV2x5YzJ5SVdCZ0xLc2pQTTR5Q2N1RGdzS1RyNVovMTlTT05mT3Q4?=
 =?utf-8?B?Z3Z2RlJOOTFHRFpvV01vQWZvY2NNM3JXUkpEclA1dUlic09oN0ZGTFBEdVpy?=
 =?utf-8?B?UDlLbWdvR2ZUSEtRZHNTRlVLY0I1bmVadTZKZWFjS0owN25nYUJOY1kxWFAy?=
 =?utf-8?B?VGsrbWUwaXpuRVUvZGRoYmhpMkszZ0V4QlBRdUIxK3MyaTJCYTM0eWZudy9Y?=
 =?utf-8?B?UzF5WXVrTXUxb0wrUTdQS1hGVzhKNzdkL2U5ZSsxKzduYmRMZ3hLdFdVU1lX?=
 =?utf-8?B?Z1g5MUlNMFVUK1NOZmtuWDAxMFk3SFAvZnF3M2RMWm0zUXhKMW80aTBPSzZv?=
 =?utf-8?B?VTlHTEx5cjJDU2xQVEszTUM2Vlo2MUxKYzFQMERDc09KVnpHclFLNjRCL0Vi?=
 =?utf-8?B?N0lWOEhGTkM2ZmRsY0FMUHZQK3VvSzRXK0t2NlIzZGNYMnpVaHl2TWpGbFhF?=
 =?utf-8?B?VWVkK3p1ejU0b3Eyd290MXdMdVBWK3FKQkdQWlVoRGFTMnMrVFFGbktobU5W?=
 =?utf-8?B?Nk5GRjUxeWw4b1BOZUVrakNqL1hoN0F6eGZ2TGFVSUtjaGpFQ2ZVM1ROSDhu?=
 =?utf-8?B?OWhkbXgwVVZNUHVvOHA5R2Job21nb01XR0tWZlk3alhseHZSdHpjNllXZUJL?=
 =?utf-8?B?Q0MyejdvU0w4b0tsZFlJTzFyYmlKZ0xYdzBtdy9HS3dLSmlIWGUzQXlTMTBE?=
 =?utf-8?B?TVEzejNjcXVnN0pmekptTjhXdDRhMDJQQWZGV2R5R2dFWXBvV3N5UXlpbzlI?=
 =?utf-8?B?dk1QR0ptL3RDdUFoS3JsN0p4eENhcmhOV1EyT1dad0NqNHRvcTZ6R0YyK21r?=
 =?utf-8?B?cHZnWVNUdnBtUHdyeWpYcEMxWHVGR04yak9qcU1ZOGRQRjJyV1FSeTlmQ2tx?=
 =?utf-8?B?Q01jOUlnN1FudEp6MTZndFZTTklNTVZWeXRtUTJnSkk2bGxlYnRlU1V0enMx?=
 =?utf-8?B?QjlWTWRERmNvbDNhYnR0KzYzV0NScUdLYjE3NGt3NkFVc0EzSUVIakppUTBG?=
 =?utf-8?B?MkU2QURKZmQxaExiWnN5YnVQN3FhTXlSZUlwMFlRWlhrZyszZGxHNitnVDdY?=
 =?utf-8?B?OEl2VzB1bjBjL3doQ2tvcGRMa2ExbzZHUWRFYnM0UE04ZmQ2Sng4VVQxcUZD?=
 =?utf-8?B?YmVxWXZBOTljZ1EvYW56dEg0UzdXQjBIdytndExBNkJTTWlQWVphUDVYQVFh?=
 =?utf-8?B?MHZMQlZ0QUYvVFU2NmpPZ0g3NDdnM0FFNVV1YUhXTWd2VHIzODRQWkxFakF2?=
 =?utf-8?B?Z1Jha3pVZFVHU3E4WjA2eVZrZTF0aU1VOS95MTh4MEpseVVDZitWRnBSckp5?=
 =?utf-8?B?V2RJcGRkaXNtYThWRU9ZZWtUcEx0L2JtakxFbFZjRUpyUWZpeTRiekRvSjQx?=
 =?utf-8?B?QTR3YW9PRWNkTmVaSk5PanBxV3I3SXhVS2tkNVB5cTNIMWtFNVVuVDRjYXpt?=
 =?utf-8?Q?eFQMAIfPPuux1NRG9invaHHJ/AVUhIPP8/vo8ml?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZmtHcjBMZGtMeHBSRFVIUVFVUFdoU1RmeXA5Z09VVkJZamp3WWx2Q05lZ0xt?=
 =?utf-8?B?ZXRSaFd0V0dwQklCbTNCSWwrWmt5U3EwZm1LdkF4UjYrZUwxdkliT0hOOFRP?=
 =?utf-8?B?VFBTOHkzWkJVZEVDbElGcjM3K0NUOHVpRGJqL0NLTHJOU0lpbUpPNVBsbzJ6?=
 =?utf-8?B?Q1Y5dFlIa0VyOGhFSDh0V0hzeFFSV1pPdWxmOUMybHBwZEpHZ0wrTVI0WERT?=
 =?utf-8?B?amU2cmd5UUF0MVR1VjZ6dThWVGdPUmdpQnkwWGEyWEg5ZVBPcC9rTXhFQWMr?=
 =?utf-8?B?SlBMekR4TXBXYVZaRVJRRjRyc0xmU0pOUEE2OER1RUhScFJVdkh1djJTWWhu?=
 =?utf-8?B?dXBmdGxIQyt5ZlJNNkhpZjhBOWo4bWZpUGhZUVhSd1k5UXJEYnN2VHlYLytN?=
 =?utf-8?B?bFAyaC96bzU2dURxT1BvZG8zWEpBYUh0ZUJjVVRlakkwOUtKeWd2YnJ5bVVD?=
 =?utf-8?B?ZjVjUk5RYzNIQUVlTytDMTJWRU1ZbTZyWnVvUFpHa29PUHFMMERLVzJXTEts?=
 =?utf-8?B?czIram56NGhPZ3JWa0hBOUltelFJRHlUcmhIVS9nR0JwY0ViT3FEWHAxWXJC?=
 =?utf-8?B?bFhJMkl6UXVqdzJTV0I5V0FTamRwQU9tVXF6R1ppdWh5TmN0dk12T1RZV0Jv?=
 =?utf-8?B?cnJ3NXRrSWorTlRPVkpuV3RuendEeDllbHBTVHpBWStTdUx6SjJlOVR4SUM1?=
 =?utf-8?B?Z0U3RGVEcUdyZGtUQlpZYmdrcVFqT21Fby9naWJ3Z0U2N2xGU2VzLy9DMFhl?=
 =?utf-8?B?Mk5vUXdtR2Z1TTNYZzRQTFExMjdCTlg1ZjE0bk0xTnNBeENBSER5YjI1aFJQ?=
 =?utf-8?B?Qml3MU1EUDc1VmhmZkpnZC9UYTZTL2wrNG9pWjRsYmJOMjlPdGJEMndTd3BS?=
 =?utf-8?B?UDhsZVR0bmowMFpDUFNWQlJWQ3gxM2JLNkJCTC95NlRzUTFJaVJGQXpKMXZr?=
 =?utf-8?B?am9YdGRpNGlrbWVDckQ3cWhNSFdwZzkwU2JyTUJab2xtMEc4bDFxUUVNd0tF?=
 =?utf-8?B?akg1c01tNUNub1JHelBJVWJIYUlaK0xhOUpCc1VadHlPbEdMU0VLVmlBMWxi?=
 =?utf-8?B?YXVrZTRSRThjNCt3aDRhT1pvYm0yb1pWak1NaVgzNzVPdFd5VlZFUUx0eUl1?=
 =?utf-8?B?bVJIQzJPQ2RRdXpLZStMQkoySUdwQ1VoRlErUlNzaG9pL2krY1AySGNGSFRH?=
 =?utf-8?B?cHZCNWlmVTNNV3pKRFp0ZW9hcThlbnBTb1NZZjBoQ0hWWnUrWHB2REZMb0dh?=
 =?utf-8?B?SXN4RnlCcU1mM0FEWG80bFhKYmZyaWF4bmhXRVptSGxwV01SWnM1eFRxN2tE?=
 =?utf-8?B?WlAxVmFxVFV6SjdNZ21iVkVBOU1EclU5cUNjWlNNUVhjUktoRUhoN1hteEM0?=
 =?utf-8?B?QVA4STdoZDZsVVlsTWZhQzhoY2pqd1h3NFpEMTZWWXFkNnJyaWRieWwwMk1C?=
 =?utf-8?B?S1NjZnQrWVZnaXRzMmVVMXJpZWxwOVZhRzRPUHJqQlpDb0tJbWRraTBqOGM4?=
 =?utf-8?B?c0hVNTBmRGhnUE4rVEYzdlFHaWo5YmJ6Q1VPVk5DMVdYL3lTYmUrSldSM2R6?=
 =?utf-8?B?NFhzK05BK0s0NkprNDNuNGQ0ZzVKQjhQQzYwMEI5c3RoWWEwczdGNkV0a21u?=
 =?utf-8?B?YjNQeCs0R1VNSTJ0OFB5SWx4ODNzcE5sVmtSVENnU3NiNk5LY1lBT2cvMVlK?=
 =?utf-8?B?VDhXWG1NNjlWQTZCeXNlQ1E1STVzNzNRaE1lSW1memVXWkJ4L05iTzY2RWJz?=
 =?utf-8?B?am50NFJCcUVlMlc4dkdiWi9VTjVsb3ZwaWtXcG1uemxnVGs2Qk1LR0RCNWtq?=
 =?utf-8?B?TWZjV3RiMEFnZFdXajh4RGYwb2JIQUw0ZENwMkhFMEs0UTRYWnZQT0tKL0sz?=
 =?utf-8?B?Y0lpWC9PczRYdENweWs4V09tZFBxVVRsbFpJaHYveG5QZ28raWhPNHlkcUw5?=
 =?utf-8?B?aVlBUUdwd2lNN0ZxOGVQZXZGVVdKa2YxdDBWNjdrdXJpR2xudEFXVEQrQ1cv?=
 =?utf-8?B?Z0hzbkxUVXJLRTd4MWZMZkFLRGFUUzMzK2xlT0xaUkVIOXZzMHZnWk1nclds?=
 =?utf-8?B?cEhZeHdibHltb0RWMlR5dVFrZHM4WFFJcm9aS3c0a2hvWmloTWxHZ3k2SVJ0?=
 =?utf-8?Q?3h8VrmrA4wMMdfE40HwZ5e6lA?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	jRPIqQouD1Mlp8vtLBn8vaw4vB/Tgzq6NtcthxNbU37CY83BlKkCFsX3heMtJ2IDjUMc5AwH6k8neLc09Crw0Zfn8qqAGkG4vQqM3gArR8XCR8QKaKnjUzefRlgzChtxzQSvQpjlrHZxV161L0Qs2wEAs5PwSP6B7hiiyJ1CM2i8gW5ipd3ydYOdsP9a6JGvLnyl0aymDR3ufZo9xC5aYfjezrNFK3oJgR6+k2+gnTRUOUcVC+sRvDq+lBhY18ibcl1/UEHJZI395vQEZICdHbVmDKdfVKtrZ7pmxiIHMVEmvwagMY0qJ9m2U6QuXeb9UdC8Rx+r/KvBCKveAMwebrkQ2kwnNEfA6DXyEUhLOFvRN1pKVWMflnRpZF7m0IXe/MGBR5eeun5Lx+cHJUrJOjdI/oVXSKKMjqnQwMEKz351ylfzEkpuG8VsLvNsz+wFW4Q3QCTvRAaODMoBpNhen1N1aRYdN4+sqbuz8CbntISXY+uoGxydI0lDOdiOPPqe3GWsgZ58Pd/1Mcg84UmhioLobVTZeeSH78HhELwYrM8ItJpBZxVSxZliHtlVgChgE/of+eu3A5bGQETnd5LC5M6S4Hj/2XGKuI7i8nIz/l4=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5dd2485e-8074-4707-e523-08dcf4b9ca4c
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2024 05:56:38.1793
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: J0SeeJ8S7izVFtIXiUZ5PfIsrjVjG26ti5CCvKyajpuc0Jgp+pRP8ESAKj8QiMb0eO/j7Jv5NU7sXxNByYXynw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB8176
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-25_04,2024-10-25_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 phishscore=0
 malwarescore=0 adultscore=0 mlxscore=0 mlxlogscore=999 spamscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2409260000 definitions=main-2410250043
X-Proofpoint-GUID: MiEmPvEUN2hZ61QTmgy7HlWn3jrTKASe
X-Proofpoint-ORIG-GUID: MiEmPvEUN2hZ61QTmgy7HlWn3jrTKASe

On 10/24/24 12:38, Kris Van Hees wrote:

> On Tue, Sep 24, 2024 at 04:25:52PM -0400, eugene.loh@oracle.com wrote:
>> From: Eugene Loh <eugene.loh@oracle.com>
>>
>> To look for pid probes, whose pid values must be specified explicitly,
>> we can require that the provider description should end in a digit.
>>
>> For USDT probes, however, there can be wildcard descriptions.  This
>> includes a blank provider description as well as a description that
>> ends in an '*'.
> What about 'test*1234' or 'test*12*' or 'test*1*2*4'?  All should match
> 'test_prov1234', right?

Right.  "test*1234" and "test*1*2*4" already end in a digit, so were 
already included.
"test*12*" ends in an '*' and so is added by the patch.

>> So, in dt_setcontext(), expand the criteria appropriately.  And
>> modify dt_pid_create_probes() accordingly.
>>
>> This is rudimentary support.  We still need to:
>> - handle globs in dt_pid_create_probes_module()
>> - add process monitoring / inotify
>>
>> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
>>
>> diff --git a/libdtrace/dt_cc.c b/libdtrace/dt_cc.c
>> index 12104fc21..62482a70f 100644
>> --- a/libdtrace/dt_cc.c
>> +++ b/libdtrace/dt_cc.c
>> @@ -273,8 +273,9 @@ dt_setcontext(dtrace_hdl_t *dtp, const dtrace_probedesc_t *pdp)
>>   	 * On an error, dt_pid_create_probes() will set the error message
>>   	 * and tag -- we just have to longjmp() out of here.
>>   	 */
>> -	if (pdp->prv && pdp->prv[0] &&
>> -	    isdigit(pdp->prv[strlen(pdp->prv) - 1]) &&
>> +	if (pdp->prv &&
>> +	    (pdp->prv[0] == '\0' || isdigit(pdp->prv[strlen(pdp->prv) - 1]) ||
>> +	             pdp->prv[strlen(pdp->prv) - 1] == '*') &&
>>   	    ((pvp = dt_provider_lookup(dtp, pdp->prv)) == NULL ||
>>   	     pvp->pv_flags & DT_PROVIDER_PID) &&
>>   	    dt_pid_create_probes((dtrace_probedesc_t *)pdp, dtp, yypcb) != 0) {
> First of all, I am not sure that combining pid and USDT probe handling here
> by means of dt_pid_create_probes() makes sense under the new scheme.  In fact,
> dt_pid_create_probes() may no longer be needed because handling them separately
> seems better.
>
> Then there are two cases:
>
>   - For pid probes, a provider name must have been supplied and it must have a
>     digit as last character.  So, for pid probes you can keep the original code
>     aside from replacing dt_pid_create_probes() with dt_pid_create_pid_probes().
>
>   - For USDT probes, there aren't any restrictions, other than the ones already
>     done in dt_pid_create_usdt_probes().  So, a call to that function should be
>     done here without any conditional.

Okay, though I don't really understand the dt_setcontext() logic. E.g., 
we test pdp->prv!=NULL.  If it could be NULL, then we should still check 
before calling dt_pid_create_usdt_probes(). Stuff like that.  But I made 
your suggested change and it passed tests...  so good enough for me.
