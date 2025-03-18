Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2EABBE4F
	for <dtrace@lists.linux.dev>; Tue, 18 Mar 2025 01:58:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742263131; cv=fail; b=CDnKWY6fWGj3U4X9R6S2uFtaK5E7NUifqcWJELeLYDuZ5rpBGOVbph9Rm3b6iQt8m95W+2Irg01gxuWUODqkM5yLGAQgvhBlvRZ3pNtLXTVPiWvL1Tq49xafXglcOekEGDoHZqrNWV5Yirs8m/Rwzd1RBM1vEwc65xsAJWz+zpM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742263131; c=relaxed/simple;
	bh=89Wd3l/iHbuFG3afN5O60eByDsvT2Eb29cyxrpz4jug=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=hisVhph48XqI5hH81hTG5RUf2f/Jz6sVM3VODQtafDFkzC8VqwlnXo9Gf4Py0fFx4eb7YbK9iGanK2a/+A1tZjoX2+iy3qGhcSKqUBACZf1SWUbQUn0x+LILZahb1NL4KTYSeO/Oyz+6KJick+aEgRBtkNm3yUkypRRMtVn1FUU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=B6tGIwUn; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=hbwPwc/7; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="B6tGIwUn";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="hbwPwc/7"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52I0perD025338
	for <dtrace@lists.linux.dev>; Tue, 18 Mar 2025 01:58:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=4oFbCj6EhgQBdp7dFXg7Eq50PYSAWYMcayDx8MI/Zms=; b=
	B6tGIwUnfXOOtRU3fD479ei6qtFQWjvZF5KxLhz/kYuclTQ8Le+ZLtz7PioMGgFS
	3T4j1vDlDPqvqc/MiGwCjEpaEo6JqHiuFM9ypZbmf5vyVYZN5R57yahVPv254Yfj
	TCpIO6+LfniooaBR7GMWWkY3I55y/fD9X5IMzyzDHG8E2NlX1dgPmdDlv4hsjcCA
	LexsCl7vTTw5yv2neWsbfWkSD4hV2zYKh/40HGkYjMW+2MP1NfNJpVbiTwXWe21G
	305NU4AOySHW2PfPSD1l/CQ6EgbWzfWp+//SHwvNwP9eCchaZfSOsURdTtXIsOhq
	dyywivEoOK9hORiJPQbYNw==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 45d1m0v5ux-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 18 Mar 2025 01:58:48 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 52HNiKOK022394
	for <dtrace@lists.linux.dev>; Tue, 18 Mar 2025 01:58:48 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2175.outbound.protection.outlook.com [104.47.58.175])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 45dxeepc1j-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 18 Mar 2025 01:58:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AVo1O12rjvGe5S46tKsWGHG1vohsJFV7pF6DSZLucXb8xqRxxzX4WJzIG38I3kizNVlgE0cXKCFGWpPJqMLfg3ElcblVM6yfKeU8l54VGrkeDvA/kytJIedvs8pD4oCjZMwYP2T0YJrPG/xvo8jBgKXvbMbkF/vAKVLcWeDklvVXVkx0TIgXzdPFlcuTkpwPJHD9zMqCZJwnQdRnxtSmNrbaWo8mQONygqo4UOVLQg78KCvM8xEEY2UazUVcLdfmOlQtW1W2xqWEUf3hrDIsdoujH4iEYV8q7ohoHxsOHojxK7umh59iZ84X1UaWxhc4IlAawZjPk1Bkcxb2dLfWVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4oFbCj6EhgQBdp7dFXg7Eq50PYSAWYMcayDx8MI/Zms=;
 b=WwixnJyrtNfd0ejUA7TrQUHfofoOKwudNKjuaUj+kj9ZxTEK8aldrr7Y2UrFL+ENNvRe7Qfe1blmCaJhytTjBHi7sEoUnNr41cL3w0M1nEW3/PtJ/jKZqpLRiUVnmeIYPFhx/EKl7uFCD815jy9oIMTmT89Wru50sgbbcURjfKp6LYFPfOtElbiom4aSbvx2vrDSWVaVxJmxZe7Gk+Zu0DqKYBRuAG6L9LycnZ8+4byIpVd7z4fk7QFnYHr9jX1CZlc3wXUN16dzr+jj/Q5LR/Ee6frSS3jlHc2jFt6mwzRAdkIeIx5mVKRMPQayFdJndEZb58vLOav7wBrfYpxkag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4oFbCj6EhgQBdp7dFXg7Eq50PYSAWYMcayDx8MI/Zms=;
 b=hbwPwc/7JbRX/WTkuNebT9+F8MaLO5cYuw8PQZ7bP+AGja74cZxU/7Hi8lzOPmi/viUKRijJikZ3YsLqCis5qo3AX4MlMc2juFP35tR4hsETwhUi40kPx6lAG1srcNLmooaiL3DKM1BAXiD4JbZFD4BM4vkBmJkG1gHQrV+/f7o=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by CH3PR10MB7930.namprd10.prod.outlook.com (2603:10b6:610:1c5::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.33; Tue, 18 Mar
 2025 01:58:35 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%5]) with mapi id 15.20.8534.031; Tue, 18 Mar 2025
 01:58:35 +0000
Message-ID: <16564042-dde6-d19b-ca57-783bbebcaf4a@oracle.com>
Date: Mon, 17 Mar 2025 21:58:29 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v2 6/8] fbt: performance improvements
Content-Language: en-US
To: Kris Van Hees <kris.van.hees@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
References: <c4ad72a5128eaa842f3ebfd2e3a05080.kris.van.hees@oracle.com>
From: Eugene Loh <eugene.loh@oracle.com>
In-Reply-To: <c4ad72a5128eaa842f3ebfd2e3a05080.kris.van.hees@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BN9P220CA0002.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:408:13e::7) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|CH3PR10MB7930:EE_
X-MS-Office365-Filtering-Correlation-Id: 3f19ae25-074e-4c8b-5eba-08dd65c0645e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aG9KNThYWW45S0xGaGs5My92UlQrY3ZVTXhmeGRqUDV4aUY5ZmRsL0VJTDZG?=
 =?utf-8?B?THpVQmd1bXN5MklDczNrNlFJYWsvcVZ3NFFLSVA1TWRpTk1kMlpyK1g3MkYy?=
 =?utf-8?B?NTU5YmkyL0dzSWc3WGtDYnhneUI3UlZVN1E1a0FvRUNrckJKQXptaG9zYU5z?=
 =?utf-8?B?QTBPd0w2NGNXd0IxanhGaWRNK2FNYno5MndqRngrVTRaZlhySS92NUJ2TU9R?=
 =?utf-8?B?MEdoNjhabjJGRlRIdTlSZHUzak8rbHhKTlJFVXY1bUpWOHpLNWkzUnZDdVlq?=
 =?utf-8?B?aWM4YXl1cmRSWFIxRnplMit6d0FiQkE5dVZhOTZuQnVLSHFzY1cxVHd0OHJ5?=
 =?utf-8?B?bmFxbzcxTzJxRzJqQnNvN1FoWWdGelRWeS9BRytQUHczVGoyZUdGVzVWb29Y?=
 =?utf-8?B?d3lZK3JMbWM1TFJQdVRzMW9PbFVjd25pZ201M1lCRFpzd0g5Y2dKbjM3V3VR?=
 =?utf-8?B?alB1YWxlSUwyclRFTHVMc1BKQ2VmZEo5eWdWQldtVlBhWmRBdzBRcEtWVVBr?=
 =?utf-8?B?cklHL0dZYWMxWnF6UFRaMFBGakJNUUZjTlk5RW5LTzBlVWQ5eHVBTjF5dDFM?=
 =?utf-8?B?Tiszd2p5Vk1HeE9LQkx6ckxadUpZbTNkZmFyN0Y2V0QyZTJEVzZNSDd4Y1Rj?=
 =?utf-8?B?R3NXNUl3S2xNS2F0MnduandMcDIyaTk3WkpnMHdXNmtGTDJaUHkxRnRUQTls?=
 =?utf-8?B?NVJRRkNaVFJuR1ZYYXdJOVJMVCtWOHI1QVF1RGtIV2dwQUtkLzlSKzVrNVpu?=
 =?utf-8?B?cklyWHpPYlNmL3lQRit5VnArTDFhSDVRVS80VkgzaXpxVzFqazEvUU1RSDlT?=
 =?utf-8?B?akg5VHQrWjg2Tk81WnIrVWNBRWhNTmxLcVZCS0ZvbUlCd1lITGZZVHpSKzBG?=
 =?utf-8?B?Nk1FQnJNeW1JSHBWVmoya3dETUFvMUdqcFhueGNvc1hVbGM5S0ZrcXpsUmMv?=
 =?utf-8?B?TElkT2c5b0ZHOEFkQjZ0NmEyaDY4dVdzNXhGUkdpUXNKZXN4L2hBSVNLbXpP?=
 =?utf-8?B?WWR5blJYVDRmeGVZSkxxTWh4cVhycmg2WGF5TFl6bHZvbjlVNDJQRlh3Nmt6?=
 =?utf-8?B?TGQwbURuTVlGYi9VU1Z6VzVuZ1BjcnJhRDd1eFQzVlVTcGswYTZXTk5rT3VH?=
 =?utf-8?B?eDFZWWIyWFhTL0tYM2RsN0NzYjI0V2FwRE5KV1J2dUF6V2xVN0V5blZVTzJM?=
 =?utf-8?B?aHZsVEdabk9kVmxHNjU2ODZhZVRxVERueksycnJwdXg1N3p2bG1KZ0pvdG5Q?=
 =?utf-8?B?UzRqeU14SWFjSDhXUEpvTGlPQVFNSXZFUFRQeVNTMFBSemFCWXk3SHpTWmhq?=
 =?utf-8?B?b0hlcjhVaXRkVjdTWE1FcVU3b1RSWWVtQS9XVkl2eTR0R0pLM1FSY0ZJMnB2?=
 =?utf-8?B?NEM4MGFzNEtSV1VaK2U0c0M2MDk5NnVNSnZUbDFjQy9lbjJJQzAxM0NycU52?=
 =?utf-8?B?SUdMZDVOdkQ5ZEo1T2tsbDhXNnRMNVUxZW5Ed2FZYm9TZlZlRXRmUElxSzVp?=
 =?utf-8?B?eCtTdkRhOW1sWXZHWHJRT2V6VW8xL2pBYlU2SnJwdTZub3hqK0JqK1ErSHB3?=
 =?utf-8?B?NTcydGVvYjVINEVZb3lXM1hSL2gzZk5icXRUUnlKVHhvbGhhOWxaTkdlWTFE?=
 =?utf-8?B?V3FyZ3hKeXlqS3dZbXdLNWVFZy90SHd5TzYwa21Wd3BwMTA1blloZ0RzaktS?=
 =?utf-8?B?bk5Hc3VXVk1kRGVocnZSYXMvRXVIcVU3a3M5czJ1anFYLzBaQzFobXNucnF1?=
 =?utf-8?B?OVh5UTZWVThzSThKSzdCUnc0bCtVcEw5UmhOUXd6UHM1SGRaTU9sRy95ZUxK?=
 =?utf-8?B?VTRzdEpPNDRrN0VETmpNQUpPbFBEU3dQVDZENFlnNklJVkg3RVg3WGdsUFNh?=
 =?utf-8?Q?IKvKcMW/ILtLh?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WEk0aGFFZUkxRU9OY1h1blptazhYRXBLTnJlZXBiUWpHalkwa3U1N3J4eTJz?=
 =?utf-8?B?S2JPUmU1a3BoTVJ1RnVuS3ZERlVrTm1CNmZxOHI4eTg3RnJrMW5KRTdyV1JE?=
 =?utf-8?B?bldwMHd6eCtMc0FsalJ6WTRQMVFJbU9pZTVoaXZDenNkc0w5VHhvRUhNOFB5?=
 =?utf-8?B?ZE0rdjdUdmNIT3BBSWdaYzBRanNwQVl0YXZOUXNnL1A1Z3ZqQ2hHOU5yRG02?=
 =?utf-8?B?VlVFQ2JoeDhOK3paaXBWdExwRHErcnJBbE5XQUxPckxVOERlYzRaTm5HS21K?=
 =?utf-8?B?QzNXVGdaU0o2bXU0OE9iMWtxeENPTFprdW03UjUvSEMxUmJWNGZhdFRMV0RG?=
 =?utf-8?B?SDYxNTNOeXhXVWd6N2lqdTJqK00zZE1BMzhzQk1CM2xxYllTTzFUa3pTanQx?=
 =?utf-8?B?VnNXcnJGTTB6VktwZnl2UkxIOGcxZm9JTEV6bnB0Uy9SaDYrWENhWnVBbFFy?=
 =?utf-8?B?WUhmZmtlNjdVWVZWUUl1bnZiYUs4cUNwc0tYS1FmeTlaVU5QNDBreldiOHdY?=
 =?utf-8?B?M0lzVEFPYXdqSkdka1FHR1VXbG80TVN6dkhKaWN1b1JhTFFTUDl0Mm11Yktu?=
 =?utf-8?B?RUo5bHh3cmV1QnFsbVNhTXBOTnA4dlZnSk5kV05WSVBhWFJYNTNTODl0ejFo?=
 =?utf-8?B?Mk5PdENqVEJjbFF4aFI0T3BmY0dCL0hJRnVXeFNjYjdhOVJiZVRhK20xSC9B?=
 =?utf-8?B?c3R3OU0yYlZ4eWRLcFJHNXNtSnFFd3M4U3R0emkwMkdEdFB1T1VrcWxMTUdP?=
 =?utf-8?B?d2VVZXovbHRHb1MrM3RLUFB1eWFaTEpCendvMGEvODc2YU9JTUQzOGx4K09B?=
 =?utf-8?B?SWYxbVNtN3RtbEtNNG1Nb2F1ZUNTR0J5c2dwV0gyVWJ2d0dYYWowTk94VTJG?=
 =?utf-8?B?VTkyai9BSy9OeG13L1c3UlhRVHFZblV0WlgrQWNoWEdvdW9XTzlvQWF1NVVH?=
 =?utf-8?B?aUpsbEZ6cFo1YTdtdFQ4ZUlUSkhod2x3NUJIa3poK09rV205aHNjZzNhSEtM?=
 =?utf-8?B?ODhpMmZXN0dtOVJqTnpwdFRLYnhXeUdBNXVrRUVkVE5XYVE5M3E0RVNGU3FH?=
 =?utf-8?B?QkFieVc2dGxDKzVaWkRINWlaSzJ6bUZFNW45M28xalVMQUNMZTdPUmNCU1R6?=
 =?utf-8?B?MW5seSt3SFdIblE1MWlsZUFLMEdtMlRaM2pGWklWUXdZNGQyN3l4L2hRVTJj?=
 =?utf-8?B?UUNPWkRTSkpIMTdFMDVIM2pMR1RGQnN3SEZYclB5Q3IzUlRidUFyeGVqZFZG?=
 =?utf-8?B?Skt0cmF2UXM3QmZleWJiMy80ZDErWDFoUkZROExEaDVNS3JiKzBVQkNnaXNG?=
 =?utf-8?B?WXB4VXVDUWp5VnFhVkc0SjVhNzllb1ArQlZjYmJFazByR0pjcE9zVmVieXRz?=
 =?utf-8?B?MnVSQW5oNUg4Q1p1STUrbFpWUm85UFl1bVhpQUFYRXIzTGo0YXFPYzlNOWlN?=
 =?utf-8?B?dStvTlAyNUJVZUdSMkluMThNc3NaallRV3NPTWhiWGtzZFBQNnFqL0RyOUdY?=
 =?utf-8?B?QUd4MUVNTzgzVWhVR2EzRmxhbUN5SnJmZFlNWnhYMms4a1dBd1pRYVRmR28x?=
 =?utf-8?B?VGhzUk5qVXhNQ2xZWWFlKzNqbU1lb0xqRHg0V3VvdnJWYyswaEh2R2VjVlBQ?=
 =?utf-8?B?aGJGWkJhU1FnRHRnTnQwaytEOUhLQXhEcjFIQ1lxYXlsMkQycGdkaVFZR1Fx?=
 =?utf-8?B?cmdsaGV6TWhJSTdYTWxaTkRXZXc3ZGhlaW9ad3IwREEyYVR2RnRQVGxpbmVC?=
 =?utf-8?B?WWRKTHNYbEZwSHNXZVpmRWg1RXlQOG5GMUppejZTVVRadUNEY3BjQnJiSGJ2?=
 =?utf-8?B?WXRpR1RFMmlzWDhRZzlWdHBmVEhjVTRCYW8rZURuWkVzNkdkdnZZMVpjUGts?=
 =?utf-8?B?d2t5NEp0cVNuK2FOSkNEVmRWOTg4TE1qWEgxM29aNWRza0pteURjYU92c0hN?=
 =?utf-8?B?NER6NmdNQ3g0bHhXeCtocTFhSnBuaWJ4cVdQcVZ4UDdzbE1KQVUzM2M2M21j?=
 =?utf-8?B?c0MrbWdEN1BNSEdZWnl5Ry9lM1VONlY2VnpvV1R4TCtCL3AwTWt4UEZsQzNx?=
 =?utf-8?B?ME1KMjluY1RJV2dwdTYrazhpL1ZBSmFvVExRalZhZ1hVUnBteEdjRUpQdno5?=
 =?utf-8?Q?udl79izVLkGOcerjE3tc5Q2AK?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	R2njxHipk4mdlOcObmpcaIwjDDrCd9sgHwIjNyr4gmflg66Q1a9ANijF/XBAbACka7J8prvcqxN5pDRhX3/H6Yv8ea/oROZriZR7OpeSvduD0DnPt/EZ0+AmtgMThqN9jAOX3bJNVGrMWvIe16taZxTJRUUAouF3UNkveSjF1qYX11Cj4ebAWbaHN4yfXNyjUiDna1ti2OiZsZFKbpX+0aliQV8cYjiYDXfqmD6fz8Rx/Jigo9p7O6KptrIlKSKYMOQX0mVR29M+bJHaql+1FHgvzuJGWTo31adolx/9x/bND+cKV1/VnC7vO1AFntIPUT5oXkejvWs1yVdqHZo1uBECaAGnaw58mvzfaDYmQKjsnPhw4LCLyaPrV/kxUlucCP2jCSqS4NeU3yh/tDKkIp0qzlUNK7EQ1rxVxpz5lVyR3s7rxqoSZ+ZJhDV4NsYkkaljiFWa0SoeCO0Surdnw1ARrKNDUtDaKkT9fZ75d/oiLEJpkGdPoOptfyPc44yZUYy0jY5zglhJnjCS+FPEOsGSblDaNpF1jxfnYBIERLmtaAPcPPYjNSd3c/fqajmn2WJxkoS/aLT7Fy1W9rF7+vH7Kj5pyvuIPrUvZ3GiDiM=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f19ae25-074e-4c8b-5eba-08dd65c0645e
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2025 01:58:35.0229
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Etkzzez5JPMqvfNH0w+BmCgGvPm8hmaqiPBKMNp+J07Zh76qdaPN6IqtZx/WGJ09CbcXwIaOON5Zo4PVnMFgqQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB7930
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-18_01,2025-03-17_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 phishscore=0 mlxscore=0
 adultscore=0 mlxlogscore=999 spamscore=0 malwarescore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2502280000
 definitions=main-2503180013
X-Proofpoint-GUID: Tv2PF-76r22fMVRDXm2MmY9fN4yUOStI
X-Proofpoint-ORIG-GUID: Tv2PF-76r22fMVRDXm2MmY9fN4yUOStI

Reviewed-by: Eugene Loh <eugene.loh@oracle.com>
Also...

One patch or another needs to update the dt_module.[c|h] copyright years.

On 1/14/25 23:21, Kris Van Hees wrote:
> Up until now, FBT probes were registered for every symbol that was
> listed as traceable.  Most tracing session do not use most or even

s/session/sessions/

> any of these, and the process of registering them all was quite
> slow.
>
> diff --git a/libdtrace/dt_module.c b/libdtrace/dt_module.c
> @@ -1044,6 +1045,83 @@ dt_kern_module_find_ctf(dtrace_hdl_t *dtp, dt_module_t *dmp)
>   	}
>   }
>   
> +#define PROBE_LIST		TRACEFS "available_filter_functions"
> +
> +/*
> + * Determine which kernel functions are traceable and mark them.
> + */
> +void
> +dt_modsym_mark_traceable(dtrace_hdl_t *dtp)
> +{
> +	FILE			*f;
> +	char			*buf = NULL;
> +	size_t			len = 0;
> +
> +	if (dt_symtab_traceable(dtp->dt_exec->dm_kernsyms))
> +		return;
> +
> +	f = fopen(PROBE_LIST, "r");
> +	if (f == NULL)
> +		return;
> +
> +	while (getline(&buf, &len, f) >= 0) {
> +		char			*p;
> +		dt_symbol_t		*sym = NULL;
> +
> +		/*
> +		 * Here buf is either "funcname\n" or "funcname [modname]\n".
> +		 * The last line may not have a linefeed.
> +		 */
> +		p = strchr(buf, '\n');
> +		if (p) {
> +			*p = '\0';
> +			if (p > buf && *(--p) == ']')
> +				*p = '\0';
> +		}
> +
> +		/*
> +		 * Now buf is either "funcname" or "funcname [modname".  If
> +		 * there is no module name provided, we will use the default.
> +		 */

Maybe that second sentence is now orphaned?

> +		p = strchr(buf, ' ');
> +		if (p) {
> +			*p++ = '\0';
> +			if (*p == '[')
> +				p++;
> +		}
> +
> diff --git a/libdtrace/dt_prov_fbt.c b/libdtrace/dt_prov_fbt.c
> @@ -81,79 +71,166 @@ static int populate(dtrace_hdl_t *dtp)
>   	if (prv == NULL)
>   		return -1;			/* errno already set */
>   
> -	f = fopen(PROBE_LIST, "r");
> -	if (f == NULL)
> +	return 0;
> +}
> +
> +/* Create a probe (if it does not exist yet). */
> +static int provide_probe(dtrace_hdl_t *dtp, const dtrace_probedesc_t *pdp)
> +{
> +	dt_provider_t	*prv = dt_provider_lookup(dtp, pdp->prv);
> +
> +	if (prv == NULL)
> +		return 0;
> +	if (dt_probe_lookup(dtp, pdp) != NULL)
>   		return 0;
> +	if (dt_tp_probe_insert(dtp, prv, pdp->prv, pdp->mod, pdp->fun, pdp->prb))
> +		return 1;
>   
> -	while (getline(&buf, &n, f) >= 0) {
> -		/*
> -		 * Here buf is either "funcname\n" or "funcname [modname]\n".
> -		 * The last line may not have a linefeed.
> -		 */
> -		p = strchr(buf, '\n');
> -		if (p) {
> -			*p = '\0';
> -			if (p > buf && *(--p) == ']')
> -				*p = '\0';
> +	return 0;
> +}
> +
> +/*
> + * Try to provide probes for the given probe description.  The caller ensures
> + * that the provider name in probe desxcription (if any) is a match for this

desxcription
description

> + * provider.  When this is called, we already know that this provider matches
> + * the provider component of the probe specification.
> + */
