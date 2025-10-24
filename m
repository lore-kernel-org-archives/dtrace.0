Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 368A4302CD5
	for <dtrace@lists.linux.dev>; Fri, 24 Oct 2025 08:18:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761293926; cv=fail; b=Uoanj4YgTgr0QC9XWy/S2/9pd1axH8HHNvvhxSsC1U3Onhcz/nojHRpYKFDgWTY/tGBbjrPPILza8z1tFil4y+f+tk5Qfu6OGBLVrLer/b56ItOkMM2GfilMekl/6zC8MoUgh0UhD7Uvl1whGy5zAZzXSIdYXGilhizjgOcQ7fk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761293926; c=relaxed/simple;
	bh=ib4dTKFHzo8ozKJU+tgFkrWYcl5EfKuTO4brctCuv34=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Xdg377Tav7S+XfvVAtxXLLMe02ga5/D/ecZiJZ7jww/vHFMDGKh1PrFf7EJXZDih//B47knYAEeXcpa3VHX986JSmAhhGPmo76NU2facK5ZEcsDLgYdO5Mu3ftQOM9btxkxC4w1Tc+pqy6pLsk5gOuIibR5MR/Q7B4J9DeBwtmo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Hatw19cB; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=C4gea+MH; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Hatw19cB";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="C4gea+MH"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59O3NO5X029133
	for <dtrace@lists.linux.dev>; Fri, 24 Oct 2025 08:18:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=EveAmoVuIrVZHG2q1q0Dxj0MhQfftub2jtkUyOYYfE4=; b=
	Hatw19cB3780/2ASSnb/VjuvGLt8Mnzr7tDfRMcVikYpRPd35EgVHaF4iX9oIRuI
	wkjrnYrtE9XHdtsK+Q7Xx8p41XCdJcuIgfYCXHvYvE2uRbjMRsvDan7iJxrrjvVz
	xz9voybzwJWUsloa2WEcvxvjdZaFGftQygbT/3GJFTcKqZfgsf4SqxHe+lDiYayV
	cl7iPQ9GINHohkHaZmgStDMVbUtKxHy1iOSBtDBmJgDVhHTR4rvq/LXyogLW+Gox
	N0eZOb20+DBuX7b43PcudSjPvKeDBpygfNndYvGfMC+RUB7W0x19WAuGch+nrmox
	qrEJJkJ4fHQS2H1YEn8K5w==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 49xvd0v67g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 24 Oct 2025 08:18:43 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 59O8F0S7012109
	for <dtrace@lists.linux.dev>; Fri, 24 Oct 2025 08:18:42 GMT
Received: from sn4pr2101cu001.outbound.protection.outlook.com (mail-southcentralusazon11012042.outbound.protection.outlook.com [40.93.195.42])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 49v1bfupbm-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 24 Oct 2025 08:18:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Fik2WWY7Fa3OOqteRoxjQUvgiwhmvylEo7B9MANYRiau599a65bsbuiS8N0kxOG8zEZ6TjHAG/vwT7uGeF/bX1u0IqEyGHt6g7f8A5URorVRsSCVXvVK1wPqmYU8B+xhwO9+PZRBW24XfpjPOMPhwxJFqogaVXvURTUobTWyKFyHoeaMx/NEGq7W/Viym5dP+vwS+VdG8r/4qkFhioP/v3Z+h3QIIQmtsrI4ak993Zm78Zgcz7WDyM0bmN3K7NJFDtG6J9DOZKSt0BIvmRs9wTuPKoJsaLVf1Kim970JoyjjS6AkNFh2yssDO+b8w41kzSx/uT3E3IrC83P6rh9raQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EveAmoVuIrVZHG2q1q0Dxj0MhQfftub2jtkUyOYYfE4=;
 b=g/0SmIIz3zbG7iIuejRiwR6ONKKeopvu3vfGvPEbctkAoaRTXeG5Ie9pzQoAHQpp8QByS3j2o2Zba3NmvTugOLRPjRpCQnm6LBvfrkWa8AKWqNB20CBLpMVByfN5qzJZ9e5oWzPJE++Ht14f8n3pfJEdvefBX6RIpHVs5dd9n93bjGQwgx/eWpwJTGf2DADjBDwljd3CrH+p9suFBHbXY4QuFn1f1NsjX9q4YuXAXWzOIFzoCjGGJanVXMpdQ7NBrOL1f9JjoZ4jMjya1CLTj+cHHP44UN7KB6srORgF9hFhWtgzZjPn7irs4QiV2KEnwX6XpEfKTaFO6T2QE1gFSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EveAmoVuIrVZHG2q1q0Dxj0MhQfftub2jtkUyOYYfE4=;
 b=C4gea+MHFUkDIqLj6NKH8MOKQ9hUKDbzmL2Eqpp9H9kjDuZsWvB0fEbH/OWolECiTVyFgqhDwUouvMnP0VwzR19cUXxniC9qBigIWJkIFbo/E1xih0gE5Bxr3EgdseamEQ0u8TMsWPCwmbPByHaWYWI44xsLJamTqCQcsiApMWk=
Received: from DS0PR10MB6271.namprd10.prod.outlook.com (2603:10b6:8:d1::15) by
 SA2PR10MB4537.namprd10.prod.outlook.com (2603:10b6:806:116::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.12; Fri, 24 Oct
 2025 08:18:40 +0000
Received: from DS0PR10MB6271.namprd10.prod.outlook.com
 ([fe80::940b:88ca:dd2d:6b0c]) by DS0PR10MB6271.namprd10.prod.outlook.com
 ([fe80::940b:88ca:dd2d:6b0c%7]) with mapi id 15.20.9253.011; Fri, 24 Oct 2025
 08:18:40 +0000
Message-ID: <c2614d3c-34fc-42dd-a9d2-01f6f570a10d@oracle.com>
Date: Fri, 24 Oct 2025 09:18:36 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 19/20] doc: Add UDP provider documentation
To: eugene.loh@oracle.com, dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
References: <20250926190557.8485-1-eugene.loh@oracle.com>
 <20250926190557.8485-19-eugene.loh@oracle.com>
Content-Language: en-GB
From: Alan Maguire <alan.maguire@oracle.com>
In-Reply-To: <20250926190557.8485-19-eugene.loh@oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0297.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:196::14) To DS0PR10MB6271.namprd10.prod.outlook.com
 (2603:10b6:8:d1::15)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR10MB6271:EE_|SA2PR10MB4537:EE_
X-MS-Office365-Filtering-Correlation-Id: 445fe314-7ca9-4559-61e4-08de12d5f045
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aGVmVnVjYjRLMks3WkxXZ0VDZTI4UkgrZVc1ZDFmd1JRcHFQTk83OGV5dUs1?=
 =?utf-8?B?S1FROS9hWWtjOHFEQjZUMDJIZTdqdFFlZDVJajRQdU8vWU0rNVkxaEhWQTY4?=
 =?utf-8?B?dnFPOEZNSm5hQTZ2WkFPLzNYdmZkZ1Y4cGRocGRJM3lzTW5vRldla28vTm1Z?=
 =?utf-8?B?RmxTQkdvMk1pcVFIL1dBQlFqWTUvemY1ZmVDUHFuNWM5QmhnQ2dUL1Jaa0U0?=
 =?utf-8?B?TS9wYWxURCtVTWpyVkg2d0Fmb3lWR3RNalBzbWd6eGd0K2F1WUhkaW5GRUVl?=
 =?utf-8?B?TUpxRFNjNjdmZ0pOVndLaWlRWndHT0wrQ2I3ZWhVM1BUbWhPZXJJS2F6VHpa?=
 =?utf-8?B?QVV4NlY3ZmUvdHg3ODJXK3dsT3B3SXlSMFBESU9RQlROMktwZlRUU0Z4ekJB?=
 =?utf-8?B?RHF3UVhvZ2hlZExqcFhzaWhDMlNVMXE1eW9tTngrVzMvUlZkemIyRFZmTnFq?=
 =?utf-8?B?bUxsSU1nQ2lZYVhnRTluOFFUTUliWElFSFRPWjdZSmgzcjZhTEdlY2xKUzNM?=
 =?utf-8?B?OGN2RzB6TDI4SUJ4SUttUmpmb1ROUS9RNm5Wbi81WG9tUThBbDVrZU1OQ2F3?=
 =?utf-8?B?Wld2MVNEdjBjZGxGbnpWWXV4OUZiSnBIZ3lmMkZVM1Rwc1VNeDBWeGZOOW1k?=
 =?utf-8?B?Tm1nNHkxWnFZWGt5ZjVRRUdtdkN6Tm1qQm5xTTdXdGNETlRvUkZpQWE3NnJu?=
 =?utf-8?B?L0NOTk9SR2g0U1l0aGtoYUppRGZYWEg3RC9rN0cyMjd2VkFzZEdId0h2V0w1?=
 =?utf-8?B?M2MwdHROQVRkNElBSHdyeXFON1JPZlk3Y0MyYWI2SGtMbmM0VHB2clQ4Q055?=
 =?utf-8?B?a2ErZXd3eEpRS2JMQVJJUFBPcnNKTjlVZHJiUUdPTEZQeEpraUQ4RXlXOVpl?=
 =?utf-8?B?elpwR3cvREp4VGJCU1FzeFNUSjNxdEdoNSs5aFdzcTNVY041NThLN1JkV3Yx?=
 =?utf-8?B?YUxVK2RpTzN1anBVY0hHR2xCSzhIMTNGUUowc1JoU2FBWjNEVzdMLy9ueGkw?=
 =?utf-8?B?UUVXVUtXcy9yOWRQTWNHZ0pzeEVDZTB1TFhxTnRXMWNGN2MzUWduR2trRTM4?=
 =?utf-8?B?NVd4ZTh5Z1BPZ3B4WEVXU0o0cGp2bXBJQ0F2OTkwdHRIemxNNE5xNTN2TkxE?=
 =?utf-8?B?WU1lZ2YzeVk0dTA0NGh3dE8zOTFqK0FSaVphelMzRkRKdGsyQTZnUFQrK2pB?=
 =?utf-8?B?Qk1PcFJKTFdFRjU0REJoS0E0Q3Q3aGtMbVhwNFJMUTRLRDMySUU5Z0RyZzFM?=
 =?utf-8?B?M0RjTW4vVE1qSCs4UmI5MDNjTzlDTmNmUDJKdXZESU5oQ3Z3QTNiSTlMZkJ1?=
 =?utf-8?B?RFNCQWpKejExVWpUcGJCVnhHTUwwbm9xdldxd1E2VThZRTNJU0FHMXI3V3dw?=
 =?utf-8?B?c0V6TFhDZTVuN0Y1Ni9pZERGdmRkWktMb1RHaVBoQ0loYU5Pb1hzaWhtcnlL?=
 =?utf-8?B?N3V2QmJ6R1RKcmQ3Um92N2dBQjdycmJrNDJPTy9tUC95dVhnTllNWHVKcGtC?=
 =?utf-8?B?TTFIbVY3WGpNc2Y2dXVSY0tDRlpycG5jMEhpQUsrVGNuMWRncTdBTVFyeW1G?=
 =?utf-8?B?RkZQZFZUdzdrQ2JSNEN3NHNORm1MZWdYUUpaRmpoRGo4dm9LSTNEU3Brc0cy?=
 =?utf-8?B?WnZ5ckN5OTZCL1BOOGxmeTlra1FZTGJlanhKeHJheFlMdVFmSitWUVhCWEJO?=
 =?utf-8?B?dlFJRkFsRHlZOUJtaGdObldjZ1VQYVRxK2tNRS95TlhtYzh5L3NSNHZiSDZs?=
 =?utf-8?B?akErQ01Hd0R5MjNJQ1lNd0RNOFg5UDEyMjJCNm42Z0RkUHNMNEFGNTh4NFJZ?=
 =?utf-8?B?Z3padGtsVDRvNjBkc2RzRGRaNGEvWitzdXVIN0tWWGZnZmh3NEx6YnFPTm8z?=
 =?utf-8?B?THIrS0swRW1vY29JV1RKbWVudEJLOHhqUE9uRXV2ajVzMnZyZWtHMHdwTVNj?=
 =?utf-8?Q?DgzaqXsZ2tc9B+u04E9Rd7ftYC4mBXBw?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR10MB6271.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NnA2NDNzaVgxU2NOcURGZUVzM0o0dnFCQ3p3VlI0T0QwVjNjNS9ad2ZhRU9k?=
 =?utf-8?B?RXZvdlppNlNpc0hxTko0eGFoNElmanczVDVpa0JYVVhBZzFDRW9RYjRCOTlM?=
 =?utf-8?B?NlRQbTYxVk9OS1NYcklRR2NwMzFVZDJmc1RFc2cwcmpJelFGN3pFUGIvMDJC?=
 =?utf-8?B?bjFkeFVmQlVnMVVyYVc1Vm9ZT0hUdUJUSmdJV3NhWExOS0MrMVg5SWlTbitC?=
 =?utf-8?B?NEFZY3dYZEZoczJRR1c1SVVQemRlVXR0MkJ0T0lnNkhuMnF3T2h3SEMxQ3BK?=
 =?utf-8?B?aXBKK3BYNGMyNHUyVVRqS054YkQ4LzNyT1lmblVoUzNRSEsrNkdUTzh3aTdU?=
 =?utf-8?B?amhTRzBjMEZtTUNDNUQ2T1p2UDhKaFJON3RHUjhBNWFZZnZNS2ZpeEZmSzlK?=
 =?utf-8?B?V2VQLytqbGZDeU1YSXdwWjRqMkpPVkF4K3hvYWwxY2xHUXJlcE55TlRmaFpT?=
 =?utf-8?B?TTByeUN4MExGTUd1SHJVNzFrYW0wZDU0aXdDblJiTFVVaWxqV1BSNXZHR2pp?=
 =?utf-8?B?VGs1QnZOMEduWE1haWVWTmJIbHVrVEFvNFI5dlJjMFZiSDVqMS95bCtaTmJt?=
 =?utf-8?B?Y0ExcDA5dnN4K042Qk1ESmhDdGNQV3lDS0RHYTNwcnVaRGpNb1R5V1VVTFZm?=
 =?utf-8?B?Y0dLeGlKbnMzeWp2aGlrcGJUWVQ4d2kwT0l1Q1JGUXRCNXh0cFJyRDFlanF1?=
 =?utf-8?B?K0d6MStXVmF5MmRWTGR5NVpselZEakNZL0xqZTQzdEJKbzcxZ2Z4T1FDc0tU?=
 =?utf-8?B?YTBpakkwcVQ5OUtpVjVBNXlyekRoeHExejZsckZiSGpXUnVSeEovWllJNFFH?=
 =?utf-8?B?US9ySVpLS1ptcm5FWHJRRkZ1TGJyY0wvU0hlZkhxTmFzbHBsMjdqT2NpbWRF?=
 =?utf-8?B?Z29oYUNPRVAvNUJPQnpwV2pJMzhGdEovRi8ra25TVmd6bGZFRVBvQmcwS2ZB?=
 =?utf-8?B?cEY3YlR0QS9WcTFuYnBobkR0Vk8zV1lCcU5iY1R2c1ZQa0xnbE1hQlJYc1Z3?=
 =?utf-8?B?eENLR1dHU1hSbmRFUU4vek9wTWF4VkRWZUZLV3VaSDZKanAzVGxCeVpYMzdU?=
 =?utf-8?B?UHhtanJCZngvOTVkYlVidzlwWmdPZWxPT2FPR21Ec3Nwb2tVT1NPZGFza0NE?=
 =?utf-8?B?dFRqUUoxWVk2eW50V0o4QjBqdEV1ZzZUcUs1L2h3WmtZZjRMWEpWSkk4bEpj?=
 =?utf-8?B?Y1pnU0hlSlMwMUtvbjVXWnZVRVZmdzZmcStydWI1ck1nQmtaV1hlaEd5bEJm?=
 =?utf-8?B?YnZlVWtibDJ1Zkc2R3Z3b1FYQ2VReERpbXRlQk1Oa09ENUtseVoyZXlRclNH?=
 =?utf-8?B?REMvVmdwWG9VeW9xRFF6Nkt5ZjBSc0Fpb3VjM0VmMGxSZnhwN0JJVnh2aWNP?=
 =?utf-8?B?Ynl4bjg1dGlybWUzb1diVDhUdktCMTZwTlNZcWpWNXNOMjVKNVhsVjBmaEhq?=
 =?utf-8?B?UzVlb25YK3BXMnNWTDRlUitYVjBjOVJBU2NTTmd1aWVaOWF5VVFtM1dXdTA4?=
 =?utf-8?B?d3FWV0pielVOdml6NUZ6UVZISVJFS3ZnWDlyMlF5WWt1a3h5SS9lMnI4UVh6?=
 =?utf-8?B?SEF6RnIzMkRVdkVndXJZdlhSc0RUWWhVLzBPV00xVXJqd2lCeE16UW1ETURs?=
 =?utf-8?B?d1IzMnNvR08rdG1pUXREYkdvQmZFeUxYdjZFMG1OZUhxMXdhS3VFUGxoZlNn?=
 =?utf-8?B?RjdML0VSWDFEU21IU0lIdFB4VnN1ZmgzVVNQODVuZGlmVk5ocStYTmZubFJj?=
 =?utf-8?B?RVI0UW9VdUlHK0V6alEwZlFiVWhsUi9ZR0Z4c2tlVG1ld3lqVS9tRWIvbThH?=
 =?utf-8?B?bXI1clF3eW83WVJIWFU0MHJmdG9Rb08xOENmVHVaQnZ6d3FpYWtnYkVIMDht?=
 =?utf-8?B?bnNmRFVESi9EZmpYbjg2OFFmcndYUTRxdWMwNEhOTTZuNVRkY0I0N1dSU2Nv?=
 =?utf-8?B?WnhQU3ZKd2d1WnhlSEtDaUNJWGJ6VEF1dGVpeUxmWjc5a3JtRmJtMlZveGlY?=
 =?utf-8?B?dmhBMkVVelFIcVo1ZUJxVlVzdEZBbEJpVTJQdVZYbWhWaVFBYXBLVXYzYjl6?=
 =?utf-8?B?Vm9zKzcxQm1BUEJxVEw2a2lMdmhvOXkxOWQvSmo4VnJyaXZja21uSzRHNEsx?=
 =?utf-8?B?bnlhMWk1UWZHMjB6dkcwTHZVVVJ4YXZxTUNzUkhUbG5kaHZaM1o0d284UG9N?=
 =?utf-8?B?TEE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	oCFoWjdxzX8pDh354DJlY0rlQBMWbgUzPjQ/vh8ggRo7LixBNYRMJpy1/Et5iQLw6Ptikm1ZfWH7jxGoM1rb3Lp1tROK7pMMzLNXrfEHVimIEGMdXUzr27D1nL+EOnBzu4MaGsSqKmaiKVVFXz1I+APaT2nd9/8tRs/yJpqk+4GS9+HnznaVY4X1vkZfo4LXURQUSFuzPL/dTOZMwgSaJNMaOTKYZXiRFrHDXhwLHIXBXrhqsyTN8H9XIX3qNCjiv9jvcnmsRmYQsndbfgBiClkitoHHhMcZITJpMVhxOHiwoYZzuQZcO57BUjV4LEOtRuNU5kNcclzgl1o2Yg5TAUEc7cN9vH/ptRvGMpep+2E2LoOHIwloYvzFi1cQY70kJS+WrLHGhj712R0en5Gz0hn/fifuBbNUh735qVje3MvlkH7I9GElOxdR+JOYONg307t5MbUdoFPxL+WU/us1FeW+nuaLGbegkhqamMpWzxMyiooCH3VpgJ0jhUQVHF53+9nDpoPT2ljU4NfXLP4aP/kfUHS65jqoKLKDp4t8wymvZSAudNWBBkFfiiMiMod7SpiogvOcY0PfYgHmRoj63ZbuRqhMJRjGOziGWTEcV44=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 445fe314-7ca9-4559-61e4-08de12d5f045
X-MS-Exchange-CrossTenant-AuthSource: DS0PR10MB6271.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2025 08:18:40.3023
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rzqeDuMtUxv5mlM7AVJdowCnXWQ97kGGHkXAVl9PFRGYN4E2h0WJ+Mma34tiN8q/e/dhjkNFUuBIXOS77mSNmg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR10MB4537
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-23_03,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 mlxscore=0 suspectscore=0
 malwarescore=0 bulkscore=0 phishscore=0 spamscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2510020000
 definitions=main-2510240072
X-Proofpoint-ORIG-GUID: 0zc1BSz9Oy3CrAuc0eT0ILlhfRbA-lPM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDIyMDA3MyBTYWx0ZWRfX6/HjbWuCJ1wQ
 JZZ6igJHD53O8j/9Jue5xK39EnBGIkrIVaJp0psEDmsWOBAi8EhXlwCmHMpuj5TIaK51nt8NISd
 44mbY2DCcAiGwGb/ldr9YX2ed4vlhx4EUz5l/7UsUY7gbWOqUoOFi5Q+si3lmT9RyOW/ORg01+d
 uyHgVqHjq6E/XnCKP4y9k6N4E+5jYEK+h4k9kfIkNPs+Ynb4fZ02YS5k3C5Df2PqQD3lhgTp7fm
 RI/pJ819b3VTtGGM5PzFRLl1hiuEp/fouskzMjRwP5uJ1HGlzKAhAL0OoxqesV3TbBt/jfZ1sB2
 dlgxvO2UvbR0JOigb2yRm4qA+Sup7KX468/aLaqGgHACrlW3ymtJXhfr2EGOxdUyVZtng/J7Dma
 F+dzJe7ZYIlRowVDuoZPEBJuNGmEGQ==
X-Proofpoint-GUID: 0zc1BSz9Oy3CrAuc0eT0ILlhfRbA-lPM
X-Authority-Analysis: v=2.4 cv=D9RK6/Rj c=1 sm=1 tr=0 ts=68fb3663 cx=c_pps
 a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=x6icFKpwvdMA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=yPCof4ZbAAAA:8 a=UL5gMqgb7pN9TFoLz0sA:9 a=QEXdDO2ut3YA:10

On 26/09/2025 20:05, eugene.loh@oracle.com wrote:
> From: Eugene Loh <eugene.loh@oracle.com>
> 
> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
> ---
>  doc/userguide/index.md                        |  6 ++
>  doc/userguide/reference/dtrace_providers.md   |  2 +
>  .../reference/dtrace_providers_udp.md         | 77 +++++++++++++++++++
>  3 files changed, 85 insertions(+)
>  create mode 100644 doc/userguide/reference/dtrace_providers_udp.md
>

as per IP provider I'd rework the table to have a line per probe and
column per parameter.

with that,

Reviewed-by: Alan Maguire <alan.maguire@oracle.com>

> diff --git a/doc/userguide/index.md b/doc/userguide/index.md
> index d47df094b..4eb682a8a 100644
> --- a/doc/userguide/index.md
> +++ b/doc/userguide/index.md
> @@ -266,6 +266,12 @@
>              -   [tcpsinfo\_t](reference/dtrace_providers_tcp.md#tcpsinfo_t)
>              -   [tcplsinfo\_t](reference/dtrace_providers_tcp.md#tcplsinfo_t)
>          -   [tcp Stability](reference/dtrace_providers_tcp.md#tcp-stability)
> +    -   [UDP Provider](reference/dtrace_providers_udp.md)
> +        -   [udp Probes](reference/dtrace_providers_udp.md#udp-probes)
> +        -   [udp Probe Arguments](reference/dtrace_providers_udp.md#udp-probe-arguments)
> +            -   [udpsinfo\_t](reference/dtrace_providers_udp.md#udpsinfo_t)
> +            -   [udpinfo\_t](reference/dtrace_providers_udp.md#udpinfo_t)
> +        -   [udp Stability](reference/dtrace_providers_udp.md#udp-stability)
>      -   [USDT Provider](reference/dtrace-ref-StaticallyDefinedTracingofUserApplications.md)
>          -   [Defining USDT Providers and Probes](reference/dtrace-ref-StaticallyDefinedTracingofUserApplications.md#defining-usdt-providers-and-probes)
>          -   [Adding USDT Probes to Application Code](reference/dtrace-ref-StaticallyDefinedTracingofUserApplications.md#adding-usdt-probes-to-application-code)
> diff --git a/doc/userguide/reference/dtrace_providers.md b/doc/userguide/reference/dtrace_providers.md
> index 029f62c54..450adf9bb 100644
> --- a/doc/userguide/reference/dtrace_providers.md
> +++ b/doc/userguide/reference/dtrace_providers.md
> @@ -31,5 +31,7 @@ The Statically Defined Tracing \(SDT\) provider \(`sdt`\) creates probes at site
>  The `syscall` provider makes available a probe at the entry to and return from every system call in the system.
>  -   **[TCP Provider](../reference/dtrace_providers_tcp.md)**  
>  The `tcp` provider makes available probe at different phases of TCP processing.
> +-   **[UDP Provider](../reference/dtrace_providers_udp.md)**  
> +The `udp` provider makes available a probe at UDP send and receive operations in the system.
>  -   **[USDT Provider](../reference/dtrace-ref-StaticallyDefinedTracingofUserApplications.md)**
>  Use the USDT provider, for user space statically defined tracing, to instrument user space code with probes that are meaningful for an application.
> diff --git a/doc/userguide/reference/dtrace_providers_udp.md b/doc/userguide/reference/dtrace_providers_udp.md
> new file mode 100644
> index 000000000..b3e0c3d2a
> --- /dev/null
> +++ b/doc/userguide/reference/dtrace_providers_udp.md
> @@ -0,0 +1,77 @@
> +
> +# UDP Provider
> +
> +The `udp` provider makes available a probe at UDP send operations in the system and a probe at receive.
> +
> +**Parent topic:**[DTrace Provider Reference](../reference/dtrace_providers.md)
> +
> +## udp Probes
> +
> +`udp` provides a probe for UDP sends and one for UDP receives.
> +The module name is always `vmlinux` and the function name is empty.
> +
> +## udp Probe Arguments
> +
> +The following table lists the argument types for both the `send` and `receive` probes.
> +
> +| arg       | type           |
> +| :---      | :---           |
> +| `args[0]` | `pktinfo_t *`  |
> +| `args[1]` | `csinfo_t *`   |
> +| `args[2]` | `ipinfo_t *`   |
> +| `args[3]` | `udpsinfo_t *` |
> +| `args[4]` | `udpinfo_t *`  |
> +
> +The `pktinfo_t`, `csinfo_t`, and `ipinfo_t` structures are described in [IP Provider](dtrace_providers_ip.md).
> +
> +### udpsinfo\_t
> +
> +The `udpsinfo_t` structure contains stable UDP details from `udp_t`.
> +Detailed information about this data structure can be found in `/usr/lib64/dtrace/*version*/udp.d`.
> +The definition of `udpsinfo_t` is as follows:
> +
> +```nocopybutton
> +typedef struct udpsinfo {
> +        uintptr_t udps_addr;
> +        uint16_t udps_lport;   /* local port */
> +        uint16_t udps_rport;   /* remote port */
> +        string udps_laddr;     /* local address, as a string */
> +        string udps_raddr;     /* remote address, as a string */
> +} udpsinfo_t;
> +```
> +
> +**Note:**
> +
> +DTrace translates the members of `udpsinfo_t` from a `struct udp_sock *`.
> +
> +### udpinfo\_t
> +
> +The `udpinfo_t` structure contains the UDP header fields.
> +Detailed information about this data structure can be found in `/usr/lib64/dtrace/*version*/udp.d`.
> +The definition of `udpinfo_t` is as follows:
> +
> +```nocopybutton
> +typedef struct udpinfo {
> +        uint16_t udp_sport;     /* source port */
> +        uint16_t udp_dport;     /* destination port */
> +        uint16_t udp_length;    /* total length */
> +        uint16_t udp_checksum;  /* headers + data checksum */
> +        struct udphdr *udp_hdr; /* raw UDP header */
> +} udpinfo_t;
> +```
> +
> +**Note:**
> +
> +DTrace translates the members of `udpinfo_t` from a `struct udphdr *`.
> +
> +## udp Stability
> +
> +The `udp` provider uses DTrace's stability mechanism to describe its stabilities. These stability values are listed in the following table.
> +
> +| Element   | Name Stability | Data Stability | Dependency Class |
> +| :---      | :---           | :---           | :---             |
> +| Provider  | Evolving       | Evolving       | ISA              |
> +| Module    | Private        | Private        | Unknown          |
> +| Function  | Private        | Private        | Unknown          |
> +| Name      | Evolving       | Evolving       | ISA              |
> +| Arguments | Evolving       | Evolving       | ISA              |

