Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 477A314D439
	for <dtrace@lists.linux.dev>; Thu, 25 Apr 2024 16:56:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714064165; cv=fail; b=auvBDdvHEBqBWhzDBzsrGKVA+ciYzzOErbS136IygGO3A0WSUZYqfrtsB9srZasAb1uVy6Wc0C6o7p5d2LXWakYieTAm/I8d3e9p4lMfGPuHGzth3Eg/bIux7+cmdX1XRHxKYcxH2kFvglI38YTeqHiqPr7ssVo0kP5MtPwg16U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714064165; c=relaxed/simple;
	bh=xFyXAC8LrbNcdLsH9TV0Ja7i7FLdHx5+sJ7elnZSqF0=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=D6ZlE/IOYZ5WcbvOWKfLH/9o1/v4GtLfHC0HH/61VpWobO7BwqLBHFa/2EcvOr081nSQ9Vmdn1iFaomjrlpivpNY2roN+9CB26/fNcUw/KXpBLAJ+dQF8t8ieTxWmHdiEmabEXtFbIFX5OhKZxW5A1g1Rf+oVrYiKoRDfSYB0PQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=aI3cvSpa; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=u9ACfz/Q; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="aI3cvSpa";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="u9ACfz/Q"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 43PGMdU0010753
	for <dtrace@lists.linux.dev>; Thu, 25 Apr 2024 16:56:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2023-11-20;
 bh=ERrkorjgsK6mU6/WPz+ablTuKy6jYD9sDkksIRsBTyA=;
 b=aI3cvSpayHmlCUkyjJbMoUpaxJ6I4zSkSUC9528nM9AWK/fm5h+GpN0afpOJMfb8Njw8
 X4/qWt2pxbjkC5J5JSXHN3wXzxN8zH6xjLGYmQunNnM9o/K1LTvDLjoyusnx3dccEuZd
 5ACHNt3dz1d9RnwPt/kgcrwDZIv2UzAj1vXErTSmfNo8kb4lRsLtdPgaxD382bdR25Q+
 vpBQjuObMkjgiUDZ2/tualAIb69UF0/f5pcak1LpWm30OZp+9lhbSZN8z95Z8A0uHItX
 qV+XV6y6tPsDzctfqJfJ47MLDOZbzEyS9EcpsdslOgzlms6YjPGGP5QervpifdC6cSCA IA== 
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3xm5auutuk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 25 Apr 2024 16:56:00 +0000
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 43PGpLM3001769
	for <dtrace@lists.linux.dev>; Thu, 25 Apr 2024 16:55:59 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2169.outbound.protection.outlook.com [104.47.56.169])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3xm45bb830-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 25 Apr 2024 16:55:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YxSbvFX+A3Xr28Rp0VeIsg+Z5ckPlspSqWSoY3weYi+pDiSrJfZxvJu651ppkqR8/2/iUDat3zWbbo+AWytlFh0AKskZvRtCnZjwcSM13yYsaAGKITIvd/Fqx074bRBauvyR1AvxtVCWunVbnxVtLgCKCGv1dO9ySkbwuo1scbgVXH4ZKOYz9NHom1Wh9Zwj8djdgwj6Pwdlaez6rWpOmQeFEXzkhiaqSQPWOAe1FWjuHRVLSD0cX8XONZs7UU0lY4YPSs8VZ89rXFN2CBH3WfGyY/dQ4theh/DL2CYejmOT+QvvbZ/WATM9G8zrqybo44SvgMwlvvJ+XVL6fV+Nzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ERrkorjgsK6mU6/WPz+ablTuKy6jYD9sDkksIRsBTyA=;
 b=EJCoN0+23lT4YlzOaTPEzCDAX4BX8qtgN3vGVILmEYtVUxh8tYWFgf0Vi1Rx1fF7/lh1KtVQtM6M7UdRlS5YmpqSUtIhykYqCNdNMQlgleQMaNGgs287H0ed5lKrQUtkv5ZVGQ0LjTTRy7mDfQzZuz/RihVLK9nvABq+LV8YposxbdXFHTSKubHHYB3YMOYyNEsN95u6e0LTiUbe2ZfyoEi+Q0w/ROO0JXfdU15EEYbc410GcEAZJs/bJcCcM2ABfwKeBJMzJd4byGDZ1KaCfdcKAJNZH7riMaqqzjS1hviDkbpaBX5AIQxuLSUZgD/l2uqRgQXmaMX8EnL6QRM2zw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ERrkorjgsK6mU6/WPz+ablTuKy6jYD9sDkksIRsBTyA=;
 b=u9ACfz/QGuHC9MqJuf2MMD1F2Bl7dCoTHa6UxNcSmGFvur5RmXNXplZwLIA91Tz9wtTEbcIeXO4Ecga+Rk5R7gu1dIadsYalDtyf4KdNjDo+XsdkEoO71ytT3pHK0hgFwxmVEf1EBd2r+T+xqa5vts/4WE3EPWug7w0U1KSpVv0=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by PH7PR10MB6281.namprd10.prod.outlook.com (2603:10b6:510:1a7::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.44; Thu, 25 Apr
 2024 16:55:54 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::880a:3c23:a6e1:3b65]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::880a:3c23:a6e1:3b65%4]) with mapi id 15.20.7472.044; Thu, 25 Apr 2024
 16:55:54 +0000
Message-ID: <673c27a1-c879-0c38-643f-bd117c476009@oracle.com>
Date: Thu, 25 Apr 2024 12:55:51 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH] libcommon: disable _FORTIFY_SOURCE
Content-Language: en-US
To: dtrace@lists.linux.dev
Cc: dtrace-devel@oss.oracle.com
References: <20240425164057.420580-1-nick.alcock@oracle.com>
From: Eugene Loh <eugene.loh@oracle.com>
In-Reply-To: <20240425164057.420580-1-nick.alcock@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PH8PR02CA0024.namprd02.prod.outlook.com
 (2603:10b6:510:2d0::16) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|PH7PR10MB6281:EE_
X-MS-Office365-Filtering-Correlation-Id: 4c90821e-d4aa-4af6-e8f7-08dc65489231
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?OVd5RXdwbzVLeXIvWDFsdXpKZTZSK0xNY3c2Q3hWZ1czbmJrTWdQZUx1N0Nr?=
 =?utf-8?B?R2tkNEE1UDgzdGtnR0dqWE9BNElyM0lJSkdBcmlPaDE5ek1kWXphcGphRSto?=
 =?utf-8?B?MVpWcTB3S0p4K25yQlZ5ejIwQk53STc3dVdEdHhxVWVLQTF6ZlFLMGF2ZFRN?=
 =?utf-8?B?S1BlRVZzanR2TVRsMXQwRktLczJYaHNsbDdmOTRIWVNtRS9GMnBVTlEzc2d6?=
 =?utf-8?B?b1dWcHFuV013SmpvQ2ZsUC9qamJ0cFh6VlJZMCtTKzZlVWRCc2dFR1dPMStm?=
 =?utf-8?B?c0dQckFWMXFhaXJPOGhLeHFIWk8vME5wZk9ZUEsvQkZWelR0VjdsV0dyN01S?=
 =?utf-8?B?Nkx5MkFqTnc3V25nZmx4UDErVnllRTExdDdWK2ZCTHR6ZU1DNmQ2THo3eFFE?=
 =?utf-8?B?VFpqRS8xRnVkMFpFSStGSkN6eERoRHhhS3BXLzRSTDgyM2w4Y2RUNmFGejVJ?=
 =?utf-8?B?LzM1dDViTDNnQVpkWllpaTJIV2orTUNoRGIxTDc1MVhHSmJadmlId0FMeU80?=
 =?utf-8?B?WnorV1daVWJDQWZiazd3UUcvMGNVemt5TnJtcHlBWjdidnRSS0crS2NTdVdN?=
 =?utf-8?B?MzJWSzRpYmxEUXRlOXFaR3JVMXBoa2xJR0RIM3lFQ1pjbVRWM2NTcXdORUpX?=
 =?utf-8?B?NGRZNmRXT1hSakhJRVRSQ1JTVnpialhPc1M1T1JRWERiNis2Vm9HWXMrQis1?=
 =?utf-8?B?N0E1L0F3RW9leGxwSlBUaE91MEpkQ3pjM2dNMEF1OFlFc1poNmRyNVNJeVFK?=
 =?utf-8?B?RkJGbXZMajNrVDlkWHBmQklmOXVEdnVsNUlzZnNpVWprTnRwQzRiWnJ4Mkdq?=
 =?utf-8?B?N0xJZEl4RkQvekpORUFTaHYxQk4wZFZlMDhmZmxlOVV4b3Q1bE1nbWVBZDJ1?=
 =?utf-8?B?ZUVSbmxHMjRpUGFWZDNhazBnSERYRitqS0hhT0phc2x6UFBEZFZLWWN6MVZ5?=
 =?utf-8?B?bTdBQ0N4QVZXc0szc1pobjgwemxlVmFYVElFUUUrZ3J6a0dnSWNleCtpaXBO?=
 =?utf-8?B?OEpxZHR2WG9TZWlMdXhKbVdvU011ekxkOGRxd3cyRVZiS0t1clRTR2wwdlJB?=
 =?utf-8?B?QlRreXQrN0dpYkVUQmYyVnZVRytNSGo5UU1pb0xidFVMcmFuNUFtZHg5Z3hS?=
 =?utf-8?B?RjY3LzJNb3ZHNDVSdWhWY0RDQTVtQXZBZFc2Y3F3NXBFMmZOM0FIUGVzTHo3?=
 =?utf-8?B?NWR5WU54V09xSTRDdERrRkpFMW9kcGh2bStSVUdFRzBnRG51Qm93b2R1WDlq?=
 =?utf-8?B?azNWekhHN243YWN0SVA4aXBRR2dSRXZqMVEvRW9QY0ZEQkNXSnF1VGJJMGJa?=
 =?utf-8?B?WnQ3d09GL3BSeHd0RnN2RWVNaHF3ZW5jc3VFN0FVZnJhSld1Z0dGNUZhM2Ix?=
 =?utf-8?B?WGs2bTFHckROcDI0T2cvbHJEcFBLY1JTUW5xUkRiS1RKTnBkMVpsY2lROUlK?=
 =?utf-8?B?L1luRm1SWXFPYWtHY0laKzdmYk9CSzIvZDRvb0ROMHBkcTVGNzJWV0lBS0xC?=
 =?utf-8?B?ZlNIUml6L2xnZm1sN2dSU2VsVk1Pa29HV09acjQ1Uit4ZU9CZHRVcG50RTl2?=
 =?utf-8?B?N3RXdW1DSmxDWGVXQ3V0Qk5BYWFFSHgzdGsxQ3ZBbnpqaEZRdVU0UGJRa3JE?=
 =?utf-8?B?NEpHNERubXBrTW9nbnpaNzVCNU42ZE14NnU5RVRZRHYyNktUWFphSnFGRHZs?=
 =?utf-8?B?dVplNnRmMTN1UmlEcTl6VW9lSmRqZGlsdzZGU2U5SnZIS0N1RC9xWTFBPT0=?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(1800799015)(366007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?WitiRHh1d2lObmNzdHpBb1EvR29KamNiSjErQk9xV0lOd3pXRmhKaXc2Q2Y1?=
 =?utf-8?B?aWZJU2RxQ0pTVnVVWnRwR2xDWXNsQnR6Q2Y5MWhCY2JHQUhNaitzZVlaTVRH?=
 =?utf-8?B?VnIzdmFhNm1xdi9PNng5M0NSMmVhS1NSdmIvWXdDL3NjdXpRQkRIUWd0S3hy?=
 =?utf-8?B?TmZxS0xQYjBWdkVJZ2hFMnFabS92UTdXUWZoaWJVOVlZdHlTeFVJMzlEVUxk?=
 =?utf-8?B?Sm5ra0ttTXFOWHpWcUl4OXZ6U2EyeXkxNnc3WEtMS1dsdDRWTEY5MDUvd0R3?=
 =?utf-8?B?bHJvbjZFc0t4UTZuRVp0NGt1Zjc2UUpCNXVYWnBONmkxRFlLOEhQTllIRkRE?=
 =?utf-8?B?MlgveXlKWE5sUFNzWHlTVHlnSXA0ZXdib1FLcTcyRXVwQStncWpGaWdEem9q?=
 =?utf-8?B?cjl5djVIOTU4dU9FaWxERWtqVFN1ZTV6N1BaQmFIWVpVbVYzRVo0NVA3YlR0?=
 =?utf-8?B?VGNHeGRpYkpPcGVwOXlKZzgzZ2tIajNybWdoV2d6VmFzSUJoSDZOQURFTVUz?=
 =?utf-8?B?OXFRQ0oxRzE2cXRpM24zejlXL2gyekV0bDEzMmpOQ09iWnY5RXJhcU1kVFV3?=
 =?utf-8?B?d3Z2UlZZNlI5T3ZnSC9BNmdqbms4cUFJbjVLLzlXYXFLUVZFQ3gwRVZ0Kzlj?=
 =?utf-8?B?dktGNHp3bHBpTnN0VHZZV2VGZDBMQ1dyKzd3UENmNUIzS0U0Q0haRjZaTU1o?=
 =?utf-8?B?N1JheE83K0psVEFtRjdFZjhQb0RLb0YreXdvNkFHaytYeFVzWHpSUUZZSkV6?=
 =?utf-8?B?Q2JxbVhEbzAyTm9HWXFuRWpZZEN1cDNlMldxTEoza2x3RUV4REROVU9IL0sx?=
 =?utf-8?B?a3FpcU1qS2hTa21UV1dRYVN1TnMvZFU3VGY2czVPeWhaRVhvd1g0RGdNWURa?=
 =?utf-8?B?MWlrY2VENFhyL2VpekQ0WDFPOUh4a1dXcjZlMTVVeXVZWGxqdU1zdDZhS2xW?=
 =?utf-8?B?ZnV2VDl5bmt4SDluUU83aHVVVkpuL0U5WnNJcUFlV2xoWWJJTlVSVk1LMnpH?=
 =?utf-8?B?VE13OUdQMGcxS2EwWWJFV1NCV1BMdkhweGgrQ0lnN2k2aDdlYXhNNG1uRHZ6?=
 =?utf-8?B?Skh0ckpFT1lwVWh5MUNUS0JPcW9UdFlqZXRqZVdVdzlQZVd0S1BXZmVIcFow?=
 =?utf-8?B?WHgxbnFTV3RuaThFTmUwUjhyYkpZZG5HYjR6d2hHdFZUTWJqcTQ0Q21HalNl?=
 =?utf-8?B?WGdqL29keEhZWWFHdDl6UWc4czNMUFRnUXpYcm9EQm9KQWgvb3YwWCs3L0Rh?=
 =?utf-8?B?NW9CZW9pU0JyWFFhR0phZTMxYVk1U1FLdTdpdDF4b1JkY1VOZlNaT09GNTVQ?=
 =?utf-8?B?K3VBd1JuN1E0NUZtcEljUzNVeEgwVXRBN0xLV3paNEJ5b1hDMWFJZThqQ2lG?=
 =?utf-8?B?cEVzL0NPQ0RyUFpreDFDT2JEV1VIbnJsV1BRR1JQdHFnTndvSzZpVHZYTWJF?=
 =?utf-8?B?NkJBYVl2UjdDZEY2M1BMTGZ3L20wQWJCcEh6YnpxemFaK1dmTk1LV3JVVDgw?=
 =?utf-8?B?ZndiMUZvQldJNUo0ejY2bTdNaUpmSFJUMVUvYmR6SDJyeHlwenBjVy9ETVNW?=
 =?utf-8?B?OU1JUHFYUXd6OHdvK3c0UUp0TEQ2bGNKZlFUOUY1WTV4eGMxYVlLVU1xVFMr?=
 =?utf-8?B?Y20wN2VHNzVYTUo2WFVxSU00ZWRnSGpPMStHNHA5cCs0RDZSRmhmSEF3SzQx?=
 =?utf-8?B?SlNMQkxvR3p6ak5LdXN1R3pDZ21jbC8vdm5oN1k3OEYwVlVEZForMmdWWlpi?=
 =?utf-8?B?QXl0R0JpdEJXay9RWnpxZDc1bytpNlB0VkcrWUVsREFuT0JnZTNMSW5yaHV3?=
 =?utf-8?B?MDdSUlloWFc1ekQ5Tm54OVlaSW1PZklkTklOSlA3N0R5RWUrSEY2djlhdjJm?=
 =?utf-8?B?b2Qzd2xBenBKQWJhQVNMRTJoeHVMWS92QkhUMDFVM3JFelhBMVZqU1lBL0lo?=
 =?utf-8?B?UWZtdHRrc1lLMDVUOU40NEx6TkJYRW94QlBOemtaeTg4Qk5ZKytGaDJxbUth?=
 =?utf-8?B?cWdGSnk2d1dra2hOU2szaUFsWkpKWUNOdHl6UUo5dFZZaXRnZDgwVHd1aWZD?=
 =?utf-8?B?ZGJ3V25IMDVSck5zcUZUVnV1QkRyS1BsdGJGZVdFaWFyV2xNNitIM0FzY0FM?=
 =?utf-8?Q?66MQOuig0ZednD0Y/hq0j9QiY?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	0IiRVbZ1Yd0HVyM5K0gSBUoml0+wmULv4jMBUTVteBDK/XjTzbgxcAzmKI3n1Fm/g3Boq1lR/dotVMPrwbXaBDO+UtjwYak6N4Vf16iFp8HC5/GRMAzCwe+ahjBAkoSdXjdu6/fpSgHQOA2cAvEmjgrKgC4yHgJg/L+ZrmDjqCTchfTBDtUAmT9XVwGiSS2ZdAcm/QN7xS98NKdxGFptUilnbcDnahnnLbBBtqH04E4OCVULw6QlNVrB/zZRWR7/ttgLISsG0ElrAeRFOMDDlA0aUhfHivsO8uTt8jTkRlQZJfNUC5mM9mvUP0XSTyX+CC2dkykmUL2Dnzx2/3C+GhNykb9rZ9/NuQPSno7PtNKJhWwfdvGClyTsv/gddQLIkRmsmLR1RgL2RqvmIDihmsTWw1FqDbZxrNL2lxBhRgjr366SVdMfpk4vPrk4nyruutYpwMqm1Smmz2KGO104lryjI0hfFoy2YVj9gXGbOufZH4u704fWD4iqOYlsL6PhutbG2iilC9L6GSK0CJyzWZlip7Yeb6uLmOoLR8RTrYh9PQu1gqfPZjHC1bEIBY4i36X7WCFIQ2ygJ3x+4YY7HOx+d41cPoykXJbCP5FKSvA=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c90821e-d4aa-4af6-e8f7-08dc65489231
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Apr 2024 16:55:54.5668
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IYzmilXcUr7mE1/FWtg94dBZRy+HfyJQt8aHX6iFkQBLNFUdB/0XixAmOM3j706/s6VfUNNWKVvnlUxTKckmDA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB6281
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-04-25_16,2024-04-25_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 suspectscore=0 bulkscore=0
 mlxlogscore=999 spamscore=0 malwarescore=0 mlxscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2404010000
 definitions=main-2404250123
X-Proofpoint-ORIG-GUID: LVeS9y8-XzDjqUlCgaseAQX7yKC6vq-s
X-Proofpoint-GUID: LVeS9y8-XzDjqUlCgaseAQX7yKC6vq-s

Reviewed-by: Eugene Loh <eugene.loh@oracle.com>
but "This" (the opening word in the commit message) is a little ambiguous.

On 4/25/24 12:40, Nick Alcock wrote:
> This is incompatible with the dynamic-length-string trick we pull in
> the DOF parser (which is in any case seccomp-jailed).
>
> Signed-off-by: Nick Alcock <nick.alcock@oracle.com>
> ---
>   libcommon/Build | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/libcommon/Build b/libcommon/Build
> index 50aa4ed88f8c3..fd54dc044f9af 100644
> --- a/libcommon/Build
> +++ b/libcommon/Build
> @@ -8,6 +8,6 @@ LIBS += libcommon
>   
>   libcommon_TARGET = libcommon
>   libcommon_DIR := $(current-dir)
> -libcommon_CPPFLAGS := -Ilibcommon -Ilibproc
> +libcommon_CPPFLAGS := -Ilibcommon -Ilibproc -U_FORTIFY_SOURCE
>   libcommon_SOURCES = dof_parser.c dof_parser_host.c dt_list.c
>   libcommon_LIBSOURCES = libcommon
>
> base-commit: 6c5f67cc8ea1d694da8043c8f5aeb2f97b69997a
> prerequisite-patch-id: 27ade1c234620c8ed86991c2311a7887e935e1c0
