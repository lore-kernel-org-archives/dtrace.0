Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC5C91C5F39
	for <dtrace@lists.linux.dev>; Fri, 29 Aug 2025 03:11:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756437071; cv=fail; b=O4MeIsXjww1uEjYfku2rWchmX6AlvY17b9N2cukTxEu4klbUCNxzNfJTe0hm+ctVy0yN6gIayX9YC81c0X6bj2NxGXkKB4ITlAyWzMkq/e7Zf61MroMRnJv3MIyzGfmldH4uQsdxLr0cTsn1dezYhERGPZdkVQAvzAnhhPpdQp0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756437071; c=relaxed/simple;
	bh=dJFr32TA9GkxUQ76fA5tOBYN8VqEJ/Cz4wYQzJMamvk=;
	h=Message-ID:Date:Subject:From:To:References:In-Reply-To:
	 Content-Type:MIME-Version; b=CwnNAiJbSfSQqAf3a9iXzKh0t0wj0tlXcj5LeTOtMzvs2S93cWWS57URy1wXhD4F+f48K6+C6OeD96Bs503K3GYTasTqrlc0NKSKx3EEa7SpCJZwm55syWkjyBuBvSePMNG8bEMD63ozidmPvdZXOKtz+fzHI78xBGlwOkomo70=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=TOttI2xI; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=GCw/XHp7; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="TOttI2xI";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="GCw/XHp7"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57T1haOq010690
	for <dtrace@lists.linux.dev>; Fri, 29 Aug 2025 03:11:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=B54keQyUrEAjmIhobcZ6lod+RoAklw1v5fYaGZBjkj8=; b=
	TOttI2xIw50nRWVwgTg/nLkG++QpKlt7/KA/msI79zMEmDMqbVK0BO0gv44sBqXx
	zE0uiN738mi47EOHkMsb0hwjQXyZ64iXWdk2LyvL52peU2xpJ1hIYw4/qrS2bY6t
	Uca19njeFPLxPLb6wOJqw361FsWojKFSDtDhTdI53gTWQ1hWbMuFUR6jA3wABvaW
	3ssC1wKCgf+bPaRHu3o6sOmO9wMDd4mkjsPdyhXAkmthlIsP47GNdWs6XWdUnbc6
	iloxSCxHA/gpPk4Ro18ZqauAALUQvSaZ4x7VaTF+H+muthS/NTmjeD6Jkdn2uyFk
	1qYOl3vpPTeyPZ0i4IKOhg==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 48q4jasqs5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 29 Aug 2025 03:11:06 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 57T2OiOx012140
	for <dtrace@lists.linux.dev>; Fri, 29 Aug 2025 03:11:05 GMT
Received: from ch5pr02cu005.outbound.protection.outlook.com (mail-northcentralusazon11012061.outbound.protection.outlook.com [40.107.200.61])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 48q43cmjdy-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 29 Aug 2025 03:11:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p/k77p5niqg2pxIbd4JsbRWWrmtY0WjmEqvT51wCTjUmQMPpDDm34b5m0NA7a13KY9ia3xZIuwx8jOERGSJkejeQxeKWooBH0pNsx6WR1r8cAzqwuAP5K1uA+8PQnIUkGwNM8pfi3g3dDjjbM4khX3y/QATbGVYTb4bOV7LCz4qiSqbe9w5CYCBhS752xNTkiL4Yg/JfFZXl64DvwFqYDYDfAPiYhoCVK9auDrUwcCzH3JgZYiNhcoCyOyGBSGonMaP+3UGCKelrXeA2Clsj5enVVA3GqahKC45RiTEnc4/QiHkXX8FjOUNfTdTlcfIB6ptpHXmVW9Ve+rGvyzu1NQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B54keQyUrEAjmIhobcZ6lod+RoAklw1v5fYaGZBjkj8=;
 b=YJQdBFXrGJuVfRs2Ry7zW+AahtLHi61o61DduNr5dXdIK76wGlyWyOOHiydiRfK2ZiiFcae6+UNIRIPjU6qDVW9YlcYx7Or9R7gIZ3j/2UU8MRwhfH+IVZyCJb8gS+b7upJ9Rb3/J+n3rGp3qD15TzjbG6GjIekadjYVkOEW7x+yEnrpBLmN4Z4EGkZvRvypzDnFJIhgqZkqtABEJiujRkuc2jd0zgPfJ5Hrzl/K5hMfmXvfi/gruWULy7Uii8y7YsohokFhoQJev1WgD1Q+f8vAq462wdCTJPacZqcNY9OozJGiCaJzNI4sVniFNeMflokcDG56gg8e2LlVpRVm0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B54keQyUrEAjmIhobcZ6lod+RoAklw1v5fYaGZBjkj8=;
 b=GCw/XHp7XndMcuu7qjwEgv3gZpCRjslaxiiX/5MIpc78rMZdkQE8/uNhATR6QXV/sZnrJcV8lhG/+S/Hxf0az6iol9mt069O+NNrFe8tm3syKNj2Vvkytms6ivhdfyqZfZbMB5zLBmDswuoxM/ik148h2h156xhIhExNXglz/3E=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by BY5PR10MB4386.namprd10.prod.outlook.com (2603:10b6:a03:20d::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.21; Fri, 29 Aug
 2025 03:10:58 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%6]) with mapi id 15.20.9073.010; Fri, 29 Aug 2025
 03:10:58 +0000
Message-ID: <1b742f0b-8397-dee6-6363-7ecd05530564@oracle.com>
Date: Thu, 28 Aug 2025 23:10:54 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH] examples: include a first set of scripts and a README
 file
Content-Language: en-US
From: Eugene Loh <eugene.loh@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
References: <20250829020758.2691-1-eugene.loh@oracle.com>
In-Reply-To: <20250829020758.2691-1-eugene.loh@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BL1PR13CA0118.namprd13.prod.outlook.com
 (2603:10b6:208:2b9::33) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|BY5PR10MB4386:EE_
X-MS-Office365-Filtering-Correlation-Id: 766af5a8-ff9f-464e-632f-08dde6a9accb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?R0NxWnBVZHAyQnVrbFoyUUpmYWt0TUhERHZ6QTkvOTN5c2h6eWx4UzVWMU5N?=
 =?utf-8?B?QWdxWlNIbE9NN1hVZ1d1MVA5c08yOVA2ZlVGckR3L05YSlhVbmZqMlFmak9k?=
 =?utf-8?B?eTBlbmZ3UDQ3L3dQd1VYTTFiVk9LR21rL3NlMUtlcUFaeG1XU0txOXpvdHN2?=
 =?utf-8?B?OVRZU3RNTUVBOEhlWGZWdmc1Tk5FOVpxdWhpcnVyeC81TWIzcHloRmtQYUtL?=
 =?utf-8?B?SlBEVEhzWFRqKzV5WlBVcmxmYXVPTmllS01mMUw1U0U5ZjhIYTNldWhZczFl?=
 =?utf-8?B?cDI4Wm5uMGV4ZE1BZVEwWE9xL2ZJNjZidGZHa1BPcGI0azNkOElJZll2OGdJ?=
 =?utf-8?B?dXplbzQ3ZTVaUWJlNzdiSmVUalRkK1l1LzhQRGV2UVhOTW9nMlM5ZUVhY2Fy?=
 =?utf-8?B?ai9mWWhLQ1pJMi82ZWNHSGNELzF1Z3dReWlrc2NPYmU4OWNLZGlFb3ZxbGQ3?=
 =?utf-8?B?VUlQQXFpWjhGUHNOc25nejRyYzJRa2VTWU91OXJNclJ3V01vYUxPaFRVTFEx?=
 =?utf-8?B?WWVGQTBDd3EvUFRzZUw4OTc1SXB6Tm82UDNmQUdCY2hlNmN4Z2FHZVN2SWdM?=
 =?utf-8?B?TFN4Q0tDbENHZ2x2dWpxdlJkaEsrbW5EQ2tmc1Z6VjRwdlkyVVEyT2dNWGhx?=
 =?utf-8?B?dWlkVG4xbTBSS0VmSVN1Qjd1U0JzQ0xUSmhhb2tpWmRGa2VTNGUrdnpvVm5k?=
 =?utf-8?B?c2NhaWFoQ2loRHRpZFFhMldvWFZqR1pwNGR2ZmV1OG00NUkwanY2MTJTSGR2?=
 =?utf-8?B?VTlXUTJrVlZOOER4bGhZUWJ4YUNyS0N4aExVb0JHOCsrRU1ZZFFPRXl0ZjNJ?=
 =?utf-8?B?a1o1S200Y0NJT01FYlVTbm56aWtoZS9Ua0lCMkJzeHRHRHF4VkI2UjNFeVR3?=
 =?utf-8?B?T1YzVDlyMk5XSHNjNzZROEYvaDhMenBHejlabTYyemYxdUpON0Zza1ozMDdI?=
 =?utf-8?B?Ny8xcnJRU1NjVy9hc0VxemVOVnQzd2JlbDZXTm9LdStEUmVGeGhIWG5yRk9o?=
 =?utf-8?B?akRBVTdOcFlVM05UMFNiQ1F6ODd0MHlxQWd4TkhXRkJkVTlaZ2c2UCtFbHVt?=
 =?utf-8?B?S0lmeVpNRTZaazFzeDJHN1FBSy8vOU8ra29XdjZJNEdEbDNhRzMxd3R4K0JK?=
 =?utf-8?B?bStuTUNKcGxYZjZTdU9uZGhjanh3dDI5bmoxL0dMUnk4QUsxZDNxM2RhOWta?=
 =?utf-8?B?cjZTWVhEYm5rM0hoUU9UVFpoZVRiOTJacTV1MlNxRjVpV0Z3NWY1MTI4bE5z?=
 =?utf-8?B?Yk1SNW5RQkUySko4Q2YzT1hOUUNQVTBPZGxpcnc1dnFuUnBqMllCUWVqU2Nw?=
 =?utf-8?B?VndFOGNjWDR1ZUdISkd1NHBZVnRDdzBpb2pZTjhzMXNWandtOVhUTGdvT2xi?=
 =?utf-8?B?NG4yRnFsdWM4UFN0SS8zN0FZcEF3ZTJ3cTJBb3Z6UFhDNWwrd1Y5Z09sTnhV?=
 =?utf-8?B?ekp5L2h5RHNCRjIzOEJMTEFhMHVnU053ZVB0M2h4WUFBS3h3WDBLRnFBQTZy?=
 =?utf-8?B?Wmx0OVdQVHVaMkYzdlNmTUtRaDNhdWdrMy9pZ3JneGx4cFJKNDBhcUE3UFNl?=
 =?utf-8?B?dlliNEx0TG5jUzVSaXMrTXpqTW52ZmxET2ZsUmFQWWpad0dLcVRBc2tGQThS?=
 =?utf-8?B?Yit1aUJkOXp3cmxkbGlJdEV6STgvZTRvWjVjSUMyQkwvakl4bUtaS0duc2ha?=
 =?utf-8?B?Z0xzR2dUNVBDc3pjc3RNc0JKakFXR1h0bG5RdzhvWnNhRUNHb0ZudndVaFBm?=
 =?utf-8?B?Tm16SitQMUFucWZMTktFWjhKNzVVamJRS2MxR0NXaHdoa1BrNWZJQ3ZuNkNV?=
 =?utf-8?B?ODgxbVBnV3BDay92RElmMmYvd21PWkttWjcra2Y1RHpUcitONjlOWVhhUjRk?=
 =?utf-8?B?UEc4bTBIa0cvd1FjR21xREJYNURZRXB2SHhOcExFa0NTSVluMFg1d25wQ1Yx?=
 =?utf-8?Q?0t8LTKfitNs=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Q1QzYTNxZ2RrOVZpUTVIbUdrcU1EU1MvS0Fzb1gzOHo0QlBtNEVMQzJHeG9j?=
 =?utf-8?B?QXJBR3c2TzZOQ1I5MmZOdmk0Y1kwN2lzTHprak9USWhtT3Y4bTVyYmxhaEpW?=
 =?utf-8?B?d0JxMVdhT2YzakpYRW82SWhRNE41Q2x2cDFvVWthOUZQM2lhcHVzRDA0cVlQ?=
 =?utf-8?B?Um1vNW5hc1A4OUlhNWpZaEJpLy9nSzhiQUsva2VhMytLTFg0THFpbzZnMG5t?=
 =?utf-8?B?Njh5VEZHUHMwTTMxSWpqd1Fvc1ZIZytSYzliSCs5UjVqdDBidlVDWEFraFhM?=
 =?utf-8?B?VUtpb1prNkFWVVRyZzhVd0VWbEdETjlNeWU1aXNrTzVpY05NbWJKb3hzVFU1?=
 =?utf-8?B?eS9GVHVQUmdYbDBDaFlXYnhWRnZoeERCNzRJaG5ENVBJTjk2ZlN3ZzlaUjRR?=
 =?utf-8?B?Yk1qZGRhZlJNM29BYkRTdVB3WE5Dc2hUSkMrMllZWTJYWjZwSFZ0MVFHR1ls?=
 =?utf-8?B?RU9ER0d4NkU5MmNvQmdXRC9RRVhZQXEwcFhJMEdaekVUZWhjVG40b1JVMkRk?=
 =?utf-8?B?SzF4SjZ3R1dpVHAwZlZBZzZETXNMUjNTbHY1Tm1VYlZmenpxRE1vYWJ2dElj?=
 =?utf-8?B?OHFGSWdvVzc3V0llR1p1NHRBeENMTU9GMW5TdDBpL2tvanBZaXJtMDUzME80?=
 =?utf-8?B?dS9lcWcwTXBuZDhjQklLMEI4b2ZqSURDeWlNZUw5SHQyVWRxTDVQa3ZZUVZt?=
 =?utf-8?B?UU14dGZrRU1jUWhCcnVNTGw4SkUzenBMVWNvVEU1ZFFSWFFzayt5UDVyUkxt?=
 =?utf-8?B?VkFpRFpTcWNQNXZyVzBINlN2ZFFXUXlPeERtdlN0amFndmY2S2hlNlFidXNB?=
 =?utf-8?B?ek9Zc0xvdVJOWmhqT3ZXaWdyZ0hBc1E2NzB5K0l5clR4bEt6UkVyUUgzRnNz?=
 =?utf-8?B?RGlXNDZDMm8zUng1SzVQNFp4cDB6V1JxS1JPS1NVVDhQTXhMUThOT2xXNW84?=
 =?utf-8?B?aFZlVUhmWTQ2enhENlh5RGJPZHFxSDdxV0FLUWI1dVM3SGVVSDBVbTNPWTJP?=
 =?utf-8?B?VGxjWWowUVB4clBnS0JGZXM3NlRqS0krZmZzeEZGVFdUd2xsN1NtNlF4VDIv?=
 =?utf-8?B?MDdpUmFxT1VRWVRnTjYrdVZFMkU0dWJWZ0thT1UzMDhzUDZTdWJNLzk5VWpS?=
 =?utf-8?B?VkdWK1A2QUtva3V4c2lUczc5VnhYaWpJbXFxeVk2SldqcFdTbFdldjBCc1Y1?=
 =?utf-8?B?emRpTHRuQjNuNzJ2TXl0R21yVFY0Ym1JZ2dMYjJhV1lCaGlseGJ0M0Y3M2Ur?=
 =?utf-8?B?WStKa25jWFV2SXJSbXlSbnpHbVFlL292S1lyRkZWeENEMi9vK0xnUVdpcHRW?=
 =?utf-8?B?YTV5RnhIMFpCS3ZCVWVka0F0OUU1NXYxTGN4dUlKMkhZK2c4d3BTNVBGNHV0?=
 =?utf-8?B?aUlVRFdTeFJxR3kyNDhEcHZWaUwyQmcxcWZOOTZYZEI0SnJuaW1qTExudGs0?=
 =?utf-8?B?Z3ZwQUFlbXdBRnczdVp3c09jVmFYQVFScTVxVUd3SDJyb0xNOU5BTi9kN1hj?=
 =?utf-8?B?dkVabEU5L3dkRVE0clZXdmp1bnQvY2huc3B5WFlmS3l6bTZWRklBaDlwNGY1?=
 =?utf-8?B?Q2hiQ3VmR25XTFZJR3NrYjlKOHpPRVhtRnlyYVQ5dUpoenMwNzhyUldmVEhP?=
 =?utf-8?B?WnREMThDY3pGSm5UTHZjT09CR2xtMmlKS21ScjYzRFVzVk5HR0RxWGtrM0Qr?=
 =?utf-8?B?QzIzTGxpL3N1WU16NTJuWGhOZnAzc2h5NHVJNEdDNG95V2pwNDRqcDhQNVNi?=
 =?utf-8?B?M2p1WU5sU3VHaTg0bzZQMVFIdTdqWnoyeW0zLzl4eFNwUDVpZHd2cW03aHhn?=
 =?utf-8?B?YnZOQ1lEZFJ5bzVqUUdkaVR4dHVkcy9CN3NsSldBM05yc1dpcitiY3dBOVhK?=
 =?utf-8?B?RGd6eWt5WnlMT1NXditOQUlYUTJTT2VpL0VQbEQ5dnFDd1kzNXl0VjYrNVo4?=
 =?utf-8?B?YVpiemxESzJrRUVwbWpvU25mV2ZrV3BsWkRvOG5CcFpMOHUxWGFwUmRtcE8r?=
 =?utf-8?B?eWxwa1pGdjJhM1dGRjJDVHBEaEwxRnMzb0U0U2xBSnJUa3lpdHVWZUd0SWJP?=
 =?utf-8?B?ajVPZnQzU3RaNTJqUUtoMzJRTTlUYm9oak1NM2VRaG40NWRJOTAvV3prMlpB?=
 =?utf-8?Q?fwYApkh2ByvSE73ZZMRfcqukC?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	V8ap+R9U1hMgSxOQdjJLFvmqAPB510RaMqdHQeW9kyzU+vuWk/HDZEyfk/kwMFFJGEucid8vtZmBaiOcX/JvQv+/oYr7v3MUQmNfj9haDxh926vjqKBcPojY/B+OvXj1IYiwHt0CqwFCoWfOVYXGHIM/SP1IXH9X8fRUY4vulO1X7si+Pj/7+7NEPAfLjT8sCaoc/gVVJCIfVbzX1RwwFMcNCm2tn2hXpFvRAJRrLegdCqQ9Sp+XQ9mhmu1VsQLhzWZBwxGq+kbZwjqhkUL0tB0+CVNRmrMzcM1DDg+X0wFVbQnwLl8/Blj6Bv3D1mlILDy7wTorfozDcJPFTkruUcp0szlKOo0mU2FKsZI1CFSo39GdVK85i/xJGg3NCQKWZO0VPfyPWOtmWkteaoR53T2hZaDtl1k/EJeBud5XRH7mUtz4AcOeUx1VXuXeVQbjKSqY0AMFU2Vvv0+xix/+pvyGxd7FfgSajxCWYW7ArjAe2DVwopWvl+H9pnRe9fg9fK/bhtPIQlXq5fflARMTm0WBznHpnYsKj+NjjCzt1+lqqHgP9uf5H6ZKzoJyVnH4bAXhcniYOY/LzliwJCFrG2ChRJWAbY3j9tmGE/JWROc=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 766af5a8-ff9f-464e-632f-08dde6a9accb
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2025 03:10:58.2213
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cDQUj/4KGrURxd2OFGqVjSFnSzHf9GZr1SA+Ob5N+4/WgtL8dWEBPqojPk7PfSijKVut1r4+0cSS19XNmsX08g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR10MB4386
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-29_01,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 malwarescore=0 bulkscore=0
 adultscore=0 mlxlogscore=999 spamscore=0 phishscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2508110000
 definitions=main-2508290025
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAxOCBTYWx0ZWRfX3mxHrdkTSSqJ
 q+Lxtgn+VFAVJSlpnp21XfsOM/L/HPotsLoWc0Nnva/0E8DyteQBTs+FFUeblC7a0soeRYdAK1Y
 TZw7kfMvMxauKl43ImYkTVneIz+IjMDv9LMueCZ7AT5qKDGzoBIPub7oQ9Iuk5MVnZrLUoG54u8
 VN/0+8ErYoFuJ2KWgh55PO4hd3mtjMbPyUtylRsRaTFsYP0v9fXhY76TL/tmH6hT1vIYCl0sfFE
 dQKrgCXXR0EHYxqNAgRxM8QLpF/RFhn/aYwYBJWd+SLgHE8Iv1lKttLW+OyKYF544KOmr90OWKy
 r/lKSh4Funsbu47b2J4uQ1depBF75mu0DGw3f0O/FBsdrPHogp8iCDKWL8XspBVbsiqTY8JUoG3
 A0Uolub88c/vvq0FHjZhlZPAxkZHUw==
X-Proofpoint-GUID: cqttN4jURlgIdSpIfqN5OoBrbMQxAYec
X-Authority-Analysis: v=2.4 cv=IZWHWXqa c=1 sm=1 tr=0 ts=68b11a4a b=1 cx=c_pps
 a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=S8VyNBHPMDSX4ipr:21 a=xqWC_Br6kY4A:10
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8
 a=BK1sVtWreuGvXp3Y6_cA:9 a=wFXZFaBJI_SbMliC:21 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 cc=ntf awl=host:12069
X-Proofpoint-ORIG-GUID: cqttN4jURlgIdSpIfqN5OoBrbMQxAYec

Reviewed-by: Eugene Loh <eugene.loh@oracle.com>
A kind of quick review, but they're good examples and do not need to be 
held up.

PS

1.  examples/thread-ids.d

I see code that basically looks like this:

     pid$target:libc.so:pthread_create:entry
     {
       self->pthr_id_p = (int64_t *) arg0;
     }
     pid$target:libc.so:pthread_create:return
     {
       this->pthr_id = *(int64_t *) copyin(*self->pthr_id_p,8);
     }

Under some circumstances -- like -p $pid and the script starts while a 
pthread_create() is running -- one might miss the entry but catch the 
return.  In that case, we get a NULL dereference of self->pthr_id_p.  
Not a big deal here.  In general, though, one wants to code around these 
possibilities.

2.  examples/sched-stats.d
    @thr_cpu_id_on_cpu[tid,curcpu->cpu_id] = count();
    @cpu_id_thr_on_cpu[curcpu->cpu_id,tid] = count();

    @thr_cpu_id_off_cpu[tid,curcpu->cpu_id] = count();
    @cpu_id_thr_off_cpu[curcpu->cpu_id,tid] = count();
I suspect the answer is "no" but could you have only one on-cpu 
aggregation and only one off-cpu aggregation, simply printing each one 
two ways (inverting the order of the keys)?  Probably not, sigh.

On 8/28/25 22:07, eugene.loh@oracle.com wrote:

> From: Ruud van der Pas <ruud.vanderpas@oracle.com>
>
> Add 7 example scripts and a README file.
>
> 2025-08-28  Ruud van der Pas  <ruud.vanderpas@oracle.com>
>
> 	* examples/fcalls.d: List and count function calls.
> 	* examples/io-cast-net.d: Show how to use wildcards.
> 	* examples/io-stats.d: Display I/O characteristics.
> 	* examples/sched-simple.d: Count on/off the CPU.
> 	* examples/sched-stats.d: Extensive scheduler statistics.
> 	* examples/thread-ids.d: Mapping of thread IDs.
> 	* examples/var-scope.d: Demonstrate scoping rules.
> 	* examples/README.md: Brief description of all examples.
>
> Signed-off-by: Ruud van der Pas <ruud.vanderpas@oracle.com>
> ---
>   examples/README.md      |  88 +++++++++++++
>   examples/fcalls.d       |  90 +++++++++++++
>   examples/io-cast-net.d  |  78 +++++++++++
>   examples/io-stats.d     | 280 ++++++++++++++++++++++++++++++++++++++++
>   examples/sched-simple.d |  82 ++++++++++++
>   examples/sched-stats.d  | 191 +++++++++++++++++++++++++++
>   examples/thread-ids.d   | 168 ++++++++++++++++++++++++
>   examples/var-scope.d    | 121 +++++++++++++++++
>   8 files changed, 1098 insertions(+)
>   create mode 100644 examples/README.md
>   create mode 100755 examples/fcalls.d
>   create mode 100755 examples/io-cast-net.d
>   create mode 100755 examples/io-stats.d
>   create mode 100755 examples/sched-simple.d
>   create mode 100755 examples/sched-stats.d
>   create mode 100755 examples/thread-ids.d
>   create mode 100755 examples/var-scope.d
>
> diff --git a/examples/README.md b/examples/README.md
> new file mode 100644
> index 00000000..de4ba090
> --- /dev/null
> +++ b/examples/README.md
> @@ -0,0 +1,88 @@
> +## Synopsis
> +
> +This is the README file for the examples directory that is included in the
> +DTrace distribution directory.  These examples are meant to be learned
> +from.  They can also be a starting point to explore changes and enhancements
> +you'd like to make to these scripts.
> +
> +## Target audience
> +
> +The scripts target a wide range of users.  There are examples that are
> +ideally suited for the beginners, but there also scripts that are
> +probably easier to understand once you have some more practical experiences.
> +To make it easier to select a script suitable for your level of experience,
> +we have added a level indicator, but please do not let that withold you from
> +looking at other examples.
> +
> +| Level | Description |
> +| :---: | :----       |
> +| B     | Beginner - Only some basic knowledge of DTrace is assumed. |
> +| M	| Medium  - Some experience with DTrace will be helpful.     |
> +| A     | Advanced - Practical experiences writing scripts is recommended. |
> +
> +## Installation
> +
> +There is no need for any additional installation instructions.  Use the
> +examples as provided, or make changes as you see fit.  You can do so
> +in-place, or get a copy in your working directory.
> +
> +## Usage
> +
> +Each script has a usage line that you can find under SYNOPSIS in the
> +top part of the script.  There are also extensive additional comments.
> +
> +In the comments, we often refer to a target application, or command.
> +With the latter we mean a Linux command.
> +Most scripts can be used for either, and also work on a running process.
> +Please check the comments though, because some scripts assume there is
> +a program called main, for example.
> +
> +The command given in the SYNOPSIS section may need to be modified
> +according to what needs to be traced:
> +
> +| Option        | Description |
> +| :---          | :----       |
> +| `-c <command>`| Trace the command (or application).  Tracing ends when the      |
> +|               | command/application terminates.                                 |
> +| `-p <pid>`	| Trace the process with id \<pid>.  Stop the tracing with ctrl-C. |
> +
> +An example of a script that can be used for both is `sched-simple.d`:
> +
> +```
> +$ sudo ./sched-simple.d -c ls
> +$ sudo ./sched-simple.d -p <pid-of-target>
> +ctrl-C
> +```
> +
> +## The examples
> +
> +These are the scripts included, plus a brief description.
> +
> +| Script          | Description                | Level |
> +| --------------- | -------------------------- | :---: |
> +| fcalls.d        | List the functions executed by the target application.  |B|
> +|                 | In addition to this, the number of calls to each function |
> +|                 | is printed.  This information is given on a per-thread    |
> +|                 | basis, as well as aggregated over all threads.            |
> +| io-cast-net.d   | For the target application, show a list of all the libc |B|
> +|                 | functions that include one of the selected keywords       |
> +|                 | (open,close,read,write) in their name.
> +| io-stats.d      | Show statistics for the fopen(), fread(), fwrite(),     |A|
> +|                 | pwrite() and read() functions.  There are several probes  |
> +|                 | and you are encouraged to experiment with this script.    |
> +| sched-simple.d  | Use the sched provider to count how often the target    |B|
> +|                 | application, or command, was scheduled on and off the     |
> +|                 | CPU.  The information is given for all individual threads,|
> +|                 | as well as across all the threads.                        |
> +| sched-stats.d   | Display various scheduler statistics for the target     |A|
> +|                 | application, or command.  For each thread, a histogram of |
> +|                 | the time on the CPU is shown.  Plus global statistics,    |
> +|                 | like the total time on the CPU, and the minimum and       |
> +|                 | maximum.  Those threads with an on-CPU time below a user  |
> +|                 | controllable limit are listed.  Also the CPU IDs and the  |
> +|                 | number of times a thread was on/off CPU are given.        |
> +| thread-ids.d    | For a Pthreads application, show the mapping between the|M|
> +|                 | thread IDs as created by the Pthreads system and the      |
> +|                 | thread ID as returned in the DTrace tid variable.         |
> +| var-scope.d     | Demonstrate some of the scoping rules for global and    |B|
> +|                 | clause-local variables.                                   |
> diff --git a/examples/fcalls.d b/examples/fcalls.d
> new file mode 100755
> index 00000000..f4973a89
> --- /dev/null
> +++ b/examples/fcalls.d
> @@ -0,0 +1,90 @@
> +#!/usr/sbin/dtrace -s
> +
> +/*
> + *  NAME
> + *    fcalls.d - list the functions executed by an application
> + *
> + *  SYNOPSIS
> + *    sudo ./fcalls.d -c "<name-of-app> [app options]"
> + *
> + *  DESCRIPTION
> + *    This script lists the functions executed by the target
> + *    application.  In addition to this, the number of calls to
> + *    each function is printed.  This information is given on a
> + *    per-thread basis, as well as aggregated over all threads.
> + *
> + *  NOTES
> + *    - Since a.out is used in the probe definitions, library calls
> + *    are excluded.  If a library like libc should be included,
> + *    duplicate the probe definitions and in the copied lines,
> + *    replace a.out by libc.so.
> + *    For example:
> + *      pid$target:a.out::entry,
> + *      pid$target:libc.so::entry
> + *        { <statements> }
> + *
> + *    - It is assumed that a function called main is executed.
> + *    If this is not the case, this is not a critical error.
> + *    The first probe is used to capture the name of the executable,
> + *    but this is not essential.  The probe and printf() statement
> + *    can safely be removed, or replaced by a suitable alternative.
> + */
> +
> +/*
> + *  Suppress the default output from the dtrace command and have
> + *  printa() print the aggregation data sorted by the first field.
> + */
> +#pragma D option quiet
> +#pragma D option aggsortkey=1
> +#pragma D option aggsortkeypos=0
> +
> +/*
> + *  Store the name of the target application.  The probe is restricted
> + *  to main only, because the exec name needs to be captured only once.
> + */
> +pid$target:a.out:main:entry
> +{
> +  executable_name = execname;
> +}
> +
> +/*
> + *  Use 4 aggregations to store the total number of function calls, the
> + *  counts per function and per thread, both seperately and differentiated
> + *  by thread and function.
> + */
> +pid$target:a.out::entry
> +{
> +  @total_call_counts                          = count();
> +  @call_counts_per_function[probefunc]        = count();
> +  @call_counts_per_thr[tid]                   = count();
> +  @counts_per_thr_and_function[tid,probefunc] = count();
> +}
> +
> +/*
> + *  Print the results.  Use format strings to create a table lay-out.
> + */
> +END {
> +  printf("===========================================\n");
> +  printf("      Function Call Count Statistics\n");
> +  printf("===========================================\n");
> +  printf("Name of the executable: %s\n" ,executable_name);
> +  printa("Total function calls  : %@d\n",@total_call_counts);
> +
> +  printf("\n===========================================\n");
> +  printf("      Aggregated Function Call Counts\n");
> +  printf("===========================================\n");
> +  printf("%-25s %12s\n\n","Function name","Count");
> +  printa("%-25s %@12d\n",@call_counts_per_function);
> +
> +  printf("\n===========================================\n");
> +  printf("      Function Call Counts Per Thread\n");
> +  printf("===========================================\n");
> +  printf("%-7s %12s\n\n", "TID","Count");
> +  printa("%-7d %@12d\n",@call_counts_per_thr);
> +
> +  printf("\n===========================================\n");
> +  printf("      Thread Level Function Call Counts\n");
> +  printf("===========================================\n");
> +  printf("%-7s  %-25s %8s\n\n","TID","Function name","Count");
> +  printa("%-7d  %-25s %@8d\n",@counts_per_thr_and_function);
> +}
> diff --git a/examples/io-cast-net.d b/examples/io-cast-net.d
> new file mode 100755
> index 00000000..9a933b78
> --- /dev/null
> +++ b/examples/io-cast-net.d
> @@ -0,0 +1,78 @@
> +#!/usr/sbin/dtrace -s
> +
> +/*
> + *  NAME
> + *    io-cast-net.d - get an overview of read and write calls
> + *
> + *  SYNOPSIS
> + *    sudo ./io-cast-net.d -c "<name-of-app> [app options]"
> + *
> + *  DESCRIPTION
> + *    This script lists all the functions in libc that include
> + *    one of the following keywords in their name:
> + *      read, write, open, close
> + *    This is a fairly wide net that is cast to find out which
> + *    libc functions are used to open, or close a file, and which
> + *    functions from libc are used to read from, or write to a
> + *    file.
> + *    The number of calls to each of these functions is counted,
> + *    plus the total of all such calls.
> + *
> + *  NOTES
> + *    - This is an example how you can find out more about a certain
> + *    area of interest.  Wildcards and empty fields in the probe
> + *    definition are ideally suited for this, but be aware not to
> + *    overask and create a huge number of probes.
> + *
> + *    - This script could be the first step to analyze the I/O
> + *    behaviour of an application, or command.
> + *
> + *    First, this script, io-cast-net.d, may be used on an application
> + *    to identify all functions with read, write, open, and close
> + *    in the name.  This list may then be examined to manually select
> + *    the particular functions to trace in this application.
> + *    An example of this approach is in script io-stats.d.
> + *
> + *    - Wildcards are used and as a result, more functions may be listed
> + *    than you might be interested in, but in this way you will see all
> + *    of them and can make a selection which one(s) to focus on.
> + *
> + *    - There are no print statements in this example, because we would
> + *    like to show the default output from DTrace.  In particular, the
> + *    feature that, when the tracing has finished, all aggregations are
> + *    printed by default.  Since this example only uses aggregations,
> + *    it means that all results are printed upon completion.
> + */
> +
> +/*
> + *  These are the probes used to query the system and see those function
> + *  calls.  The first aggregation has a key that consists of 2 fields:
> + *  the name of the function and the module name.  Thanks to this key,
> + *  the results are differentiated by the function name and the name
> + *  of the module.
> + *
> + *  The latter is always going to be libc.so, e.g. libc.so.6.  We
> + *  have included it in the key for the aggregation to show how
> + *  to make a script more flexible.  In case the module name is
> + *  left out in the probe definition, or changed, the script will
> + *  still work and print the module name(s) of the probe(s) that
> + *  fired.
> + *
> + *  The second aggregation has no key.  That means that the count is
> + *  incremented each time one of the probes fires.  That will give us
> + *  the total count across all the probes that fired.
> + *
> + *  The output shows a table with 3 columns: the name of the function,
> + *  the module (which should be libc), and the call count.  The results
> + *  are sorted by the count.  This table is followed by a single number.
> + *  It is the total of number of calls that have been traced.
> + */
> +
> +pid$target:libc.so:*read*:entry,
> +pid$target:libc.so:*write*:entry,
> +pid$target:libc.so:*open*:entry,
> +pid$target:libc.so:*close*:entry
> +{
> +  @target_calls[probefunc,probemod] = count();
> +  @total_count                      = count();
> +}
> diff --git a/examples/io-stats.d b/examples/io-stats.d
> new file mode 100755
> index 00000000..30e1e64a
> --- /dev/null
> +++ b/examples/io-stats.d
> @@ -0,0 +1,280 @@
> +#!/usr/sbin/dtrace -s
> +
> +/*
> + *  NAME
> + *    io-stats.d - show several I/O related statistics
> + *
> + *  SYNOPSIS
> + *    sudo ./io-stats.d -c "<name-of-app> [app options]"
> + *
> + *  DESCRIPTION
> + *    This script shows several I/O statistics for the target
> + *    application, or command.  Among others, the filename, the
> + *    file descriptor, or stream it is connected to, the number
> + *    of bytes read, written, or both, are printed.
> + *
> + *  NOTES
> + *    - All the probes but the END probe in this script are based
> + *      upon the pid provider.
> + *
> + *    - This script is quite elaborate and has several probes.
> + *    More specifically, in alphabetical order, these are the
> + *    functions from the libc library that are traced:
> + *     close()
> + *     fclose()
> + *     fopen()
> + *     fread()
> + *     fwrite()
> + *     open()
> + *     pwrite()
> + *     read()
> + *    In the probes, we rely on the information from the man pages
> + *    for these functions to identify arguments of interest and
> + *    the return values.
> + *
> + *    - Not all of the probes may be relevant to your case.  While
> + *    no harm is done if a probe does not fire, the associated
> + *    aggregation(s) will be empty, but still printed.  This is because
> + *    we use printa() to print the aggregation(s).  If printa() is not
> + *    used for an aggregation, nothing is printed if it is empty.  You
> + *    can of course always remove such irrelevant probes and related
> + *    printa() and printf()  statements.
> + *
> + *    - A related script is io-cast-net.d.  You may want to run this
> + *    first to cast a fairly wide net and explore which open, close,
> + *    read and write functions are called when executing the target.
> + *
> + *    - All print statements are in the END probe.  On purpose
> + *    several different format strings are used.  This is done to
> + *    demonstrate the flexibility in presenting the results.
> + *
> + *    Note that we do not need to include these print statements,
> + *    because aggregations that are not explictly printed, are
> + *    automatically printed when the script terminates.  The reason
> + *    we print them ourselves is to have control over the lay-out.
> + *    Another thing we do is to print more than one aggregation
> + *    with a single printa() statement.
> + */
> +
> +/*
> + *  Suppress the default output from the dtrace command and have
> + *  printa() print the aggregation data sorted by the first field.
> + */
> +#pragma D option quiet
> +#pragma D option aggsortkey=1
> +#pragma D option aggsortkeypos=0
> +
> +/*
> + *  Capture the name of the file that needs to be opened, in the call
> + *  to any function that starts with fopen.  The first argument to
> + *  this function contains the name of the file to be opened.
> + *  As arg0 is of type integer, it is converted to a string, copied
> + *  from user space and stored in the thread-local variable fname_fopen.
> + */
> +pid$target:libc.so:fopen*:entry
> +{
> +  self->fname_fopen = copyinstr(arg0);
> +}
> +
> +/*
> + *  This probe is nearly identical to the one above, but note that
> + *  for this probe, the name of the thread-local variable is slightly
> + *  different and called fname_open.
> + */
> +pid$target:libc.so:open:entry
> +{
> +  self->fname_open = copyinstr(arg0);
> +}
> +
> +/*
> + *  This is the return probe for any of the fopen calls.  The predicate
> + *  checks that fname_fopen has been set and if so, in the clause the
> + *  count is updated and the new value is stored in an aggregation
> + *  with 3 fields: the name of the function, the name of the
> + *  file and the return value of the function, which is stored
> + *  in arg1.
> + *  Note that we can indeed access this file name.  Although set in the
> + *  corresponding entry probe, a thread-local variable is accessible in
> + *  the data space of the corresponding thread and so can be read, or
> + *  written, here.
> + *  The third field in the aggregation is arg1.  This is the return value
> + *  of the function and is the pointer to the stream.
> + *  Since variable fname_fopen is no longer needed, the storage is freed.
> + */
> +pid$target:libc.so:fopen*:return
> +/ self->fname_fopen != 0/
> +{
> +  @file_pointer[probefunc,self->fname_fopen,arg1] = count();
> +  self->fname_fopen = 0;
> +}
> +
> +/*
> + *  This probe is nearly identical to the previous probe.  Other than
> + *  the name of the thread-local variable, the difference is in the
> + *  name of the aggregation.  This is because the return value, the
> + *  file descriptor, is of type integer.  This means that we need
> + *  a different format string when printing this field.
> + */
> +pid$target:libc.so:open:return
> +/ self->fname_open != 0/
> +{
> +  @file_descriptor[probefunc,self->fname_open,arg1] = count();
> +  self->fname_open = 0;
> +}
> +
> +/*
> + *  This probe stores the name of the function, which is fclose(),
> + *  and the argument, the pointer to the stream.
> + */
> +pid$target:libc.so:fclose:entry
> +{
> +  @fclose_stream[probefunc,arg0] = count();
> +}
> +
> +/*
> + *  This probe is very similar to the one above.  Again, the difference
> + *  is in the name of the aggregation, and the argument which is the
> + *  file descriptor.  It is of type integer.  We need to know this when
> + *  printing the key.
> + */
> +pid$target:libc.so:close:entry
> +{
> +  @close_fd[probefunc,arg0] = count();
> +}
> +
> +/*
> + *  One of the functions traced, is pwrite().  The first argument, arg0,
> + *  is the file descriptor.  The third argument is arg2.  This contains
> + *  the number of bytes requested to be written.
> + *  The aggregation function sum() is used to sum up all those byte counts.
> + *  As a result, the aggregation contains the total number of bytes
> + *  requested to be written to the file connected to the file descriptor.
> + */
> +pid$target:libc.so:pwrite:entry
> +{
> +  @pwrite_bytes[probefunc,arg0] = sum(arg2);
> +}
> +
> +/*
> + *  The pwrite() function returns the number of bytes actually written.
> + *  This value is added to the existing contents of the aggregation.  The
> + *  name of the function, pwrite, is the only field in the key, so this
> + *  aggregation contains the total number of bytes written by pwrite().
> + */
> +pid$target:libc.so:pwrite:return
> +{
> +  @pwrite_total_bytes[probefunc] = sum(arg1);
> +}
> +
> +/*
> + *  This probe accumulates the number of bytes the read() function requests
> + *  to be read.  The aggregation is differentiated by the file descriptor.
> + *  This means that we get the totals on a per file descriptor basis.
> + *  We also store the file descriptor in a thread-local variable called fd.
> + *  A thread-lcoal variable is used because we would like to reference it in
> + *  the return probe for this function.
> + */
> +pid$target:libc.so:read:entry
> +{
> +  self->fd = arg0;
> +  @bytes_requested[probefunc,self->fd] = sum(arg2);
> +}
> +
> +/*
> + *  The read() function returns the actual number of bytes read.  These
> + *  values are accumulated in aggregation bytes_actually_read that includes
> + *  the file descriptor in the key.
> + *  We also accumulate the total number of bytes actually read across all
> + *  the file descriptors and store this in aggregation total_bytes_read.
> + *  Note that this aggregation has no key.
> + *  Since thread-local variable fd is no longer needed, the storage is
> + *  freed.
> + */
> +pid$target:libc.so:read:return
> +{
> +  @bytes_actually_read[probefunc,self->fd] = sum(arg1);
> +  @total_bytes_read                        = sum(arg1);
> +  self->fd = 0;
> +}
> +
> +/*
> + *  This is a shared clause for the probes for the fread() and fwrite()
> + *  functions.  We can share the clause, because the arguments and return
> + *  value are the same for both functions.
> + */
> +pid$target:libc.so:fread:entry,
> +pid$target:libc.so:fwrite:entry
> +{
> +/*
> + *  This probe traces the entry to functions fread() and fwrite().
> + *  A clause-local variable called comment is used to store a dynamically
> + *  generated string.  This string is then concatenated with the name of the
> + *  function, resulting in a string, stored in clause-local variable rw,
> + *  that depends on the function name in the probe.
> + */
> +  this->comment = (probefunc == "fread") ?
> +                   "read by " : "written by ";
> +  this->rw = strjoin(this->comment,probefunc);
> +
> +/*
> + *  The aggregation has a key that consists of the pointer to the stream and
> + *  the generated string.  This aggregation accumulates the product of the
> + *  size in bytes and the number of elements, which is the total number of
> + *  bytes read, or written.
> + */
> +  @total_byte_count_frw[arg3,this->rw] = sum(arg1*arg2);
> +}
> +
> +/*
> + *  This probe accumulates the return value of the fread() function, which
> + *  is the number of elements read.  This number is accumulated across all
> + *  pointers to streams.
> + */
> +pid$target:libc.so:fread:return
> +{
> +  @fread_total_elements[probefunc] = sum(arg1);
> +}
> +
> +/*
> + *  The output section where all the results are printed.  In one case,
> + *  we use 2 aggregations in the call to printa().  This is supported if
> + *  the key is the same.
> + *
> + *  Note that we do not need to include these print statements, because
> + *  aggregations that are not explictly printed, are automatically printed
> + *  when the script terminates.  The reason we print them ourselves is
> + *  to have control over the lay-out.
> + *  Another thing we do is to print more than one aggregation with a
> + *  single printa() statement.
> + */
> +END
> +{
> +  printf("%8s %20s   %-15s %6s\n",
> +               "Function","Filename","File pointer","Count");
> +  printa("%8s %20s   0x%-13p %@6d\n",@file_pointer);
> +
> +  printf("\n%8s %20s   %-15s %6s\n",
> +               "Function","Filename","File descriptor","Count");
> +  printa("%8s %20s   %-15d %@6d\n",@file_descriptor);
> +
> +  printf("\n%8s   %-16s %7s\n","Function","Stream/FD","Count");
> +  printa("%8s   0x%-14p %@7d\n",@fclose_stream);
> +  printa("%8s   %-16d %@7d\n",@close_fd);
> +
> +  printf("\n");
> +  printf("%8s %5s %14s\n","Function","FD","Bytes written");
> +  printa("%8s %5d %@14d\n",@pwrite_bytes);
> +  printa("Total bytes written by %s: %@ld\n",@pwrite_total_bytes);
> +
> +  printa("\nOn stream %p - Total bytes %s = %@ld\n",
> +                                  @total_byte_count_frw);
> +
> +  printa("Total elements read by %s = %@ld\n",
> +                                  @fread_total_elements);
> +
> +  printf("\n%33s\n","Bytes read");
> +  printf("%8s %6s %10s %10s\n","Function","FD","Requested","Actual");
> +  printa("%8s %6d %@10d %@10d\n",@bytes_requested,
> +                                 @bytes_actually_read);
> +  printa("\nTotal number of bytes read: %@d\n",@total_bytes_read);
> +}
> diff --git a/examples/sched-simple.d b/examples/sched-simple.d
> new file mode 100755
> index 00000000..d653276c
> --- /dev/null
> +++ b/examples/sched-simple.d
> @@ -0,0 +1,82 @@
> +#!/usr/sbin/dtrace -s
> +/*
> + *  NAME
> + *    sched-simple.d - count how often the target was on/off the CPU
> + *
> + *  SYNOPSIS
> + *    sudo ./sched-simple.d -c <target>
> + *
> + *  DESCRIPTION
> + *    This script uses the sched provider to count how often the
> + *    target proces was scheduled on and off the CPU.  The target
> + *    can be an application, or any command.
> + *    The information is given for all individual threads used by
> + *    the target, as well as across all the threads.
> + *
> + *  NOTES
> + *    There are 2 aggregations.  The one with 2 fields in the
> + *    key, thr_count_states, uses the thread ID as the first field.
> + *    By configuring printa() through pragmas to print the data
> + *    sorted by the first field, the results for this aggregation
> + *    are shown on a per thread basis.
> + */
> +
> +/*
> + *  Suppress the default output from the dtrace command and have
> + *  printa() print the aggregation data sorted by the first field.
> + */
> +#pragma D option quiet
> +#pragma D option aggsortkey=1
> +#pragma D option aggsortkeypos=0
> +
> +/*
> + *  These are 2 probes from the sched provider that share a clause.
> + *  Without a predicate, these probes will fire as soon as any
> + *  process goes on/off the CPU.  That will work fine, but in this
> + *  case we use a predicate to restrict the probing to the target
> + *  application, or command.
> + *
> + */
> +sched:::on-cpu,
> +sched:::off-cpu
> +/ pid == $target /
> +{
> +/*
> + *  We know that the probe name is either on-cpu or off-cpu.  This
> + *  is used to assign a different string to clause-local variable
> + *  called state.  This variable is used in the key for the aggregations
> + *  below.
> + */
> +  this->state = (probename == "on-cpu") ?
> +                  "scheduled on" : "taken off";
> +
> +/*
> + *  The 2 aggregations below are used to count how often the probes fired.
> + *  The difference is in the key.  The first aggregation, count_states,
> + *  does not use the thread ID in the key.  It counts across all
> + *  threads.  In contrast with this, the second aggregation,
> + *  thr_count_states, differentiates the counts by the thread ID.
> + */
> +  @count_states[this->state]         = count();
> +  @thr_count_states[tid,this->state] = count();
> +}
> +
> +/*
> + *  Print the results.  We use printf() to print a header.  For both
> + *  aggregations, a formatted printa() statement is used.  The
> + *  printf() statement in between the 2 printa() statements is used
> + *  to separate the 2 blocks with results.
> + *
> + *  Note that we do not need to include these print statements,
> + *  because aggregations that are not explictly printed, are
> + *  automatically printed when the script terminates.  The reason
> + *  we print them ourselves is to have control over the lay-out.
> + */
> +END
> +{
> +  printf("%8s %-20s %6s\n","TID","State","Count");
> +  printf("====================================\n");
> +  printa("%8d %-12s the CPU %@6d\n",@thr_count_states);
> +  printf("\n");
> +  printa("Total count %12s: %@d\n",@count_states);
> +}
> diff --git a/examples/sched-stats.d b/examples/sched-stats.d
> new file mode 100755
> index 00000000..c932b010
> --- /dev/null
> +++ b/examples/sched-stats.d
> @@ -0,0 +1,191 @@
> +#!/usr/sbin/dtrace -s
> +
> +/*
> + *  NAME
> + *    sched-stats.d - display various scheduler statistics
> + *
> + *  SYNOPSIS
> + *    sudo ./sched-stats.d -c "<name-of-app> [app options]" <threshold>
> + *
> + *  DESCRIPTION
> + *    This script shows several thread-scheduling statistics that
> + *    were collected while the target application, or command, was
> + *    running.
> + *
> + *    For good performance, a thread should run on the same CPU,
> + *    or at least in the same NUMA node for as long as possible.
> + *    In case it is taken off the CPU, it should be scheduled
> + *    back on the same CPU, or at least in the same NUMA node.
> + *
> + *    The information printed, shows the scheduling statistics
> + *    for any (multithreaded) application:
> + *
> + *    - For each thread, a histogram of the on-cpu times is shown.
> + *
> + *    - This is followed by a table with the overall timing statistics.
> + *    For each thread, the total on-cpu time is given, plus the
> + *    minimum and maximum on-cpu time.
> + *
> + *    - The script takes one parameter.  This is a threshold value.
> + *    It is a lower limit (in microseconds) on the on-cpu time.
> + *    For each thread it is reported how often the on-cpu time was
> + *    at, or below, this value.  This table might point at threads
> + *    that are falling behind on a (heavily loaded) system.
> + *
> + *    - The last 2 tables give information on the thread affinity.
> + *    The first table of these 2 is sorted by thread ID and shows the
> + *    CPU(s) used by each thread, as well how often the thread was
> + *    scheduled on the CPU, and taken off again.
> + *    The second table of these 2 shows the same information, but now
> +*     from a CPU centric view.
> + *
> + *  NOTES
> + *    This script works with any target application or command.
> + */
> +
> +/*
> + *  Suppress the default output from the dtrace command and have
> + *  printa() print the aggregation data sorted by the first field.
> + */
> +
> +#pragma D option quiet
> +#pragma D option aggsortkey=1
> +#pragma D option aggsortkeypos=0
> +
> +/*
> + *  Place the argument from the command line in a global variable
> + *  for better readability.
> + */
> +BEGIN
> +{
> +  time_threshold = $1;
> +}
> +
> +/*
> + *  An on-cpu probe with a predicate to ensure that the probe only
> + *  fires when the target is scheduled on the CPU.
> + */
> +sched:::on-cpu
> +/ pid == $target /
> +{
> +/*
> + *  Set the start value of the timer.  Since each thread needs
> + *  to have its own timer, we use a thread-local variable.
> + */
> +  self->ts_start = timestamp;
> +
> +/*
> + *  There are 2 aggregations.  Both increment their counter each
> + *  time that this probe fires.  The thread ID (in tid) and CPU ID
> + *  (in curcpu->cpu_id) are used to define the key.
> + *
> + *  The difference between the 2 aggregations is that the fields in
> + *  the key have been swapped.  Given that printa() has been configured
> + *  to sort the data by the first column, the first aggregation shows a
> + *  thread centric view, while the second one has a CPU ID centric view.
> + */
> +  @thr_cpu_id_on_cpu[tid,curcpu->cpu_id] = count();
> +  @cpu_id_thr_on_cpu[curcpu->cpu_id,tid] = count();
> +}
> +
> +/*
> + *  This is the first of 2 probes using off-cpu.  Again a predicate is
> + *  used to restrict the data to the target command.
> + */
> +sched:::off-cpu
> +/ pid == $target /
> +{
> +/*
> + *  The process/thread is about to go off CPU.  Now is the time to
> + *  record how long the thread has been running on the CPU.
> + *  The value is converted from nanoseconds to microseconds (us) and
> + *  stored in a clause-local variable.
> + */
> +  this->time_on_cpu = (timestamp - self->ts_start)/1000;
> +
> +/*
> + *  This variable is used to update 4 aggregations: the histogram of
> + *  the on-CPU times, the total on CPU time, plus the minimum and
> + *  maximum time on the CPU.
> + */
> +  @timings[tid]    = quantize(this->time_on_cpu);
> +  @total_time[tid] = sum(this->time_on_cpu);
> +  @min_time[tid]   = min(this->time_on_cpu);
> +  @max_time[tid]   = max(this->time_on_cpu);
> +
> +/*
> + *  These 2 aggregations are very similar to those used in the
> + *  on-cpu probe.
> + */
> +  @thr_cpu_id_off_cpu[tid,curcpu->cpu_id] = count();
> +  @cpu_id_thr_off_cpu[curcpu->cpu_id,tid] = count();
> +
> +/*
> + *  Free the storage for the thread-local variable since it is no
> + *  longer needed.
> + */
> +  self->ts_start = 0;
> +}
> +
> +/*
> + *  This is the second off-cpu probe.  It has a different and somewhat
> + *  more complicated predicate.
> + *  The clause is only executed for the target command and if the time
> + *  on the CPU is below the user controllable threshold value.
> + *  We basically record and count the event, but of course any other
> + *  action can be taken here.
> + *  An aggregation is used to store the data.  The thread ID (tid)
> + *  is used as a key and we increment the counter.  This produces
> + *  a count for each thread.
> + */
> +sched:::off-cpu
> +/ pid == $target && this->time_on_cpu <= time_threshold /
> +{
> +  @thr_below[tid] = count();
> +}
> +
> +/*
> + *  This is where all results are printed.  It is all quite
> + *  straightforward, but note that in three cases, multiple
> + *  aggregations are printed with a single printa().  As long as the
> + *  keys are the same, this is supported and makes it possible to
> + *  print multiple columns with values.
> + *
> + *  Note that we do not need to include these print statements,
> + *  because aggregations that are not explictly printed, are
> + *  automatically printed when the script terminates.  The reason
> + *  we print them ourselves is to have control over the lay-out.
> + *  Another thing we do is to print more than one aggregation
> + *  with a single printa() statement.
> + */
> +END
> +{
> +  printf("Thread times on the CPU (us)\n");
> +  printa(@timings);
> +
> +  printf("\n=====================================\n");
> +  printf("%10s %26s\n","TID", "Times on the CPU (us)");
> +  printf("%21s %6s %8s\n","Total","Min","Max");
> +  printf("=====================================\n");
> +  printa("%10d %@10d %@6d %@8d\n",@total_time,@min_time,@max_time);
> +
> +  printf("\n=====================================\n");
> +  printf("Thread ON CPU time threshold: %d us\n",time_threshold);
> +  printf("=====================================\n");
> +  printf("%8s %26s\n","TID","Count below threshold");
> +  printa("%8d %@14d\n",@thr_below);
> +
> +  printf("\n=====================================\n");
> +  printf("%10s  %8s %11s\n","TID","CPU ID","Count");
> +  printf("%37s\n","On CPU  Off CPU");
> +  printf("=====================================\n");
> +  printa("%10d  %8d %@7d %@8d\n",@thr_cpu_id_on_cpu,
> +                                 @thr_cpu_id_off_cpu);
> +
> +  printf("\n=====================================\n");
> +  printf("%8s  %10s %11s\n","CPU ID","TID","Count");
> +  printf("%37s\n","On CPU  Off CPU");
> +  printf("=====================================\n");
> +  printa("%8d  %10d %@7d %@8d\n",@cpu_id_thr_on_cpu,
> +                                 @cpu_id_thr_off_cpu);
> +}
> diff --git a/examples/thread-ids.d b/examples/thread-ids.d
> new file mode 100755
> index 00000000..eafde492
> --- /dev/null
> +++ b/examples/thread-ids.d
> @@ -0,0 +1,168 @@
> +#!/usr/sbin/dtrace -s
> +
> +/*
> + *  NAME
> + *    thread-ids.d - show the mapping between Pthread IDs and tid values
> + *
> + *  SYNOPSIS
> + *    sudo ./thread-ids.d -c "<name-of-app> [app options]"
> + *
> + *  DESCRIPTION
> + *    This script assumes that the target uses the Pthreads library
> + *    to create one or more threads.  It shows the mapping of the
> + *    Pthread thread IDs and the thread ID, as returned in the tid
> + *    built-in variable.
> + *
> + *  NOTES
> + *    - In addition to showing how to uncover this mapping, this
> + *    script also shows a technique how to retrieve a value from
> + *    a pointer argument in a function call.
> + *
> + *    In this case, this is the thread ID that pthread_create()
> + *    returns in its first argument.
> + *
> + *    This is from the man page for pthread_create():
> + *
> + *    int pthread_create(pthread_t *restrict thread,
> + *                        const pthread_attr_t *restrict attr,
> + *                        void *(*start_routine)(void *),
> + *                        void *restrict arg);
> + *
> + *    We need to capture the contents of *thread.
> + *
> + *    In this case, we cannot use the built-in tid variable
> + *    within pthread_create(), because typically, this function
> + *    is executed by one thread, the main thread.  This means
> + *    that the value in tid is the thread ID of this main thread,
> + *    but we need to have the value of the thread that is created
> + *    as a result of calling pthread_create().  As shown below,
> + *    this can be done by tracing clone3(), which is called by
> + *    pthread_create().
> +
> + *    - It is assumed that a function called main is executed.
> + *    If this is not the case, this is not a critical error.
> + *    The first probe is used to capture the tid value for the main
> + *    program.  This thread is however not created by function
> + *    pthread_create() and therefore this part of the script is
> + *    not essential.
> + *    This is why this probe and corresponding printf() statement
> + *    in the END probe can safely be removed, or replaced by a
> + *    suitable alternative.
> + */
> +
> +/*
> + *  Suppress the default output from the dtrace command and have
> + *  printa() print the aggregation data sorted by the first field.
> + */
> +#pragma D option quiet
> +#pragma D option aggsortkey=1
> +#pragma D option aggsortkeypos=0
> +
> +/*
> + *  Declare a thread-local variable.  This is to ensure that the
> + *  compiler sees it before it is referenced.
> + */
> +self int clone_tid;
> +
> +/*
> + *  Store the thread ID of the main thread.
> + */
> +pid$target:a.out:main:entry
> +{
> +  tid_main = tid;
> +}
> +
> +/*
> + *  Variable pthr_id_p captures the first argument of the call to
> + *  pthread_create().  This is a pointer, but we can't dereference
> + *  it here, because the contents this pointer points to, are only
> + *  available upon return.
> + *  This is solved by storing the pointer here.  In the return probe
> + *  for this function, we can then dereference the pointer.
> + */
> +pid$target:libc.so:pthread_create:entry
> +{
> +  self->pthr_id_p = (int64_t *) arg0;
> +}
> +
> +/*
> + *  We actually know that clone3() is called.  By using the wildcard
> + *  here, the script continues to work in case this number changes in
> + *  the future.
> + */
> +pid$target:libc.so:clone*:return
> +/ self->pthr_id_p !=NULL /
> +{
> +/*
> + *  We know that one of the clone functions is called from within
> + *  pthread_create() and it returns the thread ID that DTrace stores
> + *  in the tid variable.
> + *  This is why the return value, which is stored in arg1, is copied
> + *  into a thread-local variable called clone_tid.  This variable is
> + *  then referenced in the return probe for pthread_create().
> + */
> +  self->clone_tid = arg1;
> +}
> +
> +/*
> + *  This is where things come together.
> + *
> + *  We already have the value for the thread ID as used by DTrace.
> + *  It is stored in thread-local variable clone_tid.
> + *
> + *  Now we can capture the Pthreads thread ID.
> + *
> + *  There is one more thing to this though.  Below we use an
> + *  aggregation to store the results (and ignore the count when
> + *  printing the results), but this is not strictly necessary.
> + *
> + *  The approach chosen here allows us to control the sorting of
> + *  the results.  In this case the sort field has been set to the
> + *  Pthreads thread ID, but this can easily be changed.
> + *
> + *  If there is no need to print the data sorted, a simple printf()
> + *  will do.  All that needs to be done then is to print the two
> + *  variables this->pthr_id and self->clone_tid.
> + *
> + */
> +pid$target:libc.so:pthread_create:return
> +{
> +/*
> + *  We are about to return from pthread_create() and can dereference
> + *  the pointer.
> + *  Before we do so, the data needs to be copied from user space into
> + *  the kernel.  Since this is a 64 bit address, 8 bytes are copied.
> + *  The value is what pthread_create() returns in its *thread first
> + *  argument, which is the Pthreads thread ID.
> + *  This gives us both thread IDs and they are used in the key for the
> + *  aggregation called thread_mapping.
> + */
> +  this->pthr_id = *(int64_t *) copyin(*self->pthr_id_p,8);
> +  @thread_mapping[this->pthr_id,self->clone_tid] = count();
> +
> +/*
> + *  Free the storage for the thread-local variables.
> + */
> +  self->pthr_id_p      = 0;
> +  self->clone_tid      = 0;
> +}
> +
> +/*
> + *  The aggregation is printed in the END probe.  We use printf()
> + *  statements to print the thread ID of the main program and the
> + *  table header.
> + *  Note that there is no format field for the value for the
> + *  aggregation.  As explained above, the value is not relevant
> + *  in this case.
> + *
> + *  Note that we do not need to include these print statements,
> + *  because aggregations that are not explictly printed, are
> + *  automatically printed when the script terminates.  The reason
> + *  we print them ourselves is to have control over the lay-out.
> + */
> +END
> +{
> +  printf("Thread ID of main program: %d\n\n",tid_main);
> +  printf("%16s <=> %-9s\n\n","Pthreads ID","Thread ID");
> +  printa("%16d <=> %-9d\n",@thread_mapping);
> +}
> diff --git a/examples/var-scope.d b/examples/var-scope.d
> new file mode 100755
> index 00000000..8a99bcc3
> --- /dev/null
> +++ b/examples/var-scope.d
> @@ -0,0 +1,121 @@
> +#!/usr/sbin/dtrace -s
> +
> +/*
> + *  NAME
> + *    var-scope.d - initialize, update and print variables
> + *
> + *  SYNOPSIS
> + *    sudo ./var-scope.d -c <target>
> + *
> + *  DESCRIPTION
> + *    This script demonstrates some of the scoping rules.  It
> + *    shows the behaviour of global and clause-local variables.
> + *    The target can be an application, or any command.
> + *
> + *  NOTES
> + *    - Other than the BEGIN and END probe used here, there are
> + *    2 more probes for the fopen() function, but you can use any
> + *    probe you like, or no additional probes at all.  You are
> + *    encouraged to experiment with this example and make changes.
> + *
> + *    - In case this example is used with the date command, you will
> + *    see something like this:
> + *
> + *    $ sudo ./var-scope.d -c date
> + *    In BEGIN
> + *        A = 10 B = 20
> + *        this->C = 60
> + *    In fopen - return
> + *        A = 11 B = 21
> + *    <output from the date command>
> + *    In END
> + *        A = 11 B = 21
> + *    $
> +
> + *    - Thread-local variables are not demonstrated here, but many
> + *    of the other examples, like io-stats.d, make extensive use
> + *    of them.  Please check one of those scripts if you would like
> + *    to learn more how to use thread-local variables.
> + *
> + *    - Below, the workings of each probe is explained.  Since the
> + *    results depend on the command that is traced, we base the
> + *    explanations on the output from the example above.
> + */
> +
> +/*
> + *  Suppress the default output from the dtrace command.
> + */
> +#pragma D option quiet
> +
> +/*
> + *  This demonstrates how to declare a variable outside of a clause.
> + *  Variable B is declared to be of type int64_t.  This is a global
> + *  variable.  It is initialized to zero by default.
> + */
> +int64_t B;
> +
> +/*
> + *  In this clause for the BEGIN probe, A is initialized to 10 and B
> + *  is given a value of 20.  Both are global variables.  Variable C is
> + *  a clause-local variable initialized to 30.
> + */
> +BEGIN
> +{
> +  A = 10;
> +  B = 20;
> +  this->C = 30;
> +}
> +
> +/*
> + *  In this clause for the BEGIN probe, clause-local variable C is updated
> + *  to a value of 60.  This demonstrates that clause-local variables are
> + *  local to the set of clauses executed for a particular probe firing.
> + *  This set is executed in the order they appear in the program.
> + *
> + *  Here, there are 2 clauses for the BEGIN probe.  The printed values
> + *  in the example above confirm this update for C, as well as the initial
> + *  values for A and B.
> + */
> +BEGIN
> +{
> +  this->C += 30;
> +  printf("In %s\n",probename);
> +  printf("\tA = %d B = %d\n",A,B);
> +  printf("\tthis->C = %d\n",this->C);
> +}
> +
> +/*
> + *  The clause in this probe updates A.  Since this is a global variable,
> + *  this change is visible to all probes that fire after this probe has fired.
> + */
> +pid$target::fopen:entry
> +{
> +  A += 1;
> +}
> +
> +/*
> + *  The clause in this probe updates B and prints both A and B.  The
> + *  probefunc (fopen) and probename (return) are printed first, followed by
> + *  the values for A and B.
> + *  We are in the return probe here, so we know that the entry probe has
> + *  fired too.  This means that A has been updated as well.
> + *  This is exactly what we see in the output above: A is 11 and B is 21,
> + *  as it has just been updated.
> + *  Note that C is not visible here, because it is local to the BEGIN probe.
> + */
> +pid$target::fopen:return
> +{
> +  B += 1;
> +  printf("In %s - %s\n",probefunc,probename);
> +  printf("\tA = %d B = %d\n",A,B);
> +}
> +
> +/*
> + *  Both A and B are global variables and are visible in the END probe.  The
> + *  final values are printed here.
> + */
> +END
> +{
> +  printf("In %s\n",probename);
> +  printf("\tA = %d B = %d\n",A,B);
> +}
