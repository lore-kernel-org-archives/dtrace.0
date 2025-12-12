Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B33F030DEC6
	for <dtrace@lists.linux.dev>; Fri, 12 Dec 2025 05:14:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765516469; cv=fail; b=cPvBvNFJtn0vThPJGi2OtHkI5pDMBm9tVAJ5+0gpWobOOt9ZAltR6D5f2IKbalLSIG74AHmH3DusE6Ly4pYqt/X360DChxrR3yKK+Ew+GfEPgeYul33+oSSsGYD1gd3EIaszKAuT3yT7qMTWY3pUznfTkDbTYiHukxmtPB+KXEI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765516469; c=relaxed/simple;
	bh=T220WEU9NZI76xO/U+vERcDrJH4N6AoPOCjoo17Vq2k=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=pAxGlXS5u0Tcmg9JHyVVBQyOUOZCPuGuMHWwVfyG0VJkYJNb0HB40rFuojsNKxtmJSoOVRK0tewqpuCHAFRmc5ToHYho6p5qVavRzB0G/hoIFIpFjTMCf1QpqkQuZ3CLaBPgNQ/VkgVVgoJ/jWBN8PS1FxcVy7C+IjnjXy6uhpM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=jyt+Zca1; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=l1hM3gNO; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="jyt+Zca1";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="l1hM3gNO"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BC1gEWN2693142
	for <dtrace@lists.linux.dev>; Fri, 12 Dec 2025 05:14:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=Vy1fPjS/TdR0CVxIGHs3Rcpt1446JzAbgs2sFz7IykU=; b=
	jyt+Zca1y3OJSNabv/KDM8d0C7eGDZB86G6QsUDwAOfUrKgJFwsCmmWE1BhioWom
	0Mu/G0JNshRzRqQpyM7DHitAxElWMF3zVD8HhN5Xfn+29b+CFAP4V3vVPhs59spR
	fFm+vJbjXHWD7ZK1gVpy37AXG4JJgxcsH6L1Ye5x0n/aizfTIUpo7SPilV5/CGU4
	YAfx/66xYhBoHSP6xVNnNm+ztPzPeFyD9IeH3dn0y7uNgrHmWYo88NOHZ6Mh/K/T
	e2ltD5n9pQoRa+OO24wd77RybIxKJILaIsonGPeCYUd09nWIN4uoByUbs2TNS0BF
	zyXGJAbHm/itzVDIfvBCTA==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4ayd1mar7m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 12 Dec 2025 05:14:26 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 5BC4SRKi040231
	for <dtrace@lists.linux.dev>; Fri, 12 Dec 2025 05:14:25 GMT
Received: from ch4pr04cu002.outbound.protection.outlook.com (mail-northcentralusazon11013020.outbound.protection.outlook.com [40.107.201.20])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4avaxpde5q-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 12 Dec 2025 05:14:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uhTYvrODqJrGTAwf8DUOxTHxzVKBAa5NXzSOaKKNJTGvJ6O2uDB+/j604tgjj2rhLp9Gd2SZaVt6MzeeCeR05umAhh9qvOzrKYRbwO5s17LGv4o9emlP2G7KfAH3X37eTo0IUKGUAWzmQNL/QmNzK3NXHtUuvQd5V/7Xk3kk5+wrsG47Zsc/2j/IjqiHcJxEnV/gSADVxpD/y/37eqP6jMZISU3PYoez9O7GPpQuHoqCbZ8mLvy4parRvMokUXzJhN3eFSLHlP3noouoC81B6Oz90QNsi12jWeSJYCCoMf3puAjGuBh0FPsq+EZ0MJuD+apMxamj7L/EJdspeYaLBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vy1fPjS/TdR0CVxIGHs3Rcpt1446JzAbgs2sFz7IykU=;
 b=BXgQurvEJ3RjUmEAh5XvO0udusOvdqP82/HrLmRcILQofxGY2Mr1sjFDWU9hzNZqEebU/EZRU/83OWz3OyohZSOvQrmZ1Zd/lWEzgiJul6Yx1deM8QBDS4K+mhxZujWYMUkFn60/WIZit0N+ggVl3CfQtDjyeA64bohPU1v0C3MovFqIbviGx8mCRTAYrF0WkRJdmjciqYLeZ/EiFTcoriaMjMsfX5g3yQ3t9PGe0el20cghNf8vVQZeaQBa4T8ek0nHOSnq5BW7qmfkGcuLOUJFTCvDEm+duFaxsGu+fljQzl4WocB9iWVkABd4dVcTloMswpurk6L9s3RJxWKfsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vy1fPjS/TdR0CVxIGHs3Rcpt1446JzAbgs2sFz7IykU=;
 b=l1hM3gNOzFdig9mZk5pzhnNvFi3eUyl9/lGDNrAOzoXMG1XqjsS0SecB7m5GxDSEP23GPh3uAJOMUGORhh3UcmvRqxR0zxvhyuzJXhubRXyMllsEQtkRdQPSKTQg2PVl7U3Ce1Jw5oO2M58TNb5+UhVXFYiQ9ckp0FUZYfH/3dk=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by MW5PR10MB5852.namprd10.prod.outlook.com (2603:10b6:303:19c::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.11; Fri, 12 Dec
 2025 05:14:22 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b%6]) with mapi id 15.20.9412.005; Fri, 12 Dec 2025
 05:14:22 +0000
Message-ID: <0d4939ad-ad66-4b84-753a-288b2096d212@oracle.com>
Date: Fri, 12 Dec 2025 00:14:20 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [DTrace-devel] [PATCH] bpf: allocate the buffers BPF map to fit
 highest CPU id
Content-Language: en-US
To: Kris Van Hees <kris.van.hees@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
References: <DS0PR10MB7522B465E54B5F7C69B0609EC2A1A@DS0PR10MB7522.namprd10.prod.outlook.com>
 <31311402-ac1d-3c3e-4e2b-5e0ae861deb1@oracle.com>
 <aTubzAk0Ls/rv9vk@oracle.com>
From: Eugene Loh <eugene.loh@oracle.com>
In-Reply-To: <aTubzAk0Ls/rv9vk@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PH1PEPF0001330D.namprd07.prod.outlook.com
 (2603:10b6:518:1::1c) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|MW5PR10MB5852:EE_
X-MS-Office365-Filtering-Correlation-Id: a3d61ef9-676f-47e6-8b84-08de393d4fb4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?OUF2Q3lFb3V1Y25VbHdFWkxhbUNJRlhhVW5jRmRnZzdISlZCWlVJbmk5b0J3?=
 =?utf-8?B?dUc4U2VnUVMwY0dhb29BS1dTT1g2TVF3MGFHaVR5WUlwQ0oyTk9Uc0RIcEd4?=
 =?utf-8?B?L3QyeUxCd0Z4dUpsbk02cWhORDFMNlZyVWhYd3Y5Zmp4cVFqUnQzNTV2K2Vs?=
 =?utf-8?B?ZHc2SEI2RFhVMDhVc2puYkwyVWpnTEh0ampwRnpKRnRhbmp4UituQmtCWDlQ?=
 =?utf-8?B?cmJEVm0yZFczMjkrcW5UMmtKdXJrN1JVUWlSb29hWmNLMXhBQXBoR2VuZFR3?=
 =?utf-8?B?QWl5ZWNDSWI2T1lGVnJRK3o4cE5rVXV4dHZDeU41Mk01WUQ2ajJySGc5Y2VH?=
 =?utf-8?B?eUVHMU1lbmxWdGdYd0tOZGJzSUh3TklqRDEveXRZODlRWlFveDdiMDgyUHA5?=
 =?utf-8?B?a0xtMmMweFlPanZKL0cxZGdPWWVnWnBZY0dTdVdXT0JvZ3o2VlNXcmtIanZG?=
 =?utf-8?B?Z0h1VjBtS0Z6c3ptWmZBNWpETEZxMkRjQm5Yc1h3ZjJTOXg0TENOQWM3M2pv?=
 =?utf-8?B?QXpVQ0hTSXZmMk90TGYrL1Jnam9mUE0zb0VqWDZhMG90UnVWaUN4MGVRelAw?=
 =?utf-8?B?SG05TS9RZUpKekZDVTZOVWQranI0UWhtZVM0QU1HVCtsZ2tmQWpoLzZrNkJt?=
 =?utf-8?B?amNoU3BpMlNvSE5Oamd0NDlhWnZGREM3RVJYMVFxTm5tMUZYTHlub09kMzI4?=
 =?utf-8?B?akU5WUhKaWhlNHVSbmxvaWo3bjZFNHlONW1mOUl6c3p4M1IxWnFSMExjRURh?=
 =?utf-8?B?SEFjRWNvRDBKWDdTMFVBR3Z3OHd6eEx4cS9jRU9SZE9EUU5mNVpzMUZIaWdU?=
 =?utf-8?B?dXhsZmhaVmtLbVFNUG43dWVDMGF0TGpQMVg3ZHZ1VnNSMlJTaXNUVFQvQVQz?=
 =?utf-8?B?UU45UE05UXM3ODhwZS9KUHcrZTRhZUh3cUdVbWhEb2hPeEE3L2lIUUdDcEI2?=
 =?utf-8?B?OEMreVE1RkxGU3NuQmJpcitORndCbkRpRmY3M0ZoZTdmREV3enkvZTkxS0h1?=
 =?utf-8?B?MmFwVklVVFRGQ0IrUlM3MThsMDk0K2xTdnFHbE1GNVIyS1RybnBmSmVZVXJo?=
 =?utf-8?B?T21XRFFQaElFRXdPK0NOaE52aGxQTGUyZkprVCt0dWhtSnRrL05VRWkvR1Q0?=
 =?utf-8?B?T1dxeURXczlDWDRLYzhhZXBSL0xpUzBiK001Qlk1OXg1d05MaGdoRkNud1lG?=
 =?utf-8?B?TkJKQ1JadTBQQmFMQ1NxRER3ODlSL3BuQ2k3RFBmU2FBNmdvT1BXME51cGEz?=
 =?utf-8?B?dUV2aUxOME5RN2hhMDJXWmR2R1dSR01IRlZUbzhWSkE3N3I4azQvQXVqbGNH?=
 =?utf-8?B?Q3NvQm1jRDI1MlNHV1FKSFRiZzY1Y0tDcnVCTWs4aUxSUmZwVFJvSklGM09P?=
 =?utf-8?B?TkRYZnBuSEtRaHYxUFNQQmVNQTA0N0RhaVFtQ1JRRVNnRHRIZmlrUUMzdTk0?=
 =?utf-8?B?RTZBQWdzUG9KeDBza3pFUVFoTSs1YndZN1RiVld6UEllSGxVaUdXQzdhTDkv?=
 =?utf-8?B?VWFHQnM4bU9mOFY4QVJnUGVPMEVpSTQ2THZReEU2WXQyQXB5SWhMQjlNRDhI?=
 =?utf-8?B?V25DdU13b0ZnL2kxdlU1OTZEeDNTOU9XNmpKWi9kNlBQZU1JSVJhL0QrQkVC?=
 =?utf-8?B?djdNTzB1M055emRBMDcraHhEZ2tIL29rVVVScm1NL25ld2JJbDhRcE9ucTZO?=
 =?utf-8?B?SXZSZ0RyVkZvTkJwTEJWWmRVRnlUZkdkQ3pSZ09nQ1YzYjh0WkQ0SjloaG80?=
 =?utf-8?B?eGw1REVZQTRneW16OWNJYkFvNm83Sk80UHpqL1ZJcldMMGtUcFBMK0p5Rncw?=
 =?utf-8?B?N09oaDNWTkkrWDV2SmozVEVtbGUzdG9nY3d5QjFjc3JZUlFXSS9Pb0xqZWdK?=
 =?utf-8?B?S2ZVLy9UazZLK1JvZFVaMUVVaU5Fais4Q3RWSkk5QUNjdVJKbnZtQURvOTdT?=
 =?utf-8?Q?Rmejkj6A1ribiDq2PJsBoiidAgZTvwOG?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MlFZYWltYjdRY3lkdWd0OFFPdCt3MEFwbE5oMFcwRE9jQldZYlN0dU1KM3A3?=
 =?utf-8?B?djUreXB3RjRUeVdabktwN1NFM1dCdzlsVytxUWV2ZGFSdGhtejA1WmdDUVhy?=
 =?utf-8?B?Z2tMa0NXZFBqSUpuQ3NkL1pZRVgvcCt2SVg4SW1QY0paZkdkdnJzOFVIK2lC?=
 =?utf-8?B?VWJsWlJaU3ZoaXFUbS95YVZHSFcvUlRvcVhSUDlZM3ZJc1AyWWdMUDI1YU5U?=
 =?utf-8?B?cHl6WDN2dXp2eXhrVi95ZEhqVUgyN1J0S2dGYjg4ZnVXQWFkOTNhNy9FdXB2?=
 =?utf-8?B?V3M5akZDVkx2Si94VS80dmRJZitHVnBScUFtTVhsVDM3bjNyWElTK3pNRWQv?=
 =?utf-8?B?cExVcS9KTlh4QTUweXRDWnptdVBsZGtueDd0MzJMZi9rQ2QvRkplamtGdWcw?=
 =?utf-8?B?TkhTZi9KMDNDVGdzOGRhSTZ3czU2SVhka3ViWERTRXNJTU1iK1lKN2FRbm5P?=
 =?utf-8?B?SnR5UkRhVHZuc0JrZUx0ZklvemtWVmxrb3U1TTFHcU9DaDNoRm02V2U3YkZ1?=
 =?utf-8?B?RVBHRm9SMlMybU14MkFldVZJc2hPTEVxcit3QS92L2NDV3NiYW13QTNrU0N2?=
 =?utf-8?B?TGR2ZWZjZTRaQnYvVjVhdXhnY3l1YlhrK0hka3luSGgwMXh5QWNlZ1E3anJT?=
 =?utf-8?B?RGNreUFmUHNzdElRc04zZ2VvVTZ2UUtLMmhKczdiaFplUE05eG9KeTJrQ3Vh?=
 =?utf-8?B?SWRBZkdUbDlSUWMwUkFMR3g1bkFxSFlWR1FJWmRhRHhZSnBJZU5DczFpY0o1?=
 =?utf-8?B?dmtmb0hMTUxsMEpURVZ1aU1tMi9ZZVFBVExUSG5YckNQQXNacEdpWlBxUCto?=
 =?utf-8?B?WS8wSVZmR21oSDdGRDVoaHlNUGZaeVV4SXdwKzgyWnd6YkRDRnpmUG5HODRo?=
 =?utf-8?B?YjdWQnpVTW9rMlNNR3hZRmFSdjZUdWQzMEtFYjRhaHpEQndmL0hhNjIxaFdt?=
 =?utf-8?B?eno1RFI5ekpNTFFlUkNIU0N1NHJBRDREd29NczBBUkJpNUVLSzVwdWdtYlB5?=
 =?utf-8?B?blpRQU5DRGJ2V2pkQ21FU01OMVB0bFVCT0EzY0h0T3hpaDdlbnMvcXNhTEpV?=
 =?utf-8?B?bTNxVUFKNFVYTmV6aVkzT2pHcjE1aE9UQ09yUmFwNUlzOHExWGVBVHlNclBn?=
 =?utf-8?B?U09CdTJjYmdzQ2xuVFFNd0dnM0ZKM2FIVlZES3NIWU9SQjZIMlgyT3Y1cGJn?=
 =?utf-8?B?QmNjSkVOMDl6b0VYbzJod01zWThGM003dWFJVzdmZXJkNFNaZUxlbXlwN0ow?=
 =?utf-8?B?MkZPODFWck8xTndXQ3BCdjNyTTdULzcxb3JyUkFmRHc0M3pocmJpQytoY3R2?=
 =?utf-8?B?UUFlWm1BSEVjSWFvQmo1ckg0UytUWW5TL2ROVWRTeU04VnRDcStBLzV6dHhL?=
 =?utf-8?B?NWZIekY5UFFydVV2OWdtTzBGbXhWR0NtZkdIdjR3YjNTNGx4SVRPb1NtMzVx?=
 =?utf-8?B?OU5FUmJWZm5lUjZ5UDQ4TWpHSy9Ucm5sMGJ4U0YvR1RJTzdKWUhUTUN0VWNn?=
 =?utf-8?B?cllsOWpabmlRay9vaytFSVh3bGMvRlVRWlFpZFoyeTBrTkZZTklhSDh2MU11?=
 =?utf-8?B?eHo4SEM2NlREMldaRlVvbGlicE10OXZjMEVwN0ROMk1KbUVjRStMVENGT1dM?=
 =?utf-8?B?emlobW1aZlg0UmxpMnkvQnFVZHd0NHJsemZDQUV0SG9GaXhxc0lnUVhBTEZh?=
 =?utf-8?B?NzlNZnpRbjdYQ1kwK1czenZTcFFQa2sxWllUbXlHNUlvVFZxRVp4b2VhK25k?=
 =?utf-8?B?SUo0a0RLTlVrTmpHZWVxUzlGQkxlc3dtcFY0K0E4bzdIKzh2VHFoNXFaR1dW?=
 =?utf-8?B?am9tcG9BQkw5c1MvU3MyTzJRbnUyYTJTeHVobVQvOEZMMUkzZm5Nd0hxNDdq?=
 =?utf-8?B?eDkwRzVuYUMxN0hPSitxQVlpTmpZTHdhbW9sdnJQV3hkSzBxSnNPTEJxdi9q?=
 =?utf-8?B?b05kcy8zaXZtSlQ4VHlVM0dZUURDRGg3elN2N3BXZUdtU21BbFVxV1U5RHRQ?=
 =?utf-8?B?R09hV1oxS0NkeExWK1FJZHNFVi9xUFBpMU1LUkV5eHY5QzdtSVYyMXRxT2RV?=
 =?utf-8?B?bTRuS0NmTWkyVWRMMEg5R21Vc2J5ajBKVUtrTVJTdUl0NnRvbkx5MC9vdHpk?=
 =?utf-8?Q?VbP18eGgbIBsP8h+9+m3Jb7Ya?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	PW8bZs3gxNBEhskhbFxfPK2dsRd0z8wGwtY5PwnWqo3bBt/f/iP4JCeg+IhP2DT/ncXsiILADy+rCP4HlYf1LDP3J1MxADMliFg8rcwelOI13sWpP3X3H12UKzStANsfrdOBhYu5m2f8MQIDO1ancKNbKu9GcgalyjaIEhxNBBzK7To9DaxPD1cAzD6p1ErYcAQbHMPiScLN0vJIct8cmM361FOd3EeQxz+Hf+Nqwb4EFLhCWilNsp/XgF2k0Z4Q+UogrhSYqG1PVkoszky5G+Tmw2Y9ar5G3Zy1IZlW2OIcGxRv47ahfHI6IEs8Dpb3sWJmzyLGtT+O8dSQPgxbZlYJM/epGEYR5Igclx5H8OG0yyqS9g5dj0k9QhKLJLaBZo9wb7KTePuToUmuSFQfoetiRIj88HBghj7lRjlNECuaaRM3+Fz7lfO9cENaO0SHJQmjhbAlV/gxhlYh3b6GzkyEXmwYMPYit26U9wqKtLgXS0x7wSTzwPw9lVUuTfgvIKxzTCbuJk5f2/dC3lOGVMR1oOYqArphLtmfjQhSkIZzMk89azS3H9/AwoMMntJI+JhrFvP+aW4RA+4ZuS88YlPfWXLzWlnvE59Vv97ixDs=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a3d61ef9-676f-47e6-8b84-08de393d4fb4
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2025 05:14:22.8091
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h6+LEtWvMYN8TWeBfhcG/9Gg5ogFSIJ0ukrRZ6E8zKXyHwEdxN4Fm/cn/gB1tE0/7YPA2ezh7Y9129OFSZXRkg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR10MB5852
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-12_01,2025-12-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 bulkscore=0 phishscore=0
 suspectscore=0 spamscore=0 mlxlogscore=999 adultscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2510240000
 definitions=main-2512120038
X-Proofpoint-GUID: u4M69bcTLo9A80EDpMgW_EJXacuPm0JM
X-Authority-Analysis: v=2.4 cv=HvZ72kTS c=1 sm=1 tr=0 ts=693ba4b2 b=1 cx=c_pps
 a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=yPCof4ZbAAAA:8 a=EUG-hh_JZaKcIDnT3_oA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 cc=ntf awl=host:12110
X-Proofpoint-ORIG-GUID: u4M69bcTLo9A80EDpMgW_EJXacuPm0JM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjEyMDAzOCBTYWx0ZWRfX9KZUjy4dIqwL
 g4QM6CBJM/Qaup5DW3IWZrqrkG5wrHbHU5+diu8cfOjkcK81+KGW+pdIZIsJy5ukggMUxqJLZeu
 59NuHBMYKJ6XHbzWO+GeCrJ/RsR04GdUaVRA8sSyF2j/bW7ki+Mx+iPNuYFg1FgPnmG6tpYp4Ug
 DTIEBFBX6nSwvtwdt1mqGoVtb5sa0cvRYC7Ag8pgU3/HDpJVugJ0RpjiERYmM3zBy+2el7KbGfh
 Tli4OQNaFDTWN5OWfa2sGFHVjzPSQ+SVgZpwkh83IXQy+OGsr0qwuT3hu6FQr7jlgWBBGSqQzwL
 y0xE2dy7LZ8Ldp8yEFxfxR7BPOdq2+jJEe5W7o2T0oJUlZgRuPoxyiGEIguSCXiIzO3Z/qm0pIV
 WXFYomXZ6m7NoqlDgxZnDk+J6MPl4KJG1o4t3F0QgxQgXARGCAs=

On 12/11/25 23:36, Kris Van Hees wrote:

> On Thu, Dec 11, 2025 at 06:16:37PM -0500, Eugene Loh wrote:
>> On 12/11/25 17:22, Kris Van Hees via DTrace-devel wrote:
>>
>>> Even when less than the possible number of CPUs are online, the 'buffers'
>>> BPF map should be allocated based on the highest possible CPU id because
>>> probe data is written to the bufer
>> I guess a problem here is that we do not test this case.  It would be hard,
>> but I suppose we should change this situation?
> I am not entirely sure we *can* test this properly specialized configs.  The
> problem came to light on a configuration that conveniently demonstrated the
> problem because of a large gap of unavailable CPUs (0-127 possible, but only
> 0-7,100-127 were online).  Because in that situation, it is quite likely that
> the CPU on which the events we are interested in occur falls beyond the end
> of the buffers BPF map.

I think at some level we agree that it is possible to test but that it 
can be hard to do so (automated, regular, etc.).

>> What are the chances of our at least writing out what is per online CPU and
>> what is per possible CPU id?  That way, a future developer would (hopefully)
>> not have to reverse engineer this stuff.
> What do you mean?  What is not clear about the current implementation?  I
> do not think that there was an issue here of things not being documented
> sufficiently - I simply made a silly mistake in the code.

Maybe I just get easily confused, but it seems to me someone needs to 
reason through the code carefully to track what is per on-line-cpu 
index, what is per cpu id, etc.  E.g., the "aggs" map is made with ncpus 
(which in that case is max_cpuid+1) and the "cpuinfo" map is made with 
ncpus (which in that case is num_online_cpus).  So for someone like me, 
it'd be nice to say what I should index with what.

IIUC, there is no documentation, let alone safeguard, that these per-CPU 
things are being addressed correctly.  Instead, we are to read the code 
and reason locally about whether that is right or not.  And then we do 
not (regularly) test the whole thing?  That just feels brittle.

One thing I do when I look at a patch is ask myself whether a problem 
that's being fixed needs to be fixed in some other locations as well.  I 
didn't do that here since that's time-consuming and tedious.  I guess 
it's a question of how thorough one wants to be. E.g., "We fixed a bug, 
so we're done."  Or, "We found a problem that could occur in very many 
places, so let's check them all."  Or, "We got bitten by this problem, 
so we really need to test for it."  Or, "We only have so much time, so 
we just need to move on and hope for the best without thorough code 
inspection or regular testing." There's a judgment call to be made.  
Certainly fixing one bug is good.

>
>> It seems to me that this patch is an improvement over the status quo.  On
>> the other hand, given the limitations on what we're doing -- notably, the
>> lack of regular, automated testing -- that should probably at least be
>> acknowledged in the commit message.
> I again do not know what you mean by this.  It is not an improvement over a
> status quo, it is a fix for a genuine bug.
>
> I also do not think it is fair to say that we lack regular, automated testing.
> That is something we actually *are* doing (i.e. the build-and-test robots we
> use internally).  This is a situation that primarily has not been detected
> until now because we don't have all unusual configurations available for
> testing at all times.  A system that has this gap of CPU ids in the list of
> online CPUs is not common.  We can look into building a system just for that,
> if we can, but it is the type of situation that hardly any automated testing
> would uncover.  You simply cannot test everything.

Is there regular automated testing on systems with gaps in the CPU 
numbering, that stress the case where the sophistication of the code to 
handle gaps is exercised?

> I can add more details to the commit message about what the exact problem is
> that is being solved.
>
>>> that corresponds to a given CPU id,
>>> which could be part of non-sequential CPU id configurations.
>>>
>>> Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
>>> ---
>>>    libdtrace/dt_bpf.c | 2 +-
>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/libdtrace/dt_bpf.c b/libdtrace/dt_bpf.c
>>> index 0a57b7d2..6568a572 100644
>>> --- a/libdtrace/dt_bpf.c
>>> +++ b/libdtrace/dt_bpf.c
>>> @@ -755,7 +755,7 @@ gmap_create_buffers(dtrace_hdl_t *dtp)
>>>    {
>>>    	return create_gmap(dtp, "buffers", BPF_MAP_TYPE_PERF_EVENT_ARRAY,
>>>    			   sizeof(uint32_t), sizeof(uint32_t),
>>> -			   dtp->dt_conf.num_online_cpus);
>>> +			   dtp->dt_conf.max_cpuid);
>>>    }
>>>    /*
