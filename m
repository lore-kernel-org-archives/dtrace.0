Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C672C47A40
	for <dtrace@lists.linux.dev>; Mon, 10 Jun 2024 22:14:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718057687; cv=fail; b=mQiYJIHYhsn9OB7jR+k6pFq/HFZh+h/rbT97+Or6rNu3tO3ZnstwZkhOVyz5ZyrbEc/jc8JG0LzhmtSZAlXSzqcAF4BQqHz9nam7FFLu4BWyYOCIxGSiWEjRt+PNOlyZhL9zjFeOZ0kOu7wPP4DeFqbP0g5G3ATvv2sGxhIRBSw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718057687; c=relaxed/simple;
	bh=S0V3LD6QLlThA2VLNb0tDIgqV/ysgKGUGo61N/KzLI8=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=H9FgIINrnj6B6m1djcSePJEimlZdnKszboY5qj2JoulsiL5erdNf2HPxzN5+fN3+2tn5Pg9uV+8p8PCT9LfmoEJNysWAKhRK65r0M1yCpAii/5RzIcuXuMbPy9kkJotXdRSUYMqRkmZSSfjcA3SnCZv9WTOnPaXs1bf/2YU2A6s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=W5spj5S8; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=cXNZBuWC; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="W5spj5S8";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="cXNZBuWC"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45AEMTNI026683
	for <dtrace@lists.linux.dev>; Mon, 10 Jun 2024 22:14:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	message-id:date:subject:to:references:from:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=
	corp-2023-11-20; bh=HHEG5es/vi3sdBktyiKbmA9Euvq+Is8nRQEHJeXAcS8=; b=
	W5spj5S8t1fVkpkiRmV7uH0Mdn1PuGUXdsUcIMha0AUc4wqmY7ulXuyR3SGrz2qx
	Ef10UP0Z5aU6uAKU8wj0OYDjs2jpzm6oduaHTvB/InZls2aMIxSOKJZGgJmO2zFN
	CHJdyrRMiNj2Qyh/aRlZTaJy7X++DK/kOVRhlR351fOhxOntYAylpdcGCNz/qmMV
	OOoxTQvpYWd+Mi6xm8jY0eZiSxdPHcJNIKIr2b7Kf2uR+Hz7ZsPDe1jQFfZu++Vm
	vHwJlmfzZPkN+dy/ei0UYAeTQ174Z6KRiH8n5Ak781Hpq5zMENhOCt7hIsUZpQ5m
	+EuGCecPAo+MVD6UD5SO3g==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3ymhf1bmss-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 10 Jun 2024 22:14:44 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 45ALs5oq021545
	for <dtrace@lists.linux.dev>; Mon, 10 Jun 2024 22:14:43 GMT
Received: from nam02-bn1-obe.outbound.protection.outlook.com (mail-bn1nam02lp2042.outbound.protection.outlook.com [104.47.51.42])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3yncatp0j0-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 10 Jun 2024 22:14:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DF95n+83iFWsZbRpZiMSFZj4X0U7oQ6h4FuehLh0VTiPH1XyzXmEPwDUpZz6L3F9H7NVuLNJhsWbKtX0RqpeSxuYbl6wUx7uT6r0XjXoVAX2DoPiYZb+jxoeH/C++roubZa5cOtbA1JEJYOG09+P5es682yJkCP/8wbWvmYhAnWgxrGkBHAKLnldZOqdoSY9eZUiq3B6+gxWpU0VRfjt+0UImUQOmqLrcEjVArgaax/f1fyWTqb4uHryKTF45HoQp7FaQpmHthGuIonVQYyEJDuZLiOSW2oVHB10WM+S1i1BPLfbpv4o1fQsNL3K7BOmTUyHsuE23bx/6KvqmB7o7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HHEG5es/vi3sdBktyiKbmA9Euvq+Is8nRQEHJeXAcS8=;
 b=cSvY3adiAQYEjK5Q2yzGuqLe+aj3KwBqHa+Rvij08vHe3JmhreW/Y4PueXi8aZtzbu33oVai1DadAVUSV2jzEhT3bBZlECqf67D4FaOu0hXb3O+S4agLYo8NkbKD5telhD0L6fCGtAdjvPwu3Bp0cCQ/WRuaINJlNxduJwtu4Zko82UYb0Aun3wb9R8km0Dy7OCEnYqsPMJH++Xdn/XM+N0rwC9I4NSVAUeMJ7CQlwTYqddsrtIZjLFANP8Perp5/WUZxcYENGfh5ui5epAQ10La8huVxeLU4hYRqRkfGTPyqxDBVzDNQSd6L5RqRX3tCUkdzRQUV/4VOaGlFb+nfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HHEG5es/vi3sdBktyiKbmA9Euvq+Is8nRQEHJeXAcS8=;
 b=cXNZBuWCKB+/wLVl4i5uZvj6K1ff7Snq1HLyG42bg73VPF+VJEUFRpzDWwhFzuzqxIDuAuSWJv3CErW0a4rXYcB7W1t8R2Mh2Z+sNK8LdIu9A0IwtvwACM1LTQAWPlrYF8Z3LLoElUbTVYNH2HDtfX4oDYCaR2w8/6pNNuv0CY4=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by BN0PR10MB4917.namprd10.prod.outlook.com (2603:10b6:408:116::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.36; Mon, 10 Jun
 2024 22:14:41 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%4]) with mapi id 15.20.7633.032; Mon, 10 Jun 2024
 22:14:41 +0000
Message-ID: <2f4000a6-b6a9-f79b-360c-885e1352ec58@oracle.com>
Date: Mon, 10 Jun 2024 18:14:35 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [DTrace-devel] [PATCH 05/14] Add a hook for a provider-specific
 "update" function
Content-Language: en-US
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
References: <20240604181113.11505-1-eugene.loh@oracle.com>
 <20240604181113.11505-6-eugene.loh@oracle.com> <Zl+JSX3bKMb+QLdP@oracle.com>
From: Eugene Loh <eugene.loh@oracle.com>
In-Reply-To: <Zl+JSX3bKMb+QLdP@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0195.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a4::20) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|BN0PR10MB4917:EE_
X-MS-Office365-Filtering-Correlation-Id: 4c437eca-6d46-4674-4cd9-08dc899ab974
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|376005|366007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?eSs4akJ0ZHc2UDA3ZjBncUxIdEpxTTM0NFk0T05va2Q1R21Dc05nSlRCckFO?=
 =?utf-8?B?L2JXK2JqaTdkL25id2NmTGgwYXpLNTFvUXlkNjA4NldRSG1wWFkvTEVKdXRX?=
 =?utf-8?B?VDV5NDM1NG5nMlkyZGpXZCtHM0FiSTJDaFMvdHZKNHdvUWRuNUI3UEoweHI2?=
 =?utf-8?B?dzUvQ0lSNUkwRllqWkRJT3dwK0VkTG9xU3NWcTlGdnYybWZrT0Y4dEtSdUxV?=
 =?utf-8?B?MmZ6T0JMMFBra1ZveW80d2dsTHE0b014TWFDR1pDd1hlOU5xbVpBZjM3Vis2?=
 =?utf-8?B?U3RIaGdNbXF0MElQb0VJMFdYaEFIcWN5dVkwRHVoVGdQdHJqaTBQS2R4OXYy?=
 =?utf-8?B?cnZFWHptOVI1NWFCMEx5R0cwRlB4dVdsUDR4bC96bmtHcTlRQTJFeTZsWmxM?=
 =?utf-8?B?UGkzeHp0a1duQ3pLaCtMUnBZbEdsOExSeVd2ZUkxbWppeWZMQzk2M01WdTNC?=
 =?utf-8?B?RWpYU1czMWJaYUNIL1pXMFdQeUhFWlM5dnRjbVl6dkdSU0RVKysyVDYvKzB2?=
 =?utf-8?B?aExsZWxkcTljcFJXVFJMZVZsSkZNMFJyemdCOGY3cVh0d0JHQ1diOXdaMkp3?=
 =?utf-8?B?KzZhRld2NmFJZnJ2YXlIRm9wWXFjNkQzT1FKM1BZQXlaUFRHSFFnVG4xQk5C?=
 =?utf-8?B?Q25IWE9VeUxHc2cvb2xLbWZESnB2WkdMYVBvdnFXd2pqcVB4OGJxVHZEL3ZR?=
 =?utf-8?B?NE5uZmZJY3VSQlRzRzdZSzBiZXNVbnRvMjAvbTdtL0Yvam94ZE9rYjErRlVs?=
 =?utf-8?B?T25udkdmZktNWmNRRGQyVzM2bTJWNmFwK09YUUdsWHdCeTZFVDB1a2J5dklS?=
 =?utf-8?B?M3lKOFZrNVJvdHc4SzVqcVJCdFRtZ1FJMFRaR2dDQkR5SWlZRHNGOHJ5b21z?=
 =?utf-8?B?K00xVzlRRVphb2paRjZJWnR4cDFudFNBd1h0eERQTlNlV1U0Y2gxUks0OHpj?=
 =?utf-8?B?S3NaODVqbGt3NFR5NFdNUWJvdllLY2M0NFhaNzJtU3MyaXNaa3JVZkhkcTZi?=
 =?utf-8?B?SjJidHJ5MHRORW4zbHMrV3k0enRWa2Q5aWE3WjQ4WXJ6NE41QnFFVGl1MkhX?=
 =?utf-8?B?WVlBT2dwMlZPZm1FYTNwR3NCV2xYMndvZTYxZmZ6d24vSnVlZEp0a3pQQW14?=
 =?utf-8?B?bDZmaGRFSFU2MGU0d25jU0JkSExEYjdOY1VNeSs2MWdsYS8wUC9VRFdka2l1?=
 =?utf-8?B?bDh0KzFYYm12Q1VFeEVvODBXSEVZN08vSlJrdkZzNy9aUVRJUTFsUU5LT3VC?=
 =?utf-8?B?RGRGcnVzV1JENFhxNXZ6dVVENWFTRUlvcVdENUFZZWNlQ1pMbEEzQ2VCOTdK?=
 =?utf-8?B?MVArTmZtRi8ydmpyYnJ2R0RIYkVQKzA2a1M3SklYU0VmWDAxSTF6eVpsQmJy?=
 =?utf-8?B?K3JqNS9iMFZTUHVTYWhNWXVIdVBhUnNWMjVUa2dZM203aUFnM1QxTm1uMVRE?=
 =?utf-8?B?dC8yQzZlb2ZoT3FNOTlNU3JqQllWS21UTitkbEh4ZUFtRW5JMUlGSUtNdmhL?=
 =?utf-8?B?R3EvZ1FVa3VIM2NNZUdCQjBGeFpnc2lVQm5kZFV2ZFk2WFIzb0ZRb3ZUR3Az?=
 =?utf-8?B?bk14MTV6RmtRcnVZWTc2UXdaeXZDRy9yemxLR0NjTHU5UUE2MmZiaUdZUXV6?=
 =?utf-8?B?QzF6a2puL1RGREhaZE5UU2JFNEtlOFRTQmtyL0UyV2hDU0I2ZXVZRWZaYVY2?=
 =?utf-8?B?c1dkdi9mekRiUHVVTmlXUmRMTDdYb3o0c1NOL041RElXbVRNTTZuekxlUFJp?=
 =?utf-8?Q?y4d6XtjjsnNrVQmujCBNJEiLP8oh3LqJaT3FB+Z?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(376005)(366007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?L0VrK2xWNU1FckN6VUVlY2tYS1ZPWm50UVdlN056ODFGQjVydE9SdVpIcm1p?=
 =?utf-8?B?OXR3eFE1bmlTYUZjamM5ZXE5clh1azd6LzhiQTRUNFYwdVhoSWNWT3gyZE5v?=
 =?utf-8?B?NzRuNlZ2YnA5QVY0bk4zU2dZRmtDYnNoLzFnejhSZEtWNTNybURnOTc3N3ZE?=
 =?utf-8?B?SDZKTmoxMm9YQWE4Z0dpYXlLczRWelZNQzl4eTFZNHQwMGduOCtiV2dCU0po?=
 =?utf-8?B?RllWbElnd2w0QUZ3eTNZL0ZoVTQvcnIrMkpMRzZkdXVjcjBZS24ycHlkOGFY?=
 =?utf-8?B?cnVHWlhXZTErOHFGZE1KT05CZGtiWmY0OHBVZmpSM3VYS25iMyt5MHduUHB3?=
 =?utf-8?B?K3IzZUw0N3JrT3VGUTgyMG5UNzJGcjEyWk1Zci9lSVJ1TFI5VmFqd2tMWG96?=
 =?utf-8?B?U3ExM0NFc1h5Z1ZwcG9ZN1pZOXNCaE1CYTdZeVhxQTBaa0R5eXRUNDJJR21k?=
 =?utf-8?B?L1dEYVVWelNxWXMxT21NU00vL0s2UGo5RVcvcHJ6R1NIbnBUb3kvOWxoK3Qx?=
 =?utf-8?B?L291bzhnaU1pUUZUQ2VjRjdOZ2srMVFOOGpEcWQ1UkFuYURGcmE3RnRFdVJI?=
 =?utf-8?B?RVZpdnV2bnVnQkFZRmh1WGtVT09QdnZnWkE3WTZweHhhRHI3Y1lvRzdzNWd3?=
 =?utf-8?B?eWVYQnByMmR3NGZYQm43UC8wdndlbFp0ZlFvWDFVMlhnVW1kNDFEOWNqSk83?=
 =?utf-8?B?VmM4cmg2UWNUNHBnalVUUWhTRGdNN0dCT3RTbnFtc3NIWlNhWDFldUp5OWlU?=
 =?utf-8?B?L0plZG1UTDF2S0N3M3dDL3pOdmdOYWphUFJYSjZRZTNCajZkckt3TEN5YmNG?=
 =?utf-8?B?R2JrK2hlNVBqTkZMMFBuak1vVXpjL0VxTVEwRXU1NW4vZmVCZU1WbHdiZ2ht?=
 =?utf-8?B?aS9SaWwrT3JDMVMyaUJJamFoUlVJS0JzbjRCL055Yk04V0JqdFhka2E1cno5?=
 =?utf-8?B?eGRQMFNncVBLaUtaMi9yWFh2RjBSclFiZEhEUU14SVpqS09STnlXV2JpaUZ0?=
 =?utf-8?B?K1JkWUUxaUtjM3JnQTVXbi9XTDZxVkFRRG93TU41MExUdjJkOWJFWnliSEx6?=
 =?utf-8?B?RnNnSVlBOWx0cDRsNitSSDlaRTdRZ3pGMXNaSnNKTStjQXZEQUVZNHJYZmQz?=
 =?utf-8?B?c0hrVDBQczdsaFRSMlY1TlF5akdSL1lSUTFtdUhWVkw5eHNDZldjM3VqVHpV?=
 =?utf-8?B?Y1dRdnVZRStnRzRZSVMrTngrbVAzZEw0TTlTcFdCbDBZWEdHbzFrUG10d3cv?=
 =?utf-8?B?K2hlZkk4RHV0NVZWYmZzV0Fhb0dwVEdxNlZ1Q1lILzVxeDdsZjVhWnBkeElB?=
 =?utf-8?B?YUZONFlQdDMwYzlxZitmQk42WGVJdnBnRlpOMjlmbll4RU5vSkppcmxBSHJD?=
 =?utf-8?B?eFFDYVVPSU5xbHdPN2FGTVF2TVRWN1RDRndxRGNFQ2ViUitNUTV3djNtdGZO?=
 =?utf-8?B?NlZLSk5LZFh2aksrVk5lTGNuRGg4V0JieEVVS3lSb09MTHB5a01oYkJFamJp?=
 =?utf-8?B?R2NvVFlPREJZaGt1RndrNWZvYjU4VE0wdVNsb3NHTEoyQ2lyNlA4NC9rQ0NL?=
 =?utf-8?B?bGdDTVkrTDhKNTFhQ2x5TnNPQ3paSTRLcEs1MTU1S1d4Zm5QSEE1RHlLSGRz?=
 =?utf-8?B?QXNtdi9CSW1Lc2Voc2RSV215Nmh6REF3Wk1lNUZXb04yL3NkQ25uU0VxMito?=
 =?utf-8?B?NlloN2FOai95MGRoOEZVbkdDRENDcElkUDk5aUJGTk9TRGRCTzYyUVEwZzUr?=
 =?utf-8?B?NjdmNk5JVEFLb0xhYlRVU3BLQnErUFZLUy95cWpJS0ErWVJ1KzFMWHZsL25F?=
 =?utf-8?B?Z2c2b2ovd0VXR1Z1ZlB6R0hsTkdYbjUvbVZvdlpaRTZENit2clBnNkkxYVRM?=
 =?utf-8?B?SmdiY0pBK2NFVWZabTVTWlNpU0JqdnNSS1RHTlgxQXVUaEJDeVJCU2trMlUv?=
 =?utf-8?B?UFFWbEJUZHg0aUxhemRpUmdqU2xtNkZtbHJzWTJxemhUNzVMYVEwVjJEei9v?=
 =?utf-8?B?c3lwNlNsWjZpalpkcUJ1dXRQaXFoRitnTFVRTkR0WmhrMC9rYytqVktGeTVQ?=
 =?utf-8?B?L29XZGJ1TGxkdDlIRE15MWNEV1h1V2J6T0ZUQWdKU1BmdW91ekxMeE1NTjFV?=
 =?utf-8?Q?zWqM06DiLOLErQZiCvPujC6Hu?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	mKK/SooLnnnB/88zceB7Z5uuIgkKi3z6k6VJ+2MgDEdthgmIQWXN/fv8vMgTc5WdxRhofnoJSg6mSVOkn2ykgM5Mj0gmd/c4HTAs3aL0E3nLyWSlHF/XFFJ3sX9LCT2NXKjE1X+rWsQuIFODoqQLKZhkWEAYM3ddQVY77dVRH3htoDm+QRVfbE6aArbbwT0OgviuEi8heHtVvlVgZ/lXU21/120Vo8Bc09BrcWmoBR64ELmemBqJQxBuVSUkURP+f6V4lYXrMyYC6/74WOJ/px1r9ddMOAJJJ7pr2OK9o/rm+vt2QKv2+e8elLcspEcwdB9eQBEXD2RYnPwRErDM0RDfYFxDOrVLFSnhz0W30SIQIZO+0+E+mMvuDPTXFYVXm+TJ+w3TXGBQookkputmH8jcQL/mKO9Of0mF0k9UU8OUHy0+10NLQvNtdsBHkL4tH2nrppbmzye++MVtmimnZkJZbNhomMOnzRqwZjoYEnKFZTw0xws7v3ElillzZobi6mqlsZsdw8yw5OcQejZrZOdbwBOlduKVNRrbPHHIglQwwrR6F+UtAoypR0pa6Pew58GKIDP3msuFwVd/TRK+uoI6bDW+KYIuYNdixzoUsWo=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c437eca-6d46-4674-4cd9-08dc899ab974
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2024 22:14:41.1484
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: T0RYy7eJzfIawUhZvYwoL/RZcflDQBKy7KDfj2dsYdzqWAGDNObkJO0Jk7QIqJZyc8ytf6ubynrscG7jwgviTQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR10MB4917
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-10_06,2024-06-10_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 suspectscore=0
 malwarescore=0 spamscore=0 mlxscore=0 phishscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2405010000 definitions=main-2406100164
X-Proofpoint-ORIG-GUID: -3aGAiAfkTrLeNI7CiX8f6QyECoGzgyl
X-Proofpoint-GUID: -3aGAiAfkTrLeNI7CiX8f6QyECoGzgyl

On 6/4/24 17:38, Kris Van Hees wrote:

> Much like the previous patch not considering the generic nature of retained
> enablings, this one should be part of that design also.  The functionality
> we need to handle match-after-start probe specifications really should be
> independent from any specific provider.  It may (well, almost certainly will)
> require a hook in providers that need to do special handling.  But that would
> be a specific hook for a specific purpose - not just an 'update' hook.

I guess I do not know what you're asking for here.  I think we agree 
that a provider-specific hook is needed.  So, what scope or purpose 
should that hook have?  The immediate purpose at hand is to update the 
set of pids we're tracking for uprobes.  I'm open to thinking about this 
in other ways, but then some specific proposals would be helpful.

> On Tue, Jun 04, 2024 at 02:11:04PM -0400, eugene.loh--- via DTrace-devel wrote:
>> From: Eugene Loh <eugene.loh@oracle.com>
>>
>> For up-coming USDT-probe support, we need to update a BPF map
>> -- at least when the dtrace session starts but possibly also later
>> to support systemwide USDT tracing for processes that may start up
>> later.
>>
>> One way to do this is with a USDT-specific update function.
>>
>> For now, let's add a hook for providers to have provider-specific
>> update functions.  User space can either call
>>
>>      for (i = 0; i < ARRAY_SIZE(dt_providers); i++) {
>>          if (dt_providers[i]->update)
>>              dt_providers[i]->update(...);
>>      }
>>
>> any time it likes.  Or it can call dt_usdt.update(...).
>>
>> This is for WIP.  A different approach can be adopted later instead.
>>
>> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
>> ---
>>   libdtrace/dt_provider.h | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/libdtrace/dt_provider.h b/libdtrace/dt_provider.h
>> index 17b1844c..21ff15ad 100644
>> --- a/libdtrace/dt_provider.h
>> +++ b/libdtrace/dt_provider.h
>> @@ -68,6 +68,8 @@ typedef struct dt_provimpl {
>>   			      void *datap);
>>   	void (*destroy)(dtrace_hdl_t *dtp,	/* free provider data */
>>   			      void *datap);
>> +	void (*update)(dtrace_hdl_t *dtp,	/* update provider-specific info */
>> +			      void *datap);
>>   } dt_provimpl_t;
>>   
>>   /* list dt_dtrace first */
>> -- 
>> 2.18.4
>>
>>
>> _______________________________________________
>> DTrace-devel mailing list
>> DTrace-devel@oss.oracle.com
>> https://oss.oracle.com/mailman/listinfo/dtrace-devel
