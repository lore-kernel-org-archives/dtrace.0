Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 892913915AE
	for <dtrace@lists.linux.dev>; Thu, 22 Jan 2026 19:39:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769110754; cv=fail; b=fgmWdhM2N+dZw/hnHABY1Oy1oHMIMc0LaQiAQs97IwDvwW89kyVZpw05bSulgAYMujFpV154uSrz5CatuDl+fUHHdkWrvqucSdigtImuONFuh3oF41ZT12HytJgV4n1Xgy2w2DRfmXXI5NRUj3/8+QqW5roXAVUNERc99wiTSs8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769110754; c=relaxed/simple;
	bh=1mSNiv8Uqt4vy6tpGcx+uAzElAn4O4n+eAlDOiwzjLg=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=H2oAXbbXtUzfFl+B+gZvhErl5z7LKO5bV91OmEWEciGoXJYwjQzQAv7PHCcK1/9Wl8TZC6iANTDhjTw2wkc5Kd4nMzVicUnbcg/pUnCrac5fTg6ER43OwuhQNYCX/jxrh7/k839rq5ao+s6qE5Zezhgsnk4P4o7kxP4O7mA0zPs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=SNJ2G7QR; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=pFMztNQ2; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="SNJ2G7QR";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="pFMztNQ2"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60MDgSCt1085882
	for <dtrace@lists.linux.dev>; Thu, 22 Jan 2026 19:38:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=cU+e/IbMkE2N+99l4phzwToEZjJ2+ENRx1XstwalZPo=; b=
	SNJ2G7QRDsesGvjNCQFUBnrihc+/jy4VMl8N5K+VQdwJ9jXeIrZQ2QfeF3hySUuz
	6z4FWe/2Z2fETDZbaU7HGIB1o2typzddSY468ryQoIOFw6Kb1J11kYe4WxGVwDpN
	aPs1XSLt5fPYuJ09Eg9RxTbR2xMUj5jNKQZO2uxt4OzI1QR79RpaQU9s4612bMiS
	i5uG5GsCsjiOypFxzboIP9veT81oWBk0+dmYLKL2vz3fCM7VVvNUf0Br1/7xxme+
	BCL2+bdhYi/KnJNyN/0wiVyZImpmfvMaD9zvwI7KvY0n5uDMEZmobNIaseW+wnU9
	ytmOjY+LTPEYNgsX5sLw/A==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4btagcvx14-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 22 Jan 2026 19:38:54 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 60MJQAC7008424
	for <dtrace@lists.linux.dev>; Thu, 22 Jan 2026 19:38:53 GMT
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azon11010025.outbound.protection.outlook.com [52.101.46.25])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4br0vdceh2-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 22 Jan 2026 19:38:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aBm6CB9YIOZdiIyi0wwraeeoXIk+/5oYUIXXZQBySY1JVyh5TEtwvRU+7cjdGHiDdTcP+7bIk7ewyYG4iUIrWWxsn7ErjNbVbK/vn5cHLOINhj/iE/ZFZETC7iutMtrPy+Fy1mVxDSZKmI3Qftj/jHjdgiGlHwNhO4zh7Q5li/NuekIpnl8ei58AcDZwaY91Qy+Ash/sbU5ZcGXH9n6CT0ixw4Jwc1Az8hJ74XWzZbW8k9DOc1EQMu4TrZE9M8o9PMxJP1Hibhb/H0F3HhuQ3GOHelFiny7GSoubibAYOYjilIs+zQ3Hq9avQdXKb4mNf8uirXCrHchIL2Iu3yd29w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cU+e/IbMkE2N+99l4phzwToEZjJ2+ENRx1XstwalZPo=;
 b=vQB/4FRxHJ/PEIU5maRcwfNHGy6rJzWMzj59f3j3J+yPgedKvEeMyeibkdYPTHCFAQ4suay0v2Ph2eveiNfbM83N+VLoj6UGYbIy8eMy0NT2II5aKp7Oya2AfzETPcNDf3ZRyCjkSho08Xzvrvj1zytUqxL3KbLezf7MotVhDX/Ud3xoAvT2MSF9LhlH0QdffZba0NRjQ0D7FfKuOd/Jr6NO6EptGtUSaMZJzgKkeVUMF2cvCfCRLTqwykphdnlqIgnHi1rplROpOqaGwrz/qKmLNRqymCPt/dm13PWcKqG/F3TZUN/uk3zx8AoO0yDs02fHGcgnPcYu4vAkma3kiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cU+e/IbMkE2N+99l4phzwToEZjJ2+ENRx1XstwalZPo=;
 b=pFMztNQ2u9w0Kq76FI+Od62M8/2NbMo644t0JigKnCNT/idIsDMjfbpeXwtoGY+oQfrITqYgWqNg5doG1JTDqaCgio6868OIdK8u+ShES9zn/lk4jW81DtyXaWCKyGyAZXUjEVDpUJDmPM8Oc2IU7gcr1/yV5FWGSv9AHwQHO+4=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by DM4PR10MB5966.namprd10.prod.outlook.com (2603:10b6:8:b2::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.10; Thu, 22 Jan
 2026 19:38:50 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b%6]) with mapi id 15.20.9542.010; Thu, 22 Jan 2026
 19:38:50 +0000
Message-ID: <b2a6cc79-7096-8d91-1ee4-df54afea1d71@oracle.com>
Date: Thu, 22 Jan 2026 14:38:46 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [DTrace-devel] [PATCH] pid, usdt, stapsdt: refactor dependency on
 pcb and dpr
Content-Language: en-US
To: Kris Van Hees <kris.van.hees@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
References: <DS0PR10MB7522C4233CBE9A5A90CBBDF5C296A@DS0PR10MB7522.namprd10.prod.outlook.com>
From: Eugene Loh <eugene.loh@oracle.com>
In-Reply-To: <DS0PR10MB7522C4233CBE9A5A90CBBDF5C296A@DS0PR10MB7522.namprd10.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BL1P221CA0022.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:208:2c5::16) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|DM4PR10MB5966:EE_
X-MS-Office365-Filtering-Correlation-Id: 7e4cb46b-059a-48eb-8316-08de59eddddf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TFE3Q0JUcElmOUNzVmVxbWZKY2FCSThjbi9xRldXRzNUT3llTkl6eUtzRkFo?=
 =?utf-8?B?NkxzNUlxOTlRQkdzbDdUamFzQ0t3VXhwWXdWbS9EWnhhRk80UHBHMkJUSHkz?=
 =?utf-8?B?L3U2V3pkSlRWa0lzaWhITEZSZGJYMmZRM01mUFNoYVJybVpGYm5nTU0yUGJB?=
 =?utf-8?B?NzNlbVdKNk9JZEhSWHEvMnRPaWdzWnRvKzRzMjNhUTg4bkw4c3lDVmgvMjNF?=
 =?utf-8?B?bWREOXAwQ244SkhIbGd3THRqZ0JBMlQxR1dFV21wK1lsUG5oZTFRVWZDbUNC?=
 =?utf-8?B?QnJQcE5ZTE5Va1JobVBZTUYvaUQrNDRwUFZFMzcvQ2xhNzQydzdWbGMrWXpx?=
 =?utf-8?B?SzNaWWphVVRFLzRuT2JtUFQyUFg0SVVmeXlVbVJIL2hZTFRCYVo1d0dRS1lF?=
 =?utf-8?B?dHlZbVRqYkh5RzVubFdiRVlzZUZZMlZDSjJ2OE9PVkZaaS9Nd3FoUDFuSFA3?=
 =?utf-8?B?TjZ2a24rNG9KRUhFdEg1U3AyU3VWazVya3RNeWtBVlhDTEQ1Qy9uNlJPUU55?=
 =?utf-8?B?NnlMUS9Ed3NaSm5SRmpFcmF1T0ZsNFE2dkthUTVwanRzcFNTWCtNaUZoU2Nj?=
 =?utf-8?B?Z2I2ZTA2NFFPMkFLTlJtc3BtUEFjQjJsK3JuTjZkTERYSDFZZGIzUlZTWE54?=
 =?utf-8?B?d0FHMmc1aGVYKzdIUVpkaE5yQi81QS9GbWVRSythbGxxVnZiSlVhYWUrOS9B?=
 =?utf-8?B?S2EvUm1WdlZleHR4RGp2NTNnZFRRU0xNOFNMRCsrMFZxekc4cFRGK202TThM?=
 =?utf-8?B?S3NGb0dzSUFMdWdCTm1QdHBNOWZjVHRtU2NHZWhNSnhCOXdBN0ZXckt4SEJ3?=
 =?utf-8?B?V2xUOHBEb3R2b005OVlVQ29xang4WnZNWEw4M3hRWUwrN1hYZDBKbFNpRFpF?=
 =?utf-8?B?dkZNODY4TTNJSTRQMEsxcFpaTHl3NStQc2NDNk9ERjVGMGluRGl6TGpVYUxx?=
 =?utf-8?B?cndXOExoWlFGZnFWMjNVd1lQWk5Dc3ZSWlh0MVVkM2tPSWVpZm90aVdzYWZn?=
 =?utf-8?B?RjFiR0dOUG9pYTl4VitwY3FMYisvdzlUR0VkWkVtRlJHNkdwRkNNa1Y3Z3Zn?=
 =?utf-8?B?Wi9OcTE3MXBpeWMwV1lkN2Q3R3pyQmRRczJaOWtLN2ZEVHV6aDczekwzeElH?=
 =?utf-8?B?U0ZPS05WbERMM1lVeVVjRGtQaEcwUEhlRkVoRm9yZWpQZGRaMGhaSHFFNUNE?=
 =?utf-8?B?UCtnYUZkSk95VzBUOUVRMzJDQ2dYbTlaU04rWmdCaTVwQzVZWElSRW41UENS?=
 =?utf-8?B?NE0xTjlHQmREbEJ4L05WYnFvRmNMN3FJK3NnSGY3ekcyc1JQLys4M1lWU0gw?=
 =?utf-8?B?MjNGSE1kbVVRbTRyZW5FaGpQNGFiVndQNW9JaE9hYlROaXE1dWJXdXFxWjls?=
 =?utf-8?B?Smd4Y1BlaUxna1ZFaFY5RFBWc3pTNGNvWXpPZ2dmTkhjbkovUVpQMmhPVlVa?=
 =?utf-8?B?UUdSZE1ZUnhFTEwrS1lzczlSYWhKalQrS1ZzVEI2UlRZWHgwbHlaNjBDUG9O?=
 =?utf-8?B?bFpTcml4SVV4eE0xZ2hvOG8wa2RnbTN1TExkcDZ3WEJrRWNNRjM3bkVKNytl?=
 =?utf-8?B?eGYxYkpDR3VTWksxbDZ1ejlEM0UyYU5QZWd3QmZsQko4Yk9UWE1lT2l2OXJ2?=
 =?utf-8?B?TEpPR29GSCtJTjVSdWNtdVZtaHNLaFpJSVNNeEJEeFpkWTFGZnhFdlNFbFpL?=
 =?utf-8?B?YXBabTFRVDFwQ0lHemRvcW5LZmFHU3paYVQ1Rk8xQWV4VGo3djBFdHZQQUJM?=
 =?utf-8?B?dDUxeitkNlMyeVplTW55QWJIaVRlNE43UHdyTnZocnNxSCtKSURoMDBPcTIx?=
 =?utf-8?B?Q0NjTnRKbTBCNVJsOWZ1MzZlRWQ0L1R5b1F1SVJESWJMQmZ2emhYSjhvLzhk?=
 =?utf-8?B?WFBxMGxKU1dJN0o5Z1B6RVF5ZzR6US9GMHlhUVY1cXJETlBWS3dPc0Z6L0Ni?=
 =?utf-8?B?Qk51dkRHeUoxV1VtTTVBOGZuTlBkSlhMamZIbUdncUtYMkEyZHdKQU9YM3lM?=
 =?utf-8?B?YW9PL20vUFVWbnN4TTZ2TUxMcVpiTjFUSThzUDZxM0poZFVickFXa2g3UlZr?=
 =?utf-8?B?YkkwTVp1YUVuUldQZEpyZVVvekJ1Wm54YjNTOTdWaXJtaml0aC9jNFhuUHdm?=
 =?utf-8?Q?X50U=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?N2crVzdVRENJckNrdDBuYlFWakVHT3VyMCt5YW95d2lsOUh3bEZ3SjNCcjNs?=
 =?utf-8?B?ZDdPNkJHcm9UQzZBMmdFelhVN2MrZTVBYUxFcUp0cHNDcEk2ZXFIeG9ESEwy?=
 =?utf-8?B?eDB1ck14VDIzeFN3T3NEWEJhTEkyZG50TFdnMDBjT2ZVUUpLMGpIZ1M1RGlP?=
 =?utf-8?B?dEpwS0MvOEdpUkNYZUVab1dKb0NwSld5ZFZONWtZWDB1NzNmRFJMNmFDZUx0?=
 =?utf-8?B?YUg2cVNHY04yeWNiT2hLNGpHWWUvN3hQSjl1KzZyaVZUREhpUCt2TXBRaUE1?=
 =?utf-8?B?UVoyOXUrUk5maU9oUlRSM1pMMjRzVUk3U1hVMi9HdG4zc0dSb1dGRjhuZ0dL?=
 =?utf-8?B?MEltanpuOUlaM05PbEgyL0JFa2xiOTN1TjN2RFl5dzZyM3pIcUc0UndaZjZj?=
 =?utf-8?B?ZUpEUGpmVENpaEhjSGd2cDBRV25BVEpIWWlOYjQrY3ZoSGRvUS9mMXhDMGgv?=
 =?utf-8?B?QnR1bW5PUmM5UFBLaXlCZFJGSVlwQkpBRUxuSk5QVEN0UlJ6OXZJS2k1Ym4y?=
 =?utf-8?B?LytRbzFHRGtCZ0haWUJVb2FnT1JDOFN4YlRuRTF4SWNPOUNuTWZsWlFpUXhy?=
 =?utf-8?B?cXV5ZE45WHdFc3Rvc1d1UEhmdEdXOEdYUVRQcWlDUGFONGs3V244RDdjRzFa?=
 =?utf-8?B?R0kxTkVlR1AybFpiQW5RZllmeldlK1RLMUJpRHdtcjd2S0xxdzF1MFpNOGM0?=
 =?utf-8?B?a05HS09jN0ZnTkR1MFhBcHdpSDFxRFQ2SlZKbWVmMFgyaVNLd0VwdXJEZmFw?=
 =?utf-8?B?cHpMOFRodFo5cG14MWNreThQb0xuSU9MNllPTUE0WEJkWkpXa3NBTFJYK01X?=
 =?utf-8?B?K3JpcEQ5ZW5iV3I1Yi85clU2NTRaZWJONXBSaXVBRXpWR2lzb3JsZVFuM3Y1?=
 =?utf-8?B?czBFWm8zc1RvNkxuWjAxY1lUVkxmNzZTL1RJZnA3QmpJNDZKOGpPdkZkRXJL?=
 =?utf-8?B?REhqK05tZlA4L0F5QjZYMStadHFlWlBjSEpUS3dlekdGaGdUaXorM3J1Q0dI?=
 =?utf-8?B?RkZVSTk0U1JPQUJrUTgvUUpNZlhud0dPVWhYRjdYekcxRmZJYWs0dElidStT?=
 =?utf-8?B?emZQeHBNaXYrQVE2ZUJ5amxqRVlKZFVLOUxaZnF5R3BOclVnUlBNKzhPMjRL?=
 =?utf-8?B?NGNNaXVUa2tvclJSS1JMUzZxVGVVeVczUFZCVVZpR3A1NnJzKzExWi8vdVh4?=
 =?utf-8?B?eXpKL09kVllwYTJoMG91eUFzbVN3M3QwejZHMTZWRTFDamkrOHNMK1dsRTdM?=
 =?utf-8?B?ZGdTQ1RlemRQdk5sa0grZW4rZGNSamxaZUZSd3lKNll3c0pWY1BseUlEYzdG?=
 =?utf-8?B?aUNTMENKeU93eVloS3BNMmFYRElJbGd2WEQxaGdIQ2J4WXQ3WlhzWC9tMEhh?=
 =?utf-8?B?QmpPWHBQc3dvWkt0Vk5mYnkzdGIydXRabkZKZDVvd0lqeWpZK1dPaW40VWhi?=
 =?utf-8?B?ZEFwbG1BVUNwUWtnVHRpTzJOcldjcFo5d2t4amRYaGhHU1BYczVwZTdWWFJN?=
 =?utf-8?B?dHd4MFNQOGtTdTBkamtkZEs5ZFlGYXlNVnYvYm9USW9haE1JbzZRcXhLODJk?=
 =?utf-8?B?Si9YWDV0clR5eEZhQlRBYXBUV09sbkg1VGh4STlHcDF0ODF4M1BjSEFOS2xo?=
 =?utf-8?B?V0tVdkQ1VHlaOVRPY2hqRnVoaktrbHdSUXR4ZktOWlF5aWpKWEFNVEQwbVpP?=
 =?utf-8?B?bk04SU96ZTFPVFE1UEtGUHh2QnFUQkRQR3QvUjVRYXgxWGlZc1dyK3lKY04z?=
 =?utf-8?B?UmJvSm9HYVVlZy9kYUE5czJVSTN1VHl0NEdGS01uWEt4WlFGWnBIbGxFQlJX?=
 =?utf-8?B?N2Mwbjdibmk4d1VOMVBFUmdNeERSRnhrNUtPWkZBNVJWaUpUN1QzbXVMb1FP?=
 =?utf-8?B?UkhUSVBSRXR1U3pPU3FRRmxDenlsYmd3eVo4WWRJMTFoaGNtQmR0Y1BOWlFV?=
 =?utf-8?B?d3Y2aGxNbnQ2SDZ4TytpN3ZTZ0c1R0t4ODNaT0Ridm9KMnlrQ2VDb2pvUDJK?=
 =?utf-8?B?MTJhNjdxd2Y0NFVVWDEzMWh4bnZMWERnbzFCSHNoRFNCK1I3cnJnT05tUmxw?=
 =?utf-8?B?UHFaNy9tRVNCL2ZHSUNDWVROVmJwdjUvbHhSN0lVRk1OckRldWJVSWVmWnJX?=
 =?utf-8?B?UGVIRzduelp0RFRwb3lOWGVPMnU2dTJTQnZnYnZtbE5saXNWdzgwa1B2R0Ni?=
 =?utf-8?B?WUl2OC8rNTJTYkZDZ091MjJjRGU5ejMrQ2dvdDZFVWNsMDVMclRIUTNLMHNl?=
 =?utf-8?B?NEJ5MHltM0hWT3BvcUx5WXNqWmNvMnZZQVRZWHJoUFlhdlNGb2pCZmVXakpk?=
 =?utf-8?B?T3Q3VXpTU3pHT28ySTJEcjV2bC9pay9LZTFVL3Azb1ZtS01tYXhXQT09?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	KnB325Nlueu+73y3Rt4KtaxfJKUIhbWIYG9+R2Dg6/FrtzU6v/HxNJ6Oyyl/2qBc5JlWFjeCkPomWfiMXpncl3dL/LecpLIh5aP77qdCdEDFyZy+YJQEOFXjjwSv6DYFwkCfqz9F8NxMeb6CBZZwRR79wiOp3KMypGJ/usuieQCKxIZMXaj5erYHx4gAw9vJx3Rbt4u/qnPB7+d7LupUeVpPdDEkxRrXrIMdKfZFM4lc37LptJFLLfsPrNsTufWlBHt0Ym+5CjqfPPsvAOCZH6KMZMqMGk+1gyAQxBdk+u8iDL5jMv+HnDgl8NWZ3fEnQQYAiACzRJvNkwNE0wLwdCCr+VY677dkNnkwPxg9O6PINzZ7IjGxRT0/DxGzGs3SR+dsjdV0MR8ybFePbSVniHa6SFf9kQ5NEI+CtJXCq/qU8tVUYIoyPIxz/wdCvZXvY7BTnZqvgTQ+lE2CfUTSwkjGQUqgw+/krBo9XYj/GTjylgR73ILHIYAg7vemm0HeB0t/XXwCjWerLSaTh08ej4E7W1Y5T6+hmOUck8e/M5FsD9mQJtHYe8khvEZi1tDwjqMRHJhIS7hTo+9iskZHSepSgKHsG6WtIvIn9wUCqg0=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e4cb46b-059a-48eb-8316-08de59eddddf
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2026 19:38:49.9742
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yV8YhC2SY7F3sI3+DuO528l/rlPlqqsv39MxbRuYP/cX+FA1e7/RBbINnz0vMGGyKc6mVZv9uBvPEeIkFKWOPQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR10MB5966
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-22_04,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 mlxscore=0 spamscore=0
 malwarescore=0 bulkscore=0 adultscore=0 phishscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2601150000
 definitions=main-2601220150
X-Proofpoint-ORIG-GUID: yx8Q6d_c8zMKMB4X4PomcBGxONk1K4tP
X-Authority-Analysis: v=2.4 cv=IsYTsb/g c=1 sm=1 tr=0 ts=69727cce cx=c_pps
 a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=yPCof4ZbAAAA:8 a=uA9wsHENIBf8dqiyIe4A:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIyMDE1MCBTYWx0ZWRfX0z0jSlgZbpbl
 syIuGbDZ67zamcpufJiR5xqjSTI/dM7YUzOtueNFACpR7Vj37Fm9mQbEc8Rfg1SdjD3RBsEiw9B
 xbn0Nd/Pkrh5ByMjOD75/EzgQY8a2LUUi18to6f5bI04f3kNxq1dVf3+3oWV61F4YHeu8uqF5J+
 mFtBqMsOionLRHRicReua+di6ZoQv06bJvIXWYaGFejLd8hmyHGsooKXvaaSXTzAfUY75KO/RGw
 gBrXjhkteT7ta48weGH/YAZdonE0SamJwN+HoqYXVCZBH13vXQsjZeJOkZzGilUDbB9GPM3ntOH
 cinXELm0Vf5qjOVOedmUuO+PBDM9MCCnZ2VhcMhTXc0yuD4/2NaL23XInaevKhrndRxwhXAfecw
 WtqyNII4i2F2QMK3Y9XsmLhkccUp71WP2EzX5wF7nDtroHOkSO9yuKIPHVfxSHeMnjTj0E9ISXp
 q3cwFVKmei7FJnckLpw==
X-Proofpoint-GUID: yx8Q6d_c8zMKMB4X4PomcBGxONk1K4tP

Reviewed-by: Eugene Loh <eugene.loh@oracle.com>

On 1/21/26 17:57, Kris Van Hees via DTrace-devel wrote:
> The pid/usdt/stapsdt handling code in dt_pid.c was passing along both
> dtp and pcb, while dtp->dt_pcb is known to provide the value of pcb
> already.  This was done to handle a case where a fake pcb was being
> passed (from dt_prov_uprobe.c) to ensure that dt_pid_error() would not
> trigger a SEGV.
>
> After careful code analysis, dt_pid_error() is restructured to handle
> the case of pcb and/or dpr being NULL, so that the fake pcb is no
> longer needed, and we can use dtp to get to the (possibly NULL) pcb.
>
> Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
> ---
>   libdtrace/dt_cc.c          |   4 +-
>   libdtrace/dt_pid.c         | 194 ++++++++++++++++++-------------------
>   libdtrace/dt_pid.h         |   8 +-
>   libdtrace/dt_prov_uprobe.c |  14 +--
>   4 files changed, 101 insertions(+), 119 deletions(-)
>
> diff --git a/libdtrace/dt_cc.c b/libdtrace/dt_cc.c
> index 1dc119ea..0b205c38 100644
> --- a/libdtrace/dt_cc.c
> +++ b/libdtrace/dt_cc.c
> @@ -275,13 +275,13 @@ dt_setcontext(dtrace_hdl_t *dtp, const dtrace_probedesc_t *pdp)
>   	    isdigit(pdp->prv[strlen(pdp->prv) - 1]) &&
>   	    ((pvp = dt_provider_lookup(dtp, pdp->prv)) == NULL ||
>   	     pvp->pv_flags & DT_PROVIDER_PID) &&
> -	    dt_pid_create_pid_probes((dtrace_probedesc_t *)pdp, dtp, yypcb) != 0)
> +	    dt_pid_create_pid_probes((dtrace_probedesc_t *)pdp, dtp) != 0)
>   		longjmp(yypcb->pcb_jmpbuf, EDT_COMPILER);
>   
>   	/*
>   	 * USDT probes.
>   	 */
> -	if (dt_pid_create_usdt_probes((dtrace_probedesc_t *)pdp, dtp, yypcb) != 0)
> +	if (dt_pid_create_usdt_probes((dtrace_probedesc_t *)pdp, dtp) != 0)
>   		longjmp(yypcb->pcb_jmpbuf, EDT_COMPILER);
>   
>   	/*
> diff --git a/libdtrace/dt_pid.c b/libdtrace/dt_pid.c
> index 36a5883b..91c2c13a 100644
> --- a/libdtrace/dt_pid.c
> +++ b/libdtrace/dt_pid.c
> @@ -46,7 +46,6 @@
>    */
>   typedef struct dt_pid_probe {
>   	dtrace_hdl_t *dpp_dtp;
> -	dt_pcb_t *dpp_pcb;
>   	dt_proc_t *dpp_dpr;
>   	struct ps_prochandle *dpp_pr;
>   	const char *dpp_mod;
> @@ -82,24 +81,26 @@ dt_pid_objname(Lmid_t lmid, const char *obj)
>   }
>   
>   static int
> -dt_pid_error(dtrace_hdl_t *dtp, dt_pcb_t *pcb, dt_proc_t *dpr,
> -    dt_errtag_t tag, const char *fmt, ...)
> +dt_pid_error(dtrace_hdl_t *dtp, dt_proc_t *dpr, dt_errtag_t tag,
> +	     const char *fmt, ...)
>   {
> -	va_list ap;
> -	int len;
> +	va_list		ap;
> +	dt_pcb_t	*pcb = dtp->dt_pcb;
>   
>   	va_start(ap, fmt);
> -	if (pcb == NULL) {
> -		assert(dpr != NULL);
> +	if (pcb != NULL) {
> +		dt_set_errmsg(dtp, dt_errtag(tag), pcb->pcb_region,
> +		    pcb->pcb_filetag, pcb->pcb_fileptr ? yylineno : 0, fmt, ap);
> +	} else if (dpr != NULL) {
> +		int	len;
> +
>   		len = vsnprintf(dpr->dpr_errmsg, sizeof(dpr->dpr_errmsg),
> -		    fmt, ap);
> +				fmt, ap);
>   		assert(len >= 2);
>   		if (dpr->dpr_errmsg[len - 2] == '\n')
>   			dpr->dpr_errmsg[len - 2] = '\0';
> -	} else {
> -		dt_set_errmsg(dtp, dt_errtag(tag), pcb->pcb_region,
> -		    pcb->pcb_filetag, pcb->pcb_fileptr ? yylineno : 0, fmt, ap);
> -	}
> +	} else
> +		dt_set_errmsg(dtp, dt_errtag(tag), NULL, NULL, 0, fmt, ap);
>   	va_end(ap);
>   
>   	return 1;
> @@ -151,7 +152,6 @@ static int
>   dt_pid_per_sym(dt_pid_probe_t *pp, const GElf_Sym *symp, const char *func)
>   {
>   	dtrace_hdl_t *dtp = pp->dpp_dtp;
> -	dt_pcb_t *pcb = pp->dpp_pcb;
>   	dt_proc_t *dpr = pp->dpp_dpr;
>   	pid_probespec_t *psp;
>   	uint64_t off;
> @@ -195,7 +195,7 @@ dt_pid_per_sym(dt_pid_probe_t *pp, const GElf_Sym *symp, const char *func)
>   
>   		off = strtoull(pp->dpp_name, &end, 16);
>   		if (*end != '\0') {
> -			rc = dt_pid_error(dtp, pcb, dpr, D_PROC_NAME,
> +			rc = dt_pid_error(dtp, dpr, D_PROC_NAME,
>   					  "'%s' is an invalid probe name",
>   					  pp->dpp_name);
>   			goto out;
> @@ -204,8 +204,9 @@ dt_pid_per_sym(dt_pid_probe_t *pp, const GElf_Sym *symp, const char *func)
>   		psp->pps_nameoff = off;
>   
>   		if (dt_Plookup_by_addr(dtp, pid, off, (const char **)&psp->pps_fun, &sym)) {
> -			rc = dt_pid_error(dtp, pcb, dpr, D_PROC_NAME,
> -			     "failed to lookup 0x%lx in module '%s'", off, pp->dpp_mod);
> +			rc = dt_pid_error(dtp, dpr, D_PROC_NAME,
> +				"failed to lookup 0x%lx in module '%s'",
> +				off, pp->dpp_mod);
>   			if (psp->pps_fun != func && psp->pps_fun != NULL)
>   				free(psp->pps_fun);
>   			goto out;
> @@ -215,9 +216,10 @@ dt_pid_per_sym(dt_pid_probe_t *pp, const GElf_Sym *symp, const char *func)
>   		psp->pps_off = off - pp->dpp_vaddr;
>   
>   		if (dt_pid_create_one_probe(pp->dpp_pr, dtp, psp, DTPPT_ABSOFFSETS) < 0)
> -			rc = dt_pid_error(dtp, pcb, dpr, D_PROC_CREATEFAIL,
> -			    "failed to create probes at '%s+0x%llx': %s",
> -			    func, (unsigned long long)off, dtrace_errmsg(dtp, dtrace_errno(dtp)));
> +			rc = dt_pid_error(dtp, dpr, D_PROC_CREATEFAIL,
> +				"failed to create probes at '%s+0x%llx': %s",
> +				func, (unsigned long long)off,
> +				dtrace_errmsg(dtp, dtrace_errno(dtp)));
>   		else
>   			pp->dpp_nmatches++;
>   		free(psp->pps_fun);
> @@ -226,8 +228,7 @@ dt_pid_per_sym(dt_pid_probe_t *pp, const GElf_Sym *symp, const char *func)
>   
>   	if (gmatch("return", pp->dpp_name)) {
>   		if (dt_pid_create_one_probe(pp->dpp_pr, dtp, psp, DTPPT_RETURN) < 0) {
> -			rc = dt_pid_error(
> -				dtp, pcb, dpr, D_PROC_CREATEFAIL,
> +			rc = dt_pid_error(dtp, dpr, D_PROC_CREATEFAIL,
>   				"failed to create return probe for '%s': %s",
>   				func, dtrace_errmsg(dtp, dtrace_errno(dtp)));
>   			goto out;
> @@ -238,8 +239,7 @@ dt_pid_per_sym(dt_pid_probe_t *pp, const GElf_Sym *symp, const char *func)
>   
>   	if (gmatch("entry", pp->dpp_name)) {
>   		if (dt_pid_create_one_probe(pp->dpp_pr, dtp, psp, DTPPT_ENTRY) < 0) {
> -			rc = dt_pid_error(
> -				dtp, pcb, dpr, D_PROC_CREATEFAIL,
> +			rc = dt_pid_error(dtp, dpr, D_PROC_CREATEFAIL,
>   				"failed to create entry probe for '%s': %s",
>   				func, dtrace_errmsg(dtp, dtrace_errno(dtp)));
>   			goto out;
> @@ -254,15 +254,14 @@ dt_pid_per_sym(dt_pid_probe_t *pp, const GElf_Sym *symp, const char *func)
>   
>   		off = strtoull(pp->dpp_name, &end, 16);
>   		if (*end != '\0') {
> -			rc = dt_pid_error(dtp, pcb, dpr, D_PROC_NAME,
> +			rc = dt_pid_error(dtp, dpr, D_PROC_NAME,
>   					  "'%s' is an invalid probe name",
>   					  pp->dpp_name);
>   			goto out;
>   		}
>   
>   		if (off >= symp->st_size) {
> -			rc = dt_pid_error(
> -				dtp, pcb, dpr, D_PROC_OFF,
> +			rc = dt_pid_error(dtp, dpr, D_PROC_OFF,
>   				"offset 0x%llx outside of function '%s'",
>   				(unsigned long long)off, func);
>   			goto out;
> @@ -272,8 +271,7 @@ dt_pid_per_sym(dt_pid_probe_t *pp, const GElf_Sym *symp, const char *func)
>   		psp->pps_off = symp->st_value - pp->dpp_vaddr + off;
>   		if (dt_pid_create_one_probe(pp->dpp_pr, dtp,
>   					psp, DTPPT_OFFSETS) < 0) {
> -			rc = dt_pid_error(
> -				dtp, pcb, dpr, D_PROC_CREATEFAIL,
> +			rc = dt_pid_error(dtp, dpr, D_PROC_CREATEFAIL,
>   				"failed to create probes at '%s+0x%llx': %s",
>   				func, (unsigned long long)off,
>   				dtrace_errmsg(dtp, dtrace_errno(dtp)));
> @@ -460,7 +458,6 @@ dt_pid_per_mod(void *arg, const prmap_t *pmp, const char *obj)
>   {
>   	dt_pid_probe_t *pp = arg;
>   	dtrace_hdl_t *dtp = pp->dpp_dtp;
> -	dt_pcb_t *pcb = pp->dpp_pcb;
>   	dt_proc_t *dpr = pp->dpp_dpr;
>   	pid_t pid = Pgetpid(dpr->dpr_proc);
>   	GElf_Sym sym;
> @@ -504,8 +501,7 @@ dt_pid_per_mod(void *arg, const prmap_t *pmp, const char *obj)
>   		if (dt_Pxlookup_by_name(dtp, pid, pp->dpp_lmid, obj,
>   					pp->dpp_func, &sym, NULL) != 0) {
>   			if (!strisglob(pp->dpp_mod)) {
> -				return dt_pid_error(
> -					dtp, pcb, dpr, D_PROC_FUNC,
> +				return dt_pid_error(dtp, dpr, D_PROC_FUNC,
>   					"failed to lookup '%s' in module '%s'",
>   					pp->dpp_func, pp->dpp_mod);
>   			} else
> @@ -635,7 +631,7 @@ dt_pid_fix_mod(dt_pid_probe_t *pp, dtrace_probedesc_t *pdp, dtrace_hdl_t *dtp,
>    */
>   static int
>   dt_pid_create_pid_probes_proc(dtrace_probedesc_t *pdp, dtrace_hdl_t *dtp,
> -			      dt_pcb_t *pcb, dt_proc_t *dpr)
> +			      dt_proc_t *dpr)
>   {
>   	dt_pid_probe_t pp;
>   	int ret = 0;
> @@ -644,7 +640,6 @@ dt_pid_create_pid_probes_proc(dtrace_probedesc_t *pdp, dtrace_hdl_t *dtp,
>   	pp.dpp_dtp = dtp;
>   	pp.dpp_dpr = dpr;
>   	pp.dpp_pr = dpr->dpr_proc;
> -	pp.dpp_pcb = pcb;
>   	pp.dpp_nmatches = 0;
>   	pp.dpp_dev = makedev(0, 0);
>   	pp.dpp_inum = 0;
> @@ -654,7 +649,7 @@ dt_pid_create_pid_probes_proc(dtrace_probedesc_t *pdp, dtrace_hdl_t *dtp,
>   	 * we get a nicer error message.)
>   	 */
>   	if (pid == getpid())
> -		return dt_pid_error(dtp, pcb, dpr, D_PROC_DYN,
> +		return dt_pid_error(dtp, dpr, D_PROC_DYN,
>   				    "process %s is dtrace itself",
>   				    &pdp->prv[3]);
>   
> @@ -663,7 +658,7 @@ dt_pid_create_pid_probes_proc(dtrace_probedesc_t *pdp, dtrace_hdl_t *dtp,
>   	 * hidden some magic in ld.so.1 as well as libc.so.1).
>   	 */
>   	if (dt_Pname_to_map(dtp, pid, PR_OBJ_LDSO) == NULL) {
> -		return dt_pid_error(dtp, pcb, dpr, D_PROC_DYN,
> +		return dt_pid_error(dtp, dpr, D_PROC_DYN,
>   			"process %s is not a dynamically-linked executable",
>   			&pdp->prv[3]);
>   	}
> @@ -685,15 +680,15 @@ dt_pid_create_pid_probes_proc(dtrace_probedesc_t *pdp, dtrace_hdl_t *dtp,
>   		    (aout = dt_Pname_to_map(dtp, pid, "a.out")) == NULL ||
>   		    (pmp = dt_Pname_to_map(dtp, pid, pp.dpp_mod)) == NULL ||
>   		    aout->pr_vaddr != pmp->pr_vaddr) {
> -			return dt_pid_error(dtp, pcb, dpr, D_PROC_LIB,
> -			    "only the a.out module is valid with the "
> -			    "'-' function");
> +			return dt_pid_error(dtp, dpr, D_PROC_LIB,
> +				"only the a.out module is valid with the "
> +				"'-' function");
>   		}
>   
>   		if (strisglob(pp.dpp_name)) {
> -			return dt_pid_error(dtp, pcb, dpr, D_PROC_NAME,
> -			    "only individual addresses may be specified "
> -			    "with the '-' function");
> +			return dt_pid_error(dtp, dpr, D_PROC_NAME,
> +				"only individual addresses may be specified "
> +				"with the '-' function");
>   		}
>   	}
>   
> @@ -818,7 +813,7 @@ validate_dof_record(const char *path, const dof_parsed_t *parsed,
>    */
>   static int
>   dt_pid_create_usdt_probes_proc(dtrace_hdl_t *dtp, pid_t pid, dt_proc_t *dpr,
> -			       dtrace_probedesc_t *pdp, dt_pcb_t *pcb)
> +			       dtrace_probedesc_t *pdp)
>   {
>   	const dt_provider_t *pvp;
>   	int ret = 0;
> @@ -897,8 +892,8 @@ dt_pid_create_usdt_probes_proc(dtrace_hdl_t *dtp, pid_t pid, dt_proc_t *dpr,
>   	if (dpr_caller == 0) {
>   		if (dt_proc_grab_lock(dtp, pid, DTRACE_PROC_WAITING |
>   						DTRACE_PROC_SHORTLIVED) < 0) {
> -			dt_pid_error(dtp, pcb, NULL, D_PROC_GRAB,
> -			    "failed to grab process %d", (int)pid);
> +			dt_pid_error(dtp, NULL, D_PROC_GRAB,
> +				     "failed to grab process %d", (int)pid);
>   			return -1;
>   		}
>   		dpr = dt_proc_lookup(dtp, pid);
> @@ -1041,11 +1036,11 @@ dt_pid_create_usdt_probes_proc(dtrace_hdl_t *dtp, pid_t pid, dt_proc_t *dpr,
>   
>   			psp.pps_fn = Pmap_mapfile_name(dpr->dpr_proc, pmp);
>   			if (psp.pps_fn == NULL) {
> -				dt_pid_error(dtp, pcb, dpr, D_PROC_USDT,
> -					     "Cannot get name of mapping containing "
> -					     "%sprobe %s for pid %d\n",
> -					     tp->tracepoint.is_enabled ? "is-enabled ": "",
> -					     prb, dpr->dpr_pid);
> +				dt_pid_error(dtp, dpr, D_PROC_USDT,
> +					"Cannot get name of mapping containing "
> +					"%sprobe %s for pid %d\n",
> +					tp->tracepoint.is_enabled ? "is-enabled ": "",
> +					prb, dpr->dpr_pid);
>   				goto oom;
>   			}
>   
> @@ -1082,11 +1077,11 @@ dt_pid_create_usdt_probes_proc(dtrace_hdl_t *dtp, pid_t pid, dt_proc_t *dpr,
>   				   psp.pps_prv, psp.pps_mod, psp.pps_fun,
>   				   psp.pps_prb, psp.pps_pid, psp.pps_off);
>   			if (pvp->impl->provide_probe(dtp, &psp) < 0) {
> -				dt_pid_error(dtp, pcb, dpr, D_PROC_USDT,
> -					     "failed to instantiate %sprobe %s for pid %d: %s",
> -					     tp->tracepoint.is_enabled ? "is-enabled ": "",
> -					     psp.pps_prb, psp.pps_pid,
> -					     dtrace_errmsg(dtp, dtrace_errno(dtp)));
> +				dt_pid_error(dtp, dpr, D_PROC_USDT,
> +					"failed to instantiate %sprobe %s for pid %d: %s",
> +					tp->tracepoint.is_enabled ? "is-enabled ": "",
> +					psp.pps_prb, psp.pps_pid,
> +					dtrace_errmsg(dtp, dtrace_errno(dtp)));
>   				ret = -1;
>   			}
>   			free(psp.pps_fn);
> @@ -1183,7 +1178,7 @@ dt_pid_usdt_mapping(void *data, const prmap_t *pmp, const char *oname)
>    * Extract the pid from a USDT provider name.
>    */
>   pid_t
> -dt_pid_get_pid(const dtrace_probedesc_t *pdp, dtrace_hdl_t *dtp, dt_pcb_t *pcb,
> +dt_pid_get_pid(const dtrace_probedesc_t *pdp, dtrace_hdl_t *dtp,
>   	       dt_proc_t *dpr)
>   {
>   	pid_t pid;
> @@ -1196,7 +1191,7 @@ dt_pid_get_pid(const dtrace_probedesc_t *pdp, dtrace_hdl_t *dtp, dt_pcb_t *pcb,
>   	}
>   
>   	if (last == NULL || (*(++last) == '\0')) {
> -		dt_pid_error(dtp, pcb, dpr, D_PROC_BADPROV,
> +		dt_pid_error(dtp, dpr, D_PROC_BADPROV,
>   			     "'%s' is not a valid provider", pdp->prv);
>   		return -1;
>   	}
> @@ -1205,7 +1200,7 @@ dt_pid_get_pid(const dtrace_probedesc_t *pdp, dtrace_hdl_t *dtp, dt_pcb_t *pcb,
>   	pid = strtol(last, &end, 10);
>   
>   	if (errno != 0 || end == last || end[0] != '\0' || pid <= 0) {
> -		dt_pid_error(dtp, pcb, dpr, D_PROC_BADPID,
> +		dt_pid_error(dtp, dpr, D_PROC_BADPID,
>   			     "'%s' does not contain a valid pid", pdp->prv);
>   		return -1;
>   	}
> @@ -1218,24 +1213,22 @@ dt_pid_get_pid(const dtrace_probedesc_t *pdp, dtrace_hdl_t *dtp, dt_pcb_t *pcb,
>    * created, since there might still be USDT probes) and -1 on error.
>    */
>   int
> -dt_pid_create_pid_probes(dtrace_probedesc_t *pdp, dtrace_hdl_t *dtp, dt_pcb_t *pcb)
> +dt_pid_create_pid_probes(dtrace_probedesc_t *pdp, dtrace_hdl_t *dtp)
>   {
>   	pid_t pid;
>   	char provname[DTRACE_PROVNAMELEN];
>   	dt_proc_t *dpr;
>   	int err;
>   
> -	assert(pcb != NULL);
> -
>   	/* Exclude pid0 from being specifically requested. */
>   	if (strcmp(pdp->prv, "pid0") == 0) {
> -		dt_pid_error(dtp, pcb, NULL, D_PROC_BADPID,
> +		dt_pid_error(dtp, NULL, D_PROC_BADPID,
>   			     "pid0 does not contain a valid pid");
>   		return -1;
>   	}
>   
>   	/* Extract the pid. */
> -	pid = dt_pid_get_pid(pdp, dtp, pcb, NULL);
> +	pid = dt_pid_get_pid(pdp, dtp, NULL);
>   	if (pid <= 0)
>   		return 0;
>   
> @@ -1247,15 +1240,15 @@ dt_pid_create_pid_probes(dtrace_probedesc_t *pdp, dtrace_hdl_t *dtp, dt_pcb_t *p
>   	/* Grab the process. */
>   	if (dt_proc_grab_lock(dtp, pid, DTRACE_PROC_WAITING |
>   					DTRACE_PROC_SHORTLIVED) < 0) {
> -		dt_pid_error(dtp, pcb, NULL, D_PROC_GRAB,
> -		    "failed to grab process %d", (int)pid);
> +		dt_pid_error(dtp, NULL, D_PROC_GRAB,
> +			     "failed to grab process %d", (int)pid);
>   		return -1;
>   	}
>   	dpr = dt_proc_lookup(dtp, pid);
>   	assert(dpr != NULL);
>   
>   	/* Create the pid probes for this process. */
> -	err = dt_pid_create_pid_probes_proc(pdp, dtp, pcb, dpr);
> +	err = dt_pid_create_pid_probes_proc(pdp, dtp, dpr);
>   	dt_proc_release_unlock(dtp, pid);
>   
>   	return err;
> @@ -1263,8 +1256,7 @@ dt_pid_create_pid_probes(dtrace_probedesc_t *pdp, dtrace_hdl_t *dtp, dt_pcb_t *p
>   
>   static int
>   dt_stapsdt_parse(dtrace_hdl_t *dtp, dt_proc_t *dpr, dtrace_probedesc_t *pdp,
> -		 dt_pcb_t *pcb, const dt_provider_t *pvp, char *path,
> -		 unsigned long addr_start)
> +		 const dt_provider_t *pvp, char *path, unsigned long addr_start)
>   {
>   	size_t shstrndx, noff, doff, off, n;
>   	const prmap_t *pmp = NULL;
> @@ -1282,8 +1274,7 @@ dt_stapsdt_parse(dtrace_hdl_t *dtp, dt_proc_t *dpr, dtrace_probedesc_t *pdp,
>   
>   	fd = open(path, O_RDONLY);
>   	if (fd < 0) {
> -		dt_pid_error(dtp, pcb, dpr, D_PROC_USDT,
> -			     "Cannot open %s: %s\n",
> +		dt_pid_error(dtp, dpr, D_PROC_USDT, "Cannot open %s: %s\n",
>   			     path, strerror(errno));
>   		return -1;
>   	}
> @@ -1400,9 +1391,9 @@ dt_stapsdt_parse(dtrace_hdl_t *dtp, dt_proc_t *dpr, dtrace_probedesc_t *pdp,
>   			mapfile = Pmap_mapfile_name(dpr->dpr_proc, pmp);
>   
>   		if (!mapfile) {
> -			dt_pid_error(dtp, pcb, dpr, D_PROC_USDT,
> -				     "Cannot get name of mapping containing probe %s for pid %d\n",
> -				     psp.pps_prb, dpr->dpr_pid);
> +			dt_pid_error(dtp, dpr, D_PROC_USDT,
> +				"Cannot get name of mapping containing probe %s for pid %d\n",
> +				psp.pps_prb, dpr->dpr_pid);
>   			err = -1;
>   			break;
>   		}
> @@ -1418,10 +1409,10 @@ dt_stapsdt_parse(dtrace_hdl_t *dtp, dt_proc_t *dpr, dtrace_probedesc_t *pdp,
>   		psp.pps_nameoff = 0;
>   
>   		if (pvp->impl->provide_probe(dtp, &psp) < 0) {
> -			dt_pid_error(dtp, pcb, dpr, D_PROC_USDT,
> -				     "failed to instantiate probe %s for pid %d: %s",
> -				     psp.pps_prb, psp.pps_pid,
> -			dtrace_errmsg(dtp, dtrace_errno(dtp)));
> +			dt_pid_error(dtp, dpr, D_PROC_USDT,
> +				"failed to instantiate probe %s for pid %d: %s",
> +				psp.pps_prb, psp.pps_pid,
> +				dtrace_errmsg(dtp, dtrace_errno(dtp)));
>   			err = -1;
>   		}
>   		if (err == -1)
> @@ -1440,8 +1431,8 @@ out:
>   
>   static void
>   dt_pid_create_stapsdt_probes_proc(dtrace_probedesc_t *pdp, dtrace_hdl_t *dtp,
> -				  dt_pcb_t *pcb, const dt_provider_t *pvp,
> -				  dt_proc_t *dpr, const char *proc_map)
> +				  const dt_provider_t *pvp, dt_proc_t *dpr,
> +				  const char *proc_map)
>   {
>   	char line[1024];
>   	FILE *fp = NULL;
> @@ -1493,12 +1484,12 @@ dt_pid_create_stapsdt_probes_proc(dtrace_probedesc_t *pdp, dtrace_hdl_t *dtp,
>   					 pid, dirent->d_name);
>   				if (stat(path, &s) != 0 || s.st_ino != inode)
>   					continue;
> -				if (dt_stapsdt_parse(dtp, dpr, pdp, pcb, pvp,
> -						     path, addr_start - file_offset) != 0)
> +				if (dt_stapsdt_parse(dtp, dpr, pdp, pvp, path,
> +						     addr_start - file_offset) != 0)
>   					break;
>   			}
>   		} else {
> -			if (dt_stapsdt_parse(dtp, dpr, pdp, pcb, pvp, name,
> +			if (dt_stapsdt_parse(dtp, dpr, pdp, pvp, name,
>   					     addr_start - file_offset) != 0)
>   				break;
>   		}
> @@ -1507,7 +1498,7 @@ dt_pid_create_stapsdt_probes_proc(dtrace_probedesc_t *pdp, dtrace_hdl_t *dtp,
>   }
>   
>   static int
> -dt_pid_create_stapsdt_probes(dtrace_probedesc_t *pdp, dtrace_hdl_t *dtp, dt_pcb_t *pcb)
> +dt_pid_create_stapsdt_probes(dtrace_probedesc_t *pdp, dtrace_hdl_t *dtp)
>   {
>   	const dt_provider_t *pvp;
>   	dt_proc_t *dpr = NULL;
> @@ -1518,8 +1509,6 @@ dt_pid_create_stapsdt_probes(dtrace_probedesc_t *pdp, dtrace_hdl_t *dtp, dt_pcb_
>   	if (len == 0)
>   		return 0;
>   
> -	assert(pcb != NULL);
> -
>   	pidstr = &pdp->prv[len];
>   
>   	while (isdigit(*(pidstr - 1)))
> @@ -1535,20 +1524,27 @@ dt_pid_create_stapsdt_probes(dtrace_probedesc_t *pdp, dtrace_hdl_t *dtp, dt_pcb_
>   		return 0;
>   	if (dt_proc_grab_lock(dtp, pid, DTRACE_PROC_WAITING |
>   			      DTRACE_PROC_SHORTLIVED) < 0) {
> -		dt_pid_error(dtp, pcb, NULL, D_PROC_GRAB,
> -			     "failed to grab process %d",
> -			     (int)pid);
> +		dt_pid_error(dtp, NULL, D_PROC_GRAB,
> +			     "failed to grab process %d", (int)pid);
>   		return 1;
>   	}
>   	dpr = dt_proc_lookup(dtp, pid);
>   	if (dpr) {
>   		char *path = NULL;
>   
> -		if (asprintf(&path, "/proc/%s/maps", pidstr) == -1)
> -			longjmp(pcb->pcb_jmpbuf, EDT_NOMEM);
> -		dt_pid_create_stapsdt_probes_proc(pdp, dtp, pcb,
> -						  pvp, dpr, path);
> -		free(path);
> +		if (asprintf(&path, "/proc/%s/maps", pidstr) == -1) {
> +			if (dtp->dt_pcb != NULL)
> +				longjmp(dtp->dt_pcb->pcb_jmpbuf, EDT_NOMEM);
> +			else
> +				path = NULL;
> +		}
> +
> +		if (path != NULL) {
> +			dt_pid_create_stapsdt_probes_proc(pdp, dtp, pvp, dpr,
> +							  path);
> +			free(path);
> +		}
> +
>   		dt_proc_release_unlock(dtp, pid);
>   	}
>   
> @@ -1556,14 +1552,12 @@ dt_pid_create_stapsdt_probes(dtrace_probedesc_t *pdp, dtrace_hdl_t *dtp, dt_pcb_
>   }
>   
>   int
> -dt_pid_create_usdt_probes(dtrace_probedesc_t *pdp, dtrace_hdl_t *dtp, dt_pcb_t *pcb)
> +dt_pid_create_usdt_probes(dtrace_probedesc_t *pdp, dtrace_hdl_t *dtp)
>   {
>   	glob_t globbuf;
>   	char *globpat = NULL;
>   	int err = 0, i, nmatches = 0;
>   
> -	assert(pcb != NULL);
> -
>   	/* If it cannot end with a pid, we're done. */
>   	if (pdp->prv[0] != '\0') {
>   		char lastchar = pdp->prv[strlen(pdp->prv) - 1];
> @@ -1606,14 +1600,14 @@ dt_pid_create_usdt_probes(dtrace_probedesc_t *pdp, dtrace_hdl_t *dtp, dt_pcb_t *
>   		pdptmp.prb = pdp->prb[0] == '\0' ? "*" : pdp->prb;
>   
>   		/* Create USDT probes for this process. */
> -		if (dt_pid_create_usdt_probes_proc(dtp, pid, NULL, &pdptmp, pcb))
> +		if (dt_pid_create_usdt_probes_proc(dtp, pid, NULL, &pdptmp))
>   			err = 1;
>   	}
>   	free(globpat);
>   	globfree(&globbuf);
>   
>   	if (err == 0)
> -		err = dt_pid_create_stapsdt_probes(pdp, dtp, pcb);
> +		err = dt_pid_create_stapsdt_probes(pdp, dtp);
>   
>   	/* If no errors, report success. */
>   	if (err == 0)
> @@ -1667,7 +1661,7 @@ dt_pid_create_probes_module(dtrace_hdl_t *dtp, dt_proc_t *dpr)
>   			dtrace_probedesc_t	pd;
>   
>   			pdp = &stp->ds_desc->dtsd_ecbdesc->dted_probe;
> -			pid = dt_pid_get_pid(pdp, dtp, NULL, dpr);
> +			pid = dt_pid_get_pid(pdp, dtp, dpr);
>   			if (pid != dpr->dpr_pid)
>   				continue;
>   
> @@ -1675,7 +1669,7 @@ dt_pid_create_probes_module(dtrace_hdl_t *dtp, dt_proc_t *dpr)
>   			pd.fun = strdup(pd.fun);	/* we may change it */
>   
>   			if (gmatch(provname, pdp->prv) != 0 &&
> -			    dt_pid_create_pid_probes_proc(&pd, dtp, NULL, dpr) != 0)
> +			    dt_pid_create_pid_probes_proc(&pd, dtp, dpr) != 0)
>   				ret = 1;
>   
>   			/*
> @@ -1683,7 +1677,7 @@ dt_pid_create_probes_module(dtrace_hdl_t *dtp, dt_proc_t *dpr)
>   			 * a USDT provider.
>   			 */
>   			if (strcmp(provname, pdp->prv) != 0) {
> -				if (dt_pid_create_usdt_probes_proc(dtp, -1, dpr, pdp, NULL) < 0)
> +				if (dt_pid_create_usdt_probes_proc(dtp, -1, dpr, pdp) < 0)
>   					ret = 1;
>   				else
>   					dt_pid_fix_mod(NULL, pdp, dtp, dpr->dpr_pid);
> diff --git a/libdtrace/dt_pid.h b/libdtrace/dt_pid.h
> index c35adc2c..f59bdfdd 100644
> --- a/libdtrace/dt_pid.h
> +++ b/libdtrace/dt_pid.h
> @@ -16,12 +16,10 @@
>   extern "C" {
>   #endif
>   
> -extern int dt_pid_create_pid_probes(dtrace_probedesc_t *, dtrace_hdl_t *,
> -				    dt_pcb_t *);
> -extern int dt_pid_create_usdt_probes(dtrace_probedesc_t *, dtrace_hdl_t *,
> -				     dt_pcb_t *);
> +extern int dt_pid_create_pid_probes(dtrace_probedesc_t *, dtrace_hdl_t *);
> +extern int dt_pid_create_usdt_probes(dtrace_probedesc_t *, dtrace_hdl_t *);
>   extern int dt_pid_create_probes_module(dtrace_hdl_t *, dt_proc_t *);
> -extern pid_t dt_pid_get_pid(const dtrace_probedesc_t *, dtrace_hdl_t *, dt_pcb_t *,
> +extern pid_t dt_pid_get_pid(const dtrace_probedesc_t *, dtrace_hdl_t *,
>   			    dt_proc_t *);
>   
>   #ifdef	__cplusplus
> diff --git a/libdtrace/dt_prov_uprobe.c b/libdtrace/dt_prov_uprobe.c
> index e94827f2..101956e5 100644
> --- a/libdtrace/dt_prov_uprobe.c
> +++ b/libdtrace/dt_prov_uprobe.c
> @@ -645,23 +645,13 @@ static int add_probe_usdt(dtrace_hdl_t *dtp, dt_probe_t *prp)
>   static int discover(dtrace_hdl_t *dtp)
>   {
>   	int		i;
> -	dt_pcb_t	pcb;
>   
>   	/* Clean up stale pids from among the USDT probes. */
>   	clean_usdt_probes(dtp);
>   
>   	/* Discover new probes, placing them in dt_probes[]. */
> -	/*
> -	 * pcb is only used inside of dt_pid_error() to get:
> -	 *     pcb->pcb_region
> -	 *     pcb->pcb_filetag
> -	 *     pcb->pcb_fileptr
> -	 * While pcb cannot be NULL, these other things apparently can be.
> -	 */
> -	memset(&pcb, 0, sizeof(dt_pcb_t));
> -	for (i = 0; i < dtp->dt_stmt_nextid; i++) {
> -		dt_pid_create_usdt_probes(&dtp->dt_stmts[i]->dtsd_ecbdesc->dted_probe, dtp, &pcb);
> -	}
> +	for (i = 0; i < dtp->dt_stmt_nextid; i++)
> +		dt_pid_create_usdt_probes(&dtp->dt_stmts[i]->dtsd_ecbdesc->dted_probe, dtp);
>   
>   	return 0;
>   }
