Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3040A2F4A0B
	for <dtrace@lists.linux.dev>; Wed,  3 Sep 2025 14:11:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756908714; cv=fail; b=X1uWje+cC8YhVrg8T6+X9Wc/f+TSwkmb/Gj9H/JkU+anQH7Ol/cY59IYC2SfpfYpYwYij5cHkIx0k1bkog0hGC60Y6XkvUOE73aaNwoWpsDEYfmJl8J4LICZ/xnq/bdL4/jniONkHZyYc8ZstbicbNXZcgJlFbmEj1qe2UhCco8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756908714; c=relaxed/simple;
	bh=FoxFllh5XeIeUWV+3mn4dXz1Ud1J3TOxovXY3xy7E2w=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=s2Ci/fVUSGXV/L4DZDUYzi1afYCypoE8i/ZGEwr1tYXbbLygSABFvOYvRcx/WtbAdEDiSNwRG7MX8UVvJnGOoyCe0rB9aEAYK3OwJNUY1VOSNxk+CbMz+5qiF4DYAEx8+l/5euTDp4qcddP4MyjJO1uPOZbMKFrk5Sj2cZSTkSM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=hbcgQBde; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=IY5BhMvB; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="hbcgQBde";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="IY5BhMvB"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5839NCRY016014
	for <dtrace@lists.linux.dev>; Wed, 3 Sep 2025 14:11:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=6qQnFrNr1RNIadxPvy7dGKny1tfl3Q7hduIZE8fcbNo=; b=
	hbcgQBdeZBqIFoLEDzvPYVrCP+/NC7ShajuauMGjI6avZ85/jmtO6x3QqiPfwj4T
	5OVLO82VuFPWAEGMRwNMODjlR+cNj/nDspdRcCZclJdAP6r9nd/6GOMIHIW77NFP
	J5zJbzOv42UBwg9AaHx5ypa4Nr24L8Tcoqo5apMIgkA9BknJQEChBCAqIQZlumAD
	IGTmSMvKi2SChA6Thr0RVVFG0bHoVvY6Cut4FitFFow6J7pvpMoil8hgn7dBvpQj
	L3jBLQQbh0Bk4E9nlD7XHqioV06m4Qi8pWeWJ8W5RoFJkJPj4V2Ql/ngebvEoSL1
	Uo6sSelV5LDUAenflWSGKw==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 48ussypaca-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 03 Sep 2025 14:11:52 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 583DVFxe040148
	for <dtrace@lists.linux.dev>; Wed, 3 Sep 2025 14:11:51 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11on2069.outbound.protection.outlook.com [40.107.223.69])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 48uqrgf667-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 03 Sep 2025 14:11:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jmiA+nLvWQFbZxUJFW/xWxr7IajVnBQwJBZ6DoY04d7PGGc2n4a+uhXSYf+yKHqzppgygHPBqyJNilRUi+5xPxM7MyRVh5EJjIs2MYBTDrq6t9WTqtkKx9adnF5u3WpmbTPRupX89C4wKYYd4HD01gLM6IaL51mSYHv6iohO00dwygkWhUAUstwj6uLcFgNjm8l6fSch2O1ZpcpCn3bkbUhxZDWV0A4F5YHJMwfXQvFxl7Qn5ndHlNzIvpJJk4IZzZGpMQgORz8B4wYOdUGQDMX2qI1vEygVj1G5OL+WshBhOunTbVtpyQTauCQuh7oalmbQSA4FCPPRn7ttpekcEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6qQnFrNr1RNIadxPvy7dGKny1tfl3Q7hduIZE8fcbNo=;
 b=s2d4JpnNiFiGzJqdcQApOx8n6+jv3GwaQfuz5810Re/TQIEpDfvdJSqjjS6/50lhokFpXQPB7UJPULJXv9kgG9Z248N0PyJ5jwU1nDRt8KTc9E6vZqWHsNIgZZuWi7+u7AzwrqgwuWkzs/jnGjys7ARYhZ3F1IaGgHbdoeeaydfs2N+Fhh6hvUEVK9n0X4pCPJjf6L8IgLPICzgzhf4U7o56dMOZRgn/lQdYfKjUJNg93JDzpov9ByOotmLd5WshOBfnLdhvlEDZQjEmf2BuuggVBmkmuRBduefCm3o8Yx4B3PVpE38PJD45D/8BbJ3NyAk1hfTukESmnX6rNXPCcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6qQnFrNr1RNIadxPvy7dGKny1tfl3Q7hduIZE8fcbNo=;
 b=IY5BhMvB99ebJgCsWSmrdowiEUKjSib/U+CsNsVIl5UvL52w5ArUkQ189n7Wh6eAwsZd0bsTNrcgb3YqyRhEL8DuEICN/PyqZpx/yBn/CzO7epnF49QldlNaeaZtkNeY72gIt5qkpwpLfnsH/Stpc+17LmgDXhtvDynPcbpvLSc=
Received: from DS0PR10MB6271.namprd10.prod.outlook.com (2603:10b6:8:d1::15) by
 CH2PR10MB4326.namprd10.prod.outlook.com (2603:10b6:610:78::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9073.27; Wed, 3 Sep 2025 14:11:47 +0000
Received: from DS0PR10MB6271.namprd10.prod.outlook.com
 ([fe80::940b:88ca:dd2d:6b0c]) by DS0PR10MB6271.namprd10.prod.outlook.com
 ([fe80::940b:88ca:dd2d:6b0c%6]) with mapi id 15.20.9094.015; Wed, 3 Sep 2025
 14:11:47 +0000
Message-ID: <246b26da-fcf6-401a-854c-b78feff3b094@oracle.com>
Date: Wed, 3 Sep 2025 15:11:40 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] cg: fix offset for > 8 bit bitfields in
 dt_cg_ctf_offsetof()
To: Eugene Loh <eugene.loh@oracle.com>, dtrace@lists.linux.dev
Cc: dtrace-devel@oss.oracle.com
References: <20250826081226.591245-1-alan.maguire@oracle.com>
 <a9b623d2-129a-ae26-56cd-46f95a8d0cc7@oracle.com>
Content-Language: en-GB
From: Alan Maguire <alan.maguire@oracle.com>
In-Reply-To: <a9b623d2-129a-ae26-56cd-46f95a8d0cc7@oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0433.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:d1::15) To DS0PR10MB6271.namprd10.prod.outlook.com
 (2603:10b6:8:d1::15)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR10MB6271:EE_|CH2PR10MB4326:EE_
X-MS-Office365-Filtering-Correlation-Id: 0632474f-eb43-4388-c0be-08ddeaf3d149
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bzAreUxsSjVCRXgzb01HTm1COGFmWWxBbG1IVVVUblFpZmsvTFExVmU2YTly?=
 =?utf-8?B?Q2V1enNseDVZRVVMcExPMjhHVEtLeGlWUnBUY01ydWlCQmM1alU1TlpMejh1?=
 =?utf-8?B?QitUVVI1MEwzRW5YbTUvOEJmTTVNTWdHa1lmcGk4MmRBbGlpRmlqZ041Mngw?=
 =?utf-8?B?VFJrU1R5MURQcDhqc2grRGVTYWpDaDRySHh4S2cvbFYzVU1RZkJuNnpCSWJF?=
 =?utf-8?B?Ymd1ZERwY0NyZU5PUmp6NkpiVmd1bTIyaGcxY1RlbmRwVlloS01UZitpY3Uz?=
 =?utf-8?B?eWFFc3VxdG1NUmIveWM1T1J4bFJaakJuclB6KzUyejYrVmYrc0hLdXh6Wjkz?=
 =?utf-8?B?VWRxN21WbTR6Vk5tVGwvREI4S09YN2pWMmRJQ25JYy9aWVZvcHFXNEVibFRa?=
 =?utf-8?B?c21KcVN2V1BSU0lpckxEc3h5V0tTYXZXdkF4OWJ2M3ZyZ3N2V1JUTmRkc21q?=
 =?utf-8?B?VS9XY1lUSlk5a1JiVitONjlidmVUNXRteDY4Y3dJVytNYVcycG9ZNEliUEwv?=
 =?utf-8?B?TDJtQ1FKQzJxZzROYnBwWXpzRFk0ZGZNWHVVOUJTTlpZeUthdDl5Rk1XQ05x?=
 =?utf-8?B?MHAwUEtpVVJ1QjUwTmhXUzFBSkZSUVBtTWtVQW9zcDdReVo3dDJkVi82ZTM5?=
 =?utf-8?B?Ym9CZ2NXNVZuaENFdlZUNTIxdnJUTTZtUlBuTW05T2szRDBTU1M1RjhiQkV0?=
 =?utf-8?B?eVowWlpkSXdBTnV0SVFwT2pXSlRuazllcnM5c3lDQnErZW5MOGlvSTFDMGZN?=
 =?utf-8?B?Z3luSWQxMW1ZMmI1RWQ4VjRyRVkvMWxNclhsa2ZQZ0JnTW81eVpqVEUxR2ZK?=
 =?utf-8?B?YjBxeGdKWDRHUDlqYU11bWMrNTFJOXhBclZ4Zys0SWR4WjIrWGZSNVdZN0gw?=
 =?utf-8?B?dVphMmppc2h0WGFDQVhpS0RkcXpsZDRPTjlkMmcxRFRQZVFtaW1Dc29Wd1pn?=
 =?utf-8?B?a0ZkQW5oUmVSTWxCWkplSDlYT3RTdXY2MzdSQ2hMYS9RV2RqVVRoVkhUNDFB?=
 =?utf-8?B?VGl3V3JxV1I5L2wyd1JJaUpFTk1PZ3lXNTNhUGlJMDVTWWNwM3hwbzhnTzVi?=
 =?utf-8?B?eU0zWVhxR3JlSlBOZFhzcjhRaHpWZkFRTVVuNjVjTDM4Skc2STRYZmtHZDhR?=
 =?utf-8?B?YUhSenI1R3lUOU1Mb3VJcTV2WElNTjlFNjdYR28wNXNpRHZLckRPWk4xS0Y0?=
 =?utf-8?B?RnVxY2hPQ2Y2K2VIalRST3Q3SGxLcVFOUXBSR1ZlTXovRjRkaGJUT1pDTGhp?=
 =?utf-8?B?blM4QkdScVBXc3k3T29JNXZRaENQeEh6UDlGUVd3YnNtU3lQRWFMNU1BSVNU?=
 =?utf-8?B?NVByd2ZxQlJWaFdOaGJCOUhQUU9kdjhNRDNCMTRQM002SDhZODRJK0FYdFoz?=
 =?utf-8?B?cDBNRE80YVhJUk9KNS9uVWtRYldSUkRla1MzdUF5MERYMkxyK05sM2oxZUs2?=
 =?utf-8?B?anQ5eldlU3dJNlozQmJaT1NuN1ROb2NYTVJXaXl1WjFkNTZPQ0FaOWJkc1Vh?=
 =?utf-8?B?U29ZZlRuN083cVJLcVo0blVaLzVpdGkxRkNiQ3lrc3kwN1JsNGUrdmwxV1JF?=
 =?utf-8?B?elFiekNsdlMvMjBJVlhCQzdmTk1pYVNRai9HMmNSTWNkUDN6empVUXZHL1p6?=
 =?utf-8?B?WjBWWFdkajRMTStwNEtHMHVINlU1bjFWSTBRWVNYWHhxTVM1bVVRVjVuVFo3?=
 =?utf-8?B?QUxTaHZNWERNSFNxU1NwQXRsb0ZIeFQyQ2pVZXRXUGZ0R0h4VFgwRURYL0hm?=
 =?utf-8?B?N055VzdlK0NGamQwYStTbTE4aXk5Q0lqSjFXMFNwZ2NUL3lCMTl3UTI2Q0pU?=
 =?utf-8?B?OWxTNUJRTTVZUFYwTUdWVkpYSSsvckJhdWR3N1RPOEk5aGl3dXpWb2VPbWZ0?=
 =?utf-8?B?MFF3THp0RkZEWUwzTURoYjNlOU5XWmgvSklTZzhxeXorWENpQ0w4U0FJbWxt?=
 =?utf-8?Q?Zu5feAMDWQI=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR10MB6271.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MGVqd1c2N2xKRGY2VWlyWG45TXlvdVQ4TytoWXpFL2ZBbnJTSkdERFhoYTVT?=
 =?utf-8?B?T0RtanNOMVVpanNEakFjbGphWHdqSDFaa3NSYVlKTGdrNmcza29HZmNuY3FV?=
 =?utf-8?B?QTVtM2kyWFpTQlAwMWd0bnFybWZSWjg4TmhFbVI1Y2g5dWt1QUlHVENqN1Fu?=
 =?utf-8?B?dkM1Uy9WZFcrak9SWEtYSERKMCthUTlqZjBLUUJlaFp0Rit6eXhCSnk5cUtz?=
 =?utf-8?B?RG9WU0lDL2Q1a0xaWHJ3b3liUXBWb2JGZ3Z4eEdVeFR5ZGVXRHlCSnp4VlR3?=
 =?utf-8?B?anRzUHF4NUhVZE9GbFYwd24weFBudm5sc3ZPdFIxM21WdzRHblp0TGI3b1o3?=
 =?utf-8?B?ajNKOUw3RFpXSWpMQ0dRUkR3ZWNwelU5Z3NXNTV6d1gvRW1BU0tHS3hveUVr?=
 =?utf-8?B?Y3V0RXBJTXRENWwwTlNmSk5tcWEwbHU5dWtZTmhNOWpSdXJSMHlFcFcvLy93?=
 =?utf-8?B?ZDVhejl5OEVLZlV0cyttMUpPRVh3a3hOODBlTUYwbmZLM3U2WHB2RzJFNitC?=
 =?utf-8?B?L1NiSy90TWxqRnJLdnluUUtJSlpiNTVtNnpUaGxVRzNBdmI2WXlTZGQrZGJW?=
 =?utf-8?B?WmVmays5MFFJcVVncDkwWVVVVmhnRGpzeG84QlY5TDQybklzNG5LUElweHEv?=
 =?utf-8?B?SlVtQVZzc1F4S0Rqa1d6WWFaOXR0SXhCSERMbVE4cGFndWhSV29ocWtQTmxi?=
 =?utf-8?B?U0UydE9MNlNWcUVvRmFsN3dGR2NGci83L3pjK3BoY3VIdjlTd1NlMDBVZW92?=
 =?utf-8?B?ZnlNVjFuYThGK01ybDFYcEdiUTl1c2hOdmtFdnZKVjVXMi9VdkRHTFExS3Jv?=
 =?utf-8?B?M0hqdGJlT1RjZTNFbW5saG5kR2o3cW5xZkI4L0FZcWlRRzlqcGNBempGLzBz?=
 =?utf-8?B?UEE1ci9vWTBNcFQxOFdkRDNCeEhrcHM1eHFUeHcwYTNMUEdIU2JIckZrWFY4?=
 =?utf-8?B?QUh5SjNIK2JqMG9KcWlWTm5QZ3U3OEdOckwvTVpJbmMwdmlGVnMrVVp1Q0tP?=
 =?utf-8?B?RS9ib3MrRUxoVEdJbXJ3aFRjOWdPaUc5T1NGTmhhODlCeUM0ZWplTWUzc3d4?=
 =?utf-8?B?UjM2SWhwVkNCUDRSMCtMSCtiQ2k4TWxDekV0cDh1VWtPd3FVU0ZhUG81dVYr?=
 =?utf-8?B?RGo4MFpqNTdDNzNBUDEyK3pDUGRLM2NaOThvYnU2K0hnK0NvbVd6bHJJaDNj?=
 =?utf-8?B?VDNGamFpeVdyN2hiVXBMMjlXUk1DZXROWU1NaExXUFczaitleFdkYldTMHNH?=
 =?utf-8?B?d3pDWXhQaGhRZ1NGQkxjeHllVlBvSFNVVHd1L0ZCT0ltc0NEeEZOSWdVWEVK?=
 =?utf-8?B?bjJhSERIcHZHTzA2STJybk8raDcrRW8vaU1mYitXRjNxdzVHS2hIWlB2aGg4?=
 =?utf-8?B?M2hSeFQ1akloZmhyZVFSaGZGd3diNCtLTlNxRkNCRmV2WXFBK3J5eHpTaURW?=
 =?utf-8?B?WUFWYkVRaFNZZGQrL3VjYXR0UXB2ZVI3TEFWNldyK1JuVS8vdHQ1WXNNaHlo?=
 =?utf-8?B?Q0c5SWpXTHdraGdCeUdNVjM4bHlXaGZDOWNKckEzRTVnM0lvaUpWdmt0ckNy?=
 =?utf-8?B?dXZJZEFPc3IyV2RSUExpZVdsNEFpeUo2bFRwbmkvcEhBQTFlWE5QSlU4MVUx?=
 =?utf-8?B?NDBZdEZVSEFGN2ZaZm1STWczdUlSNjZPQXVFNTFhaGlvRmlLM3E1QlVxUmU1?=
 =?utf-8?B?dmcxUkJvTlZad0VnMmxWQ2NqakxiSGo4TE5xR1NSUCtKU0tkSFhSRHN4ZmlC?=
 =?utf-8?B?b1JiTmlqYnVsamhTYjVxMXlEenBXcU0zMkRUcGhLSG1FNm1uL3BmNTYwb0Y2?=
 =?utf-8?B?Z1JSdm80VTA5UnJwcldwcWZGN09yalp6QW0ybEpBWFd6cVdLRXJsUnZteUJX?=
 =?utf-8?B?aFFHbWt3cEFCZWVXYTlqcW11ZjVPckdMbTFuckJFWGswdG1DV3JyN3JoaWRi?=
 =?utf-8?B?cXpWM05sVXJKd2dWNW1LWk91U3dwbU5nZ3dTK1hQdTlvbjNEOVFNYWpxZmxr?=
 =?utf-8?B?UG1Gb2Y5WFY1Y3ZTS2I2a2EvbzJBaHdEVUJieTBtU096MGpVSi8zMzhXQjZW?=
 =?utf-8?B?QjNXZHdGSGQyczU4Wi9mSURDUzRlTFU4RFJrb1BmVW1ybXNEbHFWZmdzZTBu?=
 =?utf-8?B?dlRUNlRaNzZ2dWZvaXk3TGl6NTlZYk5lQlBJZGh5RXZkNTdYUmlJVjJTNUpn?=
 =?utf-8?B?MUE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	dEXbCRVN0dJakS0SCUnyptVGW2QPGozvrK7AEdzlnkZNs8Q7BjN0iRrWadpvDGaWTuXWOc0NndAuxza0Zawql11Tplu0Q8q5zk9xkGaJbmCPV+xBCbS1WnFq2PzGinnsgTR+TnmAYDSlkVqCYfvTwUxpbTrThU2pCqUJJ2tomwObhtLljpdK6fCBzpgo6FTL2K1Kd62x4eDD26V5tvpR2ebUYancq0+PnpYRk/VqCk3vHPLNUazFYT3lVsClD/DM041SQ10PrZFJb9dDPpMjb7SfknrnWYrtPAsIauIjdY+V81zbrG8xsUK+QlaylH9m00y3UfbL/CvuTsf4Sx0xTgGZa/EKAPqh2eWEZpdY0EYxwU0pLFzjJpYku35G1TWilrzm5tkLhNuIpMus/c6fK/p1qPVz6SYiKfNhmqwcz6+x3egcfJVIYsQOFDw8FL/0cvkSvN/F5SS1vcb1Fy89c6zMlVndPNh6VRTYotfj4GIC0T2YIU0hNOq6uNajIELOFuBbg9R+DFyhMzPeTfAVugIZ7W46yQNRn5dM4aCstCpgsGzDf4psG46FdMu3Kc0tyfkzwtixMhOOKjHCqEpfC5s7EJdjiPSCAsyvy+pfDkk=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0632474f-eb43-4388-c0be-08ddeaf3d149
X-MS-Exchange-CrossTenant-AuthSource: DS0PR10MB6271.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2025 14:11:46.9706
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8LRN4UwP3YQFZFG+bsLaMxUF6Dir/EVvlrN4mxbRJMhhSlXvc76KWwfiwofJdu2fS6pFXh5jXgLkiB1HsLzPiA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR10MB4326
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-03_07,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 phishscore=0 bulkscore=0
 adultscore=0 mlxlogscore=999 malwarescore=0 mlxscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2508110000
 definitions=main-2509030142
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAzNCBTYWx0ZWRfX+dHI6izknwl4
 PKwa/7rhwWdizVXWtcTSs/L9QAzsvj/6DAf1+wdedAX5Yj3859Vr96SCrerVZR2v9R7k6WLl63v
 7LPZseVpnJ68dRrbVghPvGqAx7A/wM7kIT8QZrwsXS80ZGqgj37YMoW4tXEh0nPsC0j9aa/wsHW
 obQ+JL0SMxvp0eegwGOOF+DvdG+bLe0Xcbm5ympG3UIXamGF/G8B/9KAusdvODQJN+cocHfdrnT
 rxTNIwnY999X1ft4rMZHCj9prX97TZ1Q6ncqsDeRdG2RnrTdKwuXyqGhBGq6AaeW3EZOXwA+UAc
 +l9tIQLTJV0hS8GIO27wo7lJPqdgeXJLJRY1GHGuVD8JtJae2C4cCUf5MtpXFx2h2WA8b1rMq5K
 nW4aEwgFWX/fclNdBNWROqX33Vi/wA==
X-Authority-Analysis: v=2.4 cv=X/9SKHTe c=1 sm=1 tr=0 ts=68b84ca8 b=1 cx=c_pps
 a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=DPsmcEU3xWQVYqtJhI8A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=DWXRdjMNOu4A:10 a=m8sNJrmRSlsA:10
 cc=ntf awl=host:12068
X-Proofpoint-ORIG-GUID: xIlEDviv1ozoMYUZshRm7J-Kv9lgOnlI
X-Proofpoint-GUID: xIlEDviv1ozoMYUZshRm7J-Kv9lgOnlI

On 02/09/2025 19:05, Eugene Loh wrote:
> So far as I can tell:
> 
> *) https://oss.oracle.com/pipermail/dtrace-devel/2025-August/006562.html
>     Nick commented on the patch
> 
> *) https://oss.oracle.com/pipermail/dtrace-devel/2025-August/006573.html
>     Alan responded to Nick
> 
> Since this patch is related to observed test failures, can we complete
> this patch review?  E.g., perhaps Nick can respond to Alan's last
> message, maybe even agreeing with Alan's proposal simply to add a
> comment that we don't need bitshifts yet.  If so, Alan can post a v2 of
> the patch and then Nick or I could add our "Reviewed-by"?
>

sounds good to me; if Nick is happy with that plan I'll send v2 ASAP.

Thanks!

Alan
