Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA209264623
	for <dtrace@lists.linux.dev>; Fri, 24 Oct 2025 23:50:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761349820; cv=fail; b=CGBOGSWGRaq5EUHGESsbq3n685e//Z5wjq/+wTDVWGmwk6MlUSqMxCO6PzVAf1hT/9A1rwU+IH61KeuRcX+B7GIvJnKGdGaT1b6TnNExzdiYDs6Qd3P0u9Y39EqLWiuLGdwC5DAVsXv6rKzTCsj8B+Nw5fYBSDvS2E3iFrIOqRQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761349820; c=relaxed/simple;
	bh=th7yNNqSCEzuhVQXUz59OWnkm2WFoqm7h0dIDGW9+gk=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=nv/Fw4/JtgHDm6DvwY+DcviM4NFI+Fz50j0Wk1UKnojqQntm+Aplnn8HJP5Su1xm4tFWi2EN7uwzrpWzrOH6i6/1DQrV/T9i2CWTXYIL/9xO0Mkq/JbswqRbP7uqmaOTbkjThv+bsoPzPAe3POu/zh885tx3kATtdm+6+pGpTEo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=W80VoEJz; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=wdIUCgRP; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="W80VoEJz";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="wdIUCgRP"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59OLq5dH007212
	for <dtrace@lists.linux.dev>; Fri, 24 Oct 2025 23:50:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=g42O+gsLUUgdz0qqFR5EtfUqkx6Gea+m3bcbWIvj+u4=; b=
	W80VoEJz6VGqt9Kw4QhZBI7iikhEHpegtijSRy9jj822nWh+ks3hGfDNYef/rqer
	fucgis5mYJdsYNTHDWoUyML6VBYyGVF2eCIzNA2BuOnkmhBOUKdi1nBEdp7sAJBB
	7ySrQX9yZ1M1KhADx5Bm6u0N3LlkqNFaACsCUuSXQL4Jw8tKRO4CXOFJ/6iZucuO
	i3cnpP3SYWYAouDHXSblEJ6OG34m/3jvZktX98ODXkx3LSpRwjB+WkkPSDWckVVC
	NMc3leK/xGz3avo2n0BNfXAdQbfLuvktnAxsXS9MZ3UqTBX84JHPublqHsJWEMMH
	i8h6H82otcS9v7hJXN/3zw==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 49v2vw4xyu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 24 Oct 2025 23:50:11 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 59ONU09u027988
	for <dtrace@lists.linux.dev>; Fri, 24 Oct 2025 23:50:10 GMT
Received: from bl0pr03cu003.outbound.protection.outlook.com (mail-eastusazon11012014.outbound.protection.outlook.com [52.101.53.14])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 49v1bghcfv-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 24 Oct 2025 23:50:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sCFL/rZtwR6iiYd9CCseKUI/wywNWN8zRJ6PaT6+h8wY7RyoAZ7bGgcvz/t11c9B7B5ZRzIy28KOzXXmvBitBajUwYy1lwU0mHPurKjeaLPPjpMaDaxZ9ZMwWPEsk7BOkVx/F5EuYJL/5zhBCu8hj+J5lmFYr3k3sWvV7efaLyInsVcSTGJ3yZYMSLvF95fGKiPMoTWQD2n1KZJV/F7uGkv/lNi+IbX6VBjYiXSfThNTDtBW0ODICyJerIYIHTgCTdUlVTzXUwe6eF40QYeZ/Qx8Bly6u4wMxITRpscTpl3gwf5rgy4R8jNYvaOymO2KylaijQEfMoMO8FoLzM+l6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g42O+gsLUUgdz0qqFR5EtfUqkx6Gea+m3bcbWIvj+u4=;
 b=e8V1xb8nYJPe8LLsZuVbjsCbEc2Xi3JQCoxLK/Nqm8qaPzSFhpu22Vzw9/e78x32uKCuR/v4LqTIHDMVYntITSCvxZQxAROxCbyVOWAHCRxlV+UD27M/FqqZ3E5QuB6OzNyg0KH0wH0ILYNUNQZUmGfgwPDHGVKjqJ2QgF3pujzw/w2E56WN0idqpkf4W5czZMvoIJXvxxBTpMKwpfDBdAQjJO88moA5djUTUxx4RqMt6OCc4JUd7LzPrX/hue7oX5+cWoY0h8YWO+iDFis4aSOa5KI3AzdSxI7lbN2AnDIrtE0E9LGWZJrSm4NXA9tcWMxfIFe4mO5kSNgs1kxp8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g42O+gsLUUgdz0qqFR5EtfUqkx6Gea+m3bcbWIvj+u4=;
 b=wdIUCgRPGt6KSpYVuW9O6UGN+awa0A7pN3NG3CtngORmWZV+TbvNGCdOXeaHD2BYxyy5indnVx+W25w7cr2LWZh+F+oJL+1C8qj/0eKJdKNGRz3BnGYSR0bXAIdFHli8PbTAof8FCioR63e+KCgnKoW/egfgJcy82qwGiwO60ao=
Received: from BLAPR10MB5075.namprd10.prod.outlook.com (2603:10b6:208:322::19)
 by SA1PR10MB6661.namprd10.prod.outlook.com (2603:10b6:806:2b8::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Fri, 24 Oct
 2025 23:50:05 +0000
Received: from BLAPR10MB5075.namprd10.prod.outlook.com
 ([fe80::8f5:4de9:81ce:f5c6]) by BLAPR10MB5075.namprd10.prod.outlook.com
 ([fe80::8f5:4de9:81ce:f5c6%5]) with mapi id 15.20.9253.011; Fri, 24 Oct 2025
 23:49:58 +0000
Message-ID: <d18d670b-780a-4776-ad17-e426548e23d0@oracle.com>
Date: Fri, 24 Oct 2025 17:49:55 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [DTrace-devel] [PATCH] doc: Add blank line before bold text so it
 is rendered correctly
To: eugene.loh@oracle.com, dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
References: <20251023231611.25338-1-eugene.loh@oracle.com>
Content-Language: en-US
From: Elena Zannoni <elena.zannoni@oracle.com>
Organization: Oracle USA Inc.
In-Reply-To: <20251023231611.25338-1-eugene.loh@oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: CYXPR03CA0077.namprd03.prod.outlook.com
 (2603:10b6:930:d3::19) To BLAPR10MB5075.namprd10.prod.outlook.com
 (2603:10b6:208:322::19)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BLAPR10MB5075:EE_|SA1PR10MB6661:EE_
X-MS-Office365-Filtering-Correlation-Id: 1955072a-cd90-4db6-2f4f-08de13580a68
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|10070799003|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aFNxZ0wvVVVkOEhjT2tIL1JNNWV5aTAwYkVmbXNLcGVYWktTNHllQTRTUUQr?=
 =?utf-8?B?Y24rUzVhbTJwS0wwREJTRDhnM0FzRWRJbk14WnRCNVFaa2licUIzdlVDYzc4?=
 =?utf-8?B?SjkxRkxVbjVVbW5rdlBjaHpEOUNIaUZnQkUvUjdGdkhXdEMyOWtoWEE0R2hS?=
 =?utf-8?B?YmFMNWdkZXF3dDF2U2xXZXpzaTNYZ1JIekZEK2RVK29xTnRFb0xKUWpJQXV1?=
 =?utf-8?B?cHg3a1JRZGtYc0dkQjNVMHcySndiK2tkRTBmRzZ1SUdyZUJmTklkN201YUxW?=
 =?utf-8?B?ejFWUjBmQjVJUW9NcDJ6YkVmVE0wa3BaekN3OFhidFVzeGZsNUZVUFJ3bkpG?=
 =?utf-8?B?Qm1JR2lLOEkwb1NQYlFuNU02enpIMHptb0xyNlB6OWFsb2dSeC9jSWN1MkFY?=
 =?utf-8?B?OFJKbXlHWW9RWG5Say84c1N4V0UwM0lXK05VZExWY1lQeHNBWjdCNDloS01v?=
 =?utf-8?B?UGVSSmJUSUFXSnpSeDJoMDJnbkNpM1dwMzJ2L2Q5a2lYNVhHeWplSlVMU1ZL?=
 =?utf-8?B?SDlTS1c1OVNJZ3MvdFlkSHQ3Wi9wQW52dTRtYndLMmt0dUMzK3VwYWZRWEtk?=
 =?utf-8?B?dWtvbjdORUJ6enBVdmNsUWs1M0IvaEhrMTU2a3ZhS1I5MFV6dHNtcVdDeGFO?=
 =?utf-8?B?TVdnOUpwUjR5M25vcTBQa1VMZ1B1aWJ2cldqNXlNTVhGSDdXMFFvUzY4d1Fr?=
 =?utf-8?B?ODNCUXNqRlZuQnJHUEgxNTB5S042SWlOYlVlR3dQK0c3SnR3VUNoNXRjVjlR?=
 =?utf-8?B?TnlNbFB4ZTk2a1gxUGpzZjN4U3VjaGg1Vzh5YS9NU1ZidWl6MXIxcVhrcDQ3?=
 =?utf-8?B?NVlIajdkKzVNdjZZRytFckNiZEMzTXlJLythcW5aaUxoazlCTUgrQlplOHVk?=
 =?utf-8?B?UkRLV3ZHRFFnUldZNE92bnp2eW5ZWFkreGtpNnNveWVrSUpCdlIvT0FzYTVC?=
 =?utf-8?B?L1FiVU01L1pNMS93WHhyLzJmQ0R1U1B5T0tYclRFVU1VSGdBckxldjI1ZGRC?=
 =?utf-8?B?SWlOM1owdVJ5aHpCRWVzbWNlbHl4NkRydGZxVnU4WGRYZndyVkVKZUdjcDRY?=
 =?utf-8?B?YnpjWXJIVmxreGJsVkgzbVRoRUJyTCs5N3FnNm0xLzZnUUNENnQ4eStDbUtC?=
 =?utf-8?B?V2hJRURoR1krQ2lDVXFHYUp1Qm4wVDZyZXRlbkl5WCtka2xDZ2tMSFRYRWMz?=
 =?utf-8?B?SWpzL3JzZjNmSGtrWnhVUTVMNGI1QXlNM3IwelBQMUhNT3krZ1FXbzl2ZTVx?=
 =?utf-8?B?ZGVvdUxVRVNuSkhLWFN2YmNtVGg2M0YxNWNqNVRBK1dwU3VtMEZsY1FlL2Vq?=
 =?utf-8?B?eEFqYUFwMlplekwrTXdBOG5pUXgwTVJQazhyM3k0UHlvNTRhZWdOdUJlVFZu?=
 =?utf-8?B?b1VtTzRyTnVWd3N0OXRXRUwvVGtaWkJzT0RzOHRhL3YzT3habE84R1ZLVVNl?=
 =?utf-8?B?ZXRZNFlTaDlISFAwTVhlNjlINU5sT0VObFZKRWtZQS9UZkZVbkhrQTMwYkpv?=
 =?utf-8?B?eGN2U1JyaFdmNmJzYUsrQ0JmRlJSME1YellWY1lMM3hyY2sxMFp2NitsNFpx?=
 =?utf-8?B?Tzg3aGNkMDlSRHZZRHFsTU05TnZZUEUyQ0lqWkVQVUpHcUd2MVplNVFXWmNs?=
 =?utf-8?B?cVBpYWlNTnpZdDhJMkVBZE94YTFSU1plN1liTG9ESlJkdU9DL3NZeUZOYUJa?=
 =?utf-8?B?YWN3VE84cHppSE1hZ0xYdFBPM3lWVVdQcHN5WUdaSUo1UW1objJsM25ucHY1?=
 =?utf-8?B?bEhTM0t6aTVqRG5qMkl1ckkzL0lzYjVIK2d1Q1BlVEZVQ3Y0SFEzakFuZWo0?=
 =?utf-8?B?UVRIaTFXVlRXaXVWWTB6QndVakxIWGp2SWtyek5ZSTJKRWpZdjFWbEVaNWpM?=
 =?utf-8?B?aStIWHBuR0xnSERhcitnZ3laTGtnSlBuVlNoQUQ3MDlWeWpoN3lrZWNUVk5T?=
 =?utf-8?Q?2pMpuPM/hu5QskDHNvZ7H3Bt6YikpoaX?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BLAPR10MB5075.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(10070799003)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Ykc3RzFWZGVKU0h6d0hGWW83RGkwYnEzMmNRL1VKZnFsOUFoM3BJdkZTaFc4?=
 =?utf-8?B?d1hMVWxwV1AzQzJvdWNqemxCWERFQklUZzVHTm5EVWltazJUVHNvRllKcElz?=
 =?utf-8?B?SUQxUzF5alBLWG1ZSGU1SUxRZDdQZzEzbGtNbUpNRk1BdTd4NWRmc1ZzOTFU?=
 =?utf-8?B?MEQ1Ri9nVGdlRGtBTUlQSlJrOG5MSGhFMjUveWpjMWY4RGVQMTdsOW9KUWpC?=
 =?utf-8?B?OHVQeG1CL0FPblVQbWppUXlTcGJiZE1odjVQQ2V0TjRiUzNpY3VpSFpKcFFw?=
 =?utf-8?B?WXJoWHpvbURzbnl1dXo4bzlKUDFoalJTaEpQWkM3MWpFb1pFb2d3TnVmSGdx?=
 =?utf-8?B?RERFV1NjamwxNWlRdlljMUZ3YUk1SlVYMzRpUk00ZCtPTFozRHd5dER1UFcw?=
 =?utf-8?B?RWM1Q0tBdEZ3aDREeWJMVmNWK2lKUDlDTG5wU082T0MxTzZEcU41dGVONUxT?=
 =?utf-8?B?ZVE5N2N3c29lS3N6dTVPTm9sVno0S1VGZ3RFQklNTGhYZnBkaG1CemFoOFhP?=
 =?utf-8?B?QlNGQ0hGTWEwMFNIc0tpOG0yZDJmUmRQTk1paE1ZNlYvWkFhL0cxTCs0R1hU?=
 =?utf-8?B?YnhWbWt2RFB6QjlxaWZVcXVITFdWR0R6V0tPa3kySzdJZW9vZEpWUzg2K084?=
 =?utf-8?B?MWhpa2NLd1ZueUh3K2F3YmJlR3NlWmI1dzEwQ3BMWWJCR1lWYXhTNDJTTmhw?=
 =?utf-8?B?TlliZStuTm1uZUpHalUySDlBaW11eWRkNkdsL3dDQVhabStjZWNQaS9jUEtX?=
 =?utf-8?B?ZFlvL2xVOUpBTE5Ka2NpL25CWE1UazVYSXZQRVBSNmJrT3BaZExoZ2E4K3BD?=
 =?utf-8?B?UUFVYjlnZ05KZnRXclFJNFRKb20vay9qMFpjckwxNm03b0hiWW5xTUN2V0hE?=
 =?utf-8?B?SWlnZ3VZTzRwSUZHaE9lWEdOSkZ1eW9xOUZxWjlINlZocVg1S0NIYmZnZ3dR?=
 =?utf-8?B?aGpFTkU0Z29SdlpKSkxhYjZxdGFWVlpmZktkVVBIVGxGV0pocWRGWFV2TUN5?=
 =?utf-8?B?dXR2WGRKelV2Uy9JbXNKcmk3azVrZ0dFQ0ZOSlFORDRrQVd0a0VUL0lvWkQw?=
 =?utf-8?B?aXRsVmQwRDJZOWNSczJuNG5mQVdVdlk1aHFEeVcxR1VPZWVnWXA1T0hwY21v?=
 =?utf-8?B?REV6VXk5QUIvY0NTbkw5dkgxdUdNUHlzOURpTmNpZFcxeGxYbktpOTRRcStl?=
 =?utf-8?B?MXdsZEkxbDBiajYrek1jNUx5R2dLTnl6RVo1cDQ0UUhxYjRCNXd0c09KR05R?=
 =?utf-8?B?SGhOT1FaSW1kZXdyV2cwSk5hSGMycjJaNmZCdlMwZXA0OWNYTmRCdFl4TlRn?=
 =?utf-8?B?c1lnaVoyL092TzV2MG5UeFd4RGcxR1FuM0YwRDFXNDVNeW9TK0JOL0hRZ043?=
 =?utf-8?B?Y2ZuL1MvZC9XbnZjKzBIK1h5MXg1MS9oeVgrK1NybEhWN1p4dHh5VHdjVnZX?=
 =?utf-8?B?SjRhQWtIVVRLRVV6VTVxM1NzUUdCWUJ3S1d6c3F0WlRlZjEzZFBsR0E3MFZh?=
 =?utf-8?B?REw4WDRFa0lXTVhkN09FK3h1LzYxc3JoWEFPYVU3YmJtQmZWS0JEbUhnQUlR?=
 =?utf-8?B?cDFWaC91bnkyZlprRXk0RjFCaEZta2U3TUZmbkRTUUNBUkM2Zk5STHN3b0cw?=
 =?utf-8?B?bzdtUHJmanRPak0wQmJqWU8xWUFIeE9keXg2enN1YS9NWUFRZ0tZUGJXNVlC?=
 =?utf-8?B?dVNia3M2Y1VpTjBhcEQ5QlpMNjE2OXlHQ0VvYkVFMFMzcFdXaVZvcVppUnhP?=
 =?utf-8?B?SitKTnJLNmIyQTgxQ1Q5Tm1nVGZtQThuanpMbVdBMWJmSStjQTJBNisyRTZk?=
 =?utf-8?B?bncrcG43WmxjaGx1ZW1sVWJCN3lnYVp0b1dSMFJwdmhGYlo0VEtIWTAyaUZq?=
 =?utf-8?B?aE1XRmlFUnh1QzY2UFRUS25UczBMZ1l5dG9tVHN3dm92czdVb1lPbVBtMm1V?=
 =?utf-8?B?bk1CMWRCUHNkblRGbzUyb0U4QjRxeFJ0STFzRkpndE5uQXpwdE5oY3VPZE5l?=
 =?utf-8?B?Q1hEOWxVSFpXSmtoSldyRE9XMk1oK0VHdFZiREVFYmN6all2RW5wLytJRGpO?=
 =?utf-8?B?Q1p2RVZVYU8xeHdYMWkxQllXL01FSDgvOGc2cFJvcVVxMFF5UFF5QTYvS21E?=
 =?utf-8?B?Q3ZFK0RVN0NpTVZ4czF1NllVNkZCM0poZlZxbTcrUks2dzJHZDVGMk9ReU52?=
 =?utf-8?Q?AL6rERUw6Hp+BLcAYn36+rI=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	XzviTT2SWVFVrNCq9wfeCo/P7b7baEDdvzaajJqYKTTj5/8JXnNbxLL5Tbua8QfEcijKDB7ntU76C0GCsaxtfFjq9G6M7AKB9VCf8rq9USXr/kJGWz89YlNsmmNTTBFWFFIhHmS3i3M4hSpb9T7+YL7hQUuEZJ6AJEgvM9szBUl73sCO5ilR1LVAtr/CqKYazB8PRbGlEcWT7CuPxydw8ERs3nGzKZHGYYmha81orvu0I/vcac7YQ9f5+TxZHlp2Qenb+BXeCybdoG4Fp6w6Rk0nxuWAJ1KnA1l98IAn5F2V7hXEsP1NRdtYuv4iZ012aOWun0T9G5yhe0ZcQtJkO4rUohDmdcKKnK/EPWmlvyJmc2lGRfO1ZqP6SXMo/t5wQdu4kDn36uIBeMlZwcRg/RdVVZHRHp6uNNY56xCWDnKxLneHi8gMyitD3/PslDjyKqfk/bThyg3UUG2x/Yz9J/R/HAUIMHUX+MLeewOlNtwT/V8uUgUNHR2r45YskoeNC/j0c4aP542BpdNNrdVzLVNm/7JZ9L1cxz9BSXhcBVv12vG0VxaEwJZ3Po7fGevL+c2rH/ZlbipJdffqIOyKgwfyqO07XESQvpKuHxX/D44=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1955072a-cd90-4db6-2f4f-08de13580a68
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB5075.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2025 23:49:58.8457
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KGiZw1yIbg1mLqdE1K784FkIEzcSLcnVm4janLPvJwd1BJ8Vnf6u4RmLyZEU5jhktzwk79kQg/1TfrqcSGAFu+ZIvQByvvT9/F5glQe91Lk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB6661
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-24_05,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 mlxscore=0 spamscore=0
 adultscore=0 suspectscore=0 malwarescore=0 mlxlogscore=999 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2510020000
 definitions=main-2510240216
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAyMiBTYWx0ZWRfX86dUi8EZmLHT
 E9MHEgaKAr340AjEght5JrbD/Ncplq1oca5xoadnFjUvoBHETXhDYhZCJNqCIvown5sFURaf6oV
 X6N3LfWM9FwQT9DxaUC0O2+ImVDJYLhNf46pLYyPq5JB9adrNR1uGuufBkAhCe0cbOsz8VXPfyo
 14fVuN7QP7H1p7mWedgAVGBlE/HjdsUU0zp6br9S0+KvdDH5OYADUAUUf5PVC5CdNMCUYvco29D
 AjrM/D25dCxrfQqg1uvNBMLlUGJHBZ7JL4gqWmM3bidGH8T7muVkhUyxgG2QMG1v1UAR/qq7S0j
 k/FYFTWIQKBlHtO2ijOv6yE3N0QAX7thDC8SpFtp61AEcdip3veFwHxH5N6upkXwMvXIJMu3TDI
 UrFZuqKySydUJBDambKJy8TG93NmOg==
X-Proofpoint-ORIG-GUID: bVLgRNZkZn5QGorfL1rSZ-oj1MDxuoiQ
X-Proofpoint-GUID: bVLgRNZkZn5QGorfL1rSZ-oj1MDxuoiQ
X-Authority-Analysis: v=2.4 cv=FuwIPmrq c=1 sm=1 tr=0 ts=68fc10b3 cx=c_pps
 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=x6icFKpwvdMA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=yPCof4ZbAAAA:8 a=ihB0dMe32Nc6h8Xa4-cA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10


Reviewed-by: Elena Zannoni <elena.zannoni@oracle.com>


On 10/23/25 5:16 PM, eugene.loh--- via DTrace-devel wrote:
> From: Eugene Loh <eugene.loh@oracle.com>
> 
> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
> ---
>  doc/userguide/reference/dtrace-ref-DTraceSupportforStrings.md | 1 +
>  doc/userguide/reference/dtrace-ref-Variables.md               | 1 +
>  doc/userguide/reference/dtrace_providers_io.md                | 1 +
>  doc/userguide/reference/dtrace_providers_lockstat.md          | 1 +
>  doc/userguide/reference/dtrace_providers_proc.md              | 1 +
>  5 files changed, 5 insertions(+)
> 
> diff --git a/doc/userguide/reference/dtrace-ref-DTraceSupportforStrings.md b/doc/userguide/reference/dtrace-ref-DTraceSupportforStrings.md
> index e9239026f..641f666d9 100644
> --- a/doc/userguide/reference/dtrace-ref-DTraceSupportforStrings.md
> +++ b/doc/userguide/reference/dtrace-ref-DTraceSupportforStrings.md
> @@ -132,6 +132,7 @@ Returns 1 \(true\)
>  Returns 0 \(false\)
>  
>  </td></tr><tbody></table>
> +
>  **Note:**
>  
>  Identical Unicode strings might compare as being different if one or the other of the strings isn't normalized.
> diff --git a/doc/userguide/reference/dtrace-ref-Variables.md b/doc/userguide/reference/dtrace-ref-Variables.md
> index d3afa3833..70e214c14 100644
> --- a/doc/userguide/reference/dtrace-ref-Variables.md
> +++ b/doc/userguide/reference/dtrace-ref-Variables.md
> @@ -167,6 +167,7 @@ Yes
>  Any probe that fires accesses an instance of the variable specific to that particular firing of the probe.
>  
>  </td></tr><tbody></table>
> +
>  **Note:**
>  
>  Note the following information:
> diff --git a/doc/userguide/reference/dtrace_providers_io.md b/doc/userguide/reference/dtrace_providers_io.md
> index 40851042c..67c5c7d34 100644
> --- a/doc/userguide/reference/dtrace_providers_io.md
> +++ b/doc/userguide/reference/dtrace_providers_io.md
> @@ -139,6 +139,7 @@ Probe
>  `fileinfo_t *`
>  
>  </td></tr><tbody></table>
> +
>  **Note:**
>  
>  DTrace doesn't provide the option to use `fileinfo_t` with `io` probes. In Linux, no information is accessible at the level where the `io` probes fire about the file where an I/O request originated.
> diff --git a/doc/userguide/reference/dtrace_providers_lockstat.md b/doc/userguide/reference/dtrace_providers_lockstat.md
> index c1d3eb4de..d21c526d2 100644
> --- a/doc/userguide/reference/dtrace_providers_lockstat.md
> +++ b/doc/userguide/reference/dtrace_providers_lockstat.md
> @@ -241,6 +241,7 @@ Probe
>  —
>  
>  </td></tr><tbody></table>
> +
>  **Note:**
>  
>  `args[0]` has a pointer to the lock in question. The probes that fire in case of contention report a `uint64_t` `args[1]`, which is the wait time in nanoseconds. The `rw` probes also report an `int` that's either `RW_READER` or `RW_WRITER`. Finally, `adaptive-acquire-error` reports an `int` with a non zero error.
> diff --git a/doc/userguide/reference/dtrace_providers_proc.md b/doc/userguide/reference/dtrace_providers_proc.md
> index d799efd72..3ac8b706a 100644
> --- a/doc/userguide/reference/dtrace_providers_proc.md
> +++ b/doc/userguide/reference/dtrace_providers_proc.md
> @@ -124,6 +124,7 @@ Fires when a signal is sent to a process or to a thread created by a process. Th
>  Fires in the context of a newly created process. The `start` probe fires before any user-level instructions are executed in the process.
>  
>  </td></tr><tbody></table>
> +
>  **Note:**
>  
>  No fundamental difference between a process and a thread that a process creates, exists in Linux. The threads of a process are set up so that they can share resources, but each thread has its own entry in the process table with its own process ID.

