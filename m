Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC6A22163A5
	for <dtrace@lists.linux.dev>; Mon,  9 Dec 2024 10:37:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733740667; cv=fail; b=Sh+i2T33k8309BRaohvx9bmmE7heBfYCpaamV+3SdpYTJdh2jPoT7dR4e1Oa0Cyv5vp7C5ewg8V9LMYWWwR2/Ghv2NTd7PxrYwlAts9GeRMOoKPgx2bEbisXW/lyEQ1JUem4Y0IYJDRIW53ZCmKSYtSqbQo3jrD9Pn3s6Kb1ZC4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733740667; c=relaxed/simple;
	bh=lOWMbWwWqV0O1KIuzCSuibb4SQdTArbzXP5YRFjPby4=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=W43pB2XzlOmvV1sOeaqGNM1bPvwjYTscMmzuqg6NYnH1LuC/c589yZ5pPxaN8O1DZUI0t7TcpvfGFqnYnLICvcuWkzybq7+QAfcNbeTFY0brKCRfmnHZJCh83IlzNGrqnwoU4d/qw52vgva0qHzcgQL6UiPLm1y4KQ5qqAiekFI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=jDZTD2is; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=WVTARXmh; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="jDZTD2is";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="WVTARXmh"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B98g0ra000418
	for <dtrace@lists.linux.dev>; Mon, 9 Dec 2024 10:37:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=513S9/o89OwENDuqioZBwXOp3iWa0aTOywxj9LSEJek=; b=
	jDZTD2isiLEXwWjTxQJl/OvJHodhNZP9NvjDK33+8C4Q/przaB8u5N8vNZyG8f7k
	cBvmKKnLNa6jAGRkeByaOPsAP8p7GZjNjuUiGxkseBUycwmYAJry9xQ4No/10aw+
	nbKfn5+mbFyjC+7Ns4HOxblEPM7Nns0XbM9rbGjOBPq365VoUlYNMdDkmckO2eSs
	xw9RSv7qcjiMuwiffX9/Mb++SxMcyQlVKBx2obRkxh/iUi1/a4EKjEkvWILfSBop
	Qn4jbmzIMOsqfGcjCpGSTLn998C2j3V+A1L5eY4S3s8zUVqSfSyJxwxgnBiK83hk
	wneEE4sjygX7M4aemzQdIA==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 43cd9ajxpx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 09 Dec 2024 10:37:44 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 4B9AON1e009633
	for <dtrace@lists.linux.dev>; Mon, 9 Dec 2024 10:37:44 GMT
Received: from nam04-bn8-obe.outbound.protection.outlook.com (mail-bn8nam04lp2045.outbound.protection.outlook.com [104.47.74.45])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 43cct6v490-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 09 Dec 2024 10:37:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QQnoNTxC5cqv1Sct3+81iH+UMPYzhDQs2k9gRX8wX69khbn0l6TU0tjmSOVPb1UQEk5bRmao9pXubtNxLgNFIZOEr7+YMl8CtsNOTUrksUwnmVLX2gLoBeigY91tSF4sq9KvsAdNn6I9S52R3C8zaJPuuF9o8mGjwPmmq3sPtg6mhIQUyRrXW6gg7BfcOoMu0adtvQO79Wgwm/pJspxi2ui23x3tnp6CJUJ5P2Lgzsb8J2/aB5nHNGoZh3NJZgLCSk53yrp7MeUwuyFrNXoWDFKUyZpJbMQIimj/zWdsXE3Mcz4OAh+lQVfOFqIQEs0+dKn2jSZOQn0Ty8AxC6IZ0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=513S9/o89OwENDuqioZBwXOp3iWa0aTOywxj9LSEJek=;
 b=zPs+M0E31qHuMP64i4T0Kmb1wrjONyEas2ihp3E3SJjokdWRcZ8g3B90N+HGfAh07IGOqgV+TIjGxaAgCcMPfA1+KV+BP/vDKQklYSObph5UaFl9A+E9he16bsAwT3KXZAF9/tvIbRSNTZ+jrFl+dGMr/nlocLw0SyRgFsJfV/aHDw6J3ZNM8XPTa3uYblIS5iPyMRia7gl0WZ1I/vOQLmFU5k5LZ1+VgytN595n1v+uFmyGUhbX2liUIzx1s6lwvh+x9PUzXx7KfQZa1OjVepJaRqj22X4WSG3YjgErPF7omZ0ljwen46BC2x7a1Sxvx5IYBi2qKEwG4gnrR24Oyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=513S9/o89OwENDuqioZBwXOp3iWa0aTOywxj9LSEJek=;
 b=WVTARXmhF8ZutN71appKJSf53AU51s+Ls20ykH41dsEu018zj3yQDXhlSqoSIhzz/npi1HDCopvdLFC+eHNxsZBSa1U3Ygxf6BtgejddmBs7P/rspJ2KxZu0UE5iiP09Ckx94isiiRlGM33Oul9mR0QpulTp/W4eIvOuzcBx3xI=
Received: from BLAPR10MB5267.namprd10.prod.outlook.com (2603:10b6:208:30e::22)
 by CH3PR10MB7306.namprd10.prod.outlook.com (2603:10b6:610:12c::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.12; Mon, 9 Dec
 2024 10:37:41 +0000
Received: from BLAPR10MB5267.namprd10.prod.outlook.com
 ([fe80::682b:c879:9f97:a34f]) by BLAPR10MB5267.namprd10.prod.outlook.com
 ([fe80::682b:c879:9f97:a34f%3]) with mapi id 15.20.8230.016; Mon, 9 Dec 2024
 10:37:41 +0000
Message-ID: <827f0154-48c9-4092-a8f9-5f5116049899@oracle.com>
Date: Mon, 9 Dec 2024 10:37:37 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] rawfbt: new provider
To: Kris Van Hees <kris.van.hees@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
References: <PH8SPRMB00374BF4E363FDE8B36D9E86C2302@PH8SPRMB0037.namprd10.prod.outlook.com>
 <7b734e3f-2892-4282-9067-1b3ed69a8262@oracle.com>
 <Z1MncJ4JVhQBc3Kz@oracle.com>
Content-Language: en-GB
From: Alan Maguire <alan.maguire@oracle.com>
In-Reply-To: <Z1MncJ4JVhQBc3Kz@oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM8P190CA0023.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:20b:219::28) To BLAPR10MB5267.namprd10.prod.outlook.com
 (2603:10b6:208:30e::22)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BLAPR10MB5267:EE_|CH3PR10MB7306:EE_
X-MS-Office365-Filtering-Correlation-Id: e4b59b48-c9ab-43be-0066-08dd183d81ee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|10070799003|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VXd5WEl2VjJyTHJVVmoxaUV1aGFKUU41aG5UM0xCTzBzWUpaam9vTklqdy9E?=
 =?utf-8?B?MXFTV0k0TUNTM0pidnJtUU1JRVowcno2MC9uNjFHZmtHNWRVU1ZZdUgrdkV2?=
 =?utf-8?B?eEduZDdwUGVQSExsc1hDbkxzVm83VzNhcnV5OXNVZFJvMDJiVUc3N2txc3Qr?=
 =?utf-8?B?Qm9oTjdXRm4zVWQ2dVRZbUVINnRRTGRBYXdWLzVlbTVFZmpxakZhWVFzZk9q?=
 =?utf-8?B?TzZhODRPQzBKdng0bGNCa28zakpXekRpUU9rK1pZNVVlU0NNeVhNVlQ3MDFO?=
 =?utf-8?B?UVpRR051ZENXVWxVTTNTM1QxeXdFMXlXM3NBWXV3SXdMaFR2T1lIeXM4WlEz?=
 =?utf-8?B?QWhJem91QTlKVGlWcjQ5SGlFUkhaNitnbWRmN0NSeStaUWl1Nkp5K3pSYkQ4?=
 =?utf-8?B?V0ZtWEprYVc5SFAwb0lFeFZ0bE5ZUHNyU1YyQWQzQmNHUU0rMEw1OVVLQXZI?=
 =?utf-8?B?bzRwcktkb2hwbDIvYnVPbHI4ZEtneEh5QituY3NjOUxnMlRFcjBKMVh3Q0xi?=
 =?utf-8?B?TE0zZ0FFa2tRSkI1S3dyOXgvUUJhU2FDemI5QUFjRzZVbXU4SUZkZ1B3czRk?=
 =?utf-8?B?UFdMVm00ejh0SVRCZ0U4REh4bVlXNldwbW9JOUo5aUh2anJqL1B6ODVaSldD?=
 =?utf-8?B?NjdQQ2hDWCs1UjZxOWVDL2xFOXM2MmlncTN3ek9Nc1JnbXltTVA3c1JSQjds?=
 =?utf-8?B?NWRFMzczWUZ5UFpxMm8xTmtLRml3cTJoN3dLTUpJM0VPU3JSaENFdXg1RFBL?=
 =?utf-8?B?QkJYQWZzcDZERU53azJKeExIcGRicmlHbElLQzk4UDM4MklucjNkbXdHdWNX?=
 =?utf-8?B?NHNCalNTUTFrS1E2bjZuNnd4V01VUTRLWUEwdUtvSkNzelhmL1MzNzZjeHcv?=
 =?utf-8?B?NnlVbFJPdTBjdmd4RzFBcFFlMzlISTkyd3hNOWNRWlVtVVNPWlR6U2VURWNy?=
 =?utf-8?B?NFA3dVpTeUd0Mmx3UlFGMXNaWlAxTDJscGJ2TmxxKzFUeEdZYzFlQVhkV2hY?=
 =?utf-8?B?NVJpc2FrUXhFQ1hkMWZmM3J5ZG5PVzBFS1hwUHlmcHA2aFBPNmZZaURlZVF0?=
 =?utf-8?B?a3FxQXprS3R0THo4Y0kxR0VYWXdxNzZFRlMvLzlvZ0s5cHVkZERubGIzOERz?=
 =?utf-8?B?N25QYWJ5N0laZnFrVHJDcndSZTk1ZjZXcXFmOWtUbVg4OHFnN0t1QlNXT3Qv?=
 =?utf-8?B?ek1oVlhrMnJvdzYxYmtjMmNQbHhvVFJkcVRVNzljeUZjb25UL3ZpamM4dWk2?=
 =?utf-8?B?Yi9CZVhaeC9SbEg1R3FsakdIUWFQVEpjWk8vY0Z5UTRUeHJtYVc5RTFNMGRt?=
 =?utf-8?B?M1dqSWt0NVE4TWlldk5XZURpampOcU1NUXI5QUM5UkRuK2xsb2dtUWpKdWhF?=
 =?utf-8?B?ZHlFRUhqK3hYMVo1eFA0cmZ1QVpjNHpjcHBXU2tFQ2dwNUxWaGJkZ0ZNTTBi?=
 =?utf-8?B?TjN4MFlTeUlLOEZGbU5tUmg4dlpWMXpsODlvb1F0VVZON2NIb1lEVzJZR0g0?=
 =?utf-8?B?MW90N21yNUd0U25wWUpnUzFkdEhuNVYwekZQbkNzcUJjQmFzU3NyKzdHN3p0?=
 =?utf-8?B?SXc4WHYxMGxkNzZpNENIbjc4bnR2NTVDdUx2WWZIajZ3dmhMb25PY3IzbTd1?=
 =?utf-8?B?Z1FIdHRLYlU0UHNZam1hSklBK1doL0NoRHhBWEJxQTJkb0FUZENDUEkrUmh3?=
 =?utf-8?B?YVZYaXpXWHV2SXUwMmRqdjE4VTR5Um1XVXhaTEQ2WXhnSUg5UjBiTjlPY0Ir?=
 =?utf-8?B?RGowQlMycXNaSDFpZmgzVWJKNld5V2t2eWFvaXROVVF4d1IrRHhQRzQyN2Rx?=
 =?utf-8?Q?sQ/XwyIEUYTz2spJSG9DZMKpYO3DlYtp0aOzI=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BLAPR10MB5267.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UFNZNkdJK2llVEZyN3FpV3o2bHBZQ3BDVmlKcEQyZVRIVkRCU3VBZUhqUDdO?=
 =?utf-8?B?ZHRCb0t4dFo1bnN1cGh4MlR3RGVUMStQdkkrcTNJZCtnQ0pBaTY5ckxzVGFE?=
 =?utf-8?B?ZTVScHh6MldETnkvdjJjTkoxeGxpREVGdEt3dzIyeG91UE1PVUQwZDBTckhI?=
 =?utf-8?B?T3VSM2hlUXZaWlNLUE9aVnlkcVlrSnpEeEovNDBtRUxCTkNXRUtaNmUvbXV1?=
 =?utf-8?B?Q3IvQ0NRcUhCQTR6V3RIK3NGMU1zMkdhaWcwalhtT01aVnhEL29DZTdYeXZE?=
 =?utf-8?B?ZitiRi95UGsvMkYxcGtmaVZCckJpYjl3SmQramYxWHU5VTJjZ3FTcHZxTFJy?=
 =?utf-8?B?NjFBMjNoTGEvanZtMjE0VWFtbkxRUHV6RCtSazZHNWxEZG1mQlNMcTlRQzNY?=
 =?utf-8?B?dURpaDhMMEZvL2ltUVJWcWJVWWhrQmJCbWNRTHBJWFdNdzZidWl3VU5sa2xC?=
 =?utf-8?B?RGp6Szk5ZXc2bitFMElTZjFXaVJQcDVQZWI3QjFTQjNKeDJrQWhEakgvUWpF?=
 =?utf-8?B?UWdrYlBTaUVoZkd6RHBTMkUzaGdpL3lIRmxLWmJpQTRNS1k3bkFvOFFEOU5j?=
 =?utf-8?B?NmUwQTM5dFo1UW9IKzJJN2VFMjVhVlVaaE1jNGtyMXFucHhBQ3ViUzFOY2ky?=
 =?utf-8?B?bnRleXZKNC9kY2pyZGlhdHBhM3Boa09mam16cHZlRDd2eU5VS1J4akhyWW5Z?=
 =?utf-8?B?d3kvYzVxc0xZYVRFQm9ZbW9ObkEyaDhURTYyYk1nSmMzQmkxMDdoV3B1ZDZy?=
 =?utf-8?B?VXhMUkZuZGZVeGdYbU5RU0pKQm91TDNVRENaUCs5WG91My9nSzhocks0aERn?=
 =?utf-8?B?WEx3dW5OVDZXUDFya0cwYm1TOS9BU3hDSkxlejkxKy9rMDJUVFNzOFpZM3Nn?=
 =?utf-8?B?UXhCU2N2MjB2THJHQ0NqdzFBV2dqVEJYMTloRlNJQkdpZE9hS0pCbUlYY0Vt?=
 =?utf-8?B?L0RySUM3ald1bDB5RHloUWVRS1pqVDVzZjlpZHkzczhXcFVGeVpxNUViNnFo?=
 =?utf-8?B?cWRpYm9CNHB1S0d0NUtacjBzMCtoSVQ4YkxYVTFraVpGMGV6engvNHBXZDQy?=
 =?utf-8?B?eHVkQm5zZW9oZjJHRlhvOGhXOGI3SzdLYkhPSUIvVkJhaE43RlMzWURWZkVp?=
 =?utf-8?B?ZGZoSEtkU0tlNXZBSXV2cGlGM2Y3L0w5VWY5T2xaRTJacitObDlnMVBsNUZ5?=
 =?utf-8?B?Q0dGTDJaaXZxQ1lVc0RWQm51dXlmMnhVV0QrMmY0ZDU4bEMrOWxPT1IzS0VQ?=
 =?utf-8?B?YzlHU0xRVDFTN3J3QnovSnFRcGR6K2tpZWJqeTF3WXhFYUFweU5BZStscWpU?=
 =?utf-8?B?ZjlGWmZncHBYNm9aUlUzZTVKWFZaT1JXZnZZQjdGbWNVeEFNcmZ6MzlPSFJN?=
 =?utf-8?B?QUZ5MDFJRGJYK1UvcVNUbWt3d25tOGl0UWd3ajBvQ2R5N3gvZlB0cXFZbGxs?=
 =?utf-8?B?Y2M5M1IyckJVS1BaUmxXUGErRDBsd3o2eXRYRFBXd2x2NUZwdngvL2gvQ3R3?=
 =?utf-8?B?R3BrT254dVlaMGFjRmt1NFp0aDdZZW9TTEE5VEhQMnNvRFZyR2Z0eURUUGU1?=
 =?utf-8?B?N2IrRTZCeTh2eTNkUDhUa3lnTGJnVVJLVTdTOCtBekNDczRwSDBkVXBnQmtC?=
 =?utf-8?B?a0NHVVIySlQyZ2xiUUpjS2tXQmhma2lpZ2s3K3NqWUFoRE9Ib3lmWWlBVkd6?=
 =?utf-8?B?NkhzWHRaYnNoSk1yMkxueWVoUnNra3J2czMxMzRaSDEwSncxNjFPNysrYWZx?=
 =?utf-8?B?bGhVQStRZkFxdzZINlErNnlaZFkzRXFXR1Q4VXQwOWhWRWV0cUw5bGJNSnJU?=
 =?utf-8?B?VzJnemhLQ0tIVS96TVdLT1hWQlJLTGdWYmNXWDVSSW9ZYU9zUG1yLzBwM2cy?=
 =?utf-8?B?b3phWTJwMjRBczVnSTY4UWM1NzREUVIxK3JxVXdzZWFEeG11bjVFV3RwUDRz?=
 =?utf-8?B?RWh3eXROT3dPNFFDYXlCUGUycGlLOExJZ21XTUE1R2hCaHVQbUxwWk5QcmF3?=
 =?utf-8?B?bmt3bHVIVVpJRm1oNnN5NXNhSW5BMFBGc3JHQjB0NFZGNmYzaE4xYUtNanVo?=
 =?utf-8?B?SHRoSU5VZy9YRE5EODE4WVpGMnhBdmNFQ0pXRFJYVWt4UDdQTkRxVllCVHcr?=
 =?utf-8?B?ZFhrcVZpRndDUTYzdDFPbzNtdUVNblZ0YlM5bGJ0Z2NPSkwxWVBkUnVKcGo3?=
 =?utf-8?Q?bhUfv4q71V/qBPjvfo7+0xc=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	KHSRaYTc89YWva7buyuQc6YRlluVjnA29x4Ovk4D/TflYI6zBJOTOtbkpTDb83Gg2VzTrANnq0HVNHddU/5J8rZTWyhC9dN26c3ZDjNhwVhDBW+LtCSVl6m3XXTIWcDnpdbT6o/N0Ywdm2zJR8JG2M57jBRW+fedn+d9X3h0pMnMjwm/RRwSod9oGaq2F5k79e+n33auLt7ZXCmVnDSaBw6fz865Ls/HvxiKtcLV87m30RP+av5dZ8nMVqIE1pCjpAr8FZbepobfCPZVPcZNdE7OFgQ4u4eTBwM1ABkGtF9wESn/Y6rZbS2Lz4tLyvQfWrseKMAxn1sNcGS2UADBXCdgCBg6L/MPtzMcx6p8QuSfNFdRVILbvxXrpr2pPJuWcDapyAOarW15auXLjPyiJ7Dd0nxVIBBveDmy6oC2qqsWFff89g/Q2ctDJJwFvlg+8XWXSdDutidQRsTNKDVJ3d+nfA+m8WC3fr5CAxXCuAU1S+aErfQrtBDX7dBOP+0MoX8JUkh4XuJW00KYwyqe5ojdxSQxEbYEmguAcGgByjGjA88W22rjAJcl3oj04gcMnsbkTPW3Zy2nfPJgwKhrSNAz2WZspryZYAZpHY2py+A=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e4b59b48-c9ab-43be-0066-08dd183d81ee
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB5267.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2024 10:37:41.0770
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Yk4xFOcAOSe97l0YIkPZyxUXVo81m0ddkGvb4cUGyPRm77ZyW7mSJ3+Lbj2gqSDIdaKR/eoEwAmqT2jHwY0szA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB7306
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2024-12-09_08,2024-12-09_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 mlxscore=0 adultscore=0
 malwarescore=0 mlxlogscore=999 bulkscore=0 spamscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2411120000
 definitions=main-2412090082
X-Proofpoint-GUID: 6XEvnYj2ufBLQyzwOS_uReDTN5284sVR
X-Proofpoint-ORIG-GUID: 6XEvnYj2ufBLQyzwOS_uReDTN5284sVR

On 06/12/2024 16:33, Kris Van Hees wrote:
> On Fri, Dec 06, 2024 at 10:35:50AM +0000, Alan Maguire wrote:
>> On 05/12/2024 19:42, Kris Van Hees wrote:
>>> This provider provides access to all kprobe-based probes that are
>>> available on the system.  This includes any compiler-generated
>>> optimized variants of functions, named <func>.<suffix>.
>>>
>>
>> This is great! Having a rawfbt allows users to still trace cases
>> where fprobe can't currently handle.
>>
>> On the .suffix; I get that this is intended to be a raw provider, but
>> would it be better for stability to expose these functions as "func"
>> rather than "func.suffix"? It becomes difficult to write portable
>> scripts when suffixes are included, because wildcarding
>>
>> rawfbt::func*:entry
>>
>> ...to catch both suffixed and non-suffixed variants may end up tracing
>> func, func.suffix but also func2 etc.
> 
> The trouble is that exposing <func>.<suffix> as <func> will mean that you
> automatically end up trying to probe *any* <func>.<suffix> whenever you
> place a probe on <func> using rawfbt, which is not necessarily what you may
> want.  And there would not be any way to avoid that.
> 
> But by not collapsing them, you have the ability to catch them all anyway,
> if you want, by specifying <func>, <func>.* instead of <func>.
>

I tried that with the rawfbt code but got:

# dtrace -n 'rawfbt::xfs_cleanup_inode.*:entry {}'
dtrace: description 'rawfbt::xfs_cleanup_inode.*:entry ' matched 1 probe
^C

This matches xfs_cleanup_inode.isra.0, looks good so far. However:

# dtrace -n
'rawfbt::xfs_cleanup_inode:entry,rawfbt::xfs_cleanup_inode.*:entry {}'
dtrace: invalid probe specifier
rawfbt::xfs_cfs_cleanup_inode:entry,rawfbt::xfs_cleanup_inode.*:entry
{}: probe description rawfbt::xfs_cfs_cleanup_inode:entry does not match
any probes

So the absence of the non-suffixed function (which we included for
portability) triggers the failure. So looks like it will be necessary to
add -Z:

# /sbin/dtrace -Zn
'rawfbt::xfs_cfs_cleanup_inode:entry,rawfbt::xfs_cleanup_inode.*:entry {}'
dtrace: description
'rawfbt::xfs_cfs_cleanup_inode:entry,rawfbt::xfs_cleanup_inode.*:entry '
matched 1 probe

So I guess as long as we document this clearly for folks wanting to to
use rawfbt to write portable scripts, it should be okay.

Alan
