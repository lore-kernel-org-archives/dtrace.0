Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 812182FA0EE
	for <dtrace@lists.linux.dev>; Wed, 22 Oct 2025 20:19:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761164399; cv=fail; b=ZbBL7Evbrdch0Szvyu/huafHNl72nc0j3vQLnw4Z8s2tVrYxMsxaPKJyndv6FUKZcCMl7e3Fhw/86+x+FkitlSN2vfP2OWgAxQ7yxW3E5MiIheYnh6+1Lb8Fg9G+wgc1SzmerlkXBGZZs3K/YpM7lMXo65POXW6NJXRaX6NFpBs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761164399; c=relaxed/simple;
	bh=yjjsb1kPH4UKBJdBu/WFWtyOBJKwdG7AbnTBMuIk9UM=;
	h=Message-ID:Date:Subject:From:To:References:In-Reply-To:
	 Content-Type:MIME-Version; b=B8J80wYlbQAkh8wLrAs9yR6zv3/ZBfguNGzdeaxaO3rcTmfNKQ2z0IQknYPhvjwmMRv9v+4Havaqs0L6tfiW3MY89HKXXSJ0h55WQ9GrjEjKFpvzdIu9ItdjMIGZe3CGfOj00dtkf84IXW2SaiVPNCheWXGetAAcgk34wanO1Ps=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=sdcAfw+6; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=wDd/qPDf; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="sdcAfw+6";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="wDd/qPDf"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59MI0EW0010080
	for <dtrace@lists.linux.dev>; Wed, 22 Oct 2025 20:19:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=POfh4ikA33X2eRGFeuSeqO4EEPQVW3x6QBKu4wENe6k=; b=
	sdcAfw+6ukzYBno4vD3cxNDD7e/rXxg3u/+xIBd6rnNpxJIZKYnBn+SXNs0RJa29
	27qBVaL6COhZXFzUEHpkyuevdCxNUhVWNthZC9mIhz+PQs6tz/Qr2QOLcWxFyLNo
	6CPJNe2iRNkgcV27L+osJ4CNCjlYVH0rAjlEun/hyexAJ/mdTwFtHOpSDSFlP7zB
	oOL8gmhISXznp37mATnHoP2rMk4ljgHEKDgg/TNvApVCZRYxrPdhM68nKfNFeDvQ
	OewfQvuDU7ocytgA6boSbbZL+3nps3grwnj2M7o7EawKQzclqcBDdzf1r67UOV8V
	lzeLbORCzOD8qucwBzupmw==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 49xvd0s8xs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 22 Oct 2025 20:19:55 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 59MJwiLv022350
	for <dtrace@lists.linux.dev>; Wed, 22 Oct 2025 20:19:54 GMT
Received: from ph7pr06cu001.outbound.protection.outlook.com (mail-westus3azon11010049.outbound.protection.outlook.com [52.101.201.49])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 49v1beq6y0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 22 Oct 2025 20:19:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WcUhPF+Ex7bnylpSMalEjLj0XB73rQrapL3314EhU1NqQSASm+GM6NDQiOEJoByXcXvA3D0mPit9wjp9tup5pAmyMAPvZSDVN8Zu96l/bsmTAAgtM4bApGGyjj9LpZY//uHC6zVXreW/NH/bwpJ8Gl3VItxTX61wLcjpuqXoT/vG3LWHEdLy4ncTGzV4pz/WKGWQ0KEOeKzcJMfL5bmD+NdsZgF9tbQVhPWdRm3YNMc221kZYQiGCOXwO7gn+JEohEPSNDcI5hZqAFcLiItJqgJD2lP9OoNWGuAUxzfyJ6ltpueXv5dTzkBrdwfnADdIFxZc4vfe8tE7oO/l+0LoBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=POfh4ikA33X2eRGFeuSeqO4EEPQVW3x6QBKu4wENe6k=;
 b=ud/sz4sSVB1f9BbtiUSO2QMWExB4sU9Yl9z8UxxLSymsBwbh89BTmrbioq5mgnk88tS4erqmTzGJMqnjZjsB1qFoqeEwqAXrzYmGvynr2TyedlRHxvegwocwLpSW+4QORZwFIg7sF//3lPHn4ElNHu+aFvA/CoCun+QxiGX31jcXVitVcxP434eJ0E6YpHPH6a2nKNtE31hX5V9qanHQlBB9oLfA3o0Yfb/7rsqqz9a08IKPRP2/cmSKO8NbaqAY8QoPZ005qycrgb1VnsT4jg6HvmUCTLF62Gfu+q/uGOtIM+b7gpYuEC/68pJhAiY1POthD+SNqRlP0vPOUcGuEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=POfh4ikA33X2eRGFeuSeqO4EEPQVW3x6QBKu4wENe6k=;
 b=wDd/qPDfl49TWkkzp0ltlX/iPUwbBE8TPjJ1P5SbGJcNL/yJz/o5p17xUaTs2M4yZDVd5bBHAUIVGEgh3JbEfFHyyA8fJugmHs5sEJCG7svpC3xj4Xxz2VH0pEtmdxouyo5yY3CUP51M3WT9T0e6/Y/o8xygBQUCuCS9xdoTu8k=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by SJ0PR10MB5598.namprd10.prod.outlook.com (2603:10b6:a03:3d9::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.12; Wed, 22 Oct
 2025 20:19:47 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b%6]) with mapi id 15.20.9253.011; Wed, 22 Oct 2025
 20:19:47 +0000
Message-ID: <543b5089-95df-8828-fe53-d3b2cf3692d8@oracle.com>
Date: Wed, 22 Oct 2025 16:19:45 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCHv2] Update llms-txt and add README
Content-Language: en-US
From: Eugene Loh <eugene.loh@oracle.com>
To: Bruce McCulloch <bruce.mcculloch@oracle.com>, dtrace@lists.linux.dev
References: <20251021201638.1318745-2-bruce.mcculloch@oracle.com>
 <290c46de-f96b-5318-9eaf-5a6121b7083a@oracle.com>
In-Reply-To: <290c46de-f96b-5318-9eaf-5a6121b7083a@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR21CA0003.namprd21.prod.outlook.com
 (2603:10b6:a03:114::13) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|SJ0PR10MB5598:EE_
X-MS-Office365-Filtering-Correlation-Id: 3e74a58e-2f2c-4b71-8bbc-08de11a85885
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YUlabWpidzVzRFYzT1lRNnZpSDNpeEJsWXNUdHBKdEpHWi90QVRuRFAyeTZM?=
 =?utf-8?B?ZGNsdGt3alFqYU8yMWoyeEZLSUN5Y2NaZkVpd3p5QUt6MnZXK1BYZkpHa1kx?=
 =?utf-8?B?LzhFNzBnVVpxM3NyUmFtVks4cmdGVnFqQXlCU1Z1c0hBVWVTMUxrS1IwaEdt?=
 =?utf-8?B?dFJTTFlSdWROb011bnVvV0g0Sjh3Q3hqSHhiUlFleUljR1F2SVU5T1ZBZzBR?=
 =?utf-8?B?bnlEWXFKQ1E0dWkrQmN0ZHVpM2xUWXMyRGtjMGdzdDh4RVJ0a0gzRVU3YW52?=
 =?utf-8?B?b1k2YVZrV0RmcC9lNG1VYzQ2dk1BTExiay9UNjNWYXQ3czR6czJpV0w0eHhC?=
 =?utf-8?B?eXExMW52UUJBZUNsWFlJN1dDY29VS2ZlTUdQTGNXUDRKQ0o3NE1Namwvekgy?=
 =?utf-8?B?S2hiOVhGeU85b3Nlbll4NkFXQWNtaVNTOFRaUURxYS9kODhmbWhTUnAxM05C?=
 =?utf-8?B?UEUxK0FXZkJKUXlVTDJYN3AySlZBem9USDU4cDljRmM2MjF1dFNvd0JXUjF5?=
 =?utf-8?B?QUltQ0lhUFd3SGZLVzlRVHVycXl2dS8zMEJPQkpyYytOZitSNkdOWUFMaFUr?=
 =?utf-8?B?UStkZk44aW95WjErL05WRStuTjI3dHhWMG4yR0dFUXZxeExGQ2NodUM4T3Qv?=
 =?utf-8?B?aW9wODlOM3dyNDdabkk0R280UndQVDFhQzBvRDV2WXVYT1dQSkNycmV0YVA1?=
 =?utf-8?B?QTlvRC9jSlBJL1hudnNPN1NuSDN1TllvNUtvMU84OGNid3E2QmJER2ZkQ2Zi?=
 =?utf-8?B?dVQ4bTRDUVJRMjJyaHlPRGNMQXFVSURlMU15WDZIUGhER0plWHpBVCs0bXhJ?=
 =?utf-8?B?Nm9MNUg0bEhkcUZoRDlEbzBlK3djWEZtWTJQL043ZExIY25lNUtGU3N0dzB0?=
 =?utf-8?B?dE93WGQwb09NMjlXVWp4LzMyTnZHNVhaV0VUOFUvUVIrVmRXOVd4YzFreUFn?=
 =?utf-8?B?THR1OFZhczFsUHRDZGVMWUdtNTQwZllzUTk3cmlHdHNXSDUrbGtYRHJ5d2FL?=
 =?utf-8?B?TFJONXlBK0t0ZENBR1VJQms2eTA4ZjVsb2ZrS3YzZUd4NS9PY1RLaTFRSUxS?=
 =?utf-8?B?TXM4KzNsd292bDZ5SnFSTDkyWFlYR201RXRFUzBFeHNBZ3l3V3NCcmkwbitF?=
 =?utf-8?B?NTBlVjEvMHhFaEd0NjJ5c2x4M2wwQ25oT01tck1ZRm1xQjBienF4OElaOFJB?=
 =?utf-8?B?UGtzdWVnMkd5eWhZZU05SmNqajBsVWg3NUpnb21zdHRtMmw0T1BiQW1vUzJl?=
 =?utf-8?B?VWVFbjJEYUtnWWk2UzIwbFc0MXFFanJGdGh6aHpDZXk5ZFl4UFpldFMzUHRP?=
 =?utf-8?B?azhEUjhTTFllSDF4RUNoSTNzOVlvR1FvM3Y4YTlqb3VuMFFsVHliM01QSXpu?=
 =?utf-8?B?WUpKUnJmb0tFYytmei9ZZkVpb3ZxRVhmVXYrSmV0WU9HL2FXRmhMNGgyeHFy?=
 =?utf-8?B?Nm9Sb3pHUFpUcHZGamU0aENPczZsUVN1OFBPQ1lucGhyODFTOU1tYnYzZjV6?=
 =?utf-8?B?TGo5VXlnSFg0dk0rbFhLUGNVelFDb0hRVjZHVUszWnA1WUxoN0d5RWdyR0ZE?=
 =?utf-8?B?UklzWVFqN2VsV3hvUGVZZy81NTh5N25sU1BKdTRURzBhKy9oZW5MOCthMlNY?=
 =?utf-8?B?Lzg1RThvUC9uWm94SVR0VkRHdmRJSEhUTGhoclZHTmJtdlJrRVNObzNSdk5o?=
 =?utf-8?B?U0RPSWJsU29ZaWp3RGdlYVA0TG90Y2ZkQ3UyR3prWXhmeVhYSkI5Y1JGdHJo?=
 =?utf-8?B?UDhTdEZicVNhRFp1L1dkM1RoK2VMN2JjR21aNkNzcFp5bHE3b0ZzL1BsM3Zl?=
 =?utf-8?B?WHlLbEdoQnd5VTc3Y1JYdXdjOWxOeDRCQkxNK0M1K2ZPNmRhenhzYkQvNENS?=
 =?utf-8?B?ZWdXbysyaGxxMkgxcFZMaVdEVHNuRXVMck8xeXdhY3U1V0E9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SFV1V2IrRzM4dkNnK3hyblRKRjZmMk0xeDFLb01LSEg1anJNVnoxOCtqQmMw?=
 =?utf-8?B?MzYzRTd1Z01vSUJjUDU5Z2l6TTdmK2VaakNKVm1wODllaGEzaGpPVVcrTjd5?=
 =?utf-8?B?QmxheFJTSzFkYlh6UFU5TnJMRG1JQkt6MVNINCthazlremx3YU5PSnYzM2Jz?=
 =?utf-8?B?U0ZCeVVSRW9hSE50dXJHbjNSdWd4akNNZ0dReTcxaFQ2Mm53UmtkK2QxVDNq?=
 =?utf-8?B?VjV5T0toVG1Wd1g0czZ2OUVPc1ZFRTMvL3FoME44ckgvbEllUmhNOGJqQVNm?=
 =?utf-8?B?aXE4emFwSVM2L0EvS3hLd1Z4Y2cxa0JUV2R5OHg0MGw4R3BmdmtuNUNFRmNz?=
 =?utf-8?B?Y0dwUVNJZW5XemZVUEpXMHByRm4xZ3VvUmZ1TFI3TTRJaVdjQlgya0N2WjFV?=
 =?utf-8?B?WjRjdXJsaG84NHJFQ3ByWDJYOUExaXUwOGcrWWpuTGIwSE0wT0VDZXY3Wjhs?=
 =?utf-8?B?bU5CQ3V6c3N5Z0QwMm0rRFNRVUFOeXE1YythMis0SDNWdkpKd29WTWtQdGVC?=
 =?utf-8?B?SVBGUjJLbEZPMXlraytaSVMwSkMvQ2dSMWN6NHRDeDdobDI0V2RxbFdWS0Zk?=
 =?utf-8?B?azRObWtnajhrcWw0K0ZkOVdYNXNqM3NJM1FPSHE3ZXVmYjBUWC9MZWdEY3B4?=
 =?utf-8?B?b0p3Q2NKeGlmRlRoSVdqcmxCa0VWbXhoTHNyQTA3cGNadDFuUC9TZ242UG8v?=
 =?utf-8?B?OGltYTV6cmFZelI2aStzc0VUSytYQnZWa1djY05jQS9VR1hIeGp5OVcxWDJq?=
 =?utf-8?B?U2VyUGloQTlVaWNmUkZHeWVNUS80UXIvOVA0dmM2MWlMNVZycGh4RlY0NC8v?=
 =?utf-8?B?aXBBK1lnR1lJQlBwakVqYzFObnhSYjRNS2ZxUlAxR2RGREI5ZTZaTFdUQTRF?=
 =?utf-8?B?SHNmQmFFRTkxdGJRdkRsTHJqOU5pV3ViZzZ6ektibTJjbkMxVG95Z3V5MjdK?=
 =?utf-8?B?QUNiaW10QlZXVW5MdXR4V0xYUTZPcW5hYmR1ZXBsYW5YKzI3NVowTk9KRG5w?=
 =?utf-8?B?d2EwZEhPeDFYaEVsZ0hJWmQwRE1UQ1N0NTFzakp5U1NTRldmVGNBeVJndlov?=
 =?utf-8?B?R0NNVVRtVEI1R1VDT0ZpUkdEbWlGVWhNN3FWU2RGcklZc1NoYlJZVFhpSGdl?=
 =?utf-8?B?NlhYS21vWTJpd3U3RHBvcUJvbThPVEZZc1IzQU90SE5zbStMeVVLUW5sbFAz?=
 =?utf-8?B?MmlsMUEwM2Zjc2RmbUZFRVVPRE5iYmpJRXhzcURrOTEyRGE4QnRLWXVEcDlk?=
 =?utf-8?B?SytLcnN2UCtnWFhnSG9qMHZQTVBEeThWdzZRNlVydzA2aHBDTDZKWHp2YnZK?=
 =?utf-8?B?R0cvRHNQekcyYVZxL2VKaG1ZZXM0bnFuZzVvTG5HREx5ZkNGUzI0QWJqa1Y2?=
 =?utf-8?B?QmJEbGRrMWtOMFNCdEpsWW1UcUphR1hGblhVRnYyR3JTM3h1ZFBmYlBMbWZX?=
 =?utf-8?B?Y1BvSkNVVFJ5aWJQc0E0NHdhSFBoYTEwUG1aMERuSVZtLzczall2QlBNaDl2?=
 =?utf-8?B?cG5VeElvaFMvVjFoQ1pMUzVLaTJaek9PR216citFc0dja1dNQWwrMVJ5VTVi?=
 =?utf-8?B?VlhkdCszQTJiMDBOdmhhVTFZVUNHeURVbG5nMFRrdjRhdUFOZlVtM3ZURHhR?=
 =?utf-8?B?c2RRQ3lONlBNbWZSZHlBTE54L2NUWmg1YVBGL1BQWUwwakFBZ2VRRmp2Nk53?=
 =?utf-8?B?SUt6TU81QkdENzl0U0NxeWg0S2dzNnc2YkVwK0xqT3krakxhYTZLZTl0bUY3?=
 =?utf-8?B?UVVhQTRnSU53QzdMRGk2V2w2RWZTTUtGNkxaUUFrc2tKd2Q5ejczQUtsRmdj?=
 =?utf-8?B?c1VuRFQ2Q0VaL3NabGdsWURhUDRtbzRWbWdFM1JoOEJHYngydnROdnB0YU14?=
 =?utf-8?B?YjhPVlkrSVp3YWVFU1FIZExRdGt1V0U1UjRwWnZuYXAxSEhuL3J4YWJhR0VF?=
 =?utf-8?B?RGFVcithVmVGUHFTNXNoZ1VxbEo2dDF5aTFTT2dTRWNUSVNYRG4yMDQ3Y0tH?=
 =?utf-8?B?ZlprUUFnZ1JqbUhyTXdDQStOeU9uSExkWU1RaThUTGlPUG9rNDNvV0tadGJE?=
 =?utf-8?B?U0xGZHoxcXMwNEhDU2hZZzFlYXdMcTkyZUU1WlhuZFg0RzQ1ZGlUOTZBQWUx?=
 =?utf-8?Q?3YpyX3FJ3RLz8hKmpE8PQqjU6?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	Q+zNOG6DAjLFAzyaB9QNIPxC3bnT1M9y/uZ4QtVOQESL5xuv8d/ffHDLGteg69BilP9JLio5eOP1aFfALj6ttrZrJZIWa/Z+gMmqkYJZGQu9yN92NroJU3D8DHjaCvfXUXKrS7oX/mmaciFrm379RutRwCeVDA9L5evJZBgWAlyVEpi8sLoXG9wYMc7mUBb5pbDeEplOImBpcW13vs3zflJ8Jxz2zMm+ip83RdkRyXUmdBCdK56t13qbc0wpt5xWzzZ5B3EGOWCmB4NBt9ybpYlFfUagffxLAnOp4gbW5sxVymNJF7Rvh8iH5cafpbeQLa1xPerBIcV+wpMN8bjrIAn9aVkLOKmq5CoYOoDnxDjWYSe2H06bzNuAOiVoPsL/8P48DmNQXpsgiKRre1oygetM43CK7giazjrjavDJ4bDaZE6nZDHctuJBH1WLTEithpWeqMymz2+31mDhfRNaoU2+dcmasuOnszt7NPjqe09TnztRCZYu95LNTrP10Ygk+XgAfdZXHRAyAmJhRQ75Ox3FexOXOY7UnfaKjOj1WNTyglEDvAzjE/0sHrxjW5CSfdY5RTjA/haU+t7iBjwlyJYEl6ScEBNKeTCEeA1KCl4=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e74a58e-2f2c-4b71-8bbc-08de11a85885
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2025 20:19:47.3467
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0pVFfq400LRo3so8ia1vmWIcnXHDtU9PkWePi10hW5hV+X1rrmNq4ayVuwDdOMB3PG4Nl4671rhuZT+lFjLy5A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB5598
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_08,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 mlxlogscore=999
 phishscore=0 bulkscore=0 mlxscore=0 adultscore=0 malwarescore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2510020000 definitions=main-2510220167
X-Proofpoint-ORIG-GUID: tLr7UZ2o1Yd_puVuY_ePZqzynNPvmgTx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDIyMDA3MyBTYWx0ZWRfX7YbovdIQOoBD
 RWE/SXVXxomXIMhUzVaZUAUlU+9DY55EkBAC9OPHyFvbvvZUroj+TosXbdhLeIcjCvgpOr+3e3c
 LWsROkR4arnL7jZzXFjWqJSOrrsZZ3OyhbbKavWoUhxqCz8tMVoP3zsM0jUKvw+J++HzmvXFFs0
 g3RT4As8IKO3GKNz4QaLyns7o8V4Lk3mVWyEubKkOfUonYpjsxVtN2TydnQrk6HW8RVQjoXi/A9
 U0PBErUdAjGAoua7PUtn8qOTbtIcn7GsD0bzgID9Hf1m500/9ufPHgRrW04nNMdcLQsIreYTDnN
 WaAJLF6buMhl/MP9NorHsiDAA6PlapKmoRGs/7T20by86OVSZoBxDsE2OurnRJU99UD8JjLn7Rz
 AGMOgXk/VWIC4SZs0da2sJGx6wMiiqo0GJZvYBDf+hZCJe0l8uM=
X-Proofpoint-GUID: tLr7UZ2o1Yd_puVuY_ePZqzynNPvmgTx
X-Authority-Analysis: v=2.4 cv=D9RK6/Rj c=1 sm=1 tr=0 ts=68f93c6b b=1 cx=c_pps
 a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=x6icFKpwvdMA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=NEAV23lmAAAA:8 a=-bMhQ6iiAAAA:8 a=yPCof4ZbAAAA:8 a=2JxCch5Gs5qIy4JcrR8A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=aViEl8YYgB_fEZN5ws7z:22 cc=ntf
 awl=host:13624

On 10/22/25 01:06, Eugene Loh wrote:

> On 10/21/25 16:16, Bruce McCulloch wrote:
>
>> Hello,
>> I have removed the reference to the blog-git html file, and edited the
>> links at the bottom to include a link to the actual (public facing)
>> blog.
>>
>> Bruce
>> ---
>
> I would eliminate the above text since future readers will not have 
> the v1 version of this patch anyhow.
>
>> Signed-off-by: Bruce McCulloch<bruce.mcculloch@oracle.com>
>> ---
>>   llm/README.md                | 130 ++++++++
>>   llm/llms-dtrace-complete.txt |   2 +
>>   llm/llms-dtrace-short.txt    | 611 +++++++++++++++++++++++++++++++++++
>>   3 files changed, 743 insertions(+)
>>   create mode 100644 llm/README.md
>>   create mode 100644 llm/llms-dtrace-short.txt
>>
>> diff --git a/llm/README.md b/llm/README.md
>> new file mode 100644
>> index 00000000..7324a636
>> --- /dev/null
>> +++ b/llm/README.md
>> @@ -0,0 +1,130 @@
>> +# DTrace LLM Context Files
>> +
>> +## Overview
>> +These files provide structured **context packs** (`llms-txt` format) 
>> for use with large language models (LLMs) such as GPT-4 or Claude.
>> +They teach the model how to write **correct, safe, and complete 
>> DTrace programs** for Oracle Linux.
>> +
>> +The goal is to let engineers and administrators generate working D 
>> scripts in natural language — without having to memorize the entire D 
>> language syntax.
>> +
>> +> The context files describe probe syntax, predicates, statements, 
>> variables, built-ins, functions, and safe tracing idioms for core 
>> providers (`syscall`, `proc`, `sched`, `profile`, `io`, `pid`, 
>> `usdt`, etc.).
>> +
>> +---
>> +
>> +## Files
>> +| File | Description |
>> +|------|--------------|
>> +| `llms-dtrace-short.txt` | Compact reference used to bootstrap LLMs 
>> for DTrace knowledge. |
>> +| `llms-dtrace-complete.txt` | Full expanded reference (available 
>> from the [DTrace-utils 
>> repo](https://github.com/oracle/dtrace-utils/tree/devel/llm)). |
>
> Maybe I'm just tired, but I'm confused here.  Why wouldn't the reader 
> of this file simply get the llms file from the same place where they 
> are reading this file... whether in some git clone or from github or 
> wherever.

Put another way, how about changing that table to:

| File | Description |
|------|--------------|
| `llms-dtrace-short.txt` | [Compact reference](llms-dtrace-short.txt) 
used to bootstrap LLMs for DTrace knowledge. |
| `llms-dtrace-complete.txt` | [Full expanded 
reference](llms-dtrace-complete.txt). |

Because if someone is viewing the README, the llms files are presumably 
nearby.

>> +
>> +---
>> +
>> +## How to Use
>> +
>> +1. **Install DTrace**
>> +
>> +   ```bash
>> +   sudo dnf install dtrace
>> +
>> +```
>
> The opening ``` is indented.  So I think the closing ``` must be 
> equally indented in order for it to be seen.
>
>> +
>> +Make sure you are using the DTrace binary from the `dtrace-utils` 
>> package,_not_  the SystemTap compatibility binary:
>> +
>> +```bash
>> +which dtrace
>> +sudo /usr/sbin/dtrace -V
>> +
>> +```
>
> I suspect this "Make sure you are..." sentence and ensuing code block 
> are also supposed to be indented.
>
>> +
>> +2.  **Load the context file into your LLM session**
>> +
>> +    -   In ChatGPT, Claude, or another interface that supports file 
>> context, click the “+” icon and upload `llms-dtrace-short.txt`.
>> +
>> +    -   The model will automatically ingest the reference and 
>> understand how to write runnable DTrace programs for Oracle Linux.
>> +
>> +3.  **Start asking questions in natural language**
>> +
>> +    You can now prompt the model to produce valid D scripts:
>> +
>> +    ```
>> +    write a dtrace script that shows all read() syscalls made while 
>> the script is running
>> +
>> +    ```
>> +
>> +    or
>> +
>> +    ```
>> +    count how many processes start on the system within 5 seconds
>> +
>> +    ```
>> +
>> +4.  **Run the generated script**
>> +
>> +    Save the model’s output (e.g. `trace.d`), then execute:
>> +
>> +    ```bash
>> +    sudo dtrace -s trace.d
>> +
>> +    ```
>> +
>> +
>> +----------
>> +
>> +## Example Prompts
>> +
>> +Here are a few good starting points:
>> +
>> +>“Write a DTrace script that prints the PID of every process that 
>> accesses memory.”
>> +
>> +Teaches process-level tracing and probe filters.
>> +
>> +>“Provide a DTrace script to count how many processes are started 
>> over 5 seconds.”
>> +
>> +Demonstrates use of timed aggregations.
>> +
>> +>“Show all `read()` syscalls and count how many occur per process.”
>> +
>> +Basic syscall entry/return tracing.
>> +
>> +>“Track which executables call `open()` and print errors.”
>> +
>> +Uses speculation and error guards.
>> +
>> +----------
>> +
>> +## Safety and Trust
>> +
>> +DTrace runs in **nondestructive mode by default**.
>> +Even if an LLM suggests unsafe actions, the runtime will prevent 
>> writes, signals, or other destructive operations unless explicitly 
>> enabled with `-w`.
>> +
>> +This makes LLM-generated scripts safe to test and explore on 
>> production or staging systems — they can observe but not modify the 
>> kernel state.
>> +
>> +----------
>> +
>> +## Notes and Troubleshooting
>> +
>> +-   If you see:
>> +
>> +    ```
>> +    dtrace: could not enable tracing: Destructive actions not allowed
>> +
>> +    ```
>> +
>> +    either remove `system()` calls or rerun with `sudo dtrace -w -s 
>> script.d`.
>> +
>> +-   If `dtrace` behaves unexpectedly, ensure you are not invoking a 
>> SystemTap binary:
>> +
>> +    ```bash
>> +    sudo /usr/sbin/dtrace
>> +
>> +    ```
>> +
>> +
>> +----------
>> +
>> +## Additional Resources
>> +
>> +-   [Oracle DTrace Utils on 
>> GitHub](https://github.com/oracle/dtrace-utils)
>> +
>> +-   [Oracle Linux DTrace Training 
>> Modules](https://oracle-samples.github.io/oltrain/tracks/ol/dtrace/)
>> +
>> +-   [Oracle Linux Blog: Natural Language System Tracing with Dtrace 
>> and LLMs](https://blogs.oracle.com/linux/post/dtrace-and-llms)
>> diff --git a/llm/llms-dtrace-complete.txt b/llm/llms-dtrace-complete.txt
>> index 2264fc40..8a4a535c 100644
>> --- a/llm/llms-dtrace-complete.txt
>> +++ b/llm/llms-dtrace-complete.txt
>> @@ -2,6 +2,8 @@ You are a senior systems engineer with deep expertise 
>> in writing DTrace programs
>>     You favor stable providers (such as syscall, proc, sched, 
>> profile, io, usdt, pid) and safe idioms that avoid invalid memory 
>> access or unnecessary output. You use predicates to filter load, 
>> aggregations instead of unbounded per-event prints, and you always 
>> include an ERROR clause when relevant. Your answers are precise, 
>> professional, and free of placeholders or half-solutions.
>>   +DO NOT RECOMMEND DANGEROUS OPERATIONS UNLESS THERE IS AN 
>> ALTERNATIVE. Do not recommend 'system' unless there are no other ways 
>> to accomplish the tracing.
>> +
>>   Below you will find all the information you need to reference in 
>> order to create correct and reliable DTrace programs for Oracle Linux.
>>     After consuming this information, inform the user that you are 
>> ready to begin writing DTrace scripts for Oracle Linux.
>> diff --git a/llm/llms-dtrace-short.txt b/llm/llms-dtrace-short.txt
>> new file mode 100644
>> index 00000000..a514abbf
>> --- /dev/null
>> +++ b/llm/llms-dtrace-short.txt
>> @@ -0,0 +1,611 @@
>> +You are a senior systems engineer with deep expertise in writing 
>> DTrace programs for Oracle Linux. You understand that DTrace is one 
>> of the most powerful tools for diagnosing complex system behavior, 
>> and you will always provide complete, correct scripts that compile 
>> and run cleanly. Every answer must include the full text of a 
>> runnable D program, with appropriate shebangs, predicates, and 
>> comments where helpful.
>> +
>> +You favor stable providers (such as syscall, proc, sched, profile, 
>> io, usdt, pid) and safe idioms that avoid invalid memory access or 
>> unnecessary output. You use predicates to filter load, aggregations 
>> instead of unbounded per-event prints, and you always include an 
>> ERROR clause when relevant. Your answers are precise, professional, 
>> and free of placeholders or half-solutions.
>> +
>> +DO NOT RECOMMEND DANGEROUS OPERATIONS UNLESS THERE IS AN 
>> ALTERNATIVE. Do not recommend 'system' unless there are no other ways 
>> to accomplish the tracing.
>> +
>> +Below you will find all the information you need to reference in 
>> order to create correct and reliable DTrace programs for Oracle Linux.
>> +
>> +After consuming this information, inform the user that you are ready 
>> to begin writing DTrace scripts for Oracle Linux.
>> +
>> +DTRACE (ORACLE LINUX) — LLMS.TXT FORMAT
>> +PART 1: PROGRAM STRUCTURE, PROBE DESCRIPTIONS, PREDICATES, STATEMENTS
>> +
>> +## GOAL
>> +Provide a compact, machine-optimized reference so an LLM can 
>> generate correct DTrace D programs for Oracle Linux.
>> +
>> +## PROGRAM STRUCTURE
>> +A D program is a set of probe clauses; each clause may include an 
>> optional predicate and a statement block.
>> +Syntax skeleton:
>> +```
>> +probe descriptions
>> +/ optional predicate /
>> +{
>> +    statements
>> +}
>> +```
>> +- Multiple clauses allowed; run in program order.
>> +- Empty `{}` triggers the default action (trace EPID).
>> +- Scripts may be invoked via `dtrace` (shebang/interpreter line).
>> +- Scripts can include pragma options.
>> +
>> +## PROBE DESCRIPTIONS
>> +Canonical form: `provider:module:function:name`
>> +Fields:
>> +- provider — DTrace provider name
>> +- module — kernel object / library / program, if location-specific
>> +- function — program function, if location-specific
>> +- name — semantic probe name (e.g., BEGIN, END)
>> +
>> +Shorthand precedence when fields are omitted:
>> +- name
>> +- function:name
>> +- module:function:name
>> +
>> +Avoid numeric probe IDs (unstable).
>> +Wildcards & patterns supported (shell-style globbing). Empty fields 
>> match any value.
>> +
>> +### Pattern tokens
>> +- `*` — any string (incl. empty)
>> +- `?` — any single character
>> +- `[set]` — any one in set; `[a-z]` range; `[!set]` negation
>> +- `\` — escape next char
>> +- Empty field ⇒ wildcard match
>> +- All four fields must match (with patterns) for a probe to enable
>> +
>> +### Multiple Probes
>> +Several probes can be listed, comma-separated; same predicate and 
>> statements apply.
>> +
>> +### Examples
>> +- All syscall entries: `syscall:::entry`
>> +- BEGIN without module/function: `dtrace:::BEGIN`
>> +- List available probes: `dtrace -l`
>> +
>> +## PREDICATES
>> +- Optional boolean expression between slashes: `/ expr /`
>> +- Evaluated at probe fire to decide whether to execute statements
>> +- Any D expression of integer/pointer type; nonzero ⇒ true
>> +- Can reference variables, built-ins, and operators
>> +
>> +Examples:
>> +- Match only "date" process: `/execname == "date"/`
>> +- Targeted PID: `/pid == $target/`
>> +
>> +## STATEMENTS (CLAUSES)
>> +- Semicolon-separated expressions/functions inside `{ ... }`
>> +- Default action when `{}` empty: report probe activation (EPID)
>> +- Clauses can use aggregations, variables, built-ins, and functions
>> +
>> +### Minimal idioms
>> +Count events by function:
>> +```
>> +syscall:::entry
>> +{
>> +    @counts[probefunc] = count();
>> +}
>> +```
>> +
>> +Predicate filter by execname:
>> +```
>> +syscall:::entry
>> +/execname == "date"/
>> +{
>> +    @reads[probefunc] = count();
>> +}
>> +```
>> +
>> +## NOTES & STABILITY
>> +- Probe IDs are not stable; prefer full descriptions
>> +- Providers, modules, functions, names may have differing stability 
>> attributes
>> +DTRACE (ORACLE LINUX) — LLMS.TXT FORMAT
>> +PART 2: TYPES, OPERATORS, EXPRESSIONS
>> +
>> +## IDENTIFIERS & KEYWORDS
>> +- Identifiers: letters, digits, underscore; must start with letter/_
>> +- Reserved keywords (subset relevant to D):
>> +  auto, break, case, const, continue, counter, default, do, else, 
>> enum, extern, float, for, goto, if, import, inline, int, long, probe, 
>> provider, register, restrict, return, self, short, signed, sizeof, 
>> static, string, stringof, struct, switch, this, translator, typedef, 
>> union, unsigned, void, volatile, while, xlate
>> +- Avoid names starting with `_` (reserved for system)
>> +
>> +## DATA TYPES
>> +### Integer Types
>> +- char (1 byte), short (2), int (4), long (8), long long (8)
>> +- signed by default; add `unsigned` qualifier for unsigned
>> +
>> +### Integer Aliases
>> +- int8_t, int16_t, int32_t, int64_t
>> +- uint8_t, uint16_t, uint32_t, uint64_t
>> +- intptr_t, uintptr_t
>> +
>> +### Floating Point
>> +- float (4 bytes), double (8), long double (16)
>> +- Floating-point arithmetic not permitted; can trace/printf values
>> +
>> +### Strings
>> +- `string` type represents ASCII strings
>> +- Special handling for tracing, comparison, functions
>> +
>> +### Pointers
>> +- Declared as `type *`
>> +- Example: `int *p;`
>> +- Safe: invalid deref ⇒ BADADDR fault, ERROR probe fires
>> +
>> +### Structs & Unions
>> +- ANSI C-like definition
>> +- Access via `.` and `->`
>> +
>> +### Arrays
>> +- Scalar arrays: fixed-length `[n]`
>> +- Associative arrays: `name[key]`
>> +- Multidimensional arrays supported
>> +
>> +### Enumerations
>> +- `enum colors { RED, GREEN, BLUE }`
>> +- Values assigned sequentially unless overridden
>> +
>> +### Typedef
>> +- `typedef existing-type alias;`
>> +
>> +### Inlines
>> +- Named constants: `inline type name = expression;`
>> +
>> +### Namespaces
>> +- Backtick (`) to access kernel/module types: `struct 
>> vmlinux\`task_struct`
>> +
>> +## CONSTANTS
>> +- Integer: decimal (123), octal (012), hex (0x123)
>> +- Floating: decimal with dot or exponent
>> +- Character: `'a'`, escape sequences (`\n`, `\t`, etc.)
>> +- String: `"hello"`, stored as null-terminated
>> +
>> +## OPERATORS
>> +
>> +### Arithmetic
>> +- `+` add, `-` sub, `*` mul, `/` div, `%` mod
>> +- Integer and pointer arithmetic only
>> +- Division by zero ⇒ ERROR probe
>> +
>> +### Relational
>> +- `<`, `<=`, `>`, `>=`, `==`, `!=`
>> +- Applied to int, ptr, string
>> +- Strings compare lexically
>> +
>> +### Logical
>> +- `&&` AND, `||` OR, `^^` XOR, `!` NOT
>> +- Short-circuit for `&&` and `||`
>> +
>> +### Bitwise
>> +- `~` NOT, `&` AND, `|` OR, `^` XOR, `<<` shift left, `>>` shift right
>> +
>> +### Assignment
>> +- `=`, `+=`, `-=`, `*=`, `/=`, `%=`, `&=`, `|=`, `^=`, `<<=`, `>>=`
>> +
>> +### Increment / Decrement
>> +- `++`, `--` (prefix/postfix)
>> +- Works on int and ptr types
>> +
>> +### Conditional
>> +- Ternary `?:` operator
>> +- Example: `x = i == 0 ? "zero" : "nonzero";`
>> +
>> +### Type Conversion
>> +- Implicit: usual arithmetic conversions (C-like)
>> +- Explicit cast: `(int)x`
>> +
>> +## OPERATOR PRECEDENCE (highest → lowest)
>> +- `() [] -> .`
>> +- Unary: `! ~ ++ -- + - * & (type) sizeof stringof offsetof xlate`
>> +- `* / %`
>> +- `+ -`
>> +- `<< >>`
>> +- `< <= > >=`
>> +- `== !=`
>> +- `&`
>> +- `^`
>> +- `|`
>> +- `&&`
>> +- `^^`
>> +- `||`
>> +- `?:`
>> +- Assignments: `= += -= *= /= %= &= ^= <<= >>=`
>> +- `,` (evaluate left→right, return rightmost)
>> +
>> +### Misc Operators
>> +- `sizeof(expr)` — size in bytes
>> +- `offsetof(type, member)` — offset of struct member
>> +- `stringof(expr)` — convert to string
>> +- `xlate(expr)` — translate type
>> +- Unary `&` — address of object
>> +- Unary `*` — dereference pointer
>> +
>> +DTRACE (ORACLE LINUX) — LLMS.TXT FORMAT
>> +PART 3: VARIABLES
>> +
>> +## VARIABLE CLASSES
>> +- Scalar variables: single data objects (int, ptr, string, struct, 
>> etc.)
>> +- Associative arrays: dynamic, keyed collections
>> +- Scalar arrays: fixed-length, indexed by int
>> +- Multidimensional arrays: ANSI C-compatible, rarely used
>> +- Variables created implicitly on first assignment
>> +
>> +## VARIABLE SCOPE
>> +- Global: `varname`
>> +- Thread-local: `self->varname`
>> +- Clause-local: `this->varname`
>> +- External (kernel symbols): `` `symbol ``
>> +
>> +### Table: Scope summary
>> +- Global: shared by all threads, not MP-safe
>> +- Thread-local: per-thread storage, MP-safe
>> +- Clause-local: per-probe-firing storage, MP-safe
>> +- External: access kernel variables, read-only
>> +
>> +## GLOBAL VARIABLES
>> +- Declared implicitly on assignment or explicitly outside clauses
>> +- Examples:
>> +```
>> +x = 123;            /* int */
>> +s = "hello";        /* string */
>> +a[123, 'a'] = 456;  /* associative array */
>> +```
>> +- Explicit declaration (no init value allowed):
>> +```
>> +int x;
>> +int arr[unsigned long long, char];
>> +```
>> +
>> +Initialization can be done in `BEGIN` clause.
>> +
>> +## THREAD-LOCAL VARIABLES
>> +- Scoped to each OS thread
>> +- Syntax: `self->name`
>> +- Examples:
>> +```
>> +syscall::read:entry
>> +{
>> +    self->read = 1;
>> +}
>> +```
>> +- Created implicitly; type = RHS of first assignment
>> +- Can also declare explicitly: `self int x;`
>> +
>> +## CLAUSE-LOCAL VARIABLES
>> +- Scoped to single probe firing, persist across clauses for same probe
>> +- Syntax: `this->name`
>> +- Example:
>> +```
>> +BEGIN
>> +{
>> +    this->secs = timestamp / 1000000000;
>> +}
>> +```
>> +- Explicit declaration: `this int x;`
>> +- Faster than associative arrays, use for temporary calculations
>> +
>> +## EXTERNAL VARIABLES
>> +- Access OS/kernel variables and symbols
>> +- Syntax: `` module`symbol ``
>> +- Examples:
>> +``
>> +trace(`max_pfn);
>> +trace(&`max_pfn);
>> +``
>> +- Names kept in separate namespace from D identifiers
>> +- Read-only for safety
>> +
>> +## ARRAYS
>> +### Associative Arrays
>> +- Dynamic, unlimited elements
>> +- Syntax: `name[key] = value;`
>> +- Key can be any type (int, string, tuple)
>> +- Delete element: assign 0 → `arr[key] = 0;`
>> +
>> +### Scalar Arrays
>> +- Fixed length, declared with `[n]`
>> +- Example: `int arr[5];`
>> +- Bounds checked at compile-time
>> +
>> +### Multidimensional Scalar Arrays
>> +- ANSI C-compatible: `int m[12][34];`
>> +- Access: `m[0][1]`
>> +
>> +Note: `arr[0][1]` (multidimensional) ≠ `arr[0,1]` (associative tuple 
>> key)
>> +
>> +DTRACE (ORACLE LINUX) — LLMS.TXT FORMAT
>> +PART 4: BUILT-IN VARIABLES AND MACRO VARIABLES
>> +
>> +## BUILT-IN VARIABLES
>> +Automatically available within all D programs.
>> +
>> +### Process & Thread
>> +- `pid` — process ID
>> +- `ppid` — parent process ID
>> +- `tid` — thread ID
>> +- `execname` — current process name
>> +
>> +### Probe Metadata
>> +- `probeprov` — provider
>> +- `probemod` — module
>> +- `probefunc` — function
>> +- `probename` — name
>> +
>> +### Time
>> +- `timestamp` — nanosecond, monotonic
>> +- `vtimestamp` — per-thread virtualized timestamp
>> +
>> +### Call Stack & Location
>> +- `caller` — kernel PC of calling function
>> +- `ucaller` — user-level PC of calling function
>> +
>> +### Syscall & Error
>> +- `errno` — last thread error number
>> +
>> +### Arguments
>> +- `arg0` … `arg9` — probe arguments (64-bit)
>> +- `args[]` — typed argument array
>> +
>> +## MACRO VARIABLES
>> +Expanded at compile time, not runtime.
>> +
>> +### Process & User Info
>> +- `$pid`, `$ppid` — current / parent process ID
>> +- `$uid`, `$gid` — user / group ID
>> +- `$target` — target process specified via `-p` option
>> +- `$1`, `$2`, … — script arguments
>> +
>> +### Notes
>> +- Macro variables allow parameterization of scripts
>> +- Expansion occurs at compile-time, before execution
>> +
>> +DTRACE (ORACLE LINUX) — LLMS.TXT FORMAT
>> +PART 5: FUNCTIONS
>> +
>> +## DATA RECORDING FUNCTIONS
>> +- `trace(expr)` — store expr in trace buffer
>> +- `printf(fmt, ...)` — formatted print
>> +- `printa(fmt, @aggr)` — print aggregation(s)
>> +- `exit(code)` — terminate tracing, run END
>> +
>> +## AGGREGATION FUNCTIONS
>> +- `count()` — number of probe firings
>> +- `sum(x)` — sum of values
>> +- `avg(x)` — average of values
>> +- `min(x)` — minimum
>> +- `max(x)` — maximum
>> +- `stddev(x)` — standard deviation
>> +- `quantize(x)` — power-of-two histogram
>> +- `lquantize(x, from, to, step)` — linear histogram
>> +- `llquantize(x, factor, low, high)` — log-linear histogram
>> +
>> +## SPECULATION FUNCTIONS
>> +- `speculation()` — allocate speculative buffer, return ID
>> +- `speculate(ID)` — record subsequent actions to speculation buffer
>> +- `commit(ID)` — commit speculative buffer to main trace
>> +- `discard(ID)` — discard speculative buffer
>> +
>> +## MEMORY COPYING FUNCTIONS
>> +- `copyin(addr, size)` — copy from user space
>> +- `copyinstr(addr[, size])` — copy NUL-terminated string from user
>> +- `copyinto(addr, size, dest)` — copy into DTrace memory
>> +- `copyout(src, addr, size)` — write to user space (destructive)
>> +- `copyoutstr(str, addr, size)` — write string to user (destructive)
>> +
>> +## STRING FUNCTIONS
>> +- `strlen(s)` — string length
>> +- `strjoin(a, b)` — concatenate
>> +- `substr(s, i[, len])` — substring
>> +- `index(str, sub[, start])` — first occurrence of sub
>> +- `rindex(str, sub[, start])` — last occurrence of sub
>> +- `strchr(str, c)` — first char occurrence
>> +- `strrchr(str, c)` — last char occurrence
>> +- `strstr(str, sub)` — substring search
>> +- `strtok(str, delim)` — tokenize
>> +
>> +## STACK & EXECUTION FUNCTIONS
>> +- `stack([nframes])` — kernel stack trace
>> +- `ustack([nframes, strsize])` — user stack trace
>> +- `system(cmd)` — execute shell command (destructive)
>> +- `raise(sig)` — send signal to process (destructive)
>> +
>> +DTRACE (ORACLE LINUX) — LLMS.TXT FORMAT
>> +PART 6: PROVIDERS & COMMON PROBES
>> +
>> +## PROVIDERS OVERVIEW
>> +Providers group related probes. Each probe is identified by 
>> `provider:module:function:name`.
>> +
>> +### Core Providers
>> +- `dtrace`
>> +  - BEGIN — fires at start of tracing
>> +  - END — fires at end of tracing
>> +  - ERROR — fires on D program error
>> +
>> +- `syscall`
>> +  - Entry/return of all system calls
>> +  - Examples: `syscall::open:entry`, `syscall::write:return`
>> +
>> +- `proc`
>> +  - Process lifecycle events
>> +  - create, exec, exit, signal
>> +
>> +- `sched`
>> +  - Scheduler events
>> +  - on-cpu, off-cpu, enqueue, dequeue, wakeup
>> +
>> +- `io`
>> +  - Device I/O events
>> +  - start, done
>> +
>> +- `profile`
>> +  - Time-based sampling
>> +  - `profile-N` — kernel stack sample every N Hz
>> +  - `tick-N` — fires every N seconds
>> +
>> +- `lockstat`
>> +  - Kernel lock contention statistics
>> +  - spin, adaptive, rw lock events
>> +
>> +- `fbt` (function boundary tracing)
>> +  - Kernel function entry/return probes
>> +  - Powerful but potentially unsafe (debug/dev only)
>> +
>> +- `pid`
>> +  - User-level function boundary tracing for a process
>> +
>> +- `usdt` (user-level statically defined tracing)
>> +  - Static tracepoints in user programs
>> +
>> +- `cpc`
>> +  - CPU performance counter probes
>> +
>> +## EXAMPLE USES
>> +
>> +### System Calls
>> +```
>> +syscall:::entry
>> +{
>> +    @calls[execname] = count();
>> +}
>> +```
>> +
>> +### Process Creation
>> +```
>> +proc:::exec-success
>> +{
>> +    printf("%s exec %s", execname, copyinstr(arg0));
>> +}
>> +```
>> +
>> +### Scheduler Events
>> +```
>> +sched:::on-cpu
>> +{
>> +    @oncpu[execname] = count();
>> +}
>> +```
>> +
>> +### Profile Sampling
>> +```
>> +profile-1000
>> +{
>> +    @[ustack()] = count();
>> +}
>> +```
>> +
>> +### I/O Operations
>> +```
>> +io:::start
>> +{
>> +    @io[execname] = count();
>> +}
>> +```
>> +
>> +DTRACE (ORACLE LINUX) — LLMS.TXT FORMAT
>> +PART 7: COMMON PATTERNS
>> +
>> +## COUNT SYSCALLS BY PROCESS
>> +```
>> +syscall:::entry
>> +/execname != ""/
>> +{
>> +    @syscalls[execname] = count();
>> +}
>> +END
>> +{
>> +    printa(@syscalls);
>> +}
>> +```
>> +
>> +## TIME A SPECIFIC SYSCALL
>> +```
>> +syscall::write:entry
>> +{
>> +    self->ts = timestamp;
>> +}
>> +syscall::write:return
>> +/self->ts/
>> +{
>> +    @delta[execname] = quantize(timestamp - self->ts);
>> +    self->ts = 0;
>> +}
>> +```
>> +
>> +## TRACE OPEN CALLS WITH ERRORS (SPECULATION)
>> +```
>> +syscall::open:entry
>> +{
>> +    self->spec = speculation();
>> +    speculate(self->spec);
>> +    printf("open: %s", copyinstr(arg0));
>> +}
>> +syscall::open:return/self->spec/
>> +{
>> +    speculate(self->spec);
>> +    trace(errno);
>> +}
>> +syscall::open:return/self->spec && errno != 0/
>> +{
>> +    commit(self->spec);
>> +    self->spec = 0;
>> +}
>> +syscall::open:return/self->spec && errno == 0/
>> +{
>> +    discard(self->spec);
>> +    self->spec = 0;
>> +}
>> +```
>> +
>> +## PROFILE USER STACKS (SAMPLING)
>> +```
>> +profile-1000
>> +{
>> +    @[ustack()] = count();
>> +}
>> +```
>> +
>> +## TRACK PROCESS EXECUTIONS
>> +```
>> +proc:::exec-success
>> +{
>> +    printf("%s -> %s", execname, copyinstr(arg0));
>> +}
>> +```
>> +
>> +## COUNT SCHEDULER ON-CPU EVENTS
>> +```
>> +sched:::on-cpu
>> +{
>> +    @oncpu[execname] = count();
>> +}
>> +```
>> +
>> +## I/O ACTIVITY BY PROCESS
>> +```
>> +io:::start
>> +{
>> +    @io[execname] = count();
>> +}
>> +```
>> +
>> +## TRACK ERRORS
>> +```
>> +ERROR
>> +{
>> +    printf("DTrace error: %s", probename);
>> +}
>> +```
>> +
>> +## TRACE ARGUMENTS OF FUNCTION
>> +```
>> +syscall::open:entry
>> +{
>> +    printf("open(%s)", copyinstr(arg0));
>> +}
>> +```
>> +
>> +## LIMIT TRACE TO TARGET PID
>> +```
>> +syscall:::entry
>> +/pid == $target/
>> +{
>> +    @syscalls[probefunc] = count();
>> +}
>> +```
>> -- 2.47.3
