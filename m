Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3B294AEF0
	for <dtrace@lists.linux.dev>; Tue, 18 Jun 2024 22:43:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718750603; cv=fail; b=lLpTgcxJ1pBNE4PjJrHGDW8HH3j1kbavB/dtAgrqxZ9yTVfM3PHsMgdgPdNRlK/cyVSftNKaQML5jJBjX7CBIaJJMSXIHtbwf8CyGtLxuz7YfAswGDoFAKE7O1dIb+xBiReVWNEBsZGa/eGpn4uTCICb/cH3CMUYx1HjSbKgQFE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718750603; c=relaxed/simple;
	bh=djH3Q3v5WvwvmcHHQDpwskNFaHbyLdwweSn4Ccb42gk=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=YVXiq01NbzkpTBTF5z0PNl2B2+rgNE2/ADdPJi/XkyTLOPx65DA+jU8dVKOZtH9PIqDUVveoibVzhEdNq1iS6yKJS0A6ETPEvEnfIouxLSh2zJE+eba/JUpZyRL+CwtIAOZYQ2KmBfj7kJEY7mZ9FkKjQoQWSZGRBjudOANqKg0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=mrhbpJmH; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=jF46ikbi; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="mrhbpJmH";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="jF46ikbi"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45ILaorf028429
	for <dtrace@lists.linux.dev>; Tue, 18 Jun 2024 22:43:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	message-id:date:subject:to:references:from:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=
	corp-2023-11-20; bh=6bJwhXyP7zsy00f+uGMD/42IMcN035zhHjgif8h+xww=; b=
	mrhbpJmH2qiPzvjQjcfn4NEzaxkLGDlSneqVHAlun9InIHtmgC922EL8gKR0TvMW
	QJLWZ544kFkhXqQytijDMIHRgec98dNO6GvyWXGzal3q48iAXtoDUR4U1klKOD9U
	ziqaYBEsRWm53Vb3cTe/zvKCgPGnWQyUr/yGlrMLgNeHk9D8jIe25XkYGVAszP7a
	5xpGiIiztlRxsZ3hx9TfcQy1NQT0I9dZ6CMmPfcbLWwv6/JBpF/kV1Qgrp7af6bS
	XT8pRtm2SIZ7Jmz5O/jdLVJDCrxWyaRkpYkxFKn4uDXUk3iDHANSuBheRpXpfdvZ
	AEaTuw3Iw/ck6F/m64rjgA==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3yuj9jr2am-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 18 Jun 2024 22:43:20 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 45IM0ClB006847
	for <dtrace@lists.linux.dev>; Tue, 18 Jun 2024 22:43:20 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2046.outbound.protection.outlook.com [104.47.70.46])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3ytp8f3c91-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 18 Jun 2024 22:43:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jgyKCO9cku5fRaUL31/DG8LAcB3ynZIK02HTfb+qayMYFbPsFKEwoL90vlLDVBru1hklkUgaVnbFJyQ9rkRGTjvNfEgkGUY6ss9Z6K7+WmWMb/XFSacgvuViTiFdIueYI0S2Kl1QvSLqjuteex7c4IWoBRWcIMSX3PbLDcsGEu8fwFbKALd6ra8W/vdzUAP0KRhtd4hksp5pLM4ft9QTifQbqhBQBvKj0XOiEIy7qKu96h3t7QpQ7S9sta5koRZdO+IEGtmzhoqft/NkfgVjPRU5+O/czxIWmDVAv0eU1jL07m0iA40tImiBkg7ljEh5T2+O9D87Ul0E+8NzelrAlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6bJwhXyP7zsy00f+uGMD/42IMcN035zhHjgif8h+xww=;
 b=lDC6jfhiS9Nu6ReNH/mVMsX4j1LmZXu1lIfLBSVRbijEF2sc95cLNu+SNrhNKR4ZhplUXwU9RKGFIUz7YDcEes7YUo8FNVv8ocg/qc6AJd87DM+Xfvf97GUbJ8xqx2I0AcYsPd+UJ05RovawsQfWwf3LHhJAXEK/WfdFjmtTHBb/crUKjv+rGa7STqFtwDbN3FZ8VUvluOYedEBALZS0og+3TS/YzkRera17RDCxKxYPkTinGZyqLzP614TWYbo/Zy17HdW0zdNM2cEkbXIuQFxIZ9NBjydw228eU/4jeooyY5U1Pu2lgW4jx6uQdQgeASQeYPnbyWZ29f5B9anJ6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6bJwhXyP7zsy00f+uGMD/42IMcN035zhHjgif8h+xww=;
 b=jF46ikbijSXKvt5v+weJ1bn3TJv7W6J88zRaxOrh0YGqLjVBBPcyzLQRlhakW6z8e6PSbC8QkRwHIdKecAjkyG59h4fDheT8KrF400ZAT4uGBxM8waqQVWG6dzlm72qxIVYVDH/0OwnzO/4MulRSE5RnCAw+Uvy1IlCwAcyBvRU=
Received: from SJ2PR10MB7038.namprd10.prod.outlook.com (2603:10b6:a03:4c5::6)
 by IA0PR10MB7643.namprd10.prod.outlook.com (2603:10b6:208:48a::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.30; Tue, 18 Jun
 2024 22:43:17 +0000
Received: from SJ2PR10MB7038.namprd10.prod.outlook.com
 ([fe80::e32f:5b35:d02f:2e9b]) by SJ2PR10MB7038.namprd10.prod.outlook.com
 ([fe80::e32f:5b35:d02f:2e9b%4]) with mapi id 15.20.7698.017; Tue, 18 Jun 2024
 22:43:17 +0000
Message-ID: <19106722-79f5-4eb2-8fde-f77246a2466a@oracle.com>
Date: Tue, 18 Jun 2024 16:43:14 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] build, dlib: ensure dlib directories are created
Content-Language: en-US
To: Kris Van Hees <kris.van.hees@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
References: <SN7PR10MB628761A5110A04BC2EFB0BADC2CE2@SN7PR10MB6287.namprd10.prod.outlook.com>
From: Elena Zannoni <elena.zannoni@oracle.com>
Organization: Oracle USA Inc.
In-Reply-To: <SN7PR10MB628761A5110A04BC2EFB0BADC2CE2@SN7PR10MB6287.namprd10.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CY5P221CA0144.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:930:6a::8) To SJ2PR10MB7038.namprd10.prod.outlook.com
 (2603:10b6:a03:4c5::6)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR10MB7038:EE_|IA0PR10MB7643:EE_
X-MS-Office365-Filtering-Correlation-Id: 950e2129-b578-4722-71fc-08dc8fe80bd0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230037|366013|376011|1800799021;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?VGVpbkgreWd2cDNiVTljYnJyUy9nNDEybFpvWktiQmdNKzVPNVEwOXhjRXV2?=
 =?utf-8?B?UlZnQnNLcy91cE4yNVIvVVJEZmxxZmVoaFJyN3ZXY1hpTlJybGU0eE1mNCtn?=
 =?utf-8?B?UzBsbytRd1YxL3p1d1Z2Ykhyc1pMMkNUU3NRNkVWcWpHSWtpYmVQMEhYNjhk?=
 =?utf-8?B?azk0TzlJc1Qxa0ZDcGZwYmNNMzQxeHlYNmVWVGEzWU4vSkhETmIzWGVpME1P?=
 =?utf-8?B?cEN3aGRWbWJnbW11N1RHeVA5aGdRUTYvU0hwQnV6MHZDOER1ZDZZcm9TS0ov?=
 =?utf-8?B?dStlZkVwUjd0L29jVHk5OVc0WHFwRnpaMDV0NjVQK1FKd2FIUnh0NVRqRUZO?=
 =?utf-8?B?NXF0MDhvOTRhMWVwUjNKMWNMY0V3ZEo4cG1ScmNBNFd1TmJMOTlNQm5pa2p0?=
 =?utf-8?B?SUd5VWhTcDRNaE5keXJiRE9rV1dFdHJ1aVRQQllIVG5GOERQWXh0MUQvV0ov?=
 =?utf-8?B?S2Z4UlZDWEdTMWprU3hYSWdDZDNzL0MvUDBxZTNWcmxBOU1YUWpBRUZ3RnFV?=
 =?utf-8?B?RjZVazNzeGhWSzFCQTNRc2ZDbXRHaVBxRHlZbi9Lb01mZm92SFY4RjRYWSt1?=
 =?utf-8?B?a3JlQWNKZFhtTFMwN245b3NqMlBhbjdlclJJaGsrekNMUzRyZkNJeUMwVGd6?=
 =?utf-8?B?a3VKUlB1dmlhaU1VY2NFdDg3R21vb0tORUdGY1FWOGErKzQzNGw0cXJvbWhM?=
 =?utf-8?B?QkdMSFBPbGRheXVyVFVDQkdRanliWGJMbDJBS0JLSGZzWDVRamsvU1c3OG1n?=
 =?utf-8?B?NUxPUWJ6a3VKNi9zc3NlcE4wV0FQajZ1bDcxTnRNLy9vWFJ2YloveG1zOTl0?=
 =?utf-8?B?c1BvOXVUNktWcGtHODY4N0VFVVNGVmVGYXhvNVZheFhDdTNmZGNuK0g2VUsr?=
 =?utf-8?B?Umc0QWlxRFg1V3gyc0ZTaDlOYVhoZEJrQ2l3N0RHVGFRb3F1NnlvQmE0NWFa?=
 =?utf-8?B?eVBVd1BuZjVZYlRTUUpmRFJhUWwwenZqSGJFbTM5VUx5c3RPQnJOU0lvS1Zv?=
 =?utf-8?B?N2tUbzFyazZWTGNyL0liVEszV3JCNm1aQU9Cam80YXdnWm1Nc01FZ3VnY1gv?=
 =?utf-8?B?N0pGUENROElUWUZJVDYyTnVodFZsbnF2ZEp1b3d5R1JWcWhQNkttbWc0amZs?=
 =?utf-8?B?Yk9yYmdOZjUxeGVzbHBncy8zY2xHNnJ5M3dtS3ZRRGNWV1RBdEE2NDNWNy9N?=
 =?utf-8?B?VkJmMTFHVmIvenY4TjBFWTlJT3pRN3hYRjZKRy9mWTVyODZyZWdwYzNLbHp3?=
 =?utf-8?B?RmRiY0NEZU03QzFPaHcwZW15RjRPcHd3YkNDZDY2V0tKUWFNZlhDZmV3aXF5?=
 =?utf-8?B?YzRxYTNIZmY4M3c5ZDN1cWlPd1FRV2tacWxURGdRMFZKUVZNM0NxVTV1NFh6?=
 =?utf-8?B?NmN3RmMyNFR2Nk1aV013MzNzUEZiaG1zWDUrVUQxL3NXVFYybmw2ZDZidnBP?=
 =?utf-8?B?OE5xd2E4OXIzZ0RCdzhYZEdETUxGMWxKd3I1SThxL25RdmxrYXU1V3FWZG13?=
 =?utf-8?B?emI4c1NreWsxWTNpbVZOYWVTZ3RqTlJlRTRhamxLS2UyT1diWlE1RDdHN0NG?=
 =?utf-8?B?aFpaWUVmQUNOekRqcDN1d0gwa3lQOXBDdUhKSjl6YXcwL2hnRmpMTXVmcG4w?=
 =?utf-8?B?NGxwUThZM1RkN2RGakg3TzVpQVZnVWtzNUdkZnBxZ3J5TFZOalMva2pRL3Rm?=
 =?utf-8?B?VHloZ0w4L0Q0aDlVSkE4Q05PSkJSU3RYVzl2dUI2MmxiaXVzbURDT1dORjR0?=
 =?utf-8?Q?iOI0GUgDUwckZdIeCmcPwlacDDdhmeOGlHBWio/?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR10MB7038.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230037)(366013)(376011)(1800799021);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?MjdZOWJPVzlhd2dQRGsyVlFVenNiaUxtcG5PK3N1YVA4U2VQYlVFQXRQY01j?=
 =?utf-8?B?OXZJdWcvTEVLV1Q0ejdLTHdBM2poQjgvSzl0KzNuL0gyamdtLzV6blhVdGFH?=
 =?utf-8?B?SmJHSU1OeXZaWDNzcS9EaFhWNEs0Kzkyb0o5VXBSU0UzWmIxZ1RjenUvVmRy?=
 =?utf-8?B?ZjViTGI4UjJuRU5kMlpxd3NxZng3ZTZRUWVSTHNaSmZCdDh0OWI1R3RwRnBY?=
 =?utf-8?B?MWtRRVRLWWNHZnZaSmc5RkRVMFJTRlI4SjVqdXAzNnBGQnp5TFM4QmI0ME1V?=
 =?utf-8?B?Qko2NVUyM1c3N3JvZ2ZQMmNDNUpIUlFVeXk1Zjg4NjM3TC80NUxwdHhWUjlp?=
 =?utf-8?B?UzBFVHl1S1kyUFU3aVQ3blUwQ0hQS0t6RCs1cHZCRnU2MzRlM0FHSUN4T3lH?=
 =?utf-8?B?aUVlUGgxY2RJMmEvMzZ5OWhMeWdJS2VlaDI5VWN6cDRXeGg1SWE0QVFkRkhh?=
 =?utf-8?B?UHpxNVBIUmVuVUIvZWV5akxlbm8wNXN2eVBjOHJIclVEOEhZOFBzVlhHYld5?=
 =?utf-8?B?NHFkS1B6YTdkSjUrSmt5T0NKNlNjQUFDd3d0cnFvV1BubzlpOU5Sdll2RTdY?=
 =?utf-8?B?Z2FpUVpUZWRVSHlwNzVPcWlJdXUzK3FISDhDb1V1dXI4SWFrUEh0UkQwWlYx?=
 =?utf-8?B?K3BHR1FqUW5oZFBzc0NuM2IrVFFUZFVxNnpobW14a20vQjZEVDgvejNjdFBS?=
 =?utf-8?B?dlI0a3ViK3VSbkNJbzcyUmVPNklzcHNKTUx3STFFc1VNUUZIS3pzVWFmempC?=
 =?utf-8?B?bHVCd1hFb1BTaXZncnpuYlM0SUVTM3ExZTJzUXBhRkx1cEVyU0RoNXg3dzds?=
 =?utf-8?B?TzVPclkzNzd1TzNadjdUSVpNWHlaUDg1SFJoNU1LWjlwR0FJV2RPdlc3SndR?=
 =?utf-8?B?YTV2ZFNzNm5KTldla2tLQ0VlZnVGM2NmQm0rZG1BNGxFS1BTdURlcUdSaE8z?=
 =?utf-8?B?TGlINVZqTTNBRDNsb3VrWjdxbHlWeXg0R3E5YURNeE8wNVRmSkhYbjBlNDNG?=
 =?utf-8?B?TzZHYldMbGJWcVV0SjBpRDFsVDFNTEppYTJzTTZGSXlBLzBZR29KZVNCSTU4?=
 =?utf-8?B?N1ROVjdyaDZZeTVBQ0gyckFPdUdmRWs5TStCS0dtcmRnaUVMMzlEOTFQMlRm?=
 =?utf-8?B?U0tGMGt5VUthWHJLUWVhVXBTeHpGeHlKdG1Jbm5ydHBVeGlBVzVQN25Hcmkw?=
 =?utf-8?B?WUd3eDZRZzVSdFpSa0l6aktmTjVyL0tLNlRPU2J6Nk85TDdtWUx1eXdBOFZJ?=
 =?utf-8?B?eEN4MXNzT3RCczZmUG04bVJ5N09SSWw4NTZaWXlKaksvVXM1dHh3SVpnQkZK?=
 =?utf-8?B?bFRWaTJ0aU5mbW1zb3J5ZHNUNVZpVjUweHF1MXpTSE8zR01TMW5Id1lWOEh1?=
 =?utf-8?B?SjdlbWF5ZTltcE9pdVN1dFA1cjNOQnJEUHJoOUNjREs1bzVQendpVmtoU1NE?=
 =?utf-8?B?MCtYczFoT0ZvSlV3MDdGM0ZYcHhPMEtnV2RYZ01FMmxkdDhDMHhETXh5UXRR?=
 =?utf-8?B?OEdwNUhvTVFId2tJK0NtNEUyNjV0ZHVFblNGdnN3bXdidGxRN3BJeTE5NjdR?=
 =?utf-8?B?eG82N21QWDVFWk9tNDdOdUxmakc3T0Y5N2xGLzB6SkRXdzA5MlljeVNHSStY?=
 =?utf-8?B?SmRtOU5Xc29qUTh5YjIzNTJka2NGM3lBRjNvZkNXeHNLUkdPNEhwUkhVVmU2?=
 =?utf-8?B?VzhLSURLNkViR2VBTWNwS1RSZERHNVl2TWdxdC9ZNUp4OWhCanNVaUtCS2hX?=
 =?utf-8?B?STFNcGdVekIrR2JJY1JIS2RHS1kxRkRWSHk4SytIaWpNb3VCUmFCREVQVGRr?=
 =?utf-8?B?dkRFd0JSQmdIVFpPU3oraklMYzg2MitzY2oxTTR4Y041ZEhiOUUxaU1HOU02?=
 =?utf-8?B?OEdvYXdLb2xDSndDZnk2ektMQ2dxemk2RGVWYWNzZFJCb2FYWmJuKytDYkUy?=
 =?utf-8?B?UGNFa1d5OU93em5CM0MvZExUZHhkMXhFUlZpNlc5cUoxRUFVTVNaeTZaQ1RN?=
 =?utf-8?B?SWp1VHIwcTFtdkp5MVZoV0NxNURwU1BHWHFIOUpINnZMWHNEZjBXakJoMTd5?=
 =?utf-8?B?STNaYXd5YXBNVHhoeklFTTlVZjIvZHpENE9jU08xY2E2eGZlaGFPT1FEZXc0?=
 =?utf-8?B?Ry9QTldaUUZYZGJmVVZaand3L1Y5d0ZsZHc4a0lNKzRVRnBkWXNkVXlNWjVm?=
 =?utf-8?B?RFE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	4eMgkXTcBuUU3YIadRcsVt+p56AbKlOCnfi1YKWoAe2HILy6PpiK6Si80HjJcnz3vgCAmdHl4XxisdGQzcG/imC1aSACS3VOB4QZ3E1KvRxYCrCRllakPiHYvZ7qJtmnP08r/HNVHEHD6fsCuVSOFEvW6kmnuIy9Wml2IMBoNKbIwfj26Z23IhKMfjCSwxBjzf/+tKxxBlIwCK8U6qxSsMHgXEfzDA666JrBzvPTW6BYJ4pvU3Kdsa3EzitQVM6WzgJMr4PtWBhCuEwZNLVFNIdkRJdC+1/0wWp0+WY/imUHgp/3xL6fxeyVb9cnrlpQrDwA/ifOOLE/1w5IqSs1lK1qumMB7+6w/uHyc71ZHpvrPP/fcfV4UHpn8n16FngXIIPWV+2BZ0J7Oeoii6JuwEkEUkQGOodNIJEDelmwAXa1akKCHNcErNpMLe42+akKnnOgTRUWCqvIcgXuyCHQaWayi67HZLtq1ECQzFdbBo2szAXF/lynmens9+sIm0+mNB2dVhHuBu39ChPIAj/GH1Ejq0oS13/TtBjdz4v6jILffnWPgqTeERoD85p+L7ePbOgpfwE01LmVXwmSVRNJV2KUTbEsh8lf7uPzIzKJ/sY=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 950e2129-b578-4722-71fc-08dc8fe80bd0
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR10MB7038.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2024 22:43:17.5420
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2jT2BWP/AF0WzYBYO69s0OoY3bT2W5OQQ2frekgCDWRsNhxzIKJEcopTx7I/T2VIDlusgUZvsJzx6ctBcid9fvLQR0UZ6sC0Rb95/WNMzwU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR10MB7643
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-18_05,2024-06-17_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 suspectscore=0
 malwarescore=0 mlxlogscore=999 phishscore=0 bulkscore=0 adultscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2405010000 definitions=main-2406180167
X-Proofpoint-ORIG-GUID: 7uCIU00k6ijQDRbhG8op3bEVTCjTyxtP
X-Proofpoint-GUID: 7uCIU00k6ijQDRbhG8op3bEVTCjTyxtP

Hi Kris,

Reviewed-by: Elena Zannoni <elena.zannoni@oracle.com>

On 6/18/24 16:19, Kris Van Hees wrote:
> Parallel builds were resulting in dlib files being generated before their
> target directory was created due to missing dependencies.
> 
> Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
> ---
>  libdtrace/Build | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/libdtrace/Build b/libdtrace/Build
> index abbadfa0..8d398221 100644
> --- a/libdtrace/Build
> +++ b/libdtrace/Build
> @@ -196,7 +196,7 @@ $(foreach kernel,$(KERNELS),$(eval $(call dlib-kernel-ver-template,$(kernel))))
>  # definition in turn.)
>  $(m4-dlib-targets): $(objdir)/dlibs/%.d: $$(foreach name,$$(notdir %.d.in), \
>  			$$(call src-name,libdtrace,$$(name))) \
> -			$(objdir)/dlibs/.dir.stamp
> +			$(dir-dlib-targets)
>  	$(call describe-target,M4,$<)
>  	$(PREPROCESS) -P -x c -Ilibdtrace/$(ARCHINC) \
>  		      -I$(KERNELSRCDIR)/arch/$(KERNELARCH)/include \
> @@ -229,7 +229,7 @@ $(m4-dlib-targets): $(objdir)/dlibs/%.d: $$(foreach name,$$(notdir %.d.in), \
>  
>  $(other-dlib-targets): $(objdir)/dlibs/%.d: $$(foreach name,$$(notdir %.d), \
>  			$$(call src-name,libdtrace,$$(name))) \
> -			$(objdir)/dlibs/.dir.stamp
> +			$(dir-dlib-targets)
>  	$(call describe-target,CP,$<)
>  	cp -f $< $@
>  

