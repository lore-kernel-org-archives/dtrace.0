Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFCA821D59F
	for <dtrace@lists.linux.dev>; Mon, 30 Jun 2025 22:07:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751321269; cv=fail; b=QuQ7EvHh7dwo5t4hy+s+AzOSmf6TFTOZivvgFhflE9g5rXaOuy05k3ZR9gw3V2tfybVGqwFjT41ujEhGXxOlyaJgi1+So0pXbYtTdi1VnYi7WsveYPnClRfpAWYFjhbGinIfqDt7nBpJeRPUBKBDfgyq6VaTAhmFyIHe88/QIaw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751321269; c=relaxed/simple;
	bh=2H6G2bXcgeqH4BdXykbDkhcDfi0zTnhonAwaVeIwmso=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=oUQwXR/99EYPFXeTfn2YrSvx9QvMWKKyFpiskeNupvm7Ad19gXuR2zyTLTvqABpxZJnGYcPabmavrgD4wBx5H88FGqfYnd8rh6F4Y0mrKmqUeHfCf8JKfP7U2634Frh6gQYgOcR99R9myndqRuYsMl01OXhvnvBmNgMeNDBqiY0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=FnJ5Od7F; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=Wl1SBukC; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="FnJ5Od7F";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="Wl1SBukC"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55UIC0vE008765
	for <dtrace@lists.linux.dev>; Mon, 30 Jun 2025 22:07:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=JDXSV9NG45Tr90e/mSUU7cd9bUFCgCmUjiR6lc3wp1E=; b=
	FnJ5Od7FmRIkuKC958JEaaJSG+TT4aICcmNsz0KGCDRzU30cARBIBQmG3BOofii2
	B9L3CA7ywWoxWY1sYCdkNbcI46AtoopNvSWn4gOmGWlC4wY4nxJHWMC/JX1Dh7cI
	G/q3YEnEuNsWWbjVeIM+yB1+IEkX/9dd+/H7QHHLHnCzpGpWF7JS3Vp78oRxOlW5
	TUgTU1rosaAC5INm7hvOCCusMlj0vSnZ4afarOBmRsHXkrs93ynx95bFo2tQkgvb
	JSHp5tAM6ym3B0Tirz0sxIudqh5aUxMtKr/7oPrM8Hymqx+/rGK7sR69yRDBC0pb
	aeVSfK61hpyQkl/7nl0cHQ==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47j766bgt4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 30 Jun 2025 22:07:45 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55UKqdrD009198
	for <dtrace@lists.linux.dev>; Mon, 30 Jun 2025 22:07:44 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12on2060.outbound.protection.outlook.com [40.107.237.60])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 47j6u8xw4d-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 30 Jun 2025 22:07:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yQLnWixucHX1gP7fKppJP85gz7vy6W4hrQlKJ4QLAt1U79ey8vP+OI6tmPygOIrTG0gEASi5NEuUXAsxUd2L4BBh97QQjTX4NYKfgcFPUReVUJHvzmyRGqIjU+xIsG3Zxb13GvF+FYJEfneLVrXUL6WkGSVbfZcHjVdCGj/2uRHZVnJwwtxK7lpT+51fEY8xsM9BJWmZ3r5uXIEgB7O3L5UVSLzmJV8O3w0a2s2vPm5sYZx8IyT8O1+iUBcED+wvyLx4eEmzxHDqjeSJm9sPGtu30WTc7XeD3ebnuy6+MiCz5oB8VS56ep2qfi2YMx/8zsMpff7Hsgjqwt9YsAmBWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JDXSV9NG45Tr90e/mSUU7cd9bUFCgCmUjiR6lc3wp1E=;
 b=VhRv5l3INYsxDIjTrIH3s2g0Ec1UfbHreSwZavPLm2NxxzT53ihNz1WfgnFOo8q5EFeyVS4x5oTk3C0rCbSNHwPbEmMUoHhpUt0BRbBDZynJmqpfTVADhv0f//Fh+Vg5ZCNjn3yVxGoPIdsMNk8YJBHg33GdmWce83KitTfplSSSAfj88czsY+0CxnQ7sN4B9/n3KXKoVyDe8E4GwRUuxsoDjQtTkXNRE/TFv2HjomSWyNuTggV8t6Mvq0b4z/4nttWUW3gpreU9O0L/SqElFmVIMGABtMAl8dlZ0ufwZznrJyWGbNNMvXTWSRhaJaBE7ejULOkB/IvUY6rIvdAQjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JDXSV9NG45Tr90e/mSUU7cd9bUFCgCmUjiR6lc3wp1E=;
 b=Wl1SBukC23y+wwqdCKU13thPYt+6u3a76xnUqx3JqbLTnOJno6vQhO44Kaz8E8LI2dUVcPHUG9rg9FCEaGcwB175G8brCbyCNkkirE3qa2k8a3tcekw+dLWyot4U3v6ymr6UWgjnHKvVfh/2+MaDhwnrfRFOP9OTC3ktHJDxsj8=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by SA2PR10MB4506.namprd10.prod.outlook.com (2603:10b6:806:111::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.28; Mon, 30 Jun
 2025 22:07:42 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%2]) with mapi id 15.20.8857.026; Mon, 30 Jun 2025
 22:07:42 +0000
Message-ID: <c1bae7f0-6024-6cbf-8dc7-61b7ba1b99ea@oracle.com>
Date: Mon, 30 Jun 2025 18:07:39 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 3/3] usdt parser: make sure prbmap is cleaned up in case
 of error
Content-Language: en-US
To: Kris Van Hees <kris.van.hees@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
References: <SJ0PR10MB5672A2F843CDC28C7266DB9EC278A@SJ0PR10MB5672.namprd10.prod.outlook.com>
From: Eugene Loh <eugene.loh@oracle.com>
In-Reply-To: <SJ0PR10MB5672A2F843CDC28C7266DB9EC278A@SJ0PR10MB5672.namprd10.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR03CA0274.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::9) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|SA2PR10MB4506:EE_
X-MS-Office365-Filtering-Correlation-Id: f054d0dd-c3c4-4ddb-6225-08ddb8228911
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cGVZc2NYVFN0RllIZ21Ldis1Q1R6TDdub0xuanBJTE8rN1FHaVVCZ3R6Z1VI?=
 =?utf-8?B?N1U5bUdPZnFKSXB5anhOOVJVVzNhK3FxcXBUSitWSngwN3JacmZraTcxdnF2?=
 =?utf-8?B?cXVxakxrb3IvRVVhYUkwZkxDUnl6UlRNaWZlMkFBdk9LRk4ySDJHUHlRVjlv?=
 =?utf-8?B?TWFDZUVLZTRlZkxTSHRyVWh4bmdqWjRMalU3TmdDQkx6azduY0h3bTlwZ0xx?=
 =?utf-8?B?RDhqSHdBdkVpZVpWODJpaWlVdllPUEM2K0dDWGp2WkcwNnpXNEl4TmFxZVE4?=
 =?utf-8?B?VG5pUCtEWWNWREtNWFMyOUVTVlhROVJNYXYvR1dWY2Jvc21jWk5IMXdGdklM?=
 =?utf-8?B?WlV1QVpZYVZUa01vc2pnWUNadEJpclIxdE4veCtjR3cyaUwxZE1zalg0bWNh?=
 =?utf-8?B?emszcDA5RUJTaEpaSU02cGJyMHZTNU1RVkFreHNEY1dlYmlXR1JWY1VmRkJW?=
 =?utf-8?B?dDRjQ1FTMFltTU4wVFNKVlQ2RUNQSTNuMGI1VXZQVjBXVG1weVBXMlczSldt?=
 =?utf-8?B?d0ZQVU9OWHJNeVlnL0ttK0lzNkJvSUtYVjF1OHJkaXlSVG8rcjZMQktjbzRG?=
 =?utf-8?B?NGIxM0k0Z0NLdFc1TDBmS2lvdUhVQ3pXNlU4WVJVM0s1aUhoL3pKT0hWdHpJ?=
 =?utf-8?B?VlppVjZBYzlXenJkNmpBaUpPV3Q0TkJKdEJ3dm4rNlF0dGhoQXF0VG9tSkh1?=
 =?utf-8?B?ZFh0NEdCUEtLV3BrTzFlRmVYZlRIM2duRjdPY1EzckdreDF0Zzc4aFVQVkhI?=
 =?utf-8?B?NkJTQTBmcW1obUpqV0pQV0VVR3hZTVEyU2tFdWplUE5YRWlPalBxY3B0Uk4w?=
 =?utf-8?B?SFh0bCs0VkRNUml6TjBrdmR5ZUszc01NaHp1Wi8zNTJLQzQ0REhiYTd0QjZw?=
 =?utf-8?B?dlUzL1l1NHpxbHpXTUg2U0dhWlRZZVVTR2FzemxiS3cxU0RpSjdxZ1BCSEt1?=
 =?utf-8?B?U0RkUmRSQVhIclZSazI3SEpWOExzc2J5Nzh3L012RUV1UFNpQU9WVnBpdjB5?=
 =?utf-8?B?WE1SQmRZQlA4bHZTMmtNUkhoeGJWd3VKQ21FOVd5TW1EMGFVbFlBTXg4TnNN?=
 =?utf-8?B?NXFtSVhZVmU5MjlEcFMvZWRYM09HZVJYRlI0dTNZbTFUKy9mUW15WGhwSVV5?=
 =?utf-8?B?Vzl5V3lYY0tNQUFkV2U1SGNBUjdjNmxrMkRFeXZTWWdDUFowN01zQ3N4TTFB?=
 =?utf-8?B?RCtySkNhR1VuVWI3alJWRjFLWi9YYmx2VkJ2eHFENVQ1YlkrS2hBS05UM0pz?=
 =?utf-8?B?c2J3ZGNnWlpuL2lieWxoanI4YUIzMk9XZlZpOThubjZTZWNyRXpORDhsNmFp?=
 =?utf-8?B?UjFMWndxcUNwNDZoOC9yN3hUWFgyamRSWnM3NHVJWURvcEV1WjNwaTc3Sktq?=
 =?utf-8?B?R1RseWM2NHVocUY1SU00ZzFvOWFwUFhuRngyZ1lOUTJDMkNDZzVIYkRMNkU2?=
 =?utf-8?B?UmhwWUhoN0dGQWVEQ2FoVzJzSE40Yy9NTGdvQlZyL3hzMzNtUk1mSUhGRHRt?=
 =?utf-8?B?ZFJEbnFQNVR2ZW9RNno5K3FXdW5LKzFYYUNvcVd2bmZLbWhBbzlweEgySng4?=
 =?utf-8?B?bG8zOWlpRllxTlpSMHdjQVU4emkzQkIzTk01M1ozOWNhb0k3VGxQUlpNUk8x?=
 =?utf-8?B?TW51NDZCaklzS2prZE9MaHBNc2VxWExjRGpwMXVnRXhWL2p4eG13STAwaFc4?=
 =?utf-8?B?MXlxZng1d3RiQlpFZlB4T1JtNGk5ZEVENUM2cC9Va0FNZzRZeFRteVFZTndK?=
 =?utf-8?B?UzQvZU9BVU5KaFQyK09tKzRlQ0NhMTN2ZGV0QVpMQ0oyVjVmRHl3dzNwRmZa?=
 =?utf-8?B?VGdSRy9CY3lVYzBvb0xaNEt4UFMzSXBXRG1vR3VtRjZLbzhaQzV0Mzd0N015?=
 =?utf-8?B?djhqdFZ0WnBnYUR3UzJKWEZtMFNKRGNNMEFYbnV0SXNRSFpwMFZXRmx2aXFx?=
 =?utf-8?Q?sh4hhVGLuL0=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ODgrYjhLbml6bzF0WFhGd0tOaU5pejFxbzlLQmMxUHZuYzZFZUMyMzA5U2xn?=
 =?utf-8?B?SXJGSUk1djR6bklNWWVHKzQwa2pjN1dXOCtpZmZaZzVBYzJVV2xaaEtQUHFL?=
 =?utf-8?B?ZjJFdmVjdVNTNHI1MXRMWW9aOU9lWG9Rc1VMbU5JYk5zQ0s3aTMxYjZCZ2dq?=
 =?utf-8?B?bVRiSzdnczZRbXVFZ3ZIT3p0ZGZvZi9Kd0VicStmREtLLzhiNnJBTVQ4L1U5?=
 =?utf-8?B?QmhLQ0IrUnFwVHJ4R0trbFhadTZvZEUxQ1J0SkFLUGRCeGI2Q3dYa0pURUpt?=
 =?utf-8?B?SHJxamprRUFlR29mYmJmNFA1QjllQmtXOTI5Q0JkazFxQnU1TGpJNXR2am1C?=
 =?utf-8?B?TW53OUxqcHhKN0dIR3ZOMVdCQmVzdW1FaHp6aDE1Ukh5V1ozMHNZZlo5RlFi?=
 =?utf-8?B?QlFoa3pYb1RBOUJSa0ZTVmFYQ2U3Q1ZkS25rVm8vOG1YcjlpMTB6Wng0VDVE?=
 =?utf-8?B?V1hrQ0pPNG4rM3dzWE9kamJPa2FxakNVa0VpM014bllpZnlTM25sOENaT0xY?=
 =?utf-8?B?bk82aXJ2TnJhT3R1cVlVTFQzWWhmblZ2TnUwNHdjVVgzSHpJMVdQNGExc3h2?=
 =?utf-8?B?bnk2RVlKcFB0bW9xdkhLdnkwbEpKaGlUVEdVZ0p4eXVvYWlLOXl3Vk5sd2Vl?=
 =?utf-8?B?SmtGZDlWLzFBVEUraFJIdU9kU3NDV01IMHovc0I3NERkL3U0dlYxazlwdU1m?=
 =?utf-8?B?RVNScmhlK0ZKQUUxb1VKbkwrSXBVcW9MVUhlMTRRMnF3azFDRjFiYUtJTzEx?=
 =?utf-8?B?dGVKMHNzNkhyN0g5ajZtNTRVS2RleWJONFMyRjJSNHpqNTNBUEx4cmpEZ0g4?=
 =?utf-8?B?N0d2TWlvYkUrZGZWdm9KbnVmTlZFWEFCRVlDalpyZThJUVN2NWZwUmFXWlg4?=
 =?utf-8?B?ZkliUlRERzB2alUrTFFTWXlnWTFuYmJDQnhxQWdvWHQyQ1VWbnpZMDhrckll?=
 =?utf-8?B?QWsvS0NJcFZOcEJYQmd6K3NRemEzYUw2ZFF2djF0UnFxdkZZOXlmMVFhU1p4?=
 =?utf-8?B?SWdHampuR3JTUmJlcEFiVllaWU9CRm80bjVteitZOC9oL2NpOTJmc0pPdVNu?=
 =?utf-8?B?VGY1akNUaVBxNmZRQjVYOWdPZktCVUVkTlJoRlJZL3Z1Um5TYVp0V3V3SE5u?=
 =?utf-8?B?ZlFVSDY2bU9SMllES2NqME1URW9OelpsalJrMU85YVJqUktwQndSNXZwQjJv?=
 =?utf-8?B?dEovRERpME9nRnJwdmxpSjlFM24yYXRDL2N2OERVS2ZrSG52ang3WHdScUVr?=
 =?utf-8?B?dnMwOGpuaG1FN0Z3eHI0QXhWT00vYUM3ZDI1YTNVYnlRNldsMXpvTVlQd0Zj?=
 =?utf-8?B?NnkvOWt1MDVMOGZOT1hycGpLYVllSEMwdlhYRXpiMDZWNEZETGFZcjc4NXMy?=
 =?utf-8?B?WWtCV0RMaXdsb3FDRWtleFpRVngyM2Q0Ly80R2VOTEtaS0JvaFB5cXUxVzJE?=
 =?utf-8?B?cWQ2My9ONjBEV0F1TVVkajZndkZUdndxVitqb0tSWTlOQU4wYnJhSVZkdzF0?=
 =?utf-8?B?UzE2YTRPdXJMeGdlc3k0TnU3cHFubEJDUzg3Um05clFHSWhYclc3UnBZdmFJ?=
 =?utf-8?B?dkJsSTJoNnZPMTlEOGlBSUc0N2JmMktvMS9vUURZODZ1Ylp6dm1QN0d4WDdY?=
 =?utf-8?B?eWtIUmJLcktGV1F5dkdsY2lZdnVvdTFaWjVnN2RLejdmZGhITElSZWdVdWdZ?=
 =?utf-8?B?NHZnbHd6VUJRNGxKVmNlYndSYmdpRW94cWFudGwzRGxxQkMvcGxtZFNLeUht?=
 =?utf-8?B?dURvNHRKZzZ1WEE5TlA1L2dFVEVHMitwdnl2RXE2NmZhMEdGa2RaVWdMRHpI?=
 =?utf-8?B?SDcxYjFhQmFoS1lnUk41eE8xcU5KVGMxNFBod2FqS1RpdnJvZytWa2ZCcU1Y?=
 =?utf-8?B?Tjlpck5aNDBObHdnMURkUWphS2JHZ09vbDV3bnhsTWNBcmFWbnkrUFBva3lF?=
 =?utf-8?B?cUU2VmMvUDZwUmdmZWw2Vll0OGVWbjE3K1Q2RFd2N2R4cnY2MlpKYXRHRGNM?=
 =?utf-8?B?akFrZVRiWlhhVFp5bE1PT05WcDVMSHJHRkxXeUpFQk1BOGNXdUFlb1g5bEZT?=
 =?utf-8?B?WldEUHI2R3NJMFVMSm1JcEI1MXFkREoyeSs1V0hHL3FZTDRTV0V5dG9DbWEy?=
 =?utf-8?Q?ZvYgrWt+uv3QI69DUS/1yVxhA?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	/X/TermFiW67j66WpimHtBM7xtsV1pi65hhUFrAykQksqa1o+yzHQy0j6n4kUu3zz5w4nHDDCqMr3HRc9/vMrl/t+Hk5HZXs/BJP6ok+rTg6cnUePxWYrIG7LCRMW3+aJe6+fxV8eSxHC4zf4gX4EHFBupn/2K47sCOMHqSTGhGKzOGGLEkqaapReNggAe9CypgoIL8zZE1wQFn3RyFDedEtIDg8ULidaKnueEEXsdCV1RsxPZfNCnSvgG+xH1fKZV0vBz9RWvDzjOl7RFw93ZhDW567yiRp5FGi+EYtAYRJ3uTEo7ExRnVQOwOGc/B275eXAL7TIoPeDwdBaNftsnRdvIl7VI6mP2U9XfTih4CPbI8vsyUPYzUVU12Twka430ARhny5sdWWohrg/XxLXA1vJD3/xz+edrB/gsnqZpcRdLSAa1avKXu2DLEBUHtWPbSUkaxequL5m22pNnL9Wm3bwI6TGhwI5nyYfPdZZDcCoUYSPli9CL16QS5TOynZz4VC9UerMVVEXTAG4JopwlPYyexR1ZT5ODBxTHz3L/3/mBsYaO1J5zCJzk6buvbwqp0RMKiPdTnwdxxVOWwiy0xG4RwtixqyJYS1xxhRcIw=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f054d0dd-c3c4-4ddb-6225-08ddb8228911
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2025 22:07:42.6354
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gmIoyvAJ/vss5v+TZu5weKbNNLYCDcF7mcCzlK5tKpkIUNl7BOGfu0jAhnR5klI3ay8Xgb3DFJwDPC+MxQ+6Xg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR10MB4506
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-30_05,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 spamscore=0 suspectscore=0
 phishscore=0 mlxlogscore=999 mlxscore=0 adultscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2506300182
X-Proofpoint-GUID: zqf3SXPDhBQdy7BiYeFG4PH885RNaUc3
X-Proofpoint-ORIG-GUID: zqf3SXPDhBQdy7BiYeFG4PH885RNaUc3
X-Authority-Analysis: v=2.4 cv=b82y4sGx c=1 sm=1 tr=0 ts=68630ab1 b=1 cx=c_pps a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=SJfOT9DMDMLufBhu:21 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=sotT413BwyJ4cwYUwSYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 cc=ntf awl=host:14723
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjMwMDE4MiBTYWx0ZWRfX7ohqkPDXv/Au MJA3VP/XmZEERmGHR9Du6I0b4+6v6OdrfqenUyXoUcBQV0ljh0MGizgEoHsiBPLQLv0JmQXjcaX R9JDvxagtelmLqIHmnpVCAPZ/iTlJkUZtqVC5rXBaaqngi6Q6Zn+SHb9wlmD5lGWdB8NFjup3uO
 GvpqmHAs9OjOdYNt2bcaBYUDg/D/aLeph7GLc5Q+Ct9sZkiaoaVcY+kwzujFNTfZv7psF5N2rOd wl90VW9+N1pprJQhhZRyUw1FxDugeyavNJcJ1+zJkwr3Cw+6r+0/PEBtOCggl2kGyk3PfFFA6nA ngJIzJIfgK7oRA+mM0AWEgigFhKgzeWjU6qa3fkJh5K1Sgnw6R5AA6e9gdq+urUbMETYbAB0lWE
 3EnNPDAkLYccZCDSft630/fkj/TX9evR7XAIVkFHmOx/kC/1iMYeViMD1mj6PcZJPKW+9Mly

Reviewed-by: Eugene Loh <eugene.loh@oracle.com>
but it'd be great if Nick could take a look, given that he reviewed the 
file earlier.
Out of curiosity, was there some case where the assertion failed? Could 
that be a test case?
(Minor nit:  I'd go for a sentence break after "allocate iterators.")

On 6/24/25 17:40, Kris Van Hees wrote:
> Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
> ---
>   libcommon/usdt_parser_notes.c | 13 +++++++------
>   1 file changed, 7 insertions(+), 6 deletions(-)
>
> diff --git a/libcommon/usdt_parser_notes.c b/libcommon/usdt_parser_notes.c
> index d3d744fb..c98c9fb0 100644
> --- a/libcommon/usdt_parser_notes.c
> +++ b/libcommon/usdt_parser_notes.c
> @@ -829,15 +829,16 @@ usdt_parse_notes(int out, dof_helper_t *dhp, usdt_data_t *data)
>   	goto out;
>   
>   err:
> -	rc = -1;
> -
> -out:
>   	/*
> -	 * All tracepoint probes in prbmap should have been removed during
> -	 * proessing.
> +	 * In case of an error, we don't know whether we can allocate iterators
> +	 * so we have few options to provide cleanup.  Since cleanup is all we
> +	 * do now, we plug the probe cleanup function into the ops for prbmap,
> +	 * and let the hashtable destroy function take care of all cleanup.
>   	 */
> -	assert(dt_htab_entries(prbmap) == 0);
> +	prb_htab_ops.del = (htab_del_fn)prb_del_probe;
> +	rc = -1;
>   
> +out:
>   	dt_htab_destroy(prvmap);
>   	dt_htab_destroy(prbmap);
>   
