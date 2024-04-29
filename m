Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6B15127E24
	for <dtrace@lists.linux.dev>; Mon, 29 Apr 2024 18:14:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714414471; cv=fail; b=oJcpGLRjJrDUv6cEfh1JOgeG3Ye23dDGDQJ7BBLe7BUAFh5dfG+ZCcGP2/0cVzH2d2dbiZN5MlWopqLU+zHq+U9Yr78eFom+uZtYeh+oBRTkgx0/NTqcfDT4Jf1CzA6ZEiRwJrH6fbLs3XV21RT+e0YiQVU24dP9xbWEVBN/A/4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714414471; c=relaxed/simple;
	bh=kutjuiPe8+TTRYygnvRBNzOo1+0jxwzyzaWhlg1LQlg=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=JUv0iB3+4ME+ZXJUs/9x6fOk7ALFDfe68tvf7ayM/mZCkkLNQz29Rx6wXMrIq+bZ8T2rpIau/BP8+oHYuuqGX/INnq+qQlfd8sdeJN44Rx+p3svPDXpkKNzI3JIaDFndr4M7mBVQYd/fDlwv4gb8zRzN45tLl8kc+3kO2U/RAMs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=hcb2BDPi; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=ljODWCLx; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="hcb2BDPi";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="ljODWCLx"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 43THwtA2021142
	for <dtrace@lists.linux.dev>; Mon, 29 Apr 2024 18:14:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2023-11-20;
 bh=YwGXFYLvaA3shoFX5BMZ73KaNUbyjh0WzTvjygxD6q0=;
 b=hcb2BDPigZLONXyeA1xfJKvm9Ou1q9xpSW3dwHf0WYYZLfAH7DNaVYbdlG6Fe3FFxJiu
 OpkrahRIlGJaWTyJRGs5whURzmzO2V3LmWxk9hJs1t350+dZBOvzeEX8IOzUSgq5c+Bc
 j06fAJjlNA3x9ttlpMh5xfdAUHegwWtUSCsXRVdRu1VTvCCn4hp0f3hpxZEVo48wOgcX
 NSrEiYJV9z2LO4VGQQElRAYuvvmZrwoHWFKPhQYD0Oe9PXdhZW5yFlS5fnaWZnUWx48X
 c5rI5LUdebpXc5lUPC4jp0KXso7QK83tuzmlVNsSQgWo6Q6xh//aXQrITTzMAU96Sehb ow== 
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3xrryv37uu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 29 Apr 2024 18:14:28 +0000
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 43THkCZg011398
	for <dtrace@lists.linux.dev>; Mon, 29 Apr 2024 18:14:27 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2101.outbound.protection.outlook.com [104.47.70.101])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3xrqt6rjw6-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 29 Apr 2024 18:14:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XFpNHvg9/hME02nEHmu3cLLz+AZ74LgK9SHkARzdk79wkUcFfteRv0GzUSoUJUKvr6XKIVhUCTp41F9ASUo4A5Nc/0MJ6BL75GxWNDOFpLueqR3azrV+r42vgH2789g71jMYIEL+RwyOy1yZDQYxpj6eQUf6rr676TWh/3VbEqrF1nH4eSfxNKfvpEjfw5VLhWTbN1opvXi1k0uhuVcVSfOwrneqgQdVd7Vev75PKMqCi9xVCY+cmTu8hNVILILSbJ0/RTKy3XwXUwH5qmCajNcLC/c+xoHwn671cWxTqw7xFbLeP9hsCXGdjVawoye374jTXOlmKs01/MgQeW5omg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YwGXFYLvaA3shoFX5BMZ73KaNUbyjh0WzTvjygxD6q0=;
 b=QaZVVwnDOUppRTZQqD4uqwq6xtRGkB2M+eoGbxYTVKhvr3mKKGHM5DzcKGE9WCh7n4cg86BsxqQgjgBE/qlvEnZNhMb3G3F1qWFLsMAPmUSO+sZZcp6JR2xPv/GxH3bz/89QSW2GOPwRsFP+qV94ZTSuzcfVnUz+qp+3uq7Z3aU1ZXuZIycn7po1QSTQ6HvCepazjzOXN5mXPhr5wFOpNOz1uybln/MQHN0nYBxGtGnt3omX4cX0os8OKjlObbmtBPQ7yadKGOC58H/aq02KlGw/oV1gyO7Eotz+Nc8WeKfDScaETwuyPtDCk+47aIyMB39UkH1A0PNJnEU1O0rIGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YwGXFYLvaA3shoFX5BMZ73KaNUbyjh0WzTvjygxD6q0=;
 b=ljODWCLxX5sFuZdcSL0DxvO+jl2LwB4KduMSnC2nsyNE5ASHFiqxLW9PvFb/9XbV+1f3uXjM5at819bBiuhElhcTeiu2FoC/vXnPPhe6JA5GstYxiZ7FzprZyiKyO9o4Z6ZyqEpHJNyA6vkCrqssDBVr6LK1RolZ8nLSuT+4DGU=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by DS7PR10MB4846.namprd10.prod.outlook.com (2603:10b6:5:38c::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.35; Mon, 29 Apr
 2024 18:14:24 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::880a:3c23:a6e1:3b65]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::880a:3c23:a6e1:3b65%4]) with mapi id 15.20.7519.031; Mon, 29 Apr 2024
 18:14:24 +0000
Message-ID: <4a921638-67bd-1ea5-34ed-8234a1f807aa@oracle.com>
Date: Mon, 29 Apr 2024 14:14:21 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: Possible (long standing) issue in the BPF verifier?
Content-Language: en-US
To: dtrace@lists.linux.dev
Cc: DTrace development list <dtrace-devel@oss.oracle.com>
References: <Zi2n0lpb7Kk15qKE@oracle.com>
 <26b372d8-2ad0-5464-92e8-ace3fca9119e@oracle.com>
 <Zi/XWmPLl2Q0iuWc@oracle.com>
From: Eugene Loh <eugene.loh@oracle.com>
In-Reply-To: <Zi/XWmPLl2Q0iuWc@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BY3PR03CA0016.namprd03.prod.outlook.com
 (2603:10b6:a03:39a::21) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|DS7PR10MB4846:EE_
X-MS-Office365-Filtering-Correlation-Id: a85d0a67-6672-418c-bdad-08dc68783336
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|366007|1800799015;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?ZHdWRUpqazdkZnZjcTVNN2Z0OEtIZFNXYmhYc0ZURVA0TUdrSlZhS0c0WFE5?=
 =?utf-8?B?Ty9vL0VNbFAzeVBMOFpvV1lzWmdrMXpUcTRYT052QjBWTkZJdjdUd3FRR2Y0?=
 =?utf-8?B?NC9SOWdnNGw5OGlwc0JNaDRnUmcrM1o2QnpFZFArdDg0Z3o2UGw4U2UwQndB?=
 =?utf-8?B?RitIZDY2M2ZubVAwa0gzYnllUGRQVnBqWlYvc0FPZDZYM2J2TmdkZTJsZkhh?=
 =?utf-8?B?czBMVjlWL1pWNkJZcUZCSjRRY1dQUWQ1eXN1UXpwVlFCWTYyOGhNaTBoZzQ4?=
 =?utf-8?B?U3AyellMbVNuWGNVY29PaXdwLzcrRE4weVRBc0dNS2tCRjBGdWxScE0rV29l?=
 =?utf-8?B?T01Ta1hsQlJUWC90Y0t0aXhCV0tTWS9uUXc1WCs5MGI2ZlFGd29hQUJvaWJZ?=
 =?utf-8?B?TmhocmxqRWdPYWNiOWhZTGFJWFFXTE9YQXNYUnQrRUx1SjE4SndBV3Jyclov?=
 =?utf-8?B?R3F5YmZWdm1NN0hHRVV2TnNCTXpwQmhmTTcwK04wSVdtLzViWnI4OEtQaVZY?=
 =?utf-8?B?WUMyczZuNlU0a1AydFNpOGtOU0hMUXdsYjdTc0FZbi92UkcxNzlCZnc0QWt0?=
 =?utf-8?B?QTNGNTNwbGZBektDMTVmVlR1aWFHd1ZLa1FzOHJURjlyeFFjR2tWMW5KRFRj?=
 =?utf-8?B?dTlzbWNKdXd1SDB4eG1GLzJZTXZQUU1icGZOSTdZZUtGMUgyUVZhcnBRMEJm?=
 =?utf-8?B?dEZuRHd0YzNEa25ZbVRiVU0yTDdyU1VkcWJ3KzR5cXIvNTFIQ3N1Nms4c0Za?=
 =?utf-8?B?VlhFT2xoOVIxYzYxbGdrZkY1bnM1aUI2ME9JNFY3aTQ0MVBSdEtOZ2ZhT2Uv?=
 =?utf-8?B?bTU3a0xBSzM2TytZVHNSSjBGeUg4NHcxVExSWGF6QXdmZjFqaC9KVWZaOG5I?=
 =?utf-8?B?WXZ5ZEJ5SG4xMHJXMDlNOEVIZEYzY1dhY0o5K21uaG8vVGpLYVVuZzl6N2Zk?=
 =?utf-8?B?QnJWTnRjdDluV0NXUmhuNXZmbDdoV0xhTXFGSnBlVTJkMVN1RTI0VTZtc0h0?=
 =?utf-8?B?MmlXaENvZk1JamhWNElwdTRUNURvczNma2dkc0RlS1RsM0hUTVB4SGNTcjhy?=
 =?utf-8?B?VWtDTHlKbEl5Y2RRZUtLYksxdWRTd2Vpdlc1YTZwK0VmSlFzVkt6WC9kZ3cw?=
 =?utf-8?B?UXlSbTh2ZHg5Z0N2S0t0YWhHYkprTXVuZit0emw5OEREcHhPWWlwZHdIcUUx?=
 =?utf-8?B?ZDMzUERycFhac0pSREcyUTU1cFdVN0FwVm9LZFBFRW1jdGFIN0k4R1J6ZjFF?=
 =?utf-8?B?UnFMWURoQkRIcmVHazNmWEwybldPZC9uRWw0YWVPSVNQNlF5dmQ1Z1BZVDho?=
 =?utf-8?B?aVlWNFRGNVl6MTBML3N5V1FwUW9ySGRrR3FYcUhXR2ovV1pRWmJyRG9lTmlK?=
 =?utf-8?B?eWpwdzhKSlA2anFkMFJKeVdhYmpHdFh3aEQwSEZQUEtYbnhWRStsNEpOa3VV?=
 =?utf-8?B?VTVMZ2JBZk51QytaK1FNMk8yT3BmWjNKcUdwSzVsQkhXS2l4NG9OeDdxSi9R?=
 =?utf-8?B?NUJvVGtrNmh3UnVLMVV3T0s0b1hnaVY4K2xKZnR3SjQxWTdMZXl0V0hOdVBt?=
 =?utf-8?B?SlJpeFI1Zm9BSEtGYzAxa0hJMjMweGl1WnpVcDFwaEhJNEEzYnBiMkt0K1hm?=
 =?utf-8?B?U1ZWaC85bWlBU2lBUWVBVUtYOHczUXdFV3Q2bzY3L3pCaUFCcEY5bDIrQXM0?=
 =?utf-8?B?RjJnYmpBN296eXhSWkt5MndyQTFGQ2ZNM0x6TG1lRW1TSDNhbmEwVVBRPT0=?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(366007)(1800799015);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?SHBabDJjZzJkUklEMGptWFdoREhlWnpYTlNndkVMWjRZTmNyRFhqNUVLM3Fm?=
 =?utf-8?B?Z1dyTnBuYW5pdXRDdmIxL0IxRXdmeHZNZEZxQWUzYlF1N1VvcUQ3cXJ3cXdW?=
 =?utf-8?B?dHlKemNGRFhvUDFQdWtOWW9KSDB1RkljRmZpYTIwTDA0U3o5clpCcHNsQU9m?=
 =?utf-8?B?VHl2SWVQRFFYeEpqaUkzRU1CQmRXcXM4MUxBTXVXbG5kVWVXZ0NHYmx5a09F?=
 =?utf-8?B?ZkpiN0dtcEk0dWJCeERTL3BGSEIvZ1d4OXpVazFjem1jRkRRMzlaN0pYbi9u?=
 =?utf-8?B?dGRwb3NEZHBYSGU4T1hNYnkzZTNxQk5yU1JJSDA1N1d6YVFxQWNpV0hDNGxB?=
 =?utf-8?B?OXJlQlo5b2VkTDVFNmhlTjJSVnRHZnVxR0w3K1RVem9IVElCRkZoNEJPa09n?=
 =?utf-8?B?MGlVWXlLR0JjUXBqU2x6TWtzaEZvL1R3N09meGk5eXBJUTVDTG15Sk5JR3VP?=
 =?utf-8?B?Vkx4ZVFzSXpFcGRxUXZZbUROREVWNzJBZEFSczIrV2xEWVJ0SlFCZXZxaUFq?=
 =?utf-8?B?QXJFNHJQb2lMcGdVR2ZkSzFqTVlDZGg0UDVtVXBkZm9sRU0xbVlqYVhSc2J6?=
 =?utf-8?B?RnhpSWNWdUVHTXhPYWZvM1pEOFpOa1crYTdNeGx0K3JiU3ZrUVVUelNqWE1j?=
 =?utf-8?B?TUhEai9VK3h5ajdydjRQSHBBSCtyZlZTU1ppZXlmWDQ0ZVAxdnM3dCs3elRI?=
 =?utf-8?B?SHFWUWdZc0VRZ2xXRjZxYko2cWVjWWJQa243ZnhiQVpMWCsxWVBkWGZqMTFK?=
 =?utf-8?B?R1RDak8xMXpOdlREeGo5aForV1BJL1Fta0swN3VvOFhJSitDaklHU3FaNWph?=
 =?utf-8?B?aXBrQUxyT0RMNnQ2WisxVnVyeWQ4VEFUSHlUZWdLRHplMzF1RWZHYzNJczlJ?=
 =?utf-8?B?aXUyTEJLYXo0Q0pkR3Erd3M2aUxzNWVrUFEzZ2xueCt1NDQxSFNrcVRPWWxC?=
 =?utf-8?B?MlNseEZRTS9USnFRZ1hzZTQ0OHVqOHJZVk1pa1p4M3luWU4rcTV1ZVVNVjdD?=
 =?utf-8?B?cCtDWlIxVkJlYjJDMmIvSjVUbUpaK2RyalVzU2ZQc01qMEtvRFVLTnRnU3NP?=
 =?utf-8?B?azNkMGZxTGlZNnBpM2puSU8yMEdlWkV2VWY4SC8zcWRqcXpPaFhnY3J5NG14?=
 =?utf-8?B?NXpTVzJvSktpdjFEMkxwUC9IL1pSYWc3U3RyZzE4Vm5UeWk5SC9NSFl1Njlt?=
 =?utf-8?B?TXh3SDlERHZRUzBMTnBBMTkyVGFCNGFHdEpkNUJWMWplR211blplM3NqbmVV?=
 =?utf-8?B?RGxlRGhEZzZJb2JGRlVqTGFzVXp6M1FFejgzM21UV2VHb2JSaFhmTFFvSWEv?=
 =?utf-8?B?b1B5enF6Rkh5YU04eGg4R2JBaFdjTTlUVmwwQ2NwdkpqWnQ1MUhIa2IvYnJM?=
 =?utf-8?B?LzlzZ0YxMUY2SDFrakprWHcxWVFKaXFCTmhSUVdoUG5kb2lpamRyeUY4QkRh?=
 =?utf-8?B?dW5HVDREdkxRSDBwSmRkSmtqdjg1ZE9rYnRkNzdaaExoWXMwQnVUT1lqdHJq?=
 =?utf-8?B?YlAyTFlQWlNJRkRSMURQNlN4VjEyMXJ6WFVHNnVWeVNKanNwaUNaeFcrSldo?=
 =?utf-8?B?VzJBTEgzRDQxMHVzdEQvM0FWNkNzOEs2dzJQcURYeUJzSVNUK0tONEdtbU94?=
 =?utf-8?B?RTRwaDFBMGZDQ3RCVGRzRU10UU14aVJpcXNsRDRGZU1aekRNRDBOa200OHZU?=
 =?utf-8?B?UDRWWElyc3Q4SE1ZQk1SUWNNVkt6akswQlcveUwyZ3M0anczeWtZZWIzUEVh?=
 =?utf-8?B?RkgybytYK0pjN05tZVdOTmM0bWRJZndkQ2dBOXVjY3BHQnlGOXVtRDdSM3Zx?=
 =?utf-8?B?SzVLWUpvZ1pGM3gzNDhJeGl2d0Iyekd3WDBLN3NvVDBNVHYxR0UreGVZNGhp?=
 =?utf-8?B?ak9oTldPaTY2bWIzYjFGMkRHVTM3RzBNR1hGamU1ckZGbWdWVTVYTHRpYUlv?=
 =?utf-8?B?U0QyYWlyUE03QkRIVCtOU2ltUkcxOVlscXNNYVg1cFpGUkp3SlJ6RFpnOFls?=
 =?utf-8?B?U0dzUGdFUWVIRU90WDYrbUhWcFdTYUpKSTZNaFFrUXFIVTNvNU5EbVFNcTBq?=
 =?utf-8?B?RFdtL3pzN01sRkJUZHFCVEx6aGRiYU8weWtpbVpSOEV3Q21YNE9vSDl2MHVB?=
 =?utf-8?Q?+Xe/37GexE3WejqzHQeLZrMz9?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	Za69YjfoXXKSQNoo3H0azIlW9NANNiUIGqS7IOXgTJ797tJWD7wGNaMU9mDaB343++UbDT3nL5ylo+z8Mreh/8+iCtwYnlV16wOzk5J1sT6qHzxq+MBvzdovY/9A4660wgVTrAzNOXQvXdwX6uSXyJMJhx4aIn+tpgBV6YthvS7b3ZgooqavWb1Pl6RX0Ow3PcTaVB2YQiQt+amkJbKXnRwohgDFDIpU79hnjDf4e5NJsW0P3eutMz0MPKVHWM+sefjEOgxXGnFywIGGz5wjGZ08y8vMlIdYlr/ZWNs7rJRsEcn6sRQiVHbwkVp9KSNMU15PpFSxKSJhURk2HWwDa3j5AL0sdnha+OV8d3khBGimIeQORLc03e6v6VHtN2A9Do13cNbBmAeA6sf34++kUISHys+IlyH103zYekYNP+EdVMmnkFRzQW5++mVrNF5E8lOt/97hJqvoxHbz1cY7N4rD1phkT1viHwobqYN6SM61DhecpTOw9nilJMyuUcDnz11HmyjD4mx/hyiZhNQf/ZZU+13s7WERAVp83Bo/oKMTmk1svEFMrl7s3WaOkEW+GP7SuqBMbEb85xzPVKChXy4hqzlBMIJ/F+0iW4MagC0=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a85d0a67-6672-418c-bdad-08dc68783336
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2024 18:14:24.5999
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5ENG9yhoP7gW8mOKWr2dLj6u+XOqkhplg99hUSFC+cHu82FBt8VZwys6rkUq3iucH+GbFBb7IZCzAOj5cbNrXg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB4846
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-04-29_16,2024-04-29_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=937 malwarescore=0
 adultscore=0 mlxscore=0 suspectscore=0 phishscore=0 spamscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2404010000 definitions=main-2404290118
X-Proofpoint-GUID: fFPncczhtgY6GMARi8FGzjkeREPY9Tcw
X-Proofpoint-ORIG-GUID: fFPncczhtgY6GMARi8FGzjkeREPY9Tcw

On 4/29/24 13:22, Kris Van Hees wrote:

> On Mon, Apr 29, 2024 at 12:42:36PM -0400, Eugene Loh wrote:
>> I'm confused what problem you're describing here.  Are you saying there is
>> an opportunity for the verifier to do better?  Or are you saying that the
>> actual computation is incorrect?
>>
>> So far as I can tell, the actual computation is fine (at least with
>> 5.15.0).  Specifically, if r4 is assigned 253, 254, 255, 256, and 257, then
>> after the +=7 and &=-8 I get 256, 256, 256, 256, and 264, respectively.
>> That looks right.
> That is not what I see on my OL8 UEK7 (5.15.0-based kernel).  It calculates
> [0:262] as bound as shown below.

I agree that the verifier is bounding the value as [0:262].

The distinction I was trying to make was between the actual value in the 
register and the bounds on that value used by the verifier. E.g., let's 
say we do %r4=%r6.  The actual value in the register might be 255, but 
all the verifier happens to know is that the value is [0:255].  After 
the "round up to multiple of 8" operation, the actual value in the 
register appears to be 256, which is correct. Meanwhile, the bounds used 
by the verifier are [0:262].  The actual value (256) is indeed contained 
in these bounds.  In that sense the bounds are correct.  But I agree:  
based on the information on hand, the bounds could actually be tighter:  
[0:256].

>> Now, [7:262] & -8 = [0:256].  So when the verifier bounds the result as
>> [0:262], it isn't wrong -- it simply is not as aggressive as it could be.
>> It should be able to bound the result more tightly.  Is that the issue
>> you're talking about?
> Well, in this case it ought to be fine (and it is on kernels other than 6.8.0
> of those that I tested), but that is simply because you use %r4 as upper limit
> for a loop condition.  But if we were to e.g. use that value as iterator value
> (which is what I am planning to do so this works on 6.8.0 also), then it is
> important that %r4 *is* a multiple of 8.  So, the more inaccurate calculation
> that the verifier does here *can* cause actual issues because the value that
> is calculated is not correct.  That would mean that values calculated with the
> use of bitwise operations like AND cannot be used as actual numeric values in
> all cases.
>
> That is a real issue.

Sorry, I'm really confused.  I would think that there is some actual 
arithmetic that gets performed at execution time using values in 
registers, while the BPF verifier is acting at program load time doing 
some static analysis to bound values.  Those are two different things.  
Maybe this will help resolve my confusion.  Are you saying that:

*)  at program load time, the BPF verifier allows unsafe programs?
*)  at program load time, the BPF verifier forbids safe programs?
*)  at run time, arithmetic on register values produces incorrect values?

>> On 4/27/24 21:35, Kris Van Hees wrote:
>>> So, I found the following in a BPF log on kernel 6.8.0:
>>>
>>> BPF: 799: (bf) r4 = r6                     ; frame2: R4_w=scalar(id=8,smin=smin3
>>> 2=0,smax=umax=smax32=umax32=255,var_off=(0x0; 0xff)) R6_w=scalar(id=8,smin=smin3
>>> 2=0,smax=umax=smax32=umax32=255,var_off=(0x0; 0xff))
>>> BPF: 800: (07) r4 += 7                     ; frame2: R4_w=scalar(smin=umin=smin32=umin32=7,smax=umax=smax32=umax32=262,var_off=(0x0; 0x1ff))
>>> BPF: 801: (57) r4 &= -8                    ; frame2: R4_w=scalar(smin=smin32=0,smax=umax=smax32=umax32=262,var_off=(0x0; 0x1f8))
>>>
>>> And when checking kernel 6.5.0:
>>>
>>> BPF: 791: (bf) r4 = r6                     ; frame2: R4_w=scalar(id=8,umax=255,var_off=(0x0; 0xff)) R6_w=scalar(id=8,umax=255,var_off=(0x0; 0xff))
>>> BPF: 792: (07) r4 += 7                     ; frame2: R4_w=scalar(umin=7,umax=262,var_off=(0x0; 0x1ff))
>>> BPF: 793: (57) r4 &= -8                    ; frame2: R4_w=scalar(umax=262,var_off=(0x0; 0x1f8))
>>>
>>> And kernel 5.15.0:
>>>
>>> BPF: 799: (bf) r4 = r6
>>> BPF: 800: frame2: R0=inv(id=11,umin_value=1,umax_value=256,var_off=(0x0; 0x1ff)) R4_w=inv(id=12,umax_value=255,var_off=(0x0; 0xff)) R6_w=inv(id=12,umax_value=255,var_off=(0x0; 0xff)) R10=fp0 fp-8=map_value fp-16=inv4774451407313060418 fp-24=map_value fp-32=map_value
>>> BPF: 800: (07) r4 += 7
>>> BPF: 801: frame2: R0=inv(id=11,umin_value=1,umax_value=256,var_off=(0x0; 0x1ff)) R4_w=inv(id=0,umin_value=7,umax_value=262,var_off=(0x0; 0x1ff)) R6_w=inv(id=12,umax_value=255,var_off=(0x0; 0xff)) R10=fp0 fp-8=map_value fp-16=inv4774451407313060418 fp-24=map_value fp-32=map_value
>>> BPF: 801: (57) r4 &= -8
>>> BPF: 802: frame2: R0=inv(id=11,umin_value=1,umax_value=256,var_off=(0x0; 0x1ff)) R4_w=inv(id=0,umax_value=262,var_off=(0x0; 0x1f8)) R6_w=inv(id=12,umax_value=255,var_off=(0x0; 0xff)) R10=fp0 fp-8=map_value fp-16=inv4774451407313060418 fp-24=map_value fp-32=map_value
>>>
>>> This code is supposed to round the value in %r4 up to the nearest multiple of
>>> 8.  So, if %r4 is 255, one would expect this to yield 256.  Yet, it does not.
>>>
