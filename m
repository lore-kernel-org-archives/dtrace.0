Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71657397323
	for <dtrace@lists.linux.dev>; Fri, 28 Aug 2026 21:58:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787954298; cv=fail; b=dqeL9hpIzD1ZzaVFFIOAgVK+I/0BCG4uC2oh+iaga2ewaeUXT4T6WQF60F+Qfji1L7o+aGrXk8/5QmUdk7wkUUpG+UAJewF+Sg5b7QWbvDPmiZrtzTps3OeusfQ+7U5C8jvoPosmsGSyuWOmRVflGM5GR5gw4ondP1c7WQIfoW0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787954298; c=relaxed/simple;
	bh=awRvnUQrzoX1TWzMG3X5M4a49IjEjkl9IChD02/dCe8=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=DW4cX9j2h9FDzGEhYj1JSCwIhKB15bgC68akErF4oUPC9O6ewM49Uh3ASlRv1jd9f5Z5Cn4wjaop/Erk1BzpUUt15L7I8XBaJeAaXxadPKs2PdoKnI7qBRqDmKVadgmmc27ehzOclAUxdAXMDEmduJDwrfS1Zi0ayuGNsIgEOS0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=MEV90Iqh; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=RHRLcHW2; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="MEV90Iqh";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="RHRLcHW2"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67SHK7uE3147387
	for <dtrace@lists.linux.dev>; Fri, 28 Aug 2026 21:58:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=nYZFd4q3EDjllUZgb1tILia454WjtibfeVS2MrpZd+g=; b=
	MEV90IqhXjctYr4YvOWuw3Z4vGml2Z/C/uHqm+KeYrtaozGCGEY6yKsVfzOU9UKR
	Q5lB3oQzU/yb2lurDPqN1u+2xfbxzsaJ+wpUaku+Bx8ufMYRS+pVxSEFE+wns1JC
	k4vZ8Ee1ZNRhv8WFW+YgZ4oLSekbmSUAs0Pft6m+vJjowU/LxL9ozqMtad8wxFug
	kbzdcnATMRLwy52UCN9BLGwb70zQkXrUw7qxutTGBi2M9i7ANcyOdSN4nTRovQBt
	8baEg07EhUatjmI/D5ey79q1ht9pyheRM9mc4jym0w08lfDN568fnYU44/uXvXbn
	41DbLjqhHgajRNJRkXcadQ==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4g72j22mxy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 28 Aug 2026 21:58:16 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.7/8.18.1.7) with ESMTP id 67SLtUMP037097
	for <dtrace@lists.linux.dev>; Fri, 28 Aug 2026 21:58:15 GMT
Received: from ph7pr06cu001.outbound.protection.outlook.com (mail-westus3azon11010068.outbound.protection.outlook.com [52.101.201.68])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4g849ps2q2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <dtrace@lists.linux.dev>; Fri, 28 Aug 2026 21:58:15 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ujVW+YmGMgssht9oP2OpvDFf6UmgNlM7unUBofp3//Wj2LNyeWJ3mtjyOCXbHQRdMgg0DOZpe8lUmm4f7ASm1jm8L5o0W40VUiw/EdWq8oPTgQgHO7VW/IETQAeUZidocHE/jxM89+/8RWimgt5ch0srj9rmb3MsAh5SHBd0cDTsJEToFa8Oa/dZU7ESkM5mZ7IFw45RY+HtFyoJraOjQZm10iswkD7Qmuoe/s01Fyg9ooLouvEUILCId9HNQlMd0TtV9sOekz79CvQgiB/sXU2sLZ6bx7HjmKdq1I6x2vlZqJFAy30cr6TEWaZ1hL0hH1R2i9dSMcy9Cc8E5FiR+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nYZFd4q3EDjllUZgb1tILia454WjtibfeVS2MrpZd+g=;
 b=BL9dHHxWLVy3WThIVZb7iBV+JuvKlVw+t4H1HzaIxyvMtcfeKyRMc36mUKuk/U63d+OgUoUqHCsQ6zVM8QXQQd5OxM7ob8764yry7O3+SgNb2e6jsjvLbEcWCU3GfQlkYVTIstTPl3il81Pp4afrzVUUqPZ1oi30yDX3gJgCSLns/bSQA7yF5ikC/4UQ6GIwdMY45lWvqBb63mfhTPd7EL1Dzp+jiO3VlB2mbhmL5xEz6b/1/NVEXcvFVp1tDeUrtiR0e3C4dwc3biRidd7yMxkGG/UMwMVuhzR1g3Na6NB1bcvsaWyXNMVkzDxDYEDcLKQLGt8uN6+pYPZQUEFo+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nYZFd4q3EDjllUZgb1tILia454WjtibfeVS2MrpZd+g=;
 b=RHRLcHW2i2gaHoeYrOX0s5yxIYfAFIe4+QBiNprwCTq6Yf31s+pwGjhItKyjG1EYsKXtnNgXzIP0+8xR087QQeDrARVHX7bRc+gB8e+rLzsvYAmPQKBug6D2gGh/Z7m45eMNui8SsYKAWJ10vpKFbRkb53zyciWNtfuu2Qns4hI=
Received: from BLAPR10MB5075.namprd10.prod.outlook.com (2603:10b6:208:322::19)
 by DS0PR10MB7091.namprd10.prod.outlook.com (2603:10b6:8:14d::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.8; Fri, 28 Aug
 2026 21:58:10 +0000
Received: from BLAPR10MB5075.namprd10.prod.outlook.com
 ([fe80::8f5:4de9:81ce:f5c6]) by BLAPR10MB5075.namprd10.prod.outlook.com
 ([fe80::8f5:4de9:81ce:f5c6%5]) with mapi id 15.21.0382.007; Fri, 28 Aug 2026
 21:58:10 +0000
Message-ID: <0d10b43f-4598-425f-bcf7-249c1582898b@oracle.com>
Date: Fri, 28 Aug 2026 15:58:08 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [DTrace-devel] [PATCH 1/6] dtprobed: reject oversized DOF
 consistently
To: Kris Van Hees <kris.van.hees@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
References: <aad44d4b8ca3a2cc9de1a25c9beb3863@oracle.com>
Content-Language: en-US
From: Elena Zannoni <elena.zannoni@oracle.com>
Organization: Oracle USA Inc.
In-Reply-To: <aad44d4b8ca3a2cc9de1a25c9beb3863@oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CYXPR02CA0090.namprd02.prod.outlook.com
 (2603:10b6:930:ce::17) To BLAPR10MB5075.namprd10.prod.outlook.com
 (2603:10b6:208:322::19)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BLAPR10MB5075:EE_|DS0PR10MB7091:EE_
X-MS-Office365-Filtering-Correlation-Id: b709ecfb-cb86-4f6e-49bf-08df054f732e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|376014|1800799024|56012099006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	VlIz3k30dugsJmDv3+z+np7HvYIUIL1hhK2aQx4zpBG12BhTEeu3vQt6/8IZ8A9IQATn2CpjlUuL+e52wxVmDLMIJe34nli3hhU5beowQvXMdfSKfbJc4mZMxooonWdtTdYcUETKpk73Gg/EUDhYWbxm0NlxKOzOgaiCgJrfyTiPh1CFe31nMR0WJSQ8MO0OdZG2ULt0x2Ru0CcNOXh1sHz6zo+NE2yIMK56UXtbpPlt4yQN5FH9rBVNdroJwSoEYWURQ77nA1YpDnhJYM9D5CBXK4mb7tT2NETD7/kZgC0hMwQ7ljWsMexGO8rexvLdcMD9SqqWovq42MfrwymeFVnRFt66bR9F4dIRShTUXPMJX3M+uKbt2ACBEtgPQxXbBu1/ywxk7we+8z59sVkI3mrofIa8jRgVQdXpr/ZBOMlwuBvlC4qnNjRdqJSzWi3HUj8slCNyzNBl+VHgCjnm6uzDvPAzMwCX/flhTJPgQZW5WaB4F/BquD+It4eNj1ToVEPrJp074wukF1clbq9gSPhBfLflEE4KbyAmzdNsMRqZbbkd0chDiW7Rk76+fkRUic9BPyhgKt2ZYgB02YhWHcdRJ4kUPDLINPf18vB67AfLC+qLPEdcXnc3mLogaCWKdRntVk4EwVUsC7N+LszQtbmPEvsMHQPJr5OmVbz8Haw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BLAPR10MB5075.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(56012099006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cGQzNlBLenRTR2J6V1FtMFM3UytvMzdENWVxbSt5Z1ZUUHA5N1FDTkdSNmdr?=
 =?utf-8?B?YW9FSjBLK2NtQ2U3Wi9mSzRVMkgzWXlOcEd2cUFDWUtwcjFnQXBjTzhjOUxs?=
 =?utf-8?B?elhUMXF6Q1FmWWVLNHR4eGU2SktVd1IrTlJzZmNlLzV2V1FobHI2MXFSSXZr?=
 =?utf-8?B?cE5EK0U3RklRTjJEcDluSUw1Zk50WXhOWU1BYnB2RVVwdnhUM3FHZ29RVlFa?=
 =?utf-8?B?YXJuUlhPb1R2dTRxVUdobitoUXllZ0d1YjRwUWFxdUM1aGdTcEh3TW51Wmp5?=
 =?utf-8?B?MjE5UUxFZjlaTHRkOUlXQVFoVmZWemlhYXlvdEFhUzNwSTc3dUhFUzcrbDMy?=
 =?utf-8?B?ZEN4cWxQWXlGRHF1QjM1MWhOckRnS09FOUVqbWJMcWp0cHZNTXJJQ0JOVHNi?=
 =?utf-8?B?QVBYZ2xYa0FKRkJYSHE1UDJwVzdERlVFbjVTSDVDRElQRVlrTzRVVTlOQzQ1?=
 =?utf-8?B?Q1dVUC9uaEJYWGxYTzd6NFhpTUVYYkRYaWRkU1hOT054MHk4UG5FK0Q2WVhl?=
 =?utf-8?B?NjAvbkdBNXFnVnUvVlpPZ1hxbHhJUDBhTGd5UkFQWHlZUzlMUG5RUDJZYk1r?=
 =?utf-8?B?OFdvbW96V0pTbXlFSkRhMFdFRFRtMUx4eXVUdlNFZ0hXOHpCOWtuTFJ5NnpM?=
 =?utf-8?B?MTNXZHJmU2FkZ1dGbzRTbnEzV0l5MkxSeGhvRFpyd3AvUzVFeXhwYm5qdFVi?=
 =?utf-8?B?REpaK25BaU96TWZyR0N2WHNnSzl0MW16U3g2Qi91M3Z2Zm1wSnBDekVCSS9K?=
 =?utf-8?B?TjFQSldobnprL25hYURtcDZPSHdGNm5FVVdoTmJMeVJOdlI4cDJFQURpQkNq?=
 =?utf-8?B?K3VmT1QrTVdpdC9iM1IvTTlhSFJuelN6cjVPeUtjdFNvVEorSDFRZExpM2lX?=
 =?utf-8?B?Z3N0Uy9KTUF3QUtlTXZGdnVOS3k2L3Q2Y2pUMHFsa1pMM0RVNENXTkRiNjZk?=
 =?utf-8?B?eTRmbFcxcnlUWmNLYXlzeGhhMWpSMUJCcHVHdi80ODB1NytCbUV6Z0JYQ3Av?=
 =?utf-8?B?dW90Wms4T3Urc3NyZXkyd2FscHBsUWRmeHU1T05ra0pjQmZJQVI1UEZvMW8z?=
 =?utf-8?B?dEZINjEycEUzOFdraVdBdW1oR0tvRDc5anZMWkVNRjFBd3BOVC8vaVd0blJF?=
 =?utf-8?B?dUVzZzdBSS9yOUd1RkZLZkMvMU9EZDI3bFpxR1VDa0hKeGVFZnlYWGdmNkRC?=
 =?utf-8?B?d08zZTJRRW9yM3h2eFRNNUMrMHBUQ0MvanFpbGc3aldPa0E2VkhrTWpUdWZV?=
 =?utf-8?B?Y0owYXExakN5aEtiRGRRa3FMUFd1VnVMRnVMUTRoZElaRXdrSEFscDllRjJv?=
 =?utf-8?B?V1Z2bXpyUzl6TlZDdlJhcm1wTnJCSWZVK2ZRclhJT01qN3R4RmRnd2toOHU1?=
 =?utf-8?B?ZzRKK3N6U3crejhUTXZ6OEh1Mjd5SFVpSUNDRU43SHBDbXA5TU9HbEtNMjNr?=
 =?utf-8?B?Mko2S2xaWmJxbUVwNmU3TlVXTHdtVmh2YTZMKzRpMVp6ZjhhK3pqOUZsRkFa?=
 =?utf-8?B?ODE3VEI3YXBNSVJKdUxUMjRHMmpRWStFV1VlWU9GcEd6d1kwaVRrWEZGWkFT?=
 =?utf-8?B?KzU4U2RXNXYrL2lhdVp6cDFhUDd5Y2R4dzNXTUZQbzFTZ2NoYjA5dFREWXJj?=
 =?utf-8?B?K1dJc0V4Wmt4ZjBBcXB1czgxK0ZtRFNwQ0pLbTQyWEY1TTRWS28wZ1E3d2Zr?=
 =?utf-8?B?MTl4OUc0bnZiNVRTM2JuVGdhdk9CcnpRSTZVbXpSNEhLMjRydW1QSlhpZkI0?=
 =?utf-8?B?QXoxNGhsc3Y4ckl2QWEvVERuNzloazF4NjA1M3pBQVhhWXdYekRIZzJ4ZG9u?=
 =?utf-8?B?QzRXNU1nTG5qNHM4ODZiVWM0akJaa1RGZ3I4TGdHSWZrV0ZFVS9zajR6Unp0?=
 =?utf-8?B?UHd0WC9IQUVDUmhMRjVMK0pTK0RxamN5dkVaZ1dIZDVLZ3RBdUgrNGRaTFMz?=
 =?utf-8?B?aStYUVl0OGgxMXRtQXpGTVoxVnR5VWdGenJSNzJHeXorSk9Nc1RQY2VGYXE4?=
 =?utf-8?B?aHZIbVlWZ2tQVitTMVBmSDg5SVdJMEZaVHdXRVEzdE9pYUpxNTU5dVlNdGFJ?=
 =?utf-8?B?Sm5FQWpGOVdpc3hPQjBrQVJNdi92YVZRRlZhb0k0TmtuQzJ4VDdBZW94SVJ1?=
 =?utf-8?B?am9sSXVTbFgxWUg3TnNVMWloby9kQmNBMmFiNDZuTE1aaFZzbVhqZGpPT21a?=
 =?utf-8?B?cjVuME1vTDhlR2tmWDZzRDBBaFRSZFQ1OWpIdmZpYS9oN2M1Q1BEY2lQNHBw?=
 =?utf-8?B?QzF3RllORlhJVVF5a1VDaDNJdVAyRDFmdXRrQmh2K3lFdnRPTTVsNS84bkZO?=
 =?utf-8?B?ZkNwQlZQSmhhYldpMHRZdGJmRlBtV0ovcUlOT1hsMFRrbXk3RllxV2p0TVBV?=
 =?utf-8?Q?TRDpW0ufTX0IoFrQ=3D?=
X-Exchange-RoutingPolicyChecked:
	A9cT5Tzs+4HGxd7EMlusT+9d9/8iMvAWPuKnbXi0jU96+ykDJk8WWrAiM1rMgFxRhTXzSJGPZDSQYwMvpEYnn1uMRFn93AOhQ+UdCZ8aG8COxBf3n4UwU2HQUbeTd8/Qa15LuVxNRaRIoHHx4z1WBjlZq3YIs8igpnFBqNtom/9ofHkL/KZMcXASckws1gLzpCFpLX2avNtb0mSV1N2qy2qZV74mIVds7SvbmErVklfio/JrIVY4vwfe5ugplB2UawUwWPwO4MEqwZT9MuSG6C1LjmkWsliM4DwUGp5oXsWAFEZT1ckSXCB5VPayXAwNvWs7+lYxGHkhQk4y9luwNg==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	GWiXGsT3A4pPAtiNk7JuQtodHDukRGY6PuXyd+kFznC0pnQ51SAk5kIv6KNM13RMSPfQyAsWkm2vJ7ZrrpdGgigRyIWwYjpT9IR6nZ1+SKWdyy7uxibyzdAK6P8kmKwerGnS8UWYLOOpT7dNtSguoFGcU13FnUENzqpjIuFMmdnXtLxv2jYWgzSpdZUm6cgH5K0/z03VpNLgKo+333ylwzH8L+ncu+4yXXW5CzpxxHSCpQgw/p/jP9XbQIVruPp2Po2TS0SiJNW7jDG6olDP+Y1Z5OU6rwXqGbgJ2ua/UK+/Xoyc3oxUc1pFb1mkhHYyWqluudb71+sIDzvJZC2SMl3o9kM01w54INviU4C2hnZL4Ry5La2OQEqvASKwiJMIFl7wzV3cDJqeJa9N+pW8AN0EMmjAggVAC3x+LPhzHbahnnCwVnu4AOcfr6aBKCmVGAmckSqA62LII2HeqSdy3D4/KXSrZjSWEm/9XaEXF3BGDIMmcbtQJm/D0PVAgcW5S3aZfVtgi55p3ItRdiO5jpbjmc8nU5AIT1P7SfhjxLNw8xTRGDgvywAhW8PsCXOOycFo/sIeMzpQgiBTcJgn/+zK5AjpkBayuyagH1YT9aI=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b709ecfb-cb86-4f6e-49bf-08df054f732e
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB5075.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2026 21:58:10.5325
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0MUPf6p0rxaCLxI9BYZG2beV3OBykS548RXJehIHJnRz8TrYr5dmsK1MeU8nj1XtGAZm6Z9dj3RbzZH+pkO/DGnsEFMqw465Py48HMV+GTU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB7091
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-28_06,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 spamscore=0 lowpriorityscore=0 phishscore=0 mlxscore=0 malwarescore=0
 bulkscore=0 suspectscore=0 mlxlogscore=999 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.19.0-2606160000 definitions=main-2608280191
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI4MDE5MSBTYWx0ZWRfX0Ogu9mNtWPCn
 2mh92w+I14MNzJ5A+ghKakc+tzICLpLzuq8Ssmq8Iye2c/YwXGvw/FBHyz3PZ3OgHZoLukzsXrm
 oeMKD+MRXTFRfyZ5wscEpdFGCOa+2AvCJyVl99c2OoqosxYOnZwN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI4MDE5MSBTYWx0ZWRfXyouGkgIDBa7t
 Donp9MAHeOzckhhAC8zPZtbI8by5PTYKLlEvHYpE8sebH/Fv0aekUtwcvhcGgsrh+MeKH7Rga8e
 ygQXN6J6WVx8ln5bd6qxbyP85hoc3uBo4wdeugxz6AYfhn+nAw6ABJkhH+PI1Ojue0+FmmL9GHJ
 QOhQ7EJ7p+8COhk0/ZlB8KPj+XllA0DeQonHxzZyQPONdizBpJM8+QZ9WzMczH7yZOh6Oje0XEA
 GKdeXFvB4O5qYerGovJScu3c4Nszmm2Kf51SpWo5tpqyXCB0F5XABPRewsYQ0obZHWtbXDUSXp0
 kDtXmlMRGzRiJ4EaYWfPqzgeYjBPsLMAETEpMar7Mpn7S4oNDlPIa1bVjqhfXOVaJ0P/ssLPwBa
 iSKmpd34m8uXxdxb9m6NsEU/ew8DuTs+jaTpbiActjOkHEhBHwgsfP+JUurQOMmJBa/2Z8Z5y1p
 ne4W6z0bsWkMot8fycjZa/PC1DJ8b9l6pnUnpyik=
X-Proofpoint-GUID: pG0YttThfsH6mv7rfUcfVrlDEZB5TASj
X-Authority-Analysis: v=2.4 cv=Wek8rUhX c=1 sm=1 tr=0 ts=6a920478 b=1 cx=c_pps
 a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Sv0fKeRqtYgA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=jiCTI4zE5U7BLdzWsZGv:22 a=o5oIOnhZENCTenyL_yNV:22 a=yPCof4ZbAAAA:8
 a=0vVsowvZUffegHRM0wEA:9 a=QEXdDO2ut3YA:10 a=5yU3S35YU4bGjq-dph-N:22
 a=Bho9c0fBagfJEIQBS7DQ:22 cc=ntf awl=host:12102
X-Proofpoint-ORIG-GUID: pG0YttThfsH6mv7rfUcfVrlDEZB5TASj


Reviewed-by: Elena Zannoni <elena.zannoni@oracle.com>

On 8/28/26 1:09 PM, Kris Van Hees via DTrace-devel wrote:

> The dtprobed ioctl handler warned when helper DOF exceeded the parser
> limit, but still attempted to allocate and copy it.  Share DOF_MAXSZ with
> the parser and fail the ioctl when dofh_loadsz is too large, so both paths
> enforce the same 256MB limit.
> 
> Orabug: 39351859
> Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
> ---
>  dtprobed/dtprobed.c     | 8 ++++----
>  libcommon/usdt_parser.c | 7 +++----
>  libcommon/usdt_parser.h | 2 ++
>  3 files changed, 9 insertions(+), 8 deletions(-)
> 
> diff --git a/dtprobed/dtprobed.c b/dtprobed/dtprobed.c
> index 37d615bb..81b28e6d 100644
> --- a/dtprobed/dtprobed.c
> +++ b/dtprobed/dtprobed.c
> @@ -69,7 +69,6 @@
>  
>  #include "seccomp-assistance.h"
>  
> -#define DOF_MAXSZ 512 * 1024 * 1024
>  #define DOF_CHUNKSZ 64 * 1024
>  
>  static struct fuse_session *cuse_session;
> @@ -769,11 +768,12 @@ helper_ioctl(fuse_req_t req, int cmd, void *arg,
>  		}
>  		memcpy(&userdata->dof_hdr, in_buf, sizeof(dof_hdr_t));
>  
> -		if (userdata->dof_hdr.dofh_loadsz > DOF_MAXSZ)
> -			fuse_log(FUSE_LOG_WARNING, "%i: dtprobed: DOF size of %zi longer than is sane\n",
> +		if (userdata->dof_hdr.dofh_loadsz > DOF_MAXSZ) {
> +			fuse_log(FUSE_LOG_ERR, "%i: dtprobed: DOF size of %zi longer than is sane\n",
>  				 pid, userdata->dof_hdr.dofh_loadsz);
>  
> -		/* Fall through. */
> +			goto fuse_err;
> +		}
>  	}
>  
>  	/*
> diff --git a/libcommon/usdt_parser.c b/libcommon/usdt_parser.c
> index 86419809..1dc2fffb 100644
> --- a/libcommon/usdt_parser.c
> +++ b/libcommon/usdt_parser.c
> @@ -19,7 +19,6 @@
>  #include "usdt_parser.h"
>  
>  size_t			usdt_maxcount = 2;
> -size_t			usdt_maxsize = 256 * 1024 * 1024;
>  
>  _dt_printflike_(3, 4)
>  void
> @@ -131,9 +130,9 @@ usdt_copyin_block(int in, int out, int *ok)
>  		abort();
>  
>  	/* Validate the data size. */
> -	if (data->size >= usdt_maxsize) {
> -		usdt_error(out, E2BIG, "data size %zi exceeds maximum %zi",
> -			   data->size, usdt_maxsize);
> +	if (data->size > DOF_MAXSZ) {
> +		usdt_error(out, E2BIG, "data size %zi exceeds maximum %i",
> +			   data->size, DOF_MAXSZ);
>  		return NULL;
>  	}
>  
> diff --git a/libcommon/usdt_parser.h b/libcommon/usdt_parser.h
> index d33370e4..b11207d1 100644
> --- a/libcommon/usdt_parser.h
> +++ b/libcommon/usdt_parser.h
> @@ -15,6 +15,8 @@
>  #include <dtrace/dof.h>
>  #include <dtrace/helpers.h>
>  
> +#define DOF_MAXSZ	(256 * 1024 * 1024)
> +
>  /*
>   * Data transfer unit for the DOF parser.
>   */
> -- 
> 2.52.0
> 
> 
> _______________________________________________
> DTrace-devel mailing list
> DTrace-devel@oss.oracle.com
> https://oss.oracle.com/mailman/listinfo/dtrace-devel
> 

