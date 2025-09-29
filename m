Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5B9B2BAF9
	for <dtrace@lists.linux.dev>; Mon, 29 Sep 2025 20:53:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759179207; cv=fail; b=Imq18at0l8i41g/Rk/QucLqrbdGSciycQ3omeP6PufJIt9S+af7+erGXmDdHLEvyZEGCl9zhBlQPaB3soCQODijVTIbdlcpJxbc1AuaFfz//2Lus+axirjXcCztnRN5Jcu0xLW+Yw85DmaovAOmScC4H7LYUiAM1DopT6LQ4QI4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759179207; c=relaxed/simple;
	bh=hSlDCIeGWKWHXISUJc8krSnFH7iwaimo4x4Gcqa5IMY=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=IOx9ClTlbXWmqCT8ZLj7AzmzbK7W597cPMFKz24/N50izKHMfxtzRKLmzudaxxYnoRkg001FOYwbqec84MNmTCUMPK04OhB6Vs215IRf1T1Bl78+hS0n7ibyiSrjwqb698GfyQYS7ivsn2AKD54SACvseamWPsFAnIRAeAlGMUY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=R+G8bVqb; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=qp7DHCN/; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="R+G8bVqb";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="qp7DHCN/"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58TI4d7I006181
	for <dtrace@lists.linux.dev>; Mon, 29 Sep 2025 20:53:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=2wR1fFfH+k8Swr0Kvsi80x+PkCU+ez13HIEqsqPu0ok=; b=
	R+G8bVqbcbZRIkcWtWn2nQfMGEBiklpVH91p2xWEoaU9yLS9k5s2AJlWa8kcvmWp
	ke2bCqt2kKhOcfY4I6R6juRyfk12QDfSrS18fiMa2MXBlIbKgkVtMDsgKVeu2412
	2jnXMI3CUANLKWx19Bw0a+fYA6f1B7AM4Rbjn5OyAmL84Jl3ZMfDQ8OZTvraXtYh
	50s8bmTKvA51ncoE1FimSDSmDBkBaEIVga+ldCnQhUFJSp+f/xG90G1Mhgx8QlQC
	J4pDsUtH9T1nGP3f8THjZQ6jKHS36gdtayrMZG3W9JhBklO0EexQ7SYCo6JO/4l5
	geSbTFQAtKAoG+ObwqS4ag==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 49fy2p8atc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 29 Sep 2025 20:53:23 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 58TITRpQ007787
	for <dtrace@lists.linux.dev>; Mon, 29 Sep 2025 20:53:23 GMT
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11011027.outbound.protection.outlook.com [52.101.52.27])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 49e6c7xqcu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 29 Sep 2025 20:53:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JvM53XZcZODZ7k7E5cqywpUWsF9Z0A0hX6QH+aqnx7fkdBR08PzOzXXkcZ20JZO7rKDrK32IIFs6Gh83j8IJlD+JUdGlF7daGIBID5iKGFCfNzShsCDeNBqdiBJy9CP8Pi5ihzgGmelZO4EOoQmOSdtLqzFuhtKBqCSdGF07C450SBWh1agZ1NLVLWDB2Y9YkdgaICq7vAmFKx/i3X3VUb8W1ipQGJZ36esF4pdh56+CxuG4et7Yp38Ln55egN/u68FsYsm2lpCB+9mw52HSh0gWjq9F+YvM31R0IzNJ57RA3cbItB6F2jfXhSbtoJPuZSaxJw4wQQyOp/j68+XrWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2wR1fFfH+k8Swr0Kvsi80x+PkCU+ez13HIEqsqPu0ok=;
 b=d38fH9/6uHOr0wU5ysN9yBmH28VOycHQeEqRgyZ/MW/ZU4V7i/jxkiY2gxrdg1UNrsi7D/1EQw8sxQ1x/p+dPrH7ESA7N1a4zoIR93rYwoZ1cl8TXzfHuKWlFAHJWr+E58ZBI1Wch1petU9UMxAxnyekZheerCSyEt6QYlO1bgSxZeb/9A+PirnKTDLrKRZlll/66wwroAL49kwgQp4mbM7+a2wmYPSuJEZuK3YLmt50O6a7dkVJSuJSajoCiROuvQqKo+92fstVSBDZjDuqJDG4iwRoSYNSd1X3WvX8c0bgSE+gHityV3kKrvCGgnXHWogaibDmRyj219o/M2K8XQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2wR1fFfH+k8Swr0Kvsi80x+PkCU+ez13HIEqsqPu0ok=;
 b=qp7DHCN/y1ZJcEZmDAjNJcrqjgO9r7nJnBQZakZp6leS0wc/aGKS6GZv1Qq7QRoQnBKu5f6lLvQDjt32EfGEQRlykO65zf8M84eDa/9zo0oZ7QaX645tOqUt4c6QZfCEWMkUhVCk0kJFBuq2bqLf+H9pDF7I8Fi/sK5Y1VHRUJw=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by DS4PPFF257CDCED.namprd10.prod.outlook.com (2603:10b6:f:fc00::d58) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.13; Mon, 29 Sep
 2025 20:53:15 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b%6]) with mapi id 15.20.9160.015; Mon, 29 Sep 2025
 20:53:15 +0000
Message-ID: <2b5f708b-be82-6237-abdd-047e2634d0b8@oracle.com>
Date: Mon, 29 Sep 2025 16:53:13 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v2 1/2] Unify the handling of stack traces in the consumer
Content-Language: en-US
To: Kris Van Hees <kris.van.hees@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
References: <SJ0PR10MB5672F069BAF1EFCA418B0A91C21BA@SJ0PR10MB5672.namprd10.prod.outlook.com>
From: Eugene Loh <eugene.loh@oracle.com>
In-Reply-To: <SJ0PR10MB5672F069BAF1EFCA418B0A91C21BA@SJ0PR10MB5672.namprd10.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PH8PR21CA0004.namprd21.prod.outlook.com
 (2603:10b6:510:2ce::11) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|DS4PPFF257CDCED:EE_
X-MS-Office365-Filtering-Correlation-Id: f7f9956a-d801-4975-d2b9-08ddff9a35ff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?L0k4Um5RY0ZiYkttbE5OeDNJbHVRYVZIdDZFQnN4N0N5NmVhTGliWStZMWgw?=
 =?utf-8?B?dTFNczBaNitSa3hJNkNRNWRaUlp2YmwxRVYzcWp1R09oeEd1YmhTd0w1b09G?=
 =?utf-8?B?WXE4TGs4QVVlTmQ2by9JRkR0N09EcWxVYmJYUUF4WkFZYUw5czYyaGw2enlj?=
 =?utf-8?B?TlU1ZzNSc1ViUU9TVHJCTUNkUnRCWWQ4Yk9KRHFiYWlIbmpNUGFKYkF4bmcy?=
 =?utf-8?B?THJ1aEUzYkpYVFRuQmNhMHFMdGJDd1AwU0ZYeHp4b0tVa1JWdG5jcTluelo1?=
 =?utf-8?B?THJTbmRiSmx3ZzUvZDVCL0dueWIwdFlIQ3dnK2crZ1UxUlBLd0JLY3psclFn?=
 =?utf-8?B?TDJZMmZqRFV0NW1tM3BrR2l4YlRxYXJ4SlJvSmI4WER6R1BmQ1hBUDNaWTJZ?=
 =?utf-8?B?OUprcXc4OTJtdTRKSzNZT2lVbFFxTmtQVStPVmlFR0duWm4yLytEMTNVRkpr?=
 =?utf-8?B?VnhpTnh2a1BFbVhPRjNtbVl6OXNwdEZSOU41UEVZaWc1WWdRN0g3cWExMExQ?=
 =?utf-8?B?aGdWMkEwdmZVYTFsVUVkMy9nSEtkbG5yZmZuaG9HTFlWOTBsYzcyVC9qVmRp?=
 =?utf-8?B?ekNBZGxQT0VmV0tZRk5BUlIzRHZKQmR0QnRXUjJySS93WjM3bGJ4LzVCMjNl?=
 =?utf-8?B?MW91akRIWUZmM1R0eXF1d3RkdFcrWXFoVFRrVXlRTWFwc21aVldnQi8rdlZT?=
 =?utf-8?B?aWFQU3NraTI2V1BZVmRWSGx1MGYyRElxUlJaSitMU0tPa3VPdDhPQURzT044?=
 =?utf-8?B?UHlVL1dxUkQvVGg5MU5ueER3b1dHTVhvVElYd0ZmYlA1bEZUT3RwRGpBZFZn?=
 =?utf-8?B?N2ZUMHFNVHVlenlFZFN5eldGL3I5Vk1zejkvSUNxUVE3YjlvdWxSRTJWbDgw?=
 =?utf-8?B?RXJDbmNLMm5EdnRpV1MyNW5zZmM4RHJYVHlybVJHNER0ME5yUjBWWVRXVkx2?=
 =?utf-8?B?UGp5NnJCY0tGN2puQUFTQkZUaDNGNlRYMDB4YzN3bW54RnNDMCtnOEUrSTMr?=
 =?utf-8?B?OUF5dm42WG9yMk5qNmx2T2hyaGFrZkQwbEljRUN0NHdwQ2NheWFsY3haU1hU?=
 =?utf-8?B?Z2dIempESHBGY29DazZ6R2J0YmVDNmVOZnNYOXVLWjB1QVBRakYwakc1UHdM?=
 =?utf-8?B?ZUJNcXpDVXJxTktJRm1uWEdYb0dHOGdrd2V5MTc0OWY2N2hydm1ybE9wSkFp?=
 =?utf-8?B?NUx3S3RYeUdNUkJBNWxRM2I1VklJMjFiSnlXcG51RC9OeUVTQW5PaG15K1dq?=
 =?utf-8?B?YWwzTCtVWWtiKzY2TDNoUHpCeDV1emFRMWZqSUg5WUZNM3gzRHA2blpCR0o5?=
 =?utf-8?B?dmliSE1YR2xhcm1LYUlFSHVQS21McEx0bTA5dlJFT2F6MHV1SHVNK21neUF2?=
 =?utf-8?B?Vnl1Ym9FaU5MUTFCTi9EZHYxRVNJZElwbnhaVndBdWJ3dy9wcmdLMzY2d1pz?=
 =?utf-8?B?bkhKZUU5SS9tRi90ckxkWU5IbG5QQ2d1bFBGN3k2dHFKZktaejIxOE1FbnhO?=
 =?utf-8?B?QVRyT0phQnZsb3EzbkJPbU9CdUVnQzU0MFZpYjE3UVMwRzlTbi9RWFgyNit6?=
 =?utf-8?B?cGxaSjZVM2VxZWpCTzd0cGUya25DdUVDbHRTd0FHb3lXU3RmTnI2VWFqbnJ1?=
 =?utf-8?B?Z0I2YjlmaDF2WUFSNlJ2cVQzNHZ4d3lDRGEvM0pMNWtDWGZqQ1FJT3ZHWWwx?=
 =?utf-8?B?VGJyUE4zYzJHaFF5S0hFMFhhVEpDVHVFdTRvY0E2RWEydHI2Q3cxWnNQT2Ex?=
 =?utf-8?B?bGVhTGE3VU81dHJvRnQ5eFo3b3VPRjRVcUlkWUdWTkU4ZUZLQW44SVI1a0VS?=
 =?utf-8?B?WTJHM3IxaTJlTDZuQ2ppN1pRcGZ3U2RvZW03N285YitJeUIycCtLQnZGVzZt?=
 =?utf-8?B?dWNhQktrd3dDOTRwekV2MGJPY3pQdEovUit0RE12TytWdHc9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?elhlMXFkRmhScXlrVE5hV3hMSFRXRUlMVW5YTHhBNWdsdmRpY256V3NLOG92?=
 =?utf-8?B?RGI0SGJnck92MXJSZTRySHhva0FYemRQa2toY3NHWE1LYXBTVEY5OVRTell0?=
 =?utf-8?B?a2ZMbjNheU9xekVSenVycWx4SUVsQmlNdDB3RmFzbDlnNVNhMEx1K2FwUTdS?=
 =?utf-8?B?SGc3K0p1VWJlY2ZEZmtQS01DNDVWM2lZYXZKWmFHV3BoUStFSzRpZDdFZ3JT?=
 =?utf-8?B?NVVDRXJKeW95UXdkcGtZZnl3VGZMSTdFVFdwKzhIdTFsaGFpKzRXbk1yTDcy?=
 =?utf-8?B?bmN3SE5qVHNvV29YbUVSWW1lSVVUcmIwY1QyT05IemNKR3RkeEIxeWRhSHJI?=
 =?utf-8?B?L1RVd2ZJeDFWZDdkY1pLbHdyYmx4cWR6Z01lSWJJbUJSZ2wydmhKSDduSjVy?=
 =?utf-8?B?a3QrMEQ3eldHZHREWWpaWTlSeTlEV2d3cm1FMzlScHRoVlVTUW5hVjBDcUFS?=
 =?utf-8?B?MktVeTlxUmoybUJMSUlYaXNvWnRBbld0MEJHZ2RJR2lqWm43TmEwQUJkUDJB?=
 =?utf-8?B?M0cvbnFhMnpnMnZJUXBCZTVsNEVoT2JpTzc0RlgrK09LTnJBS250Y0FKdEpm?=
 =?utf-8?B?aXU3MUJOTzZNRk41djBRNWsrTkJHREw1TERtbkg3R0FqSExQU01Ja1hjNzZX?=
 =?utf-8?B?Q01LbkZoYkQ2Q0hBTTIrWDMrOVFYVVZlaS8wMm9GWkVvSEYwRHpYbW9wZ1ZS?=
 =?utf-8?B?b1hkQTNVbmJZNlltWm84Zjc3YmNWTEw2cFVmWWFseWIwOHUrQXJTM1RWRWNK?=
 =?utf-8?B?S2lNVkVNVlg2N0xscTkvejU5azJ6eDlnRG44SlgxRldncGNFR09MM2dqVHI2?=
 =?utf-8?B?SnBRWkx5bUlxT2tmZ0N4S3Vlbk90b1ZlY3lWajBjWi9DWEkyMWxLRHhlZWVK?=
 =?utf-8?B?UWZ5TlRqdFlPYWFiWGxYTXJkMzE4QnN1QWJ0WTlkSmg1cjA5bnA3d3FWOXh2?=
 =?utf-8?B?eXJhemRVWUZ3VGk5cUUyblRyREJnMVhDTWwxUVZYUStlaXI0amNzbTR5aEpU?=
 =?utf-8?B?eW4rK2JqZm9WcnNJT2ErcjZkK2VrbmRIbVhpME0rMExKTjhGbDhyZUdlckdh?=
 =?utf-8?B?M0NSNVdMWThMRjcxeVR5NElFUzh5WW1TY2Q4UUJkQVI5RFNFOHlnYmNhUlhl?=
 =?utf-8?B?ZFhFaHFDNUFOdENnaDRqVkhGeUUvSmFyQmxtNTdkRUx1Yys4cDdtenp0K0JR?=
 =?utf-8?B?bjFtRnNFZUxzUjdEYkhkdm4xR1NRdm16TmI2QTVHWTFIc3hNQ3MvMVZLcW01?=
 =?utf-8?B?OXpobTQxd3dSMThvU1ZpaTdMVXJ3ZFgzeW5hdVNkZ25LLzdaUCtpQTVGeTh0?=
 =?utf-8?B?QmlHOHV6OG52ODY0dmZrZ0dmWkZhZUJCRzkzS21IdXNBUC85YnViVDlGWFNR?=
 =?utf-8?B?SXc4ZjlHTjlwSEdvQUJrSjNPeE14dEJHTHVGTVppL1hBais1YlVpekRZdW80?=
 =?utf-8?B?UktLU1pHaVdZaGJISDc5Yzc0b3ZVTDZ3ekZQSVk1NTh1K05HZ1hxb3JDNUNU?=
 =?utf-8?B?U2JxcVh4SllVNVZ5Uk5EcHdLa0xiTjYrNVR4bE5rd2puOTdOVWNpUzhQc2pk?=
 =?utf-8?B?Q0k4dXRRKy9oU3NvWUtlZmRzbW55TWFQdVVHS1hmaGJXS3dkc25OMDBENFJW?=
 =?utf-8?B?bDRKazcrTzVUY1RJVEszNHR6MW53QVlEVWNWTjVPZ1BoaEEybU41NlhpYVFi?=
 =?utf-8?B?dkRJckt5aHFtQ1JLOXc0d2t2NlpZWTRqdDlWQmpGTlBZb29zVGhnZUFnTWIw?=
 =?utf-8?B?RTJOSVBOZVVsYUZrc2NudE14WDNXd04yRFZQRGkzVlh4S3paZWt3WDZnZnoz?=
 =?utf-8?B?Wm9LY2FBYVdjWnJMQTFmZmpBK1h4bXkyRVRSU2RGdmorUldDL2VoVTdpOEVB?=
 =?utf-8?B?c1YzamNMMkxRMEpWVmU2ZG1WUkpCR25TeE9aOGxudGRKakVkTk5BV09ZSHVa?=
 =?utf-8?B?MytCakQyK3lrcmFZbnBROFpmQWhrTTFXM3ViSFVrYjJidC9lWmNldUtnZHF5?=
 =?utf-8?B?ejBGWXEvWFMvT3FtNllNdjJPU2NKNjVXSEtROVRWZlEvQjNOZ1NyR1diUmEw?=
 =?utf-8?B?VGFmejFZRzh5YldmaUNrbUlBb1E3djIxRXEvSDNHTGxUWnpCY3k4QmNPN3NF?=
 =?utf-8?Q?KT4PxBH5BqOfrxrXfsd9FlOCI?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	KW5HBYl4B4Td3XLpYEagc+V/p3dZS8gDqj/YUWdruRq0g01b0yauQEEawtXgB8cHGRydi76BW42RkcZlH10zYowJ8iJNqmNRotRrM7ZTJ7Fmzg80Mj0zi0Zc3H2iNWTSHVjVkNtTl6OZ6HrYEKDF1zXuwQfVsFvfq+ET2s9VJfEL87Iifhil1DmppJ48KfcTNivyhzzFJBX0c0hqEc7Jxbs2SUiBoW76eMvks0ZxKJu1O4YyvPG2VaMJBnAMeYVmgMB8TP/m/B/DdjdPMIfvcKxzMlkNFdOIPLJDOt0wwzQAC67A49Ray0GPSqBfj9TRxDRGnpZzRFRQZCbpef49Y2rvAUTbO71sQZHtzKe+VYmfAOWyhvz0IMMOnHXvrZ5Y2pXYJbweqGy6m+00BmOwru4CC5IkZufOYDkk3W+kh/uxo3giq5zZsad0VszR9043Err/CI0p41U6yd+uZ8wNxu1WUvTQI9ZkzVLexHW+TYRKGvc9aZJeL6WM3KKnoKqUkPWpJgJXRBlWeSPksshNx3DQgwyskrzPqRKz8ozgUMOy8HGN0zB0wF3/t/FeG7JSXj8FWMG+xcoNzJnUUudmx2tUy61sJTnWriJPLR93OC4=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f7f9956a-d801-4975-d2b9-08ddff9a35ff
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2025 20:53:15.4154
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: piUAnUFi39whdG78B9NXrs8lmNMbZFaNlIZ6npOnbJ54Jnjf9R7EhlArgRhv/KdWlRrgGlhE6WFTFyDS1lAIkw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPFF257CDCED
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-29_06,2025-09-29_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 malwarescore=0
 mlxlogscore=999 mlxscore=0 phishscore=0 bulkscore=0 suspectscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2509150000 definitions=main-2509290194
X-Proofpoint-GUID: HK1NSPwXH5S1Dnhr_rM5_A0zQ1T55hdL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI5MDE2OCBTYWx0ZWRfX+jc71IBeXHJc
 K9M33+dPrGj3f019fJBKYmBO9k5qo7/nlzapKQEhedw1vMSbm/S9b+BRXAb094jaf+oXdxoWLET
 C1yLhjYXIquqS5B6mDBkvEXDt9W6BFgN9SdlU0uN7rA4aR5R7RwA4tPU4NYvz+eWpFSOFfuRagC
 brL+qTG1+B/GpLroe6t2WK47RhmVL5rFaVOKGZhZ2RqwP7ae+VqC9T5l+1K5wK6z9UN3+Dlz7OC
 HPg+tM2b3l7hK2aAqcZyb6fH1nSwfHe+SSefBCfTU+lsNcN9MZA8xUaD3fOgx/pWCjAsjs4TJ1Z
 zuNYOzLGv9nZIkI9DLkJrnfvEncUFkEhKjhsH3XwRWkgoamyvFnzMQ1JJZf12ofYCVv9+1eumUO
 mxXswdLcLijCHy7im/xwKeCBAgXa3g==
X-Authority-Analysis: v=2.4 cv=Z+Ph3XRA c=1 sm=1 tr=0 ts=68daf1c4 b=1 cx=c_pps
 a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=TTfZhms3z-kvY-M4JOsA:9
 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: HK1NSPwXH5S1Dnhr_rM5_A0zQ1T55hdL

Reviewed-by: Eugene Loh <eugene.loh@oracle.com>

On 9/29/25 15:47, Kris Van Hees wrote:
> Distinguishing between kernel stacks and userspace stacks was done
> based on the action id, even when used outside of action context
> (i.e. in aggregation keys).  That is far from ideal.
>
> Encode the stack type along with the nframes and strsize values in
> the  data record description argument for stack() and ustack()
> records.
>
> The macros for managing that argument are moved to dt_impl.h since
> they are internal to the DTrace implementation.
>
> All printing of stack traces is now consolidated in dt_printf.c as
> well.
>
> Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
> ---
>   include/dtrace/actions_defines.h |   5 -
>   libdtrace/dt_cg.c                |   6 +-
>   libdtrace/dt_consume.c           | 256 ++----------------------------
>   libdtrace/dt_impl.h              |  13 ++
>   libdtrace/dt_printf.c            | 263 ++++++++++++++++++++++++++++---
>   libdtrace/dt_printf.h            |  14 +-
>   6 files changed, 272 insertions(+), 285 deletions(-)
>
> diff --git a/include/dtrace/actions_defines.h b/include/dtrace/actions_defines.h
> index 1a9c1a81..7c2f7dda 100644
> --- a/include/dtrace/actions_defines.h
> +++ b/include/dtrace/actions_defines.h
> @@ -156,11 +156,6 @@
>   		(uint16_t)(((x) & DTRACE_LLQUANTIZE_FACTORMASK) >> \
>   			DTRACE_LLQUANTIZE_FACTORSHIFT)
>   
> -#define DTRACE_USTACK_NFRAMES(x)	(uint32_t)((x) & UINT32_MAX)
> -#define DTRACE_USTACK_STRSIZE(x)	(uint32_t)((x) >> 32)
> -#define DTRACE_USTACK_ARG(x, y)		\
> -		((((uint64_t)(y)) << 32) | ((x) & UINT32_MAX))
> -
>   #ifndef _LP64
>   # ifndef _LITTLE_ENDIAN
>   #  define DTRACE_PTR(type, name)	uint32_t name##pad; type *name
> diff --git a/libdtrace/dt_cg.c b/libdtrace/dt_cg.c
> index 6e70331f..51473667 100644
> --- a/libdtrace/dt_cg.c
> +++ b/libdtrace/dt_cg.c
> @@ -2701,7 +2701,7 @@ dt_cg_stack_arg(dtrace_hdl_t *dtp, dt_node_t *dnp, dtrace_actkind_t kind)
>   		strsize = arg1->dn_value;
>   	}
>   
> -	return DTRACE_USTACK_ARG(nframes, strsize);
> +	return DTRACE_STACK_ARG(kind == DTRACEACT_USTACK, nframes, strsize);
>   }
>   
>   /*
> @@ -2738,7 +2738,7 @@ dt_cg_act_stack_sub(dt_pcb_t *pcb, dt_node_t *dnp, int reg, int off, dtrace_actk
>   	/* Get sizing information from dnp->dn_arg. */
>   	arg = dt_cg_stack_arg(dtp, dnp, kind);
>   	prefsz = kind == DTRACEACT_USTACK ? sizeof(uint64_t) : 0;
> -	nframes = DTRACE_USTACK_NFRAMES(arg);
> +	nframes = DTRACE_STACK_NFRAMES(arg);
>   	stacksize = nframes * sizeof(uint64_t);
>   
>   	/* Handle alignment and reserve space in the output buffer. */
> @@ -8700,7 +8700,7 @@ dt_cg_agg(dt_pcb_t *pcb, dt_node_t *dnp, dt_irlist_t *dlp, dt_regset_t *drp)
>   				case DT_ACT_USTACK:
>   					arg = dt_cg_stack_arg(dtp, knp, DTRACEACT_USTACK);
>   					kind = DTRACEACT_USTACK;
> -					size = 8 + 8 * DTRACE_USTACK_NFRAMES(arg);
> +					size = 8 + 8 * DTRACE_STACK_NFRAMES(arg);
>   					break;
>   				case DT_ACT_JSTACK:
>   					kind = DTRACEACT_JSTACK;
> diff --git a/libdtrace/dt_consume.c b/libdtrace/dt_consume.c
> index 280ed42a..eca2139f 100644
> --- a/libdtrace/dt_consume.c
> +++ b/libdtrace/dt_consume.c
> @@ -1079,232 +1079,6 @@ dt_print_tracemem(dtrace_hdl_t *dtp, FILE *fp, const dtrace_recdesc_t *rec,
>   	return nconsumed;
>   }
>   
> -int
> -dt_print_stack(dtrace_hdl_t *dtp, FILE *fp, const char *format,
> -    caddr_t addr, int depth, int size)
> -{
> -	dtrace_syminfo_t dts;
> -	GElf_Sym sym;
> -	int i, indent;
> -	char c[PATH_MAX * 2];
> -	uint64_t pc;
> -
> -	if (dt_printf(dtp, fp, "\n") < 0)
> -		return -1;
> -
> -	if (format == NULL)
> -		format = "%s";
> -
> -	if (dtp->dt_options[DTRACEOPT_STACKINDENT] != DTRACEOPT_UNSET)
> -		indent = (int)dtp->dt_options[DTRACEOPT_STACKINDENT];
> -	else
> -		indent = _dtrace_stkindent;
> -
> -	for (i = 0; i < depth; i++) {
> -		switch (size) {
> -		case sizeof(uint32_t):
> -			/* LINTED - alignment */
> -			pc = *((uint32_t *)addr);
> -			break;
> -
> -		case sizeof(uint64_t):
> -			/* LINTED - alignment */
> -			pc = *((uint64_t *)addr);
> -			break;
> -
> -		default:
> -			return dt_set_errno(dtp, EDT_BADSTACKPC);
> -		}
> -
> -		if (pc == 0)
> -			break;
> -
> -		addr += size;
> -
> -		if (dt_printf(dtp, fp, "%*s", indent, "") < 0)
> -			return -1;
> -
> -		if (dtrace_lookup_by_addr(dtp, pc, &sym, &dts) == 0) {
> -			if (pc > sym.st_value)
> -				snprintf(c, sizeof(c), "%s`%s+0x%llx",
> -					 dts.object, dts.name,
> -					 (long long unsigned)pc - sym.st_value);
> -			else
> -				snprintf(c, sizeof(c), "%s`%s",
> -					 dts.object, dts.name);
> -		} else {
> -			/*
> -			 * We'll repeat the lookup, but this time we'll specify
> -			 * a NULL GElf_Sym -- indicating that we're only
> -			 * interested in the containing module.
> -			 */
> -			if (dtrace_lookup_by_addr(dtp, pc, NULL, &dts) == 0)
> -				snprintf(c, sizeof(c), "%s`0x%llx",
> -					 dts.object, (long long unsigned)pc);
> -			else
> -				snprintf(c, sizeof(c), "0x%llx",
> -				    (long long unsigned)pc);
> -		}
> -
> -		if (dt_printf(dtp, fp, format, c) < 0)
> -			return -1;
> -
> -		if (dt_printf(dtp, fp, "\n") < 0)
> -			return -1;
> -	}
> -
> -	return 0;
> -}
> -
> -int
> -dt_print_ustack(dtrace_hdl_t *dtp, FILE *fp, const char *format,
> -    caddr_t addr, uint64_t arg)
> -{
> -	/* LINTED - alignment */
> -	uint64_t *pc = ((uint64_t *)addr);
> -	uint32_t depth = DTRACE_USTACK_NFRAMES(arg);
> -	uint32_t strsize = DTRACE_USTACK_STRSIZE(arg);
> -	const char *strbase = addr + (depth + 1) * sizeof(uint64_t);
> -	const char *str = strsize ? strbase : NULL;
> -	int err = 0;
> -
> -	const char *name;
> -	char objname[PATH_MAX], c[PATH_MAX * 2];
> -	GElf_Sym sym;
> -	int i, indent;
> -	pid_t pid = -1, tgid;
> -
> -	if (depth == 0)
> -		return 0;
> -
> -	tgid = (pid_t)*pc++;
> -
> -	if (dt_printf(dtp, fp, "\n") < 0)
> -		return -1;
> -
> -	if (format == NULL)
> -		format = "%s";
> -
> -	if (dtp->dt_options[DTRACEOPT_STACKINDENT] != DTRACEOPT_UNSET)
> -		indent = (int)dtp->dt_options[DTRACEOPT_STACKINDENT];
> -	else
> -		indent = _dtrace_stkindent;
> -
> -	/*
> -	 * Ultimately, we need to add an entry point in the library vector for
> -	 * determining <symbol, offset> from <tgid, address>.  For now, if
> -	 * this is a vector open, we just print the raw address or string.
> -	 */
> -	if (dtp->dt_vector == NULL)
> -		pid = dt_proc_grab_lock(dtp, tgid, DTRACE_PROC_WAITING |
> -		    DTRACE_PROC_SHORTLIVED);
> -
> -	for (i = 0; i < depth && pc[i] != 0; i++) {
> -		const prmap_t *map;
> -
> -		if ((err = dt_printf(dtp, fp, "%*s", indent, "")) < 0)
> -			break;
> -		if (dtp->dt_options[DTRACEOPT_NORESOLVE] != DTRACEOPT_UNSET
> -		    && pid >= 0) {
> -			if (dt_Pobjname(dtp, pid, pc[i], objname,
> -			    sizeof(objname)) != NULL) {
> -				const prmap_t *pmap = NULL;
> -				uint64_t offset = pc[i];
> -
> -				pmap = dt_Paddr_to_map(dtp, pid, pc[i]);
> -
> -				if (pmap)
> -					offset = pc[i] - pmap->pr_vaddr;
> -
> -				snprintf(c, sizeof(c), "%s:0x%llx",
> -				    dt_basename(objname), (unsigned long long)offset);
> -
> -			} else
> -				snprintf(c, sizeof(c), "0x%llx",
> -				    (unsigned long long)pc[i]);
> -
> -		} else if (pid >= 0 && dt_Plookup_by_addr(dtp, pid, pc[i],
> -							  &name, &sym) == 0) {
> -			if (dt_Pobjname(dtp, pid, pc[i], objname,
> -					sizeof(objname)) != NULL) {
> -				if (pc[i] > sym.st_value)
> -					snprintf(c, sizeof(c), "%s`%s+0x%llx",
> -						 dt_basename(objname), name,
> -						 (unsigned long long)(pc[i] - sym.st_value));
> -				else
> -					snprintf(c, sizeof(c), "%s`%s",
> -						 dt_basename(objname), name);
> -			} else
> -				snprintf(c, sizeof(c), "0x%llx",
> -				    (unsigned long long)pc[i]);
> -			/* Allocated by Plookup_by_addr. */
> -			free((char *)name);
> -		} else if (str != NULL && str[0] != '\0' && str[0] != '@' &&
> -		    (pid >= 0 &&
> -			((map = dt_Paddr_to_map(dtp, pid, pc[i])) == NULL ||
> -			    (map->pr_mflags & MA_WRITE)))) {
> -			/*
> -			 * If the current string pointer in the string table
> -			 * does not point to an empty string _and_ the program
> -			 * counter falls in a writable region, we'll use the
> -			 * string from the string table instead of the raw
> -			 * address.  This last condition is necessary because
> -			 * some (broken) ustack helpers will return a string
> -			 * even for a program counter that they can't
> -			 * identify.  If we have a string for a program
> -			 * counter that falls in a segment that isn't
> -			 * writable, we assume that we have fallen into this
> -			 * case and we refuse to use the string.
> -			 */
> -			snprintf(c, sizeof(c), "%s", str);
> -		} else {
> -			if (pid >= 0 && dt_Pobjname(dtp, pid, pc[i], objname,
> -			    sizeof(objname)) != NULL)
> -				snprintf(c, sizeof(c), "%s`0x%llx",
> -				    dt_basename(objname), (unsigned long long)pc[i]);
> -			else
> -				snprintf(c, sizeof(c), "0x%llx",
> -				    (unsigned long long)pc[i]);
> -		}
> -
> -		if ((err = dt_printf(dtp, fp, format, c)) < 0)
> -			break;
> -
> -		if ((err = dt_printf(dtp, fp, "\n")) < 0)
> -			break;
> -
> -		if (str != NULL && str[0] == '@') {
> -			/*
> -			 * If the first character of the string is an "at" sign,
> -			 * then the string is inferred to be an annotation --
> -			 * and it is printed out beneath the frame and offset
> -			 * with brackets.
> -			 */
> -			if ((err = dt_printf(dtp, fp, "%*s", indent, "")) < 0)
> -				break;
> -
> -			snprintf(c, sizeof(c), "  [ %s ]", &str[1]);
> -
> -			if ((err = dt_printf(dtp, fp, format, c)) < 0)
> -				break;
> -
> -			if ((err = dt_printf(dtp, fp, "\n")) < 0)
> -				break;
> -		}
> -
> -		if (str != NULL) {
> -			str += strlen(str) + 1;
> -			if (str - strbase >= strsize)
> -				str = NULL;
> -		}
> -	}
> -
> -	if (pid >= 0)
> -		dt_proc_release_unlock(dtp, pid);
> -
> -	return err;
> -}
> -
>   static int
>   dt_print_usym(dtrace_hdl_t *dtp, FILE *fp, caddr_t addr, dtrace_actkind_t act)
>   {
> @@ -1355,7 +1129,7 @@ dt_print_umod(dtrace_hdl_t *dtp, FILE *fp, const char *format, caddr_t addr)
>   		format = "  %-50s";
>   
>   	/*
> -	 * See the comment in dt_print_ustack() for the rationale for
> +	 * See the comment in dt_print_stack_user() for the rationale for
>   	 * printing raw addresses in the vectored case.
>   	 */
>   	if (dtp->dt_vector == NULL)
> @@ -1660,12 +1434,15 @@ dt_print_datum(dtrace_hdl_t *dtp, FILE *fp, dtrace_recdesc_t *rec,
>   
>   	switch (act) {
>   	case DTRACEACT_STACK:
> -		return dt_print_stack(dtp, fp, NULL, addr, rec->dtrd_arg,
> -				      rec->dtrd_size / rec->dtrd_arg);
> +	case DTRACEACT_USTACK: {
> +		dtrace_probedata_t	pdat;
>   
> -	case DTRACEACT_USTACK:
> -	case DTRACEACT_JSTACK:
> -		return dt_print_ustack(dtp, fp, NULL, addr, rec->dtrd_arg);
> +		/* dt_print_stack() uses dtpda_data only */
> +		memset(&pdat, 0, sizeof(pdat));
> +		pdat.dtpda_data = addr;
> +
> +		return dt_print_stack(dtp, fp, NULL, &pdat, rec, 1, NULL, 0);
> +	}
>   
>   	case DTRACEACT_USYM:
>   	case DTRACEACT_UADDR:
> @@ -2467,14 +2244,6 @@ dt_consume_one_probe(dtrace_hdl_t *dtp, FILE *fp, char *data, uint32_t size,
>   			return dt_set_errno(dtp, EDT_BADRVAL);
>   
>   		switch (act) {
> -		case DTRACEACT_STACK: {
> -			int depth = rec->dtrd_arg;
> -
> -			if (dt_print_stack(dtp, fp, NULL, recdata,
> -					   depth, rec->dtrd_size / depth) < 0)
> -				return -1;
> -			continue;
> -		}
>   		case DTRACEACT_SYM:
>   			if (dt_print_sym(dtp, fp, NULL, recdata) < 0)
>   				return -1;
> @@ -2483,11 +2252,10 @@ dt_consume_one_probe(dtrace_hdl_t *dtp, FILE *fp, char *data, uint32_t size,
>   			if (dt_print_mod(dtp, fp, NULL, recdata) < 0)
>   				return -1;
>   			continue;
> +		case DTRACEACT_STACK:
>   		case DTRACEACT_USTACK:
> -			if (dt_print_ustack(dtp, fp, NULL,
> -					    recdata, rec->dtrd_arg) < 0)
> -				return -1;
> -			continue;
> +			func = dt_print_stack;
> +			break;
>   		case DTRACEACT_USYM:
>   		case DTRACEACT_UADDR:
>   			if (dt_print_usym(dtp, fp, recdata, act) < 0)
> diff --git a/libdtrace/dt_impl.h b/libdtrace/dt_impl.h
> index 7d8e4432..4dc4c9a7 100644
> --- a/libdtrace/dt_impl.h
> +++ b/libdtrace/dt_impl.h
> @@ -236,6 +236,19 @@ typedef struct dt_tstring {
>   	int		in_use;			/* In use (1) or not (0) */
>   } dt_tstring_t;
>   
> +/*
> + * The stack()/ustack() data record argument encodes:
> + *  - the stack type (kernel or userspace)
> + *  - the number of frames in the stack trace
> + *  - the size of the optional string area for ustack()
> + */
> +#define DTRACE_STACK_IS_USER(x)		((x) & (1 << 31))
> +#define DTRACE_STACK_NFRAMES(x)		(uint32_t)((x) & INT32_MAX)
> +#define DTRACE_STACK_STRSIZE(x)		(uint32_t)((x) >> 32)
> +#define DTRACE_STACK_ARG(t, x, y)	((((uint64_t)(y)) << 32) | \
> +					 ((t) ? (1UL << 31) : 0) | \
> +					 ((x) & INT32_MAX))
> +
>   typedef struct dt_dirpath {
>   	dt_list_t dir_list;		/* linked-list forward/back pointers */
>   	char *dir_path;			/* directory pathname */
> diff --git a/libdtrace/dt_printf.c b/libdtrace/dt_printf.c
> index 1e01d468..0d7c0bb4 100644
> --- a/libdtrace/dt_printf.c
> +++ b/libdtrace/dt_printf.c
> @@ -1,6 +1,6 @@
>   /*
>    * Oracle Linux DTrace.
> - * Copyright (c) 2009, 2024, Oracle and/or its affiliates. All rights reserved.
> + * Copyright (c) 2009, 2025, Oracle and/or its affiliates. All rights reserved.
>    * Licensed under the Universal Permissive License v 1.0 as shown at
>    * http://oss.oracle.com/licenses/upl.
>    */
> @@ -374,6 +374,200 @@ pfprint_uaddr(dtrace_hdl_t *dtp, FILE *fp, const char *format,
>   	return dt_printf(dtp, fp, format, s);
>   }
>   
> +static int
> +dt_print_stack_kernel(dtrace_hdl_t *dtp, FILE *fp, const char *format,
> +		      caddr_t addr, int indent, uint32_t depth)
> +{
> +	dtrace_syminfo_t dts;
> +	GElf_Sym sym;
> +	int i;
> +	char c[PATH_MAX * 2];
> +	uint64_t pc;
> +
> +	if (format == NULL)
> +		format = "%s";
> +
> +	for (i = 0; i < depth; i++) {
> +		pc = *((uint64_t *)addr);
> +		if (pc == 0)
> +			break;
> +
> +		addr += sizeof(pc);
> +
> +		if (dt_printf(dtp, fp, "%*s", indent, "") < 0)
> +			return -1;
> +
> +		if (dtrace_lookup_by_addr(dtp, pc, &sym, &dts) == 0) {
> +			if (pc > sym.st_value)
> +				snprintf(c, sizeof(c), "%s`%s+0x%llx",
> +					 dts.object, dts.name,
> +					 (long long unsigned)pc - sym.st_value);
> +			else
> +				snprintf(c, sizeof(c), "%s`%s",
> +					 dts.object, dts.name);
> +		} else {
> +			/*
> +			 * We'll repeat the lookup, but this time we'll specify
> +			 * a NULL GElf_Sym -- indicating that we're only
> +			 * interested in the containing module.
> +			 */
> +			if (dtrace_lookup_by_addr(dtp, pc, NULL, &dts) == 0)
> +				snprintf(c, sizeof(c), "%s`0x%llx",
> +					 dts.object, (long long unsigned)pc);
> +			else
> +				snprintf(c, sizeof(c), "0x%llx",
> +				    (long long unsigned)pc);
> +		}
> +
> +		if (dt_printf(dtp, fp, format, c) < 0)
> +			return -1;
> +
> +		if (dt_printf(dtp, fp, "\n") < 0)
> +			return -1;
> +	}
> +
> +	return 0;
> +}
> +
> +static int
> +dt_print_stack_user(dtrace_hdl_t *dtp, FILE *fp, const char *format,
> +		    caddr_t addr, int indent, uint32_t depth, uint32_t strsize)
> +{
> +	/* LINTED - alignment */
> +	uint64_t *pc = ((uint64_t *)addr);
> +	const char *strbase = addr + (depth + 1) * sizeof(uint64_t);
> +	const char *str = strsize ? strbase : NULL;
> +	int err = 0;
> +
> +	const char *name;
> +	char objname[PATH_MAX], c[PATH_MAX * 2];
> +	GElf_Sym sym;
> +	int i;
> +	pid_t pid = -1, tgid;
> +
> +	if (depth == 0)
> +		return 0;
> +
> +	tgid = (pid_t)*pc++;
> +
> +	if (format == NULL)
> +		format = "%s";
> +
> +	/*
> +	 * Ultimately, we need to add an entry point in the library vector for
> +	 * determining <symbol, offset> from <tgid, address>.  For now, if
> +	 * this is a vector open, we just print the raw address or string.
> +	 */
> +	if (dtp->dt_vector == NULL)
> +		pid = dt_proc_grab_lock(dtp, tgid, DTRACE_PROC_WAITING |
> +		    DTRACE_PROC_SHORTLIVED);
> +
> +	for (i = 0; i < depth && pc[i] != 0; i++) {
> +		const prmap_t *map;
> +
> +		if ((err = dt_printf(dtp, fp, "%*s", indent, "")) < 0)
> +			break;
> +		if (dtp->dt_options[DTRACEOPT_NORESOLVE] != DTRACEOPT_UNSET
> +		    && pid >= 0) {
> +			if (dt_Pobjname(dtp, pid, pc[i], objname,
> +			    sizeof(objname)) != NULL) {
> +				const prmap_t *pmap = NULL;
> +				uint64_t offset = pc[i];
> +
> +				pmap = dt_Paddr_to_map(dtp, pid, pc[i]);
> +
> +				if (pmap)
> +					offset = pc[i] - pmap->pr_vaddr;
> +
> +				snprintf(c, sizeof(c), "%s:0x%llx",
> +				    dt_basename(objname), (unsigned long long)offset);
> +
> +			} else
> +				snprintf(c, sizeof(c), "0x%llx",
> +				    (unsigned long long)pc[i]);
> +
> +		} else if (pid >= 0 && dt_Plookup_by_addr(dtp, pid, pc[i],
> +							  &name, &sym) == 0) {
> +			if (dt_Pobjname(dtp, pid, pc[i], objname,
> +					sizeof(objname)) != NULL) {
> +				if (pc[i] > sym.st_value)
> +					snprintf(c, sizeof(c), "%s`%s+0x%llx",
> +						 dt_basename(objname), name,
> +						 (unsigned long long)(pc[i] - sym.st_value));
> +				else
> +					snprintf(c, sizeof(c), "%s`%s",
> +						 dt_basename(objname), name);
> +			} else
> +				snprintf(c, sizeof(c), "0x%llx",
> +				    (unsigned long long)pc[i]);
> +			/* Allocated by Plookup_by_addr. */
> +			free((char *)name);
> +		} else if (str != NULL && str[0] != '\0' && str[0] != '@' &&
> +		    (pid >= 0 &&
> +			((map = dt_Paddr_to_map(dtp, pid, pc[i])) == NULL ||
> +			    (map->pr_mflags & MA_WRITE)))) {
> +			/*
> +			 * If the current string pointer in the string table
> +			 * does not point to an empty string _and_ the program
> +			 * counter falls in a writable region, we'll use the
> +			 * string from the string table instead of the raw
> +			 * address.  This last condition is necessary because
> +			 * some (broken) ustack helpers will return a string
> +			 * even for a program counter that they can't
> +			 * identify.  If we have a string for a program
> +			 * counter that falls in a segment that isn't
> +			 * writable, we assume that we have fallen into this
> +			 * case and we refuse to use the string.
> +			 */
> +			snprintf(c, sizeof(c), "%s", str);
> +		} else {
> +			if (pid >= 0 && dt_Pobjname(dtp, pid, pc[i], objname,
> +			    sizeof(objname)) != NULL)
> +				snprintf(c, sizeof(c), "%s`0x%llx",
> +				    dt_basename(objname), (unsigned long long)pc[i]);
> +			else
> +				snprintf(c, sizeof(c), "0x%llx",
> +				    (unsigned long long)pc[i]);
> +		}
> +
> +		if ((err = dt_printf(dtp, fp, format, c)) < 0)
> +			break;
> +
> +		if ((err = dt_printf(dtp, fp, "\n")) < 0)
> +			break;
> +
> +		if (str != NULL && str[0] == '@') {
> +			/*
> +			 * If the first character of the string is an "at" sign,
> +			 * then the string is inferred to be an annotation --
> +			 * and it is printed out beneath the frame and offset
> +			 * with brackets.
> +			 */
> +			if ((err = dt_printf(dtp, fp, "%*s", indent, "")) < 0)
> +				break;
> +
> +			snprintf(c, sizeof(c), "  [ %s ]", &str[1]);
> +
> +			if ((err = dt_printf(dtp, fp, format, c)) < 0)
> +				break;
> +
> +			if ((err = dt_printf(dtp, fp, "\n")) < 0)
> +				break;
> +		}
> +
> +		if (str != NULL) {
> +			str += strlen(str) + 1;
> +			if (str - strbase >= strsize)
> +				str = NULL;
> +		}
> +	}
> +
> +	if (pid >= 0)
> +		dt_proc_release_unlock(dtp, pid);
> +
> +	return err;
> +}
> +
>   /*ARGSUSED*/
>   static int
>   pfprint_stack(dtrace_hdl_t *dtp, FILE *fp, const char *format,
> @@ -381,19 +575,20 @@ pfprint_stack(dtrace_hdl_t *dtp, FILE *fp, const char *format,
>   	      uint64_t normal, uint64_t sig)
>   {
>   	int width;
> -	dtrace_optval_t saved = dtp->dt_options[DTRACEOPT_STACKINDENT];
>   	const dtrace_recdesc_t *rec = pfd->pfd_rec;
>   	caddr_t addr = (caddr_t)vaddr;
> +	uint32_t depth = DTRACE_STACK_NFRAMES(rec->dtrd_arg);
>   	int err = 0;
>   
> +	if (depth == 0)
> +		return 0;
> +
>   	/*
> -	 * We have stashed the value of the STACKINDENT option, and we will
> -	 * now override it for the purposes of formatting the stack.  If the
> -	 * field has been specified as left-aligned (i.e. (%-#), we set the
> -	 * indentation to be the width.  This is a slightly odd semantic, but
> -	 * it's useful functionality -- and it's slightly odd to begin with to
> -	 * be using a single format specifier to be formatting multiple lines
> -	 * of text...
> +	 * If the field has been specified as left-aligned (i.e. (%-#), we use
> +	 * the field width as indentation.  This is a slightly odd semantic
> +	 * but it's useful functionality -- and it's slightly odd to begin with
> +	 * to be using a single format specifier to be formatting multiple
> +	 * lines of text...
>   	 */
>   	if (pfd->pfd_dynwidth < 0) {
>   		assert(pfd->pfd_flags & DT_PFCONV_DYNWIDTH);
> @@ -404,24 +599,14 @@ pfprint_stack(dtrace_hdl_t *dtp, FILE *fp, const char *format,
>   		width = 0;
>   	}
>   
> -	dtp->dt_options[DTRACEOPT_STACKINDENT] = width;
> -
> -	switch (rec->dtrd_action) {
> -	case DTRACEACT_USTACK:
> -	case DTRACEACT_JSTACK:
> -		err = dt_print_ustack(dtp, fp, format, addr, rec->dtrd_arg);
> -		break;
> -
> -	case DTRACEACT_STACK:
> -		err = dt_print_stack(dtp, fp, format, addr, rec->dtrd_arg,
> -		    rec->dtrd_size / rec->dtrd_arg);
> -		break;
> -
> -	default:
> -		assert(0);
> -	}
> +	if (dt_printf(dtp, fp, "\n") < 0)
> +		return -1;
>   
> -	dtp->dt_options[DTRACEOPT_STACKINDENT] = saved;
> +	if (DTRACE_STACK_IS_USER(rec->dtrd_arg))
> +		err = dt_print_stack_user(dtp, fp, format, addr, width, depth,
> +					  DTRACE_STACK_STRSIZE(rec->dtrd_arg));
> +	else
> +		err = dt_print_stack_kernel(dtp, fp, format, addr, width, depth);
>   
>   	return err;
>   }
> @@ -2287,3 +2472,29 @@ dt_print_type(dtrace_hdl_t *dtp, FILE *fp, void *fmtdata,
>   
>   	return 2;
>   }
> +
> +int
> +dt_print_stack(dtrace_hdl_t *dtp, FILE *fp, void *fmtdata,
> +	       const dtrace_probedata_t *data, const dtrace_recdesc_t *recs,
> +	        uint_t nrecs, const void *buf, size_t len)
> +{
> +	const char	*format;
> +	dt_pfargd_t	pfd;
> +
> +	if (fmtdata == NULL)
> +		format = "%s";
> +	else
> +		format = ((dt_pfargv_t *)fmtdata)->pfv_format;
> +
> +	/* pfprint_stack() uses pfd_rec, pfd_flags, and pfd_width only */
> +	memset(&pfd, 0, sizeof(pfd));
> +	pfd.pfd_rec = recs;
> +	pfd.pfd_flags = DT_PFCONV_LEFT;
> +
> +	if (dtp->dt_options[DTRACEOPT_STACKINDENT] != DTRACEOPT_UNSET)
> +		pfd.pfd_width = (int)dtp->dt_options[DTRACEOPT_STACKINDENT];
> +	else
> +		pfd.pfd_width = _dtrace_stkindent;
> +
> +	return pfprint_stack(dtp, fp, format, &pfd, data->dtpda_data, 0, 0, 0);
> +}
> diff --git a/libdtrace/dt_printf.h b/libdtrace/dt_printf.h
> index f08e48eb..1ebdd8aa 100644
> --- a/libdtrace/dt_printf.h
> +++ b/libdtrace/dt_printf.h
> @@ -1,6 +1,6 @@
>   /*
>    * Oracle Linux DTrace.
> - * Copyright (c) 2005, 2024, Oracle and/or its affiliates. All rights reserved.
> + * Copyright (c) 2005, 2025, Oracle and/or its affiliates. All rights reserved.
>    * Licensed under the Universal Permissive License v 1.0 as shown at
>    * http://oss.oracle.com/licenses/upl.
>    */
> @@ -102,16 +102,16 @@ extern void dt_printf_validate(dt_pfargv_t *, uint_t,
>   
>   extern void dt_printa_validate(struct dt_node *, struct dt_node *);
>   
> -extern int dt_print_stack(dtrace_hdl_t *, FILE *,
> -    const char *, caddr_t, int, int);
> -extern int dt_print_ustack(dtrace_hdl_t *, FILE *,
> -    const char *, caddr_t, uint64_t);
>   extern int dt_print_mod(dtrace_hdl_t *, FILE *, const char *, caddr_t);
>   extern int dt_print_umod(dtrace_hdl_t *, FILE *, const char *, caddr_t);
>   extern int dt_print_type(dtrace_hdl_t *dtp, FILE *fp, void *fmtdata,
>   			 const dtrace_probedata_t *data,
> -			 const dtrace_recdesc_t *recs,
> -			 uint_t nrecs, const void *buf, size_t len);
> +			 const dtrace_recdesc_t *recs, uint_t nrecs,
> +			 const void *buf, size_t len);
> +extern int dt_print_stack(dtrace_hdl_t *dtp, FILE *fp, void *fmtdata,
> +			  const dtrace_probedata_t *data,
> +			  const dtrace_recdesc_t *recs, uint_t nrecs,
> +			  const void *buf, size_t len);
>   
>   #ifdef	__cplusplus
>   }
