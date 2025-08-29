Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 324B033A02B
	for <dtrace@lists.linux.dev>; Fri, 29 Aug 2025 17:57:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756490254; cv=fail; b=lsxaEnW7lpTYNnDNRUevF5EzRjiOy0T1hfwVcu4P6COUkh/zE2HEnAB6CRSoNKXcWRWdtOXdszOt7UY1rHlfaV//KtpyC5URiyPlmbqRrFOCsuTuNGEGdrXEI/tnnl/tPUXX7vas6XF4yxsi+0oTBpsZHNy8ZahVusK5JgQnqbE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756490254; c=relaxed/simple;
	bh=E18x212JMMhzuUXpfnuwTBDBUMFBFpp8kDsEbLWmIPM=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=l5EDtLnmSOtEDd31w+llq+30Z7p2e6kkABVuaqgD1fCFU5BeSl1wzJrldqT8jmG8ltYQnoTbjYQBFC12MbByB/N80AhFe07W6eYfUduQhRDeh1ZTWDcbn3qEkBClzLPRlXY9cMyTP0kzFB7KQY7c6NhCBnwYPR2qjFWdn9xd9fk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=VV4R5FA8; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=NGGVAgUq; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="VV4R5FA8";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="NGGVAgUq"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57TGfqxq009114
	for <dtrace@lists.linux.dev>; Fri, 29 Aug 2025 17:57:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=E18x212JMMhzuUXpfnuwTBDBUMFBFpp8kDsEbLWmIPM=; b=
	VV4R5FA8IOFlTkbCRgSVFZ6XSHK8Lot+Pqbjh17Vs258k+rIy9o0HSUrLe32obMy
	wK9cxa5t1tePExSLlBy53JxDFsk9lO0JnR43ZkC/0lXf74oSD2xNq+bEVyQqw6Il
	/Hq6u5uFPSPPKWD772xUxLD8OJSkUFEC13exV0DrU9FJ8AXhY0NgaltyKVxfa1JT
	GxcKl+pNvbTMsn3/QFXC5zyI4PJEZfBtknq8bezSEBBzlwnGTRS0spGV2IGvXday
	vXECSLggfc0tld7Gw2MKtRMjUGRDtWHPTJ0u1zW2eTekTMz5A9OdomnLeAtJ2I+r
	rpELP4iBxAyxH+1r8v6RpA==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 48r8twhncf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 29 Aug 2025 17:57:31 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 57TH5Lef005115
	for <dtrace@lists.linux.dev>; Fri, 29 Aug 2025 17:57:29 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11on2064.outbound.protection.outlook.com [40.107.236.64])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 48qj8dp46g-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 29 Aug 2025 17:57:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x1nCJyiaJvp5f5XsZ5gfJrYTtZbbSMQVOMu9EltbHf3rTFCqfgNvtJBasjIAeFQnPqD9WAOllaV0uY3tq+mBxl0nuYRpt9q5/g2zGOSOuwO0oJxntaymQLDCeEBykPncUO2t75YlTk/Xe1Jj7KTLqn5+V7BQIHLTziSiTf/D2lP8T1qUYyOZqWLZvLAfYV2RJ7EVxeoXy1PSqIlWyvyyPp159VSBUOoludFOLz8H75vPmg1jXMIyTb86/ZABZGWUiNccLCC6O/mFGvcf3pQXjduwR7F6A5gLkh5cDGgzZI+axAuOJhP3FnqUuXaPoVPDjCkshwNI0gEjR/IXXvU+zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E18x212JMMhzuUXpfnuwTBDBUMFBFpp8kDsEbLWmIPM=;
 b=vlT0advXEeVRIMaLt1u25e51hOcFrwrWp0zo2pm5eHHoQaVhMX8Cx17jwhskBgmGz+9VLv3YIGScHI3BnN/QZVOhDXblzM82OMoc/wj1gKVigI5oZ8kFTWhmMe+C/buxMmefpgRQ7lFCNjaSZnJN2QQO7YIQb9MsJOamcim/mld6HMUJSIifP/v+EsV39+1dhjoHBnZCb5ywaIGpU2Le90F7WM7LGkYx54IzTay3TL0DRBhhR6+9W7u9peDYFPk3aB7pvTuaOgoq6atZgFlwyErNhvlOyE/2a2zMav56ve9JfjydLBPe1Q0wJUb8VLhjw6ucLg25FneKNQXXpsIc0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E18x212JMMhzuUXpfnuwTBDBUMFBFpp8kDsEbLWmIPM=;
 b=NGGVAgUqvhAlTXx92Q7/wHjrAwKOOaGL1DP5L8pACZ9l+/zn4xbzUKH5T0nLrFswKpXFB3zGBz5Q2iydbloxrqEntpbYbDYWh/xDSTpOrD595RV/emGeBp2si6KU+/SaORhPrNpOruqoQOjNgA363f7hZU+IQ2AI37YcfBe+/K0=
Received: from SJ0PR10MB5647.namprd10.prod.outlook.com (2603:10b6:a03:3da::17)
 by CH4PR10MB8049.namprd10.prod.outlook.com (2603:10b6:610:240::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.21; Fri, 29 Aug
 2025 17:57:24 +0000
Received: from SJ0PR10MB5647.namprd10.prod.outlook.com
 ([fe80::8db4:df1d:6afd:e4a7]) by SJ0PR10MB5647.namprd10.prod.outlook.com
 ([fe80::8db4:df1d:6afd:e4a7%6]) with mapi id 15.20.9073.014; Fri, 29 Aug 2025
 17:57:24 +0000
Message-ID: <e4f256de-6239-56d0-275b-4e731ec1a086@oracle.com>
Date: Fri, 29 Aug 2025 13:57:22 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v2 0/2] udp: new provider
Content-Language: en-US
To: Alan Maguire <alan.maguire@oracle.com>, dtrace@lists.linux.dev
Cc: dtrace-devel@oss.oracle.com
References: <20250829082412.25687-1-alan.maguire@oracle.com>
From: Eugene Loh <eugene.loh@oracle.com>
In-Reply-To: <20250829082412.25687-1-alan.maguire@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR05CA0079.namprd05.prod.outlook.com
 (2603:10b6:a03:332::24) To SJ0PR10MB5647.namprd10.prod.outlook.com
 (2603:10b6:a03:3da::17)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5647:EE_|CH4PR10MB8049:EE_
X-MS-Office365-Filtering-Correlation-Id: 80bcc446-0752-4310-3318-08dde72581f9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YkovYyt5TTRhbXRoOGpja3QxdkVGc0NTV3ZnMjVNcW10VGpZZnUvbjF4c2li?=
 =?utf-8?B?aU0yeTBSUWJ1dklxM2dBWlJmSUNmZFpTSWNDQVUzOWFjaDBveXNvOTYvU3B3?=
 =?utf-8?B?a0Y2MlNGWW5zcHF6MWZwNDBwSzV5Sm14YkxFY2REZCt1QjU5Qmg5QnJTZ2I2?=
 =?utf-8?B?dWtHTjJCUGNreklUc2Rkei9DRnk5TTdxWkZUck8xbXdNS1lXTWFvcGszNGla?=
 =?utf-8?B?RE9aMFVVZTl4T0s2MDJid1B4a1lZS3Y4V0l4b1AyTkx2ZDlpNldDak1FaTZh?=
 =?utf-8?B?K3ZrWDhITFVIenFJb2tleTZ1a1lxM1dhOVRhc25wNG1GYndaYXV4dE16NVJX?=
 =?utf-8?B?UEVWM1BQN1dVc1Z5ZU5JdnJGM0JpWUI0a2NwT2U5THlleC9PY2FuM214YWRN?=
 =?utf-8?B?cmZzNGFxR0NxTkl4QUMxWlFhRzhNODNPL3FrTkx1ZVpXamprOWpXK1Y1ODJo?=
 =?utf-8?B?S3dLZ2xreTRyY210d2JPTkc0SmRYMDJsd2RUVkhHVVFsenVZQ1FzYnJpdEJB?=
 =?utf-8?B?c2s3dktPbmc3d1QwOVZodHhlZndGM2FGSkQ1Z3pKUEVhMjc1MkZHdTVJdDdv?=
 =?utf-8?B?bzVhdDhENUljMXdUbG1BNUZsVVBOME9FY1NoS0RBMVhQeVdFbWdSZE5IK0xO?=
 =?utf-8?B?NXpzNVhpM3ArWnI3NFNBRTdRTGN6b3NzRmlvVW9vU1VHbm8wZHRaeHVuNWhx?=
 =?utf-8?B?ZlhhOUQvTk5ML01DazZ1dUF6QkRDWXNmbURDNmhDczhYWkJBV1RUVytySkFU?=
 =?utf-8?B?cHcvQmtYMjFmVmJJeWR3ekdSMWIyaGt5QkYrZHR5b0p0M3NUNVBqZk1UeHNK?=
 =?utf-8?B?S1pzREN6UEVRb29TOVRpU3lUM29SY0RDdzVaM0FxWUk2anVST1RaWUhzdlNm?=
 =?utf-8?B?bXdRSHpDdFg4TXorL3FUQWtVQWcyR0xMMzBnektTa2RXWnl0OHR2bW14TE9x?=
 =?utf-8?B?SDRYTHZpOXZGZytUajZVOHRqNEV3MWpxV3ZuMlJzaEt5bkw2c21iSHZuL0J6?=
 =?utf-8?B?NUxteVQ5OHFJVG5DZ3ptQlJzTGdQSWJwekl5WEJ3YTdWTzcxOVRMclBtWjZU?=
 =?utf-8?B?YjNWai9NSjVHcCtxM1FPdjI2eFVJWjlvMXNCc0ViRWJPMGhTMzBqSmNTK20y?=
 =?utf-8?B?L3lJWForZjlqMm4xaXMvMXBKMWp4RXdUN3BHWmhlbmFjZTZ1UWMva2tmU1FP?=
 =?utf-8?B?L3FCN0ovWi9ycFloc3lYSlU1UktVR01ETTVQb3RZTGQxenhKNkV4OWsvRUdR?=
 =?utf-8?B?M1lmTlY3ZzVHZlBMSGYweGdGTklkNVNZekZBMVRmVFBpaEx6cGRKNCtLKzVm?=
 =?utf-8?B?RVlFTHZsOWo2VHl0YUpmRXNGMUNYcjJKeEpTV2xDNVZtVUYzeHltMlJzb1Nh?=
 =?utf-8?B?UnYyaHFLTVd5ZXhGUHdBcWlFYWl6VGRoYjhpT2pWZnZidzBhNWwrOEdpSUlF?=
 =?utf-8?B?NTRyRkNKTnJ6VC9LRE9oejV5SUNucUp1SlpPQ1BYUEtVaHVieWJGV1hUd0NJ?=
 =?utf-8?B?Y3lrV1YwTkVmWk00UDhoOWhnWVNPTW9TZzlialZpdkxpTytuRXVvRTBVNnZ2?=
 =?utf-8?B?UFNpWGt3SWJzQjdweDVmZERnOUtNM3dqeGlQTnFIUUdNOUVTUUg1VDBKZW42?=
 =?utf-8?B?UFlCaVo1cXJNZ1AwNm5xZFRaQXlPK1hlZnB0MzJKVXdEWTF1dlpCZkQ1cFNE?=
 =?utf-8?B?QVdRTE1LUm8weE1KbGlRbjVFSUtvVWtjUTJ0NklqUWduRXVVVkRBUlJ6K1Ni?=
 =?utf-8?B?ZjFIVHE5eXhmOUhMdWZlTjJmaUpMOHJldkk0RWIvYWV2Z2JMT0tjUmhSd0hj?=
 =?utf-8?B?V2U5Z3lJbXkrZDRaVllRUFdjbUJWL0ZNNWFWVGYvaGVvOTdGQ1Q2NzNTb3pB?=
 =?utf-8?B?ckczMmt2bDZvQTNmNXhPcisrZVFLa3l1cjZRWExMaEFQcXhEbmhraHl4NElK?=
 =?utf-8?Q?kxBfIxmiAyg=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB5647.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZUFBKzd3ZWVOVlNRMnIxZjJzYk9tZUlFcGFVSlhiZmVKVE5YY0MzRUVlN2xo?=
 =?utf-8?B?RjRsZ3VFZklRTVNTdG93WVR6VWZ4Y2s1SE1jc2FhSHNxWS9MNGZsb3YxZXJF?=
 =?utf-8?B?cjM1a25oeTQvWkFYVTNGMWw1YnFlNVZFOXVrZUkzODhkMlVGODdaU3Mwbk84?=
 =?utf-8?B?NGl5eTQ3dVdTNVlvbG15SUtCeWVLQ0lmNU9menhQWG1RQUQ0dnI3WkNrdWJu?=
 =?utf-8?B?RU00SHNDN2hvSDg1bThCKzF1cVJwZnRKYnYzdDl3U2pLT0pJT013ejJGbXV5?=
 =?utf-8?B?WG9DMmVwdlNaSFdxSmZHS25Cb3JsYjByWXZhQmhQdVgxSFZaRzJYekEvMTdD?=
 =?utf-8?B?MFkyeWcxWFpvOHlWUVNuU3BPaXJIbk14THMxVkM3SmxGTisydDJ4OENDUmhm?=
 =?utf-8?B?S1pMUWJ3eW5lTlBoYXVNa21ubVhiWXZuRXVhSGRnK0I3dkRWY2M1aUZvYmFG?=
 =?utf-8?B?M004Z0pxRFRkRHNpS3kzcjJxcVloc08xQjRCYlpsTmhCTzdLb1RoY0t6cTlU?=
 =?utf-8?B?elFXOFdvMlVoVGV5SXFGQTRIRWxLK1VrYkwxOWw4clRaVnVOQ01XckJXUEV0?=
 =?utf-8?B?TjNtZEJWZ3FlQjZTRnhzL1lDcGY0M3JxNVFZd1oyNlE4RXlwWnAvU1AxTGY1?=
 =?utf-8?B?Z3czcHVEUXcrSFAxcXJ3V0ZjQkZiMXVFYVlYRE1YRWtYUkFZV21FUVdVeFlj?=
 =?utf-8?B?TUtaSWRZYVlNTkdzL1V4L0pjVmYrRGxXR2FsSVNWb3MweWFkbmg2Vk1LUWFh?=
 =?utf-8?B?VzJmM2hnNmJJbmFnbE5mbHp4M0lIY1J1MVF4Q2JHNEYrbHN4MzRqMkdXQTgz?=
 =?utf-8?B?cjM2V2ZVWTR4UXJiblZPNlQ1T2xrcDZZUnFUeUFWdGlPZU12UmkzOHFOYnda?=
 =?utf-8?B?VVhPamtiQW9tVzl6RFhRZmYxcG1PVDhrdmpjblkvWW5GQ1c3VDZlL2RkQXhp?=
 =?utf-8?B?aVJpU2phY2NId3pnWC80bVBTcVdXK2NyWkRLN1J0eXJTM1JSWlp2ZEl0d3c5?=
 =?utf-8?B?YkFsRm1PaGhLOGxzcWdYMmlNMXJmSEVsYzIxejk3U1oxMjR4MWNLZmRBYy9C?=
 =?utf-8?B?eW9DWkhETUtNNkF5ckRhT2p0dmE0T3R6YS9QWmdhWWZNam1GNk5Xc0J3bGR2?=
 =?utf-8?B?NWRHaHpGS294bDVhVFJlaDVuY1BNQjZLZGNMak5oRGo0UXBmM3daVjRSeExo?=
 =?utf-8?B?dzRMUmo5SE5KL0tuNTVjTElHQ1VoY1gzYkJSdmM5WTZkVWZqbm9KbzIzUzIy?=
 =?utf-8?B?eWNZMUtEMTViZVQyaW1DRHRySThLeWthZDlpK1JrKzhZM0JuQ2YzVGtDbGdt?=
 =?utf-8?B?UUJWRGlBNDh2b3B4ZXFVanI4ZVRnRzlYNGFaSW1NVGRXMEF3NG4yNWZBSGUw?=
 =?utf-8?B?TUxNbE40a3VJeUtOeHBtT2RrTllmbDRJNWVIWkNKaURDa0hiODZoQUppaFdn?=
 =?utf-8?B?SmU1WDRQQzkyalBJVHVtVVNEM21vbVVDYktQWk9RVG1ITTZtczZLTm1IMkNJ?=
 =?utf-8?B?Y2ROYXdEUlhmY1lrTWdiSkgrU29VMitxU3pLdXBTUGtERkw2ZlBqSHFqQkxK?=
 =?utf-8?B?cTczWUMraUJpekdIanNFZ2xJQUVzNkJxbXBwUGhoeEpVMHJKUlZoVGpuZUIz?=
 =?utf-8?B?cmlYQVh3ZGV6emlWQlR4OTQ0QWxlN09mUUkzZ0JUTklqNXZJNU1VUWExSG11?=
 =?utf-8?B?MVowdGxTVWR6R3h1VUZVQXZRYmcvNEtzTGM5eXh2R2pybG9IY3BORWtlWkpl?=
 =?utf-8?B?cXRqYXc4dGlUK3RSdnhrUVYrcGlQVGxjZUxhbkNmZ2JMVDFObm5BQU5yNGp0?=
 =?utf-8?B?Sk1LMjkyWTVpTXdDK3BKQStxVjhpWTlHYXpHWElWTkw1VlBXU2d6b25RMm5Z?=
 =?utf-8?B?cDdDVTZ1TTdpbVVIWEhXTStBU2RYQVFYdUxRYTFzc0QvWTNjcVNWeTRwWWxN?=
 =?utf-8?B?UnZFTFhzNnM0clBwUDRIaG9MMis3VEFQTlpEcXkxN3VZZEU1NkdFaGsvemVR?=
 =?utf-8?B?V3h0ZDlxL2FQYlRqaEorOTU0bnZjdkMzQ0t0aitrb2VQN0laUVJ5MHNwWGRh?=
 =?utf-8?B?OWxxcFZYYzBORzJaVzhINXVPWFl6TTJ0QmdmeUJKQ1A3WHNJRVk2eHFqazM3?=
 =?utf-8?Q?oormdcNmBdsxGKc67RHSR5JhR?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	CRJ/tcHdWVNGtns628PeM4ur+QoAA3kp6T+wqBaBY1p1OiC56wfum/VTX/NgbP/rlFEU6TTUl6a94YoK1alIzcmefGKjK/ksvakRGDvcQ1myjF7mQ22xX6fKJoVPUEVAwTlUzLoTufRdc9e8v6ALRj517PB+uSVe+z06WoxkmPmOTstnVrMcH5VolfqRghaL5u4LUDgRx5cBgZ7eweg/D4Aa4L8Xf/N5XB4RdL6Im4jhcxc1BRI+oFM0shZ3inIN8Js9IkqFGtd87czGo9CPdJOid70qtllJDCyT5AajE6agGwXdk88ffZihktOZxSD2enbTtXb2SQSAcdLhWELSeXs1DuZwf4ENI5mhyGOm74m/U87eUScboig/06tyPN9a/AH8Xdz6jovBmn8uQSGXmXOsvFRetP2SGh17IDZBvKkaBb/U0ZPzzS7YhWm0QvtLR4K7nAk6rLzo49QsHa8I8lGCtyEVMFuILQpbgaFK+zprZTvu5esMPDaqGl89WgDoO7vfDuaykkfmvXeja7d/Kq5d9mAI7YIZGilDPMcwddzp7UfvLoc6k13WBi8wTzCdXG3fVejg7d5fqv4bBJh8EsX8cAzYbf/j2/CpAwuwvjs=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 80bcc446-0752-4310-3318-08dde72581f9
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB5647.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2025 17:57:23.8675
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fZHpNIoF/hhWQ6FRVwkPt1I2MIqHTYezIt16+JzTPvTjpwnKGqr8SnQGtZHsPMzbn+De51H0I1x3dY8gAXNApA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH4PR10MB8049
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-29_06,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 suspectscore=0 spamscore=0
 phishscore=0 bulkscore=0 mlxscore=0 mlxlogscore=999 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2508110000
 definitions=main-2508290157
X-Proofpoint-ORIG-GUID: KPnJUjQfJP8gAUp6-JyW_E-QMowlCLgy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODI0MDE4NCBTYWx0ZWRfX/MZZXyctBPVD
 5Kwo8OuqYMgQzcoyAwEMJOqtn2zBpjHYC8aOtEgRsv/Z/sVxPfZSNcTLgKgoD782PHSRH+QXf2r
 DXSHGF9Ht3KjI1pqVnXeQYheqT9rjU4pInXa1l52P9wuuDaFDaCcCqdl8njU8wiMJ/DC18eVGkn
 O5030ND7XOIlLQ98+1IltFcfXCysSK9Pv7/38XQ47UBx9QnwGlgxkvkY1qwvEK1t8tkmmckkgV3
 pWyH9dp1yxUA3mSGnvzbWW96T0axxI5QO9yekNw/h4l/R3WQ0FbNqtf1agcMwVDZSULsYNlYdzh
 LKdVYc4uZTmTXtgzTeKU5XiAwdZ1nZ4+VWvGiOH0aE1MQstcw0NDVAQb6RgHqup/wTn0yMnF0a/
 lJNrlxWZ5sSya7XMXpI9NoM+Rhu5ZQ==
X-Proofpoint-GUID: KPnJUjQfJP8gAUp6-JyW_E-QMowlCLgy
X-Authority-Analysis: v=2.4 cv=IciHWXqa c=1 sm=1 tr=0 ts=68b1ea0b b=1 cx=c_pps
 a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=GoEa3M9JfhUA:10 a=Ej3uMknbXuVyhm_9PtYA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 cc=ntf awl=host:12068

On 8/29/25 04:24, Alan Maguire wrote:

> This series adds UDP provider support, where the probes are
> implemented via underlying raw fbt probes.
>
> To work on UEK6, the following not-yet-landed patches are required
>
> cg: fix offset for > 8 bit bitfields in dt_cg_ctf_offsetof()
> Convert ip6_finish_output to rawfbt

Yeah.  I just thought I'd highlight those two dependencies.
