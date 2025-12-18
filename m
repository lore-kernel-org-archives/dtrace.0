Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAE051E98E3
	for <dtrace@lists.linux.dev>; Thu, 18 Dec 2025 19:43:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766087012; cv=fail; b=SdnwRv6R1CHemxVkIKQA519cBE9mdwULE9S54RI60fK7cD3TxCjLZens4Uzn8eD8PcvEzAJo8vzANs746XK34IZGjhuCk/KdJV/VVu+fpiYYYuk0yF04o3HKoWaxai/SG59BUqY3BVYR1YXoBNXepZzG9ZiIqvVmN+NpFBGEXF8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766087012; c=relaxed/simple;
	bh=DXjQlLuPTCz+5EL5gXZycpSIRRHkeREOm11mEGBgDdM=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=JPe+RYSZc9UV2Fk9F62Ik7rKHKJZ4924+Ug1G4xAap+bsow3Ly/OgObXFpUueu3a2SLFCKwvp9yrd+Tjed1tiIwvhpWpsbY0m7MsiuIf8RSFiJ5RaeJHHibxohmBDt6X/BXJCMGoW109Iavj0zOwcf9PNoTemlLi9XyZxlFz0Ik=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=A8gYEE6b; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=vrAg5t/J; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="A8gYEE6b";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="vrAg5t/J"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BIJONh61927150
	for <dtrace@lists.linux.dev>; Thu, 18 Dec 2025 19:43:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=DXjQlLuPTCz+5EL5gXZycpSIRRHkeREOm11mEGBgDdM=; b=
	A8gYEE6bMpvfZtqFeRTXcY7CGEhYiHnkYrhoFmsgfbKf5XAqsjSfnhSA4/0kZjHP
	su85SRTgFIOTYsOJIfZ3Vr1nCFI793W8nN1LsSIFcyYqJr3dhCAbfw+IqKWR4lGE
	0VlX8KbCoRERhDK8d8QV6PtGDdKamAlVUCxMKHESFA3HyFA3+8aBWjtqbZumV13h
	PXqYziSnhp2+ijVZK7zUV1q5VDtLgWaMTvD1ghhqLuokOQVINIS/bPvpja6A8R0q
	Udujx0HBZfROuMckIiyhIk/OYRQ75aFHVqxU7Uqw/t1VL+X8eIaqUyPMqFAxCu8S
	3cJrBwRTAURitXVoyqXY8A==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4b3xa2thcm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 18 Dec 2025 19:43:29 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 5BIJSk65023521
	for <dtrace@lists.linux.dev>; Thu, 18 Dec 2025 19:43:28 GMT
Received: from sa9pr02cu001.outbound.protection.outlook.com (mail-southcentralusazon11013057.outbound.protection.outlook.com [40.93.196.57])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4b4qta0jbg-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 18 Dec 2025 19:43:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RLusV6w/4QI9teSwgjaNAK01XeLE2V3gNGKPOYn3JyP5ivjf2bpab9uZVrhTK07RuOLu43dA+Fwyqw8YdcgYbPvjzz+P/impVLpJoz2hwS6ds3ueE8kCOY5g2Fiq3qnDSBOfvbqeZFgv0bxR+fJvKwyLCGf6JKn5re3WQQZQ/OL845clXzPVhNGVLfslRzZzJ7XOjkE/diI+jwxzsGre9P0xH5q/LgyUcFVJB2AOriKsy0GDELx8XuXovqx58wE9LzcVlofFeUEkgB57nDXEjYHbpNvlmSEDxkb8ULhqXTptGCJB5sJNitsclk3G/hSZPmPpFZCfgb9ShnaIjYFZUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DXjQlLuPTCz+5EL5gXZycpSIRRHkeREOm11mEGBgDdM=;
 b=ewQX8WzqSJeF50SCz3MjMWRlzYW5spMF+vNVtoNsP7KBPGfmSzOBg9q3AdhN4KXgK71NYlQAeHjSM4BpfHgpZ1d9OcgOL17enLHrO1Yd+CF4I+eVa325w0RXY3SHkKHSqQgNNkdOAzmbWo68RFw65r5EBSGFHoTluBNMhpiYjtaLM6w89IlQhUcSX8wv/MMmn1G92+FsT6oRkXA24662re8gTEnNNAAs08JrZt8O8sCygQmNL1lJIMurx9FJeTPy8MIMnsR2SwmsHOj3E1gtDJh2P5X+lSwzSAylnCxpt5JbC4smkFgS2a1XWmgYD6TiUau/7Bdn70zQ/SOHy4gl3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DXjQlLuPTCz+5EL5gXZycpSIRRHkeREOm11mEGBgDdM=;
 b=vrAg5t/JEcI8eN7fufeFsuGJm8j/9dJBklwh/W4EIih9AoH0GvQ813dGq0ufhbL0N81hKVobe+JJuRNkAKYkgQGenYy/3IefVy/NIM3rRYfN56ZwCN4XT3oEjI+FWgUlTaURRAzBPpwDmhQXJHF2PhyaTnCOmdG+zB3kF1a8vO8=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by CH4PR10MB8124.namprd10.prod.outlook.com (2603:10b6:610:23a::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Thu, 18 Dec
 2025 19:43:25 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b%6]) with mapi id 15.20.9434.001; Thu, 18 Dec 2025
 19:43:25 +0000
Message-ID: <126eae26-5a12-f977-cf3d-7efe87f9b26b@oracle.com>
Date: Thu, 18 Dec 2025 14:43:23 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [DTrace-devel] [PATCH v2 1/4] cg, providers: refactor clearing
 probe arguments
Content-Language: en-US
To: Kris Van Hees <kris.van.hees@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
References: <DS0PR10MB7522DE134C06525A82CA4DAEC2A8A@DS0PR10MB7522.namprd10.prod.outlook.com>
From: Eugene Loh <eugene.loh@oracle.com>
In-Reply-To: <DS0PR10MB7522DE134C06525A82CA4DAEC2A8A@DS0PR10MB7522.namprd10.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PH7PR03CA0003.namprd03.prod.outlook.com
 (2603:10b6:510:339::8) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|CH4PR10MB8124:EE_
X-MS-Office365-Filtering-Correlation-Id: 6d9f0a18-d775-49c8-87d0-08de3e6db564
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?clNmdHgzS1lvSURERUJ5ZEZYTnQvS0E2UExiWmN4ekF3SnVYQXdyVzd5cUor?=
 =?utf-8?B?S3VQSGJvTzZBN3ZpMW1qNWx0UGZ5RFBnODAwSGYxRjQ4aGkzT3NKdXVzS1E1?=
 =?utf-8?B?RDFYSFk0cjRnUmxDdHdPcWUxS2Q0SVZiWjd4eEcrODUrNDFobkRqamFuOGNX?=
 =?utf-8?B?QUthV3lyVkxOOWNYeHBybHNNUlU3OFR3cjU2aWpaZU8xcldrNzRqWXpPNEdX?=
 =?utf-8?B?WmhBV3VhVzVSd2FNUElXK2VzZ2xmemVwME5VUFlrSVdoU3dSUk81eklFaEE5?=
 =?utf-8?B?SW1WZ0NwNDVoVE1PdGppV1libHpISGFJR081bGE0RHNPaWVROFdRLzlCcnJS?=
 =?utf-8?B?a1JGc2JIWGJnRnJBaEZ3U0haV3JJZ2xvbG1MZ0hRblNwSkdEM1N4NUlTNk5q?=
 =?utf-8?B?SzJJRldqd2xwdXd0NTdUdjZRYWw2dHhNcEdDcldSbjI4Y3ZkZE84MXZsUUd6?=
 =?utf-8?B?bmRHYkxTb09QOHhiWGRmWS9JdVFObkRBNkZncTMxZHJqbndCZGJaMTFxZm1X?=
 =?utf-8?B?RFI3S2ZvMnB3RW1kQWE0Ykk2TThGY1dRVWhjbXFady9zTUFXN2lWYk9ScDE2?=
 =?utf-8?B?V0JUVEtmMU8wRFhOVXNKNXk4Y0hmVFpGTG1sc2M4M3BhMkFqaUNSdERwQVFK?=
 =?utf-8?B?UGtIZFlPSlNPRUhFZ2xqZnhzaE9neGNhYkIzc0g5bThrMTNFV1ZtZVdoeUJM?=
 =?utf-8?B?anhEdnpKckJnVERaOFNWeWlFSWVxem5GNTE3TnZOelBZbVRUVVp4a0hDZnhP?=
 =?utf-8?B?SmVOR3RoU2dyZWh3TEVCb3NSOWpDTm1QTlZ3cHppMlpuMmoySHhta200V3pF?=
 =?utf-8?B?SHJyQzVEZFJodTdXZHAwMGlpcENuNDBmeVZwcUc3VFFTa1g0L3FWeld5dURE?=
 =?utf-8?B?aW9SRHF5azJqTi9YTFNQMVV5cC9OQTZUL0dSMVpXK3gvY3lsMGZwdTh2NUhN?=
 =?utf-8?B?a05yYldzdTFIWHo2My9GNVZqbExpOWI3QlRhdFd2N25SdGJGbW05cE1pQ1kv?=
 =?utf-8?B?VFdYdEJuQnBSdGFNMlBiYVJ3SUthQklISGpzdmFhNk80dkx5ekZuckEva1hG?=
 =?utf-8?B?elk4T3IzMXlxdng1dURIbzErMGVmRU9wckhlWGZyUVZoL1ZuQ3JwVnQ4S3VG?=
 =?utf-8?B?MllJaG82QkRVYlhaU2NXRk93TkcwbE5rcVVlT0lIRTlCRWdyWXlTTlZTM2VT?=
 =?utf-8?B?VEw4bGhHTTI4enhBZVhzcGZqWVpYcmZCRG42MVJoa0tpVHNaakl6RSt2a1F1?=
 =?utf-8?B?Vkp2a0RnNXRoN1JncUJleTRnMGpWQjNueXJoWmNaaUE5b2JUVklDRFRhSmRU?=
 =?utf-8?B?T0dSSTlDMlNvckEvVW5CWlI1d2RrUWNlOE5OSWhJMGlhVnVjdDFiT1Z3TDVE?=
 =?utf-8?B?YmhzdW0yS01KNEwrVmd4Z3hwNHlMWWNpcmxFd3M0WWZNVkhWMmV3emZ2WTc0?=
 =?utf-8?B?Qkg3d2UrVmRBcG84S3NWQmczeWQrUVpqUTFpcmFlazZNVkJSR0w0b25tNHUv?=
 =?utf-8?B?b0JZU0hCYWFaV2VNSmdTempPZFBQajRuSDhhQ2VJNm1vd2dLUkhIQW91Q1Jz?=
 =?utf-8?B?ZHN1UWZ0aGttQmhIdXIxVFVvZXlOM2ZjMXBiOHUrTzZjU0kvRGtYNzJGTGl0?=
 =?utf-8?B?VHBvbmIwRG4zOHdxT2swbzRleWMxT25JZU5sRG9uVm5ybHBYWWU0cTdzRkNi?=
 =?utf-8?B?VzFHZE9Ub0ptSk9jRnNwZXY0cHEvbFZHcndUeE5keDlUUzhZUTAyT2pyYzJR?=
 =?utf-8?B?bGFuNXpQblEvT2o2d0J3RGlEVFdhQ21xdkg0Tm91OUVDK2lxcVBMWnlwOXdn?=
 =?utf-8?B?MTZ0czFnS1JLc1orajBSMm1oZ2lvQ1ZzZHI1UlFDRStScytERndaRmpZUVk0?=
 =?utf-8?B?aDR0czFINzdmajBtbUdFSjB1U2pPeXdEME1QdUdwek00S3NhT3EwYzJlRkZ0?=
 =?utf-8?Q?yTKNRr+zEAT805+FtbkXbeceLveWSDsp?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WVh1SjQ2VncrMzhVS0RMSkwweWQxN2ozbHozZ21BenQ4TVJiS2U1Z3gvVkdo?=
 =?utf-8?B?OVc2bS91SWNRc1c3cmRwZ0hYNzlnenN5cDJvMVNhYmRDUit4ZnFmTDJONk1t?=
 =?utf-8?B?OWRaZ2lQSzZGbThGUUwyV1RINnU5WkIrbHFLTTFMRk9ldDFDbEYvTnh5OVlL?=
 =?utf-8?B?bkUremhuZWhRYnhXdUZxNmJVc1M2bC9RQy8wMlJLY3lUYklIUEFodkJ6aHdI?=
 =?utf-8?B?Y2hwenJ5TDI4VnNBUldZUmtrWlJIdDJHNVhQbUdXMk0wa2E4ZGVwRENVWU4v?=
 =?utf-8?B?Nmt6MDRJemhYMU9RKzBWb2lTZEdjR012ODFOOVRKMTIrd2Yvb1RjVkJmaFBV?=
 =?utf-8?B?dG1ibmJSWUZvMmZnMmRZclI5M0tZMWZqeXNuMXNsTWduYVZRN3JDdFJYYmZB?=
 =?utf-8?B?RjBvVUlVWVlFOXUxMzlQTThIVEJncWZzUUN0SjI4WDhwUEt2TWlsa3BPQ0hS?=
 =?utf-8?B?RmI4YkNIbmZKOUo5RTRhK2s5UEZPTDJZeUtBQzdPOExGZVJ4MnJiNFUwNVRS?=
 =?utf-8?B?VU13SXJ6anRDblloODdDSWJ1MkZ5S1J6UGZaKzkwZVJWUUlQeDJOZjVCb1FC?=
 =?utf-8?B?K05rdnJzd28rUjZobUQyMzhnSytkeis0WjEvNC9UdFVRdjRXQnFBVkRVNkZ2?=
 =?utf-8?B?ay9Jb3pIdmZYTEdwWkVzeEl3TFF0Y3BVZmZpUHp3eVZZZGhhU1VVN2RCWGcx?=
 =?utf-8?B?c0M0WnJjTGpXaFRSbFcxUStmRHMxZHRyUVNQbUZycFV2WjFYTWZmZk9PUjNv?=
 =?utf-8?B?WExlOFVGOTJkOTVuV29PODYySGppbUh2TXFqK3ZNR21VUHRmZVl0UDUxRWw1?=
 =?utf-8?B?bm9RQzF4S2lUV3BSRGF3QmpETE5jeFZDSW1JdUtkUEkzSmxINi9Wc0FhTnR2?=
 =?utf-8?B?L010Y1VTU0JYRm1oNjljK3FHMXJUN2srK1BxM1Rra2NQYytUVWpDT0JHNUVr?=
 =?utf-8?B?UWlBN1lMTkVEa1ZTT0V5NXNYQldsajArWkE3dWoxdUpDRGkzbU51SkEyd1dX?=
 =?utf-8?B?UFFkbktFMks0YUhhZXltalR3QkZuc3EzcjJQaXlqOXRDWjJubXFBb283MnhU?=
 =?utf-8?B?eXdNR2lKN0JKWStyaFlBK3VSVUV2RkJJUkRZMEdKWHdGSStNdXQxQnZ2czQ0?=
 =?utf-8?B?YmJkcmtqaStQZG5Ick5qSWdtYjdSUXZVanh6cmFXVms4RzY1czZNUjh2RHFV?=
 =?utf-8?B?b3RzUEpIZlBLbkh0YW85WVI0R1kvenVZSFFsWHVRcjRDTzZrM3lHRGpsaks5?=
 =?utf-8?B?c0hhTTdXODRsNFJqRWliekZ1SzFULzNScVB4bGJ3cEV0ek5iV1JXT09Mekt1?=
 =?utf-8?B?RmpSZnZReEtmSS9sNGZQOWVNeE1jNThsT2ZhUkQ1UUNYK1g0OGpKM1BiaE9q?=
 =?utf-8?B?VmVodTNYSDg0Vmw1d0l4UjR0elU5SFo4RHZFcjZwQ0dRZ0gxRXh1aENsdTYx?=
 =?utf-8?B?a1VDQmF5TzlSdDJ3djBFNDlJeER2ZkRwKzhyRUJJMUh6VjhOQjRIQitxWTlX?=
 =?utf-8?B?TXFKWlpFamIzbzF5aitwYUlHbE12UFlBLzBsKytNOGdZTVMrOFB2djhMamp6?=
 =?utf-8?B?OVI0emk2MFFpc0lPZWtpaW12dVcwK2NpNTVvZUNteEE3MkJ4MlM1RHJac2tX?=
 =?utf-8?B?RGdJbGV0OEpoTEY1WVUyT1ZtMHRCWnBzZ255YzFKSkY2MHA3TUUvQWFtNWFx?=
 =?utf-8?B?NFhnQ2VGdTJZcFNYZzhvY3dsalhPRG1QSlhUaWJsbmcrMmMrTmJpcFAyOW96?=
 =?utf-8?B?NVJkYWtZelVoRUlFYjk4UHBzcVZQUjRkOFRwcEVMenB6dEozUUxnTUk3QlFq?=
 =?utf-8?B?SDV2bzZhV3p5SWtUVkxOaklYZk9jem53ZEJqVjM1NkJTNVllU21zQVF0emJG?=
 =?utf-8?B?a3NRemFOUDNsakNPSm9zRXEweG9CQXlOQXRsWUkzWHArS3hNTDlVcEJ6V1dv?=
 =?utf-8?B?VEFBd0pYaWFoY29vVFhaWUxDRHlXT25jaE9ad1pzU2FDKzliWUJLL3VvcGdZ?=
 =?utf-8?B?M1NSb211eTJCNzliNVdCNk01OUZ0bUJGWFJDUUh0aVJZWW5NdU9ydDEzMmVv?=
 =?utf-8?B?eTJXbVFyQldiOTBhWEQrMHk1a2IvZlp1NUZiSGc2UEZvb29KOHNIWlpFMTJW?=
 =?utf-8?Q?ovbaeYXlK4E1zHOKv0pqVBms6?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	sYU7zPgFvulZl5dYvzon3lBfnsQMjk7qktZNfxVZsX1z2c71j6SVFHS/R7SRAf9bvqP2XDK4/Xa/5D3L3+reXDBnjlm98CtLAqrYVEibIHY4Y1U9AhXxW3rZfCOI4zNFmq/F+c7CN8QktF6bco1/CKJo6oLkqPdWXzvsJM/6So//3VrJgraXhXHXkcVI898ybH0gE+fLpr8CowzP8PmXf9aakjsL1cktf5l8MJcPzJB9yJ5bPc6/l76jIIE790YCYjQCQZWX7AOomuGVHp7wkB52rjSYplzzhVvWy5Rj2xoVV0ODk13NoZhP+YQvoWGDk7FbcleCiOUTHJ7K6ngXbyB/M95GshuHOn3hKsofVoFpAz83hil19MHFAuQujn4/pgppqxDJRk0l9vj42GExgYsbXmAxamDSjrcFREce0TNrnIsylefueglmSVhNpGhhurEpGjUv8i6oQozx9n/AgfopifEoUUzb0u+QAKkFTohcyrxFy/w4QPe8k7/xg5GHZOcBnYTTtHubALKUZkMAvn23/eoUj9XuPqu1WExRn44zNhkzlojhmNTyR7QoCtIOxfOTDxwLB86zN3H9/FQzIrfMH1hKYEn1UHKVMCtNlsU=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d9f0a18-d775-49c8-87d0-08de3e6db564
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2025 19:43:25.1489
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /dt/nfP0OpiZ7Z0no/AKLb9OalR5fT6ji2qyqtSYLd3kcyWIa+D4ErLMDpxEYjSQtui6hLQeVIL5Ohj2Famdfg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH4PR10MB8124
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-18_03,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 suspectscore=0 adultscore=0
 bulkscore=0 mlxscore=0 mlxlogscore=999 malwarescore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2512120000
 definitions=main-2512180163
X-Authority-Analysis: v=2.4 cv=Ot5CCi/t c=1 sm=1 tr=0 ts=69445961 cx=c_pps
 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=1rt17B-MKbJVrb2a18EA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: rvAbf9GEaV3oDeuT8xCnf1SXyNmNy62g
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE4MDE2MyBTYWx0ZWRfXweBeN6qlMWJZ
 F5bXS5UQa0i4uhOSsl6hZNpqO/W3mJhy1WSpmjqkzvWAU4WKJsCQN1YHkEG3KHwIRTOyBKj+71X
 uOV39ayMQXaqFNwSuBSQHe5C0uDZNVMfHIHBggH/U6DCBGJEaeF28fvuyzH1I8e6XOfcn2F4ik/
 VI4O9YWEmlmuV4QGrBmRAyr/FpLltH0/aiDmpI2Q9NvuD+3drTXjoI8Uy2qiLgrUAaS4JTs7pJ7
 lw4dtgX3QDZtu2Cl1lNa2RhGT3UM+fQUSo6lZbCDe3rvzNn2aS+BdxeQfsg/P18ngmJnUsHc/90
 ocIlT+rpWAO4PWm+r6Krie2lP579HfjZ5HHoBwsfXn3qAFPOMuteZnzXNYUW+WrngLIbur08Mgz
 sjAmJ2lKh61Zh9MjcnCg3h2MOvkEgg==
X-Proofpoint-ORIG-GUID: rvAbf9GEaV3oDeuT8xCnf1SXyNmNy62g

This looks like v1...

On 12/18/25 14:31, Kris Van Hees via DTrace-devel wrote:
