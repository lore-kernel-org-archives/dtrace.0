Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2B0441C62
	for <dtrace@lists.linux.dev>; Fri,  1 Aug 2025 18:02:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754071358; cv=fail; b=IHUHyy2GhD46nnj5NGq5LE8GUH6juJMy+MZooIRaMc+trbJoHGJpBIwvtRnh9V8pD1V3fc/hG+jHOra0kaQe/yKHB1kabzgZvYV7Ium7u2WYN3El7amiJb6Bj6aG2M0fWEuQ66Uk+H/g4wDsevO8utqmNGmmQCy5cwdyDJ7g8uo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754071358; c=relaxed/simple;
	bh=+UpXjv0ng2klX9lo1rAlA5JhRGlI1B9UoSFMpPyYYVU=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Ar5/m1qvPKumMgkPu0iJFg0WxutWjbkHdJ0fjOFBT/lnOy0n3OtB095fsQxCkhHuTSdBsS6AW5wbhPb1avuua+a6Lw/aWSgZwnCVR8bir0ZtzbgoU+xwMMZN129umzApW9HnJw+Zp3GGqId9N7Yuzc5kslpLz4P/WEE+O5etz2M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=E46a3BCe; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=RRqOpEcb; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="E46a3BCe";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="RRqOpEcb"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 571HtoOH008472
	for <dtrace@lists.linux.dev>; Fri, 1 Aug 2025 18:02:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=ExGdeCabLV76bIeCypbXnsuwIbECw2Qvhff5D5804HI=; b=
	E46a3BCecMM0xkZ0pMhAyE9xYVdtXVcVVY2WSHtDUR4WxBRJmWKhv3jFdK4xfCAD
	O2Zb5UxZ7dBgenX7MVIbQJDMa9J6WXmzFdbTyniKI3u46vYQf3bfo8r+rpMAsgCM
	3dpPTUECo8tubwshpcjSbxpzUOtuSbvU8mqIWpIvYbx3Bd5hwU7vUmOpplfwsrio
	SZu9cg7CqKy3JiZhKbrzLVeKNYKwKdQMzcCNxJBbLuMM0FbEGippHF26iSbyo3Jf
	rbG1WwvWRL+tAGn5okWwqFREriPLGwaWXjBRlLsYM6wkN69ZJlmQudygMN0UeBet
	eXAf1iyLaVh9tvcJuc4k7Q==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 484q4ypqkp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 01 Aug 2025 18:02:34 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 571I0vaK011159
	for <dtrace@lists.linux.dev>; Fri, 1 Aug 2025 18:02:33 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12on2078.outbound.protection.outlook.com [40.107.237.78])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 484nfe00vb-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 01 Aug 2025 18:02:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Lvlsqs3vCRpe8wROSK9Z+TAh1ZSuRj6Z7O0gpEpppgDEY37pMVsw5mUj5dO2yvMDt3K8melFHEJpjrO6LMEoIUbU1g+xs6jEe1FL3q+R6x/shtTvsVOMsYQarkZGouAlx1Co5JNuhfhWHuLtbVqxmbaLWUEYsw1P3ravZLVs7CHQu+DU82PcqFBPZy3GARyNjIDny2p9N7TjsYmJCGHWbh6Hv9LEwOHcDgZA4ewyjWgvqq+1hegeMkXMtXdN8LeimkUBkzA+RoIAiGD4mkAlnrzFq/nYkeTjduY/bF8LUO91WCDejlcjeiyXNgA2LShxUoq6B6QwCORbLGtAQ0x3tQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ExGdeCabLV76bIeCypbXnsuwIbECw2Qvhff5D5804HI=;
 b=j6bM9XoYAAqIH3W5+lTRTkDs/x3AInSKOTTgUS4OuLfXATHLV2FaEX5xgPiyYV9iju3Vk9hOtIVmQEpmuaYv8C/GNzTOfSbr2ZYNQwKhf4sC928wcjwIQFaVLwmBwFY8vDIsLhCmhCyUZzs3UJHsdBTZDsn00gLudo0oxLEruxP5PuScOwQr0YqKMk8WTu/G0DX0zTcBCJkkfIdJE3jJcZVnVZD08AaWSnb76r2DuG8q9ruFZ2aluCoPom3E6VenaJNDidmiagTBvyq26BVj5qFkOP8rh/ffr46Hz3rLh5B4gaYLEeVjuhVOEISVRO78+TM7blg0AFAus5Y/9JkdbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ExGdeCabLV76bIeCypbXnsuwIbECw2Qvhff5D5804HI=;
 b=RRqOpEcbMYeGdQ9NMlE490jkkpAosu5yojDazTrtzbS0lqjS00hyWhLayDcj+RnGnHNrso2Ibja6JFau6RitBiuDzHpVIJu+yrJjK6XAiaLUqfqXEHb7VYlNZu+LI3ly7T6KPCTgz/j9SWHqph4eMpwglbo9C+SJmrvcSDll57c=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by CH3PR10MB7119.namprd10.prod.outlook.com (2603:10b6:610:122::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.14; Fri, 1 Aug
 2025 18:02:31 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%6]) with mapi id 15.20.8989.015; Fri, 1 Aug 2025
 18:02:31 +0000
Message-ID: <242f4ff5-c88b-ec46-de07-a6afc60936b9@oracle.com>
Date: Fri, 1 Aug 2025 14:02:27 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH] Need -w for destructive actions, even if clause is not
 used
Content-Language: en-US
To: Kris Van Hees <kris.van.hees@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
References: <20250711044024.1587-1-eugene.loh@oracle.com>
 <aIze8ZQ2iBFSf0J5@oracle.com> <aIz+I0xHukj6+lrL@oracle.com>
From: Eugene Loh <eugene.loh@oracle.com>
In-Reply-To: <aIz+I0xHukj6+lrL@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BL1PR13CA0268.namprd13.prod.outlook.com
 (2603:10b6:208:2ba::33) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|CH3PR10MB7119:EE_
X-MS-Office365-Filtering-Correlation-Id: fbce5ca7-e912-4fab-ff19-08ddd125959b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?azlpeTRxNkJndCsrMXBBSGphNXpKRlViQk5BTjc3ckZ1NnhWa3FvWUQrMGox?=
 =?utf-8?B?d1JhYmZuQWNRQ2kwb2lLWlJvZXVESFI5amhEaEQrQW44RzUxMVlZL0t3eHY3?=
 =?utf-8?B?ejRvWG9BZVJjbm9nNlV6Wnk3aEtpUk1kYUhDOW12czFJR3dWZVFxWUkxYy9J?=
 =?utf-8?B?MktiR1dQSzB5MFkzdzRkbTR4VnVNNXJXYVVNMFR4VElPaEFVdzB3eHRiUlRK?=
 =?utf-8?B?dkdCdnh3Q2J3T3VZbHpKL3pVYXloK0t5R2srWC85aXpHVCs1Q0RWL0pCVXlS?=
 =?utf-8?B?bDBLdFRsbW1wYiszc1pVeERzQjVtMWpsc05TM0doSk1qaEhPdFA5ZnhZNjla?=
 =?utf-8?B?YWtxY28wVDlWNUtoYjMvVDNsWXhCeGtVN0ZMNVI4cFA4ak1WMHVVSStoT3I5?=
 =?utf-8?B?dmZtSG96VEI5NWt4V2lOZUM1RGQwUU53Mkd5R2dLb3l3a3R6cHFIN05BVGFY?=
 =?utf-8?B?UU11cFBQQkdyd0s4TXZVNjhmQTdOTTRucGg2NDduZkVCRStUUnZObWdpSGFW?=
 =?utf-8?B?YXRSdStyM3BQSmpUMzRCb3I3cUJIeUFMZ1RVa0NUUHp4UXRoeTI0blpsQWx0?=
 =?utf-8?B?SVppOW5peVVNdkVkcmYrZjJTemk1UlF1WURDdjFzVld2WUYxVlgySjdESENn?=
 =?utf-8?B?a09pUFNKSWdneUhyL0dXVXlLdkVNOTNBZXJZL3NXSXlhSzEra0N4M1l4SStu?=
 =?utf-8?B?K2lDWk43alh2cWlFcUt5NFNScmN5bmdRczhOUkpGU3Q3WSs0VWh6ZG1HeDA3?=
 =?utf-8?B?cDdGK2FRaDIxdFBocHNwSXNpeWwyV1BjdU1LaHp5V1RycVVUNjg0WGprTi93?=
 =?utf-8?B?TzJGd0Z6YlFTR2pXOUw0aWMwTFJORE05UzgwTHI3VlJRZVh0cDlWUzRMQ1lT?=
 =?utf-8?B?SkVuNEkxR2lncm9mUWZ3em12TC9ERmlkZ2RsZTFWMnJESjBMbmEweG5LbmhP?=
 =?utf-8?B?Ry9DM29DbVUwMEY4V1NEa0V0Y0doaFdyYnZtNU5ndThRUWNKOG8vVlE0bWU1?=
 =?utf-8?B?eElaZVJrWFFIOUlpSkJSU1haNkVZSVFZamkrT0NLbGlTQWRGWWdUS0xuQnZG?=
 =?utf-8?B?Wk4yN2IwTkViNVlIalhOWDAyVVhQTEo4aGQ3YWxFNE0yakFyVUIxMGZrMndz?=
 =?utf-8?B?UE1xcWZ6NTk2WTZtYjNjc0RFcjN0aDhtZksyTHlWMlQrb3ZqL0lHaDJ6R2hM?=
 =?utf-8?B?OHJzMmN3OERjd0t6Y3YweEVreWw5aHg5a2xxT2Fod1ZvalR1Qy9QMmMzOEY5?=
 =?utf-8?B?TFdwdzBORUMvQzJ3ODRVQXp3Q0lDR2tQbXpsWVRoblA4NEpOMGxPN2ZUSnhM?=
 =?utf-8?B?bW53eVBISER6MWRhbFhwazBRblovZGRyQXFhZ0xhNVZhZUxIbVlvZTNGNXI0?=
 =?utf-8?B?SXJibktheG5CMllqSWdtcWFDVk5iSUl4cTVuK1RPcWpxcWY2Ym5Ob0xiZ1oy?=
 =?utf-8?B?M2s3SFkvU1ZZbS9uWGhBRmtoTjZpakRsM1I1c01VenM3ZHB3Z3pncEIwRkQv?=
 =?utf-8?B?eTFkdEFOY3VkalpDZzRINjV4S3NBMU1XUkV2NmVKRmhyU01YQWRkQUJmQkEv?=
 =?utf-8?B?Y3dDRVVXbXF2eDJBMGNvWmFWNUZuUGltSTMvV0NWSmQxWlM5VlgxRUFHcXRj?=
 =?utf-8?B?OFlWTFNGWkJteUNhUEptc1ppb0RCaS9wSTlnbi9IdDQ4Q1BqUElDWTUyMUlC?=
 =?utf-8?B?ZEVQMkc2L2RQNUsyd1ZqQ09mYzYyNHRocy9hbDRidStyOFRRMytmMHdORmt3?=
 =?utf-8?B?Yyt0blFLaXNtOG1ZQkU5QVhESm11bkg0TUhLY1F0Vk9XcFc2ZVJlS2V4bnlh?=
 =?utf-8?B?VVg0YUl5U0w4RUIrRXJ6ZlJrRitxd2tSWkJTOEU4K2VSVU9BRHpndFRPUE44?=
 =?utf-8?B?TDd5VnQ4ODRjdDdKdjV5cVRLR1lOSm45aExDalJCWnlIV0E9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?L2FqQ3F6bnVBQUhSeCtsWHA3emVMTkZubVY5ZlNDYWk3ZmZ1YU14R3lDQ0tC?=
 =?utf-8?B?OE5nb2h4bEVhK3k5eTZ0OTBPUDgyTjZhN1VVT0tHL29qOExxbG9ZdHBPTmZR?=
 =?utf-8?B?dU5QWTYrbmQ0SDMzeGFzQkRHWlRacUxlZjVoc0tGdVZhcVVCTkI4V1F6NEM0?=
 =?utf-8?B?cmppeEJJQ3F0UXpybnZJODl4ZklIVHkvRHFwemxPYkxRcnZ0ckFvNjNwclJZ?=
 =?utf-8?B?NFZMK0w3NDVRUTZDM0Z1bUJKcXBaSmoxL2p4NjNsSGo1Mndja2dFN0xHS01G?=
 =?utf-8?B?UnlKeDduYlRmZm9PL0V6T2ZFMkZFZ1lhTHU5eXdkY3g1WVByQmJUMlNiRnVZ?=
 =?utf-8?B?bkltcmJpeXlCRUtERWM1OVFBS2liU0FIRklBZCsrZVVGZzRkRy9hai9YWGNY?=
 =?utf-8?B?TG9tNEZBN1pWem1JOVp3NFkzMitqQkJ6MGRFdnNkMnNKNHZ6dE9ncXYyT2VF?=
 =?utf-8?B?OUtyVjZ5QnF3VEhaTFVDWGFpdXJNNnFOelRPK3NhQmtLL1E1QmdBWUxNcWN0?=
 =?utf-8?B?RU9zL3NZVVF0anA3NEJVZHcvNjhVOVpCanZUY0xSWjNndjVVTi9CMDcrU0lH?=
 =?utf-8?B?QzR0VWtIbkVXTmM0eHhSUDFRYk5Lb1FRZ2NLekxlSkNKYmsvVVBPVTltb01P?=
 =?utf-8?B?cmJYN3NKMjNxL1J4N1pWNmtTajZYc0Iyd0ROdVA3VGVGUVJ0WTJPZ3kwbU45?=
 =?utf-8?B?QVhxZHZHb0JWYmFuUDVFRkxwVlZGS2dNc3p3SjdrZnEwcWNZTVFoWUdEa0tI?=
 =?utf-8?B?ZGk0VlVnQTBpSjd6dHdWSFBKeFlrK0k3eXgzcG1jYkNwLzlZbEVKT3ZEdWZn?=
 =?utf-8?B?VWZyRkRXVS9lZW9qSWFFc0hNQVFxSU9FU0JPaFpJU1EzRm11WHZncWpFVy9p?=
 =?utf-8?B?U1hLQUg4OGpnMDNaS3RrUXZsbHBTYjlFMFlKSTE3U3ZBcGxlZWNMek9uWHRY?=
 =?utf-8?B?UU1SZElIRVYvUWlyNXg0TFhxVWZ2eDBaUVNkSm50NHdJMEIxZlZpR04xQ1ZQ?=
 =?utf-8?B?dW5vM25MU245N0tYL2pLOEwrYVJnRFRaWDFSOFEvaTBidGFaRTRYR2pBaHg1?=
 =?utf-8?B?WTlISzdLVnFhdE5LcVdSSllERndoTHBsK3IvYWJlUzNXa1dodjVLc20wRXFV?=
 =?utf-8?B?UDA3SVFUckp5MGNLRFlQeUFXMU1JVFRJZnlHQTZsMjdpZjBpeUpJU2xUMDNl?=
 =?utf-8?B?amdmcnhuOFNUczdyeUtWdmM2SnNKUXR5MndOME5yc2J1TjdtQWhyZEdrM0Rz?=
 =?utf-8?B?R21TcnNic2dMUCtBRGRkYWtXS1pGbGVoVk1jeVhBdi9WRFBOZzZ2RUt1Snpp?=
 =?utf-8?B?RFZNa2ZMK3Y1dDRmL2hBU2I4MmZjdTlEQW5zRWsyQnhLdE9kejZCZTdpRHBI?=
 =?utf-8?B?RWhXZFN2Sjd5eDFnWDZ0MWoyVlFRUG8yNEpQd3RoU2FmaVBGT3BkakhJV0xF?=
 =?utf-8?B?TmJ1bHU3VHhmaFRzcTloNU9aWG9zSk5vMEl5SHRwNlhOUFpFUjQrZldsRnNi?=
 =?utf-8?B?NWlCa1A3a29aQ2swZXp6dk1JdEtEQ25BUDU2bzBOcU1VMFhPbzJuR2FoWVRO?=
 =?utf-8?B?RW9EVHRqdEd6S0Z6T0FuNjY4cXJFQi9zb0lrRmRBcjhJVGJkZTlKbWtONnRw?=
 =?utf-8?B?UzZMck55WFMyQ0tRSkFtdGRvcnBtZ1VmQ3ZMeTNCdWJJK1JkM1hoMGlvaVlZ?=
 =?utf-8?B?V2Foc092dVlpcFRTY3ZvUFkvbXIxQVAyZ2hjejBGbTBJLzFLWnNhK0xJZm1j?=
 =?utf-8?B?QWV3QTNHdmlyb1NmYzFzcXl0ZE82WVM4aVNaazlpVWppOE9vZW9VMTdnN2FK?=
 =?utf-8?B?ZXFScG1ROUx2T2JsR3FFSkg2by9BQ0hkS0dMVmZXOG9ZZm54Wk0vSGFFazUy?=
 =?utf-8?B?aXlOY0dBcFFLWkJpWVRyYkJVOE5IS2JRWHdDaVp3M3J5QjJQVlpZdE5GcUI2?=
 =?utf-8?B?Uk5CYkExWW1HUUtTeTRXdlovb2xqVUFPQVl2VGhYa0NWcEpDN2FyVlVmQTZB?=
 =?utf-8?B?MzlpaEwySWh0dlVWdWN1YTZFLytTQ090TzBKS2FsYW1kR292VXIzV1YwK211?=
 =?utf-8?B?NGEwZk5NNityRCtBQm1Bd29tWDF2cDlWT3EzeXlXTEdpN05kNGNXaVFDQWIy?=
 =?utf-8?Q?+W0PIKPJDtDb1w/Ug4AwNmbbw?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	gwhP3syA7LYfcCkaAVsoOYFI5+7WgiZN199iP6cmB0axR5f4TiJ2Bb+++RSV4WvCxQ2nV2EIqeOpy6J50Bf8ymhTiugZYH2CfGq1hkeF0Oz2EqRYw7nyZrYg4Joy4y7Jf36qyxzcpwLVEct3eshBGXdICWUrOPaT+UWYTOrN/TvitiSqNsY61HWRzu4wxAUVecJMpWHcBA60kGeoWwpc5zSzUEFS+OSbDZSn9/CK9NJNi9GsEik94dDF/nAgDuUqUGmcmBv3eyxjE92+PiUuiUJ+eZfeUd4+I5Cqlnit4fcOvdwulGs9EtWLeEpqznwgZYOAbAMPTtPHv/eqrFtZKAttiTFpBrSqcvRaKg9KD5kVK7jTfJa1JLXkcdSOSMTyl77wEsPMgB429iaAGA36JeyYYZfMn3/9aAQUnTGz6CE+P70okNlWVKa0+mDw6Qyj4wXX15e0QVCN3lA9C/KV3GDZcPYqh2F5RSJcSgtnFtaXkGwjr0AyPk6MUmFk85Qe8+AkmrbBAs7UzCG9wRA9FtVfQ5mqiDHim7KxHckS1R6GH4dWnrtlcRTrG/xl6hHRSn8FlXkFp+PW2bN07qDCXUBo/rLD5zT9MODFnHukK5A=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fbce5ca7-e912-4fab-ff19-08ddd125959b
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2025 18:02:31.4321
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nzobBMBKPW6KN+hYNc+zrTDoxwAZ1LQHxnHldPPmbRnK/VqTqcrd6m4r1F+RXCgZ5Ukw0KVlAM/Wc4drnRnHJw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB7119
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-01_06,2025-08-01_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 mlxlogscore=999
 suspectscore=0 malwarescore=0 bulkscore=0 spamscore=0 mlxscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2508010141
X-Proofpoint-GUID: IeLI8CNw2VRLCkwiGgVRtr95rCkz1_VO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODAxMDE0MSBTYWx0ZWRfX4xHdtibNs4fd
 Tx1kGYk3fVgOc0LIxcGNc41jUPbOFA53zWqwnZEFjmIPxy9SYQC/6/K2VQJ/XwEQUKyDl/KyxA6
 P8ff6al5IKUbOLT+8cX7rSocO6NSTzK/OvyGsaZ/lz/QL1nw6OBIBDxfAm7eg9YCVoX4HdR52HK
 Otj4x/IXa/r6744n4uUeNQnZF5yOj1wkWnH+dnM1yWYnnYkrAHGKbAU/CHZTylRlDD5RHLdq+vO
 SUz/nNHWKozbFfiCuN7LXOm0uqdjReri31aqikK1ijDnZQmtLkshopIlmRAGjxKC73gmIog8sB1
 C0b/s5URZ9rCRFl8lx2TG0/osqTZftvUsMnix/tYsAp0+ypH110M7IK70LFzxmmbXcdGqvdVSla
 4Z1oB3i880eAAOVBqZ5ONNQlFgpa6pBSMG6e9jszDB3j+F2DyCDOgUIabYHScssIs+e+pmeb
X-Authority-Analysis: v=2.4 cv=ZMjXmW7b c=1 sm=1 tr=0 ts=688d013a b=1 cx=c_pps
 a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=lb8mcbRyFir6xY-D:21 a=xqWC_Br6kY4A:10
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8
 a=SSjFolz0AZo0dWS0Vm8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 cc=ntf
 awl=host:13596
X-Proofpoint-ORIG-GUID: IeLI8CNw2VRLCkwiGgVRtr95rCkz1_VO

On 8/1/25 13:49, Kris Van Hees wrote:

> On Fri, Aug 01, 2025 at 11:36:17AM -0400, Kris Van Hees wrote:
>> On Fri, Jul 11, 2025 at 12:40:24AM -0400, eugene.loh@oracle.com wrote:
>>> From: Eugene Loh <eugene.loh@oracle.com>
>>>
>>> If a clause includes a destructive action but -w is not used, dtrace
>>> should not start up, even if the clause is ignored (due to -Z).
>>> Solaris treated this as a runtime error.  We should do the same.
>>>
>>> The test err.Z_no-w.sh was misguided and is replaced by a more
>>> direct test.
>>>
>>>   delete mode 100644 test/unittest/usdt/err.Z_no-w.r
>>>   delete mode 100755 test/unittest/usdt/err.Z_no-w.sh
> Why did you delete this test?  Isn't it still a valid test anyway, and since
> it tests this in a more practical sense, it seems to have value.

The test was failing consistently on every platform;  it was based on 
assumptions that were eventually discarded.  So, no, not a valid test.  
It assumed behavior different from what this commit message asserts.
