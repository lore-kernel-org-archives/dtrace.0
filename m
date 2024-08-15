Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E27E15E88
	for <dtrace@lists.linux.dev>; Thu, 15 Aug 2024 22:40:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723761629; cv=fail; b=gjKf0BCGySnl1Z2scwiHifmTmfV+LWXsJKbcIFAKtDc3NJRpA9jNaXcGFlyCAfgGx3uFLrYdtyoF3kFnk+RvxwWFH6jAM8L9Sdhngl5puIV9iJyH9znnUeXjf+Z8WSiSYiQu5Oi6kPKuc1pmUd8pUqxQAuCXQ4hyNVOIWn/NddI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723761629; c=relaxed/simple;
	bh=g9ucIwI5T+RzZUjNJ8KX6EDgbmxCavol0uamxrQt7WI=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=qvs9oBd7IjQFcxY7K48sFDJIYfZB42BE3m/5QXgNwo6uawoZ3AOdhU6Cfv82ggmYTFxJQumH5ck7oUzYBxVuoqaeJdrgC78q1Tb7JatsMDobBEgSACFACNOM3F9t4rI7eVMyXJWp+yeF9kMSe2vcBptzs9qo0PD16Ci3bkuGCH8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=OWZBxRn/; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=RZ1a2/Ob; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="OWZBxRn/";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="RZ1a2/Ob"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47FLx4ZG018623
	for <dtrace@lists.linux.dev>; Thu, 15 Aug 2024 22:40:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	message-id:date:subject:to:references:from:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=
	corp-2023-11-20; bh=eR4p04Gpi3LH8OID68Mnh/HXloteGjVQbJkxh4h1nUo=; b=
	OWZBxRn/b7otw6UHHHFoJaB1r0rryswoLxx0C4p1N74YxeJfVmS6sUPAu6RZBpMy
	8PZOvaKsBbmyV4ydfhxTCGtV+14l0cfaUtR9em8ns124wj99jDI7MSQF+godiYNo
	HSs4h9jdaFPOn3jFtS4DaoXWM28Axv/VMNUPc62YXm33Fyl5NDwqFwNvq3e8izLa
	h8Ae2wrALBmx03d8M0JTndapPKST4jxgXxIceWUFFZJjr6gzmdNx9k3jkFuuXleT
	CBoRBykwJb+QNOYOCbfdQnHl6BPTTK+wyVifZ3camU0M1m6RkKtZHK6bOO9ASFy9
	WHADafI2TC0/+pGkF/CKwA==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 40x039bbda-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 15 Aug 2024 22:40:25 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 47FLFvNM003446
	for <dtrace@lists.linux.dev>; Thu, 15 Aug 2024 22:40:25 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2049.outbound.protection.outlook.com [104.47.55.49])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 40wxnbkhhe-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 15 Aug 2024 22:40:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iY9kZfMAIKjvxuEfdBSXksMyus9iziQ8Y0ut3rnagnnvYM4bNtXf9Hx3/ODNzwXuvyJkkC5GWLPfxoTZr01ueFHuibAyj9UToKPEoIJioL2zLyJiVAldqPWP4+1mZNQoLd6ocCi0MG/6FnJzowiGfwWs/WjAyrxQVKmZUkdPazwpRW/dJA0bi0/6A03iiQ7KZ268gZUNCCnmeVgUrUHfeMuXm2EvUOM8EXjXNCaw4RjAlSgQR5vSQYfoUdRpApbAd4XyE4uWHVJZ4G2kte9mlVxM7FTOyoVc6ijTpjvLfLd1106sEXc4Z79wUtZXhQ2jIbkm9vHIwPCxzHVITueiNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eR4p04Gpi3LH8OID68Mnh/HXloteGjVQbJkxh4h1nUo=;
 b=kXs5q4ZZwyOSeuN+sZkzJk9mhqw5l8tOd4RgkZyOYSCjbhClIhWuVmqCv/1+pLtdUv7d1MfeXpxvbfPZsEbrCThrYCupvC0NSbw+oZZBA7FBkzJEzbCpW8M0I6X2n+9cQYj5hV3mcvf4oxPYvn/lc5Svfjt+qUog/U2caYH8+olhr4zqXGKg4guJX7My4FoDocX0GCfvDOtnfoNC0gfTVTZfZN8/ZuYWeegluQsY1Iz3vx6iB4UMK8pUNki3r6C1uPcRBT5+tmGgGYZ8i+uzFD2srFaTyie9UObK2TnEi5JVsRQngzu2ipS+EU6Ii6KCHBlt9PbW9liqLsi0CHNdOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eR4p04Gpi3LH8OID68Mnh/HXloteGjVQbJkxh4h1nUo=;
 b=RZ1a2/ObbmbjPAQ8ZlRsW273VtLpnrSQ9+a3vcD8PhNEvkjUebNJKDw5MyF8Oux7xFtX9MLkxx4X/+BGJNN4+h8sxjIN0Y29CrqYjiRanc/mKDhY7GhQQRt9FXtrHs3NLfpeZTfki9a7mYg1fRWpEENMEb3NZo2KAt+FrA22ZKY=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by IA1PR10MB6098.namprd10.prod.outlook.com (2603:10b6:208:3ad::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.9; Thu, 15 Aug
 2024 22:40:21 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%3]) with mapi id 15.20.7875.016; Thu, 15 Aug 2024
 22:40:21 +0000
Message-ID: <0a853052-9594-b654-b4ed-2d4f3b11d59d@oracle.com>
Date: Thu, 15 Aug 2024 18:40:18 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH] agg: move aggregation declarations from dt_impl.h to
 dt_agrgegate.h
Content-Language: en-US
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
References: <SN7PR10MB6287B6602E0EA3DAF6FA4532C2802@SN7PR10MB6287.namprd10.prod.outlook.com>
From: Eugene Loh <eugene.loh@oracle.com>
In-Reply-To: <SN7PR10MB6287B6602E0EA3DAF6FA4532C2802@SN7PR10MB6287.namprd10.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BL1PR13CA0176.namprd13.prod.outlook.com
 (2603:10b6:208:2bd::31) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|IA1PR10MB6098:EE_
X-MS-Office365-Filtering-Correlation-Id: 98764d72-1eca-474d-577c-08dcbd7b3ecb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VS9FaElCdWlTLzZML1E1U0JzN3ZsNFZFMGtWc1RHWE9UeTh2TUExR05mRmZw?=
 =?utf-8?B?cTFwVVgzTWpWT2x4VXpicVIweWs5Y3lUVUFKdWdjMkVOY0tHMW9WSzc3aHdx?=
 =?utf-8?B?dDV3WUdveHMyY1pjMkJTaWJ0dmtRYVROd3hvRVZmY2haOFhhUVl4NDFsbzRP?=
 =?utf-8?B?b3U1eGVxWFdCajE0RjVlRXZwNkxaRWlkek5SN1hXUWJaZVRPbURHZWQvdEU0?=
 =?utf-8?B?RC9zZ3NTSUNwczkvWlFTUC84MkFFbzFIbDlobTZxdVNPb3VMSytRejhGcGQ4?=
 =?utf-8?B?MURmNW9aTXR1RkM3TXpna0tWdzV0YStoRlNMV1I5SG96NDJYdXFScFdUTnYz?=
 =?utf-8?B?SFg3TFpIQWNoVUVFQ3U1NU1DMStHbkV1NXNnZjc5TnNxTTNWcDNFSTVMUkw0?=
 =?utf-8?B?NzhCeDMzS1BhcmFMYWVabkc4WlVsUlI0cWZpWXRoTXJTUVp2ZkFpaWUrVzQz?=
 =?utf-8?B?dTdmemFHM084NmxvNkxFM3kybXJsaUljTnhidmJOQ1J4UmtwRGI4dGVoV1NT?=
 =?utf-8?B?Q05oYnBxYTlYbHdMWDkvL0prZ1RKa2Q1U3paS21kMzZBMlk4S3F2YVhJaXhR?=
 =?utf-8?B?MnVqdXB1aHgrZTFIRHc1MVYyN3BCS3MyWkpOd0M2TWg4TmNoT0c0RTBYdUF0?=
 =?utf-8?B?UGwyRUNDaGNPcHJQbVhVYk13SW92SDBXZnRxRmZTSTZDSXJnNHdUTytFQ1c3?=
 =?utf-8?B?VjlJZlE1dmJWOTk5THFYS3BkL1FsbnFVQllwdWRJQUVqNmlxUFJkYzRseW5V?=
 =?utf-8?B?dDdyOUxacndtQUVzWUpLZ0hqZHRZMnc5TlkrVlJPQlAxNFRqb3JQQ0RhUi9X?=
 =?utf-8?B?WGZXcFh2d1dlZ2VpV1pGY2ZmV2t6SytoS3FMTW92aC9DMWVwTjZYQWNtalJC?=
 =?utf-8?B?bDBWeXRVM0FsQ04rdVRVZCtKVDJKdklqenlSUExLdlhwZFUzY1hPWDhaZkxu?=
 =?utf-8?B?ZWcyYVlaQ05GYlBucXNDRTVrRHB3MytVQzkvSU1XeFRjS01wZ1JBa2FPS3Qw?=
 =?utf-8?B?K2I0WUoxT3N1bXI4ekw0UmloNWlzMTNQeTcyU24rb3hmTE5mcHZDVTg0RE5T?=
 =?utf-8?B?cmdnUm5jOTY3aFY0SGszZjMxYm1lL2JzNUZhcWIrRUpaRytFeU12cXRBeTg5?=
 =?utf-8?B?ZHNhZG5DOGlaTnpuZDBHeTN4bmVhVGp0RE9xa1BGdFdZTnA0L1BSb3JhWlNO?=
 =?utf-8?B?U2hVaWpOQml5cjN2Y0lJWkl3M2xaNmt2NXVWMDZXdnpiTEVZeFl3aW1kYi9z?=
 =?utf-8?B?YU9Zcy8rOXlYb0oyT016akdxdW92VVFDWXZPYzYzeDRBcG41a3o5eWNZZ0tZ?=
 =?utf-8?B?elRGL1VPeEoxWjQyeVdVelVYeldjZUtIQzNFSHBkQmxzS0RTcFpXdEhJcmh5?=
 =?utf-8?B?eXpwR0x6cGluc3orM3ppVXBmYkJwNlNENmtBNzlya0Zpb00ySjhRWnI0SHUx?=
 =?utf-8?B?dTVyQklXTlZIODZBdTVOa3R4VnREdTliZ05DOWVHNkhsWGkwQ1Q0cHUxcEFr?=
 =?utf-8?B?RVUrN3JMVytRUy9OSk9kS3plYlZYQnFHMmxGMGxSdGxocHNORDhaREJIQVpT?=
 =?utf-8?B?UTJWVTJINEZnck54Yk5KeFZrTkx5R2ZIMUE5c3VEdUIwYUUzQXJ4THo1Syta?=
 =?utf-8?B?YWFEdlUzVU1jbzhqeDBpNGdiMlUyeVFPODB1WnlSbHQzd3NjNit5WUJqNVFL?=
 =?utf-8?B?QlZ3TDJXajlPU2VPcHl6T0hKQzFTbzJ2ZmZ4aUhOTUl3TmhhVXhiTzhDK1ds?=
 =?utf-8?B?YkZkaDRzcStZeTZqVHduR3Z6Zm9xdncyQlhFSTlIRmNUcTJzemN5cUgzU1BS?=
 =?utf-8?Q?SPKyZqqPLLPPdMOsjRaorC96gj2M5GaboNNIE=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ak0zSmYxbitKOEFaY1IwS2tUWGI0NFNLUGdlUU0wV3dpWVdiWWVjbDdZZlZI?=
 =?utf-8?B?VVBQQTJsNzVtOVluQVQzVHFIRUdpSXg4Y2FNaFY5dlYvbis0bWw2dDJhV1o2?=
 =?utf-8?B?R3hzd2V3SlBRdFAyRkFjclRsU1hWR0F5TGJMUDh2MFhXMU8wc0hWM0lHaEU4?=
 =?utf-8?B?bk9GQkpqRnEyZ3JJZVJldW14QUVMSEJEY0diTXZjTFRuZ0xkc3oyM2xPaVo1?=
 =?utf-8?B?S1QwdmNnM0dSQWNNdjFmK21RUFIxeU5ud1p0eXRxWWpSekRhN1lMRlMwWi9x?=
 =?utf-8?B?bERGZzh4Y1libTh4bmI5YW1TVWVsUTErWkZULzhtTjFMOG8rMytxcTJ6bERW?=
 =?utf-8?B?VTdxTWZxSm8vMXpKbENZZzRzbDVuWHdKbVpEOC9vM2FPMFFvcCtPVGZ4U2VF?=
 =?utf-8?B?U28xcGY4eXFZbkhla0wrRUVQTG9aenFEZFJTM0RsckZpZGNQanMyU0p3TUpm?=
 =?utf-8?B?TFNBdExzekJWODIySE94c054blRLSUx0dW1GWFU5eFUwOHNTUHhpcmtTV0lQ?=
 =?utf-8?B?VDNHcHRHSDh0RFZ3K3lnS1BXckJsVERBT1FWZWRxbDAzbUQyRHRwTzRZVGlE?=
 =?utf-8?B?YTNuSU9pK2RIc3pIVW56eUpjZ25mUG1Dc1RjRFY2ZHY5U01Yb0V6V0NoRHd1?=
 =?utf-8?B?d3R6OXBoTHhoaC9vdFllOUxRYi8wNVdiRXhNZXNvdEhYYUVsNGtwZXhISnVH?=
 =?utf-8?B?dERYc3JaRnNWaDduYkNXS1RmeEgweUhGeEp1UFA5S3RoRk82YjdqTFQ4OUxZ?=
 =?utf-8?B?WFBqcTZGVW9sdUxsbWlqTHhWRm1QclJVaWs3NlZOck1xcGZzQW5ieDdzSkN2?=
 =?utf-8?B?QkZOS2ptZTFiUXFZOFZVMldlUmFXN2w2NTcwbkJlNEFKZUNJRldoNGFIMUZx?=
 =?utf-8?B?NFBJcS9xREpjTzNLMUpXMWNBTUE0TFJZRTFHL01SUjlzelQ3THk5UTFkenU0?=
 =?utf-8?B?eklud01GM3ZVNWs1QXhkVHluQS8rY2Z4SmFDNkpheFdZREljd0hJdjJFMW1t?=
 =?utf-8?B?SzJzYmVWUFdPVWtTZW9YVTlIZkZNZG5pS0cvRWZZMEQ1eDJUMVZwRllGcmNI?=
 =?utf-8?B?NUcxTC90T1dIVHg1TVBMTXlhd1pnWkdMeUU5TmpqNXlEWlVtcG52KzVtd2Yv?=
 =?utf-8?B?RytJKzlSdlZJbENYcERLVHgwMm8rWnNlazVMSmJhSnFaYzg0M3ZXWk9OK3JV?=
 =?utf-8?B?RW1LL1I3N05pdXJod3BPV01lanhHbjEvVUkxR1FPN25sWDJLMmpFZlJublFw?=
 =?utf-8?B?YXA3ODFqQzQzczlRckRrK3N4eFZFb0hjdWsrV01lV0x3eHF2b04wSEZjWTdX?=
 =?utf-8?B?RWxnaW9FYUNkY3I2VG9EYzBZbXZ1c0g0ZVFhVnN4S2ZWOGFGTUtLaXZLV3BE?=
 =?utf-8?B?bE4zWDlKNGFYeVRXZE00b29KYkF2NHI2N1BSSTdCcFNXMzNlVW00RFkxK3R2?=
 =?utf-8?B?dHJWREEzWEVydFhoTjhHZWpKZ3NIeGhEOFEwdEQyRWZYQUxzMDY5Y2pvclU3?=
 =?utf-8?B?RjlsaEJ0WHU1Nm9JREZtRjVUK1dGU2plSVNaTEpoeVVKVDBzNlhydW8zZWZr?=
 =?utf-8?B?MENHOXVMaEIyL2k5R2tWM3htdTZraUpPL3NUd1RUdlk1aUpNZ0hQb1dlT2tm?=
 =?utf-8?B?NnZ4bUVyZmRyeHAraExrSTAxbld2cTFSakZiK1lLeWdJZkZVR1FJR0gvMHlr?=
 =?utf-8?B?cEF0ZGZ1MHp6dDFkZWlVWEFZMTBJMFB1ODhER0lEa2lPR1pMZ05hS1pFQ0pW?=
 =?utf-8?B?M2FYMlByTnlvQng4MXFEV29UNGswdnkyKzMrOFhwWTFUNjBmSEdjQ0dpbDdz?=
 =?utf-8?B?R09IMGNQTGZzaklxdmRjemFaUnhETTAzQmZ4MDNRRUswWjJVWG82L05oM2lP?=
 =?utf-8?B?NUJVWmxQWFppZ0IyWWMvUmRWTS8vZnFXdGVtUHIxR0x2Q0F0alg2N1FrRGdS?=
 =?utf-8?B?ZmJEd3lTbHo4K2M3WDRrTjBtODViQ0FRWldDWUYrZ0hpWTNOM2VKVW9lNzc3?=
 =?utf-8?B?Nk1WUTJvU0JUeVZjL2dVQ3JhbXJIYmJkZTZhZjRRWWNwNmJSV3BjaHhiaTZU?=
 =?utf-8?B?blJ2RjhLc3V1STVBZnZNN0dJdityOVVIZVpTbEdMMFBZa2cvNVhvVEZQNWU1?=
 =?utf-8?Q?k7jIcFHj5Ds4IJslVJSb0gGNk?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	ylH2dzvsWIzr+iSq1Lt0N0QYUKSuOaZmxbvncYX46z/ANMjtCv1VFi+QPJj6EBm1V9HxpJcggqZ08bWADOlU/S3iYLPqqpCW78yBoLJhaP2+u3oBA1EG3F7eR1LlCCJhJ7EL0ZbqyZaHP+I+9m5gj1xtCO0XS/ZJxdlSxWGLEjQFA4IcYyVWehJt3MXiknxkspDBBIckJcex5oyRdamRvNttMNhRv7T6hFy+OWK8EjVNf+Qwm1iozuRVh4NyGoKh83thKzTydM9mPJszAJLh6g81yJEJKeHDPIFGpst+YEWHdAwFGpiFKmCNZDsDL6nfDxpjwdmSgMLcl2O5eTY4fYA3TyfIfTUM6VwfxYApV8clPR7Le3uGCzyZDxQw4vjOoS2LVAC483JWS8xL8jVHxrgvHj+6LPgW081td2Canjl5buxAikLSOtVUoG0+rGpfsDI4xoh16cWCXTay/RaOEglm4+BOsiAqG7fQfrEHUzXu1AWjJVwXc/+duasD42Z9mhW2NLvrqXZmh0ilWzb7tC/1H1e8X5z4JSLYBGpo5fsOkpATs5zh9FsywlDCoFQsJpBOkUiEjji4ehVPB43onYoS3w1gNwj9OjrnyYLdSdU=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 98764d72-1eca-474d-577c-08dcbd7b3ecb
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2024 22:40:21.3521
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3n/KNcmE/XB/FSmI/y18WNabQkDERnjz+blaDUAVWRxT7f0SyO/AL5YOqgcDIXwnQQTVjX1lUrAQmFw2ob8avQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB6098
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-15_14,2024-08-15_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 suspectscore=0
 mlxlogscore=999 phishscore=0 bulkscore=0 malwarescore=0 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2407110000 definitions=main-2408150164
X-Proofpoint-ORIG-GUID: G-yGg0IL9pSDbwPHhgEDDru5C-XYfHFs
X-Proofpoint-GUID: G-yGg0IL9pSDbwPHhgEDDru5C-XYfHFs

Reviewed-by: Eugene Loh <eugene.loh@oracle.com>

I assume it compiles.  So that's the main test.

I assume you mean to get rid of the #if 0 blocks (two instances) in 
dt_aggregate.h.

Do residual
     #define DT_AGGDATA_COUNTER     0
     #define DT_AGGDATA_RECORD      1
remain in dt_impl.h?

Mention the dt_aggregate allocation thing.

On 8/15/24 17:07, Kris Van Hees wrote:
> Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
> ---
>   libdtrace/dt_aggregate.c | 64 +++++++++++++++++++++++-----
>   libdtrace/dt_aggregate.h | 91 ++++++++++++++++++++++++++++++++++++++++
>   libdtrace/dt_cg.c        |  1 +
>   libdtrace/dt_consume.c   |  1 +
>   libdtrace/dt_impl.h      | 53 +----------------------
>   libdtrace/dt_open.c      |  3 ++
>   libdtrace/dt_options.c   |  6 +--
>   libdtrace/dt_printf.c    |  3 +-
>   libdtrace/dt_work.c      | 13 +++---
>   9 files changed, 163 insertions(+), 72 deletions(-)
>   create mode 100644 libdtrace/dt_aggregate.h
>
> diff --git a/libdtrace/dt_aggregate.c b/libdtrace/dt_aggregate.c
> index 6472360b..329b8ffa 100644
> --- a/libdtrace/dt_aggregate.c
> +++ b/libdtrace/dt_aggregate.c
> @@ -16,8 +16,32 @@
>   
>   #include <libproc.h>
>   #include <port.h>
> +#include <dt_aggregate.h>
>   #include <dt_bpf.h>
>   
> +typedef struct dt_ahashent {
> +	struct dt_ahashent *dtahe_prev;		/* prev on hash chain */
> +	struct dt_ahashent *dtahe_next;		/* next on hash chain */
> +	struct dt_ahashent *dtahe_prevall;	/* prev on list of all */
> +	struct dt_ahashent *dtahe_nextall;	/* next on list of all */
> +	uint64_t dtahe_hval;			/* hash value */
> +	dtrace_aggdata_t dtahe_data;		/* data */
> +} dt_ahashent_t;
> +
> +typedef struct dt_ahash {
> +	dt_ahashent_t	**dtah_hash;		/* hash table */
> +	dt_ahashent_t	*dtah_all;		/* list of all elements */
> +	size_t		dtah_size;		/* size of hash table */
> +} dt_ahash_t;
> +
> +struct dt_aggregate {
> +	char *dtat_key;			/* aggregation key */
> +	char *dtat_buf;			/* aggregation data buffer */
> +	char *dtat_nextkey;		/* next aggregation key */
> +	int dtat_flags;			/* aggregate flags */
> +	dt_ahash_t dtat_hash;		/* aggregate hash table */
> +};
> +
>   #define	DTRACE_AHASHSIZE	32779		/* big 'ol prime */
>   
>   /*
> @@ -34,6 +58,21 @@ static int dt_keypos;
>   #define	DT_LESSTHAN	(dt_revsort == 0 ? -1 : 1)
>   #define	DT_GREATERTHAN	(dt_revsort == 0 ? 1 : -1)
>   
> +int
> +dt_aggregate_init(dtrace_hdl_t *dtp) {
> +	dtp->dt_aggregate = dt_zalloc(dtp, sizeof(dt_aggregate_t));
> +	if (dtp->dt_aggregate == NULL)
> +		return dt_set_errno(dtp, EDT_NOMEM);
> +
> +	return 0;
> +}
> +
> +void
> +dt_aggregate_set_option(dtrace_hdl_t *dtp, uintptr_t opt)
> +{
> +	dtp->dt_aggregate->dtat_flags |= opt;
> +}
> +
>   static int
>   dt_aggregate_countcmp(int64_t *lhs, int64_t *rhs)
>   {
> @@ -503,7 +542,7 @@ static int
>   dt_aggregate_snap_one(dtrace_hdl_t *dtp, int aggid, int cpu, const char *key,
>   		      const char *data)
>   {
> -	dt_ahash_t		*agh = &dtp->dt_aggregate.dtat_hash;
> +	dt_ahash_t		*agh = &dtp->dt_aggregate->dtat_hash;
>   	dt_ahashent_t		*h;
>   	dtrace_aggdesc_t	*agg;
>   	dtrace_aggdata_t	*agd;
> @@ -621,7 +660,7 @@ hashnext:
>   
>   	memcpy(ptr, data, size);
>   	agd->dtada_data = ptr;
> -	if (dtp->dt_aggregate.dtat_flags & DTRACE_A_PERCPU) {
> +	if (dtp->dt_aggregate->dtat_flags & DTRACE_A_PERCPU) {
>   		int i, max_cpus = dtp->dt_conf.max_cpuid + 1;
>   		dtrace_recdesc_t	*rec = &agg->dtagd_drecs[DT_AGGDATA_RECORD];
>   
> @@ -658,7 +697,7 @@ hashnext:
>   static int
>   dt_aggregate_snap_cpu(dtrace_hdl_t *dtp, processorid_t cpu, int fd)
>   {
> -	dt_aggregate_t		*agp = &dtp->dt_aggregate;
> +	dt_aggregate_t		*agp = dtp->dt_aggregate;
>   	size_t			ksize = dtp->dt_maxtuplesize;
>   	char			*key = agp->dtat_key;
>   	char			*data = agp->dtat_buf;
> @@ -692,7 +731,7 @@ int
>   dtrace_aggregate_snap(dtrace_hdl_t *dtp)
>   {
>   	dtrace_optval_t	interval = dtp->dt_options[DTRACEOPT_AGGRATE];
> -	dt_aggregate_t	*agp = &dtp->dt_aggregate;
> +	dt_aggregate_t	*agp = dtp->dt_aggregate;
>   	int		i, rval;
>   
>   	/* Has tracing started yet? */
> @@ -1104,7 +1143,7 @@ dt_aggregate_bundlecmp(const void *lhs, const void *rhs)
>   int
>   dt_aggregate_go(dtrace_hdl_t *dtp)
>   {
> -	dt_aggregate_t	*agp = &dtp->dt_aggregate;
> +	dt_aggregate_t	*agp = dtp->dt_aggregate;
>   	dt_ahash_t	*agh = &agp->dtat_hash;
>   
>   	/* If there are no aggregations there is nothing to do. */
> @@ -1149,7 +1188,7 @@ dt_aggwalk_remove(dtrace_hdl_t *dtp, dt_ahashent_t *h)
>   {
>   	dtrace_aggdata_t	*agd = &h->dtahe_data;
>   	int			i, ncpus = dtp->dt_conf.num_online_cpus;
> -	char			*key = dtp->dt_aggregate.dtat_key;
> +	char			*key = dtp->dt_aggregate->dtat_key;
>   
>   	memset(key, 0, dtp->dt_maxtuplesize);
>   	memcpy(key, agd->dtada_key, agd->dtada_desc->dtagd_ksize);
> @@ -1171,7 +1210,7 @@ dt_aggwalk_remove(dtrace_hdl_t *dtp, dt_ahashent_t *h)
>   static int
>   dt_aggwalk_rval(dtrace_hdl_t *dtp, dt_ahashent_t *h, int rval)
>   {
> -	dt_aggregate_t *agp = &dtp->dt_aggregate;
> +	dt_aggregate_t *agp = dtp->dt_aggregate;
>   
>   	switch (rval) {
>   	case DTRACE_AGGWALK_NEXT:
> @@ -1281,7 +1320,7 @@ int
>   dtrace_aggregate_walk(dtrace_hdl_t *dtp, dtrace_aggregate_f *func, void *arg)
>   {
>   	dt_ahashent_t *h, *next;
> -	dt_ahash_t *hash = &dtp->dt_aggregate.dtat_hash;
> +	dt_ahash_t *hash = &dtp->dt_aggregate->dtat_hash;
>   
>   	for (h = hash->dtah_all; h != NULL; h = next) {
>   		/*
> @@ -1302,7 +1341,7 @@ static int
>   dt_aggregate_walk_sorted(dtrace_hdl_t *dtp, dtrace_aggregate_f *func,
>   			 void *arg, int (*sfunc)(const void *, const void *))
>   {
> -	dt_aggregate_t *agp = &dtp->dt_aggregate;
> +	dt_aggregate_t *agp = dtp->dt_aggregate;
>   	dt_ahashent_t *h, **sorted;
>   	dt_ahash_t *hash = &agp->dtat_hash;
>   	size_t i, nentries = 0;
> @@ -1428,7 +1467,7 @@ dtrace_aggregate_walk_joined(dtrace_hdl_t *dtp, dtrace_aggid_t *aggvars,
>   			     int naggvars, dtrace_aggregate_walk_joined_f *func,
>   			     void *arg)
>   {
> -	dt_aggregate_t *agp = &dtp->dt_aggregate;
> +	dt_aggregate_t *agp = dtp->dt_aggregate;
>   	dt_ahashent_t *h, **sorted = NULL, ***bundle, **nbundle;
>   	const dtrace_aggdata_t **data;
>   	dt_ahashent_t *zaggdata = NULL;
> @@ -1829,7 +1868,7 @@ dtrace_aggregate_clear(dtrace_hdl_t *dtp)
>   void
>   dt_aggregate_destroy(dtrace_hdl_t *dtp)
>   {
> -	dt_aggregate_t		*agp = &dtp->dt_aggregate;
> +	dt_aggregate_t		*agp = dtp->dt_aggregate;
>   	dt_ahash_t		*hash = &agp->dtat_hash;
>   	dt_ahashent_t		*h, *next;
>   	dtrace_aggdata_t	*agd;
> @@ -1864,4 +1903,7 @@ dt_aggregate_destroy(dtrace_hdl_t *dtp)
>   	dt_free(dtp, agp->dtat_key);
>   	dt_free(dtp, agp->dtat_buf);
>   	dt_free(dtp, agp->dtat_nextkey);
> +	dt_free(dtp, agp);
> +
> +	dtp->dt_aggregate = NULL;
>   }
> diff --git a/libdtrace/dt_aggregate.h b/libdtrace/dt_aggregate.h
> new file mode 100644
> index 00000000..33921a72
> --- /dev/null
> +++ b/libdtrace/dt_aggregate.h
> @@ -0,0 +1,91 @@
> +/*
> + * Oracle Linux DTrace.
> + * Copyright (c) 2024, Oracle and/or its affiliates. All rights reserved.
> + * Licensed under the Universal Permissive License v 1.0 as shown at
> + * http://oss.oracle.com/licenses/upl.
> + */
> +
> +#ifndef	_DT_AGGREGATE_H
> +#define	_DT_AGGREGATE_H
> +
> +#if 0
> +#include <sys/param.h>
> +#include <setjmp.h>
> +#include <sys/ctf-api.h>
> +#include <dtrace.h>
> +#include <pthread.h>
> +
> +#include <sys/types.h>
> +#include <sys/dtrace_types.h>
> +#include <sys/utsname.h>
> +#include <sys/compiler.h>
> +#include <math.h>
> +#include <signal.h>
> +#include <string.h>
> +#include <stddef.h>
> +#include <bpf_asm.h>
> +#endif
> +
> +#ifdef	__cplusplus
> +extern "C" {
> +#endif
> +
> +#if 0
> +#include <dt_bpf_maps.h>
> +#include <dt_parser.h>
> +#include <dt_regset.h>
> +#include <dt_rodata.h>
> +#include <dt_strtab.h>
> +#include <dt_symtab.h>
> +#include <dt_ident.h>
> +#include <dt_htab.h>
> +#include <dt_list.h>
> +#include <dt_decl.h>
> +#include <dt_as.h>
> +#include <dt_proc.h>
> +#include <dt_pcap.h>
> +#include <dt_dof.h>
> +#include <dt_pcb.h>
> +#include <dt_printf.h>
> +#include <dt_debug.h>
> +#include <dt_version.h>
> +#endif
> +
> +typedef struct dt_aggregate dt_aggregate_t;
> +
> +#define DT_AGGDATA_COUNTER	0
> +#define DT_AGGDATA_RECORD	1
> +
> +/*
> + * Aggregation functions.
> + */
> +#define	DT_AGG_BASE		DTRACEACT_AGGREGATION
> +#define	DT_AGG(n)		(DT_AGG_BASE + (n))
> +#define DT_AGG_IDX(n)		((n) - DT_AGG_BASE)
> +#define DT_AGG_NUM		(DT_AGG_IDX(DT_AGG_HIGHEST))
> +
> +typedef enum dt_aggfid {
> +	DT_AGG_AVG = DT_AGG_BASE,
> +	DT_AGG_COUNT,
> +	DT_AGG_LLQUANTIZE,
> +	DT_AGG_LQUANTIZE,
> +	DT_AGG_MAX,
> +	DT_AGG_MIN,
> +	DT_AGG_QUANTIZE,
> +	DT_AGG_STDDEV,
> +	DT_AGG_SUM,
> +
> +	DT_AGG_HIGHEST
> +} dt_aggfid_t;
> +
> +extern int dt_aggregate_init(dtrace_hdl_t *);
> +extern void dt_aggregate_set_option(dtrace_hdl_t *, uintptr_t);
> +extern int dt_aggregate_go(dtrace_hdl_t *);
> +extern int dt_aggregate_clear_one(const dtrace_aggdata_t *, void *);
> +extern void dt_aggregate_destroy(dtrace_hdl_t *);
> +
> +#ifdef	__cplusplus
> +}
> +#endif
> +
> +#endif	/* _DT_AGGREGATE_H */
> diff --git a/libdtrace/dt_cg.c b/libdtrace/dt_cg.c
> index 164f9e5f..cce2535c 100644
> --- a/libdtrace/dt_cg.c
> +++ b/libdtrace/dt_cg.c
> @@ -16,6 +16,7 @@
>   #include <linux/if_arp.h>		/* ARPHRD_ETHER ARPHRD_INFINIBAND */
>   
>   #include <dt_impl.h>
> +#include <dt_aggregate.h>
>   #include <dt_dis.h>
>   #include <dt_dctx.h>
>   #include <dt_cg.h>
> diff --git a/libdtrace/dt_consume.c b/libdtrace/dt_consume.c
> index 07856746..6ad73324 100644
> --- a/libdtrace/dt_consume.c
> +++ b/libdtrace/dt_consume.c
> @@ -14,6 +14,7 @@
>   #include <ctype.h>
>   #include <alloca.h>
>   #include <dt_impl.h>
> +#include <dt_aggregate.h>
>   #include <dt_module.h>
>   #include <dt_pcap.h>
>   #include <dt_peb.h>
> diff --git a/libdtrace/dt_impl.h b/libdtrace/dt_impl.h
> index 88b31ce0..fa2b2602 100644
> --- a/libdtrace/dt_impl.h
> +++ b/libdtrace/dt_impl.h
> @@ -83,6 +83,7 @@ extern "C" {
>   #define DT_NULL_STRING ((uint16_t)0x7f00)
>   #endif
>   
> +struct dt_aggregate;		/* see <dt_aggregate.h> */
>   struct dt_module;		/* see below */
>   struct dt_pfdict;		/* see <dt_printf.h> */
>   struct dt_arg;			/* see below */
> @@ -197,21 +198,6 @@ typedef struct dt_kern_path {
>   #define DT_DM_CTF_ARCHIVED	0x4	/* module found in a CTF archive */
>   #define DT_DM_KERN_UNLOADED	0x8	/* module not loaded into the kernel */
>   
> -typedef struct dt_ahashent {
> -	struct dt_ahashent *dtahe_prev;		/* prev on hash chain */
> -	struct dt_ahashent *dtahe_next;		/* next on hash chain */
> -	struct dt_ahashent *dtahe_prevall;	/* prev on list of all */
> -	struct dt_ahashent *dtahe_nextall;	/* next on list of all */
> -	uint64_t dtahe_hval;			/* hash value */
> -	dtrace_aggdata_t dtahe_data;		/* data */
> -} dt_ahashent_t;
> -
> -typedef struct dt_ahash {
> -	dt_ahashent_t	**dtah_hash;		/* hash table */
> -	dt_ahashent_t	*dtah_all;		/* list of all elements */
> -	size_t		dtah_size;		/* size of hash table */
> -} dt_ahash_t;
> -
>   #define DT_AGGDATA_COUNTER	0
>   #define DT_AGGDATA_RECORD	1
>   
> @@ -245,14 +231,6 @@ typedef struct dt_tstring {
>   	int		in_use;			/* In use (1) or not (0) */
>   } dt_tstring_t;
>   
> -typedef struct dt_aggregate {
> -	char *dtat_key;			/* aggregation key */
> -	char *dtat_buf;			/* aggregation data buffer */
> -	char *dtat_nextkey;		/* next aggregation key */
> -	int dtat_flags;			/* aggregate flags */
> -	dt_ahash_t dtat_hash;		/* aggregate hash table */
> -} dt_aggregate_t;
> -
>   typedef struct dt_dirpath {
>   	dt_list_t dir_list;		/* linked-list forward/back pointers */
>   	char *dir_path;			/* directory pathname */
> @@ -387,7 +365,7 @@ struct dtrace_hdl {
>   	size_t dt_maxagg;	/* max aggregation ID */
>   	dtrace_aggdesc_t **dt_adesc; /* aggregation descriptions */
>   	int dt_maxformat;	/* max format ID */
> -	dt_aggregate_t dt_aggregate; /* aggregate */
> +	struct dt_aggregate *dt_aggregate; /* aggregate */
>   	struct dt_pebset *dt_pebset; /* perf event buffers set */
>   	struct dt_pfdict *dt_pfdict; /* dictionary of printf conversions */
>   	dt_version_t dt_vmax;	/* optional ceiling on program API binding */
> @@ -593,28 +571,6 @@ struct dtrace_hdl {
>   
>   #define DT_ACT_MAX		31
>   
> -/*
> - * Aggregation functions.
> - */
> -#define	DT_AGG_BASE		DTRACEACT_AGGREGATION
> -#define	DT_AGG(n)		(DT_AGG_BASE + (n))
> -#define DT_AGG_IDX(n)		((n) - DT_AGG_BASE)
> -#define DT_AGG_NUM		(DT_AGG_IDX(DT_AGG_HIGHEST))
> -
> -typedef enum dt_aggfid {
> -	DT_AGG_AVG = DT_AGG_BASE,
> -	DT_AGG_COUNT,
> -	DT_AGG_LLQUANTIZE,
> -	DT_AGG_LQUANTIZE,
> -	DT_AGG_MAX,
> -	DT_AGG_MIN,
> -	DT_AGG_QUANTIZE,
> -	DT_AGG_STDDEV,
> -	DT_AGG_SUM,
> -
> -	DT_AGG_HIGHEST
> -} dt_aggfid_t;
> -
>   /*
>    * Sentinel to tell freopen() to restore the saved stdout.  This must not
>    * be ever valid for opening for write access via freopen(3C), which of
> @@ -828,11 +784,6 @@ extern int dt_reduce(dtrace_hdl_t *, dt_version_t);
>   extern dtrace_difo_t *dt_as(dt_pcb_t *);
>   extern dtrace_difo_t *dt_difo_copy(dtrace_hdl_t *dtp, const dtrace_difo_t *odp);
>   
> -extern int dt_aggregate_go(dtrace_hdl_t *);
> -extern int dt_aggregate_init(dtrace_hdl_t *);
> -extern void dt_aggregate_destroy(dtrace_hdl_t *);
> -extern int dt_aggregate_clear_one(const dtrace_aggdata_t *, void *);
> -
>   extern int dt_consume_init(dtrace_hdl_t *);
>   extern void dt_consume_fini(dtrace_hdl_t *);
>   
> diff --git a/libdtrace/dt_open.c b/libdtrace/dt_open.c
> index 5c922488..77ffb6d2 100644
> --- a/libdtrace/dt_open.c
> +++ b/libdtrace/dt_open.c
> @@ -28,6 +28,7 @@
>   #include <libproc.h>
>   
>   #include <dt_impl.h>
> +#include <dt_aggregate.h>
>   #include <dt_bpf.h>
>   #include <dt_pcap.h>
>   #include <dt_program.h>
> @@ -740,6 +741,8 @@ dt_vopen(int version, int flags, int *errp,
>   	dtp->dt_proc_fd = eventfd(0, EFD_CLOEXEC | EFD_NONBLOCK);
>   	dtp->dt_nextepid = 1;
>   	dtp->dt_maxprobe = 0;
> +	if (dt_aggregate_init(dtp) == -1)
> +		return set_open_errno(dtp, errp, dtrace_errno(dtp));
>   	dtp->dt_vmax = DT_VERS_LATEST;
>   	dtp->dt_cpp_path = strdup(_dtrace_defcpp);
>   	dtp->dt_cpp_argv = malloc(sizeof(char *));
> diff --git a/libdtrace/dt_options.c b/libdtrace/dt_options.c
> index 997f11a2..2f7917a0 100644
> --- a/libdtrace/dt_options.c
> +++ b/libdtrace/dt_options.c
> @@ -20,6 +20,7 @@
>   #include <ctype.h>
>   
>   #include <dt_impl.h>
> +#include <dt_aggregate.h>
>   #include <dt_pcap.h>
>   #include <dt_string.h>
>   #include <libproc.h>
> @@ -27,12 +28,11 @@
>   static int
>   dt_opt_agg(dtrace_hdl_t *dtp, const char *arg, uintptr_t option)
>   {
> -	dt_aggregate_t *agp = &dtp->dt_aggregate;
> -
>   	if (arg != NULL)
>   		return dt_set_errno(dtp, EDT_BADOPTVAL);
>   
> -	agp->dtat_flags |= option;
> +	dt_aggregate_set_option(dtp, option);
> +
>   	return 0;
>   }
>   
> diff --git a/libdtrace/dt_printf.c b/libdtrace/dt_printf.c
> index e999498c..21ec7411 100644
> --- a/libdtrace/dt_printf.c
> +++ b/libdtrace/dt_printf.c
> @@ -14,10 +14,11 @@
>   #include <limits.h>
>   #include <port.h>
>   
> +#include <dt_impl.h>
> +#include <dt_aggregate.h>
>   #include <dt_module.h>
>   #include <dt_printf.h>
>   #include <dt_string.h>
> -#include <dt_impl.h>
>   
>   /*ARGSUSED*/
>   static int
> diff --git a/libdtrace/dt_work.c b/libdtrace/dt_work.c
> index 69a86358..13483301 100644
> --- a/libdtrace/dt_work.c
> +++ b/libdtrace/dt_work.c
> @@ -5,12 +5,6 @@
>    * http://oss.oracle.com/licenses/upl.
>    */
>   
> -#include <dt_impl.h>
> -#include <dt_peb.h>
> -#include <dt_probe.h>
> -#include <dt_bpf.h>
> -#include <dt_bpf_maps.h>
> -#include <dt_state.h>
>   #include <stddef.h>
>   #include <errno.h>
>   #include <assert.h>
> @@ -20,6 +14,13 @@
>   #include <linux/perf_event.h>
>   #include <sys/epoll.h>
>   #include <valgrind/valgrind.h>
> +#include <dt_impl.h>
> +#include <dt_aggregate.h>
> +#include <dt_peb.h>
> +#include <dt_probe.h>
> +#include <dt_bpf.h>
> +#include <dt_bpf_maps.h>
> +#include <dt_state.h>
>   
>   void
>   BEGIN_probe(void)
