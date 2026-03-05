Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F9EE2ECD32
	for <dtrace@lists.linux.dev>; Thu,  5 Mar 2026 11:00:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772708447; cv=fail; b=MA0TIzC7OS/HwKRyPTmVvVycVT9+HguXsV87LM6Yl/oBQNSUPPqpyGpYu8fGAGTWxUBlfptEvluYvsb31hFTfb7MlIwjhYPmXgh9A4m4E90I6s7qtfdGhGeuq2x1jmk/RABxFNrbYFCTQ5zxsec9nACffMzxW8DEkw/bYZCKwVA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772708447; c=relaxed/simple;
	bh=aX/rna+XiS/d4QiNF7syur7zVvOnlFxpWdpLt1qmr78=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=WEauK7NzKH5C0CzuTxQFaYDw+eqdz6q4zPNG6w3Em2Vgp8wJ5vT1H6o9QGLl2ydSs3prxHmf4d0F8qhJ6xDhIN91chQu6zknEegog0+FLUKRNXU1Kdy+SJDT7YfPl0qw2GMm16PiYE6qWUoVd3ypIbc+xNL6g0zIkbJHSpYoReQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=pCw30sAo; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=F7Wid/gV; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="pCw30sAo";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="F7Wid/gV"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 625ALsMG615825
	for <dtrace@lists.linux.dev>; Thu, 5 Mar 2026 11:00:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=7+lc5MAZoqwmzkBxFkafVTCtjuefsPGAjAyYOCoUY4o=; b=
	pCw30sAobLqaF5WR77DS3SiX5E1ME0rHMV85irVzv9jozHDfI+FAAx/hXtE2oKnG
	LFRXcJccDswUE2OhSU8DhAC4E+TJYZh/0I9c5bhj6HWSE5Ssks1cC44zVeHioIFl
	pZi0VUj65QXCHOAHH92UFWxq4bIsTG7WvAcVsiPMfTn8g0hmDJn7xLmMYoynEg2B
	CC2kXiqvhoQ9wYHEEsphN+lvIne8PijVSxBp78JgIyr+XMfQwdi0e5VQdJaFZmA3
	zxlzQQxbjPIThxO4/z30HtG1WUxo6b30aTai8AoeDfYTFl18lDu/8hnOtORTWWpR
	9dmOm6sbBLELO5s82nLp7g==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4cq80v81e3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 05 Mar 2026 11:00:43 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 6259VL1W001439
	for <dtrace@lists.linux.dev>; Thu, 5 Mar 2026 11:00:42 GMT
Received: from ph0pr06cu001.outbound.protection.outlook.com (mail-westus3azon11011016.outbound.protection.outlook.com [40.107.208.16])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4ckpthds8p-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 05 Mar 2026 11:00:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OkdCqjxw7yxxCCEHvsrUrxuNFI7p2Rn4S185jg1J565lLexsmBxdCHn+pmc1JI73aBuDUQSfGnC5C9IsfhBxQX2Ry1WyFtTeO3JdPdi3TZlqOOr2e0Msr8hai6Sk4A/WDBtKg5tYFrHWoQczjV+CU4w4WDfylUyKp1CYS6J46kNgW0hlmbaU5nyX7pUKLOyZSrwnOnt/Lw/jhIm3Mg5Wy+6wv9VMJGVwzzEOHZtqnlYQwsnCF1n/oMPe9YKC0Z6b7hCtvjVwDwdlX/sCZ4dtpjh7Vup4yUy0jQHMmKFZAS83vGI2TNn9nAr30zYGNYVBoHc8jqNeoAppMICt3KHSIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7+lc5MAZoqwmzkBxFkafVTCtjuefsPGAjAyYOCoUY4o=;
 b=mb/sMvpjyk7zMDvAmTv1LVg9VpQz0YwiZaQs6BENGrl3lvtByMjSbvGYXszCBZOdQ+C3uKduqg+rotVUtNJdSsPGPFdRsdVPSuovVOV1J8ZxBf8QRzU54JG0rvrHgn+5zVekHwlvN6qMtUbWfmjH3gfFL6p8liWcUl35J2jiOZCsoBmgSuaLVw2AehQrqyBoWjKlsPjNm2uWCGy91czC7W5GIpUS9NHz+8UlUvT7Xe744dyvO4TajzdSG1//OKb0XQsKy5FYRiudJw+cQiwfNRJj3HGdhNPSFRd/6DeAQQIgJ23JKmHfIuTqnxP9KlUPvpLgI75YmtyAxp9AfLiJcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7+lc5MAZoqwmzkBxFkafVTCtjuefsPGAjAyYOCoUY4o=;
 b=F7Wid/gVFdMetfYuOuYy0VS3IBFXfRxbfx5u6LqnP9/ZgNREvIqwxxSKNbZpCwGJ9og20f3SFKGyDm2ZfdSS2wHY0Ev2qAYnlCs30Dd4L9+acg5ug2WEMVuXDOFtZCCY3/JhuQXwhEvSvjUxfgk4AvWJUJHe3Pfj7WJ+ETWCAnU=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by SN4PR10MB5799.namprd10.prod.outlook.com (2603:10b6:806:208::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.17; Thu, 5 Mar
 2026 11:00:37 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b%4]) with mapi id 15.20.9678.016; Thu, 5 Mar 2026
 11:00:37 +0000
Message-ID: <fb2e6ae6-8382-3dad-4da5-1f77ebac7f1c@oracle.com>
Date: Thu, 5 Mar 2026 06:00:35 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [DTrace-devel] [PATCH v2] sparc: remove architecture support
Content-Language: en-US
To: Kris Van Hees <kris.van.hees@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
References: <DS0PR10MB752247D5B7EEE9ED7D223109C27DA@DS0PR10MB7522.namprd10.prod.outlook.com>
From: Eugene Loh <eugene.loh@oracle.com>
In-Reply-To: <DS0PR10MB752247D5B7EEE9ED7D223109C27DA@DS0PR10MB7522.namprd10.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BY3PR10CA0028.namprd10.prod.outlook.com
 (2603:10b6:a03:255::33) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|SN4PR10MB5799:EE_
X-MS-Office365-Filtering-Correlation-Id: 21bbb065-2a86-4d86-0c41-08de7aa66e8a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|13003099007;
X-Microsoft-Antispam-Message-Info:
	ZQbGZEjIdjGdRnQk0QYBHI1fITD+4IsupjduYTQl5n4yxwOi7fE5HxC+euv5uXdG2oxwz1tRouTqAnu3xE005LU8Pov2Mv0lg+f8ek084cUQqzJNa7HiQmz5IxI9GKQveZXP0dn8adj250XLmVR4EAmfdS+CUAKv0KtFdLEb44s2bICirrg+RhOSVKOqoAEAVwx2C5EynJW5ue5pSbhQYGHnZt/SIlrCjr1otyKdOQFw0cKkvTflsGKQIQFNoG6c0+U6cIjzH9UTjmUQqkcLe5RbwmNQBOLMeSs6jeYM8vrebO8bYx258Bx4vwEPK0xSfsgfC5XlDttXXwqHnS8TsRT3C2Ca2RemnF7+gwxuNyO/rTVrDZd57DtmTASfvju7Ls2xFrbw3z5HGc1Bvrj7U4ZN++pUFv5L/ZSqCpuk+HDIN9w9/TBfXDBNXKUsocOQ29i9ptUaWtQEV6PDkOpl4suCRoLIHWOe23xhmVqByRupBFZ/M7aHj3FgDy0lEXrupTAQnvBlmSOuYYR1QJrNcPgH3FirplL1FVoMRtzeZBiguqCWVzTFfxM3nM7EnKtMtGJHzKbD/I9PlC6jRjXH+SNYhNfwfBJBacpeBAp5WDB9XSW51w8CpMqTpbIcVVEbLhfwiFZV2OUvAnKuBofdLc+SQCI42wjW8KdxsteKSlpfwB+IjT6Z1L56axnUuMBZYjgVKp+q7BAMd890lsYQCXTB6tfdfYuv205PrjZqp8IELfaabaaIu8vEvm4dMhJ1
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MW9SdVVsdzk2UXlpVnc1Uml0aDYydGdUVmVsUUh1c3VnK0Q5b0sraHVUMVo5?=
 =?utf-8?B?cnFZYmNlWmNkY20yU2FtWjJvYU1DRGVEc1BLZWphWFhTUThuaFRTd0dBUHpN?=
 =?utf-8?B?NEFIVGhvWkd3ZENnSmt1Mk5PeFRudDFpTjVXMVl1dGNYZWRmWVMyNWFyOVo4?=
 =?utf-8?B?Z01WQjhxT2FmbG9UcDUxVDFFcUZlMkxjVW0wemh5RWQ4MG5tTjVCOXAzak9p?=
 =?utf-8?B?TFNIbS9UMEFCSkYxNVhEZnJPdnVVMzRUZTJXMnlXM0diako0WGtvMGVnbGJ2?=
 =?utf-8?B?aE1LaGhXZGxBeER2N0F4dHpCdDQ4RldLNjNQQ2twajhDVnpyMHpOUml0dVR6?=
 =?utf-8?B?QzIrWHgzbjlYSkV3czNuUE1pekVFQ254YWdFcnZpMC9hMzNSSnUzL3dhbjFJ?=
 =?utf-8?B?aUZrekljR3ZKdC84TkNITlNQQS9qWGtjYTdjK0M3VFdJSGtIY3FVTUdCM1d0?=
 =?utf-8?B?YmdHTGpEblZoOGxiMXU5SHAvdENJYVBieXNVZ1UvSWJCai9OMEYzT0Nxb25H?=
 =?utf-8?B?SFVkTzZjVkFHeCtQWjUvcVNsamRLRURYd1c3bnp4TWdrVkUrQ3RrT3JBZ1Rl?=
 =?utf-8?B?NGJzYk5CS2ZGb2FnZW9pOW8xVGUvOEZLQ0hBaUM5Z2RqUG1tRElFRFdHNHdB?=
 =?utf-8?B?TnF6UmNobjB6bitjSk83OEh0VW5CaFZ6OUJoNGxZdm9NR1FSNlAvUC9mQXJz?=
 =?utf-8?B?bktzS1ltWENsS042SVhXOHJsb3lXVGhBK01LWmZscnNKN05KTHlsZ2tiTGpM?=
 =?utf-8?B?M1B2c2RpVTB0QmYvY0xWNHFnYnZuT2lEZDQrdjNuaGhhWEZvUWV5cDgvVkI2?=
 =?utf-8?B?d252dGZGdXUyM2toN3VjWHRKa1Q3TTM5MEFTMkJ1dXErYkdmQUxHTnFMcVE1?=
 =?utf-8?B?a2k3Si84cDZ2ZVpabC8vSUNMZFRkWWtkWmIyMXM3TmdFaUJTZE1KVGRkSUgv?=
 =?utf-8?B?RzhJbWl1RVdNMWNFWU40L3hxUTd6TjVrRlZQd3ZMVlRGSkhtei92MWJZbUdi?=
 =?utf-8?B?Lzc3cTE0bml3aHpYNEtqbDdEUWhEQnBxYmxBOXNUcDU3eXdmMmVRcmE4eVRk?=
 =?utf-8?B?Z21LMFpqaVRESlNJbFRheFdqclQ4N295NlovUU82R2x5NGI1OG9PWjhSaE03?=
 =?utf-8?B?bnk1TTVIRjIvcUpLZEYwbWhOZ1VQeVBhbEhPWkUyc3NDTytuOE5JSXkweno5?=
 =?utf-8?B?S3l3cG1OV2UzSkdxZklqZ2NTZkgzaGtBaEZvdjBMQWdWZ3VtYy82MU1XRkI3?=
 =?utf-8?B?V0dhNkF3UGhSRXY0d3cxT0FZNFplaWdxSnhiS2hieHgvaW1zTFVKYXV2amlp?=
 =?utf-8?B?SmNuaW9WclBMS0JiNjZrTUE4bzdyV0ZhWlB2ekJyMGRyMmlzekJoaDRjdm5x?=
 =?utf-8?B?UEE4bnBLaXdKSGo4cXFtTFk5TWltMzlnVGh3eFFXMVFRMTlpSXNXVi95SVEy?=
 =?utf-8?B?ZlIwQ3NUcXZoMlRlRVg0UDkwMU5sd1RYZ21XT3AvU0N0cUtPUi9QelhvOXNo?=
 =?utf-8?B?c2o3VkUrS1orVFZUdzlOamJiS3c2cFQ2VjRBaTR6WERPa3ZTQXN3ZjR2Tld0?=
 =?utf-8?B?VVdBY2tXQ0tEcjh5cmZpM3NJdWdabEpsaXpyMldOdzluQlpRNWt0VjJyYm1R?=
 =?utf-8?B?L1pvMlphM0ZOaXNzT1lFQitQZ2xoVXNPdm83Zm1GVGFGL0Y3Q1FMZ21pZVZD?=
 =?utf-8?B?aHhxK2xPVnI1V0JHMUtvaG94WUp2Mk9kN3V4Y0NDNlJsMm5KLy9uczVGYzN4?=
 =?utf-8?B?OThtc0ZYbVNqM1FRRjAvQUZqMmVoUmVicGR6a1NScWdLUkxmaTJvZTZzRzg3?=
 =?utf-8?B?QU5hcTlGZHNrby83aU9wYVJSSG51QmlQSU1jN3FsOWxBMkxHeE1TR2R5TUI0?=
 =?utf-8?B?Nk1HM2hpNkorSzQ2eWhEbi9RcCtFeElBd2puMWlESjB6WG1sMU1IUnhINGli?=
 =?utf-8?B?UzI0bWV1QkI5Z0E1R1ZCb2xJa0ZNdHo4ZUc3dHY1bXpPS1BvL1VoUEJWd0Nj?=
 =?utf-8?B?MUFDMG1OOTJUbFdVeGY3Tk9WY01JeTlZdS9tVklhREg2Y3MvS2RzQjcyM1pU?=
 =?utf-8?B?Ni9LVVhmcU1oMGJGVWc0Y2tMMkl5R2trWUNnRndtY0tRNURLSThYTzkzMmE4?=
 =?utf-8?B?Mk80TXF0UjNDMHo3b2tvK2VpditVdkdiUWcxQkxLZStBUnltSlZtdmRtd1F3?=
 =?utf-8?B?Ly8zdlh3R1JrL2U5d0F3bDliU05xODI3MHlqVWtYV0pXZDJFOFhMRjc3ZGFH?=
 =?utf-8?B?OHB3QnpIZml6emhvYitVR3I2U3FrdkpaLzI4V0JEMy9BdldiTzRwOWRQTHYz?=
 =?utf-8?B?Ump4SkVzVXUyeVhSOXNyTzNtMkxKY0dyNDJtaldOVXhmRGE1bW5CZz09?=
X-Exchange-RoutingPolicyChecked:
	bBMhpefQDIwzb40JroCf4NfLaUWwPpEgPMW9Iqix7qgxSpzXi41bEZLP2ELyFTWcP4YZJIOCJ8Ud4E03N3Y50pgAkvHHzF7RfOi1zltzuQrCcJF3veMQXvICuYdrgLWKrvDOM7vnrLsX3yAC0jnnvnWhFxoe/j3qj3MQtlZYHL+lm1DjawqlG0Oc+uQ+phmEH2ykUujF9eC167wTkTWZoNxDLVKP8y606RL0u6mVfPrE5LX8sCO4w3OJeD4+8L1+cTTmhxycNyWGUMTvCqGGyK1yHUBeVxHvakzq5nOpNNTgkvLBcgAp2bkW0qkdnsrKWJLg7tnhmRcGCmzfPgZJKg==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	SNWIfBuvuaHRMJM3cCl835yYh4o+ljWqtJGNJ8nVmJ2RHtetPXqddSNTqUceMA0EQu3wwTYnfavjlZmewgIRw6LtGvhgUVWokkc2t9Lt1+KrdpjMpDbIo+XFXlaVbTDCwkt0x6QAM9iLr0dYgWEDEY5RxtGtbqA/Js43ZTq/UmLStOoct9T9bMAIm9VE3w0ydBspRYmL+uX2WYza8Me4bJsz7ZgtLbrT9KYehpm8sjjLKjV4OsraJzcdrv4QxSCa5M1dB3s4Qw5UyBbCFYoeOOFLAdkCvkI4wJyFQhKS57Bhskv/gyZtU1uOgxE7LbRCDQgT3G17AjkGVw/LUnRarv8uVqtRlmbAYNWB+1UcZi4s4X6ddSm6psy75Ny3xrtSkfXvrWBhwBWRgi1QcjcBcWDmPmHsS2P8LkAb/yNXPdQgJ8YnGptZwS5Pcg9/wFPpKahmf3zY8bNb5vnWUZu8MikkzU3eJ7qQuPb9p5thS5XzA9dMXbvIV96p8LxtVTMyWoDeEb1yuvtHFyc+1RnIscNg2u7A6vKny7A0/ghM/SF7R5XsOicdYsEM14Gtc5VTYx6mrS31o+xNk22uW+FqRNWoiKmQnXXz17Bp2fYUmS4=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 21bbb065-2a86-4d86-0c41-08de7aa66e8a
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2026 11:00:37.3018
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q2sHNYjZiURo+dNN2nuNfq+ADRgAbAkDMRogafuMC2+SZp4T99ieQhq0Q0PY+ViTnccLZ5Cwgw+wGCp0SQTRmQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN4PR10MB5799
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-05_02,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 malwarescore=0 phishscore=0
 spamscore=0 mlxscore=0 mlxlogscore=999 suspectscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2602130000
 definitions=main-2603050088
X-Authority-Analysis: v=2.4 cv=JbmxbEKV c=1 sm=1 tr=0 ts=69a9625b b=1 cx=c_pps
 a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=jiCTI4zE5U7BLdzWsZGv:22 a=x0eKOSpe3m1H3M0S9YoZ:22 a=yPCof4ZbAAAA:8
 a=1q3a_HAzSocSYglzoxcA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 cc=ntf
 awl=host:13812
X-Proofpoint-ORIG-GUID: ZM64P_czA4OoFuGhpJitGoCiPTOqbv63
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA1MDA4OCBTYWx0ZWRfX8H08ec7dd69z
 QZYMV3OmNP/S08eHTCbor0yb8MwJ/nVQiRMF0MSwqqoonz624QbtrcRZdht0xFlsXyKAl+H5o0P
 Yw8A1ikdqJdrL1KHISmsPoSi09ZD5L5CwMgP9Oed6Bi0TYqrLf9SGUzIADGl63o6IH4dydfaF2G
 XPJ5NiLhLCGQQzqYZpgO7w3ISROohGWN/IHr34xfynfGoXxFmTiCINN3ppp5U00lEn/mLWmlzqf
 8M1ltvZrE6zserwE6A0oOZq9PllvDa2ruV3AcCQs8TomqfMi00b9xtblF+H+1n5pEDgJ62hVELx
 nLbIUYp+Zoc6SKGNkVCpCVnNpOyLyejpZKiudezqPVRil9SX/w8cEK6QMXOCdogBO6KdPqlQZNA
 D2pJInEMSC+Fh3xaZsm4jC7LGDX0b6K4TBLvCs/t1j26/NFJxn8ZJRIhFDRnF1+X73MCJ6hG5OZ
 bvPRSAzpAfjdgolAu1WUSYYea2lh785nqu9nhruQ=
X-Proofpoint-GUID: ZM64P_czA4OoFuGhpJitGoCiPTOqbv63

Reviewed-by: Eugene Loh <eugene.loh@oracle.com>

Two tiny comments that do not warrant holding up the patch:

1)  in dt_link.c, the code is now

     #if defined(__i386) || defined(__amd64)
              emu = " -m elf_i386";
     #endif

Does the absence of an "#else" clause mean that emu will be undefined 
for some builds?  Well, no, due to other constraints. So, would it be 
clearer to remove the "#if / #endif" altogether? I don't know.  
Presumably this is not a correctness issue but a clarity issue.

2)  the procfs.d.in M4 is so compact now

     (m4_kver(4,9,0), m4_dnl
      [[T->cpu]])

that it might look better on a single line:

     (m4_kver(4,9,0), [[T->cpu]])

On 3/5/26 00:01, Kris Van Hees via DTrace-devel wrote:
> Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
> ---
>   COMMANDLINE-OPTIONS                           |   6 +-
>   GNUmakefile                                   |  10 +-
>   include/sparc/platform.h                      |  32 -----
>   libdtrace/dt_link.c                           |   4 +-
>   libdtrace/dt_open.c                           |  16 +--
>   libdtrace/procfs.d.in                         |   4 +-
>   libdtrace/sparc/regs.d                        |  99 -------------
>   libproc/sparc/isadep.c                        | 133 ------------------
>   libproc/sparc/isadep.h                        |  81 -----------
>   test/stress/fbtsafety/tst.vahole.d            |  50 -------
>   test/unittest/aggs/tst.neglquant.d            |  10 +-
>   test/unittest/arrays/tst.uregsarray.sparc64.d |  69 ---------
>   test/unittest/arrays/tst.uregsarray.sparc64.x |   4 -
>   test/unittest/pid/test.sparc64.options        |   1 -
>   test/unittest/usdt/tst.enabled2.sh            |   2 +-
>   15 files changed, 16 insertions(+), 505 deletions(-)
>   delete mode 100644 include/sparc/platform.h
>   delete mode 100644 libdtrace/sparc/regs.d
>   delete mode 100644 libproc/sparc/isadep.c
>   delete mode 100644 libproc/sparc/isadep.h
>   delete mode 100755 test/stress/fbtsafety/tst.vahole.d
>   delete mode 100644 test/unittest/arrays/tst.uregsarray.sparc64.d
>   delete mode 100755 test/unittest/arrays/tst.uregsarray.sparc64.x
>   delete mode 100644 test/unittest/pid/test.sparc64.options
>
> diff --git a/COMMANDLINE-OPTIONS b/COMMANDLINE-OPTIONS
> index 73be89b1..67be7447 100644
> --- a/COMMANDLINE-OPTIONS
> +++ b/COMMANDLINE-OPTIONS
> @@ -3,8 +3,8 @@ DTRACE OPTIONS
>   
>   This file lists the dtrace commandline options, and indicates whether
>   or not they have been made to work on Linux and roughly when.  All options
> -are believed to work equally well on all supported architectures (x86 and
> -SPARC).
> +are believed to work equally well on all supported architectures (x86_64 and
> +ARM64).
>   
>   Notations:
>   
> @@ -317,8 +317,6 @@ definitions are always specified and valid in all modes:
>       * __linux
>       * __unix
>       * __SVR4
> -    * __sparc (on SPARC® systems only)
> -    * __sparcv9 (on SPARC® systems only when 64–bit programs are compiled)
>       * __i386 (on x86 systems only when 32–bit programs are compiled)
>       * __amd64 (on x86 systems only when 64–bit programs are compiled)
>       * __`uname -s` (for example, __Linux)
> diff --git a/GNUmakefile b/GNUmakefile
> index 835bc9b5..10530f3c 100644
> --- a/GNUmakefile
> +++ b/GNUmakefile
> @@ -20,8 +20,8 @@ VERSION := $(shell ./libdtrace/mkvers -vcurrent=t libdtrace/versions.list)
>   
>   ARCH := $(shell uname -m)
>   
> -$(if $(subst sparc64,,$(subst aarch64,,$(subst x86_64,,$(ARCH)))), \
> -    $(error "Error: DTrace for Linux only supports x86_64, ARM64 and sparc64"),)
> +$(if $(subst aarch64,,$(subst x86_64,,$(ARCH))), \
> +    $(error "Error: DTrace for Linux currently only supports x86_64 and ARM64"),)
>   $(if $(subst Linux,,$(shell uname -s)), \
>       $(error "Error: DTrace only supports Linux"),)
>   
> @@ -74,7 +74,7 @@ ifdef KERNELSRCDIR
>   KERNELOBJDIR ?= $(KERNELSRCDIR)
>   endif
>   
> -KERNELARCH := $(subst sparc64,sparc,$(subst aarch64,arm64,$(subst x86_64,x86,$(ARCH))))
> +KERNELARCH := $(subst aarch64,arm64,$(subst x86_64,x86,$(ARCH)))
>   
>   # Paths.
>   
> @@ -120,7 +120,7 @@ export CC ?= gcc
>   
>   BITNESS := 64
>   NATIVE_BITNESS_ONLY := $(shell echo 'int main (void) { }' | $(CC) -x c -o /dev/null -m32 - 2>/dev/null || echo t)
> -ARCHINC := $(subst sparc64,sparc,$(subst aarch64,arm64,$(subst x86_64,i386,$(ARCH))))
> +ARCHINC := $(subst aarch64,arm64,$(subst x86_64,i386,$(ARCH)))
>   
>   INVARIANT_CFLAGS := -std=gnu99 -D_GNU_SOURCE -D_FILE_OFFSET_BITS=64 $(if $(NATIVE_BITNESS_ONLY),-DNATIVE_BITNESS_ONLY) -D_DT_VERSION=\"$(VERSION)\"
>   CPPFLAGS += -Iinclude -Iuts/common -Iinclude/$(ARCHINC) -I$(objdir)
> @@ -129,7 +129,7 @@ override CFLAGS += $(INVARIANT_CFLAGS)
>   PREPROCESS = $(CC) -E
>   export BPFC ?= bpf-unknown-none-gcc
>   
> -BPFCPPFLAGS += -D$(subst sparc64,__sparc,$(subst aarch64,__aarch64__,$(subst x86_64,__amd64,$(ARCH))))
> +BPFCPPFLAGS += -D$(subst aarch64,__aarch64__,$(subst x86_64,__amd64,$(ARCH)))
>   BPFCFLAGS ?= -O2 -Wall -Wno-unknown-pragmas $(if $(HAVE_BPFV3),-mcpu=v3) $(if $(HAVE_BPFMASM),-masm=normal) -ffreestanding
>   export BPFLD ?= bpf-unknown-none-ld
>   
> diff --git a/include/sparc/platform.h b/include/sparc/platform.h
> deleted file mode 100644
> index 1dea6ea2..00000000
> --- a/include/sparc/platform.h
> +++ /dev/null
> @@ -1,32 +0,0 @@
> -/*
> - * Oracle Linux DTrace.
> - * Copyright (c) 2013, 2015, Oracle and/or its affiliates. All rights reserved.
> - * Licensed under the Universal Permissive License v 1.0 as shown at
> - * http://oss.oracle.com/licenses/upl.
> - */
> -
> -#ifndef _SPARC_PLATFORM_H
> -#define _SPARC_PLATFORM_H
> -
> -#include <inttypes.h>
> -#include <asm/ptrace.h>
> -#include <elf.h>
> -#include <sys/syscall.h>			/* for __NR_* */
> -
> -/*
> - * Must be no larger than an 'unsigned long'.
> - */
> -const static unsigned char plat_bkpt[] = { 0x91, 0xd0, 0x20, 0x01 };
> -
> -/*
> - * Number of processor-specific dynamic tags on this platform.
> - */
> -#define DT_THISPROCNUM DT_SPARC_NUM
> -
> -/*
> - * TRUE if this platform requires software singlestepping.
> - */
> -#define NEED_SOFTWARE_SINGLESTEP 1
> -
> -#endif
> -
> diff --git a/libdtrace/dt_link.c b/libdtrace/dt_link.c
> index 6d733881..340273fb 100644
> --- a/libdtrace/dt_link.c
> +++ b/libdtrace/dt_link.c
> @@ -524,9 +524,7 @@ dtrace_program_link(dtrace_hdl_t *dtp, dtrace_prog_t *pgp, uint_t dflags,
>   
>   		if (dtp->dt_oflags & DTRACE_O_ILP32) {
>   			snprintf(drti, sizeof (drti), "%s/drti/drti32.o", libdir->dir_path);
> -#if defined(__sparc)
> -			emu = " -m elf32_sparc";
> -#elif defined(__i386) || defined(__amd64)
> +#if defined(__i386) || defined(__amd64)
>   			emu = " -m elf_i386";
>   #endif
>   		} else {
> diff --git a/libdtrace/dt_open.c b/libdtrace/dt_open.c
> index 54adec02..30b8758d 100644
> --- a/libdtrace/dt_open.c
> +++ b/libdtrace/dt_open.c
> @@ -827,24 +827,10 @@ dt_vopen(int version, int flags, int *errp,
>   	else if (flags & DTRACE_O_ILP32)
>   		dtp->dt_conf.dtc_ctfmodel = CTF_MODEL_ILP32;
>   
> -#ifdef __sparc
> -	/*
> -	 * On SPARC systems, __sparc is always defined for <sys/isa_defs.h>
> -	 * and __sparcv9 is defined if we are doing a 64-bit compile.
> -	 */
> -	if (dt_cpp_add_arg(dtp, "-D__sparc") == NULL)
> -		return set_open_errno(dtp, errp, EDT_NOMEM);
> -
> -	if (dtp->dt_conf.dtc_ctfmodel == CTF_MODEL_LP64 &&
> -	    dt_cpp_add_arg(dtp, "-D__sparcv9") == NULL)
> -		return set_open_errno(dtp, errp, EDT_NOMEM);
> -#endif
> -
>   #ifdef __x86
>   	/*
>   	 * On x86 systems, __i386 is defined for <sys/isa_defs.h> for 32-bit
> -	 * compiles and __amd64 is defined for 64-bit compiles.  Unlike SPARC,
> -	 * they are defined exclusive of one another (see PSARC 2004/619).
> +	 * compiles and __amd64 is defined for 64-bit compiles.
>   	 */
>   	if (dtp->dt_conf.dtc_ctfmodel == CTF_MODEL_LP64) {
>   		if (dt_cpp_add_arg(dtp, "-D__amd64") == NULL)
> diff --git a/libdtrace/procfs.d.in b/libdtrace/procfs.d.in
> index 23454d63..4140608b 100644
> --- a/libdtrace/procfs.d.in
> +++ b/libdtrace/procfs.d.in
> @@ -285,9 +285,7 @@ translator lwpsinfo_t < struct task_struct *T > {
>   define_for_kernel([[on_cpu]], [[(m4_kver(5,16,0), m4_dnl
>     [[((struct thread_info *)T->stack)->cpu]]), m4_dnl
>   (m4_kver(4,9,0), m4_dnl
> -  [[if_arch([[x86]],[[T->cpu]])]] m4_dnl
> -  [[if_arch([[arm64]],[[T->cpu]])]] m4_dnl
> -  [[if_arch([[sparc]],[[((struct thread_info *)T->stack)->cpu]])]])]], m4_dnl
> +  [[T->cpu]])]], m4_dnl
>   [[((struct thread_info *)T->stack)->cpu]])m4_dnl
>   	pr_onpro = on_cpu;
>   };
> diff --git a/libdtrace/sparc/regs.d b/libdtrace/sparc/regs.d
> deleted file mode 100644
> index 112ae207..00000000
> --- a/libdtrace/sparc/regs.d
> +++ /dev/null
> @@ -1,99 +0,0 @@
> -/*
> - * Oracle Linux DTrace.
> - * Copyright (c) 2012, Oracle and/or its affiliates. All rights reserved.
> - * Licensed under the Universal Permissive License v 1.0 as shown at
> - * http://oss.oracle.com/licenses/upl.
> - */
> -
> -inline int R_G0	= 0;
> -#pragma D binding "1.0" R_G0
> -inline int R_G1	= 1;
> -#pragma D binding "1.0" R_G1
> -inline int R_G2	= 2;
> -#pragma D binding "1.0" R_G2
> -inline int R_G3	= 3;
> -#pragma D binding "1.0" R_G3
> -inline int R_G4	= 4;
> -#pragma D binding "1.0" R_G4
> -inline int R_G5	= 5;
> -#pragma D binding "1.0" R_G5
> -inline int R_G6	= 6;
> -#pragma D binding "1.0" R_G6
> -inline int R_G7	= 7;
> -#pragma D binding "1.0" R_G7
> -
> -inline int R_O0	= 8;
> -#pragma D binding "1.0" R_O0
> -inline int R_O1	= 9;
> -#pragma D binding "1.0" R_O1
> -inline int R_O2	= 10;
> -#pragma D binding "1.0" R_O2
> -inline int R_O3	= 11;
> -#pragma D binding "1.0" R_O3
> -inline int R_O4	= 12;
> -#pragma D binding "1.0" R_O4
> -inline int R_O5	= 13;
> -#pragma D binding "1.0" R_O5
> -inline int R_O6	= 14;
> -#pragma D binding "1.0" R_O6
> -inline int R_O7	= 15;
> -#pragma D binding "1.0" R_O7
> -
> -inline int R_L0	= 16;
> -#pragma D binding "1.0" R_L0
> -inline int R_L1	= 17;
> -#pragma D binding "1.0" R_L1
> -inline int R_L2	= 18;
> -#pragma D binding "1.0" R_L2
> -inline int R_L3	= 19;
> -#pragma D binding "1.0" R_L3
> -inline int R_L4	= 20;
> -#pragma D binding "1.0" R_L4
> -inline int R_L5	= 21;
> -#pragma D binding "1.0" R_L5
> -inline int R_L6	= 22;
> -#pragma D binding "1.0" R_L6
> -inline int R_L7	= 23;
> -#pragma D binding "1.0" R_L7
> -
> -inline int R_I0	= 24;
> -#pragma D binding "1.0" R_I0
> -inline int R_I1	= 25;
> -#pragma D binding "1.0" R_I1
> -inline int R_I2	= 26;
> -#pragma D binding "1.0" R_I2
> -inline int R_I3	= 27;
> -#pragma D binding "1.0" R_I3
> -inline int R_I4	= 28;
> -#pragma D binding "1.0" R_I4
> -inline int R_I5	= 29;
> -#pragma D binding "1.0" R_I5
> -inline int R_I6	= 30;
> -#pragma D binding "1.0" R_I6
> -inline int R_I7	= 31;
> -#pragma D binding "1.0" R_I7
> -
> -inline int R_CCR = 32;
> -#pragma D binding "1.0" R_CCR
> -inline int R_PC = 33;
> -#pragma D binding "1.0" R_PC
> -inline int R_nPC = 34;
> -#pragma D binding "1.0" R_nPC
> -inline int R_NPC = R_nPC;
> -#pragma D binding "1.0" R_NPC
> -inline int R_Y = 35;
> -#pragma D binding "1.0" R_Y
> -inline int R_ASI = 36;
> -#pragma D binding "1.0" R_ASI
> -inline int R_FPRS = 37;
> -#pragma D binding "1.0" R_FPRS
> -inline int R_PS = R_CCR;
> -#pragma D binding "1.0" R_PS
> -inline int R_SP = R_O6;
> -#pragma D binding "1.0" R_SP
> -inline int R_FP = R_I6;
> -#pragma D binding "1.0" R_FP
> -inline int R_R0 = R_O0;
> -#pragma D binding "1.0" R_R0
> -inline int R_R1 = R_O1;
> -#pragma D binding "1.0" R_R1
> diff --git a/libproc/sparc/isadep.c b/libproc/sparc/isadep.c
> deleted file mode 100644
> index aa4f53f5..00000000
> --- a/libproc/sparc/isadep.c
> +++ /dev/null
> @@ -1,133 +0,0 @@
> -/*
> - * ISA-dependent functions for SPARC and SPARC64.
> - */
> -
> -/*
> - * Oracle Linux DTrace.
> - * Copyright (c) 2013, 2020, Oracle and/or its affiliates. All rights reserved.
> - * Licensed under the Universal Permissive License v 1.0 as shown at
> - * http://oss.oracle.com/licenses/upl.
> - */
> -
> -#include <inttypes.h>
> -#include <errno.h>
> -#include <string.h>
> -#include <sys/ptrace.h>
> -#include <asm/ptrace.h>				/* for struct pt_regs */
> -
> -#include "Pcontrol.h"
> -#include "libproc.h"
> -#include "platform.h"
> -
> -#define PTRACE_GETREGSET        0x4204
> -
> -/*
> - * Get a SPARC64 regset.
> - */
> -static struct pt_regs *
> -getregs_sparc64(struct ps_prochandle *P, struct pt_regs *regs)
> -{
> -	if (Pstate(P) == PS_RUN ||
> -	    Pstate(P) == PS_DEAD)
> -		return NULL;
> -
> -	if (wrapped_ptrace(P, PTRACE_GETREGS64, P->pid, regs) < 0)
> -		return NULL;
> -
> -	return regs;
> -}
> -
> -static struct pt_regs32 *
> -getregs_sparc32(struct ps_prochandle *P, struct pt_regs32 *regs)
> -{
> -	if (Pstate(P) == PS_RUN ||
> -	    Pstate(P) == PS_DEAD)
> -		return NULL;
> -
> -	if (wrapped_ptrace(P, PTRACE_GETREGS, P->pid, regs) < 0)
> -		return NULL;
> -
> -	return regs;
> -}
> -
> -/*
> - * Read the first argument of the function at which the process P is halted,
> - * which must be a pointer (though other integral arguments happen to work for
> - * the SPARC and SPARC64 ABI).
> - *
> - * For SPARC, the first integral argument to a function will always be in %i0.
> - * Horrifically, the value of all the UREG_* constants is off by 1, so we have
> - * to correct for that.
> - *
> - * On error, -1 cast to a uintptr_t is returned, and errno is set.
> - */
> -uintptr_t
> -Pread_first_arg_sparc64(struct ps_prochandle *P)
> -{
> -	struct pt_regs regs;
> -
> -	if (getregs_sparc64(P, &regs) == NULL)
> -		return (uintptr_t)-1;
> -
> -	return regs.u_regs[UREG_I0 - 1];
> -}
> -
> -uintptr_t
> -Pread_first_arg_sparc32(struct ps_prochandle *P)
> -{
> -	struct pt_regs32 regs;
> -
> -	if (getregs_sparc32(P, &regs) == NULL)
> -		return (uintptr_t)-1;
> -
> -	return regs.u_regs[UREG_I0 - 1];
> -}
> -
> -/*
> - * Get the address at which we stopped at a breakpoint.  Unlike on x86, no post
> - * facto adjustment is required.
> - */
> -uintptr_t
> -Pget_bkpt_ip_sparc64(struct ps_prochandle *P, int expect_esrch)
> -{
> -	struct pt_regs regs;
> -
> -	if (getregs_sparc64(P, &regs) == NULL) {
> -		if ((errno == ESRCH) && (expect_esrch))
> -			return 0;
> -		else {
> -			_dprintf("Unexpected ptrace (PTRACE_GETREGSET) "
> -			    "error: %s\n", strerror(errno));
> -			return -1;
> -		}
> -	}
> -
> -	return regs.tpc;
> -}
> -
> -/*
> - * Reset the instruction pointer address at which the process P is stopped.
> - * (Not needed on SPARC.)
> - */
> -long
> -Preset_bkpt_ip_sparc(struct ps_prochandle *P, uintptr_t addr)
> -{
> -    return 0; /* nothing doing */
> -}
> -
> -/*
> - * Get the address at which the temporary breakpoint should be dropped when a
> - * breakpoint is hit.
> - */
> -extern long Pget_next_ip_sparc64(struct ps_prochandle *P, uintptr_t addr)
> -{
> -	struct pt_regs regs;
> -
> -	if (getregs_sparc64(P, &regs) == NULL) {
> -		_dprintf("Unexpected ptrace (PTRACE_GETREGSET) "
> -		    "error: %s\n", strerror(errno));
> -		return -1;
> -	}
> -
> -	return regs.tnpc;
> -}
> diff --git a/libproc/sparc/isadep.h b/libproc/sparc/isadep.h
> deleted file mode 100644
> index 005e6008..00000000
> --- a/libproc/sparc/isadep.h
> +++ /dev/null
> @@ -1,81 +0,0 @@
> -/*
> - * Underlying ISA-dependent functions for SPARC and SPARC64.
> - */
> -
> -/*
> - * Oracle Linux DTrace.
> - * Copyright (c) 2013, 2015, Oracle and/or its affiliates. All rights reserved.
> - * Licensed under the Universal Permissive License v 1.0 as shown at
> - * http://oss.oracle.com/licenses/upl.
> - */
> -
> -/*
> - * Not protected against multiple inclusion: this file is included by
> - * isadep_dispatch.h repeatedly, at local scope, to get different prototypes and
> - * dispatch variables.
> - */
> -
> -#ifdef WANT_FIRST_ARG_DISPATCH
> -
> -extern	uintptr_t Pread_first_arg_sparc64(struct ps_prochandle *P);
> -extern	uintptr_t Pread_first_arg_sparc32(struct ps_prochandle *P);
> -
> -isa_dispatch_t dispatch[] = {
> -    {B_FALSE, EM_SPARCV9, (dispatch_fun_t *) Pread_first_arg_sparc32},
> -    {B_TRUE, EM_SPARCV9, (dispatch_fun_t *) Pread_first_arg_sparc64},
> -    {B_FALSE, EM_SPARC32PLUS, (dispatch_fun_t *) Pread_first_arg_sparc32},
> -    {B_TRUE, EM_SPARC32PLUS, (dispatch_fun_t *) Pread_first_arg_sparc64},
> -    {B_FALSE, EM_SPARC, (dispatch_fun_t *) Pread_first_arg_sparc32},
> -    {B_TRUE, EM_SPARC, (dispatch_fun_t *) Pread_first_arg_sparc64}, /* ??? */
> -    {0, 0, NULL}};
> -
> -#endif
> -
> -#ifdef WANT_GET_BKPT_IP
> -
> -extern uintptr_t Pget_bkpt_ip_sparc64(struct ps_prochandle *P, int expect_esrch);
> -
> -/*
> - * I hope 32-on-64 traps are treated like 64-on-64 traps.
> - */
> -
> -isa_dispatch_t dispatch[] = {
> -    {B_FALSE, EM_SPARCV9, (dispatch_fun_t *) Pget_bkpt_ip_sparc64},
> -    {B_TRUE, EM_SPARCV9, (dispatch_fun_t *) Pget_bkpt_ip_sparc64},
> -    {B_FALSE, EM_SPARC32PLUS, (dispatch_fun_t *) Pget_bkpt_ip_sparc64},
> -    {B_TRUE, EM_SPARC32PLUS, (dispatch_fun_t *) Pget_bkpt_ip_sparc64},
> -    {B_FALSE, EM_SPARC, (dispatch_fun_t *) Pget_bkpt_ip_sparc64},
> -    {B_TRUE, EM_SPARC, (dispatch_fun_t *) Pget_bkpt_ip_sparc64}, /* ??? */
> -    {0, 0, NULL}};
> -
> -#endif
> -
> -#ifdef WANT_RESET_BKPT_IP
> -
> -extern	long Preset_bkpt_ip_sparc(struct ps_prochandle *P, uintptr_t addr);
> -
> -isa_dispatch_t dispatch[] = {
> -    {B_FALSE, EM_SPARCV9, (dispatch_fun_t *) Preset_bkpt_ip_sparc},
> -    {B_TRUE, EM_SPARCV9, (dispatch_fun_t *) Preset_bkpt_ip_sparc},
> -    {B_FALSE, EM_SPARC32PLUS, (dispatch_fun_t *) Preset_bkpt_ip_sparc},
> -    {B_TRUE, EM_SPARC32PLUS, (dispatch_fun_t *) Preset_bkpt_ip_sparc},
> -    {B_FALSE, EM_SPARC, (dispatch_fun_t *) Preset_bkpt_ip_sparc},
> -    {B_TRUE, EM_SPARC, (dispatch_fun_t *) Preset_bkpt_ip_sparc}, /* ??? */
> -    {0, 0, NULL}};
> -
> -#endif
> -
> -#ifdef WANT_GET_NEXT_IP
> -
> -extern	long Pget_next_ip_sparc64(struct ps_prochandle *P, uintptr_t addr);
> -
> -isa_dispatch_t dispatch[] = {
> -    {B_FALSE, EM_SPARCV9, (dispatch_fun_t *) Pget_next_ip_sparc64},
> -    {B_TRUE, EM_SPARCV9, (dispatch_fun_t *) Pget_next_ip_sparc64},
> -    {B_FALSE, EM_SPARC32PLUS, (dispatch_fun_t *) Pget_next_ip_sparc64},
> -    {B_TRUE, EM_SPARC32PLUS, (dispatch_fun_t *) Pget_next_ip_sparc64},
> -    {B_FALSE, EM_SPARC, (dispatch_fun_t *) Pget_next_ip_sparc64},
> -    {B_TRUE, EM_SPARC, (dispatch_fun_t *) Pget_next_ip_sparc64}, /* ??? */
> -    {0, 0, NULL}};
> -
> -#endif
> diff --git a/test/stress/fbtsafety/tst.vahole.d b/test/stress/fbtsafety/tst.vahole.d
> deleted file mode 100755
> index 732ae3ca..00000000
> --- a/test/stress/fbtsafety/tst.vahole.d
> +++ /dev/null
> @@ -1,50 +0,0 @@
> -#!dtrace -Cs
> -
> -/*
> - * Oracle Linux DTrace.
> - * Copyright (c) 2006, 2026, Oracle and/or its affiliates. All rights reserved.
> - * Licensed under the Universal Permissive License v 1.0 as shown at
> - * http://oss.oracle.com/licenses/upl.
> - */
> -
> -/* @@skip: nonportable */
> -
> -/*
> - * We set our buffer size absurdly low to prevent a flood of errors that we
> - * don't care about.
> - */
> -#pragma D option bufsize=16
> -#pragma D option bufpolicy=ring
> -
> -fbt:::
> -{
> -	n++;
> -#ifdef __sparc
> -	trace(*(int *)0x8000000000000000 ^ rand());
> -#else
> -	trace(*(int *)(`kernelbase - 1));
> -#endif
> -}
> -
> -dtrace:::ERROR
> -{
> -	err++;
> -}
> -
> -tick-1sec
> -/sec++ == 10/
> -{
> -	exit(2);
> -}
> -
> -END
> -/n == 0 || err == 0/
> -{
> -	exit(1);
> -}
> -
> -END
> -/n != 0 && err != 0/
> -{
> -	exit(0);
> -}
> diff --git a/test/unittest/aggs/tst.neglquant.d b/test/unittest/aggs/tst.neglquant.d
> index c09d7aab..5e6d1dc0 100644
> --- a/test/unittest/aggs/tst.neglquant.d
> +++ b/test/unittest/aggs/tst.neglquant.d
> @@ -90,11 +90,11 @@ BEGIN
>   	 * We want to test the ability to sort very large quantizations
>   	 * that differ by a small amount.  Ideally, they would differ only
>   	 * by 1 -- but that is smaller than the precision of long doubles of
> -	 * this magnitude on x86.  To assure that the same test works on x86
> -	 * just as it does on SPARC, we pick a value that is just larger than
> -	 * the precision at this magnitude.  It should go without saying that
> -	 * this robustness on new ISAs very much depends on the precision
> -	 * of the long double representation.
> +	 * this magnitude on x86_64.  To assure that the same test works for
> +	 * the architectures DTrace is developed for, we pick a value that is
> +	 * just larger than the precision at this magnitude.  It should go
> +	 * without saying that this robustness on new ISAs very much depends on
> +	 * the precision of the long double representation.
>   	 */
>   	this->val = (((long long) 1) << 63) - 7;
>   
> diff --git a/test/unittest/arrays/tst.uregsarray.sparc64.d b/test/unittest/arrays/tst.uregsarray.sparc64.d
> deleted file mode 100644
> index 2179a0db..00000000
> --- a/test/unittest/arrays/tst.uregsarray.sparc64.d
> +++ /dev/null
> @@ -1,69 +0,0 @@
> -/*
> - * Oracle Linux DTrace.
> - * Copyright (c) 2006, Oracle and/or its affiliates. All rights reserved.
> - * Licensed under the Universal Permissive License v 1.0 as shown at
> - * http://oss.oracle.com/licenses/upl.
> - */
> -/* @@xfail: dtv2 */
> -
> -/*
> - * ASSERTION:
> - *	Positive test to make sure that we can invoke sparc
> - *	ureg[] aliases.
> - *
> - * SECTION: User Process Tracing/uregs Array
> - *
> - * NOTES: This test does no verification - the value of the output
> - *	is not deterministic.
> - */
> -
> -#pragma D option quiet
> -
> -BEGIN
> -{
> -	printf("R_G0 = 0x%x\n", uregs[R_G0]);
> -	printf("R_G1 = 0x%x\n", uregs[R_G1]);
> -	printf("R_G2 = 0x%x\n", uregs[R_G2]);
> -	printf("R_G3 = 0x%x\n", uregs[R_G3]);
> -	printf("R_G4 = 0x%x\n", uregs[R_G4]);
> -	printf("R_G5 = 0x%x\n", uregs[R_G5]);
> -	printf("R_G6 = 0x%x\n", uregs[R_G6]);
> -	printf("R_G7 = 0x%x\n", uregs[R_G7]);
> -	printf("R_O0 = 0x%x\n", uregs[R_O0]);
> -	printf("R_O1 = 0x%x\n", uregs[R_O1]);
> -	printf("R_O2 = 0x%x\n", uregs[R_O2]);
> -	printf("R_O3 = 0x%x\n", uregs[R_O3]);
> -	printf("R_O4 = 0x%x\n", uregs[R_O4]);
> -	printf("R_O5 = 0x%x\n", uregs[R_O5]);
> -	printf("R_O6 = 0x%x\n", uregs[R_O6]);
> -	printf("R_O7 = 0x%x\n", uregs[R_O7]);
> -	printf("R_L0 = 0x%x\n", uregs[R_L0]);
> -	printf("R_L1 = 0x%x\n", uregs[R_L1]);
> -	printf("R_L2 = 0x%x\n", uregs[R_L2]);
> -	printf("R_L3 = 0x%x\n", uregs[R_L3]);
> -	printf("R_L4 = 0x%x\n", uregs[R_L4]);
> -	printf("R_L5 = 0x%x\n", uregs[R_L5]);
> -	printf("R_L6 = 0x%x\n", uregs[R_L6]);
> -	printf("R_L7 = 0x%x\n", uregs[R_L7]);
> -	printf("R_I0 = 0x%x\n", uregs[R_I0]);
> -	printf("R_I1 = 0x%x\n", uregs[R_I1]);
> -	printf("R_I2 = 0x%x\n", uregs[R_I2]);
> -	printf("R_I3 = 0x%x\n", uregs[R_I3]);
> -	printf("R_I4 = 0x%x\n", uregs[R_I4]);
> -	printf("R_I5 = 0x%x\n", uregs[R_I5]);
> -	printf("R_I6 = 0x%x\n", uregs[R_I6]);
> -	printf("R_I7 = 0x%x\n", uregs[R_I7]);
> -	printf("R_CCR = 0x%x\n", uregs[R_CCR]);
> -	printf("R_PC = 0x%x\n", uregs[R_PC]);
> -	printf("R_NPC = 0x%x\n", uregs[R_NPC]);
> -	printf("R_Y = 0x%x\n", uregs[R_Y]);
> -	printf("R_ASI = 0x%x\n", uregs[R_ASI]);
> -	printf("R_FPRS = 0x%x\n", uregs[R_FPRS]);
> -	exit(0);
> -}
> -
> -ERROR
> -{
> -	printf("uregs access failed.\n");
> -	exit(1);
> -}
> diff --git a/test/unittest/arrays/tst.uregsarray.sparc64.x b/test/unittest/arrays/tst.uregsarray.sparc64.x
> deleted file mode 100755
> index 2c34e04d..00000000
> --- a/test/unittest/arrays/tst.uregsarray.sparc64.x
> +++ /dev/null
> @@ -1,4 +0,0 @@
> -#!/bin/sh
> -
> -[ `uname -m` = "sparc64" ] && exit 0
> -exit 2
> diff --git a/test/unittest/pid/test.sparc64.options b/test/unittest/pid/test.sparc64.options
> deleted file mode 100644
> index 9e81427e..00000000
> --- a/test/unittest/pid/test.sparc64.options
> +++ /dev/null
> @@ -1 +0,0 @@
> -@@skip: pid provider not yet implemented (sparc64)
> diff --git a/test/unittest/usdt/tst.enabled2.sh b/test/unittest/usdt/tst.enabled2.sh
> index b174ef4c..c33bca07 100755
> --- a/test/unittest/usdt/tst.enabled2.sh
> +++ b/test/unittest/usdt/tst.enabled2.sh
> @@ -5,7 +5,7 @@
>   # Licensed under the Universal Permissive License v 1.0 as shown at
>   # http://oss.oracle.com/licenses/upl.
>   #
> -# This test is primarily intended to verify a fix for SPARC, but there's no
> +# This test was primarily developed to verify a fix for SPARC, but there's no
>   # harm in running it on other platforms. Here, we verify that is-enabled
>   # probes don't interfere with return values from previously invoked functions.
>   
>
> _______________________________________________
> DTrace-devel mailing list
> DTrace-devel@oss.oracle.com
> https://oss.oracle.com/mailman/listinfo/dtrace-devel
