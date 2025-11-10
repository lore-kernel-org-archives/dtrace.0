Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84B45258ED1
	for <dtrace@lists.linux.dev>; Mon, 10 Nov 2025 20:46:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762807590; cv=fail; b=LfN/hapg4YxBolniJzgebK6A9V2oWORC1EMWFbj5Na18r+y/iCgEuwPLPcY89LdTFZ3f/xsee+9cbOJdtWXkTHm4U8EmvMNNpvT3MyLoSUuc78OsUbqH5r/IKRwBY4v5rbSUROih+n8I0nCG6ZCdOFvz7bxMtzB5riOYIirnC5s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762807590; c=relaxed/simple;
	bh=Bflku6z+zrQqe0R16N3425Pt2aH3+JErlYpHQCgsIOs=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=p4xo8LxzHPI44u6k5zl+OW6EiimUAmmrP8V/+aLKGyc8nS44rSzHiIk1prp0NKeeuHTr/bQ9FNlGdDeKrYgdle+sC9jZ/ndaaPAxbJeo789P7IIEyDf9Lv2jBDDMdT3RmxtnxyanscvYEpXso65agDyyrMnqOuEY66L+BErUBJ0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=iYPgiN54; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=c9EPemW6; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="iYPgiN54";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="c9EPemW6"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5AAK9HWQ018246
	for <dtrace@lists.linux.dev>; Mon, 10 Nov 2025 20:46:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=FoJzkFiaMxFuiLCpqsJpXaOmQBwubacZ4ftO8MJNkEM=; b=
	iYPgiN54XDEw6IbXexg9NbuaOvRdIxK85SUw7V18JECzuk0+RRK5tJNHb632LUbT
	pttnIrZ+hJl6cVNTMtYO+cmPnpyoVGbM2+dU5DdlujYRw9qi/G5Tiyeoqi9gwTsf
	QPDWCsCBWEpb7oPDbKgo10iqMByWBxvMOpkraS4jMhr6jLplKHwuUpWbutajZPh5
	z7nclWtuPiO35BWTf3qp1XMT2IOf7gK1eI1EAHXnpWU+6WRtCFuWK+g5sydyW44g
	M99g8dxPrb5hofhzubmdtDxBQnsklxFh+zbPhrYkBzcsE8+cHXqFXJqePerqmaL8
	6iXf2nHcs2YHqV21wkIrLA==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4abp1w862s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 10 Nov 2025 20:46:27 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 5AAJl2mf007627
	for <dtrace@lists.linux.dev>; Mon, 10 Nov 2025 20:46:26 GMT
Received: from ch4pr04cu002.outbound.protection.outlook.com (mail-northcentralusazon11013061.outbound.protection.outlook.com [40.107.201.61])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4a9va96666-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 10 Nov 2025 20:46:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q6P9QCD2kbeTvzqZoslfYwvdcrXDP8D6hshUQgq6yggAC1mRgheBUPreGmiIqjK+x8ADp9LGmD175EMvXfxmjjfOHuPjgb69hzPltZclkO6TyKbqIJTEhf2CK52DKJg4XK8H1WZwczDUCnDl3Vak89t+YaD8es/Ptav2DbnqxGU4FG4vD6yrpuoBVJm/Pp+oVKvqaiTFhw8VTBQnGyQBFi1afnclb1lXLzWeUqR+ULGLsCw+KUgCEaA/8YjG+Dw1AEM1fhKmwr5GIla/Ut/nkK3liNZAfkS73ETrHk0ecftsV6KH9LrVVKOLYPEK6ZrSZm6l36kRdnXkmqg3niHOFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FoJzkFiaMxFuiLCpqsJpXaOmQBwubacZ4ftO8MJNkEM=;
 b=NIXnxqROw/gknXZeD70r6YndrtdoU2Q55C5kWLaVOj8JuKJ1KvVyTYILfLNZvo23AvX5+LiudvOItmQ+YWLpOigtUJssUIe985bUzONiOgLe42HB7bj/DkAxdqFm759sFBMHl1Lk9uQk7yOZ3kYe7pnpIlD6X9RpxiQzkJ2Fok/xydjPSOqagM88lHET7ZzsHtDl8l+YnDc6jJy6sVYGfZ3vsZDpAq2SPTHVUQu44jY6EiWMngYmruLMZoIe+m/f+lI1Pr4exRYjJ/VQv8AbzUMFE4W55cCdu0moLRM+ueVv+fIpFTNH/NCFcoXyic37QQmj9qM9SN5yhDnnV0ZW1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FoJzkFiaMxFuiLCpqsJpXaOmQBwubacZ4ftO8MJNkEM=;
 b=c9EPemW6kJcZom7tSma7agaWH7z9Z531erut5Bpt5PtzFbGACKwTCt7R8GqgaQbrYjdzlgtnZkfI/JluzvWnp/LT5IAkMUotoTwW54D8nXcQjRJ/2fCmph/ZWAtp6s6R9xmUVi4zhkKsOTR8Q1F6Nnwd5908DI2fB1sUAAMkob8=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by CO1PR10MB4612.namprd10.prod.outlook.com (2603:10b6:303:9b::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.13; Mon, 10 Nov
 2025 20:46:23 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b%6]) with mapi id 15.20.9298.015; Mon, 10 Nov 2025
 20:46:23 +0000
Message-ID: <3f2c11d1-15ef-1f7c-ef66-75f3f2fb6a6e@oracle.com>
Date: Mon, 10 Nov 2025 15:46:21 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [DTrace-devel] [PATCH 2/4] uprobe: remove unnecessary enable_*()
 functions
Content-Language: en-US
To: Kris Van Hees <kris.van.hees@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
References: <BY5PR10MB3987A07CB117002F8016B825C2CEA@BY5PR10MB3987.namprd10.prod.outlook.com>
From: Eugene Loh <eugene.loh@oracle.com>
In-Reply-To: <BY5PR10MB3987A07CB117002F8016B825C2CEA@BY5PR10MB3987.namprd10.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR21CA0004.namprd21.prod.outlook.com
 (2603:10b6:a03:114::14) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|CO1PR10MB4612:EE_
X-MS-Office365-Filtering-Correlation-Id: 5acfae0b-3f21-4de1-05d4-08de209a358c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Z3Uva3ZjZ09nZm4wMWtDZEQ2RXdXejJZaFhzU1FnWEJMN01mcWFsa2JDWHpR?=
 =?utf-8?B?VGVYY0NJS1NOMENFckJMNDZzWU0zditnYWNVc2RXVm9sZXhBNTFUUTZmdHVK?=
 =?utf-8?B?UkNWZjkyeFhrMG51M2laQkUzTkc0QVJXWjZKOHZBV29FNHhiVmVPb2d2d2R3?=
 =?utf-8?B?anVYVlM3dS9iNEcrWnEyUUFONnprV0paYzhKSmdydHByYkM0RythenBvQUVm?=
 =?utf-8?B?K3RQampLdGoxay9RUk40UDFpaG1sMlBzK1FBUXpkNFFNRWxvLzVKQ29WTDZX?=
 =?utf-8?B?V3dxcEl4b290N2R6U2FjY0NuMkcrYitSZGU3dWFhN1lyVzYxTFN5UHRDYm1i?=
 =?utf-8?B?L3h2N084S0FlQWtQa0RyWW9sR1dWcmlKalhNaldMZFE3b2o5SzN6SGhPVW5s?=
 =?utf-8?B?N3Q1MG82VFZuYU5KMjVkZ2thU0tucFdKdnh5bWZpcUtpT0JhWisxZUxTMjlp?=
 =?utf-8?B?SDA0bHVjWE5MQVBIK1NDLzYvMEVteENTWGtBNWdiUHhWSkgwK1MzQmpLNUR0?=
 =?utf-8?B?SVBSS1RNL0pHcC91YnNQS0pUcTcyME1FTkxDT1dLbjcrNmEvYUR1dVZOc1U5?=
 =?utf-8?B?OFFjVGtDZVZoWEhJZHlEVHp1cHNzdFZQbStwdmd4Sktva3hFNHJCclR2bnlV?=
 =?utf-8?B?ZGdzb3dYbElkSGNiRU9WUngxQTQvOVQvTEZwUThJQ2x2dkFyNGlwWU1Oa01Z?=
 =?utf-8?B?YTI5OWJ4eWlLTWtOeno1N3diNWx5U1pHRnlWbGFEMHQycXhGeDB4N3N6cGJP?=
 =?utf-8?B?dGxsWFBIZFFTcWlPUUNSU1B3RVFCZGNkVTFnNlIrM3o5NG9qL2EzR2lEcUxV?=
 =?utf-8?B?ZFgxUXV5QjUxelg5M0dkaU55Mnp3UWR4MW5DUFJMVExSSVFDbFFBY2xWYlNj?=
 =?utf-8?B?RDhkelZXWmdxVFhmMzdDZ0pOZFRWNHROUW53c2RMZjNBUVQ5akVvdXVpUXFT?=
 =?utf-8?B?eHd2cHN5L21YKzg3RUVnL0pOYXNSSlVyTUcwMm9ZT1dyckYwSThHanVkOVBu?=
 =?utf-8?B?Q1JPdXhHbzdKNm5FOXI0VytOUXZRTlhVZ2FqS3JFMEdCWm9zRkNnZkFYRnN6?=
 =?utf-8?B?enNyVE1keTBJWXl4UW92WDFScjU5Mm9hRjR5TUhlQmVFT1hGenhIb1I1NG5X?=
 =?utf-8?B?UTQ2WGhkZWxyeXp0cU9nS2tKSlhMWXl2MWxGOVovZDcxNXRMVXA0bWlWb1JU?=
 =?utf-8?B?cUwyWS9GZzhwMWZPOUVhZkVsSnBQL0h0ajdJcVJ5MDViMEd2RDJBRTJ6bHBw?=
 =?utf-8?B?eTE3N0dIVEp4UDUxZ2kvaDVvU1pXeFdYMkR1c2IweHdub3ArNktFalFMNTd3?=
 =?utf-8?B?cVl2THBBSExIVG5xTFdLSjBVQ0FtZU9LSFM0WE1PNzdLQkR1dnlmUDcrQXN2?=
 =?utf-8?B?Qm01Ty9LQXhDc1NvR0pCdkpYUkhBVUh6UGxtOWpyRjFzQVh3R0t4MVU3b3ZC?=
 =?utf-8?B?bi81bHgrQ1dBMzJoMTcwZ3NlUS9JN1kyZlFNbXNTaWp4T0Z3TjRjZ3MxQkFH?=
 =?utf-8?B?TzY2cW1VV2wxL3F1RUdmckxsSHkzU1plMEFZc0w3aXpERkhIY2ZGdi9reTda?=
 =?utf-8?B?ZzM3MlBWbjZaV1lIU1JFZXhkTnZiZmduc1MyWldoaEhNOVhLZXFwbnBhU1gw?=
 =?utf-8?B?WUt5UktkVjJJaGc1dm14cHRjMjBmUEN2SlBuR3RYOFZ4SW9GelUvZmZWL3Iv?=
 =?utf-8?B?ampFcHNWVUZmR0xOY2tFZktiZWNZOG1UREJiWitKNnFvcVV4aThpaFJuVlpD?=
 =?utf-8?B?czkzbHJXaW1VWStyQnh5cWRHWFdYcWV0T0JLa3dtWVV6Mlp1YlpLU2hLL1Nu?=
 =?utf-8?B?R2l2QkhxRWZYZElaT0RBTWxHNE43ZHRrQllYOGlUb0h2WTIwS3YvWTIwQ09C?=
 =?utf-8?B?TzZvRTNwWitSWkh5bzdsWGRNSUU1dHo1WHE0aWIrSW1vK24ybldiWVNuRTEv?=
 =?utf-8?Q?qyFph6Sf8bcXV8IL6V0agou0ScEAe/DM?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Q0ZYZEhkMHF4SzJWcVBYNjBDQlFZM0R3L29tdmczdnVDTFFxOXhndm11TURG?=
 =?utf-8?B?MWZVMWNTbHc1V2RUKzNLNmVVQzQ2SGloNXNFWllOaUF3MWNRckl0cmh3aWFy?=
 =?utf-8?B?cEY0WERWV1VEcDR4Y1B5TWdwSjcwVHN0VEtkZ3JUOUlGbHNOOGU3UndBVG9u?=
 =?utf-8?B?Vkg5L1RJM1h0SGViNkhSYk1Ja25iNENMblVUeXZNSGxnNDBtelJueU05VWUv?=
 =?utf-8?B?ZjZMVTJOV1ZGV3NjQ3poOVpSVXNzNm51NHd5TUpOQ1dSaEp0MGVuckRPaE9K?=
 =?utf-8?B?MUwzSFJjT2tvWWdUUDJnclFNNW5vT0dYaU82U2NTakZxcGdHMlNZS0g3N2RO?=
 =?utf-8?B?S096bldKdENpUnJ6cUpQK1dYK080UW9hYllscEpLd0xFSGhoaCt3dW10OUVo?=
 =?utf-8?B?SUljNUh0OGxleUF5anlxRURMNDk5U25JQ2YvUEtacWo5ZzlJSGRPOXpHRVky?=
 =?utf-8?B?VDBkL1FZNnMvSU1GQ2E3VHR2eTBPcFp3eXJ5Y1MyM3p3ZjBPTjE4Z1QySzZu?=
 =?utf-8?B?UEtmbUg2WTU4WnhrMjZndzBwRmVnSTQ3ZzU4NGRMQmlFcitid3NvWEFhTWFk?=
 =?utf-8?B?a2VnbzBxNDJkRGxTenRQL0VOaVZQTS9sbU9DTjRkQldDTDZBemlXREs1aFh0?=
 =?utf-8?B?c1Ryc2R1TXZzbFN3djFCSWgvTGFsVy80czJvbzVtYlRFMEJ5Rjc0a3NUaVNF?=
 =?utf-8?B?a2VlTHl2UGpMTkVZbHZxdDlwUEJnOG83eExnekVHRnM1elVuM0lCMHA1MlRr?=
 =?utf-8?B?Rjh4bmREWFQvdkU1Nnh2SGNYVnoxNjhFZXRoU1pqbWlxOXFvR0oxUkIzT1oy?=
 =?utf-8?B?UGR1S1hjWGw0NXVIZ3J0OFdZMHdsRFZZZWJVVGtZWXpWTUN6Tng2VjY3WmFv?=
 =?utf-8?B?T2xENlM4dlAwVWpIa2Q2RnRjR0RIUktEWWhXQzhBV1N0aXRIQU9adlBqMWtZ?=
 =?utf-8?B?T3A5M3RLQjllNnQwT1BSR1dtTGJsL2ZNSDl1MTJBdUdYeHk5SnQ4ak1STDBD?=
 =?utf-8?B?aUhRaWZ2dncyQ3RXRnllbUZyb3VyQ0t2bWROTWY5ZkVBTldvSUdwRlJHQ3Nv?=
 =?utf-8?B?SEZ5cW5YUSsvVk1rWklWY25hTzJlUE4ycXA5R0s3UVE4MHh3Y3dKYmdrWU5m?=
 =?utf-8?B?ak5zQzgwcHNWKzBoK2VKdzB3V0dSdDEvSHBHUDVIeFhpZGxIMzQyQTRIcWVH?=
 =?utf-8?B?ajQxYXlIUFp4YndmRm4zd0RKUS9nZnFtSjZLeDBGUlFSR21rWFFtY2NScHBB?=
 =?utf-8?B?WGg4K0xjM3lwRTl0Z0F2V1VBU1pUYkV5VGxvUFRWUDIzVlYyNWw1ZzR6d1RR?=
 =?utf-8?B?LzNqKzFncWV0dFNiK1ZXZ1pxM1I1L3JpRXlHZjhNUW9PU2dOaEw1N3hjNnhz?=
 =?utf-8?B?QVQrUHl0NTlHSGdERTVSNUlMUlYzZDdCcHpZdnlwc2FjSEE1RUJUWVdVREtG?=
 =?utf-8?B?dVU2RGhtSkNZQ1hLbmdDaXA5SjkxVnFTT1VoSVA3dGRDcW5CRFU5UGpvUU9X?=
 =?utf-8?B?blo5VSs3emU5OU9rMDZFK0NTTzBtMFNFNFBoTm9lSW9sWFFqUENVL1QrK294?=
 =?utf-8?B?aEl1ZkZHTW10TU5BNTU0bjUzb25zSzlDUnVZcWNMWXd3SndCZVlUOGdGeEUw?=
 =?utf-8?B?QkhsNjlWZGdpWXBJK1o0bE1WVTJCelgxa2hBSVJOZXcvY2plZmZ1VWJFNHJU?=
 =?utf-8?B?ajhtd3U0THBESHZ6SGg0cDZZU3NNV01vVTFMZ1lYV2VNRlZ0RTZOMjg2bVUx?=
 =?utf-8?B?L2dhcGNIN2xadnRDaWpDVzlmRDZwVFUvWnFhb0kvNitqb3hTeEh3YTBXZ0oy?=
 =?utf-8?B?NzZrd1NyaE9VQU52YXlsait5M1pqdm5SemhoWDBpWDVqRjdZV1pVdldkQitx?=
 =?utf-8?B?K0V3K0NDODcwUHZHTE1wd3dweWtjRFMyMGl3Nk1qMEpQcVpXWGl3OWh0UUJy?=
 =?utf-8?B?b2lRV1FWUW13bzQySEhSdE1ZSEZZOHFabmVMWmYvb05VdWlmN1B6NXZ2UjV0?=
 =?utf-8?B?NUI4QnNxajNwMzVOUnZvOGJOU0tFbG0xM21EQXNaaGVWbGNMVlZMdXZ6aFpl?=
 =?utf-8?B?SXdaVy9RMUtJWVViNzN2S3FlUVJSbHpDRStWakhvZWZXaTE2UEF0T3FYUzBB?=
 =?utf-8?Q?wwaapfiujcG1b6vGkmTASLmxZ?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	OoqjcD2FRqGWodyh+uWjBs1E32fEgVfqLC2Cd9dKThLuH0mqsgDs0L5Al5rgsNo38RHoyJRZJ1fBZjvOQPpFT3tV3vM4vOcIkfMd5fm3wx5hx6N5j9RPKw7jmy+WlO6f1b1gGNECoAvLfc9pHbkYMgR68DgYJSgGV8auyHi3D3T2Sn+7xO+lSzZvUGv7mlx/kkQYfDQUqBrY5lr367Cio6wuBMdAwLTuQXnUW81uoEcJ9d34a84/fN7ICWNy2HdWfdyPBRa8G0MMjHQkq9JYYKe9iSlQbDDOY4ISlrDwIOw/04NemJ7XG5hAY4bjW+pIzQ9dFiRQLRIPpYfdeQH78KJkDKG0+Q/Uxm3xSGhX7DU5Cdr9DsZ7Xv+DAtzzqc3mblfveiFVmRUZGDRWBZcB2eMpT1J2Imy4v6FAUBPLZlYjBn73q/HSOXxU6ve/Eje2978g6UhtieLkJKykTkrAyvH18kvobx70Ge2fm9+G1CHx5+/icCnxqFa+e2hNR72pbeIrRwIlVzqVdlipupz7yKRUOUIjQIcwj8nqe8DlN40+B6N+C8KwPt0HZsG0f7IE6CqVu8ZOyp2yCvwNVKaU+qj/ycgHJY0y1IU4uTIyCZc=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5acfae0b-3f21-4de1-05d4-08de209a358c
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2025 20:46:23.1788
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BVxkswvEOFB2MtR9T9SaBEKalqrmSPfb8oMyt9nx6VHbBSv6YPrtjropLELT0dspHs3rsAQNnyFGSsoH2ETpKQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4612
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-10_07,2025-11-10_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 malwarescore=0 spamscore=0
 mlxscore=0 bulkscore=0 suspectscore=0 mlxlogscore=999 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2510240000
 definitions=main-2511100176
X-Proofpoint-GUID: uioFwYdrk0HBnr0EaZ0GYkezNVOfiys0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEwMDE2NCBTYWx0ZWRfX40fjBDnTVL+b
 Oz8Cm84yUupdnx4Tl+9Raxp3ewUPe/cU71D6jC+sVRhSCQ+4xf8ez6nS0PZ1RvRtdjTNrmUMs+l
 M5mghSXeKKGOz6MyORUXWC3S3oN/myr+ZeDQWruHXV/4+gvQqJiaxub4ThGPg99C1f5moZ+FedQ
 P0/o968RGwwiTLLIgs7IBCvScVAp/77RHt4YvZthZDWbs4I69OQeBR78mXgj9oeuIqXxbaaIVUK
 Umb+nVoOsjGBzrdDf/UpFNlRRy4WTmLMwMxmpjpofAfTWfGis7ZaYt76nV6exS9OGWBGjEH1Kpd
 6KbDNxP/RR5z6A33RxWaoBkfy9eySxyXt2wc6VMkuFV6fMghY+E7CPqIfTqwPRYgGnXThMRTqTD
 4+zDYCEwTWuf4dC14ExvU8XLvn0OBg==
X-Proofpoint-ORIG-GUID: uioFwYdrk0HBnr0EaZ0GYkezNVOfiys0
X-Authority-Analysis: v=2.4 cv=RLC+3oi+ c=1 sm=1 tr=0 ts=69124f23 cx=c_pps
 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6UeiqGixMTsA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=yPCof4ZbAAAA:8 a=rPkpCAgMGY84fbwV1U0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10

Reviewed-by: Eugene Loh <eugene.loh@oracle.com>

although, admittedly, I wouldn't mind, e.g., a one-sentence commit 
message like:

     This clean up should have been part of caf431aed4 ("Remove the 
is-enabled provider").

(Oops.  My fault.)

On 11/10/25 10:27, Kris Van Hees via DTrace-devel wrote:
> Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
> ---
>   libdtrace/dt_prov_uprobe.c | 26 ++++----------------------
>   1 file changed, 4 insertions(+), 22 deletions(-)
>
> diff --git a/libdtrace/dt_prov_uprobe.c b/libdtrace/dt_prov_uprobe.c
> index 3b7145a5..6cea7f4c 100644
> --- a/libdtrace/dt_prov_uprobe.c
> +++ b/libdtrace/dt_prov_uprobe.c
> @@ -1166,7 +1166,7 @@ static int provide_stapsdt_probe(dtrace_hdl_t *dtp, const pid_probespec_t *psp)
>   }
>   
>   
> -static void enable(dtrace_hdl_t *dtp, dt_probe_t *prp, int is_usdt)
> +static void enable(dtrace_hdl_t *dtp, dt_probe_t *prp)
>   {
>   	const list_probe_t	*pup;
>   
> @@ -1190,24 +1190,6 @@ static void enable(dtrace_hdl_t *dtp, dt_probe_t *prp, int is_usdt)
>   		dt_list_append(&dtp->dt_enablings, prp);
>   }
>   
> -static void enable_pid(dtrace_hdl_t *dtp, dt_probe_t *prp)
> -{
> -	enable(dtp, prp, 0);
> -}
> -
> -/*
> - * USDT enabling has to enable any is-enabled probes as well.
> - */
> -static void enable_usdt(dtrace_hdl_t *dtp, dt_probe_t *prp)
> -{
> -	enable(dtp, prp, 1);
> -}
> -
> -static void enable_stapsdt(dtrace_hdl_t *dtp, dt_probe_t *prp)
> -{
> -	enable(dtp, prp, 1);
> -}
> -
>   /*
>    * Generate code that populates the probe arguments.
>    */
> @@ -2035,7 +2017,7 @@ dt_provimpl_t	dt_pid = {
>   	.name		= "pid",
>   	.prog_type	= BPF_PROG_TYPE_UNSPEC,
>   	.provide_probe	= &provide_pid_probe,
> -	.enable		= &enable_pid,
> +	.enable		= &enable,
>   	.probe_destroy	= &probe_destroy,
>   };
>   
> @@ -2047,7 +2029,7 @@ dt_provimpl_t	dt_usdt = {
>   	.prog_type	= BPF_PROG_TYPE_UNSPEC,
>   	.populate	= &populate_usdt,
>   	.provide_probe	= &provide_usdt_probe,
> -	.enable		= &enable_usdt,
> +	.enable		= &enable,
>   	.probe_info	= &probe_info,
>   	.probe_destroy	= &probe_destroy,
>   	.discover	= &discover,
> @@ -2062,7 +2044,7 @@ dt_provimpl_t	dt_stapsdt = {
>   	.name		= "stapsdt",
>   	.prog_type	= BPF_PROG_TYPE_UNSPEC,
>   	.provide_probe	= &provide_stapsdt_probe,
> -	.enable		= &enable_stapsdt,
> +	.enable		= &enable,
>   	.probe_info	= &probe_info_stap,
>   	.probe_destroy	= &probe_destroy,
>   	.add_probe	= &add_probe_usdt,
