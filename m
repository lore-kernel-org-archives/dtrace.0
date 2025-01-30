Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07CB41946C8
	for <dtrace@lists.linux.dev>; Thu, 30 Jan 2025 19:23:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738265000; cv=fail; b=BH00N8vKCN8LWBKOgHdR5v6XaViNDieUVGr7MZEa9nrcyu/0BDa3bA8nbmdnr9TJzBw3qo7Q9YXBXNLjkyjCNP099yVJFDyJJZUiZNw9aGwFI5BpHFSQ8vLU8nCZ562loPNclNkL0qCskB+czju3gj+IP7VlJG6cvGZCQAjcGmw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738265000; c=relaxed/simple;
	bh=FuoxosxmaUZz9hm14tWwTVttGPVCuBwWcDi3cHnijQI=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=RmCxbE9xForW3oYMuVT3KtL3ffCK0Fhin+9mzo0l1i3C57P5O1rCGvRpPjoGjpK0xGmChsaXML8absFOgCz6p8syDx0spJvQEmVtqcTrUoEWU6zoweV9SuTNuYUp62u2kUFPQhgNVy6AYWfSUM+s9vsBDShhaXbD0Vg8t8GRDZM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=oorPmVxW; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=rB+j6AXH; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="oorPmVxW";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="rB+j6AXH"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50UJ30od006446
	for <dtrace@lists.linux.dev>; Thu, 30 Jan 2025 19:23:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=phSkACkj6hf143+MFDTeox1msXhnvGy1SNPD3/AGXaU=; b=
	oorPmVxWG2W2wb3ekpT+EZCozeJDw9DMYjMDZ5V/WmOC7hMHONuCLubWKnqiM3VZ
	JG/CMjn5uMin1DdIYjLRM+ufGeYI+1h5aUuqYPCOstnxMGha8M1vGU0Dbv0Q10HF
	0acGl7hkyRCmcg9W2kFy/SoDCgIy5zdtSJuub3v7122JWnU+QBr4HLqbBK99Pydr
	lHUsLHXxHTmH8W7odFSpqC4/VeTn62gQzT+qX/aW7eo8IhthNtyQB0c1w4b0pDGa
	36tQqa7sZ4co1d8jpjkxryrTQXE2o2UeSDU2qvNulSXZJsfSgyEMccE9nkt+N7U2
	PRYxQWKhYBIEFUHYK+IVhw==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 44gf7kr16s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 30 Jan 2025 19:23:14 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 50UJ4j8l022397
	for <dtrace@lists.linux.dev>; Thu, 30 Jan 2025 19:23:14 GMT
Received: from nam02-bn1-obe.outbound.protection.outlook.com (mail-bn1nam02lp2049.outbound.protection.outlook.com [104.47.51.49])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 44gf928pmk-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 30 Jan 2025 19:23:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=il21Nxe6CC8LZE/ixbscCzqpSHUkpV1gg3fq6BywshjLaxr9swkVADak7Z2+bQkv6Gi1jYpAbNwvh7SJGp3zVIBKgv3tj+xLw9mhKLoPgHg7jK6vSOTaQdBbQiy9cXu+9hzkFCGXe6exeq+rRb2mVAjoeX/VVNLHLB3frzHdC4f80MsqdCP0If+pBU+4xJgXrmTDRV84jaJMcXwdR3708GYsevXtySdHFlEMvjgJeuZoRwsTjOVsRoZnswu5Ojr1mYR2wTo7vr5FsV0ZNOPnFguAiquZHDUsfzY8XCPBst/XiZca5a86xa3gounzDYf95HGeHmau+NdsnWgOyLRyug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=phSkACkj6hf143+MFDTeox1msXhnvGy1SNPD3/AGXaU=;
 b=m3xYs8VRWA1ItjvojQH1bRQBmb4wM9soaiHShv/mUHGz0gzKOvZRePetKHYozmyEM191fRn4q1N9lEENIvhBTRw/2J/UD7JkRoekiLrmALl+YXttFgllbr8QYPkMOi/hXR/g4Z3RUeKT4+uoe90kOUuKO1O8XSIEGZpZMAS1m0QOkmssO58x9iWyXy1ByajTyBZZGtd6OCihu6ImTYWQoxluZ+CTbHnh9VU3xDb6oZ7QOm4g34d0JvOV1sE5/l8sL71xcfjX6Wxx0BQEhivHHbshJaOuDOIHAjP/t/j0gu5ypTk09TcIT+Z1FWAHqPiw5unT5ftQ8+xz/cMssy09nA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=phSkACkj6hf143+MFDTeox1msXhnvGy1SNPD3/AGXaU=;
 b=rB+j6AXH7FxQwPEl3UxQFSyBaBBEMGvrkiYje3Y3SnkiZLw/5uSmiSkWVBUGfC0yPZp3nNPUcnDfF2z3XYulC1LLftfwZF1lfoCPRCAWJO9Hmsbh2c0AA7Tvf5CAWZR+CzHtUZKZXHjQXD1kErJQZWvHOv1AHsXg6CzpJhdiqbw=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by MN2PR10MB4224.namprd10.prod.outlook.com (2603:10b6:208:1d1::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.18; Thu, 30 Jan
 2025 19:22:47 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%7]) with mapi id 15.20.8398.017; Thu, 30 Jan 2025
 19:22:46 +0000
Message-ID: <b5896523-3248-fea2-3a02-ba13353c52f0@oracle.com>
Date: Thu, 30 Jan 2025 14:22:44 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [DTrace-devel] [PATCH v2 4/6] procfs: implement d_execargs() for
 pr_psargs translator support
Content-Language: en-US
To: Kris Van Hees <kris.van.hees@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
References: <PH8PR10MB6337029F91AD9127B9013409C2EE2@PH8PR10MB6337.namprd10.prod.outlook.com>
From: Eugene Loh <eugene.loh@oracle.com>
In-Reply-To: <PH8PR10MB6337029F91AD9127B9013409C2EE2@PH8PR10MB6337.namprd10.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR13CA0093.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::8) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|MN2PR10MB4224:EE_
X-MS-Office365-Filtering-Correlation-Id: 7e1df92b-05aa-43ee-5557-08dd41637a4f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ajdlV3p0Mzd3SWkvRDBnUUl0S1Jobk9EN3Y3T3BzYU1iWmhRUTFUNElIR2Mx?=
 =?utf-8?B?TTJHdWdoUHJvMGJTeVNtT09yMGVPRjRyQWpQWmt3dVU1MDJQTGxPT1ZxV1JY?=
 =?utf-8?B?a2RFVDQ5MzJVWDJNd3VMdmFKMnZkTDhJUHArRTZ0aGlBZ2VJeXFhRDJzNTBw?=
 =?utf-8?B?NjFVUmFjSGx0aWZxZU5mbUN3ZDN5SUgzZzJTUk4zNklxOUxEemg4TGRnNzBn?=
 =?utf-8?B?RzJPeVF3eVJjc1k4NFVxQWRhQjg1dmxqVzVJNktLT1hpN2pFVG13WG13bUFo?=
 =?utf-8?B?bUgzWlZ6SnFRU0N1ekk1NE1vaDc2Q0xxRG4xYmloV0lwWGpBZEpkM2cvU0hQ?=
 =?utf-8?B?ekNVMXE2eDlnUWZyQWR4d1B5MWVsOWZPK1RSRThiZEFCYzFnWW5rVmJIQzZS?=
 =?utf-8?B?WGZxczlhSE9CbUdoNXdYNTltZXJBb1hTSUc2WVNyaWwxcXNGbkJDY29nQ2k0?=
 =?utf-8?B?WWV4UGZPWjJJb0IwbHllK2RoVXU3dzhlSExSQ3lkbVZTanF2aFQ5WCtJRjVI?=
 =?utf-8?B?djJpRlJMYUh6MmUzdnRxQ0xZbzcyOTBrM2E3eGhPcVhlSExzcFVNSG5kWUJQ?=
 =?utf-8?B?WkZRL0h1aFd2V3pWSFhQekNsdFVkUi9nN1RhTmZJUlIzakVYQVZsWkNuL1R0?=
 =?utf-8?B?TFJQbUI2dlVod0VKT3lZWGVaeTRPWmNUcmFROUEzWGVDMjgxV01xUVcvWmtE?=
 =?utf-8?B?dllkcW9UbEVJRzFuaks5OTJZMkRTaHpOR3htRzA4Z3lsT21Fd3JsNXNuRUlu?=
 =?utf-8?B?dDZzbWRCenhrbWxBMlhsMUc4SkRsWXJENzFkN2VaTFVFSTFPMUpuRmFmZ2Uz?=
 =?utf-8?B?clZVN3lib1RHTmtmOXlkeHBSRDJUWENmN3R1a2hwbFhuSkNQWHhpcWN5Rmha?=
 =?utf-8?B?YmVxdVFzSDJ5empSQUtncWZGdkpvWUxoSk9TQ1BNYkJwWUM4ZE53TzVtMU9a?=
 =?utf-8?B?bzc1UWpacmkxT2lmQnhib0d0T2R3QnAxUnhVVmhGZ0lHV3hDejFKZmZpM3Fs?=
 =?utf-8?B?YkpNVnMySXhJQUJ2M2ZXWWVzNmNMTXByZ2pVeGN3U3NnNWp6Z0VicENxTVA3?=
 =?utf-8?B?ZTVvMmQ4eE9mbUZsZFRQSzBaZy95WWJMdU1qQkd0Zk01aFJmbGlaUnBTcjh5?=
 =?utf-8?B?bDZEQjdXS1NIZW9TM1lNQ0Nad2I3ZUloemVpQmk3NzdIUVZUVWRadUVab0ND?=
 =?utf-8?B?ZkRmQnlNb2NuRWxLeTdXSjhGd1MwQ3FrSHlTWFZHanlOMjlBaHhqaXpuNE02?=
 =?utf-8?B?QVVvTktzVjV6YTFmTklVMEhvOEJJYng4bE9EMXBrVVBDblhUdmZwYVpOQTRa?=
 =?utf-8?B?RFdSUGZWdkV6QmtrTHdRWUp3MFFuSER1Q1RKV1NwS1I2U3pkcGRsN093N1Y2?=
 =?utf-8?B?T1pvWHptSENXblRFYkJNS0s1clczZlN6KzhPQzZLUkhnc1NEOTF5MjJJb0lD?=
 =?utf-8?B?YjhnTm0wWWUzOE4zMDNycFRWQmNkWDRyQjVoeXJXbWIzR2RrVnBMZ1MwRGVa?=
 =?utf-8?B?cnJQUlh2KzZBZUhZTHIzZHkycG1jejhRRkt3cVpLOTVwbUZkTE14Q3U4QUN0?=
 =?utf-8?B?MlcrdDVWMDdSS1ZkNzlUbXpXYlBZOGVkOHdpaUJzWEQrSVlFR2dFTGlvSTQ4?=
 =?utf-8?B?TEdFZmFaTDNiVnVhT2taNU5jMlhFRjVVRDhMYnlrNHhOOWl2S1VTZUtWRXlX?=
 =?utf-8?B?OS9KcWFxeU85RGVRSm5HMk4rZ0RURU44ZE9pTEdUWDA5blFVQnEyUm0ycUFh?=
 =?utf-8?B?Y2dyUHNoTEw3TkUrcldhb3lSWkVOOTZOUFcxSkRDdWJLdTlnNERQM0I2VEpZ?=
 =?utf-8?B?OFhsVUlPVHYzcFVreTB1Zz09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aEx2NWY1OEVnWFpSWFR4UVRrTlhGVTM0bXJyd2lhRklseVRzV1RIMzJ1YU9M?=
 =?utf-8?B?TlEyd25TVlhaeGV3TmdLVkVqNnphaVZnbTlBWi9VZDdHd1Vva2prQTRGT0l4?=
 =?utf-8?B?N2VrUHVId3NObE9saFBrdlFlUkZyNmtGM1krekNPanlaUzRCamRlV29mY1RQ?=
 =?utf-8?B?b2t6dXBtZnpFSGE3R2RqSzdkOVRzdk1EQkxWN3F6Vm00dGFoeWxMTG1HbGJX?=
 =?utf-8?B?U3oxL3J1U0hObjcvQWx2Y3dTQmo2THovSHVpYUxkSTRNU0FDcjEvS2g4cld6?=
 =?utf-8?B?VXpsSHdKTmhLc045NmJvUTRQZ3ZiUjArQ1NheGdoaWI1Z2gwVUUxQWdjcDZa?=
 =?utf-8?B?OUFvQ2pIR2NrTDNhL0x1bFkyNi9hMDRYVTdOY2V1RW5BSkl6S0RjdzZxbmZK?=
 =?utf-8?B?NksxbG5WeUllaHlyQUp4QWZjU0R2V2RDbmlyU1luT0wxazFpTjlZbEV2SVBS?=
 =?utf-8?B?WGJnUXY1bEdFZ3BPYVdySkhEUDIvWXJjMlVJV1Vkc0dxeXdVM0IrblQzTktC?=
 =?utf-8?B?RUtWOVJ4RFZBZmJGOVliYUl2aVhVZUxHM0kxaXc1WUc3NHhvVmN3azBoVm5D?=
 =?utf-8?B?UGpTdVdyZStka1FWLytvbEUrbGJWWDNJV1ZKYU1WVWpFSm5WSjc0dnZmU3hE?=
 =?utf-8?B?MThhUmZJYnhuL2FUOWxQdGJQdWJRdjlJSE95MFZWb2MvOEJkSTNOQ0VoQ0Qx?=
 =?utf-8?B?dmlqZWxiVFZlS01iLzUyenc0dGhkRXhvWGNaK29EU1czNWVXd2lXYnlsZER5?=
 =?utf-8?B?bUl3N2d2ZnplZmFnVS9VSlc0QnRxK0Rmc0N0OXJKcjFGVkhPdC95YjRMSXZ0?=
 =?utf-8?B?akErMVM5TEJucitBbVI0QTlzcUg2VVBZNWptdlNiR3hDOVpwQmpQRWVNTUNm?=
 =?utf-8?B?YzVoWGtnQTBaMEJvTXdheklobHMxZHhwakpydmtxSG9wWjVFZU5zZkZvRWZ3?=
 =?utf-8?B?NVpxa1lpRFpBVTZ5RnFPSVlMTTlqd3JURTU5T2NUb0Q2V1BleHErdU9VM3Ar?=
 =?utf-8?B?dlJkYkwvM3NJaVQxWVJXQkVWRE9zVXMyYW5KcVovVWJwa0dGUG9rTDdXL0pt?=
 =?utf-8?B?WmVYeVBsSkpQcDZPa2dDNzNPZWVFMHVjd0k2b2JSaFRDYTVtYWgrWnVwZjl3?=
 =?utf-8?B?L2xsdzhTY0phbVhWZ2NuZXM3NkV0UVV1ZDVxNk1iUTZVNldQLzIzUFNrZ0gr?=
 =?utf-8?B?VVg1MUlqSisrMThiWmRyeWI4S3hmc2w3MXpKZEpqWTdYVkhaTnR5aExRYmJB?=
 =?utf-8?B?Y3dSbWRPMlk5WHljQ0FrczRCRU9Yby9FandNVG10V3lIRWdVSHpnTVZqV29V?=
 =?utf-8?B?SWs4WEVrMmM0VUw0MWo0MTdPR0h4VnZKVEJQeUxLakFTQmlBK09oWXdWc0p0?=
 =?utf-8?B?QUtVSVZXSjNuQlNraXNqTklsenBkenJnMG9oYjFEdGMxTlpUVWFnZ1B4YW1r?=
 =?utf-8?B?T25kdmxUSUJEeGs4clVaUndrMk1NNHNCWTZleWtHUms4M3B3YVpYaDhuTTBn?=
 =?utf-8?B?RjJySDRUS2U3a2MrNVRMR1FrSXZIRDQ0a092U2NaNU4wYVZqb2h6RldkbE4x?=
 =?utf-8?B?Z1RtSE1mYjZVSUZZcjhoZWttb2ttVWJkUG9sQVYyc1pJK0NCUGpKM2hmSjR0?=
 =?utf-8?B?ejhBTzhqdjdNZlZBKzhFVm5JUnBHaUJSNFpUdDRCMXZmMHNWODNjc09GMjhT?=
 =?utf-8?B?Q1FzRkZDajdpYXZhd0d0TGQzeVAvUDhraFI4TFBjc1hTWmpHRW1VM2tqSEpo?=
 =?utf-8?B?TEhVd3NvT0VGR0xJRDBtWmUvNVVPOXFsbkYxd3lOU0RBZ0RCMkNOZFQ4TU5N?=
 =?utf-8?B?QzRCckRMbVJaMWlQRDZicXN4eGJ6NzFyTm1FRHQxdG4wdGo4cGNkMENaWlg2?=
 =?utf-8?B?K28yVE1qanJzZi9tRWhTSGtFV3E1Z2YwVkdvY3RMcjdqc24rbkRTRnFLYnFp?=
 =?utf-8?B?MXJIM2ZmOEl5WmxnNW5yVC9RWmd3TWdLSTR1ZUpEN3dBM2hRc3ptczdsUXBs?=
 =?utf-8?B?cnlreW1NV3NRVVRNaVg3T2drUVhIaHhMN3lMbEYwWjJodk1DdHZWR1JKZUti?=
 =?utf-8?B?S1BtRERmdkF6QStySDNLeGtXN3V3eDl6WWFzWXowbkhacy9nNFZCMGJuR0ll?=
 =?utf-8?Q?56YXRdYBRu6veZnX3dgwIkEuk?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	CEVF7FbUDp3s4liExROq0FKS8pfq5vWKaozCkIR1Jb0qILhzo1zkSgyep1XyHyRhKpANJRW4rm+2tm6mK0eW6ioLPQTCLvSHdQBeNJeHhu8RXNTapCANgFQucDSJnaNnryiVJ6UCNw1aaZrb7Z9ku0+4E99TXdT/YSr58K1ihdXous8i6+ggZUsokuTQgahAuti1rDVNQui2tdjXGBlGRrLFdAm1b8vGUoyTcZ+SdN1nXgyUlGtoQReXCQULup/nvXlMkCpItB+bexhW49sUfjIFOXm5FtL8qG7zU3ZLmr0Ksq+NbYw89JeSYkakSmx8yOsKtPSJMh1/wzFTGnvMfRTd++R2H7eaPfW7/NHqlb1yZbUSxM8YzBFNiPQdjmyl55RRPGlO1lAQxyorOKExY8fciy4vcGC3pIzR4BF5VEn0fciG/JK0QSXEZelOXWzrp2lGjxbDRjXspbmCuVhqgzb5MnjrTdoMbXPhQJKdbSyh8CIwUmbdrxCpRzhMcspKOtBdO207cLGQBWBmJAZ1Q22ZIvrrHp+JDX3UrIWmuZGtYabRnk6bdl56v41P56C9Mok51P21fvW67srVYvOlHfDkhZYAZjxnQheG/baovbM=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e1df92b-05aa-43ee-5557-08dd41637a4f
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2025 19:22:46.7624
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: khRxm08izAVRqsO1O82YJuILFvhLMJ27npQOFLT1B40uhXZbq3WJm7GHaGEXk8xqBh/iogkyHveSnSV+M+u7zA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR10MB4224
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-30_09,2025-01-30_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 bulkscore=0
 adultscore=0 malwarescore=0 suspectscore=0 phishscore=0 spamscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2501170000 definitions=main-2501300148
X-Proofpoint-GUID: HpC8bDJsmxTQc9cwgoVRcFliMdgxW9uN
X-Proofpoint-ORIG-GUID: HpC8bDJsmxTQc9cwgoVRcFliMdgxW9uN

Reviewed-by: Eugene Loh <eugene.loh@oracle.com>

For
test/unittest/funcs/d_execargs/tst.d_execargs.d
test/unittest/proc/tst.pr_psargs.d
how about a few more arguments?  E.g.,
system("/bin/echo TEST abcde fghijkl");
(I don't have anything particular in mind that this might catch. Just 
trying to poke a little harder.)

For bpf/d_execargs.S, how about ' ' instead of 32 (in that substitution 
loop).

For bpf/d_execargs.S, a few more comments would be nice.  Per your 
taste, of course.  But for me, e.g.,

- There should be a comment with the prototype of the function.
   I think most other bpf/*.S files do this.

- One input arg is referred to as "args"... Most other bpf/*.S functions
   refer to this as "dst" or something.  To me that makes more sense
   since, as far as d_execargs() is concerned, this arg is the dest
   location.

- Comments refer to T.  This makes sense for the translators I
   guess, but maybe saying it's the task struct or something.

- Maybe it'd be helpful to lay out the strategy for how the registers
   are being used?  E.g., %r9 points to the dest location, but meanwhile
   used for scratch space.  %r6 is the pointer to memory we're accessing
   so that, in case of probe_read() error, we know which address to report.

On 1/29/25 02:00, Kris Van Hees via DTrace-devel wrote:
> Implement d_execargs() to provide task argument string (pr_psargs)
> for the psinfo translator.  It takes a task (struct task_struct) as
> argument and returns a string.
>
> psinfo->pr_psargs now simply calls d_execargs(T).
>
> Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
> ---
>   bpf/Build                                     |  1 +
>   bpf/d_execargs.S                              | 91 +++++++++++++++++++
>   dlibs/aarch64/5.11/procfs.d                   |  4 +-
>   dlibs/aarch64/5.12/procfs.d                   |  4 +-
>   dlibs/aarch64/5.14/procfs.d                   |  4 +-
>   dlibs/aarch64/5.16/procfs.d                   |  4 +-
>   dlibs/aarch64/5.2/procfs.d                    |  4 +-
>   dlibs/aarch64/5.6/procfs.d                    |  4 +-
>   dlibs/aarch64/6.1/procfs.d                    |  4 +-
>   dlibs/aarch64/6.10/procfs.d                   |  4 +-
>   dlibs/x86_64/5.11/procfs.d                    |  4 +-
>   dlibs/x86_64/5.12/procfs.d                    |  4 +-
>   dlibs/x86_64/5.14/procfs.d                    |  4 +-
>   dlibs/x86_64/5.16/procfs.d                    |  4 +-
>   dlibs/x86_64/5.2/procfs.d                     |  4 +-
>   dlibs/x86_64/5.6/procfs.d                     |  4 +-
>   dlibs/x86_64/6.1/procfs.d                     |  4 +-
>   dlibs/x86_64/6.10/procfs.d                    |  4 +-
>   include/dtrace/dif_defines.h                  |  7 +-
>   libdtrace/dt_bpf.h                            | 21 +++--
>   libdtrace/dt_cc.c                             | 33 ++++++-
>   libdtrace/dt_cg.c                             |  9 +-
>   libdtrace/dt_dlibs.c                          |  3 +
>   libdtrace/dt_open.c                           |  2 +
>   libdtrace/procfs.d.in                         |  4 +-
>   .../d_execargs/err.D_PROTO_ARG.scalar_arg.d   | 16 ++++
>   .../d_execargs/err.D_PROTO_ARG.scalar_arg.r   |  4 +
>   .../d_execargs/err.D_PROTO_ARG.string_arg.d   | 16 ++++
>   .../d_execargs/err.D_PROTO_ARG.string_arg.r   |  4 +
>   .../d_execargs/err.D_PROTO_ARG.wrong_ptr.d    | 16 ++++
>   .../d_execargs/err.D_PROTO_ARG.wrong_ptr.r    |  4 +
>   .../d_execargs/err.D_PROTO_LEN.missing_arg.d  | 16 ++++
>   .../d_execargs/err.D_PROTO_LEN.missing_arg.r  |  2 +
>   .../err.D_PROTO_LEN.too_many_args.d           | 16 ++++
>   .../err.D_PROTO_LEN.too_many_args.r           |  2 +
>   .../funcs/d_execargs/tst.d_execargs.d         | 31 +++++++
>   .../funcs/d_execargs/tst.d_execargs.r         |  2 +
>   test/unittest/proc/tst.pr_psargs.d            | 31 +++++++
>   test/unittest/proc/tst.pr_psargs.r            |  9 ++
>   39 files changed, 339 insertions(+), 65 deletions(-)
>   create mode 100644 bpf/d_execargs.S
>   create mode 100644 test/unittest/funcs/d_execargs/err.D_PROTO_ARG.scalar_arg.d
>   create mode 100644 test/unittest/funcs/d_execargs/err.D_PROTO_ARG.scalar_arg.r
>   create mode 100644 test/unittest/funcs/d_execargs/err.D_PROTO_ARG.string_arg.d
>   create mode 100644 test/unittest/funcs/d_execargs/err.D_PROTO_ARG.string_arg.r
>   create mode 100644 test/unittest/funcs/d_execargs/err.D_PROTO_ARG.wrong_ptr.d
>   create mode 100644 test/unittest/funcs/d_execargs/err.D_PROTO_ARG.wrong_ptr.r
>   create mode 100644 test/unittest/funcs/d_execargs/err.D_PROTO_LEN.missing_arg.d
>   create mode 100644 test/unittest/funcs/d_execargs/err.D_PROTO_LEN.missing_arg.r
>   create mode 100644 test/unittest/funcs/d_execargs/err.D_PROTO_LEN.too_many_args.d
>   create mode 100644 test/unittest/funcs/d_execargs/err.D_PROTO_LEN.too_many_args.r
>   create mode 100644 test/unittest/funcs/d_execargs/tst.d_execargs.d
>   create mode 100644 test/unittest/funcs/d_execargs/tst.d_execargs.r
>   create mode 100644 test/unittest/proc/tst.pr_psargs.d
>   create mode 100644 test/unittest/proc/tst.pr_psargs.r
>
> diff --git a/bpf/Build b/bpf/Build
> index 3e43f4b6..9355326c 100644
> --- a/bpf/Build
> +++ b/bpf/Build
> @@ -24,6 +24,7 @@ bpf_dlib_SOURCES = \
>   	agg_lqbin.c agg_qbin.c \
>   	basename.S \
>   	cleanpath.S \
> +	d_execargs.S \
>   	dirname.S \
>   	get_agg.c \
>   	get_bvar.c \
> diff --git a/bpf/d_execargs.S b/bpf/d_execargs.S
> new file mode 100644
> index 00000000..3a5b1270
> --- /dev/null
> +++ b/bpf/d_execargs.S
> @@ -0,0 +1,91 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (c) 2025, Oracle and/or its affiliates.
> + */
> +
> +#include <bpf_asm_helpers.h>
> +#include <dtrace/faults_defines.h>
> +
> +	.text
> +	.align	4
> +	.global	dt_d_execargs
> +dt_d_execargs:
> +	stxdw	[%fp+-8], %r1			/* save dctx to stack */
> +	mov	%r9, %r3			/* %r9 = args */
> +
> +	mov	%r6, %r2			/* set %r6 in case of error */
> +	jeq	%r6, 0, .Lerror
> +
> +	add	%r6, TASK_MM			/* ptr = &(T->mm) */
> +
> +	mov	%r1, %r9
> +	mov	%r2, 8
> +	mov	%r3, %r6
> +	call	BPF_FUNC_probe_read
> +	jne	%r0, 0, .Lerror
> +
> +	ldxdw	%r8, [%r9+0]			/* %r8 = T->mm */
> +	jeq	%r8, 0, .Lempty
> +	mov	%r6, %r8
> +	add	%r6, TASK_MM_ARG_START		/* ptr = &(T->mm->arg_start) */
> +
> +	mov	%r1, %r9
> +	mov	%r2, 8
> +	mov	%r3, %r6
> +	call	BPF_FUNC_probe_read
> +	jne	%r0, 0, .Lerror
> +
> +	ldxdw	%r7, [%r9+0]			/* %r7 = T->mm->arg_start */
> +	mov	%r6, %r8
> +	add	%r6, TASK_MM_ARG_END		/* ptr = &(T->mm->arg_end) */
> +
> +	mov	%r1, %r9
> +	mov	%r2, 8
> +	mov	%r3, %r6
> +	call	BPF_FUNC_probe_read
> +	jne	%r0, 0, .Lerror
> +
> +	ldxdw	%r6, [%r9+0]			/* %r6 = T->mm->arg_end */
> +
> +	mov	%r8, %r6
> +	sub	%r8, %r7			/* %r8 = len = arg_end - arg_start */
> +	jslt	%r8, 2, .Lempty
> +	mov	%r0, STRSZ
> +	jslt	%r8, %r0, .Llen_ok
> +	mov	%r8, %r0
> +.Llen_ok:
> +
> +	/* read data from arg_start to arg_end */
> +	mov	%r1, %r9
> +	mov	%r2, %r8
> +	mov	%r3, %r7
> +	call	BPF_FUNC_probe_read		/* bpf_probe_read(&args, len + 1, arg_start) */
> +	jne	%r0, 0, .Lerror
> +
> +	/* loop over args and replace '\0' with ' ' */
> +	mov	%r1, %r8
> +	sub	%r1, 2
> +.Lloop:
> +	mov	%r2, %r9
> +	add	%r2, %r1
> +	ldxb	%r0, [%r2+0]
> +	jne	%r0, 0, .Lnot_nil
> +	stb	[%r2+0], 32
> +.Lnot_nil:
> +	sub	%r1, 1
> +	jsge	%r1, 0, .Lloop
> +
> +.Ldone:
> +	mov	%r0, %r9
> +	exit					/* return args */
> +.Lerror:
> +	ldxdw	%r1, [%fp+-8]
> +	mov	%r2, PC
> +	mov	%r3, DTRACEFLT_BADADDR
> +	mov	%r4, %r6
> +	call	dt_probe_error
> +.Lempty:
> +	mov	%r0, %r9
> +	stb	[%r9+0], 0			/* args[0] = 0 */
> +	exit					/* return args */
> +	.size	dt_d_execargs, .-dt_d_execargs
> diff --git a/dlibs/aarch64/5.11/procfs.d b/dlibs/aarch64/5.11/procfs.d
> index 44ec4280..70a43ddf 100644
> --- a/dlibs/aarch64/5.11/procfs.d
> +++ b/dlibs/aarch64/5.11/procfs.d
> @@ -141,9 +141,7 @@ translator psinfo_t < struct task_struct *T > {
>   				   : (struct tty_struct *)-1;
>   
>   	pr_fname = T->comm;
> -/*
> -	pr_psargs = stringof(get_psinfo(T)->__psinfo(psargs));
> - */
> +	pr_psargs = d_execargs(T);
>   	pr_wstat = 0;
>   /*
>   	pr_argc = get_psinfo(T)->__psinfo(argc);
> diff --git a/dlibs/aarch64/5.12/procfs.d b/dlibs/aarch64/5.12/procfs.d
> index 44ec4280..70a43ddf 100644
> --- a/dlibs/aarch64/5.12/procfs.d
> +++ b/dlibs/aarch64/5.12/procfs.d
> @@ -141,9 +141,7 @@ translator psinfo_t < struct task_struct *T > {
>   				   : (struct tty_struct *)-1;
>   
>   	pr_fname = T->comm;
> -/*
> -	pr_psargs = stringof(get_psinfo(T)->__psinfo(psargs));
> - */
> +	pr_psargs = d_execargs(T);
>   	pr_wstat = 0;
>   /*
>   	pr_argc = get_psinfo(T)->__psinfo(argc);
> diff --git a/dlibs/aarch64/5.14/procfs.d b/dlibs/aarch64/5.14/procfs.d
> index 584ac325..ef27bb70 100644
> --- a/dlibs/aarch64/5.14/procfs.d
> +++ b/dlibs/aarch64/5.14/procfs.d
> @@ -141,9 +141,7 @@ translator psinfo_t < struct task_struct *T > {
>   				   : (struct tty_struct *)-1;
>   
>   	pr_fname = T->comm;
> -/*
> -	pr_psargs = stringof(get_psinfo(T)->__psinfo(psargs));
> - */
> +	pr_psargs = d_execargs(T);
>   	pr_wstat = 0;
>   /*
>   	pr_argc = get_psinfo(T)->__psinfo(argc);
> diff --git a/dlibs/aarch64/5.16/procfs.d b/dlibs/aarch64/5.16/procfs.d
> index 5aabc6f1..cad2d2c5 100644
> --- a/dlibs/aarch64/5.16/procfs.d
> +++ b/dlibs/aarch64/5.16/procfs.d
> @@ -141,9 +141,7 @@ translator psinfo_t < struct task_struct *T > {
>   				   : (struct tty_struct *)-1;
>   
>   	pr_fname = T->comm;
> -/*
> -	pr_psargs = stringof(get_psinfo(T)->__psinfo(psargs));
> - */
> +	pr_psargs = d_execargs(T);
>   	pr_wstat = 0;
>   /*
>   	pr_argc = get_psinfo(T)->__psinfo(argc);
> diff --git a/dlibs/aarch64/5.2/procfs.d b/dlibs/aarch64/5.2/procfs.d
> index 683ff5a8..6b1b1b9c 100644
> --- a/dlibs/aarch64/5.2/procfs.d
> +++ b/dlibs/aarch64/5.2/procfs.d
> @@ -141,9 +141,7 @@ translator psinfo_t < struct task_struct *T > {
>   				   : (struct tty_struct *)-1;
>   
>   	pr_fname = T->comm;
> -/*
> -	pr_psargs = stringof(get_psinfo(T)->__psinfo(psargs));
> - */
> +	pr_psargs = d_execargs(T);
>   	pr_wstat = 0;
>   /*
>   	pr_argc = get_psinfo(T)->__psinfo(argc);
> diff --git a/dlibs/aarch64/5.6/procfs.d b/dlibs/aarch64/5.6/procfs.d
> index 44ec4280..70a43ddf 100644
> --- a/dlibs/aarch64/5.6/procfs.d
> +++ b/dlibs/aarch64/5.6/procfs.d
> @@ -141,9 +141,7 @@ translator psinfo_t < struct task_struct *T > {
>   				   : (struct tty_struct *)-1;
>   
>   	pr_fname = T->comm;
> -/*
> -	pr_psargs = stringof(get_psinfo(T)->__psinfo(psargs));
> - */
> +	pr_psargs = d_execargs(T);
>   	pr_wstat = 0;
>   /*
>   	pr_argc = get_psinfo(T)->__psinfo(argc);
> diff --git a/dlibs/aarch64/6.1/procfs.d b/dlibs/aarch64/6.1/procfs.d
> index 5d7873b5..4cb7b77c 100644
> --- a/dlibs/aarch64/6.1/procfs.d
> +++ b/dlibs/aarch64/6.1/procfs.d
> @@ -141,9 +141,7 @@ translator psinfo_t < struct task_struct *T > {
>   				   : (struct tty_struct *)-1;
>   
>   	pr_fname = T->comm;
> -/*
> -	pr_psargs = stringof(get_psinfo(T)->__psinfo(psargs));
> - */
> +	pr_psargs = d_execargs(T);
>   	pr_wstat = 0;
>   /*
>   	pr_argc = get_psinfo(T)->__psinfo(argc);
> diff --git a/dlibs/aarch64/6.10/procfs.d b/dlibs/aarch64/6.10/procfs.d
> index 5d7873b5..4cb7b77c 100644
> --- a/dlibs/aarch64/6.10/procfs.d
> +++ b/dlibs/aarch64/6.10/procfs.d
> @@ -141,9 +141,7 @@ translator psinfo_t < struct task_struct *T > {
>   				   : (struct tty_struct *)-1;
>   
>   	pr_fname = T->comm;
> -/*
> -	pr_psargs = stringof(get_psinfo(T)->__psinfo(psargs));
> - */
> +	pr_psargs = d_execargs(T);
>   	pr_wstat = 0;
>   /*
>   	pr_argc = get_psinfo(T)->__psinfo(argc);
> diff --git a/dlibs/x86_64/5.11/procfs.d b/dlibs/x86_64/5.11/procfs.d
> index 7274554e..c2be76d8 100644
> --- a/dlibs/x86_64/5.11/procfs.d
> +++ b/dlibs/x86_64/5.11/procfs.d
> @@ -141,9 +141,7 @@ translator psinfo_t < struct task_struct *T > {
>   				   : (struct tty_struct *)-1;
>   
>   	pr_fname = T->comm;
> -/*
> -	pr_psargs = stringof(get_psinfo(T)->__psinfo(psargs));
> - */
> +	pr_psargs = d_execargs(T);
>   	pr_wstat = 0;
>   /*
>   	pr_argc = get_psinfo(T)->__psinfo(argc);
> diff --git a/dlibs/x86_64/5.12/procfs.d b/dlibs/x86_64/5.12/procfs.d
> index 7274554e..c2be76d8 100644
> --- a/dlibs/x86_64/5.12/procfs.d
> +++ b/dlibs/x86_64/5.12/procfs.d
> @@ -141,9 +141,7 @@ translator psinfo_t < struct task_struct *T > {
>   				   : (struct tty_struct *)-1;
>   
>   	pr_fname = T->comm;
> -/*
> -	pr_psargs = stringof(get_psinfo(T)->__psinfo(psargs));
> - */
> +	pr_psargs = d_execargs(T);
>   	pr_wstat = 0;
>   /*
>   	pr_argc = get_psinfo(T)->__psinfo(argc);
> diff --git a/dlibs/x86_64/5.14/procfs.d b/dlibs/x86_64/5.14/procfs.d
> index d1cf90d3..28fada6d 100644
> --- a/dlibs/x86_64/5.14/procfs.d
> +++ b/dlibs/x86_64/5.14/procfs.d
> @@ -141,9 +141,7 @@ translator psinfo_t < struct task_struct *T > {
>   				   : (struct tty_struct *)-1;
>   
>   	pr_fname = T->comm;
> -/*
> -	pr_psargs = stringof(get_psinfo(T)->__psinfo(psargs));
> - */
> +	pr_psargs = d_execargs(T);
>   	pr_wstat = 0;
>   /*
>   	pr_argc = get_psinfo(T)->__psinfo(argc);
> diff --git a/dlibs/x86_64/5.16/procfs.d b/dlibs/x86_64/5.16/procfs.d
> index 5aabc6f1..cad2d2c5 100644
> --- a/dlibs/x86_64/5.16/procfs.d
> +++ b/dlibs/x86_64/5.16/procfs.d
> @@ -141,9 +141,7 @@ translator psinfo_t < struct task_struct *T > {
>   				   : (struct tty_struct *)-1;
>   
>   	pr_fname = T->comm;
> -/*
> -	pr_psargs = stringof(get_psinfo(T)->__psinfo(psargs));
> - */
> +	pr_psargs = d_execargs(T);
>   	pr_wstat = 0;
>   /*
>   	pr_argc = get_psinfo(T)->__psinfo(argc);
> diff --git a/dlibs/x86_64/5.2/procfs.d b/dlibs/x86_64/5.2/procfs.d
> index 35538862..08696cf7 100644
> --- a/dlibs/x86_64/5.2/procfs.d
> +++ b/dlibs/x86_64/5.2/procfs.d
> @@ -141,9 +141,7 @@ translator psinfo_t < struct task_struct *T > {
>   				   : (struct tty_struct *)-1;
>   
>   	pr_fname = T->comm;
> -/*
> -	pr_psargs = stringof(get_psinfo(T)->__psinfo(psargs));
> - */
> +	pr_psargs = d_execargs(T);
>   	pr_wstat = 0;
>   /*
>   	pr_argc = get_psinfo(T)->__psinfo(argc);
> diff --git a/dlibs/x86_64/5.6/procfs.d b/dlibs/x86_64/5.6/procfs.d
> index 7274554e..c2be76d8 100644
> --- a/dlibs/x86_64/5.6/procfs.d
> +++ b/dlibs/x86_64/5.6/procfs.d
> @@ -141,9 +141,7 @@ translator psinfo_t < struct task_struct *T > {
>   				   : (struct tty_struct *)-1;
>   
>   	pr_fname = T->comm;
> -/*
> -	pr_psargs = stringof(get_psinfo(T)->__psinfo(psargs));
> - */
> +	pr_psargs = d_execargs(T);
>   	pr_wstat = 0;
>   /*
>   	pr_argc = get_psinfo(T)->__psinfo(argc);
> diff --git a/dlibs/x86_64/6.1/procfs.d b/dlibs/x86_64/6.1/procfs.d
> index 5d7873b5..4cb7b77c 100644
> --- a/dlibs/x86_64/6.1/procfs.d
> +++ b/dlibs/x86_64/6.1/procfs.d
> @@ -141,9 +141,7 @@ translator psinfo_t < struct task_struct *T > {
>   				   : (struct tty_struct *)-1;
>   
>   	pr_fname = T->comm;
> -/*
> -	pr_psargs = stringof(get_psinfo(T)->__psinfo(psargs));
> - */
> +	pr_psargs = d_execargs(T);
>   	pr_wstat = 0;
>   /*
>   	pr_argc = get_psinfo(T)->__psinfo(argc);
> diff --git a/dlibs/x86_64/6.10/procfs.d b/dlibs/x86_64/6.10/procfs.d
> index 5d7873b5..4cb7b77c 100644
> --- a/dlibs/x86_64/6.10/procfs.d
> +++ b/dlibs/x86_64/6.10/procfs.d
> @@ -141,9 +141,7 @@ translator psinfo_t < struct task_struct *T > {
>   				   : (struct tty_struct *)-1;
>   
>   	pr_fname = T->comm;
> -/*
> -	pr_psargs = stringof(get_psinfo(T)->__psinfo(psargs));
> - */
> +	pr_psargs = d_execargs(T);
>   	pr_wstat = 0;
>   /*
>   	pr_argc = get_psinfo(T)->__psinfo(argc);
> diff --git a/include/dtrace/dif_defines.h b/include/dtrace/dif_defines.h
> index c8c1d961..cd785723 100644
> --- a/include/dtrace/dif_defines.h
> +++ b/include/dtrace/dif_defines.h
> @@ -207,10 +207,11 @@
>   #define DIF_SUBR_INET_NTOP		41
>   #define DIF_SUBR_INET_NTOA		42
>   #define DIF_SUBR_INET_NTOA6		43
> -#define DIF_SUBR_D_PATH			44
> -#define DIF_SUBR_LINK_NTOP		45
> +#define DIF_SUBR_LINK_NTOP		44
> +#define DIF_SUBR_D_PATH			45
> +#define DIF_SUBR_D_EXECARGS		46
>   
> -#define DIF_SUBR_MAX			45
> +#define DIF_SUBR_MAX			46
>   
>   typedef uint32_t	dif_instr_t;
>   
> diff --git a/libdtrace/dt_bpf.h b/libdtrace/dt_bpf.h
> index 6518de66..85934d2d 100644
> --- a/libdtrace/dt_bpf.h
> +++ b/libdtrace/dt_bpf.h
> @@ -47,15 +47,18 @@ extern "C" {
>   #define DT_CONST_TASK_TGID		12
>   #define DT_CONST_TASK_REAL_PARENT	13
>   #define DT_CONST_TASK_COMM		14
> -#define DT_CONST_MUTEX_OWNER		15
> -#define DT_CONST_RWLOCK_CNTS		16
> -#define DT_CONST_DCTX_RODATA		17
> -#define DT_CONST_RODATA_OFF		18
> -#define DT_CONST_RODATA_SIZE		19
> -#define DT_CONST_ZERO_OFF		20
> -#define DT_CONST_STACK_OFF		21
> -#define DT_CONST_STACK_SKIP		22
> -#define DT_CONST_NPROBES		23
> +#define DT_CONST_TASK_MM		15
> +#define DT_CONST_TASK_MM_ARG_START	16
> +#define DT_CONST_TASK_MM_ARG_END	17
> +#define DT_CONST_MUTEX_OWNER		18
> +#define DT_CONST_RWLOCK_CNTS		19
> +#define DT_CONST_DCTX_RODATA		20
> +#define DT_CONST_RODATA_OFF		21
> +#define DT_CONST_RODATA_SIZE		22
> +#define DT_CONST_ZERO_OFF		23
> +#define DT_CONST_STACK_OFF		24
> +#define DT_CONST_STACK_SKIP		25
> +#define DT_CONST_NPROBES		26
>   
>   #define DT_BPF_LOG_SIZE_DEFAULT	(UINT32_MAX >> 8)
>   #define DT_BPF_LOG_SIZE_SMALL	4096
> diff --git a/libdtrace/dt_cc.c b/libdtrace/dt_cc.c
> index 29cfbd84..1dc119ea 100644
> --- a/libdtrace/dt_cc.c
> +++ b/libdtrace/dt_cc.c
> @@ -1082,7 +1082,8 @@ dt_link_construct(dtrace_hdl_t *dtp, const dt_probe_t *prp, dtrace_difo_t *dp,
>   			case DT_CONST_TASK_PID:
>   			case DT_CONST_TASK_TGID:
>   			case DT_CONST_TASK_REAL_PARENT:
> -			case DT_CONST_TASK_COMM: {
> +			case DT_CONST_TASK_COMM:
> +			case DT_CONST_TASK_MM: {
>   				ctf_file_t *cfp = dtp->dt_shared_ctf;
>   				ctf_id_t type;
>   				ctf_membinfo_t ctm;
> @@ -1108,6 +1109,36 @@ dt_link_construct(dtrace_hdl_t *dtp, const dt_probe_t *prp, dtrace_difo_t *dp,
>   				case DT_CONST_TASK_COMM:
>   					rc = ctf_member_info(cfp, type, "comm", &ctm);
>   					break;
> +				case DT_CONST_TASK_MM:
> +					rc = ctf_member_info(cfp, type, "mm", &ctm);
> +					break;
> +				}
> +				if (rc == CTF_ERR)
> +					goto err_ctf;
> +				nrp->dofr_data = ctm.ctm_offset / NBBY;
> +				continue;
> +			}
> +			case DT_CONST_TASK_MM_ARG_START:
> +			case DT_CONST_TASK_MM_ARG_END: {
> +				ctf_file_t *cfp = dtp->dt_shared_ctf;
> +				ctf_id_t type;
> +				ctf_membinfo_t ctm;
> +				int rc = 0;
> +
> +				if (!cfp)
> +					return dt_set_errno(dtp, EDT_NOCTF);
> +
> +				type = ctf_lookup_by_name(cfp, "struct mm_struct");
> +				if (type == CTF_ERR)
> +					goto err_ctf;
> +
> +				switch (idp->di_id) {
> +				case DT_CONST_TASK_MM_ARG_START:
> +					rc = ctf_member_info(cfp, type, "arg_start", &ctm);
> +					break;
> +				case DT_CONST_TASK_MM_ARG_END:
> +					rc = ctf_member_info(cfp, type, "arg_end", &ctm);
> +					break;
>   				}
>   				if (rc == CTF_ERR)
>   					goto err_ctf;
> diff --git a/libdtrace/dt_cg.c b/libdtrace/dt_cg.c
> index 6e74b4b0..a1a39f3f 100644
> --- a/libdtrace/dt_cg.c
> +++ b/libdtrace/dt_cg.c
> @@ -3300,7 +3300,6 @@ dt_cg_load_var(dt_node_t *dnp, dt_irlist_t *dlp, dt_regset_t *drp)
>   	}
>   
>   	/* built-in variables (note: args[] is handled in dt_cg_array_op) */
> -	/* Special case for arg0 through arg9; encode as args[n] */
>   	if (idp->di_id >= DIF_VAR_ARG0 && idp->di_id <= DIF_VAR_ARG9) {
>   		fnp = dt_dlib_get_func(yypcb->pcb_hdl, "dt_bvar_args");
>   		idx = idp->di_id - DIF_VAR_ARG0;
> @@ -6661,6 +6660,13 @@ dt_cg_subr_inet_ntop(dt_node_t *dnp, dt_irlist_t *dlp, dt_regset_t *drp)
>   	tnp->dn_tstring = NULL;
>   }
>   
> +static void
> +dt_cg_subr_d_execargs(dt_node_t *dnp, dt_irlist_t *dlp, dt_regset_t *drp)
> +{
> +	dt_cg_subr_arg_to_tstring(dnp, dlp, drp, "dt_d_execargs", 0,
> +				  DT_IGNOR, 0, DT_IGNOR, 0);
> +}
> +
>   static void
>   dt_cg_subr_d_path(dt_node_t *dnp, dt_irlist_t *dlp, dt_regset_t *drp)
>   {
> @@ -6758,6 +6764,7 @@ static dt_cg_subr_f *_dt_cg_subr[DIF_SUBR_MAX + 1] = {
>   	[DIF_SUBR_INET_NTOP]		= &dt_cg_subr_inet_ntop,
>   	[DIF_SUBR_INET_NTOA]		= &dt_cg_subr_inet_ntoa,
>   	[DIF_SUBR_INET_NTOA6]		= &dt_cg_subr_inet_ntoa6,
> +	[DIF_SUBR_D_EXECARGS]		= &dt_cg_subr_d_execargs,
>   	[DIF_SUBR_D_PATH]		= &dt_cg_subr_d_path,
>   	[DIF_SUBR_LINK_NTOP]		= &dt_cg_subr_link_ntop,
>   };
> diff --git a/libdtrace/dt_dlibs.c b/libdtrace/dt_dlibs.c
> index 07d22afd..9ad4f5e7 100644
> --- a/libdtrace/dt_dlibs.c
> +++ b/libdtrace/dt_dlibs.c
> @@ -89,6 +89,9 @@ static const dt_ident_t		dt_bpf_symbols[] = {
>   	DT_BPF_SYMBOL_ID(TASK_TGID, DT_IDENT_SCALAR, DT_CONST_TASK_TGID),
>   	DT_BPF_SYMBOL_ID(TASK_REAL_PARENT, DT_IDENT_SCALAR, DT_CONST_TASK_REAL_PARENT),
>   	DT_BPF_SYMBOL_ID(TASK_COMM, DT_IDENT_SCALAR, DT_CONST_TASK_COMM),
> +	DT_BPF_SYMBOL_ID(TASK_MM, DT_IDENT_SCALAR, DT_CONST_TASK_MM),
> +	DT_BPF_SYMBOL_ID(TASK_MM_ARG_START, DT_IDENT_SCALAR, DT_CONST_TASK_MM_ARG_START),
> +	DT_BPF_SYMBOL_ID(TASK_MM_ARG_END, DT_IDENT_SCALAR, DT_CONST_TASK_MM_ARG_END),
>   	DT_BPF_SYMBOL_ID(MUTEX_OWNER, DT_IDENT_SCALAR, DT_CONST_MUTEX_OWNER),
>   	DT_BPF_SYMBOL_ID(RWLOCK_CNTS, DT_IDENT_SCALAR, DT_CONST_RWLOCK_CNTS),
>   	DT_BPF_SYMBOL_ID(DCTX_RODATA, DT_IDENT_SCALAR, DT_CONST_DCTX_RODATA),
> diff --git a/libdtrace/dt_open.c b/libdtrace/dt_open.c
> index a0205887..c8208de6 100644
> --- a/libdtrace/dt_open.c
> +++ b/libdtrace/dt_open.c
> @@ -138,6 +138,8 @@ static const dt_ident_t _dtrace_globals[] = {
>   	{ DTRACE_STABILITY_STABLE, DTRACE_STABILITY_PRIVATE,
>   	DTRACE_CLASS_COMMON }, DT_VERS_1_0,
>   	&dt_idops_type, "vmlinux`struct task_struct *" },
> +{ "d_execargs", DT_IDENT_FUNC, 0, DIF_SUBR_D_EXECARGS, DT_ATTR_EVOLCMN,
> +	DT_VERS_2_0, &dt_idops_func, "string(vmlinux`struct task_struct *)" },
>   { "d_path", DT_IDENT_FUNC, DT_IDFLG_DPTR, DIF_SUBR_D_PATH, DT_ATTR_EVOLCMN,
>   	DT_VERS_1_0, &dt_idops_func, "string(struct path *)" },
>   { "ddi_pathname", DT_IDENT_FUNC, 0, DIF_SUBR_DDI_PATHNAME,
> diff --git a/libdtrace/procfs.d.in b/libdtrace/procfs.d.in
> index 038cf69b..e9d50349 100644
> --- a/libdtrace/procfs.d.in
> +++ b/libdtrace/procfs.d.in
> @@ -179,9 +179,7 @@ translator psinfo_t < struct task_struct *T > {
>   				   : (struct tty_struct *)-1;
>   
>   	pr_fname = T->comm;
> -/*
> -	pr_psargs = stringof(get_psinfo(T)->__psinfo(psargs));
> - */
> +	pr_psargs = d_execargs(T);
>   	pr_wstat = 0;
>   /*
>   	pr_argc = get_psinfo(T)->__psinfo(argc);
> diff --git a/test/unittest/funcs/d_execargs/err.D_PROTO_ARG.scalar_arg.d b/test/unittest/funcs/d_execargs/err.D_PROTO_ARG.scalar_arg.d
> new file mode 100644
> index 00000000..c707184d
> --- /dev/null
> +++ b/test/unittest/funcs/d_execargs/err.D_PROTO_ARG.scalar_arg.d
> @@ -0,0 +1,16 @@
> +/*
> + * Oracle Linux DTrace.
> + * Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
> + * Licensed under the Universal Permissive License v 1.0 as shown at
> + * http://oss.oracle.com/licenses/upl.
> + */
> +
> +/*
> + * ASSERTION: The argument to d_execargs() should be a (struct task_struct *).
> + */
> +
> +BEGIN
> +{
> +	trace(d_execargs(1));
> +	exit(0);
> +}
> diff --git a/test/unittest/funcs/d_execargs/err.D_PROTO_ARG.scalar_arg.r b/test/unittest/funcs/d_execargs/err.D_PROTO_ARG.scalar_arg.r
> new file mode 100644
> index 00000000..0e9cda07
> --- /dev/null
> +++ b/test/unittest/funcs/d_execargs/err.D_PROTO_ARG.scalar_arg.r
> @@ -0,0 +1,4 @@
> +-- @@stderr --
> +dtrace: failed to compile script test/unittest/funcs/d_execargs/err.D_PROTO_ARG.scalar_arg.d: [D_PROTO_ARG] line 14: d_execargs( ) argument #1 is incompatible with prototype:
> +	prototype: struct task_struct *
> +	 argument: int
> diff --git a/test/unittest/funcs/d_execargs/err.D_PROTO_ARG.string_arg.d b/test/unittest/funcs/d_execargs/err.D_PROTO_ARG.string_arg.d
> new file mode 100644
> index 00000000..ba419689
> --- /dev/null
> +++ b/test/unittest/funcs/d_execargs/err.D_PROTO_ARG.string_arg.d
> @@ -0,0 +1,16 @@
> +/*
> + * Oracle Linux DTrace.
> + * Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
> + * Licensed under the Universal Permissive License v 1.0 as shown at
> + * http://oss.oracle.com/licenses/upl.
> + */
> +
> +/*
> + * ASSERTION: The argument to d_execargs() should be (struct task_struct *).
> + */
> +
> +BEGIN
> +{
> +	trace(d_execargs("a"));
> +	exit(0);
> +}
> diff --git a/test/unittest/funcs/d_execargs/err.D_PROTO_ARG.string_arg.r b/test/unittest/funcs/d_execargs/err.D_PROTO_ARG.string_arg.r
> new file mode 100644
> index 00000000..ac1c1401
> --- /dev/null
> +++ b/test/unittest/funcs/d_execargs/err.D_PROTO_ARG.string_arg.r
> @@ -0,0 +1,4 @@
> +-- @@stderr --
> +dtrace: failed to compile script test/unittest/funcs/d_execargs/err.D_PROTO_ARG.string_arg.d: [D_PROTO_ARG] line 14: d_execargs( ) argument #1 is incompatible with prototype:
> +	prototype: struct task_struct *
> +	 argument: string
> diff --git a/test/unittest/funcs/d_execargs/err.D_PROTO_ARG.wrong_ptr.d b/test/unittest/funcs/d_execargs/err.D_PROTO_ARG.wrong_ptr.d
> new file mode 100644
> index 00000000..473e35e4
> --- /dev/null
> +++ b/test/unittest/funcs/d_execargs/err.D_PROTO_ARG.wrong_ptr.d
> @@ -0,0 +1,16 @@
> +/*
> + * Oracle Linux DTrace.
> + * Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
> + * Licensed under the Universal Permissive License v 1.0 as shown at
> + * http://oss.oracle.com/licenses/upl.
> + */
> +
> +/*
> + * ASSERTION: The argument to d_execargs() should be (struct task_struct *).
> + */
> +
> +BEGIN
> +{
> +	trace(d_execargs(curthread->mm));
> +	exit(0);
> +}
> diff --git a/test/unittest/funcs/d_execargs/err.D_PROTO_ARG.wrong_ptr.r b/test/unittest/funcs/d_execargs/err.D_PROTO_ARG.wrong_ptr.r
> new file mode 100644
> index 00000000..842371a3
> --- /dev/null
> +++ b/test/unittest/funcs/d_execargs/err.D_PROTO_ARG.wrong_ptr.r
> @@ -0,0 +1,4 @@
> +-- @@stderr --
> +dtrace: failed to compile script test/unittest/funcs/d_execargs/err.D_PROTO_ARG.wrong_ptr.d: [D_PROTO_ARG] line 14: d_execargs( ) argument #1 is incompatible with prototype:
> +	prototype: struct task_struct *
> +	 argument: struct mm_struct *
> diff --git a/test/unittest/funcs/d_execargs/err.D_PROTO_LEN.missing_arg.d b/test/unittest/funcs/d_execargs/err.D_PROTO_LEN.missing_arg.d
> new file mode 100644
> index 00000000..86b1b237
> --- /dev/null
> +++ b/test/unittest/funcs/d_execargs/err.D_PROTO_LEN.missing_arg.d
> @@ -0,0 +1,16 @@
> +/*
> + * Oracle Linux DTrace.
> + * Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
> + * Licensed under the Universal Permissive License v 1.0 as shown at
> + * http://oss.oracle.com/licenses/upl.
> + */
> +
> +/*
> + * ASSERTION: d_execargs() requires an argument
> + */
> +
> +BEGIN
> +{
> +	trace(d_execargs());
> +	exit(0);
> +}
> diff --git a/test/unittest/funcs/d_execargs/err.D_PROTO_LEN.missing_arg.r b/test/unittest/funcs/d_execargs/err.D_PROTO_LEN.missing_arg.r
> new file mode 100644
> index 00000000..a4fcd162
> --- /dev/null
> +++ b/test/unittest/funcs/d_execargs/err.D_PROTO_LEN.missing_arg.r
> @@ -0,0 +1,2 @@
> +-- @@stderr --
> +dtrace: failed to compile script test/unittest/funcs/d_execargs/err.D_PROTO_LEN.missing_arg.d: [D_PROTO_LEN] line 14: d_execargs( ) prototype mismatch: 0 args passed, 1 expected
> diff --git a/test/unittest/funcs/d_execargs/err.D_PROTO_LEN.too_many_args.d b/test/unittest/funcs/d_execargs/err.D_PROTO_LEN.too_many_args.d
> new file mode 100644
> index 00000000..3add63f6
> --- /dev/null
> +++ b/test/unittest/funcs/d_execargs/err.D_PROTO_LEN.too_many_args.d
> @@ -0,0 +1,16 @@
> +/*
> + * Oracle Linux DTrace.
> + * Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
> + * Licensed under the Universal Permissive License v 1.0 as shown at
> + * http://oss.oracle.com/licenses/upl.
> + */
> +
> +/*
> + * ASSERTION: The d_execargs() subroutine accepts no more than one argument.
> + */
> +
> +BEGIN
> +{
> +	trace(d_execargs(curthread, 1));
> +	exit(0);
> +}
> diff --git a/test/unittest/funcs/d_execargs/err.D_PROTO_LEN.too_many_args.r b/test/unittest/funcs/d_execargs/err.D_PROTO_LEN.too_many_args.r
> new file mode 100644
> index 00000000..f5a982ff
> --- /dev/null
> +++ b/test/unittest/funcs/d_execargs/err.D_PROTO_LEN.too_many_args.r
> @@ -0,0 +1,2 @@
> +-- @@stderr --
> +dtrace: failed to compile script test/unittest/funcs/d_execargs/err.D_PROTO_LEN.too_many_args.d: [D_PROTO_LEN] line 14: d_execargs( ) prototype mismatch: 2 args passed, 1 expected
> diff --git a/test/unittest/funcs/d_execargs/tst.d_execargs.d b/test/unittest/funcs/d_execargs/tst.d_execargs.d
> new file mode 100644
> index 00000000..b8b141aa
> --- /dev/null
> +++ b/test/unittest/funcs/d_execargs/tst.d_execargs.d
> @@ -0,0 +1,31 @@
> +/*
> + * Oracle Linux DTrace.
> + * Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
> + * Licensed under the Universal Permissive License v 1.0 as shown at
> + * http://oss.oracle.com/licenses/upl.
> + */
> +
> +/*
> + * ASSERTION: d_execargs() provides correct results.
> + */
> +
> +#pragma D option destructive
> +#pragma D option quiet
> +
> +BEGIN
> +{
> +	mypid = pid;
> +	system("/bin/echo TEST");
> +}
> +
> +proc:::exec-success
> +/progenyof(mypid) && d_execargs(curthread) == "/bin/echo TEST"/
> +{
> +	trace(d_execargs(curthread));
> +	exit(0);
> +}
> +
> +tick-1s
> +{
> +	exit(1);
> +}
> diff --git a/test/unittest/funcs/d_execargs/tst.d_execargs.r b/test/unittest/funcs/d_execargs/tst.d_execargs.r
> new file mode 100644
> index 00000000..d8ff6689
> --- /dev/null
> +++ b/test/unittest/funcs/d_execargs/tst.d_execargs.r
> @@ -0,0 +1,2 @@
> +TEST
> +/bin/echo TEST
> diff --git a/test/unittest/proc/tst.pr_psargs.d b/test/unittest/proc/tst.pr_psargs.d
> new file mode 100644
> index 00000000..902ac1a3
> --- /dev/null
> +++ b/test/unittest/proc/tst.pr_psargs.d
> @@ -0,0 +1,31 @@
> +/*
> + * Oracle Linux DTrace.
> + * Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
> + * Licensed under the Universal Permissive License v 1.0 as shown at
> + * http://oss.oracle.com/licenses/upl.
> + */
> +
> +/*
> + * ASSERTION: psinfo->pr_psargs provides correct results.
> + */
> +
> +#pragma D option destructive
> +#pragma D option quiet
> +
> +BEGIN
> +{
> +	mypid = pid;
> +	system("/bin/echo TEST");
> +}
> +
> +proc:::exec-success
> +/progenyof(mypid) && curpsinfo->pr_psargs == "/bin/echo TEST"/
> +{
> +	trace(curpsinfo->pr_psargs);
> +	exit(0);
> +}
> +
> +tick-1s
> +{
> +	exit(1);
> +}
> diff --git a/test/unittest/proc/tst.pr_psargs.r b/test/unittest/proc/tst.pr_psargs.r
> new file mode 100644
> index 00000000..397c8717
> --- /dev/null
> +++ b/test/unittest/proc/tst.pr_psargs.r
> @@ -0,0 +1,9 @@
> +TEST
> +
> +             0  1  2  3  4  5  6  7  8  9  a  b  c  d  e  f  0123456789abcdef
> +         0: 2f 62 69 6e 2f 65 63 68 6f 20 54 45 53 54 00 00  /bin/echo TEST..
> +        10: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
> +        20: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
> +        30: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
> +        40: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
> +
