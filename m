Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72D6925C6EC
	for <dtrace@lists.linux.dev>; Tue,  1 Jul 2025 17:44:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751391875; cv=fail; b=GiCdWKkBfkO6YonfdHS0D3v77l/+ZzcOAKXmJgDek4OPyBLNZgcrrUbB3Fue92Py0UGxyflL4vDsekviw1KRdKTQA3ss1wrx6++6TXSIAiyjZGbIFDl0n6E4nQ4tRdsg4U7ZsgfsrONR1oMdw9upC03VrK8KxJ3UpAOeeWxZXPg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751391875; c=relaxed/simple;
	bh=ZaLu2m7C1oGTJZmomugB0edyKPF1mDI6Yekz19FHANs=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=VYiIBNr4wdeqUeEYZm5nNj3hgdDchACzF6qUPUT3b1frCTYxp0f9H5uF/oPhtLeoF+ets/BeT6I6yQjyoqfV/umizN9DfZDVxP6u/F2K5L29lscnPX62Q0yugVF1yAfqIyP9iQX6atTSsQT+Kl4wkbyVhVWNdB1Y8uiJZyQDc4M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=PKelNOb4; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=jO99Mi1U; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="PKelNOb4";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="jO99Mi1U"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 561GfgFT025186
	for <dtrace@lists.linux.dev>; Tue, 1 Jul 2025 17:44:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=mLfprOuymgkRcjiXe05XuoQChj8sopLj7rox1GYwexI=; b=
	PKelNOb4aFmyX7xOKQ1VvXoUSfc1cw4bkLlwPVZMSVPIm/qNkjf6zEjayAMSK+t3
	VcO3sujd2yzf3x1HKrf467vBdzywBtd/+zu8j94dyf79limR9vl4/ds4P/SRvJIx
	ABXVd0hMyvvdeDZpMmAuoXqMNABFjaafn8L6RiKebXQe3j6s6/Uk6nABjNS4CD3Q
	EfFQoYOjBfybPPbJlVK0sgEILBbyposrvfOT7j4uz25zh/gcZVmvhY5oPlXHbG40
	lrLxjjFdtDaPQLPUz54/pUxsh1I0VEZzkffZ/vCDY8FqSvdqnXpfpmJb9prfwIkp
	7kqzU7sz72Mh5RIAfhdZJQ==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47j704dbp6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 01 Jul 2025 17:44:32 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 561GRCOh033611
	for <dtrace@lists.linux.dev>; Tue, 1 Jul 2025 17:44:31 GMT
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazon11010008.outbound.protection.outlook.com [52.101.85.8])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 47j6ua49cg-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 01 Jul 2025 17:44:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xkT37/94hqEYOTG+G7knSt56gOmOwfMyuR0oOjDkvB65CRTpXEySp9p6yaF4bcSZddNH0Lyy0yvcLeGrBZxdhd3BBVjMxzu0WJq+BtT3CjOlfivIMTnInZr5nwmGlKJ/fWcIh/wQVT9dEA+lrZJSkQwhUqDTpKEVuwRDkK5/viC/JFTgPe/gg3Wwt1zOjQqq4kzc4X8rmTNOyn93FaHbg+bI3hs52mFgqxn7yRIXncqVKscJis95MPusoA3EQ//MyYxCm1C3YMWK6v2aizFRQyJY2FScqB96K06FUaNCcC4P9cxl1yBQakMhDTCylcRui22pS2SIfN//bKWVOJ/V7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mLfprOuymgkRcjiXe05XuoQChj8sopLj7rox1GYwexI=;
 b=koWZcuMsPpub1Bj+fAz7DhMzG+altsxD7oUqVH4tiQaOfMaETvMtpOL1SRYu/hGxJwsWE80BIIPjsT0qyogesUgAqxuNTLVuZ3joOzaVIOBJ0Cun4xpK/PpDC1yVARkgmNkHWnUL6aaEzV29WFR+nOUdPQKShxmDLQMgMSMuo0WXQzMbRHj73Zbf8KDo/EmxdqY1l0R8OvIB8X7tNiLhQ6K6XEdbj7fzHzCFLLoFoChuMTh6YjkD4D/x9VI5oot/CvneiJ96hDjjCcakSRAznrEgJzIU0mlLCTl8swI+6UtdYHfDd/KlT1wsr19TZ7J+EFeiRnxan6mDRm/SUSPxGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mLfprOuymgkRcjiXe05XuoQChj8sopLj7rox1GYwexI=;
 b=jO99Mi1U3IHGCTKT/RKd0gk4wRC4InEmgrKQm8RbQYKRXT4w9i+AlrpSBIMZM+Bd42AveHA6EI39pZaZWL1gVn5VhIpkN473/b4M565sVrG2ZN/iN72eV9+8amicli6qc5XusZSJZsRTv7QmP24UXxEOQMdNY9cpSNXpPJ5YqCA=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by SJ5PPF0995E25F6.namprd10.prod.outlook.com (2603:10b6:a0f:fc02::788) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.25; Tue, 1 Jul
 2025 17:44:29 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%2]) with mapi id 15.20.8901.018; Tue, 1 Jul 2025
 17:44:28 +0000
Message-ID: <b2462757-2e93-b589-5cdf-259f7c176745@oracle.com>
Date: Tue, 1 Jul 2025 13:44:25 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v2 2/3] usdt parser: handle encoded hyphens
Content-Language: en-US
To: Kris Van Hees <kris.van.hees@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
References: <SJ0PR10MB56720870F2337F7D89A41C8CC241A@SJ0PR10MB5672.namprd10.prod.outlook.com>
From: Eugene Loh <eugene.loh@oracle.com>
In-Reply-To: <SJ0PR10MB56720870F2337F7D89A41C8CC241A@SJ0PR10MB5672.namprd10.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PH8PR02CA0024.namprd02.prod.outlook.com
 (2603:10b6:510:2d0::16) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|SJ5PPF0995E25F6:EE_
X-MS-Office365-Filtering-Correlation-Id: 0a334d8f-4193-4897-5d46-08ddb8c6ed86
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?QUdwcGV2ZUFqZjEvaE1DRXNKSThKd0p0UEZ4czAvMmxENXVwU0xNNkxxclV4?=
 =?utf-8?B?S2NrTm5la0tsYlBLa3ljZHRXUEh6aVlXT1FXOEhYb2Iyd3p3NURQek5NZC8z?=
 =?utf-8?B?T3VXa2h0NkI2eGhHQ0tyUVFmWis2VkQwR1lZb3VsSDJVaE5LM2w1YVpMb2I3?=
 =?utf-8?B?cFFENkc5M20xK0RvTUJ4MCtmVVl3V1NBK2pEcERjb0ZEL1VYSVBNZXVTUWFz?=
 =?utf-8?B?Y0NQVlZRMXR4dGJWUnFac1dlbmtIajRLYkN6MHl1dHZxclJXUU42QmRXb3pU?=
 =?utf-8?B?eDlLb0hyNVJRdC82Q2lvSDdyd2VlREk1UXZRUzMrTGh4TkVDaUNaYTViRUZt?=
 =?utf-8?B?WkEwc3BMUUxUM2RydlR4NkplR0ZJSXNna1p4UEp4MFo0czk3bHo0WTJGTm5o?=
 =?utf-8?B?TmZIU2s3L1RqdEk4Qks2NWxOeUVtREpLOUtNZEh6ZjZNYlg3RHZncGxEelk3?=
 =?utf-8?B?TGJYN01YeWQ1dW5CeXlJSHFTamFjS05CM0pmMHFVRmZOOVNlNXoxRGxVK282?=
 =?utf-8?B?UTJINkd2bUZzeHFrUVlFSUlaWWNnRmZJSFFlMmNmNUZ6ZTIwTW1XYWFNZ2pm?=
 =?utf-8?B?djlxMjdETVlOWmJGUWMrQVBBUDVqQnVaNEtyRnAxV1F6UkNYUEpIM2dRWlox?=
 =?utf-8?B?Y0lvay83aTZpTDhtSzdkSkZRdEtYUDN1YzBlWUlXVk5GTUE5Vy9JUVhmc2FB?=
 =?utf-8?B?Zi9rRTVnaituSnJYWW11dlRtZEh3MUlmZFJZV09oMCsvU3BieUlocFlEb0ZG?=
 =?utf-8?B?a3hhM2dPOFI1cDQ3WFlBVGZiSGYyNlgzNFpaT29yaDk1bFdwb1dRaHo0STFM?=
 =?utf-8?B?d0FKNEYveDJlVDJveWtVb3lXNk1XT1g0VldobHlxQUc4VGdmaFNpWEswd0JS?=
 =?utf-8?B?MGhHeUNCQWRQa3QreVhmWmxreGUxS1pld1FJRDBLVTdQeWlXNHB3ZVlnUi85?=
 =?utf-8?B?eCtxb1RSdDhJclpBWjhCZkJOMGpYSFFNYXRyUE53UVl3TmdjajdpR1FraWd3?=
 =?utf-8?B?aTNFZ1B1eStBUjVXTzFlY3BPSHdkMTNVSXdsdjdmQ1VhYTlsQjBMVVgySU5z?=
 =?utf-8?B?dnhwOHFDaXJzRFdVK3hFRDVBcEVIQkdzbFl6NVZxaHp3RTRXZXNvRG5ReHF0?=
 =?utf-8?B?ajVpdDdSdlA4SzFxYUdia1dpaytMNlVyTVlZN0xnak91L3pjMUcxQU1uMytK?=
 =?utf-8?B?RzhETUNVQUNkYWNmeXdHL1ViZmQ0THdVakpyM2o0Si9KRVpSdlg1Y05pcWZZ?=
 =?utf-8?B?M2Rja0lXbGZxeXBJdTZ3NEhoRE5zaE5uTFNyL05ycnQyUjZKcCtjRGNRM29s?=
 =?utf-8?B?eDBqeEdETnFsaFJSQ1I3cEVWUTAxYnFqcWxGanJCd0NrM2EvaFBBTW8weHJn?=
 =?utf-8?B?OHlXVTkzN241bjg5Uzk0Y3p0bytLbDhjTEVBak5CVU9LZTk1Tyt5c1g4eTdv?=
 =?utf-8?B?dUxvUkNDOGpDMFJXUHA4M3BFek1TUWFnUG5JRWxWVExVK3M4eW5BaGtoMTdp?=
 =?utf-8?B?ZGlpN1I4MVBSZElkUkxUSEEwa2FNZ0ZNKy9YRlI4eXh0cTA3NEVOV05KcWZT?=
 =?utf-8?B?dHRRZUVXZG5lNDBBcWFMNGtOV00rUVJ4UnJMRzlaTi9hVE16STBPaGFwTS9h?=
 =?utf-8?B?eHVTNW9mSWpXS2dkKzEzTEFaK1dwUDRScU90clFDaU9VT21BUzlFdFlRRzcr?=
 =?utf-8?B?VG0zNVoyRTU0QkxZZFROVDNsai9KQ0F0OVdiR3VoL0w4bjZGZ00vaG5aOExF?=
 =?utf-8?B?RFd1aUdiTEZzSjFEeWh2TXdwMW9tTzFBWVU4eGdBN2NqV0V1amg3ZjJsbEN6?=
 =?utf-8?B?WWpQMUFkc3NoR0ZQdE56SzZtTzFMUmFlYi90dFdIbzVnVmdBVFRJeTZ5RFdp?=
 =?utf-8?B?a3cvRW9xUy9DSlZhOW9NY1BwczdKMmUzV2traHBBRWdSdS9nYjdna21JZjZz?=
 =?utf-8?Q?8EOeS3uM+gY=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SUhUSDFLc1dwWm5hRHlGbDE2QnRoNG9FWXVVOW1wOFdheFZ1Z3RRKzczMEg2?=
 =?utf-8?B?cnJ6YktKWkdJK3VyQTJsQW9Fa09nZ3pBWXNuR3dMMDlOdlVqY2ovcmVZYUh6?=
 =?utf-8?B?d3NMRGNUOVRBdENUbVFNcnY1OCtFamdDTVZ5Q2srazNzSS82eUIrZnAySjJC?=
 =?utf-8?B?SThzMmlraTNvSnFNRDJmZG9ZSW1BV25LSDlYT3FaRXR0Lzg5Z0w1TnNBU3pN?=
 =?utf-8?B?RTJzeDZoTTdMbmdhZU9BNzdOaVJ0b2E2S3dRL1dQbEMvOU9FN1NoamQxbDN2?=
 =?utf-8?B?cmhpZGVyUCtycHZXYlY2UzhmdUJjSXVpVXA2TFlnaWQ0UTBpWldJekpsdFZ1?=
 =?utf-8?B?azFEeS85RXBJc1FLb084REdlYXJIRVBYVklFbmNJNUVJbHMyYnlTOXhhaVBr?=
 =?utf-8?B?d2tQbXdZMDQ5MGZzbFM4Q09NYU8yOXVyNS96Qk90L0Ivcm0vNXNzdWhPcmw3?=
 =?utf-8?B?THg0SGtwbWt5UTJIaVZtalJUVFl3SCtPYUFSLys4SkdiYkRHNXJ5L0NrVVNz?=
 =?utf-8?B?NGIwNzFRMXBTdFU0dCtEdk13a3RGbGg2bzk5Q2FlWmk3VGtSQWY2dXpEelpN?=
 =?utf-8?B?aVNJcURpQncxMmVnYlMxU2FOQjExcDZpaFlhcnBvQjdjWERYQndKejA3QmIv?=
 =?utf-8?B?dVc0Nk82SSttTFJLbW5seWlmNWNFRzduc2N5VFd0SXl2ZzZYSE5tOVdhK3dT?=
 =?utf-8?B?TjhvclRSeGNZbUhKelExZk12WG9pUHdmL1JUaG5GTXIrYld1eEQwN3N5SGNh?=
 =?utf-8?B?bzZZSDV2N2F3ditaOUJXVnR0UERYa2EyWnJubXBWL2UxejhWWk42VWw3NFg4?=
 =?utf-8?B?WFlBMHdsMWpOS0hXbVVZUzFhekU2YXN0bUF2cEFQUFoyUUx3QnYzeUd2N1ll?=
 =?utf-8?B?Qm44MjZ4ZHN5dlBEOTNZMm1pV1ZNM3Frc0oyeFFTU1V3aDczNjU3OUxZVm5H?=
 =?utf-8?B?Q1FwRitGNENzTzhUYndUTnRWUmlPUy9ieGU2cm9EQWtGMTJ2b3ByQmxMTTVR?=
 =?utf-8?B?Ykwrck0wazFIVXpubjdTcEVRS25tb1htc1ZTQWpTd2k2ZzFVT2dKZlFVSVU2?=
 =?utf-8?B?WEl3L1FCRkh1eDRObkpsb2pYTndFYUlGRTRtcjR2b1NMdm1zY3BzMDhHVTc5?=
 =?utf-8?B?YkRrTHNNUmYzRUFtbTVheXNwQ2pxV1R3RUVmUHZUYmdCdUt5M1RKRnZBR2xB?=
 =?utf-8?B?SFE1WStEK09tRWZGSEIwbkxaMDRRK1B1clJwekpERi8zL3hRZWlacjNSaEND?=
 =?utf-8?B?NFlGOG56Yk1IcHNjcnRMK0RCVDRkYWpXNXE3YmNqWlZPSVN6aDhCdU1KRHdp?=
 =?utf-8?B?djZWZ2pNM2hldDhiWHV0K2JQaVhnSmhtbFM3eitNS1pZNTZSZkIxVmxKY21o?=
 =?utf-8?B?dGFaVkhONjZFVFNmOWpYTFdGQVRtVUhkVzRrb2U5dHAyU3ZHaWh3VDlHcTli?=
 =?utf-8?B?c0t5NDROQkVyaE9Sb2xUbEc3YWR2c2lpTlJVWEt2ajdSa3lUZHRScTZYM0dS?=
 =?utf-8?B?RG1nU0RoYkU5MFI3VlRPQXRRd2QvWlc1R1RnVWpiOGtwSGhSZ3pIMVZsYm5J?=
 =?utf-8?B?Q0ZUeTYwNTdQRlBKVnhidHI1dm1NNWtYY2RYWSt2NHI1RUNJTkhaaTUyaDZn?=
 =?utf-8?B?WGpRSE1KYTkvTjJvSTBHNkhXSko0WmdBSVlEb0dFVFQxNEl2SDZnemgrMFFn?=
 =?utf-8?B?VmF1bWZpS0hJVngwS2U0TWdVZExYMWhJNGd0YURjVG9relFiYUxHalNXeDJV?=
 =?utf-8?B?VnZnZ3N3aGRuNEJTQTJyTXF2clB0akdMNjNhR0t1THd3a0VrS2IxbWk4VEFQ?=
 =?utf-8?B?NVBDTCsvdFJtRUw5dDNRdldNU2daYkhGWkxWT2FtMktwTTB0b2l4NGZaQ1kv?=
 =?utf-8?B?eENZckExT3lhd01CQVNqb1E2aC9ldTBSQW9FTmRBTzc1L2FJV0xhY3BLQ3V3?=
 =?utf-8?B?U3dGNVgyNHlRMHdUTUVnNlpwcjF0UHFCSHEwc3I5V0hOaEovQzZNUTdkWktW?=
 =?utf-8?B?cHo5ZWNxZkxsUjZsYUxhRG9kYUdxdHdQVHk1QitQaFkrQnNVclB6VDFNWWUx?=
 =?utf-8?B?a2M1LzNwRmhGUzhlWTZ4c2pzNGs2V01PeTh1aDJiZnZEUXFXRUJSOTZ1OVlI?=
 =?utf-8?Q?vGeLtvQ6gQOhysSxSBAjBKyKJ?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	56C663Mm6Ojent5FLkZsmriM0NnyO2Bwdr3BKLY3hVqypgOqX0EOb+Dug/8Hynu4Gm5mqscinUUiHVKA9H/THKXbGysWrYGR5UaqzknEPcthxxgmpyTeUW4Du976H74tVNUrmCO61joHMyCdMkkT0MMMgORtllqqAy6p5DZ2klcgIZJgY7xOv1shBoF/lJAjmBXmX7dBUgqOfgBAe5N3f/AyPB+yeOzNRJD8Hf5XtrHebX+Pyjnk5GPx+12T9aslnZ72KV0kYAwzQH4wec+bPZVkyHts3YxJ9AWr8cdJu4a47qV1H8nMhHtQWmK1daLZVo1u1iM/fE6fb7jj7Z2i5sZVfbln2bGTmqMojrH24dUmLNf/J0mEnEJgxa7vlWsNSy0AdbP2hEjIowb15WncjTNN8rGDP8XBNMhdSXC/WeT9iQYe+9+sTJKggrvruZX2wDzf+xE70qVX4V50NqyY9ctS1uPUO0IR5G3sfiIhmAFV/3wAAo8lfdBwYYrf9eILr7LgsZMoRcrNvwGtxBHiZoyNdIqghoaA3DdGrE6sqsLTgPwGCXPeitD0tN+79V/cR2f8PUI6E3DM+29bvsJllMOL5qpwHQ534kfIcFVOWk8=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a334d8f-4193-4897-5d46-08ddb8c6ed86
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2025 17:44:28.6662
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ze3TjYmqv1Z1JePXMNTFavwlvpFkVYBm45WFaaNOQARUlY1rK2QXDJ/fRucZ63zCtA7PuDf0pYsSE3/7++ZvCA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF0995E25F6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-01_02,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 spamscore=0 adultscore=0
 mlxlogscore=999 phishscore=0 suspectscore=0 mlxscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2507010122
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAxMDEyMSBTYWx0ZWRfX0uu4syfi3Av4 GB/Sb1hRBPZRVsTNt5wJpUHk7tJfzuXG52EAZNTo7qYqOclamucZfuN0Y+PZEAjZJUQPAAY+Onz mt7krDj9KtbuCWuuX1vJu+y06Imq0h1pUtAwRclVF/M8hVKnwJQYtjf+RFvPdTJdvrLHj0CBqRd
 qLodXY+TPwTGRe5htJNSxxgbY8ZbixjZrVrmGt/+mm4KyhskFuXNlSlevfz9dHmfMwsuUcHqFpZ z2bTs1pFHHE/Q3Jgyy/kvCqxnIWxbp4pru27EPUZyesiyyMkIi9AWssdPlL7RnqrIxDDbwVwbrH akti69DkFnk2AynZDXqQ1Zlr6E2ya4wXHnyI0zrUulSvWUKlC9NHcrGTxU9KDyXn7+MxgSzU5af
 1DNsBnDACuROYKaDprh6XYRVIGX3aHfgdcH4EdaQRUjpglv+xrs63o+RgllJ9BMCvJ+7QPuK
X-Authority-Analysis: v=2.4 cv=LcU86ifi c=1 sm=1 tr=0 ts=68641e80 cx=c_pps a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=KmD2iX6ZHsg-brs5oDEA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: 1e8w032PLMinXjbsNooXBg7-9SvGAgJj
X-Proofpoint-ORIG-GUID: 1e8w032PLMinXjbsNooXBg7-9SvGAgJj

Reviewed-by: Eugene Loh <eugene.loh@oracle.com>

Little nits below to consider.

On 7/1/25 11:12, Kris Van Hees wrote:
> Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
> ---
>   libcommon/usdt_parser_notes.c             | 17 ++++++
>   test/unittest/usdt/tst.encoded_hyphens.r  |  0
>   test/unittest/usdt/tst.encoded_hyphens.sh | 74 +++++++++++++++++++++++
>   3 files changed, 91 insertions(+)
>   create mode 100644 test/unittest/usdt/tst.encoded_hyphens.r
>   create mode 100755 test/unittest/usdt/tst.encoded_hyphens.sh
>
> diff --git a/libcommon/usdt_parser_notes.c b/libcommon/usdt_parser_notes.c
> index fb57f119..d3d744fb 100644
> --- a/libcommon/usdt_parser_notes.c
> +++ b/libcommon/usdt_parser_notes.c
> @@ -471,6 +471,23 @@ parse_usdt_note(int out, dof_helper_t *dhp, usdt_data_t *data,
>   	}
>   	prbt.off = off;
>   
> +	/*
> +	 * If the probe name has encoded hyphens, perform in-place changing
> +	 * from "__" into "-".
> +	 */
> +	if (strstr(prbt.prb, "__") != NULL) {
> +		char		*q;
> +		const char	*s = prbt.prb, *e = p;
> +
> +		for (q = (char *)s; s < e; s++, q++) {
> +			if (s[0] == '_' && s[1] == '_') {
> +				*q = '-';
> +				s++;
> +			} else if (s > q)
> +				*q = *s;
> +		}
> +	}
> +
>   	if ((prp = dt_htab_lookup(prbmap, &prbt)) == NULL) {
>   		if ((prp = malloc(sizeof(dt_probe_t))) == NULL) {
>   			usdt_error(out, ENOMEM, "Failed to allocate probe");
> diff --git a/test/unittest/usdt/tst.encoded_hyphens.r b/test/unittest/usdt/tst.encoded_hyphens.r
> new file mode 100644
> index 00000000..e69de29b

Empty?  I guess that works.  I usually have something like "echo 
success" at the end of the script and "success" in the .r file as a 
sanity check that we got to the end of the script, but I admit I see 
nothing in this test I can think of where things could go wrong.  Up to you.

> diff --git a/test/unittest/usdt/tst.encoded_hyphens.sh b/test/unittest/usdt/tst.encoded_hyphens.sh
> new file mode 100755
> index 00000000..90608e25
> --- /dev/null
> +++ b/test/unittest/usdt/tst.encoded_hyphens.sh
> @@ -0,0 +1,74 @@
> +#!/bin/bash
> +#
> +# Oracle Linux DTrace.
> +# Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
> +# Licensed under the Universal Permissive License v 1.0 as shown at
> +# http://oss.oracle.com/licenses/upl.
> +#
> +if [ $# != 1 ]; then
> +	echo expected one argument: '<'dtrace-path'>'
> +	exit 2
> +fi
> +
> +dtrace=$1
> +CFLAGS="$test_cppflags"
> +LDFLAGS="$test_ldflags"
> +
> +DIRNAME="$tmpdir/usdt-entryreturn.$$.$RANDOM"

s/entryreturn/encoded_hyphens/

> +mkdir -p $DIRNAME
> +cd $DIRNAME
> +
> +cat > test.c <<EOF
> +#include <sys/sdt.h>
> +
> +int
> +main(int argc, char **argv)
> +{
> +	DTRACE_PROBE(test_prov, entry);
> +	DTRACE_PROBE(test_prov, __entry);
> +	DTRACE_PROBE(test_prov, foo__entry);
> +	DTRACE_PROBE(test_prov, carpentry);
> +	DTRACE_PROBE(test_prov, miniatureturn);
> +	DTRACE_PROBE(test_prov, foo__return);
> +	DTRACE_PROBE(test_prov, __return);
> +	/*
> +	 * Unfortunately, a "return" probe is not currently possible due to
> +	 * the conflict with a reserved word.
> +	 */
> +	DTRACE_PROBE(test_prov, done);
> +}
> +EOF
> +
> +cat > prov.d <<EOF
> +provider test_prov {
> +	probe entry();
> +	probe __entry();
> +	probe foo__entry();
> +	probe carpentry();
> +	probe miniatureturn();
> +	probe foo__return();
> +	probe __return();
> +	probe done();
> +};
> +EOF
> +
> +${CC} ${CFLAGS} -c test.c
> +if [ $? -ne 0 ]; then
> +	echo "failed to compile test.c" >& 2
> +	exit 1
> +fi
> +$dtrace $dt_flags -G -s prov.d test.o
> +if [ $? -ne 0 ]; then
> +	echo "failed to create USDT data" >& 2
> +	exit 1
> +fi
> +${CC} ${LDFLAGS} -o test test.o prov.o
> +if [ $? -ne 0 ]; then
> +	echo "failed to link final executable" >& 2
> +	exit 1
> +fi
> +
> +./test
> +status=$?
> +
> +exit $status

Yeah.  On first read, I'm left wondering where the check is that "__" 
got turned into "-".  I guess the check is kind of implicit. Another way 
to reassure readers could be to add one more line ("$dtrace -c ./test 
-lP 'test_prov$target' |& gawk '/test_prov/ { print $NF}'") to the 
script and the corresponding output to the .r file.
