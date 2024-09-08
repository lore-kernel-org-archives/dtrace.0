Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D911FEAF9
	for <dtrace@lists.linux.dev>; Sun,  8 Sep 2024 16:31:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725813086; cv=fail; b=C/vvxdc5dpnDNegUfeh5nCkDvebfa1zevfwFYfmOBxpCixQA5t+zK9FRoqne3m7NdxB2cFz5lH1joShPSzQjWjpoqB7cSoy2jpiqU2rakbMryIZerSq1Gg9GT6nNqGD/3MJXT55fu/CTjEqkw0mNUL1iqukibcb0vVRcy3CGcnw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725813086; c=relaxed/simple;
	bh=NXTjY+SO662RFzAkjHarYLlVbQCHsfAwOT+/IfrkKgA=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=rMkzGjSygakuEw9CtOgAm9f40ho/WqUmZvbCARbXJYeFAzfbstB+fadG1k18wr7IyPwBwAKk9dMG/Tz4OSBCMbqg3Do3JnlvAIfh5NaUElqT4g0cbsHHBNJzEZHaChdrwI9mlUVhhXOIA4s2fKRlqQqfookC0Xwy3D+GWsAV8s4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=CcfYG/DB; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=YRJqjDP+; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="CcfYG/DB";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="YRJqjDP+"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 488FZ8am021836
	for <dtrace@lists.linux.dev>; Sun, 8 Sep 2024 16:31:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	message-id:date:subject:to:references:from:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=
	corp-2023-11-20; bh=CCNyAr/Sb/G30U83JtrvELbrhYaPdtX2DtKFNQu7rRU=; b=
	CcfYG/DBe6Becx3NHSnqDKGj+omvidnWOJBtd8bnftbdJDP8+jss3fAbQ6Oh1lCb
	MRo/0R5fsxRD0TZ6LittPxP8F3/0EucblsAfZJtb6GMCuNQ355Bxl5b1SZthSJUA
	7jrXAa7yvsutmjDLtQrbCgKSPFu83v0/B9Rb0rujDDz4zcWq4tdlKj/ve38IqVUX
	59xjkTWbXTdJes+s2odG/AKltYHybLVop34d5fDwK0CJVq2fdsR4jpKQEhYlfydg
	ie4mYK+2AjfFgKCly+sNXnZH1Cgcc+tE5NxcB0X2juBSHaGuNUZXfAsASaSaCo4B
	dui8EBVtRzQ4aCgQ1HAjhg==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 41gdm2hf8x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Sun, 08 Sep 2024 16:31:22 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 488BTEut033598
	for <dtrace@lists.linux.dev>; Sun, 8 Sep 2024 16:31:21 GMT
Received: from nam04-dm6-obe.outbound.protection.outlook.com (mail-dm6nam04lp2042.outbound.protection.outlook.com [104.47.73.42])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 41gd96e2n0-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Sun, 08 Sep 2024 16:31:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QswZfKfO3SKYhX1uX4bYxESqFVcgPvwwewgG2KoJLUbd4y7gOoQFoQrsLyZZBPtXQkP0myC9aC2Yz/JwjSE/XJVS42DzZK4VqUamz+/tZ1nD4Bn3C14076DZB2EWcbOOYs/0iGSC0ZtSWV+cqc/g5f4l+gPVfVbJGd2xDrXSuZtN33PNOinj1jlQFTtGNSAmcKKyT95kvYNBZEX5r2uFuWsjNPDxZnhadfUUcQNMq+pf3bxp504pqttNB8s1OXHEf6kctZJWS8dLhWATFK9QruTvni2QiUZ62WXL6F6WXX3z6OIkSrDE3F9Zlt4+3zwDSBcXAMZz8ipIc2/xceX+TQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CCNyAr/Sb/G30U83JtrvELbrhYaPdtX2DtKFNQu7rRU=;
 b=ZX8jthzf6cdJ2aY9ImeCHwSuEqAkLe2x6K9N9Nk2i8rePIc1DwyXZIJ+LSADa8MZ4j0C+dSceJoxT+B0nYNhowQJRTW6H+N+Jj4tg07X8Ydvq29NM0lxVtYeW+c5zSeGpl9D7XoWZ/ytr/RemE8CPjY+j3oXmDatwPAdAh241xz+qsZmYdafxag8+z2JKwJGNO1WczdflUsyjpBWaRqnO9xIoQ8KNI85a9XaAv9Vose7fyH5LL082E9ztI2mQRGoJi5LD/3WWwE9mrJNX+LN5YFCiB6r39CAKkReA08AJQnrtcL1SZMS4fmBtU0aVOuoL3t2dBGRgLVbv6mWRSXR/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CCNyAr/Sb/G30U83JtrvELbrhYaPdtX2DtKFNQu7rRU=;
 b=YRJqjDP+aQnLWvgDMEWsbViFCDpYmoPIPWqPIwdzJFrydbkrVqomzv0pmHb3GUte33+HOnh19z+tN9Z3L8PV5QHvLTdj9DhJJfo0iJ+tUevgwenrK6oZOaaISu8Vl8A49UWMM7BEf+/Dxl0t3BqOD+Cx/G7tyDH2/kgbtoPCuA0=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by MN2PR10MB4335.namprd10.prod.outlook.com (2603:10b6:208:19a::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.12; Sun, 8 Sep
 2024 16:31:18 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%3]) with mapi id 15.20.7939.010; Sun, 8 Sep 2024
 16:31:17 +0000
Message-ID: <536b6eb4-cde5-709d-d93f-1a442a0aa9d1@oracle.com>
Date: Sun, 8 Sep 2024 12:31:12 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v2 03/19] Deprecate enabled probe ID (epid)
Content-Language: en-US
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
References: <20240903051643.17203-1-eugene.loh@oracle.com>
 <Ztp3paXrmBIuigSb@oracle.com>
From: Eugene Loh <eugene.loh@oracle.com>
In-Reply-To: <Ztp3paXrmBIuigSb@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0281.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:37a::13) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|MN2PR10MB4335:EE_
X-MS-Office365-Filtering-Correlation-Id: ccfd6f35-154c-4b7f-c8c1-08dcd023a9f1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MlBTMStPSTA0aHVhMll4Ti83cFVFcHB0MXZKd09NbWpXcEZsU29YY2pDKzln?=
 =?utf-8?B?Y3VLK2w4OW9NSUZwTFd5bmRSYzNYekxlelVIbkI4ZXdrWGtCTEtiMStjY1ow?=
 =?utf-8?B?U0xGRnFmYWVLWWYwMGVpaVZOcy8weThkWFpDVExaNjZ6V0F2c3pyVWYyWHVX?=
 =?utf-8?B?b0xVV1ZYejlweGFWcjFzVXh1TE5qUHVnSlpWTG9JOXczWmk4WkhDcXZXZnBL?=
 =?utf-8?B?d25seUJKZlZSbnNFVVRxZjZQUmRpM0JaVkJLbzhNRXlOQWVrekNIV2crM1ZD?=
 =?utf-8?B?QVcvdzQxL3pUaVA4NWF3Z3YvRC85TnN1YlBmZDRaL2k4TlYwdGovT0Zqc2w2?=
 =?utf-8?B?eWhuZ1V3eEh2SmVOZ1RuZ2o4TzhYNFJMTmVMbVVUNDFWeXAwLzJQYkV2K2lQ?=
 =?utf-8?B?MFdnT0ViV0E0MHh1czlXUGxTTUpiWkp2WWMrandXN3NLRFdJdHBCN0ZISm4w?=
 =?utf-8?B?Nm9EUjkwZnhXMmEzOGpVQjFGeENjeGNsNGZscjNIUGoyc3ptalBqdTFDOE5o?=
 =?utf-8?B?VGxTQWFGWlBZNnVpR01acC8xUWwra2o4bDZTSkZPK3FNVWxsdVhsd0lBVTFF?=
 =?utf-8?B?VlptTHdPUDBUeFh3ZllKK1duMm0wdnQ5c1VWRWd6eWE1Vy9tOEFBYVhvZTZ5?=
 =?utf-8?B?OE5WUEt6Z0dCUWRvRjVPNU9IWm9OajFmSW51c3U3SGlCbm10YmhzOFBIbmpH?=
 =?utf-8?B?dWp5cXQ5Q2N1Q0llRDk1aG0ydDg4L1kweDJBNDJZbUVzem16TnNjMXZ6Z3RW?=
 =?utf-8?B?QS9XK284dmhjSlo4WjhINisya3BuS3A5ODNzS1lvTDRHdDFnbkw5WW8rY1V0?=
 =?utf-8?B?ZXJRRldNV1BvRVdwNEFiMy84aDZMaFo5TFVOMGdVbDFMcko2TExaaHhIWDhM?=
 =?utf-8?B?M25KaW1EUWs0ek1jOEQxMnhINndKaWhMN0tCaHQvQTlDcU02N2R4bUc3Y01x?=
 =?utf-8?B?czJYcHdqUmJwS1JSQVJsalRCMHN6eVFELzhmSGpaWFVITVdCMkoyZEtFS1Bp?=
 =?utf-8?B?dzlpWEY1Q0RtWU5sVU43cUN2Y3VhMjRkcnVBMzhRQ2pqUU5ZY1AwYUZnaU85?=
 =?utf-8?B?L2lKcW9rUlZGeXFlVTV1bC9QR29NNUI3dm1yeXdMSUUyN01HUWVQNFBVdnYv?=
 =?utf-8?B?RnhqWWNXRDBackhTbWQ4QS9BTlNpMHBXRUNDOFk4YW03U3pXMnMvd1hGVkt6?=
 =?utf-8?B?QVluUjVjUnV1NHBjMStySDI0V3B2NXAvbmdEbTJwdUczVWg2akY3Mi9nblpp?=
 =?utf-8?B?cko3bE10YnQ4L3N1SHpXSTcwMkNVR25iQ1BXdDRDOTA3a3ZyOEYzL0ZIczlj?=
 =?utf-8?B?dFJnU0d3MDBrMUZqS1c2dWswaFdybXlZaFhQbTFLWGFTbGVJREhxVjlzSk8w?=
 =?utf-8?B?Tkh2V05QaTBYOURpK2pCeTBsMDFST21KSDVLNzR2SEJUbjFuT2xNMDBOMTBE?=
 =?utf-8?B?NlQ4YllyMG84b3RyK3ZVQUd5eC9CUGRxNWFTblZxRGt1Y1UxTnordkdpQzVn?=
 =?utf-8?B?TWg2cFpBZVZpNklXTCt1RUE2V0VUK1FrcTNXd0Vra29BQTBRY3E3eHdrSGNj?=
 =?utf-8?B?MDQxajdNNmc4MzNSdnNja1FiOWhNOUVBOGZrWnJxTnhMTnRPWlZZRTVqdTVv?=
 =?utf-8?B?UUtpNEE5VUNicTZJS2NEa1pPM08xTm81b3F5M2RSUUFPWXNLMi9hTktyRXVV?=
 =?utf-8?B?VmVPb251N2FOam0vZkRKOVFYNm1mY3F6ZmxZT25vWWZCV3YraEgzRTBrbStn?=
 =?utf-8?B?MjZlUGVRK0FMaVFiZlpqM2JwaU5Oa0dYSFBIRzhpZG54bitON29KbTViV1lB?=
 =?utf-8?B?R281alBuMmZNcGpKQ0dJZz09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?S1FoZTdLWXlpcTZYamxXNXVPc0ZGcHg3UGxwc3RtMHYvRUU1aXhDL2wyak9h?=
 =?utf-8?B?Ui9yTW5jdU9RM3RxSHNGZmNWNDdpYXljd2J1RExSNExIajhKUHM3N3RsN1N3?=
 =?utf-8?B?NlFrRmc2WkFVNWMyOFdUOFVtTzQ0bXFEZEp6TmNHUUw0RzJ3OVBlNzQzQW1i?=
 =?utf-8?B?TUEvQW9qRFU0cjFkdjRRNjRqZ0ZHRklmbTR1SG9NSWpGK2ZweG0zZ3JlQlpL?=
 =?utf-8?B?Z3BlZSt4MVBydDJMRS90WndMRmZsOVpTTXBFNEt4OWthN1hjZXNwZmZ1eVRR?=
 =?utf-8?B?MXYwSmVqMFhUa1pTeWxCeGhwYTRQT3hYU0VJd05ISTFRcDNCUWU3UUNxdHhh?=
 =?utf-8?B?ajlhbFJZNFNJdytlVjdIS2d2Rnp3RXA0UFByOUZYcm93WExXWXpSa3ZrRUlQ?=
 =?utf-8?B?YmMrVEZqZElRK0t1YkJMbE1lcTAwOFVYbVUxQnFJRS9UbHVRWHFmZU8zTG13?=
 =?utf-8?B?c21nWGpVdWhDSmk1MmhLbUJGRFA0MFNSZDREV2IyTGFwb0QxdlhmQUxWQi95?=
 =?utf-8?B?bmxHOC8vRHBUSDVwWnVRR25iYmNmVUdjZUJiN3BzL0huK0lWUGd2QXlXZGt5?=
 =?utf-8?B?NnhmNjRJWEZpRElSU2lERkhlMHhLUExXZDZXMTNoNXNZUTZoQ01ub3dNSHZL?=
 =?utf-8?B?U1VTM0lFMkNIVDlSdVdTSGlQYjYrbFlOSmZHVTFNaGhTS2V0MlNCWGQ2YUlp?=
 =?utf-8?B?QVhtY1h0L3FMQ3QxMTlSM05xSlgzQk9uNFp6QXc0eDRKd3B5Sm43anllVHF1?=
 =?utf-8?B?a3plMXd3WW4wWGxOeWF2UVFTNkZ6Z0ZMQ1NYa2Z4bjMxZysxYTBKbzdEL2RI?=
 =?utf-8?B?WVNuQ3pvWFNrUkh2SmgwQnJleTlXelJIM0NUb0dqclgzMnplbytKaWRmcTg3?=
 =?utf-8?B?azl2ZXp2OC9BWVlqRklJV1JkVW54dmQwZW1rK0MvcHExQklMRWlXdkNQT1p1?=
 =?utf-8?B?K3F1Mng0L3lHdlBUV3p4dDd1WEdwbFFnWmVjeXk0VVdMYmZ3UzFjOXVNZ0lv?=
 =?utf-8?B?ZmQzSU13VkVUUU9odDB2V3Q3NmZjNTIyaU81OUpIeEZQZDZKZFhKKzZDRmpu?=
 =?utf-8?B?akhsdUVQQ1FwdHJnTm1Sa1FOS2EwWENYdXNmT0RVM3NCM1QzZEtlZnI0UTBs?=
 =?utf-8?B?ZTcyaXh3QU94a0VxZ3QwK3NteUw3ZkhSZ2dyRDdDYzB4OVpMR1dlYnRqSFpE?=
 =?utf-8?B?cG5jWHpQazZyekdhWmtDN3M2T0lTem9DMVpCNHFNWGI1Y1ljUDZ3NzZVV0tq?=
 =?utf-8?B?dnJpVCt5QjRzdi9pL0syVU8xTWt6TG9rYnlTd1JwNVIzOE9mVDlVNXNjZkdq?=
 =?utf-8?B?eTAvNlFWYm1kd0JUMlV1cC9ZT0E3TFViSzVmOGFmSFlLUWJHbGtKRHlEcm1k?=
 =?utf-8?B?OGVKdU5GR3pvS1BiR0FkZEJ5YjY0cUhkcTFiVElnZjdpaXhTak5GMStlbDFl?=
 =?utf-8?B?eUl2NDlseHNYaEllNlhhR2tFOTRON0plZjdHNElsN3JmQnVIenFRcGlUZWdO?=
 =?utf-8?B?cmdpMzNScmJsWDBiZ1F3K1lGOHhHbXhJRDdXWW1TK3NWR2ZHeWR6cEhiOEEz?=
 =?utf-8?B?ZEZyZ3VNTm9aSDF3UjBnZHRtQkhuTlNOV2VlRHV2Q3lYKzRudUlrTmg4eHI2?=
 =?utf-8?B?WkFKVE1YdnJTVnZJUlpCc3VITk5DUzRCWXZlWFlUSmlhNUc3U3dQSzlQQU5M?=
 =?utf-8?B?UFZnSjE4bUFENzdzL1VoVksyZThsdlE4K3FNajhCVHl3UHFYd3pmZmFiSnds?=
 =?utf-8?B?eHZkTnF6L2g3eGtndS9BZ1IxWFNBaGlhVS9kL21nUDh4MHVUUXU3NnVoQjgw?=
 =?utf-8?B?N2VvZVY0dnBQSHorSDNlaTR3OTZYOEY4Y2ZHQnhIQ2V2QjBxOXJubXZKQkNJ?=
 =?utf-8?B?WktUbmh5emRlT3Bvc003anhmaGY1d0pMSVJSYXczY2RMUjdKYkhzWW45cys2?=
 =?utf-8?B?ZERMblRiWGk0amVBSTJVVjJRRitqeng0NGZDTWtYa3hrYXl4UURuaGg2QmN1?=
 =?utf-8?B?a0pmWklEdmtuakpQaU0wek8xdktmVHd6N21LL29lbkF2YS9BbkttUGxmUmll?=
 =?utf-8?B?UWwwWE1hOWxtOEpIVkhKd25FTjF3bmhvMDBLdVROcyszTERYand3TnJyTlNl?=
 =?utf-8?Q?X6dQtg8UN773YMTTVdOU3V1LU?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	SCL7adSSQIGxQQaSUWjf1IuF0SyX6yw9H8W5ochd1VF+liSeW9Ep5j/SZ/CcSzWWBRhkef/Kbiei6NbmwNLLAlx59Z1fTmUUgH2h8ub9BJKhUc9d5jbxWPCs1CrYR7k6jl+dEK0LR1n4ae0P4DWIXqYc73IrarU3+bz/MTCW9+dtLovXPTyOPRD+gslX5snchuwml9fjh5q24nSJpjad2xYamsmn0uvdowgA2yq+LikGXjWBTDPKqq7rU+anvXl2mpW10Z71hv2XTajht8re5PpQNBoHJeT9O79/r6cgZ8Y1DTb3GPDObccrKDNfDFYOjxkyhi3PjHUVGo3Yg8WkMuHRbmSGjMEzu1yWKGCln86TvmhlSxuNiQXbuku57PoDFdgr9kVDZVSh2gEXlP2eCsPZodHSF3be4Ciq5OLUqfprfGEQnR7x2mgrgf7yHJs+ttvgGnJDT5sUNF8LldZXDJ6jUl43LwuJ82s/7htRFukLQ8LWFXpcrorOL7LJYkzZbmj6RYAf98qJkfI8lQUaJyYfxUscLZUw+4kUO2qS2q4T6q9oLVC5Zr1SWfpWCxE+/JsvsAQTXEmh5yZO7NEGuerAV4KOJWM1tj9OQgHmsNI=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ccfd6f35-154c-4b7f-c8c1-08dcd023a9f1
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2024 16:31:17.5706
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yBOduBtKscD3tAEhSRoTyi/Ab94qAPq0m6cbEoKXtlZs2g/x+YnK+UqgM3XjyknOGYhtI2KBRYp5Iz51ySGl8w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR10MB4335
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-08_06,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 suspectscore=0 phishscore=0
 spamscore=0 malwarescore=0 adultscore=0 mlxscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2408220000
 definitions=main-2409080140
X-Proofpoint-GUID: UUa-AE_uDHIm-U5kjTHBrqqPvY8OjmPA
X-Proofpoint-ORIG-GUID: UUa-AE_uDHIm-U5kjTHBrqqPvY8OjmPA

On 9/5/24 23:31, Kris Van Hees wrote:

> Great work!  Some comments below...
>
> Note that with this work, we are breaking the libdtrace API

Okay, but perhaps it was already broken, at least through disuse and 
changing ioctl stuff???

I'll post a revised patch (and small revisions of two other patches due 
to the index/id naming change).  In a few cases, however, I comment below:

>   - but that might
> be a small price to pay for cleaning up some needed things.  However, that
> also means that we could just break it a tiny bit more and make things easier,
> perhaps.  (Yes, that goes a bit against my earlier advice but it really makes
> no sense (in retrospect) to keep supporting something that we are breaking in
> others ways anyway.)
>
> See below for details...
>
> On Tue, Sep 03, 2024 at 01:16:43AM -0400, eugene.loh@oracle.com wrote:
>> From: Eugene Loh <eugene.loh@oracle.com>
>> However, its value was opaque and therefore difficult to use.
> I would drop this sentence.  I think the preceding paragraph sufficiently
> describes it.  And you risk confusing the reader concerning whether the epipd
> was difficult to use in the dtrace internals or as a user (who won't read this
> anyway).

Difficult for the user, but even if a user doesn't read this text the 
point still matters for the reader.  I think it's worth building the 
case for deprecating something that, after all, was part of D. Noting 
that the value to the user was poor helps build this case.  I added a 
couple of words to clarify "to the user."

>> Deprecate the use of EPID:
>>
>> *)  So we rearrange as follows:
>>
>>              old                        new
>>
>>           0: pad (size)                 pad (size) <= buffer start
>>           4: pad (additional)           specid
>>           8: epid <= buffer start       prid
>>          12: specid                     stid
>>          16: data[n]                    data[n]
>>
>>      So now, we say there is no longer an 8-byte pad before the
>>      buffer start;  rather, the buffer starts with a 4-byte pad.
> I am not sure whether this layout comparison is comprehensible to anyone not
> familiar with this code.

Yeah.  Incidentally, I had moved specid so that prid/stid were in the 
same 8-byte block so that someone could read it as a single 8-byte EPID 
if they wanted to.  I'm assuming you see no value in that.  So I moved 
specid back to where it used to be and I think this simplifies the 
description of what's going on.  Anyhow, I revised this explanation.  
Hopefully it's sufficient now.

> It may need a bit more explanation concerning how
> this is used.  E.g. the size that is referred to above is a 32-bit integer
> emitted by the perf ring buffer code, giving the size of the data blob that
> follows.  And this is the reason that we need to do this little shuffle with
> the padding because (1) data needs to be written to the temporary buffer
> storage with proper alignment, (2) data should be aligned in the ring buffer,
> and (3) the perf event header + this size results in the data starting at
> a multiple of 8 + 4, i.e. not a 8-byte boundary.
>
>> diff --git a/libdtrace/dt_cc.c b/libdtrace/dt_cc.c
>> @@ -156,12 +157,12 @@ dt_clause_create(dtrace_hdl_t *dtp, dtrace_difo_t *dp)
>>   	/*
>>   	 * Generate a symbol name.
>>   	 */
>> -	len = snprintf(NULL, 0, "dt_clause_%d", dtp->dt_clause_nextid) + 1;
>> +	len = snprintf(NULL, 0, "dt_clause_%d", sdp->dtsd_index) + 1;
>>   	name = dt_alloc(dtp, len);
>>   	if (name == NULL)
>>   		longjmp(yypcb->pcb_jmpbuf, EDT_NOMEM);
>>   
>> -	snprintf(name, len, "dt_clause_%d", dtp->dt_clause_nextid++);
>> +	snprintf(name, len, "dt_clause_%d", sdp->dtsd_index);
> Here (and elsewhere) this should be replaced by:
>
> 	if (asprintf(&name, "dt_clause_%d", sdp->dtsd_id) == -1)
> 		longjmp(yypcb->pcb_jmpbuf, EDT_NOMEM);

Hmm.  But:
1)  These were pre-existing constructs.
2)  The other other two sites used alloca() and handling the free()s 
would require a bit more rearranging.

So, okay, I updated this case but left the other two cases alone.  I 
don't object to asprintf() but those other two cases would seem to be 
material for their own patch.

>>   	/*
>>   	 * Add the symbol to the BPF identifier table and associate the DIFO
>> diff --git a/libdtrace/dt_map.c b/libdtrace/dt_map.c
>> @@ -85,98 +85,16 @@ dt_datadesc_finalize(dtrace_hdl_t *dtp, dtrace_datadesc_t *ddp)
>> -void
>> -dt_epid_destroy(dtrace_hdl_t *dtp)
>> -{
>> -	size_t i;
>> -
>> -	assert((dtp->dt_pdesc != NULL && dtp->dt_ddesc != NULL &&
>> -	    dtp->dt_maxprobe > 0) || (dtp->dt_pdesc == NULL &&
>> -	    dtp->dt_ddesc == NULL && dtp->dt_maxprobe == 0));
>> -
>> -	if (dtp->dt_pdesc == NULL)
>> -		return;
>> -
>> -	for (i = 0; i < dtp->dt_maxprobe; i++) {
>> -		if (dtp->dt_ddesc[i] == NULL) {
>> -			assert(dtp->dt_pdesc[i] == NULL);
>> -			continue;
>> -		}
>> -
>> -		dt_datadesc_release(dtp, dtp->dt_ddesc[i]);
>> -		assert(dtp->dt_pdesc[i] != NULL);
>> -	}
>> -
>> -	free(dtp->dt_pdesc);
>> -	dtp->dt_pdesc = NULL;
>> +	dtrace_difo_t *rdp = dt_dlib_get_func_difo(dtp, dtp->dt_stmts[stid]->dtsd_clause);
>> +	*ddp = dt_datadesc_hold(rdp->dtdo_ddesc);             // FIXME what releases the hold?
> Well, you are the one requesting the hold, so you decide when it is to be
> released :-)
>
> In all seriousness, I believe dtrace_stmt_destroy() is the place you are
> looking for.

Actually, this is a short-lived usage by the consumer.  So 
stmt_destroy() would not seem to be the right place and, indeed, I just 
decided to drop the hold/release altogether.

>>   
>> -	free(dtp->dt_ddesc);
>> -	dtp->dt_ddesc = NULL;
>> -	dtp->dt_nextepid = 0;
>> -	dtp->dt_maxprobe = 0;
>> +	return (*ddp == NULL) ? -1 : 0;
>>   }
>>   
>>   uint32_t
>> diff --git a/test/unittest/actions/setopt/tst.badopt.r b/test/unittest/actions/setopt/tst.badopt.r
>> index 29e39fd4..e2f6d2c3 100644
>> --- a/test/unittest/actions/setopt/tst.badopt.r
>> +++ b/test/unittest/actions/setopt/tst.badopt.r
>> @@ -1,16 +1,16 @@
>>   
>>   -- @@stderr --
>> -dtrace: error on enabled probe ID 2 (ID 1: dtrace:::BEGIN): couldn't set option "Nixon" to "1": Invalid option name
>> +dtrace: error in dt_clause_0 for probe ID 1 (dtrace:::BEGIN): couldn't set option "Nixon" to "1": Invalid option name
> Perhaps it would be more efficient to update runtest.sh to support both the
> old and the new error reporting output, and changing both into a single unified
> form that substitutes changeable elements.

I don't get this.  First, there is no reason to support the old 
output... that would be a rather remarkable historical vestige to keep 
in the code base.  Second, it seems simpler and more stringent just to 
compare to a results file in some simple, straightforward way.  You say 
"perhaps" so I just left it as is.

> E.g.
> dtrace: error on enabled probe ID 2 (ID 1: dtrace:::BEGIN): couldn't set option "Nixon" to "1": Invalid option name
>
> and
>
> dtrace: error in dt_clause_0 for probe ID 1 (dtrace:::BEGIN): couldn't set option "Nixon" to "1": Invalid option name
>
> could both be rewritten using pattern amtching and substitutions to be:
>
> dtrace: error for probe (dtrace:::BEGIN): couldn't set option "Nixon" to "1": Invalid option name
>
> and tests that are supposed to exercise specific aspects of the error message
> or that depend on specific details could test that explicitly?
>
>> -dtrace: error on enabled probe ID 2 (ID 1: dtrace:::BEGIN): couldn't set option "Harding" to "1": Invalid option name
>> +dtrace: error in dt_clause_0 for probe ID 1 (dtrace:::BEGIN): couldn't set option "Harding" to "1": Invalid option name
>>   
>> -dtrace: error on enabled probe ID 2 (ID 1: dtrace:::BEGIN): couldn't set option "Hoover" to "1": Invalid option name
>> +dtrace: error in dt_clause_0 for probe ID 1 (dtrace:::BEGIN): couldn't set option "Hoover" to "1": Invalid option name
>>   
>> -dtrace: error on enabled probe ID 2 (ID 1: dtrace:::BEGIN): couldn't set option "Bush" to "1": Invalid option name
>> +dtrace: error in dt_clause_0 for probe ID 1 (dtrace:::BEGIN): couldn't set option "Bush" to "1": Invalid option name
>>   
>> -dtrace: error on enabled probe ID 2 (ID 1: dtrace:::BEGIN): couldn't set option "quiet" to "um, no": Invalid value for specified option
>> +dtrace: error in dt_clause_0 for probe ID 1 (dtrace:::BEGIN): couldn't set option "quiet" to "um, no": Invalid value for specified option
>>   
>> -dtrace: error on enabled probe ID 2 (ID 1: dtrace:::BEGIN): couldn't set option "aggrate" to "0.5hz": Invalid value for specified option
>> +dtrace: error in dt_clause_0 for probe ID 1 (dtrace:::BEGIN): couldn't set option "aggrate" to "0.5hz": Invalid value for specified option
>>   
>> -dtrace: error on enabled probe ID 2 (ID 1: dtrace:::BEGIN): couldn't set option "bufsize" to "1m": Operation illegal when tracing is active
>> +dtrace: error in dt_clause_0 for probe ID 1 (dtrace:::BEGIN): couldn't set option "bufsize" to "1m": Operation illegal when tracing is active
