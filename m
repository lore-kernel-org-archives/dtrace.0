Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A97591DF27D
	for <dtrace@lists.linux.dev>; Thu, 12 Feb 2026 18:50:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770922205; cv=fail; b=iOWBSMQkSBY76zw4UVvv4RXOItYVWkWhEcnmjqib4XpnawW4Oe5Ufvoqxumeq95S1Fm32DhvUmrYtxHeubSP49apv6/l9b/ish2OYXKVZMnQjjjV7j4IJEekHSfnpfpXXQDMmqGzNVTUIpweEoaAdb7VADF4fF46mQbAXPCQq/Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770922205; c=relaxed/simple;
	bh=CwOpWsy5QZS3j4cRcBIBXtIxVnO2I69sHNVlLacIwdI=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Ds1cbLbgwK6ScxsYRvn3T5sD5BdBUqLfPNtcqVhX/RlUuarUZLRejxoZcjYAn/2yC2kLXktOW7GmmAlAVbK4rZr6BKaXVNFRsrUOWlNLClbE39p4CElDWwKMpms0jbKxffA5RSvAR67v8uKfL05y33WqnyWcAG9+k/Ad/WoOR08=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=piWKJzsf; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=HAhJ8SDt; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="piWKJzsf";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="HAhJ8SDt"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61CGNJgi591741
	for <dtrace@lists.linux.dev>; Thu, 12 Feb 2026 18:50:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=LF1lRW45n57ja7rXxxHBO8HF3Ons8N/VaEGcpAsxS9E=; b=
	piWKJzsf40rrAwnLmeebas7EVt6c3KH152Vbhb82tB7r3yDc183AsNhou9ikP5Kb
	Sql6NoVrWPBletf6tCX0RV7tuFXr/emcNn5fcXEWuuUbr9kNpXdkahIxjvVolSYX
	I1LsuU74ti91+BYUcm7HmJSXtIwn06+OZKfEGViC2xvWXp2I6tVga8fnoq0R+5NX
	GxDWDKPpkSUfisFk1wfSUFGfeoCmPRgnSzKsUc4X94t4H8bw1PhffADjuqZMNIKK
	cI8Y70wgnXegCtcPqqE/0MdeWf9dFa/1R7ReXITjCkAzZQu3kr+MExiYB1cr7GLb
	DC9T/EXxwsXZQazZQTrmGQ==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4c88qt4086-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 12 Feb 2026 18:50:02 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 61CI4VBd007688
	for <dtrace@lists.linux.dev>; Thu, 12 Feb 2026 18:50:01 GMT
Received: from bl0pr03cu003.outbound.protection.outlook.com (mail-eastusazon11012018.outbound.protection.outlook.com [52.101.53.18])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4c8237hvvm-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 12 Feb 2026 18:50:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G7a0ICazJ1kr2MCljhCz6HmATQOfHqb9Hh4jc7O9wKMCm49aKPkLpLK/wLNTRdSHM+pkICTholfZjke3h6hTRFkzI10ei4q1tlpxCpQVKv1ztgymyCBkIcEmUYMGzhHBPb8GMbnYjTh0MHzoonmzRO9mu8+ea+3JSLz1g1PKfL5ALyBvma60ZzP4wL/G0gKot+pGHCiBh4TLX6Ow/3lAvGEr8Gz7kD3YMxMqvT2O8E3TX7A7iDVadujmGYQuSYqgkyWASKUVU5lWXQT0oxAuuzB24J7HiGgAi/XTQYYeS/VbpJLoC+7QHcwwlpBBMz32rKWKa3fFCMQcR72LdZ/Caw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LF1lRW45n57ja7rXxxHBO8HF3Ons8N/VaEGcpAsxS9E=;
 b=H22AZvASXWcWe/QeCXyhd2FBjxbyR6in1IgRF7QEAhfH47xw7Dv3vkPaB7tvT7HY2VKa2JaY/LCb4Z8yVIum/BNTRgbSNE0NMNlsI/5F66Eu7svncxzsQVTxJTD4ALmtkCcUfCy9B7BawTgVINn08oDFwbt5AJ5F5BVaoyUd7g+jNBA/33bw3FvqG8NPA2rtecqAYGONlJuHlhgl5odmJdUsJ3UfhsgXxfZwdNvK97QP76Zw96VMrYID2w5Lbj2jKPPbY2jc4CZAlRrfOkzOZkoh3kaLosw93WfWM5/1Rf9S3Zv91PBmuNkO22o2hfI7gewQ8y2UjXacFlWrRnrjFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LF1lRW45n57ja7rXxxHBO8HF3Ons8N/VaEGcpAsxS9E=;
 b=HAhJ8SDt3toXwT0Ol8aXdiD0AW0GpE5im5jDKbIyoyLO7CS81YK8FlxU/sQYKxko021xHgueEi79xZFis0Wcca4GKUXYDM6IF2jWGmFRzjuzUtg1eMpDAMhP3R2yJxjeKJEQbUdH3qDMILWZvvDeTwL52GYeBLMqHzSylgRAnQA=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by DM6PR10MB4362.namprd10.prod.outlook.com (2603:10b6:5:21a::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.11; Thu, 12 Feb
 2026 18:49:58 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b%6]) with mapi id 15.20.9611.008; Thu, 12 Feb 2026
 18:49:57 +0000
Message-ID: <cac20746-0207-711f-ada1-c96b1cc6603e@oracle.com>
Date: Thu, 12 Feb 2026 13:49:54 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [DTrace-devel] [PATCH v2] dtprobed: use /proc/$pid/map_files, not
 the filename of the mapping
Content-Language: en-US
To: Kris Van Hees <kris.van.hees@oracle.com>
Cc: Nick Alcock <nick.alcock@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
References: <20251202230453.124306-1-nick.alcock@oracle.com>
 <20260120162051.183028-1-nick.alcock@oracle.com>
 <08f076e7-9573-7ca7-f89a-a3fd33bf683c@oracle.com>
 <489a5755-af8e-6eff-48a6-9fbeb8c9b4cd@oracle.com>
 <878qcxomfi.fsf@esperi.org.uk> <aY4buJOhWlmm9CvW@oracle.com>
 <aY4d0ttnWiIzwfWu@oracle.com> <aY4fWtW6pHgFUkEL@oracle.com>
From: Eugene Loh <eugene.loh@oracle.com>
In-Reply-To: <aY4fWtW6pHgFUkEL@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PH7P220CA0050.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:32b::28) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|DM6PR10MB4362:EE_
X-MS-Office365-Filtering-Correlation-Id: f5619832-a8f9-4137-4e8e-08de6a678497
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Ty9xVzk3b3NUU3owNGQvOVlWbzFwZ0hKQkRRUktlNDI1U1ZGNGtkWHlIenA5?=
 =?utf-8?B?cHlNVEFRU2tEWldsSDg2cjNCNXVDL0VlcExEdkRHMHU0WUNOQlk0QjZPMlZU?=
 =?utf-8?B?Wkh1OWZMeFRqaXFlUWVNWlNiSXE3dmI0dzVXWnVSVmNLMStsSmFKbDltRDVS?=
 =?utf-8?B?V3ZvaitLQUxXemNhSVNGM2lDUW41TVMxam1qN1JqU05CY3ZYd1lyYmw2K1NR?=
 =?utf-8?B?cU5yMG9xRmJ5eHJYRS9nbk00TTJIVFB1UmV1Ui8vUzdTV1Y2ZUppRUU1bjI0?=
 =?utf-8?B?V3ZwYThXNEFGOUpqY09DNkJuZ3pNNzFQV1BQSGx4VUUxbE8zUU5zNTlHWU84?=
 =?utf-8?B?Q0I4RDlEUTdBYVdLa0JJSUpkQTFsNWY4UEZodWRiTm5JbTFJNVYxZDBCSDBR?=
 =?utf-8?B?R05uVEcyM2JNelcyYS9ocVFWM3FlNGtXS3pwanJWZkYyREdNY1FZeHZmOU9U?=
 =?utf-8?B?QWpMUkdSN3B1cmFKSjk1c3pUR2RaNGVMcEVkck5CRXFxZXhKYkl1T0hXSlNS?=
 =?utf-8?B?cjM2bW9rZTAwYmF4Y1JpUkp4S2pNbVlJUUt6NmRxTGhEV1QreVFUZ0hCYkx6?=
 =?utf-8?B?aXZjc1FMTWVvRjdleS9lOEswUlRoWG9EVitULzMxTXEzSmpDanVtRDU5VG9Q?=
 =?utf-8?B?TU55S2daTEgya1R5b2xnK3BZR2dRODhJSlhoK1dyL1QrTjZSUktNOTQzN0pa?=
 =?utf-8?B?RmxKSnpickxZNFJvTU9ZcDFwLys2ODdhWjBDcEUyai9EQm1yUis4bFBHZXJs?=
 =?utf-8?B?WUdpaW8xSUZNc0NQa1I1Vkx4YVRzd3IxaEpvN0JXblozblRyU0pyOFlUT3ZZ?=
 =?utf-8?B?cy8rWFBvVDVranlqRWlvMmFJMVdmT0dwemJGbGRMWVN1czhzNDk1cUJhTHVO?=
 =?utf-8?B?c2NZQS9adVRqS2F3eWVOS3dRTlNrOC9OWHRUbEI5WXJSQUxRVDF0T3JmdzR6?=
 =?utf-8?B?ek55TU9HanovN3loRFBBYjZBWGgyQXlQcDhZclA2Vk5BdW13RTNLZE9VZXUw?=
 =?utf-8?B?TXpFUzllNHhwMXkvRFVtUWp2TFVkZVJUendHbkVPbHIrSzhOd3A0czRHUFlx?=
 =?utf-8?B?MUVIS2luZVlWSXlmMzBHTmtUOUZqdXVrVm1ubVMxUlJWVFNQc0ZvVzVqWDRy?=
 =?utf-8?B?YllLWkRpdUlrZUtzUm5XbS9JQjRxNzg2R0FkU3VqNEFubStUejRaZ21IZWhx?=
 =?utf-8?B?cU9vN01IczZ4d1RHUTl0RE5YcE1aZk4rbFVoWjBzcVNvclA5RU9uZlFFaE9i?=
 =?utf-8?B?aWJ0amNDTkh6SmFYak9yUlhYSGVUaVpaY3htdjgyZUVYY3g0aGNRVmFIMkRi?=
 =?utf-8?B?OGs0OFRQT0txc3RaT2VnNVVvbUU4VXRLMlg0eW4vYzhVeEUzSDRTSEdlYkdu?=
 =?utf-8?B?ME44R1FKeStEaFhxZm5TY01ReHBodDF6VE9BYzg1ZTVQR0pFRTNLTHBEd1Bh?=
 =?utf-8?B?bzEvN3JaWk5tUlVJOFNHb0dhYzZwUG5RRVlrNFlNMWZLQklsQ0tHN1dTODRB?=
 =?utf-8?B?UjZiTmMySDZIZDNRSlkxN1FiV29lZCtYdFJBUkgzYW8xSENLTXI0NVZIMWxq?=
 =?utf-8?B?Rm53a1R6d0t2UjZhb1FVbnVjYW0zWE9NWGpIRnlNenFjS3hmNFdxRWFJVktR?=
 =?utf-8?B?NHowT3lzNnhyTDdscmtzVnFNeUx5a09PczVaaUlPTE5tbDVBYU5vZU5adDVC?=
 =?utf-8?B?THZTdlQreHFaQ2lqQTFINDVkNFl2RzdHWE5Yek9JT3p4aUNMOS9GVHdLb3Nr?=
 =?utf-8?B?Tlh4bW5zSzN3dHAvbXp2UVBVbDI0OG12ZXpyNHZlbHlobUxCOGt5UytGanNC?=
 =?utf-8?B?ZyttOXp2UzFkbHlIdlVtTVdxOGZlbXZRRlVaT3g5T2tQelUzbUY2T1FJMGg3?=
 =?utf-8?B?QjZYdDYySDA0ZFE1dm1qRXcwTnBWNExSanhucVBzR2VhWkYrM0FPTEJZUC9F?=
 =?utf-8?B?ZnZZcHo1L1J3WGRFNUJPQWF3VnRDZ3RNMHRIQUlDcCtSWnRVZk5aMUhGTTA3?=
 =?utf-8?B?ZHdUOVpvTnpkcE1ERzh2Z2tQNnQvdmhSN0V6enpMVmZPZ2o3YVRKRWJwdTJy?=
 =?utf-8?B?d1JjdHVCV3NUSElyVzY2NEtKcXorV3hZc2kvVi9SZTVpUUtZVVdrNkZDZm1s?=
 =?utf-8?Q?GXbU=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?b1crWTd5NURtanJOc3VpaUFVQXhONTVycWxPU0VCVmRQYU9QalRmVFJxcGR5?=
 =?utf-8?B?NnNGYkNBWkJqSHArdkp2YXVGSEVtSWFZRlQwc0pmcWtjalp1eG1mcTU1RjIz?=
 =?utf-8?B?WEQxV1g3eGNtSUw4MkhsRjk3THhjTnQrQVBESm53OGdUQ2Iza01IZVIyKy9v?=
 =?utf-8?B?YVhHRWFmSG5KMzBodUJKWlBXWkR4N01ldE1zVHNMa2RtZFUrSjI0Sm12eUQx?=
 =?utf-8?B?QWNteVNCMisvbXM2SzVQd1JNUDBmN0pHdWRnL3BxWDZIYnhpa1JTM2VzQm1x?=
 =?utf-8?B?SXJOVmtGaFdpam1tc1I0bHBEUkJWMGkxZHVGMngyZmt6WkxINTZCekVKM3d5?=
 =?utf-8?B?T2RnRy9EVmhaWGRQcUc3YUFOZVB0RU0vT2lpZTNKQmlxR2t3K2RsbjdTbFgv?=
 =?utf-8?B?Uk8rcVh6a1ZaRFFsQkJxYXhvR0tGam54VW4zZXpEQ2hWZ1c4cXFKcmEzYnIy?=
 =?utf-8?B?dXI3RWwzM21vM2FXU0gybmRCS0JlTFgzNUZ2WnIvNjRid2NKOS9oMjlKaTFz?=
 =?utf-8?B?RnFwODUvV05Ja0hkaXdiWWl5eHdac3VQTmFDd01rT0VkZFk3azFpNHpjSXB6?=
 =?utf-8?B?WjZaM0p5QWI3aUo0c3FFc1lYcmxXRlFueW9HUElFMzZyR1B4SE8rMytnMEdZ?=
 =?utf-8?B?NHRiZ3BBakFkQk5UZ01zVXF2N2ZING1QZ25IRmh3YlVGUWJjZkE5bkZWaWhR?=
 =?utf-8?B?U2x3TWUyMGJOL3k1YnNHSkZJRHBOYnBhTWJpaGFwSUdyOFpDdTNLQWlyOVFX?=
 =?utf-8?B?M3ljS1F0bS9NV3RMZVNrRjZqSHVONHBFRXUxS0owNTEwMkxqdmEweGwyR1Ux?=
 =?utf-8?B?am9IeHp2N0pLVzR6NUNVazBPWktnTXZ0b245Z05HcTVMN3lDM2ZGTFNQSDFB?=
 =?utf-8?B?cFJGMFA2SXVwVVhxR21SdTNQay9EOEVMZlFwNC9zaUZxbUZ4b2VJbnJOTjlD?=
 =?utf-8?B?eE1pak5iYVZESlRVbzYwbHBxcU8zTVVjYk94STlzNnFnQ2FsZUtteStmR0kr?=
 =?utf-8?B?MFpvOW1XTWlHRVFIbG5xenppYy8vL0tlSmxBQnYyMFBsWElDN0U2akJENTBk?=
 =?utf-8?B?L3JodE5WRE84M2lQM09DMUZ5QTRvQmR1RjVhSFMxcVhPaXhhQU9sTDlPWXp2?=
 =?utf-8?B?VnJMYzRKY0hrUFExSGZZMHFKMUxnNURoSS9vSE82alNJWUkwTlE2RnlmZVl3?=
 =?utf-8?B?RlhOelN0OEk1aWhqTzdHUVJWeitYN3pEWG1xblMrNk1LWmpyTkJjanlSRlE0?=
 =?utf-8?B?Zk5ybTN1ekFwb29UalZnN3pCZythZDFjSFN1VUxGVjJSM1JuZDV0UXM1S0c3?=
 =?utf-8?B?SzFvemZFM2p5TXRNcGZNUVNIcGkwMmM0QnA2eXpQOUVLcmJ0c3JmVk1XK1dY?=
 =?utf-8?B?eC9NOVN5UmpadHVxbFdFQWtCeGt4NHVoZGJQczVoOGt5aU1SVHo0czFkS0hj?=
 =?utf-8?B?ZnRVbnl4aGlnTlo1UDQ1REQ0VFpycXBJR0IyalRGRUZRQUhrUDBlcUQwL2tH?=
 =?utf-8?B?NVBBSjBoWWJMZGtiMW5iN3ppRFNOckN6SWI3NXpXWkJ3WHUrRVJhTDNrMmxj?=
 =?utf-8?B?ZlNQbFJMRzdtZE9YcGZocXkvOFNmK0pvMjhGN2ZVUGUxbG0xVHpPMnFieXNB?=
 =?utf-8?B?eU9jWGphVGtnazY0NWk3ZnY2TXVmeVlKYituZjJzTHBrczVETnorV1R1Zkw4?=
 =?utf-8?B?dkFrbU5pUEV5d0tTZ3QxOFlvbE5HUGJhZ1FNRXRRZFhoMk5lMXlYMnNKcjV3?=
 =?utf-8?B?b0grbWs3NWdXVE80ajM4T0FCZCtoQ1F4QjRPRUtRcHNXcTRkS0RGUlA3VWts?=
 =?utf-8?B?RHJuNUZNcVRrcUR4dTlZNW9rK1ZKM2gyeGl4bE04UHo2ejdYT3pHTTlqcTQ0?=
 =?utf-8?B?Um4xRUNoS3NhUm5wRHRvaWxZOThMV3h5amxQSXFqejEyRzBLUzhWaDZhdnph?=
 =?utf-8?B?WGwydmJvWW5teHZOY1hEakdXNWtJVlkrTm5ZeTR3MUNZRzh0SHBPZnE1MFlV?=
 =?utf-8?B?OG5qUE9MamphVmk1aVpEYWw1S2dQZnN5VjlxalVwSTlneWkxZGRadk8ydk9r?=
 =?utf-8?B?cWpTVkljUkhlS3Y0WkZPK1p2WnppNnZJR0VDcUZKSVBPQ1JYR0t0T3RjenUx?=
 =?utf-8?B?cjVRNSsvS0VsRnpGT1hiT29SVnI4QWJCamNkM1lKeURDdm9uM0VvWnlkU1FD?=
 =?utf-8?B?bHhjaHhxRWJOUUxTODU5aHBxazd6N1VjMWxva21vckFVQTBlL2JYa1dhZUx5?=
 =?utf-8?B?V0Z0cGxRMVB1Y0c0MjhUQkxlM3lCZm1sKytFQktIYnFnSGo0R01LZk0zbGMw?=
 =?utf-8?B?MWx2TnUyOGJZVU5lc05UbTRCa00xTU54MEQ3TTAxRmVjbFRIeGg0Zz09?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	o9TNIS22BxwarPFHDiFLDdrARuoeuBErNm0uaiCmY04E8i2NXVOGluUAFLQvHl9YYMQOgU0LXwDdMguXbdqk0dehX/lE1UA8Tdjht7wjmpbr8UhBIJtRy7w0kJrVOXy3G8mUP/OwtTWVUc3iYGJu6ve1NKL1H0qPzCXIzYZqD7upAGOr2kUiuJIJjvJ6gBjnrF7DDI2S1KjhWvi9V3eDyWPelG3nLtiop+7Q+KkWFDXQjwl4IF6SaLs3E/I8sQhhj7FscgMO3nYsf/u0Jnw1r3vU8ucjeVTlZnHVh/1CTJl0nBMGBqlGPY+zHjL424zdrjwhzBeRE1QU7NVml+SmIN7qPlpb5ON31su3NjlBE6hNUG6l+23x9Gyn2LGel3W8nWcX5deiusEeJaK2rjuzdfmWqpaEFhFqnnfFCQjKz7kLmgaksbetn5+BzrrRCOZ/kRedfkGWg8CWAMZSkS9/3WvdvGjLNH4/BoVYmvxrDBRb9XXFQlqoEineXSU5scFJY+GnTpffSyCgHzXTAdXhP+P1iLEgpT/u/3+lu7Sbp0p14tfOMPTvbz5xjBmWxkfWs8flGm68kGSjgGiSW5TZ3AYnCvOlwJ1N9A6yqz5PZ7Y=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f5619832-a8f9-4137-4e8e-08de6a678497
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2026 18:49:57.4446
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: c9U/0wG/sHTAi4kkgeQpkOowyF4HQEGPlj38f3/i+zovgNup6JBunTkS2GJyF2KTZP/+9hxlll/DlSs+v5TSLQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR10MB4362
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-12_05,2026-02-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 mlxlogscore=999
 adultscore=0 bulkscore=0 suspectscore=0 malwarescore=0 phishscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2601150000 definitions=main-2602120145
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEyMDE0NiBTYWx0ZWRfX9QJDbNirSrae
 vtOpWpXs/9ZAXhr3Lf6hSiKNW3xFfYiq0OHwXdPfowUy/bKInpexH8+P/nwD/4PcgSZmQMWeZSg
 DcvZv0SA6ThO1jNSNuWzhY89bvdhq5z+GaTnmOZFdfU+f/bQPV1Hvw3l9Iswvgby8BBRngrR5mr
 vYMqvyzOPtgpbLNYEJRCWSsZ2SBTufbZyr5pciNFGbZ2GDgKyoUv46n74uC4xLJ2pq2reEs2CUQ
 +CbhiVUJRzc6I8nZZEzm8SK6X3UG8DDgonXMXfIDK1iDo2GQC+B/Ltapys0iWFTslytPjZ4UE+5
 6SWOm2ZdHn2+Sz7OQSo6EfpSVYmOmd94Zw5tNhzrkHdj/bzrXgikBGX7KjbORdkmVhMOTbHLobx
 7RPZ29uZAYt00jYaETGWnnhwsgwMDr0wV0K06GVK0TS4kaMwkLuI2QAMhj4qAFdrSMvIvmnITba
 ouP6okpsP2ogcAdfZVw==
X-Proofpoint-GUID: GBKccQCnlu8D2tz9G6dixqR8jKS-xsIg
X-Authority-Analysis: v=2.4 cv=Mehhep/f c=1 sm=1 tr=0 ts=698e20da cx=c_pps
 a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=yPCof4ZbAAAA:8
 a=64n8z8otlp8bWrbHBXkA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: GBKccQCnlu8D2tz9G6dixqR8jKS-xsIg

On 2/12/26 13:43, Kris Van Hees wrote:

> I believe the following on top of the original patch should resolve this:
>
> diff --git a/dtprobed/dtprobed.c b/dtprobed/dtprobed.c
> index 9a692805..34349deb 100644
> --- a/dtprobed/dtprobed.c
> +++ b/dtprobed/dtprobed.c
> @@ -487,16 +487,17 @@ handle_usdt_notes(pid_t pid, uintptr_t addr)
>   		fuse_log(FUSE_LOG_ERR, "%i: dtprobed: cannot look up mapping (process dead?)\n",
>   			 pid);
>   		goto out;
> -	} else if ((fn = Pmap_mapfile_name(P, mapp)) == NULL) {
> +	} else if (prf->prf_mapname == NULL ||
> +		   (fn = Pmap_mapfile_name(P, mapp)) == NULL) {
>   		fuse_log(FUSE_LOG_ERR, "%i: dtprobed: cannot look up mapname (process dead?)\n",
>   			 pid);
>   		goto out;
>   	}
> -	mod = strrchr(fn, '/');
> +	mod = strrchr(prf->prf_mapname, '/');
>   	if (mod)
>   		mod++;
>   	else
> -		mod = fn;

Is that a '-' on the last line?

> On Thu, Feb 12, 2026 at 01:37:06PM -0500, Kris Van Hees wrote:
>> Oh, easy solution.... determine the mod name from prf->prf_mapname like we
>> did before.  I.e. work with two filenames, one from prf->prf_mapname to get
>> the module name, and one from Pmap_mapfile_name() to access the mapping data.
>>
>> On Thu, Feb 12, 2026 at 01:28:08PM -0500, Kris Van Hees via DTrace-devel wrote:
>>> Here is the problem:
>>>
>>>          prf = mapp->pr_file;
>>>          if (prf == NULL || (mapp = prf->first_segment) == NULL) {
>>>                  fuse_log(FUSE_LOG_ERR, "%i: dtprobed: cannot look up mapping (process dead?)\n",
>>>                           pid);
>>>                  goto out;
>>>          } else if ((fn = Pmap_mapfile_name(P, mapp)) == NULL) {
>>>                  fuse_log(FUSE_LOG_ERR, "%i: dtprobed: cannot look up mapname (process dead?)\n",
>>>                           pid);
>>>                  goto out;
>>>          }
>>>          mod = strrchr(fn, '/');
>>>          if (mod)
>>>                  mod++;
>>>          else
>>>                  mod = fn;
>>>
>>> Since you changed this to get the mapping filename in map_files, you get a
>>> name that has the address range as its filename, and since that gets used as
>>> the module name, you end up with the wrong module name in the probe spec.
>>>
>>> It needs to be the actual filename of the source file that the mapping came
>>> from.
>>>
>>> On Thu, Feb 12, 2026 at 06:18:25PM +0000, Nick Alcock wrote:
>>>> On 12 Feb 2026, Eugene Loh outgrape:
>>>>
>>>>> I do not know what went wrong here.  I would have bet big money that I
>>>>> tested this, but here is what I find now with this patch:
>>>> So did I!
>>>>
>>>>> test/unittest/usdt/tst.enabled.sh: Running timeout --signal=TERM 41 test/unittest/usdt/tst.enabled.sh /home/.../build/dtrace
>>>>> FAIL: expected results differ.
>>>>> 400000-401000:main:go
>>>>>
>>>>> Diff against expected:
>>>>> --- test/unittest/usdt/tst.enabled.r    2026-02-12 05:31:24.000000000 +0000
>>>>> +++ /tmp/runtest.6196/test.out  2026-02-12 18:09:58.980466976 +0000
>>>>> @@ -1,2 +1,2 @@
>>>>> -test:main:go
>>>>> +400000-401000:main:go
>>>> This suggests that symbol lookup is failing, which it shouldn't be,
>>>> because that *too* uses /proc/$pid/map_files, or should.
>>>>
>>>> I clearly need to debug this. Got a system on which it goes wrong?
>>> _______________________________________________
>>> DTrace-devel mailing list
>>> DTrace-devel@oss.oracle.com
>>> https://oss.oracle.com/mailman/listinfo/dtrace-devel
