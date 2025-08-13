Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 146482F99A8
	for <dtrace@lists.linux.dev>; Wed, 13 Aug 2025 19:58:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755115119; cv=fail; b=Twt1mnGcmJG9VJ6+X48cKTgkkolRtm8yjK2GUe7omS8AUXOqXXv0mFVflmz9bQddo/QSio6Rw66/6aVYR45KnZO7mp0goJbmH0BFt/TFjAmbTfXk5O1vvgq083ltT9em1QFzsgAeCzyCRfG8ke6PPR2NanS1VX1GOxhyWuLCf7c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755115119; c=relaxed/simple;
	bh=FtIuImxlwV3GXnN/5j/vnGeCwNChVxFxXBEfy5X/F6o=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=R9I6YLa85nfsLPDRk///ijI/qYuGHky0hpOZNmDUIh2T67sa1v1Gg3n07MW5hlLxzJGagwmXnhZpdpYyuY4GsNN/vuCI2IJ/lM7RR4FE4UR6lBFmegIiLzBERVN3bdHHkDWFdHICAOIiS74OGxg5Zs9TILp7uCrzeNRCpjrXjmA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=ihibr61w; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=RP1v+/oP; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="ihibr61w";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="RP1v+/oP"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57DINS7E024491
	for <dtrace@lists.linux.dev>; Wed, 13 Aug 2025 19:58:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=qhFTG+fD2j/dOovVTBSZkE0+bE8NV0ss2hrsESXRXHI=; b=
	ihibr61w+Qop7NHkF2CRuI8YC5wm7OzumsTEjd7jvK4fPjTPmBpKeNVu9ZoITgOT
	ryMiq1GN1yteSQLyt1+x0op9dNHq8LTFc6FepMs/v9OUZsHNO7hXaFNVeNa7k6er
	Z6XMsBR3dxmxd37f7xHINOuU8PAVK0wI1vFqtKSWEqraiEhOBR/xLWgyMVzqlo3Y
	sX+LxGjpIAfokFRqxG79pPedoDnlV/a2gCMY0T3gHPCGjjANw8zcgQV8f5j5amv4
	HmEgzt654fZJib/Jj7aZ4RrDYaRwPJyDRdhGIKtYpBE9enpK95fWPew4EZkz+baF
	mNhjG8lFhHf3y6UukPQsZQ==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 48dw450dd2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 13 Aug 2025 19:58:35 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 57DJjfJb038617
	for <dtrace@lists.linux.dev>; Wed, 13 Aug 2025 19:58:35 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11on2082.outbound.protection.outlook.com [40.107.223.82])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 48dvsjd4ns-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 13 Aug 2025 19:58:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b+wjH131riFYTXxVQ7b/QfeCDtmrANudYQsgpeRzDQjVIYk63Bkip3KBNQHky9VPIfRQx5iq+DJ1SVI4gOBWLz5CJfWK6MsVj2vB8PMujQgUpjHnced2622Bnr6IRLEHBd8BIVuV0JCuzj/EGFolshp5G+CYCkRKld6HAT+Jz3c89wp0wcrJRa26ehdYI1GV5TcneVO8SrgcEntkmw6PqjVH3Polhpbjsr7Ld/bTfZORwUTgstzlUpfzbK9mhUX4FTwly+oyv1Td4ZMInZJXVOkoN8h1I0tuX7MIFMtvVf6IwL0IFMt2TYYUMTxmkXQftrRywwkzEZ9kFkFsw807KQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qhFTG+fD2j/dOovVTBSZkE0+bE8NV0ss2hrsESXRXHI=;
 b=bHKUn/KLSdokG4WInY2HXbGFmIziD3+Cs+rqJTL+uRAf6c5ZFE/g5FjKRyU7lGkOYgyI7EZVCglMrNRF14cf6MjKzZPANzBV1pOl10vjTGmIBKtxscrNwzZ6cfPD1XokzuYoEc8QvuKRKuW9R8LG482GjvQefR60AXvAnZqX0DR/3Q07CdRf16YsFs9BUMBwNbS8KUZ87aYuaq/9PBChDlZ2n6IltOYF49/BCb7U0mLVqDgX4X6fPjb7M/ef4kNDvpap3+SjFACxcMN/PCXQKop8mP6O6VVLRhufqKWAo9VhDbfFx7Cj3/xK9Cyew18dcgaXy/HCjGVwK44+6/6Fwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qhFTG+fD2j/dOovVTBSZkE0+bE8NV0ss2hrsESXRXHI=;
 b=RP1v+/oP/2lzZW4YF/0t1b7MtywbOHIknMdcJgCh787YFoRI++hYM4BcHPZ/zkcVBCw5bm4U5L8K3XL/IQqa+4ilHGI/n2M6Isggcy6pkHP3jaOhV9R35vaP8oUsjtEu6tmmJ/96VMxYkGWRkaNL0THsPbwPl51D8WSqGAbRXfQ=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by PH0PR10MB7078.namprd10.prod.outlook.com (2603:10b6:510:288::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.13; Wed, 13 Aug
 2025 19:58:32 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%6]) with mapi id 15.20.9031.014; Wed, 13 Aug 2025
 19:58:31 +0000
Message-ID: <c061130c-a8dd-fb35-a685-65741b1a9e70@oracle.com>
Date: Wed, 13 Aug 2025 15:58:21 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [DTrace-devel] [PATCH 1/5] test: fix typos and clarify assertions
Content-Language: en-US
To: Kris Van Hees <kris.van.hees@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
References: <SJ0PR10MB56728487563A93E6A5A88686C22AA@SJ0PR10MB5672.namprd10.prod.outlook.com>
From: Eugene Loh <eugene.loh@oracle.com>
In-Reply-To: <SJ0PR10MB56728487563A93E6A5A88686C22AA@SJ0PR10MB5672.namprd10.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P265CA0277.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a1::25) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|PH0PR10MB7078:EE_
X-MS-Office365-Filtering-Correlation-Id: c1daa3ad-21a3-435f-0fbc-08dddaa3c738
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZHFIb21OOG1kS21xOHFaWUN5aS93UlRzam0vQ2V4UUdCN2ZtV1F1bUdtc1pL?=
 =?utf-8?B?RDVFRUNrNjRRSUk0QXNRWE92b3lISE9MRHVQZm50OVBNTDYxQXhaWTJ5UGd3?=
 =?utf-8?B?OXFWMzVvVDBYUjBSbVFXa25obzljTG9RSzk5cytlSk5tS3ptaUZXL1kyMEpi?=
 =?utf-8?B?c2NQVG8yRGE5TDRVWFFSS3FMOGdVQXIyc0tvbUt3ai9TblhlU013ZEJ6VVFi?=
 =?utf-8?B?Unp2TDdCdHkzZEtIM0JDNHd4c3NUQ01pSUVHcnpRL3hzdnZvS3NaaWd5NVFh?=
 =?utf-8?B?TW42cGZLRmFWS0ovS084bnd1alVXNmIzazg3NGI4cXZzYXRod2s0a1pzVTJX?=
 =?utf-8?B?Tit6b2Y2MlVNSW9ybzBnd0ZJeEY3K0dUcmVrS04yM1VNQVZRVW90aDlrbXlu?=
 =?utf-8?B?Y2FhSG9lZktGZmFMMUN3WFFrYVVvM2RhdVRvNWZUY0Y2eHRicDFrc3cvbXJH?=
 =?utf-8?B?WWhTUC9JNEtvYlpWRzZVc2hvMUdXM0duZVpGaUU4a0hWQWc2NTNYT25qalUr?=
 =?utf-8?B?RU5DdHlzUzN1bjZ5OTh1SjBLRmF5Q0E2ODVYQ1kxQlFXOEVjSmZmdTlkVkp0?=
 =?utf-8?B?aXpONitNUXNFU1BYRUFHODRpSE9MdHpVMUV3cndKYTFtVkhYTTByc0NwaFBK?=
 =?utf-8?B?NW9ET2cvT2J6TXBuMlJSYzhFTjdLckR6OTlPL3JsYkJDeGpFNE9Fc2tWZnF3?=
 =?utf-8?B?cTB3M3JMbzRUaGV3ZVJ5bG5QZWVJZDIvdmVTWlFEL0lCVFA0dXRlL2dUcFow?=
 =?utf-8?B?bE9WWncwcFZFOTM0UDZERmkwQ2J1NUVZVTJEV1FTVTlObHptRld3a1lZWm9r?=
 =?utf-8?B?MEdkcGhoWFJMOXF2a0JKYktDVmNuRE9qMTFkb1hiZmhxZEdsWmRTVGdZTUJM?=
 =?utf-8?B?SkpxNzkrTkVUOFZnVzNSZEgxdTI4aHBJcnhVa0FHMFNWTHdtcEpKKzBwRVZ6?=
 =?utf-8?B?ZHQrM3piZW0xMEhUSStNU29MLy9YeUtiZTJVby9UY293MDlPQjNaQkp6QzBX?=
 =?utf-8?B?TG9yc0M0YmdBeXUveWZsMFR4TnFtcjZabkdycHFVTERra0hGZE90blZ3eWYw?=
 =?utf-8?B?dTdXT0hLS0xmQkNhZzVZR0lGT28ySFNPRjRVbFZhdFl0RDJVcjhzMjJXejY3?=
 =?utf-8?B?dkJlWURGM1dEK3d5dTd6R2hUdk4wc09tQ0c2RWdvcmN4RXpoQTJEQ0NvcXlB?=
 =?utf-8?B?UDdMNnVHNFAvTk9GbHBuT2xSUHRJcFVIT25WRUVFdllGN28zK0s2RWtLcWJt?=
 =?utf-8?B?QURHbGh5N1Z4dHNybzh0VGU1TU1OV3h2QjRCaHpWcGhuUlc5OVpOZXdZdkJX?=
 =?utf-8?B?dXRSMnlaL1htN0xkNk9WbTVLczJ6RWRpSmcxUW8yRys3bGx2cEJsdmxLMmhH?=
 =?utf-8?B?TG9tSlFseWc5bFovRTByUGRHTExkR2RlUUZoc0owbGFnSm1OUkVBSm9aUnJt?=
 =?utf-8?B?SnFTUlM2T3BrTzN5Z096eVRRUlhOVWdzR0k0Mnkrb0diM3J5MFZRYkcxNlV3?=
 =?utf-8?B?eWQ1Q0V1dEZKTU9RN2hlWmFtWkZ6QTZHeVJUOTcrMnlBZWxqMm1hcVovSWZ3?=
 =?utf-8?B?OGhKYUMzLzRZUmV0N2FtYXNKR25CL2R5SEhESUtHeVdpOGE1SlBKcHNaUVRn?=
 =?utf-8?B?MVE1VnVIKytsbXhKM0tFZU1tTGd0NkNqcEYxNDFlQ3NNcm1WK2xISGFlODFO?=
 =?utf-8?B?SGZqZzlGRWs2ZVdLY3ZWcUlUK0RNbXB4eU41aGQxLzZKTzMvTlVUQkdwOHZK?=
 =?utf-8?B?Zm85Skc2WUJQc0hEUkdlbklRc3pUUE9BdG55cW5RZWJKWENYR2c2SlFiZCtX?=
 =?utf-8?B?ZzlKVE5ib0dyZjBkT3hOMjBLLzMvSHVLNDg5U3RINHZuREtET3lacWxXRCtv?=
 =?utf-8?B?d1BFYlBoWHdwTENuYXZLOWxZQlRNdkhBSDkwcGFXc3pUc3hDa2ZLdjVaV3NV?=
 =?utf-8?Q?opTjI0wpiOQ=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Mld1VlRlQ3pqbUpSdjIycSs0N2NEdG8rWldSaTVNWWMrZ3l0RUlhcHpjNzlV?=
 =?utf-8?B?OUYrbjVtYWNDVndTZm4rbURxQVIvQnhIS0JyY3c2WDkzY0IyWlNNTkVyYzVk?=
 =?utf-8?B?cCsydGNTcUFKN09kWVhxLytTdGJadHJFajFwYXJmMnBVQ3RXMzZSTjB1Y0I1?=
 =?utf-8?B?SEd2bmNleTJQTzlPMUkwRk1JalJWMTk4NzRha2h3MGxWV3crbHI4K28rYzgz?=
 =?utf-8?B?UEhxUG9MQWlFVU5WMzlhOG1JYmI3RkJtYjVZc0Nnam45VlhxNlFXVUx0Nm9j?=
 =?utf-8?B?YXVPZVpDVnFSd3NCUUswOE9tWlJ1c3JRRFd1ck1jemhlQTZPRFI1WlZoLzhN?=
 =?utf-8?B?Z0Y3SmludzNrQXlTb0ZsVW5jVmkzQ0l1SEJ0OG54eHJrZXBTcityMVR3L0I5?=
 =?utf-8?B?NGFEQmlPbWVtQWdnR2VqRmppMHdVOWszRnBPUFFxQ2dVcHJjRzhjbjR2RXAw?=
 =?utf-8?B?Q1dNL0YvRXRJOWtVci82S1FpcWlUbEZJYXp3K1c5TG0wZmxJWlgzcDRaSFFY?=
 =?utf-8?B?NmtDcVBKOEtPWjFwZDdWcVJWd3FKTGFYQlI5cktmSHBKcnM0WEZNcFdZem8w?=
 =?utf-8?B?enFGNTY2MzVzZ3p0NytTOUhNbjgwczA0NVNONmJSS2lOOTdya2FwWFVMSldz?=
 =?utf-8?B?T2prdklPVXh6aFBZVzZGRW1mRm1MUTB4bkZYbmp1WmljSlBSWWxhYjhHaHZh?=
 =?utf-8?B?b3ZsaDlnMklUZlpLeWtZOEZGcmU2R0Q4dlF4RmkrWmtDZFFlYmhYN3JPNjR2?=
 =?utf-8?B?WUpNS29WMDJXbVRFWWNDMUV2NG9mWFVRelhJSFV2c0IwT1Rqa09YUEJSa05C?=
 =?utf-8?B?OVJlV0hxY3ZoSDNjY0FadmxhajF2ZERmL3JleFVJLzFEdFhzUW00Q0huZGox?=
 =?utf-8?B?UElreG13Mlo5dEExRHdYdHcvczZBSENtbERpTzVEZjdJa0cxcTNWeXZ3aWVk?=
 =?utf-8?B?R294T2dyUWY5bG1ZdUl6ckxRZHVHK1VHUERTOFlEM1RIdEoweWpXaXRjVjk1?=
 =?utf-8?B?NDR5RmJCMHVhZFJ5UWJGNmN0ajBBcDh2Z3hhWEx1d1N3R3g1K3V0MEtWeTJJ?=
 =?utf-8?B?MTlLSEhyOTZpaEd1NXA0a3UvTlh4Zjd2aWh4RW1obG50QWphY3Yxc0tBTXBs?=
 =?utf-8?B?SklDZmhFT1dGWENBajI5ZndRR3I4bXhXNzdKUHYzajg2azM4djg4dWpjQ1V1?=
 =?utf-8?B?Qys4L2x6dnJIcW9hRXhwKzlBd1MrTCsrZkp5dlltTTNlZGF4RkpEcnBaRHBR?=
 =?utf-8?B?SFVFcFp3UGtORUF4U0l1aWxycXNjMnlTZUJDTk5nblhwdTJKUExidlduOEZa?=
 =?utf-8?B?bDYwbHJaWWxqcUEyR2hPbC8zNnZzUkk3dkJpTGwxbTZyV1lSWlZCQlJmcnRK?=
 =?utf-8?B?aWpVSmpIRmVHcXRhRGg5R3ZtZXB3eU50V2EyYXZDSGY2OTdnS0pNa0djZ3pC?=
 =?utf-8?B?NGg0OU1BMkdyMC9Xd3pIcGNVQXNYS0RsREJiTmJjckl5U29XQWJlek5JblYw?=
 =?utf-8?B?YitreEY3YysydkFLcWhITmZMSXl5Z3NVTGVIUWhNL3NsWlNzeFVNNmU5aUl2?=
 =?utf-8?B?d1VBeTRscld0VlFPdEFZV0dia3AzZm1MMjNLY3p6Szg2MXlHUWFDbHFqaHVX?=
 =?utf-8?B?ZnBvc25KcjdkMVozRUd1ZWxYeDJNNUZRQkl6N1ZSSXQ0SWRoeUxPZjErM1JV?=
 =?utf-8?B?OW02UmJiSXgrR0RjTWRUQld0cVNBLy8vWTVBSnVSRnNVUVZ0T0pNY2RSbFE2?=
 =?utf-8?B?cStpVWg0Y0ZGU1hDNkNQM2pWWmFnOUhyb0s5cy9TYXgvd3JPSkJWVlBhL1dO?=
 =?utf-8?B?Sk5kSVZ3eUxpVGg1Z29QeExKbng5VkVZRFpEZjhkTXBJZlE1TTFoSFBJYnlM?=
 =?utf-8?B?QnN0bzRWNG0yV0xjR0l0STJoanIzQTRtQmJVWXRWcWY4a0p5UHAxV2dwUHJG?=
 =?utf-8?B?T2h1LzkwVndySXJ6TXlNc21hYWlpeGxKdUZtamVNMy9tS2NJZkRvZkJQZEZJ?=
 =?utf-8?B?N01KcWRDa2xxMTJMY2t5VExrQ3pFd25RdlZTOHIvR05YeEJIcytZK2YrYnB4?=
 =?utf-8?B?MUhES0NyekI3VTZScDlSWnRmTmRYWllNb3BDQWEzQ095aXB5Ujl6K051Wmhy?=
 =?utf-8?Q?FmzjW7jvf9O4ph0H/0cNcgVuz?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	pZKADXhK8JJOEtEFhDLD1y37ZOR2MHmxpMJjehKLZHSegX4ovYSRxfFuBGZ8SeTK416I5YxdnyvmoN6010CHAGFNhnU1svJAXOiEC3Mw9SMiDZLYmDQfYlL6i3S55kNU4USzPtF0UuL/05hgPL1zLae5R576TFGnXZO4Bx8Q7/7+GyNTZJYgf5kDxJaG0sD66xQF3+35FfNguttFpob1tZYcbo2GQq0B89t83sdq4/NmE4DECE/AmYHAeXoAXd4YO+t+WjUd+H9Ix4/qXhdwbZJ+y3jbHF4jTmf6kJYfw9NqRnf3LRNGZRJvoIIsLvvLpEl9PJgwY1OBU/Kj3gyJVvVQq22zvEDlMKUjb91WchQXi6XaluPYhadng6vOBkfTahJK5tfTJBHrgUo7Ws4OI7pPh5X9cmLaZODtLumPqDQQLf6vXE4CcwNn6G+xDNP2McVqkM/t1LNPFkvftLt3P5vXz4DzGxF8Y/BMKyQSZrCUqs9ffcJ+3XmxzoZsQSWMDNwQf0GFtq4dzT3laZa+KOkXaIPoglNSW2Gq8lxmeNfqCME4obgtng8o7R0jd4DIKnddOHN1lnMeENrHav1itV2DNm7uCt+d/5XSBhcaifI=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c1daa3ad-21a3-435f-0fbc-08dddaa3c738
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2025 19:58:31.6111
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 00U5jB7xiq1gT+Mv4nvS7NmER7eIpBIX2BxhKumJflkyLaLg6VaNB+F6Zq1yWD2kp+cn6jJ9t9Sk/egWZ4riww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB7078
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-13_01,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 mlxscore=0 phishscore=0
 spamscore=0 suspectscore=0 mlxlogscore=999 adultscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2507300000
 definitions=main-2508130185
X-Proofpoint-ORIG-GUID: ffqPZmxMypgasOBvUZG0b6hnqbkEsZob
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODEzMDE4NSBTYWx0ZWRfX5Os8owWrasEP
 /bYcYMRfpRytvjw3/AexFuP3Ti9WTmvvy4V5dHBK7vcJt9CICoARdYJYlsRt9UC+IoUaq4rahaN
 ozDsXZGt0u5kQKTnHiw+VEH/z7m0+vc1QbPl4R7PjXh92hKY0lQovtYczaJBj9DV0XQwa3pOedA
 sn+25yfYcwuy03SLOXbL5M2Clbw9gtBwFwU9KP0nWTMTSzUc+0+Hf+7Zu1lVZax2FPWu/ZHzL9w
 9tcOOSYJ/G/oo+clj0T/ptoCWmhOaDcgLeVhzwemScL9x2JFvPdze7cXT7BCu1AhSfch8FZnZq9
 SetYwR3eKn4Gpjmy2cnEYNwSNdP7sE0NQcDAzpFVSw0j+G7sAnLbn1Dj/K0vbdaFIUUSFEfYKF5
 UakNAom6M+KwIGNfdH8y8apV++3wsIe2ytAGBcZ+6MUD0nvGcsSoqes8dqAdqO71FLzskndi
X-Authority-Analysis: v=2.4 cv=X9FSKHTe c=1 sm=1 tr=0 ts=689cee6b b=1 cx=c_pps
 a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=KIz9tjvwKah7uERaEBYA:9
 a=QEXdDO2ut3YA:10 cc=ntf awl=host:12070
X-Proofpoint-GUID: ffqPZmxMypgasOBvUZG0b6hnqbkEsZob

Reviewed-by: Eugene Loh <eugene.loh@oracle.com>

On 8/13/25 11:57, Kris Van Hees via DTrace-devel wrote:
> Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
> ---
>   test/unittest/actions/trace/tst.array-char-multi-nul.d     | 2 +-
>   test/unittest/actions/trace/tst.array-char-str-multi-nul.d | 2 +-
>   test/unittest/actions/trace/tst.array-char-str-no-nul.d    | 4 ++--
>   test/unittest/actions/trace/tst.array-char-str.d           | 2 +-
>   test/unittest/actions/trace/tst.array-char-unprintable.d   | 2 +-
>   5 files changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/test/unittest/actions/trace/tst.array-char-multi-nul.d b/test/unittest/actions/trace/tst.array-char-multi-nul.d
> index ae6370a4a..bd91498f3 100644
> --- a/test/unittest/actions/trace/tst.array-char-multi-nul.d
> +++ b/test/unittest/actions/trace/tst.array-char-multi-nul.d
> @@ -7,7 +7,7 @@
>   
>   /*
>    * ASSERTION: The trace() action prints a char-array of printable characters
> - *	      with multiple 0-bytes in its content.
> + *	      with multiple 0-bytes in its content as raw bytes.
>    *
>    * SECTION: Actions and Subroutines/trace()
>    */
> diff --git a/test/unittest/actions/trace/tst.array-char-str-multi-nul.d b/test/unittest/actions/trace/tst.array-char-str-multi-nul.d
> index 4734e619b..ba0435db8 100644
> --- a/test/unittest/actions/trace/tst.array-char-str-multi-nul.d
> +++ b/test/unittest/actions/trace/tst.array-char-str-multi-nul.d
> @@ -7,7 +7,7 @@
>   
>   /*
>    * ASSERTION: The trace() action prints a char-array of printable characters
> - *	      followed y by multiple 0-bytes correctly.
> + *	      followed by multiple 0-bytes correctly as a string.
>    *
>    * SECTION: Actions and Subroutines/trace()
>    */
> diff --git a/test/unittest/actions/trace/tst.array-char-str-no-nul.d b/test/unittest/actions/trace/tst.array-char-str-no-nul.d
> index c9acc4e73..48633a6cb 100644
> --- a/test/unittest/actions/trace/tst.array-char-str-no-nul.d
> +++ b/test/unittest/actions/trace/tst.array-char-str-no-nul.d
> @@ -6,8 +6,8 @@
>    */
>   
>   /*
> - * ASSERTION: The trace() action prints a char-aarray of printable characters
> - *	      (not terminated) correctly.
> + * ASSERTION: The trace() action prints a char-array of printable characters
> + *	      (not terminated) correctly as a string.
>    *
>    * SECTION: Actions and Subroutines/trace()
>    */
> diff --git a/test/unittest/actions/trace/tst.array-char-str.d b/test/unittest/actions/trace/tst.array-char-str.d
> index 465721b04..b61de776c 100644
> --- a/test/unittest/actions/trace/tst.array-char-str.d
> +++ b/test/unittest/actions/trace/tst.array-char-str.d
> @@ -7,7 +7,7 @@
>   
>   /*
>    * ASSERTION: The trace() action prints a char-array of printable characters
> - *	      (terminated) correctly.
> + *	      (terminated) correctly as a string.
>    *
>    * SECTION: Actions and Subroutines/trace()
>    */
> diff --git a/test/unittest/actions/trace/tst.array-char-unprintable.d b/test/unittest/actions/trace/tst.array-char-unprintable.d
> index 2fa5a1066..5b2525c35 100644
> --- a/test/unittest/actions/trace/tst.array-char-unprintable.d
> +++ b/test/unittest/actions/trace/tst.array-char-unprintable.d
> @@ -7,7 +7,7 @@
>   
>   /*
>    * ASSERTION: The trace() action prints a char-array with a non-printable
> - *	      character correctly.
> + *	      character correctly as raw bytes.
>    *
>    * SECTION: Actions and Subroutines/trace()
>    */
