Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5600D5680
	for <dtrace@lists.linux.dev>; Fri, 19 Jul 2024 03:34:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721360055; cv=fail; b=muG/+/rzLwMaqEZYmrjyklI1y65xFA1TQitJ/nkVzBY1ARioMdeiI4VWj8dmQxWqOsxM2++/tUTY9oPfaZ/1kOlIvKFN62U/3+CNhV+gZvJod2oPRKYtrOio8oGDKhN5nGL9ZOSitMz2lics0XgQJZ0bzePvBBEMKpgjjO8WRU8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721360055; c=relaxed/simple;
	bh=/uKcmMJ9FX7sXrtdmHFkd2sMZdAlgZZ8r16UqDQ8dJ8=;
	h=Message-ID:Date:From:Subject:To:References:In-Reply-To:
	 Content-Type:MIME-Version; b=HA5U+GFW9fVLf5df+B+EIWjOoFklRwDa0VV2y8T5CFWQ5Vly9Z9GZwTwRPwiwVN1HlkNi1mnb3veaifFBBgONs/TW8GCfPQe/IqcGWn7zHDJvzf33VL1EXYFPgCBicDmPDsdIubUodSJ15cY+FpJxhy3dQRU+JQI1r6p5J4+yO0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=hl30vsNp; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=Ec4wkHn4; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="hl30vsNp";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="Ec4wkHn4"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46J3UjvV013792
	for <dtrace@lists.linux.dev>; Fri, 19 Jul 2024 03:34:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	message-id:date:from:subject:to:references:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=
	corp-2023-11-20; bh=3uhHho9tRDPzZw+gjGHwZhSa89zCUjZehxJ/lVTgrCo=; b=
	hl30vsNpFuCPoHyutOoA3jav49Xj6gMnA3lKimepoKsv0UFUgPVxuEPIlUw1ZjCM
	YhYmiG3jZRpz97HWLShzFfNDtvOl+Sbc6ja2VMfKA+ZM6fMRIRyMdp+L+4aYreH2
	aWC5nonrndU+SoSOhqFWhhlwvPxOjn4OOlVQRADs1/YJlbnM3IxiT06Mpsd/jj6j
	G6ktHktuKr8WfHqLYtBh3VXmL1l0SLP8vv1BwCvoal7+rxeNJ7UIaVYSGX5JoDk6
	VP/mFKJy0b7dp+ke2gPFwPwtyDsnSW14jCceuG63RXJHRzaMqNLHl2sFAuDLkHcI
	s3gCy3e3grR4/rlBxhDJ9w==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 40fg9yr08s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 19 Jul 2024 03:34:12 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 46J3B5wC006829
	for <dtrace@lists.linux.dev>; Fri, 19 Jul 2024 03:34:11 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2044.outbound.protection.outlook.com [104.47.66.44])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 40dwf0qtd6-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 19 Jul 2024 03:34:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=heradRBrQnKVM0K0e38ptTy5EHb6AlXI+DBHQTrRWPMwzUbivv03+FaGpbMifJlH7EoqPet4P6iQIVy6v1X0o0SB1ZsinjpplKw/fxQL0pHkLBgSVLPPQONTy0rqjTxLsiR1gloxczhL7n+aEw71gGMTp2ksYHgXWDPfGOIYM8IoH5o/47oWPuMkbcNs/GDp4asfBcL5UEAjF7YTHYiqWzSrsdSZ/ALm0hMqNL0BkMyhLh9ah9XRdw2W1KhPT38EwcffuvKCS08POOhLoz/3pzya7gQHKAZi3Y3m/riwHix2WeR4/PWm+8YhsC4iNaLGnVEBJF3Xpbo3oRabKV0LHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3uhHho9tRDPzZw+gjGHwZhSa89zCUjZehxJ/lVTgrCo=;
 b=SXjIaVq8rMtVQlBzu0hj2JsrVxYKG8RdhlW71CNdd88UQckdaN9//gdZF7pxdL7lygsEretxospJkL2wG7dJthUVVCF6NqxeK6qKMXvA2rLc7BuUCnxhL3ihyU7WVetguRaz0Qabw3fY/bLb47HWx87ThjTl/GnOtTZ7xxGIfrBOR8SLxwWngV/7Sk1UW/DWCb6DCbb6VlGXKZYfgCSPJEzV9ggIbRZhdfQKoCEgNJlaYEHAktxy7VpriPgefzgXy8YSQ4GRM7utOIWGFizRinBDRFSAP+35ZlorHguzFwIt67QOmA+DgnFC8Wy52vjSdAuopiNsdjBlJ3x+qliP7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3uhHho9tRDPzZw+gjGHwZhSa89zCUjZehxJ/lVTgrCo=;
 b=Ec4wkHn4Lf3Nq8nTrPgNwPzqzUysHRpjrSZIoAHWlEP9TW+CfktW/a00OCRPLT+hoMWEjyYF3ih3tyPBSS7AMAnM/f37H1gmP3U4g0qnY1rkeKH7d/658bJ6y4mzOS4+7ilSQSvyU2irp4dqZVZVZZ+PsVtcT+rGxmlHEQRimaY=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by MN6PR10MB8119.namprd10.prod.outlook.com (2603:10b6:208:4f8::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.14; Fri, 19 Jul
 2024 03:34:07 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%5]) with mapi id 15.20.7784.016; Fri, 19 Jul 2024
 03:34:06 +0000
Message-ID: <18d5f183-bab9-680a-a29d-6a7f76b60197@oracle.com>
Date: Thu, 18 Jul 2024 23:34:05 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
From: Eugene Loh <eugene.loh@oracle.com>
Subject: Re: [PATCH 19/38] Retain probe descriptions
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
References: <20240627053810.21928-1-eugene.loh@oracle.com>
 <ZpmINm9hojBpvWhP@oracle.com>
Content-Language: en-US
In-Reply-To: <ZpmINm9hojBpvWhP@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR01CA0054.prod.exchangelabs.com (2603:10b6:a03:94::31)
 To CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|MN6PR10MB8119:EE_
X-MS-Office365-Filtering-Correlation-Id: 9ef72d3a-1375-44f5-3116-08dca7a3a4de
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?YUdhaGlaWWhwbDZiSFppakxqWmhMSjdlTDh2QndFYVR3TU5iSW4wUVNkcW92?=
 =?utf-8?B?czRyTHVZSCswUVNKTjJwU2Q5QkVqUmdPSEZCRnFBRllMODAyLzhaakVPbURv?=
 =?utf-8?B?cTB3Z0xCdjBtY1B0aThrb2lOdjFNOFRVTUR3bkhjWXBWdDdldW5uTk52dmZq?=
 =?utf-8?B?YlR3VUtxYTAwWFEwQTJ2c29USldTKy9VL21sUzdXdW11b0poOFQzMHZFMzM5?=
 =?utf-8?B?Z2ZjSEl1aFAydjRnOHFHZi9uejBXcFRpWnhOajdZTWdNZWwrdlNiZk5lTG1z?=
 =?utf-8?B?OWJ1Q2dQUFMwTWwyNjkrZ1FUUHJ5OFhHS1E2S0lzdHIzK1RJN2U1WTB6YkRr?=
 =?utf-8?B?TFpQQy9Ybk1DMTkwblZNRkpIME1LU2R5MTVwM1Vra3lpTC9vWUZLR0QwVEdn?=
 =?utf-8?B?TjIrZmNaME0zTWNLT1BpOWROWElqTm80RFRnbTBrVWpISE8wSVpYUFpFeVFv?=
 =?utf-8?B?dTJHUjUydmFkZ2swemZtQ29oTGI0bW5NOG50cURIbjNrYzczcVB2YU5aSU5C?=
 =?utf-8?B?Z0JRdDE4czhBN0RHaVpaYVZOT2dwS3pYclQxOHRIMis3TFRaMlFBQlZLc0pW?=
 =?utf-8?B?VHVjMEFMbGprNksyOTcwMkZlcnBPK3FXYmhJNndWUlBVUnNPckVMMC9ZOXZ0?=
 =?utf-8?B?UkF6Q0prRk00a2NWR2dvcjFiUkI1b1A0cUZ6cjlRS00wb0IwVHZhVm93VS9y?=
 =?utf-8?B?Qml1Qk8yOEVOdmIrendjTGJuSExzTitiMG5nWnFYb1c2KytGMHVZSVNRTVlp?=
 =?utf-8?B?cWREc0pwT1hJZkxCRm1xemxJeUJuSi9IVDYxQkdveGZPTy92Vm1sYnZCNXNX?=
 =?utf-8?B?VlZQN2FNaUhwQlhHVTM5MTN0QUhiSFNlTHk4MlBxcTZ3VVBOUGVpblFkb292?=
 =?utf-8?B?bms3WFhyWmR2UzUrQzR3emZRY0FsaS9pbUZKQU43aC9URHhBZ1BrUDZjcmFZ?=
 =?utf-8?B?OExSTXBqWkJYK1ZzazArNit0Um5GdUptYk1ja25nNE1iUHg3dHBWL1F1ZDJI?=
 =?utf-8?B?NlY1b0lLS1lzODJjaWFYVmh1VzhkZnVRaVFQYzl3Szk4U00vaWxkS3BCV0tU?=
 =?utf-8?B?ZTFrNDRraklmM2dUdWd2NVRrMHJTTXJnc29uTUlqU01XRmtrNGZSVDgzNXdV?=
 =?utf-8?B?NzVQVkdjUGNaVVJUbVpCcUErci9DanAxZ2dRZndvYTVOaHF4S01HNU1RamVU?=
 =?utf-8?B?cTlDV1pFK20xK3Mvdk05b2o1SS9KT0FYbjJmWTlKSGNYQm54c1FnaVFIMHB6?=
 =?utf-8?B?Nm9YL0NJY09xbzdkb204OEZsYkxVRlFlcTZhc2lobFpMTXE2SVAxVFRFQTl2?=
 =?utf-8?B?dE5uRERhMGpZcjJKRjNQNmRkdnRlSEc5TXY4cXJlanY0ZWw0OEpPRzhvdWpE?=
 =?utf-8?B?alg1WXdMdzNsWUVHU01DWHFneGphTG9qK3BQa0V3c1diTnAvUnFKUmc1dnpZ?=
 =?utf-8?B?SnQveXZvL056aE1FVmNMakdoMVVYWUljQUlOYUgwdmhHRHlJeTU2cFZ2MHZU?=
 =?utf-8?B?MEZ2Y1ZtMXVGdTlFVjQ5TGE1NDRuQzVWM3hVY0xvMmpNbGdsUTYwZUdHc3Q4?=
 =?utf-8?B?SnNqNUJlTmViY3l4WCtVSTAzWmt2SUJ2Y2dJa2czL0JKaDdVK2VjRDZtekxU?=
 =?utf-8?B?ZnNHWm56ZTc3SFFPZDVTS3BzdXF2TFd2T1loSVNBZ1pMTVZ4dkszcThUTFh5?=
 =?utf-8?B?SGxmM1FwUHErNE9ZRUhsM2FXTTdXbUphOXFGQ2NyVmtRekg0Z1NvNHFVWU1k?=
 =?utf-8?B?bDBOZVYvWHp5WGlUcFV1bWc4eWVkMGM2Z3VaSkExWmdCWlZPY2ppMkVpNnhi?=
 =?utf-8?B?dHlRbXQ5S0I0NlVPcEl1dz09?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?N2xlMy8xbCtJbXQxMnd3TFhCaHErelBvdS94c0NqQWp4eXpBdjJ3cXRlWjAv?=
 =?utf-8?B?TnBVR3UwT3Y0WEM5VmlMQXBiWXVCNGlDRjRnTGhadVc3dkhzbmJtUWNhS3pH?=
 =?utf-8?B?R2xUWWVDMWJFTithb05UTDJiRUdGMldPa2wzQ1UvTzAyVnAyaEpTb04vTnMv?=
 =?utf-8?B?REZYQXpuamZudXdhUlZGZ2EzNFVoUkRMUk9qVjFkdGtYbWMzTkZYVkVmcEpE?=
 =?utf-8?B?dFdFKzYxUHp4RE1abDBuU3ZnRk12cnk5TkkzNFY5RUhkZTR6NnBaY3pxVS96?=
 =?utf-8?B?WHh2L3FLOEcyd1lGN1pNOVNPblBOdzk3SWVBZEowN3BVQUdYMERwYjJVVUVK?=
 =?utf-8?B?TWJvVFNkcjhQYU5SVmRMS0d0RkppOTNSOUlNeE1jUGpWZjM4ZjJYOEVaWFM1?=
 =?utf-8?B?SER0WFd0dUpQbHdwOS9HMHYwbUdEcGxsSjZYcGpza1dOTDFsUlFlRCtNWEt5?=
 =?utf-8?B?R1VyNlFRbGo0dnp1bEEwR3c2VldTeUJkRjlMY0t2ekJZdUF5VlpXSmhyVHAv?=
 =?utf-8?B?YkZRd3FJUHpJTVAvMEtkd01HbEphbUtDY29sbmpRZStxOHdGWDRXbTRKbzZp?=
 =?utf-8?B?QkY1ZlVKRzROcWhGV3QvUHJpN0dsS0d2UzZXdDlXYTNVNGVSdlUwemswM2w2?=
 =?utf-8?B?dUVCREVxdURKdXZVRVFQT21TNmZmbWRTSUhjbFpZdTlVdjJ0clM4T29QZE5q?=
 =?utf-8?B?TGJCT1J0dnVDMUZJb2FOUk1reVJWTWZJN1NOSFlGOG5ENVJUWU0wK1o1d0sw?=
 =?utf-8?B?ZDNPUXFtYm9TeXFGaUErcDBIMHIyenZrNE9DMklLVG1vR3h0SzJna2JMcExk?=
 =?utf-8?B?emRkalhOSnVDM2QzVjZlRHEzUzVnKzN3Q0Fld0tTMHRTZkNQeFVZc2k4MmxD?=
 =?utf-8?B?NG9jS0xOc2FWbEIzUDVqcW5KMXUvMi9yamlhM3pneUQrcVlXYmZWaFlWZ0s0?=
 =?utf-8?B?SzE1b3ZYajBjdEdsRC9aK3dOTGZaRTRBcjlMdVlxS0xIVWNaZTVQY1RsRThV?=
 =?utf-8?B?QmN4WDdscThYK2hoUS84RFhlMnRRemllTzI0NEJzT0RqeGd5cW1qUFo3dWsy?=
 =?utf-8?B?QlBLWmpRWDk0eDlSOWE4UHNHTm8rY2JvRVY3bFNGMUxOKzN4T1FsTCsyNXkz?=
 =?utf-8?B?V2I0cGx6dEJZQXlrMytlZ2M4Yk9aR1JiQzJoUm0zbWFyWHFWMG1IaTBVWXFr?=
 =?utf-8?B?NTFoMmprM084Q0F1aVhYMnNWaUVUVWJwano5MnFUR0FWQTROU2R0MHNzaUpE?=
 =?utf-8?B?R3JvMWJCS3JqL2RtOU01VHBSQzl2cFZCZmxjZk83UlpNMitYd3FaSFRaYXFn?=
 =?utf-8?B?eGRmMXVoaUh3ZjV5STR1c3JyOWZFaDFBcHNMYjIrWnFzQWN5VmJTM3NhSWtH?=
 =?utf-8?B?RnZXQ2RvSmFjSGdOblFsZGdkcTk4bnFGWWhjbEZFaExGemJzczlXejNOUlpo?=
 =?utf-8?B?M1BMbjhXNCtKYjNjU2dqSFdIc0ZOU0dwSXgzcDB6MWpuVEJhMnF4cHovS3Ns?=
 =?utf-8?B?bkJwNUVsSCtkaUkyS2o2TDQ4Ni9KMXlMdStabE1xOGwxNnBFZkVFSXRjaGdX?=
 =?utf-8?B?Y1luZVlDMUFCTUFVckhHaThFd0RMQkFHd1ozZ3A4UFFqeWFaaS9pcnJ3Y0VN?=
 =?utf-8?B?aytiRTl6V1ZPVHR3YXdSSU5NRmk4QTVvcnFHRHJXcGpWNEJTdmFma1lPYzN2?=
 =?utf-8?B?NExyVm0wKzc4ZGwraFdFUGNXRTZjV2Joc3BjUjN6d3IvM0d0UURFZ25BOGpY?=
 =?utf-8?B?NnBKZUF6MENHUHlGWXkzT2VpUXg4ZzBsMnk5dDA4K3FpamtaT0xSRnozUGRC?=
 =?utf-8?B?SC9XN0g4Y0RQOGF0djFJdzZ1RnlPanRlNFIrRUE5bGd0MS9pbDdBcDcyOXMw?=
 =?utf-8?B?dGpMU0xUbXg1Q2FOTXZxSWdNQjlyNld5Z04ramFlVGhBUnBndkZEaUtxeHlI?=
 =?utf-8?B?dTJpN1dLazYrNXdlOFVrMGRTWHhMbFlEbFk5T2JKWWcrM1hZVC8yaDBDdWQx?=
 =?utf-8?B?NWwvMEJ5MWVlTCt2emxrdW4rVFZDSlFlNkpLMXRPQ2dOenl6ZHlOUGFQYUhs?=
 =?utf-8?B?UGxpclM0dWZpM0VDWkZCbGNJcVRUWUtoeSt6L3ZoNWt0RzVzYkFTOUc3dys5?=
 =?utf-8?Q?ePh0dt2xnyBcKokAMMgI/G6Br?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	86VOkL1qI24rJScln9INjA8dQtXRML5OCWIUU8BZl2uiDlXJEpdUaNxA1s8TK4bhYOKxvTKfR5FOMJRb1zsnukvWZhxQ0uoNnnlIYfkuReUpYfrEoIKKfUX+JLeFymUyPfvws1XyNeErnN3j+M33POhixjAY+K9k3mVlaOKpriMvqTbaodrSfFjc5LUCjabk54EGu2ZMvOlVPTb1j8xHvzJp6fLP6AkL66BBuiEgAIn1+tfYzOC6PiqWkbGJt6vVIFZ1tgpWPIyQs5eeEuCACyPB0uQWNiD5mxGYx8V9xEBc91QT4+bL6JYmVFxNoPSfFtPV9TDpVf5VNLxnCZkPTpGgcsWJfGFd5pKdwvE2nlCxyveu6yrZfETPTk0tyJ5CsekjlYEbAElant3RohKpbzJC64phwTGLEEpqDiJIYnGRjWUX9ECXmwalF0+gEpbfZ9fMjht2b22VxZd+4dRI70khXLRt1TIaFICzrDluGwyAWd6yjn1w1rO0F/sCi7Mxfl4OiKc247CRanDHhnOg2r+I0rQ0IYq2xLnWRlfRcjvM9mFGXh4iIOLRTTVFwN6MSUKCpSsb612vrC4crQyF4lAJ9SBTwyEJPYU3wWTTShc=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ef72d3a-1375-44f5-3116-08dca7a3a4de
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2024 03:34:06.9020
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Rj5jH0ENnW56BeKnFQQ9ZIYgan0gqaHbKqIrIb+SSnQSd0xg70/XWKQ4Pq6V+F50NKJ10qDKIoRpPvyxMngSjw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR10MB8119
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-18_18,2024-07-18_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 spamscore=0 mlxscore=0
 malwarescore=0 adultscore=0 phishscore=0 bulkscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2407110000
 definitions=main-2407190026
X-Proofpoint-ORIG-GUID: RUtWjC_H1wS1UC5U1r5EA6vfHnKINkji
X-Proofpoint-GUID: RUtWjC_H1wS1UC5U1r5EA6vfHnKINkji

What do you think about replacing the array dt_retained[n] (as in,
"dt_clause_$n") with a hash table that uses a string (like
"dt_clause_$n") to look up a probe description?

On 7/18/24 17:25, Kris Van Hees wrote:

> I think this needs an actual description of what you are trying to do,

An underlying probe gets a list of clauses to call in its trampoline.  
Actually, the underlying probe looks up a mask in some BPF map and then 
walks the clauses, calling them conditionally based on the mask bits.

To construct the mask for a particular overlying probe, we walk the 
clauses.  Each clause is associated with a particular probe 
description.  We compare the overlying probe to the respective probe 
description to decide whether to set that particular bit.

So, a uprp has a list of clauses.  We want some way of getting from 
clauses to probe descriptions.  The linear array using that $n was one 
way.  I can move over to the hash table based on clause string name if 
you prefer.

(Incidentally, a uprp's clause list is set during dt_probe_add_clause(), 
at which point we do not know the motivating probe description.

> because
> retaining pdescs in and of itself does not seem meaningful.  They do not
> contain a reference to the clause they were associated with when the code was
> parsed and compiled) and it seems to me that you are doing a sort-of reverse
> association, and are actually (indirectly) retaining clauses by keeping a
> link of pdescs, one per clause.  And you identify the clause by its numeric
> id as obtained from its identifier name (which is dynamically assigned during
> compilation).  That seems fragile and rather non-intuitive.
>
> If memory serves me right, the intent was to retain enablings.  Of course, in
> the current implementation of DTrace, enablings are nothing more than probes
> because the probes have BPF programs associated with them (unless they are
> overlying probes, in which case the actual code that gets loaded is part of the
> BPF program of the underlying probe (which will be in the enablings list).
>
> When we are retaining enablings, it seems to me that it would make more sense
> to keep a list of objects { pdesc, clause } where clause would be the
> identifier name of the compiled clause (similar to a function name).  Using a
> pointer to the actual clause instead is (I think) not going to work becauase
> AFAIK the clause does not store a pointer to its own identiifier.
>
> In the end, this will largely do the same thing as your code (here and when it
> gets used later), but it removes the implied dependency on how identifier names
> for clauses are generated.  That could change in the future, and doing so would
> completely break this imlementation.
>
> On Thu, Jun 27, 2024 at 01:38:10AM -0400, eugene.loh@oracle.com wrote:
>> From: Eugene Loh <eugene.loh@oracle.com>
>>
>> To support matching probes after dtrace has started, we retain
>> probe descriptions.
>>
>> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
>> ---
>>   libdtrace/dt_impl.h    |  2 ++
>>   libdtrace/dt_program.c | 37 ++++++++++++++++++++++++++++++++++++-
>>   2 files changed, 38 insertions(+), 1 deletion(-)
>>
>> diff --git a/libdtrace/dt_impl.h b/libdtrace/dt_impl.h
>> index 2132eda2..445cd602 100644
>> --- a/libdtrace/dt_impl.h
>> +++ b/libdtrace/dt_impl.h
>> @@ -300,6 +300,8 @@ struct dtrace_hdl {
>>   	dt_list_t dt_programs;	/* linked list of dtrace_prog_t's */
>>   	dt_list_t dt_xlators;	/* linked list of dt_xlator_t's */
>>   	dt_list_t dt_enablings;	/* list of (to be) enabled probes */
>> +	dtrace_probedesc_t **dt_retained; /* array of retained pdescs */
>> +	int dt_maxretained;	/* number of retained pdescs allocated */
>>   	struct dt_xlator **dt_xlatormap; /* dt_xlator_t's indexed by dx_id */
>>   	id_t dt_xlatorid;	/* next dt_xlator_t id to assign */
>>   	dt_ident_t *dt_externs;	/* linked list of external symbol identifiers */
>> diff --git a/libdtrace/dt_program.c b/libdtrace/dt_program.c
>> index a4b052fc..7106c249 100644
>> --- a/libdtrace/dt_program.c
>> +++ b/libdtrace/dt_program.c
>> @@ -163,7 +163,42 @@ dt_prog_stmt(dtrace_hdl_t *dtp, dtrace_prog_t *pgp, dtrace_stmtdesc_t *sdp,
>>   {
>>   	pi_state_t		st;
>>   	dtrace_probedesc_t	*pdp = &sdp->dtsd_ecbdesc->dted_probe;
>> -	int			rc;
>> +	char			*sclause = sdp->dtsd_clause->di_name;
>> +	int			rc, nclause;
>> +
>> +	/* Get the clause number from the clause name "dt_clause_"$n. */
>> +	assert(strncmp(sclause, "dt_clause_", strlen("dt_clause_")) == 0);    // FIXME can probably drop this check (make sure the name starts "dt_clause_")
>> +	nclause = atoi(sclause + strlen("dt_clause_"));
>> +	assert(nclause < 65536);	// FIXME are we okay here with some arbitrary limit?
>> +
>> +	/* Grow the list of retained pdescs, if necessary. */
>> +	if (nclause >= dtp->dt_maxretained) {
>> +		int			newm;
>> +		dtrace_probedesc_t	**newr;
>> +
>> +		/* Figure how big to make the array. */
>> +		if (dtp->dt_maxretained > 0)
>> +			newm = 2 * dtp->dt_maxretained;
>> +		else
>> +			newm = 8;
>> +		while (newm <= nclause)
>> +			newm *= 2;
>> +
>> +		/* Allocate the bigger array. */
>> +		newr = dt_zalloc(dtp, newm * sizeof(dtrace_probedesc_t *));
>> +		if (newr == NULL)
>> +			return 0;
>> +
>> +		/* Copy data and reset the parameters. */
>> +		memcpy(newr, dtp->dt_retained, dtp->dt_maxretained * sizeof(dtrace_probedesc_t *));
>> +		dt_free(dtp, dtp->dt_retained);
>> +		dtp->dt_retained = newr;
>> +		dtp->dt_maxretained = newm;
>> +	}
>> +
>> +	/* Add probe description to retained pdescs. */
>> +	assert(dtp->dt_retained[nclause] == NULL);  // FIXME can probably drop this
>> +	dtp->dt_retained[nclause] = pdp;        // FIXME I think just pointing to pdp is okay.  No need to cache my own copy.
>>   
>>   	st.cnt = cnt;
>>   	st.idp = sdp->dtsd_clause;
>> -- 
>> 2.18.4
>>
