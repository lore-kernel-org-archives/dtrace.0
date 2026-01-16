Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6A4128506A
	for <dtrace@lists.linux.dev>; Fri, 16 Jan 2026 20:29:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768595347; cv=fail; b=W880hYrVvQm84va4EZEN6s0KSUEDp2Y4uwibyDOumwJtkOPCweql96mnSuaVfNh2AHm22uvgCAcJxiY+bAGgWsqzwLYH54aev1XVAeuABF4eOAXxDp3lvvzTT8h6IpYJYKZeiZ8LPsJUvjSeZigCNDETj64L0YVkhSYTJNsdbxI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768595347; c=relaxed/simple;
	bh=MzF6pKX/bW9s2Hx2VyEIkIKqzbJyoTSqy1+pikK/L4U=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=bRGxdG7wjGrLnMY7xIKsJd2IFGXgYCWcP/ZSnJJYucKamenNea812zHPsGXhUoRxPy2T1+zFkRyPTq7MGn9021PDNgbxC3mtZ8MKHVoPcj2ki3aNc7s2PYNabr47jiCmLOavaoH67D5LNXL7KR6S8WSoHed8PxdjqDvKH0l08t0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Dxo3T+Gi; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=MFLpLtFZ; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Dxo3T+Gi";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="MFLpLtFZ"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60GE0O0x1656264
	for <dtrace@lists.linux.dev>; Fri, 16 Jan 2026 20:29:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=w9XyJ3jgmGzo/6RrJzmPXl9SN6geRrtVRMkf41+I4tE=; b=
	Dxo3T+Gix4yAbmH/JQI6llh1J1M1HkpcmJBKxOxTPFzxkNLYUY4aE518/+Ue3V2r
	7SkRjLWGhLvXrO3QeH+0g13uVdmxxjUPTi1ihYMphnkkwHhhi9gOBq4qn/w/C8gn
	foe3nzcvcjDJw7Vn7YeMtsPDPgqC1GEE8dIEOcA2dygBOoT04FK0KdlHF0kxvmt/
	nY0+5N57BdTTy7fX32HgLCM47glmBZSUf9ybWVK/CrB+Dw/hzb4Qe79eERN+aI8U
	4u5aPryj926LWs/1DexhGpEjJzhXc/hZbU/UTlhna3XkDqvEyPbkPvn5jQo6dyOj
	dcatuOM/rPT/cnLamt07Aw==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4bp5tc5xue-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 16 Jan 2026 20:29:04 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 60GKFfPR012752
	for <dtrace@lists.linux.dev>; Fri, 16 Jan 2026 20:29:03 GMT
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11011066.outbound.protection.outlook.com [52.101.62.66])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4bqv7a0bx4-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 16 Jan 2026 20:29:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xNYTTTJsMahnKeUnZ0WbVYxXNUIgfIaswgaO5ThVXfdrOFf8ZMrifNAlH34jbja3sH2yreDxHo0z4fmhsjkdRkmK9NJfo1xKXJUU8JpFw/sj4qdJbgf6H3apPzoOf1aCfh2FKTb45LfMaCBzYBbNdN0NRFbDugx461SlfeNQC8UMFprlxpsU4/s3NuAcBoEOl8Bj4Ks8auTj/SMfUP7NEvbQ8jl8R16S/8u4KuC6wqJ7ZDygki8yx7MUsSmb3qZZY5SSkx3UeY3HOr1BzUJMOGHy1TDY38/yTeqFQ4NpNI2RVXwiuaFH3ihI8LClVjFOUmTlqLT0DJnlDbQwDPebCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w9XyJ3jgmGzo/6RrJzmPXl9SN6geRrtVRMkf41+I4tE=;
 b=SUZ/FZZ8cUUZ8lZGmizoRdhUeNzl/xMrTWFBHswi3ZhKD0fUak6OWnLO8xUtAvptNLLIWgmyhudb1iH8D4jLm+rkY8PlLuI2YbATuWB4cCEuzOmLi99KelsszLYovUuzk4K5gxJd+38h9jFOgISpyMManiqdFS3bEf8Et5zSY39bflDFCKUz2w+PSXFtb6GYDcgjG9KBBl5oPZLjOfOUTna2Gp/K5/iAqcS3TE4TLTXJHZmc/H3+EWkp8Av0k2TuEQyM8dmUI+0NHqmSXdeSKCXjAhKEquxJJ77akiElOY0dLZHJt4Gd71tg9OHO5tfDaIegkcrCtyIYxmLUayDgHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w9XyJ3jgmGzo/6RrJzmPXl9SN6geRrtVRMkf41+I4tE=;
 b=MFLpLtFZBiPE/xGLzaQFuguEl3EzRriqj2M/iSX0ascDDVPkStcAb9hN+wG/21schQOk0Pr3SzjJyB7/O7B87dJ17YzBX7VVSpZbdluYeGKqtDgMzhndS79XDH3WMDE38v3ULODtkyTIYT3KwU1Hkyo7uXNGzOmCm8/oUYHTQmQ=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by PH0PR10MB4662.namprd10.prod.outlook.com (2603:10b6:510:38::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Fri, 16 Jan
 2026 20:29:01 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b%6]) with mapi id 15.20.9520.006; Fri, 16 Jan 2026
 20:29:01 +0000
Message-ID: <49ae042c-4b24-ab5c-c742-4c7103cb6384@oracle.com>
Date: Fri, 16 Jan 2026 15:28:59 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [DTrace-devel] [PATCH] bpf: use initializer for dtrace_difo_t *dp
Content-Language: en-US
To: Kris Van Hees <kris.van.hees@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
References: <b69b05db272a70bc46cc5e64ea1951c2@oracle.com>
From: Eugene Loh <eugene.loh@oracle.com>
In-Reply-To: <b69b05db272a70bc46cc5e64ea1951c2@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PH8P220CA0055.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:2d9::23) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|PH0PR10MB4662:EE_
X-MS-Office365-Filtering-Correlation-Id: 3c776ccd-f62a-481b-d9b9-08de553de21e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?R3VFODA5YUxOOHZkRnM3NkhlMjRqSnFMWGJXU0VzVytHRkJUb2Qrb3FIU3pU?=
 =?utf-8?B?ZW1QSVRuMGtyRkgrbDdMb2FXUlVVT0tuY2N4QmluaC8rQ0NEckpGUmV3ajUz?=
 =?utf-8?B?bTZQNFpRSXQvYVRVTFlka2FHdGlzNkROOVg4a1Blblp1ZTZqN1pSY0ljUjVT?=
 =?utf-8?B?RG9XamhJZXVpb3FRd3hUenVnbmg4YTd1ZGo4R2tyS21SZlFSN0xmRGFFa2FU?=
 =?utf-8?B?Tk10dzlRMVlCazZjbFh3WVFZRXUyWnViU2tLOHY2Qy9pQVY5UHpyNTB2TG1n?=
 =?utf-8?B?Rzg5MVRmcWVFUGg3K2kxb21La09kdmRCNWprV2VtaFpJRU1mbTlqWXFUMStM?=
 =?utf-8?B?dXdiYjYxbCtpN0tpTFBHeDZjTEFSR01HVWl5bzkva2JoY0RzRFRqRWdSR293?=
 =?utf-8?B?cVhNOFJvRlNhV0lTUHpvNmNFK0g0RU1obERQNHJrT3QyYXVpVUtjMSs0TDh6?=
 =?utf-8?B?S0FYN0x5TkU1czBjVGhoR2NJVHlUOHFTZ29xYUh3ckRQMEs1WGdTZXkrTXZq?=
 =?utf-8?B?WnNLTDlVcjNCZmk4RGFlcW1vZ3Bia1JTeVhpTExKVEk4Sm44Qk44R3FBR2hK?=
 =?utf-8?B?Ykp3OGZmOFFZdGZ5Snc5Y0dyMnh2bnVKM3Z1Z3Ira0p5dWVuOVVXYjBkcEEv?=
 =?utf-8?B?QS9LVUg0RzJLYWlOZDl4aWk5dUk2eXJrT0poaTlnYWx1STVKM0NuMDhMMWhi?=
 =?utf-8?B?aTI1bTlUamVMbDRiNDNZdkJQclYrWkpHTElOdXpKY2phQi91NXhVWjRVV2w0?=
 =?utf-8?B?MnR2dVVEMXVBWkROVHBhWlRHc1NmMHVmdDA4WHB3OW10QStlMkVnWUlpekZr?=
 =?utf-8?B?MUMxWGRIdWtMTTNVSXFMV1ZHRHdWL1BZRVFRTHpXTjcycXFTS2RkbDFrWWly?=
 =?utf-8?B?ZWlMVjhwOW1NQlRzYTFRZEVQQzVNdmhTZHZjUzU5YnFXcUl5Wkw0a2VUVG0w?=
 =?utf-8?B?RGtCZThvQ0p5eWpEL1dzMzhVMUtMbnd0ZlQ4N3YzSTc3R0xNL1c4d2JEMUF2?=
 =?utf-8?B?d1JjZzcxNUV1Q2ozbUdyTzNHTkV0Q0RPM0xPUHVBdkpsZ01pV1h5VFl2Tll0?=
 =?utf-8?B?elRoWlFTdmIxdHdrUFY1M1c1c05lS3VGZi9SdXFkU3FYMFJZS0ZaUUNsQnM3?=
 =?utf-8?B?TEs2Z01HYTRZUDhKZ1huY3BZdmE5Y2ViMVZMT2ZxTEgxS2QzajdtU3gzazVs?=
 =?utf-8?B?ZW5VRTA3TEl6VWJQTFMxRkt3c0F6M3dqUzVnd2Fma3ZLMmU2S01lQ0FRYzEx?=
 =?utf-8?B?UGpLUFlWUGJ4TjBUdUFWS29rOHJxYlRJM3JxZjNERGEwNWJlek9jTjUzdHMy?=
 =?utf-8?B?RVp2N3R1d0FGZzJEZUo2dFV2cXQxT0RtUE56ZjVjWURiaXpsTTJrMHZmY2E3?=
 =?utf-8?B?SVBnQ2N1TS9XVTQ1VDhrd3FrSDVqZ0RjV09IN2pmampYRGRuVEFORU1RaUJx?=
 =?utf-8?B?azBKWTlNYlJXSDAxYlpwTVcrOGRZUnhJMjdxZ2dQQTFBRmR3N0JxNGZrbTFC?=
 =?utf-8?B?eWFQR0dNZ29iS0Yvc3JoaVlpTjNxZTFHZmlXRjdNNXF3cmVEV2lFTkh6bmlj?=
 =?utf-8?B?RXVmNm5lVDk4QUFkRC92WnM0aHJXaGtXT3ZKdzRkMTNqZjZDSHNtajBaWHhk?=
 =?utf-8?B?K2N4Ullqb2paVnZxTlNBWm90RFFjWlBTTnRLUnBHSFNlTGpnbE9BVUtCMTlI?=
 =?utf-8?B?empuZUUvQjFrMFB1Ny9yclhtNWZ0UHgzak5wcGtrVlg3ei9rME5qN2l1WDVY?=
 =?utf-8?B?ckc2MzVRd1RTWVdkR1R5akxEOXcxdjNyUVNnWm44Wno3REFxblVYYWhXakJB?=
 =?utf-8?B?VjJqSnpwK2pvY2ZzMDhyWVoxenJLS2k5UFBoVWs5RVBnaTBtS2MydW4wdTg1?=
 =?utf-8?B?WWpoak95VTdIVDJVS1RXU00xK21UTjBKV1lDdVNKZCtYRUR0UjQxc1BzdzBj?=
 =?utf-8?B?MlNxaE02UXBTMDhqbmYyZERxTzU3V1lCellyTm5tdk9MSWp3YVdGWEtaS1hv?=
 =?utf-8?B?SWRFTU9oeFA2d2dVeGZEK0d0RHJLMzV5cnlRdi82dnpiSHRPQjR1OE82VEV2?=
 =?utf-8?B?SXJRVW44MXJEK1MyWERhbXEvTlRMeDljUnJPUHg5Y0dNRFl2cmtMN2xmeEpV?=
 =?utf-8?Q?n3Ow=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RzIxYTlad2pxZmk2aXJNYWNjRHA5Vi9UTFBlcjFSTzhuN0I1MUlJVmJVTEta?=
 =?utf-8?B?d0RnUmFFN1R1QnJxOGxJeDQwcXluMXA4T2h2QVVGNmJMM28vZ01PZ082dEZ1?=
 =?utf-8?B?Nk9oUHp3dmg1d25YMlFkRVpEYkVHUnN0WjVNUnoxZW5rMTdTdjJGSGJpeXhX?=
 =?utf-8?B?SFNyNzVCaWVnNnhvT0src1k2azc4N1RzQjhvRjBqQkxiSVNid0d1Q2RXTWNk?=
 =?utf-8?B?TXEwVHJYd3VweVlGc3ZYVW9tZHJoOTNKSTZrUnhlZG40U0lKQitLRitJTDAy?=
 =?utf-8?B?eEJRSDhCNTVaZm4wc1hFcTJMVzlTTGZ0eWZacmtFck5Mc241M0J0UWp0cUVv?=
 =?utf-8?B?bDZpQXBoZ3o3U0FObE1hSVV0bEE0QUg0aE8xTmUybnV1SHlWY3RHWUhydmtD?=
 =?utf-8?B?REdpcHl0aEY0Kzc1ZSt2bEt5QjVodjNIcTR4aUxhZUhzYnR4bE5IaGM4ZDNM?=
 =?utf-8?B?aXlSYnNxdmU5ckVBMzVmRDR2a0gyRWFtWnpNM3YzWS9Hei8xR0pVM3lhdDBz?=
 =?utf-8?B?YVRmcUo4eDYrRFNORmFLVkQ4N3BKSkl5UUVFSGNuMzByOFJtTUo1RDBSZ2tH?=
 =?utf-8?B?T0NwUk0rL0planlzcDh2dFN4NjhiMnBlV3ZEOUNGblRqajJQWXNweUtidDds?=
 =?utf-8?B?aWM0YTVwdFQvS3ZJWkFsemV5ckZ4UUc0SmFDNTA2N2w3d1NTemJ4Z1psTnFx?=
 =?utf-8?B?d05Ka05GMDdrODlGM1p0Vm5zT09rZHZhclFhTFh1cjUvem9vaG0vVGh2UWJB?=
 =?utf-8?B?Y2ZNbUIxTER0YTgvOWVpNTZsSWFiTmgrbys5WVNCbEpjeEk0bzE1N2l3S3lp?=
 =?utf-8?B?VnJtMUF3b3VmcUhzQmE4SUxGTm1BZEFNL0hBeVFNemFiMEdHaGZQajdBSEFY?=
 =?utf-8?B?c2QxbG5wNEZSaHRhSVFtNlRYN01Qc0srZC8reUp4TWFuNVE5bmJBUmZwaCth?=
 =?utf-8?B?UUFhaEtVaVA4c2RKdm5NQ2NycWdTeVkxbU0yVmFVR1huN0d6bU1hanNSZWZa?=
 =?utf-8?B?T0pzNVUzckxVSFdURE9tTjFLZmZYRjE0NHFVaGtUSnBrRVI0U0l2WHl0TndJ?=
 =?utf-8?B?VE5iaXpyaFY0eHgvUDFMVGgzMmw1Ui80dGlucWdEZ25RUlprQ0dXbTVjM215?=
 =?utf-8?B?MHoyOFJ1M2lMVlhQVXZmdnlYblh6S0QzVHZBV0ErNWc4OUdMb2t0SXpzTlps?=
 =?utf-8?B?T011UDZDcmxPSjNsRm1YQUhRT0g5d2NWY25FUXo5WXA1SFBUcElXYTRIMTFp?=
 =?utf-8?B?UnJUc3E4QzBUN1RSSDlvazh0NllhVWdZV3d1b1ZUUXIrYnExRURZU0FJYUFz?=
 =?utf-8?B?cWRzaE05d2h1NlpOSU9jZVhkVWxoMjNEazkveURuaDMxQkNrRnY2WmMzemZQ?=
 =?utf-8?B?aFpNSC9HWU9TWC9ORnVSUWdpT29GSXAwRWQrZ2N4MVZHYnVVNllZcGY0aWhP?=
 =?utf-8?B?YVExY1pkRGlhV3g5bUFqWTA2cnpvUjRaSmtRb0xnL0s3c0JERWF0L1ZIbFNI?=
 =?utf-8?B?V2c3VjVFNWhqRFdzQ081TUwybzFtczdVUml4ZFR4SW1JQUpMdTNTaUYzODNK?=
 =?utf-8?B?aldvVDY5SkRYZEpnOG9aTWFSRUJuSHJUbjlqME5mRWF1Ymx5NTlPb29ERVR1?=
 =?utf-8?B?NzU4TWFQYWdrcWp6S2NqQVdJQWdXbkc1WDV1T1JHekRpYURScEVTVXpOTldm?=
 =?utf-8?B?VGVsYitMWWI2c1plM090eTU3a25SWENHZUtnNEF6bWlUR2RUUnpOY2RwUTE2?=
 =?utf-8?B?UTBUWm9jOEF5cUlmSzk0ek1JbFRYYXFVemd0ci83VXdZcVJVcUU1NDNjUW9i?=
 =?utf-8?B?NVB4ZFlVVytra0duRTk2aGR2dVVHWDhwM1ZWU1Q0c3h4TG8xZWllWmJqdlVB?=
 =?utf-8?B?b0J6N29jT2VyRSs3V2NPQ2t1L2NBTFF2Q2dyOHUwVm9sU045MmZObnY0V3Zh?=
 =?utf-8?B?c0U3Qjd4ZjU3SlJDVldocURzSGVsSWdpUHdKRkt5TG1yZVVucm8yQnI2MGhI?=
 =?utf-8?B?emUyNU5mc2Flc05qTXdaZklzR1I4OUlFbnZUT1ExeUNtWUZNZUFFalZlTHE3?=
 =?utf-8?B?UWFZZUlCWHJWK2c2aDlydlB0Q0p5RWs2Wk5BMnlnc1hiRzFBUVc5SGVDOFRL?=
 =?utf-8?B?L3N1SEtEcGQzd0NSTDltWU44Y2ozMjRBYlMrSzJtSENIZXFIR2hHNHBLUVZO?=
 =?utf-8?B?Zy9RdnZFZE5TRUltY3dFWVBQeDZKeGsrYXk3bkVrbXNneEVHMnlBeHNRc2tT?=
 =?utf-8?B?cGxyMHRqdFk0SU4zV2QzcWUyVER0ZU1iaUtqcEFUSkd0ZzZFWUdMRWJJd0JG?=
 =?utf-8?B?YnViTUhvd0g5bFZsZ0Y4QStkV2tiRngzOE9QajhBNnM0cEdjYWZldz09?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	0d9aR3M1FggQRudKwHCo7ZD2FzC2u1p8KM5UNeGiv41nF2U7+dY2fi7iFKAous/qdoq+5OwXcM1vS75nwF/Vj6mJr6MnVWS3kGeOwV991p8VA1FO00vXG2kEY5o5TYFjQxlCN0xffMLurN/hkr0pZ+j27E9ET5ZS8kM2+GJwUCkWX1a/otTTjUQ8n8QwUfArYmP+xxgKYbSK/C81I1V8dq/GzLsLLIkmBvv6Sp9XK3g+Viyvbx2n3MfVjZKs+VVDHdqcBFI8JNNyRbzyXnH2CPyKusN1jKhbAh+Zf9/8g2L8NLiRPRrjSV7z+TgasjllnTRzYp66Fq+uAFHx01B4OU/tp3gmBpsNtXjRZ8acGqCHNzt9sfsFZ+nUSeO4Ch//3dZwFKiPvk7hwpuwFAhsN2JRIRb0lsFLZadWIaD7HyjWbhuqfCq2par5SL8HmX1Dhpw/qseDxYRUTrH7gqIAn5iw9nBXzXr4HjRfYAHTR6vXjTlpxa/Xhc5MjnVBHcjAuMnYqJH05/yFJ0GTFz72/D2wODRp0g0zhdRYlORrXAkcV06MPasjfLnaBGLXx9Ii+1KaY8GMdniEpqrR92B7GbzCUjmG4h9YP/Ff28e9i+g=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c776ccd-f62a-481b-d9b9-08de553de21e
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2026 20:29:01.0091
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QPFCTOsF5RdXoeeXgdBUBLIHE9JySRFZIrW+Qm/TiQI/3vPKDdmjeJtU4xDxR53mpBoqxiGoWOxleXZK6vB2WA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB4662
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-16_07,2026-01-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 mlxlogscore=999
 malwarescore=0 spamscore=0 adultscore=0 mlxscore=0 suspectscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2601150000 definitions=main-2601160153
X-Authority-Analysis: v=2.4 cv=XP09iAhE c=1 sm=1 tr=0 ts=696a9f91 b=1 cx=c_pps
 a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=yPCof4ZbAAAA:8 a=OPnjRfOUct5sDF6mnZwA:9 a=QEXdDO2ut3YA:10 cc=ntf
 awl=host:12110
X-Proofpoint-GUID: pBpDi7saTn0udCbFJfMjx9YHf7Z_8otD
X-Proofpoint-ORIG-GUID: pBpDi7saTn0udCbFJfMjx9YHf7Z_8otD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE2MDE1MyBTYWx0ZWRfXz6UzB17cMbm4
 sntLevVFU5U/W8VZ53z52JXGwZYG6wA1relmfM14hwhP40AxAXakEDgmbWS0w/Gtt7wiYW8/QDp
 ob+FShvFZV/G+gxA6k3zyja2452E6JF9TZ39dFld02LthSaSQGj/t4Bo42oKJSGRMVgspRRKdmx
 TQQLkpf5ytPt61DVXuEqxyPziZq1RRM05SU8xuKxukthvmki278DJJfAf0WHM8cGm0JH61hgiOp
 mow+QlEJywO4BIoo/g4QY/jpNxU6rQ+1RrjQmWsNsORQTNW6bpKIogPpVIH59+Nkjtw5tfZSC0W
 VhvpOZX4mx7jEInVYk4HwUu87hrdc2hWjF3rV0n+6ilvUqGVvOyb9KiovgAjXLHXpYPlgW9aOok
 F6EcOO/Uvy3xTK8y4HLxbv+t0JpfjQRtGdY3mFbspyqh0rGrX52m1KL6eL6PYUSzDeND641RmVx
 9vqLwMw8ZbYigYhvxOEQ3hLbs3TLR3CRVK/6NIsI=

Reviewed-by: Eugene Loh <eugene.loh@oracle.com>

On 1/9/26 16:10, Kris Van Hees via DTrace-devel wrote:
> Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
> ---
>   libdtrace/dt_bpf.c | 10 ++--------
>   1 file changed, 2 insertions(+), 8 deletions(-)
>
> diff --git a/libdtrace/dt_bpf.c b/libdtrace/dt_bpf.c
> index 82a73414..20365855 100644
> --- a/libdtrace/dt_bpf.c
> +++ b/libdtrace/dt_bpf.c
> @@ -422,12 +422,9 @@ have_helper(uint32_t func_id)
>   				BPF_CALL_HELPER(func_id),
>   				BPF_RETURN()
>   			};
> -	dtrace_difo_t	dp;
> +	dtrace_difo_t	dp = { insns, NULL, NULL, ARRAY_SIZE(insns) };
>   	int		fd;
>   
> -	dp.dtdo_buf = insns;
> -	dp.dtdo_len = ARRAY_SIZE(insns);
> -
>   	/* If the program loads, we can use the helper. */
>   	fd = dt_bpf_prog_attach(BPF_PROG_TYPE_KPROBE, 0, 0, 0, &dp,
>   			      1, log, DT_BPF_LOG_SIZE_SMALL);
> @@ -486,12 +483,9 @@ have_attach_type(enum bpf_prog_type ptype, enum bpf_attach_type atype,
>   				BPF_MOV_IMM(BPF_REG_0, 0),
>   				BPF_RETURN()
>   			};
> -	dtrace_difo_t	dp;
> +	dtrace_difo_t	dp = { insns, NULL, NULL, ARRAY_SIZE(insns) };
>   	int		pfd, tfd = -1;
>   
> -	dp.dtdo_buf = insns;
> -	dp.dtdo_len = ARRAY_SIZE(insns);
> -
>   	pfd = dt_bpf_prog_attach(ptype, atype, 0, btf_id, &dp, 0, NULL, 0);
>   	/* If the program load fails, we cannot iuse the attach type. */
>   	if (pfd < 0)
