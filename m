Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C969274669
	for <dtrace@lists.linux.dev>; Mon, 18 Aug 2025 20:45:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755549940; cv=fail; b=R2eqKWuraX9WVTfxYroV8ES5EJbtwBJx2CdYzs0pPwJd+F1hXCVzi/wY9EgPWOtPbiJdoh6YAkNb8cEQZSesUfSsDKpDDnbioDfxEH0JGVCSPyHJ2brrPZ0STB55YO/xZTZomK6tv6nycQWxjBVMZinC5kjpcFoRwzibEdyrr54=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755549940; c=relaxed/simple;
	bh=0EWhoxDIFlKCudTf3tdJC/NK0cawZNGhLcsq85UOUrg=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=GWY7IeNBIKVoMpOTKQPF67fK2g5Pf9NFilfZiES1dqa/SLW/3yxsFnsZJt9xjhDtJNrFqJje2i6mgDSozs1KqN7uG0h4ilGKcm07u8R51PPr+RG/SLrr8IjnH4asd90uSvtYFf+mkdM2xFtqyyA61dq0+2Pi86P1yJeGYc/xRCk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Peed4dz6; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=fu9MHqWR; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Peed4dz6";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="fu9MHqWR"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57IJgolp012808
	for <dtrace@lists.linux.dev>; Mon, 18 Aug 2025 20:45:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=ksYP2ED5+KA0/Jpi8uR4Xhq2N/971VEB3qU0jY2NJd4=; b=
	Peed4dz6byuNDmjjjIytR/nM1e5ITJCJ87/11fcFBmIObBjKRoT2oRU7kROc8fa0
	l4sCNnyfycoOb+gMrusfkrp9KlF9VaXb3I7uD5hEk0ZASyR1F8CdqmJxTrUje5d8
	grwwjzTfmcjPwyu4pwL/J1YWJuFeC5sXt0pNxezKtGmgP4Yov4dMoKSNLek44tRU
	Q68ZNfnnDJgAzraysESq9zZ23F6Y1Wc2+ldjbi+6xaBKcbSS0BP0L7kl9Pu17NDC
	pfASkwsxTp4BEEZLoMD7JspjOU8VmxvWYdJyE9UnBsI4uPHSjPku1he9o0IKCjI5
	+5m6TCWZgqeD/FR6+lVsNg==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 48jhkuuxff-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 18 Aug 2025 20:45:36 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 57IKiCUG010453
	for <dtrace@lists.linux.dev>; Mon, 18 Aug 2025 20:45:36 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11on2061.outbound.protection.outlook.com [40.107.223.61])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 48jge9sqyj-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 18 Aug 2025 20:45:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Opzr9ZPdeR+gIph4rFwSfOwa9GVbm3GqAeOeMBApMzN5XtHO78Sdj/DRWyJneMak0QLJRBfdCBpsDDoYCDM5uV2ShQlToyHWxde4QqFOxKQM8dO/q7tw0n9U8Ut+qherBqXW5hO/WnLKvUge5K2gxWrPYKYbUwEQ2jw/AbB+Le5bLWeq3BpmN0X0HjGQMlo9hShA7WN2c7DFhLTkpcl9zBftGvpsJ+NqVonUBVp8q68sBpMLUPCIjYxhO/8yo++VzkU76IR5tYFA1u+xwhISjRE/RVG6cbwdgD1WyZzqxcg/JTXo5P8VOzwsG0azfl02HvfCKgZ3NXyJn+ZW39Do6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ksYP2ED5+KA0/Jpi8uR4Xhq2N/971VEB3qU0jY2NJd4=;
 b=xnOVyynMj94ianeJpCxuqHA297vY5kAdhZ6KSaTATO+kACBNAAtG2jTFehBcQM/JnoVFFYeaN49+MuOvQLS0DbHOVUUIzxET1UMZDG0IPZrOIy050GG2OOrIGEnRzsLOsMgq0TwCj3Hpd4biLDMtjCjpsMDADm9E9SVenNYqHDWel+E32X3tdD5+B9S8rj+Y//UeNhwfAC8WPS2kKvtnFYrcffjJZaUKD2zzN7BjA8L8KglbDMYmJJlsRVpVrnEDsUvyaHFdhVLx4NzKAbqIibD9ow+bN0juBeSjywlyOU6lNLOAKL+XRs50y7YobfvNLhtAHUij04+B7j83jwtbAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ksYP2ED5+KA0/Jpi8uR4Xhq2N/971VEB3qU0jY2NJd4=;
 b=fu9MHqWRL+V4zSdN5RfL/pxUaiNel/q9kA5LeSQvCMz8ZTtO9uYzBTs1L7+ccmMTvQz/82EUHPJejAqEjpSxLz6ZUoPLPJxZXY1HnOTP2uLKcmbLnrzasGG/lqzVDH7iQ0jU2YPKwWaKsvwqlFwr1XxQoeOv8T3ZWXtSmG24EpQ=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by DS7PR10MB5197.namprd10.prod.outlook.com (2603:10b6:5:3ab::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.24; Mon, 18 Aug
 2025 20:45:32 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%6]) with mapi id 15.20.9031.023; Mon, 18 Aug 2025
 20:45:32 +0000
Message-ID: <0a298885-a398-8de6-8001-03ca7fc2ecbb@oracle.com>
Date: Mon, 18 Aug 2025 16:45:31 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [DTrace-devel] [PATCH 2/2] Refactor the versioning handling
 system (consolidate data)
Content-Language: en-US
To: Kris Van Hees <kris.van.hees@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
References: <SJ0PR10MB5672EB3042EB4FF38F34FFD6C237A@SJ0PR10MB5672.namprd10.prod.outlook.com>
From: Eugene Loh <eugene.loh@oracle.com>
In-Reply-To: <SJ0PR10MB5672EB3042EB4FF38F34FFD6C237A@SJ0PR10MB5672.namprd10.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR13CA0214.namprd13.prod.outlook.com
 (2603:10b6:a03:2c1::9) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|DS7PR10MB5197:EE_
X-MS-Office365-Filtering-Correlation-Id: 9cc48321-af90-4d42-3d1d-08ddde982cdc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?OUVwVkI0RnhiODNvZXo2R3ZhL2hwTjJDYkxYbjRidkFMOWowbzRtN1NCWXBr?=
 =?utf-8?B?bUNRKzFWTnBaQnZJUmM0WnV2RFVKUnNId2xKUlpkaVpKRlBDMEgyNjRkOHFu?=
 =?utf-8?B?UForaU1LUmJlZUk4aElpdWF4Yy83OGRuVXVWUytiYWkwek5Xb2YrZlVuWlMx?=
 =?utf-8?B?M2tyaUpIN05XbjVadGlLbm5hNytMbU9CaHhwUlRramsyVW5OWEc2OENEL1BT?=
 =?utf-8?B?dnVKc3MyeWNUWStzUG9YbS9QUWdUVGdyajZ3WXRwMHYybFVndFRYbHZpVVlO?=
 =?utf-8?B?QjNab1lWVXFlWFlWbnpzZ0xEZGI2VnNOZ0hWQ0R3THZGT3FXSHVuWVdQK1JM?=
 =?utf-8?B?cTNNK2lxelN1RUxJRnpJeUVuQzkvV09yOFdjTUY0ZjNKZ1RwR1dLY2hteEV4?=
 =?utf-8?B?ZGxBRWhIUEtnZFdTcjNqMDRUanVxSWxiNUozajFOUU1oZHpNQU1OdlA5cEdk?=
 =?utf-8?B?eDBsYW9ia1hhZVl1dmRkOXRoZnNJN2MwZzlia2dZMnNwaWZVSEVZQ3hGdGtS?=
 =?utf-8?B?N3BBMXR5WUhoY1lIU2hkaTJhREI0NExaMllxUkF2bGM4Vm9NZHgwSGRIb0Iv?=
 =?utf-8?B?M1oxRFFGUW05b3JLM2d2MC84Snp5QTlCVXltNE5LV2tvRUdpNjM5Q1doK240?=
 =?utf-8?B?WEloMlZpM2NFbEJVMTR5NW43Uk9pR0JtekhOMk05cUZxZndtTGN1blg0R1gr?=
 =?utf-8?B?YndLWC8xekFYQnpFUzZQbTcxcHZSM3FPcXVSWE5BL29MYzU4N3N6bXh5ZmJp?=
 =?utf-8?B?S1V4L0dCbzcrM2VOTFYyME1wdDdvdmp0aHdDbWk5UlRhTW5FN0hkWGVGdnhS?=
 =?utf-8?B?MWhXNFY5NHp2Yy9ZV29Wb054NE1MOFo3bzlyVy9aUFRjOE1YUmQvOVBtck1s?=
 =?utf-8?B?eFMxSkJjaVdZQ3N6dDFrT3d2V3grMGRIWWQ0QVBETTZEOUJFTGhJZDR3VjE0?=
 =?utf-8?B?cEdFOVVGK0poUWFvSnZ6TzBob0dqbnZrRW4rR1RVWjlLcHZrUUR5MkJmZGgw?=
 =?utf-8?B?bzVhRGc3OTRWM1dkVTV4dFFySzlEb3hRenBwQmF0RU82cTdSRmZrSHZzd3Ft?=
 =?utf-8?B?QjRWR3pmSTBqdTRTbGRNNW1PQ2xhSGNHcHRGQWpaOFR0SnFDUzI4cUZZR0pK?=
 =?utf-8?B?UytycXB2RzJyYi9KcG5lMFVhaDFydFhPZGtmdXMzY2NWY29NbXBxSXhSTWZz?=
 =?utf-8?B?aTIzYTBVR0hmRzAxTVJ2Y1ZjZW1hK2RpaGl3clpsWGxHVGVtT21ac0JpVExa?=
 =?utf-8?B?QTlJRzBUZG9RWkpydXJJWUtPNU9JenJPa0FSeVUzcFl4am1yenFCQm5seUEr?=
 =?utf-8?B?cFZHK2dNMzdmU3pVMHlpOHhUdndJVTJYNk50QWhHQkt6cG5ycHBzeEkrWjJO?=
 =?utf-8?B?U0FmWHphUSs2VmhEdHZSanBtZWlDMEN6QkxxVHRzcm10M2NiWHNkRjUzamNv?=
 =?utf-8?B?eTVTUk1HeldPQTVHdElxR0QxUUJxanNwOXZkeld4K1NBR2pKbU51UVdpU3VH?=
 =?utf-8?B?bG1wS0pxZHczVzhEcktZMHczS1lHdkRzWTdrMlBWSkJWUk9kNTN3ZUtUOHFY?=
 =?utf-8?B?aE1YRC9WUENrVjZ6MEdHaERmT2l5UmVDZ0xCZ2VZQWV1VFJGU2ttdlZTNHZR?=
 =?utf-8?B?NWpXSzNoUDhQVTMxbHF5QUs4UWkwaVZVMXVjMk81YXJSSGY1aWp3NWc2K1RS?=
 =?utf-8?B?RzdtQUtTMUZRSnZiYjFwWjBxYlZvL1lQdUYzQmM1djhoZ013OWNOWkcwaGpX?=
 =?utf-8?B?T0hPbHBhNzhib2xZQTdZZU9TckJxcEdsNjd6SjAyVEVXamhPbVdmOFlhRXdy?=
 =?utf-8?B?OWxZdER4MkYvY28xcElsVmRMb0gxS291K3pIVFZCSExsbVB3amNSeWRQSXVr?=
 =?utf-8?Q?/wA0HxfNqVTm7?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OVpRbm9iYjIvbkZ3MDdQMDdvK0NHMWhPQkFMVFFSS3BlYVlzZVh1bU42MURi?=
 =?utf-8?B?bXFBYUNpV09CWUVsM0xBTU9NSWtnOW5mNll4OURSNXJoL1BIMG1JK3NOUU1E?=
 =?utf-8?B?RkJ4d1NJb3l6eEFvblVpRG4vOVJpb0txMmhpUmlZbXlMVW9LUGRMN25YWXNr?=
 =?utf-8?B?U2k2RlpsYzQvWURIOFpscVR3NDVEUEx0ZTQ1c0I2WXQyRjFoL1BoeDl4WUJs?=
 =?utf-8?B?L1AraStsWWNBeFV5SEhkZnViSjVrWHFoVGdJZXJTWExhYnJPcUlxa09oUUVh?=
 =?utf-8?B?a2J4bkh5bm14WUFFQnRTWDdzNmUzd29IVXBMNllUd2kzVUYraFVwM0xHVHMy?=
 =?utf-8?B?Uk00NVhjaklXTmhVWm1kVUt5OStWdDdxelFaRkszZVZFQ3MwSmRKbDM4MDZy?=
 =?utf-8?B?K0dEL053aExoUVlNYWpkQkpYak4rMDFlcXVWVHZjZld3TFIrRzczL2lDV2Jq?=
 =?utf-8?B?Rmp3REJTais5NXBKdStRNVJKM0l5bXVxZHAxbFQydnNEam9xRmUxbGxVVWlF?=
 =?utf-8?B?NGNabVVTTnRDbU9xQ2lEN1RKdnBqRDBYSjdWK1pxcy9rLzBib3JiSlFyb3I5?=
 =?utf-8?B?QWlRY0tQSzRhSkc1SUcwa2h5N0hVNyt2OVg4WHFHc1BadXN0d0ZseE9Od0d1?=
 =?utf-8?B?YVFsYW84U3F6eWdUQVR2eGp0aW5XS2d1R1ZNemJaemJBSi9RY1ZXcEpSeHpv?=
 =?utf-8?B?dFJRajNJSGJ3ZWJseEgzSEFGQUF1RFlyM1lIQW1IcVgyRVNUZk16YTl3TDJr?=
 =?utf-8?B?RFZoY0JvV2dvczlLOUVKSEhlM3RFTis3T0x2SkxJVENabjYzUEhiZHB2WW9i?=
 =?utf-8?B?TFAvTWtVN3I4UmEvY2h3dlBDbDRycjZpdExKM3FhcmFpbGtINWZDb2VQUTU3?=
 =?utf-8?B?b21lekpaYmhlUDFyM29TTmd1TFBmSzM1RnNhOVA4S1BXTUFsMGxuWjZoRndn?=
 =?utf-8?B?UHpRUnREV25kSTVkYWwrdHRveGpjamM0cmc3NU52cHU4SUpRVmFyeUhmbFIw?=
 =?utf-8?B?WE0zOTJ2b1c0R2lLaUJLaGZ0Zi9zWnRjcTEzOWkzN0ZTRm0waW5Dc1pKaERO?=
 =?utf-8?B?c2owZlJHdGJSV1pRNGwwN1ZYSE0yTThjcEEyRXpvVWlFRnBDOHdZaEhGb2Mv?=
 =?utf-8?B?WFk4YUZ2a3RyRkRmQXhXTGVKUTg4ODR2UlFJaFMrMVZyZmxIQmFsRVA4VkEr?=
 =?utf-8?B?TmVmaDNwcytBbWpaYUYwenhFWmNMcHBlaFZ2d05UbzNUNVZGTzdoTUc5UXNS?=
 =?utf-8?B?NUwvR0dySyt5TVd3QmFrNmlicGN0ZS9vZ1Zsc3loQUs0emR1Z2pWNXZMWWE4?=
 =?utf-8?B?RE1ITWcxWlZjeCszZVJQcHpVVUJNZmVmY0orUkhtdWZEM0ljQnIvaGNXRDF6?=
 =?utf-8?B?VnFHZVFORllOREprcG9jbXp5b3RBZEpXWTlRKzFoK3dtQXZHQThORE1Md0l5?=
 =?utf-8?B?SU1WVW1yZFJRenZSS1F4MnljSTZDb1dnU0Z6UyswMnRReG9Db0dXdERab3hX?=
 =?utf-8?B?dytXclBRc1RLM2FZVDVJN3k3RTZ4Lzc3c0ZVMHZGRUQ1S0N0VDhtWFdXOXVM?=
 =?utf-8?B?cmd5aUVnenVkNUZGRkpJTVN1aWZIa0lkbERmb0ovOWd4aUxFMzM2dzJaWXhw?=
 =?utf-8?B?cXdnSzN0SXA3WUF6TWxKbXRHc3pBNmRZSHQ0WUh2WllacmxYbEV2MEpYcG5G?=
 =?utf-8?B?NUdFcWhPZDVyK2MwNU1MbFFzQjVtZ0IyNWk2bm8wSE5lR2svcTBGdVZmaHNR?=
 =?utf-8?B?L2J4UDVraWZjTzhWOHp6eUduOWVpaE9FMDBCUHhNQlJJMXBKSGFYeHBKR25G?=
 =?utf-8?B?ZWFwcE1LS0V3MGVONnI5UUlTMExNUmRtNk01eFd4M1FKU0l0dzZoanlrZ1JD?=
 =?utf-8?B?Ui9WUW4vdC9hRHBidnpieWdNS0tQakFFMGI4cW4vTVhIUmhQZC9YbnJGNjdn?=
 =?utf-8?B?MXcraTVjKzdKOXVYYmE0aGdWYkt6cGhaL2laUndsaE90UVdIckV2REUwZnFq?=
 =?utf-8?B?QnRiWmpYRVZjRUR6RjRvTWt4SUdzRzNnK2hZdXhabklZcWpUT09rRWxXcFZX?=
 =?utf-8?B?Q0wyMFloRGJFMGVNQVFHR3NCYnBldE1YcGphUDU2MXJ0SDZlZVBhblRwWU1M?=
 =?utf-8?Q?dF9YqgAZvf+eLat+UWfZU3tPD?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	CcWiQtAu4Ya5hqGNL6/wsqIjiSdDT8lGqnTYjORWgOpwLIeeWx3knEUN1izOtuLkYo6YP/8pJv0zknywlLiaAincf4LrSNHiEQ5rTkBn/WCBLO0TYJbJj5aPXQ60wMqF182TqIiKKQ/yhjLPOnUNZZZgMHnJYsXPIDU66N0GWGGj7xRqbMcTBA3fJaKjbMZMKoNmyUvPDUu9h0eWtDS8Rvu+b9YYLRRSx/0jha+C2NPYiN4qoS1qrUmr4IJR383PnvkS1s4lNpjC2AENYQIAR4T//S7XLxU46XJmHMW10dwQkSahCpDH7P1g/8EorFgdbwDbWXcbP9Auq7eSCs79fMV/e4ShtEES2aIJZ8O9nFKze8yC2TyPmg0CZ7AVCnonpHCPHrw9uB1sug18jVxbeo5TniUp6H0VT0wnxtPuEq1fzD1byhWw631vgy6gxABOuaUiz4Jg7cdbsI0dia93UOy0nsrFp1CQfcMmwNdg/wJPkp9kqe6lAlOm2wEmaI1IbGoeezFY9Zg+/nCrcaQd2uHCl8B5nZVzMR5ydDxyL2VLKTygYrP/OrwIqLNCFPnTLsV+oVm5q2tnz16oP2yUSEiwnd/ASWrl2VyPRzqfQOc=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9cc48321-af90-4d42-3d1d-08ddde982cdc
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2025 20:45:32.6821
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TkFR3XXsR5BPEUasEdYONQMch8HFnmQxIBwLsadjtxd+rI2uu+GV1XKZccgfowlbVZZ238S1e1SbVOFutDYw3A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB5197
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-18_06,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 malwarescore=0
 mlxlogscore=999 adultscore=0 phishscore=0 bulkscore=0 mlxscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2507300000 definitions=main-2508180194
X-Proofpoint-GUID: 7qeNG75vMwUmCYEE_cJNYzR5hCoFOQf0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE4MDE5MyBTYWx0ZWRfX13j2FU9Xtota
 nkUv+57d1kMA55z4WVBqP4hbVyitHxRh5QhUX69tY5dNnBybamKNaqm3uxzLX5izALZzcuEnUpS
 10s1/9XiIRezadT23ZCik3HrPi0vkHDPGEeRK6AA4KEuTdl1vuTHdo6Lb76E+7G/dS6zItLY255
 fu1FW1AD7abb2RVjTEf0jq2WhyKg+os1pXjECg0vsIlfj2eprPSSbrLPJ7jEoI/it6wK7g7xzFm
 dqNGOAwsX4SkmctdIfnCXk6GOLqZGo5SsMsdanbWtN3//j0j/BdQa3PUwstL8ZJOWZ9NkRKaqT3
 +qjpJahFe94vxGhhLLFJIwFbQp26wlaskm7vdIJWqK29EY+P5VqWD6hSePEKXOz5/VPbTtwmj2b
 KQJVNNAfRIvzw093rWiGGgjThcU29iLwDJoGiCpOMrNn645hQmzwBaQli5c85PER6RtRblAQ
X-Proofpoint-ORIG-GUID: 7qeNG75vMwUmCYEE_cJNYzR5hCoFOQf0
X-Authority-Analysis: v=2.4 cv=HKzDFptv c=1 sm=1 tr=0 ts=68a390f0 b=1 cx=c_pps
 a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=-vvm-JW3B-9g4z6qclwA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 cc=ntf awl=host:12070

With this patch, I get test regressions:

    test/unittest/options/tst.version.sh
         Diff against expected:
         -version is 2.0
         +version is 2.0.3

     test/unittest/dtrace-util/tst.APIVersion.d
         Diff against expected:
         -dtrace: Oracle D 2.0
         +dtrace: Oracle D 2.0.3

I did not run the test suite, so I do not know if other tests also fail.

Should something be done in libdtrace/Build with
     libdtrace_VERSION := 2.0.0

Should something be done in dtrace.spec with
     Version:      2.0.3

On 8/15/25 23:46, Kris Van Hees via DTrace-devel wrote:
> Rather than having multiple data items that need to be updated whenever
> a new version is released, a single entry in versions.list will now be
> all that is needed.  The mkvers script generated the necessary defines,

s/generated/generates/

> and is also used to return the most recent release version to be used
> in GNUmakefile.
>
> Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
> ---
>   GNUmakefile             |  2 +-
>   libdtrace/.gitignore    |  1 +
>   libdtrace/Build         |  7 +++-
>   libdtrace/dt_version.h  | 83 ++---------------------------------------
>   libdtrace/mkvers        | 68 +++++++++++++++++++++++++++++++++
>   libdtrace/versions.list | 67 +++++++++++++++++++++++++++++++++
>   6 files changed, 147 insertions(+), 81 deletions(-)
>   create mode 100755 libdtrace/mkvers
>   create mode 100644 libdtrace/versions.list
>
> diff --git a/GNUmakefile b/GNUmakefile
> index 7ad857f88..03687bf3f 100644
> --- a/GNUmakefile
> +++ b/GNUmakefile
> @@ -14,7 +14,7 @@
>   SHELL = /bin/bash
>   
>   PROJECT := dtrace
> -VERSION := 2.0.3
> +VERSION := $(shell ./libdtrace/mkvers -vrelease=1 libdtrace/versions.list)

I think to most readers "release=1" means, well, release 1.  How about 
renaming the variable.  Alternatively, just say "-vrelease=t".

>   # Verify supported hardware.
>   
> diff --git a/libdtrace/.gitignore b/libdtrace/.gitignore
> index cf124ba1d..ebf6ac9b2 100644
> --- a/libdtrace/.gitignore
> +++ b/libdtrace/.gitignore
> @@ -3,6 +3,7 @@ dt_errtags.c
>   dt_grammar.[ch]
>   dt_lex.c
>   dt_names.c
> +dt_versions_defs.h

Great.  But dt_versions_defs.h should also not survive "make clean".  So 
that also should be added (in the appropriate place).

>   errno.d
>   regs.d
>   signal.d
> diff --git a/libdtrace/Build b/libdtrace/Build
> index 164023bbc..a3c3a2e1a 100644
> --- a/libdtrace/Build
> +++ b/libdtrace/Build
> @@ -73,7 +73,8 @@ libdtrace-build_SOURCES = dt_aggregate.c \
>   			  dt_work.c \
>   			  dt_xlator.c
>   
> -libdtrace-build_SRCDEPS := dt_grammar.h $(objdir)/dt_git_version.h
> +libdtrace-build_SRCDEPS := dt_grammar.h dt_versions_defs.h \
> +			   $(objdir)/dt_git_version.h
>   
>   SHLIBS += libdtrace
>   
> @@ -129,6 +130,10 @@ SHORTKERNELS := $(foreach kernel,$(KERNELS),$(shell printf %s $(kernel) | sed -e
>   $(libdtrace-build_DIR)dt_errtags.c: $(libdtrace-build_DIR)dt_errtags.h $(libdtrace-build_DIR)/mkerrtags.sh
>   	sh $(libdtrace-build_DIR)mkerrtags.sh < $(libdtrace-build_DIR)dt_errtags.h | sed -e 's/\\n/\n/g' > $@
>   
> +$(libdtrace-build_DIR)dt_versions_defs.h: $(libdtrace-build_DIR)versions.list
> +	$(call describe-target,MKVERS,$@)
> +	$(libdtrace-build_DIR)mkvers $< > $@
> +
>   $(libdtrace-build_DIR)%.h $(libdtrace-build_DIR)%.c: $(libdtrace-build_DIR)%.y
>   	$(call describe-target,YACC,$(libdtrace-build_DIR)$*.c)
>   	bison -o $(libdtrace-build_DIR)$*.c -d $(libdtrace-build_DIR)$*.y
> diff --git a/libdtrace/dt_version.h b/libdtrace/dt_version.h
> index 8dd252b08..5c1528266 100644
> --- a/libdtrace/dt_version.h
> +++ b/libdtrace/dt_version.h
> @@ -13,83 +13,7 @@ extern "C" {
>   #endif
>   
>   #include <dt_ident.h>
> -
> -/*
> - * Versioning definitions
> - *
> - * These #defines are used in identifier tables to fill in the version fields
> - * associated with each identifier.  The DT_VERS_* macros declare the encoded
> - * integer values of all versions used so far.  DT_VERS_LATEST must correspond
> - * to the latest version value among all versions exported by the D compiler.
> - * DT_VERS_STRING must be an ASCII string that contains DT_VERS_LATEST within
> - * it along with any suffixes (e.g. Beta).
> - *

The comment about "any suffixes (e.g. Beta)" disappears here.  More 
significantly, the ability to have such suffixes seems to disappear.  Is 
that a notable loss?  The loss of capability should at least be noted.

> - * Refer to the Solaris Dynamic Tracing Guide Versioning chapter for an
> - * explanation of these DTrace features and their values.
> - *
> - * When adding a new version:
> - *  - Add a new DT_VERS_* macro
> - *  - Add the new DT_VERS_* macro at the end of the DTRACE_VERSIONS macro
> - *  - Set DT_VERS_LATEST to the new DT_VERS_*
> - *  - Update DT_VERS_STRING to reflect the new version
> - *
> - * NOTE: Although the DTrace versioning scheme supports the labeling and
> - *       introduction of incompatible changes (e.g. dropping an interface in a
> - *       major release), the libdtrace code does not currently support this.
> - *       All versions are assumed to strictly inherit from one another.  If
> - *       we ever need to provide divergent interfaces, this will need work.
> - *
> - * The version number should be increased for every customer visible release
> - * of DTrace.
> - *  - The major number should be incremented when a fundamental change has been
> - *    made that would affect all consumers, and would reflect sweeping changes
> - *    to DTrace or the D language.
> - *  - The minor number should be incremented when a change is introduced that
> - *    could break scripts that had previously worked; for example, adding a new
> - *    built-in variable could break a script which was already using that
> - *    identifier.
> - *  - The micro number should be changed when introducing functionality changes
> - *    or major bug fixes that do not affect backward compatibility -- this is
> - *    merely to make capabilities easily determined from the version number.
> - *    Minor bugs do not require any modification to the version number.
> - */
> -#define	DT_VERS_1_0	DT_VERSION_NUMBER(1, 0, 0)
> -#define	DT_VERS_1_1	DT_VERSION_NUMBER(1, 1, 0)
> -#define	DT_VERS_1_2	DT_VERSION_NUMBER(1, 2, 0)
> -#define	DT_VERS_1_2_1	DT_VERSION_NUMBER(1, 2, 1)
> -#define	DT_VERS_1_2_2	DT_VERSION_NUMBER(1, 2, 2)
> -#define	DT_VERS_1_3	DT_VERSION_NUMBER(1, 3, 0)
> -#define	DT_VERS_1_4	DT_VERSION_NUMBER(1, 4, 0)
> -#define	DT_VERS_1_4_1	DT_VERSION_NUMBER(1, 4, 1)
> -#define	DT_VERS_1_5	DT_VERSION_NUMBER(1, 5, 0)
> -#define	DT_VERS_1_6	DT_VERSION_NUMBER(1, 6, 0)
> -#define	DT_VERS_1_6_1	DT_VERSION_NUMBER(1, 6, 1)
> -#define	DT_VERS_1_6_2	DT_VERSION_NUMBER(1, 6, 2)
> -#define	DT_VERS_1_6_3	DT_VERSION_NUMBER(1, 6, 3)
> -#define	DT_VERS_1_6_4	DT_VERSION_NUMBER(1, 6, 4)
> -#define	DT_VERS_2_0	DT_VERSION_NUMBER(2, 0, 0)
> -#define	DT_VERS_2_0_1	DT_VERSION_NUMBER(2, 0, 1)
> -
> -#define DTRACE_VERSIONS	{ \
> -	DT_VERS_1_0,	/* D API 1.0.0 (PSARC 2001/466) Solaris 10 FCS */ \
> -	DT_VERS_1_1,	/* D API 1.1.0 Solaris Express 6/05 */ \
> -	DT_VERS_1_2,	/* D API 1.2.0 Solaris 10 Update 1 */ \
> -	DT_VERS_1_2_1,	/* D API 1.2.1 Solaris Express 4/06 */ \
> -	DT_VERS_1_2_2,	/* D API 1.2.2 Solaris Express 6/06 */ \
> -	DT_VERS_1_3,	/* D API 1.3 Solaris Express 10/06 */ \
> -	DT_VERS_1_4,	/* D API 1.4 Solaris Express 2/07 */ \
> -	DT_VERS_1_4_1,	/* D API 1.4.1 Solaris Express 4/07 */ \
> -	DT_VERS_1_5,	/* D API 1.5 Solaris Express 7/07 */ \
> -	DT_VERS_1_6,	/* D API 1.6 */ \
> -	DT_VERS_1_6_1,	/* D API 1.6.1 */ \
> -	DT_VERS_1_6_2,	/* D API 1.6.2 */ \
> -	DT_VERS_1_6_3,	/* D API 1.6.3 */ \
> -	DT_VERS_1_6_4,	/* D API 1.6.4 */ \
> -	DT_VERS_2_0,	/* D API 2.0 */ \
> -}
> -
> -#define	DT_VERS_LATEST	DT_VERS_2_0_1
> -#define	DT_VERS_STRING	"Oracle D 2.0"
> +#include "dt_versions_defs.h"
>   
>   /*
>    * Interfaces for parsing and handling DTrace version strings.  Version binding
> @@ -112,8 +36,9 @@ extern "C" {
>   
>   typedef uint32_t dt_version_t;
>   
> -extern const dt_version_t _dtrace_versions[];
> -extern const char *const _dtrace_version;
> +extern const dt_version_t	_dtrace_versions[];
> +extern const char *const	_dtrace_version;
> +extern const dt_version_t	_dtrace_vers_latest;

What is _dtrace_vers_latest for?

>   extern char *dt_version_num2str(dt_version_t, char *, size_t);
>   extern int dt_version_str2num(const char *, dt_version_t *);
> diff --git a/libdtrace/mkvers b/libdtrace/mkvers
> new file mode 100755
> index 000000000..c45617773
> --- /dev/null
> +++ b/libdtrace/mkvers
> @@ -0,0 +1,68 @@
> +#!/usr/bin/gawk -f
> +#
> +# Oracle Linux DTrace.
> +# Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
> +# Licensed under the Universal Permissive License v 1.0 as shown at
> +# http://oss.oracle.com/licenses/upl.
> +#
> +
> +/^\s*#/ { next; }
> +NF == 0 { next; }
> +
> +# 1.2.1	D API 1.2.1 Solaris Express 4/06

Solaris Express?  Is this a vestigial comment?

> +{
> +	if (match($1, /^[1-9][0-9]*(\.[0-9]*){1,2}$/) == 0) {
> +		print "E: Invalid version string: " $1 >"/dev/stderr";
> +		exit 1
> +	}
> +
> +	n = split($1, arr, /\./);
> +	if (n == 2)
> +		arr[3] = 0;
> +
> +	code = arr[1] * 0x1000000 + arr[2] * 0x1000 + arr[3];
> +	versions[code] = arr[1] " " arr[2] " " arr[3];
> +	next;
> +}
> +
> +END {
> +	n = asorti(versions, idx);
> +
> +	if (release) {
> +		$0 = versions[idx[n]];
> +		if ($3 == 0)
> +			printf "%s.%s", $1, $2;
> +		else
> +			printf "%s.%s.%s", $1, $2, $3;
> +
> +		exit(0);
> +	}
> +
> +	for (i = 1; i <= n; i++) {
> +		$0 = versions[idx[i]];
> +		if ($3 == 0)
> +			printf "#define DT_VERS_%d_%d\tDT_VERSION_NUMBER(%d, %d, 0)\n",\
> +			       $1, $2, $1, $2;
> +		else
> +			printf "#define DT_VERS_%d_%d_%d\tDT_VERSION_NUMBER(%d, %d, %d)\n",\
> +			       $1, $2, $3, $1, $2, $3;
> +	}
> +
> +	print "\n#define DTRACE_VERSIONS { \\";
> +	for (i = 1; i <= n; i++) {
> +		$0 = versions[idx[i]];
> +		if ($3 == 0)
> +			printf "\t\tDT_VERS_%d_%d, \\\n", $1, $2, $1, $2;
> +		else
> +			printf "\t\tDT_VERS_%d_%d_%d, \\\n", $1, $2, $3, $1, $2, $3;
> +	}
> +	print "}";
> +
> +	if ($3 == 0) {
> +		printf "\n#define DT_VERS_LATEST\tDT_VERS_%d_%d\n", $1, $2;
> +		printf "#define DT_VERS_STRING\t\"Oracle D %d.%d\"\n", $1, $2;
> +	} else {
> +		printf "\n#define DT_VERS_LATEST\tDT_VERS_%d_%d_%d\n", $1, $2, $3;
> +		printf "#define DT_VERS_STRING\t\"Oracle D %d.%d.%d\"\n", $1, $2, $3;
> +	}
> +}
> diff --git a/libdtrace/versions.list b/libdtrace/versions.list
> new file mode 100644
> index 000000000..8986d2007
> --- /dev/null
> +++ b/libdtrace/versions.list
> @@ -0,0 +1,67 @@
> +#
> +# Oracle Linux DTrace.
> +# Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
> +# Licensed under the Universal Permissive License v 1.0 as shown at
> +# http://oss.oracle.com/licenses/upl.
> +#
> +
> +#
> +# Version definitions
> +#
> +# These definitions are used to generate dt_versions_defs.h.
> +#
> +# The generated file contains:
> +#  - DT_VERS_* defines that are used in identifier tables to fill in the
> +#    version fields associated with each identifier.
> +#
> +#  - DTRACE_VERSIONS which is used in dt_versions.c to populate the array of
> +#    valid DTrace versions
> +#
> +#  - DT_VERS_LATEST which has the value of the most recent DT_VERS_* define
> +#
> +#  - DT_VERS_STRING which provides a string representation of the most recent
> +#    DTrace version
> +#
> +# Refer to the Solaris Dynamic Tracing Guide Versioning chapter for an
> +# explanation of these DTrace features and their values.
> +#
> +# NOTE: Although the DTrace versioning scheme supports the labeling and
> +#       introduction of incompatible changes (e.g. dropping an interface in a
> +#       major release), the libdtrace code does not currently support this.
> +#       All versions are assumed to strictly inherit from one another.  If
> +#       we ever need to provide divergent interfaces, this will need work.
> +#
> +# The version number should be increased for every customer visible release
> +# of DTrace.
> +#  - The major number should be incremented when a fundamental change has been
> +#    made that would affect all consumers, and would reflect sweeping changes
> +#    to DTrace or the D language.
> +#  - The minor number should be incremented when a change is introduced that
> +#    could break scripts that had previously worked; for example, adding a new
> +#    built-in variable could break a script which was already using that
> +#    identifier.
> +#  - The micro number should be changed when introducing functionality changes
> +#    or major bug fixes that do not affect backward compatibility -- this is
> +#    merely to make capabilities easily determined from the version number.
> +#    Minor bugs do not require any modification to the version number.
> +#
> +
> +# Ver	Description
> +1.0	D API 1.0.0 (PSARC 2001/466) Solaris 10 FCS
> +1.1	D API 1.1.0 Solaris Express 6/05
> +1.2	D API 1.2.0 Solaris 10 Update 1
> +1.2.1	D API 1.2.1 Solaris Express 4/06
> +1.2.2	D API 1.2.2 Solaris Express 6/06
> +1.3	D API 1.3 Solaris Express 10/06
> +1.4	D API 1.4 Solaris Express 2/07
> +1.4.1	D API 1.4.1 Solaris Express 4/07
> +1.5	D API 1.5 Solaris Express 7/07
> +1.6	D API 1.6
> +1.6.1	D API 1.6.1
> +1.6.2	D API 1.6.2
> +1.6.3	D API 1.6.3
> +1.6.4	D API 1.6.4
> +2.0	D API 2.0 Linux (BPF)
> +2.0.1	D API 2.0.1 Linux (BPF)
> +2.0.2	D API 2.0.2 Linux (BPF)
> +2.0.3	D API 2.0.3 Linux (BPF)
