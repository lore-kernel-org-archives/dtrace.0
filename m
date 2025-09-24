Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 559D71114
	for <dtrace@lists.linux.dev>; Wed, 24 Sep 2025 19:36:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758742569; cv=fail; b=qyIJPNbnejnfNShIoD0Gn+u4o7AnHXsSPIa1GX4IhPlYtIGfjSAniIY3ZcgYzws6vW/fW0ALkfdNXzf4/4zfNXnsRAhUBKqZZujg4NfPDgvLUkd4acUaWVeE6fxNP4QMP4d8LkqHTs5fWP8VUVXFgICW9zuyAuFFS2sApa9sXwo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758742569; c=relaxed/simple;
	bh=0spMtb11kmvLTr0W3VCxHOBjx0ukvnQExlm6pUaymRg=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=oSNEyEwvLhW+O36W3eZQAIs/FchNLqbZfJ1jNdRw604oDmMQetHW6MlYpmN714UOcO5WddskBAcRFkOuj81o8s/bItgu/MEvhybua+eqhiP8135eObaEQouFgGeoNOCc9ki+ZnPL1yryQrfWgmvoOBiCbl1v6QEUtDglgs03IKE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=EZ2XRU6o; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=yJKwyedA; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="EZ2XRU6o";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="yJKwyedA"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58OIttB9001525
	for <dtrace@lists.linux.dev>; Wed, 24 Sep 2025 19:36:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=DkLMNKOVg1z3eWUlBcBDJcvoUjUs6dh0RCP3H05vwaw=; b=
	EZ2XRU6oiFiSutGl0KiI5nwlIvRpliwByH0W6JcPM+X94yNTsVpf7Gy6YZu+1Ikw
	+xs1ibTdnnFYWh8hUKnhS5CTc/kmYy90MtAGck8w44nhDu2MDj2gxDa0RKGnG8kt
	3ef477QNEJ1Fpw4MCdrFIm/yx+8qB0ys0VAq+iO8nXuZdKsBSsX3Qc1zKi6UjJ9l
	q2rOvwSkZZ70ZTz4XiV/ImPkjLiG0Oy34CHcUKIhjmckcq6N2bMQBr6kk+6JFLzr
	9zXDhcHbIfO13o2wHWG2GoSs/TEL/CsWYohO+GrKP0F55llVHGIGHjaD/De39hgv
	tRXsp5y0la6UjfW2rr2X+g==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 499k23gj11-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 24 Sep 2025 19:36:03 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 58OJ21pC014055
	for <dtrace@lists.linux.dev>; Wed, 24 Sep 2025 19:36:02 GMT
Received: from sn4pr2101cu001.outbound.protection.outlook.com (mail-southcentralusazon11012020.outbound.protection.outlook.com [40.93.195.20])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 49a9515x05-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 24 Sep 2025 19:36:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qhNGBwOil62XszaM0wdTWEr6LFnTsJoH6LrmMTlTBqaU5yw/cyEJlteueKWF+trLWBuPIGrHQHyRd/KBhL57BkEimPA8q48+g/qqCnxaxukYt+yKUHO/uchbELm156xXwaAZa1Mgh/cfIouBNisn6aUUEOSeerKspgISxssItDJ705OreA0klOPRSt8GMBHo7AP3elt+tnksFVKj2KABefpc9NTcWporJCFgPWlZhjAQnM0BOrgy2w045lUFSVCcJjduMb0TcG2QVR42nCn4+UN8tYdAaUD4L1w9XAxL+yI3BKhF/ohO1qN+AGqGjJNyCW3qum5bWaQWpxdARcBAEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DkLMNKOVg1z3eWUlBcBDJcvoUjUs6dh0RCP3H05vwaw=;
 b=e6ZFaqnjoziUesPuzz0+g+OJZbCCWokF4VvPf5XI8dzaJAhhG8TUeiUKTEh1n0uathqpe2OeUwImauAA6i2gX49LDOKwE/rv/mrH7OEgBGsugJVd3WSBlzUMU4pNkLjkPrBp33x+w4gRioUCEIam1JKQ2hnfckDA6WP9zsilipEnyTCP4KHfqzHudt0jRXVTt8Gz0sEmprT1H8da1Ws5UOP76RHJEQ9YaTKqpe/usB32kIrg5e0OLJeaPnpdC5MIH58CxVdf/GEx47Dp4UVk5m4H6jYRaZyCtN73jtSNCn45nhhTrTdpA0u4/1m5QXMPzfNYPynnlnNB6bf1wlQXUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DkLMNKOVg1z3eWUlBcBDJcvoUjUs6dh0RCP3H05vwaw=;
 b=yJKwyedAIfASSBduqBKscJkcRlP3Qp88ZUAIzcaIgXqaxNmB/MZnSU9l4/GcHTZQlort0z4ibUtLpMM0KbA7KuCkHjSUrFdlDo/eYeC7+OUr5Thu2pw+p1byvALuH/sXOWHuzFqFE7jinrFUktdKo13fcndXuFa4o3bq1NbU6kk=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by SJ5PPF5B5767B72.namprd10.prod.outlook.com (2603:10b6:a0f:fc02::7a1) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Wed, 24 Sep
 2025 19:35:56 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b%6]) with mapi id 15.20.9160.008; Wed, 24 Sep 2025
 19:35:56 +0000
Message-ID: <3fee9a0f-f289-ee26-9ad9-1ec814b355c3@oracle.com>
Date: Wed, 24 Sep 2025 15:35:54 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [DTrace-devel] [PATCH v2] cg: fix masking of lower 32 bits
Content-Language: en-US
To: Kris Van Hees <kris.van.hees@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
References: <SJ0PR10MB56722CE7DDCF7B95B77EF032C21CA@SJ0PR10MB5672.namprd10.prod.outlook.com>
From: Eugene Loh <eugene.loh@oracle.com>
In-Reply-To: <SJ0PR10MB56722CE7DDCF7B95B77EF032C21CA@SJ0PR10MB5672.namprd10.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PH8P220CA0032.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:348::10) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|SJ5PPF5B5767B72:EE_
X-MS-Office365-Filtering-Correlation-Id: af2f6d18-ad64-47ac-96f2-08ddfba194ad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aEwvUExlSmVXbXNicUgrWCt0YUJoMDdsVUlMWjVYUkpmckRMTU83c3BtU0Nl?=
 =?utf-8?B?c09jMXFkRUt1WnQzVnV5bUppekZ5V2xLWjVWR3M2UzB5anptR3NNQUdOem5v?=
 =?utf-8?B?RkpZWVA5eXNWTHFDWVJCaHk5REplb2RXWFN0R09wNi96UDhxM2dUT2d3cFht?=
 =?utf-8?B?bXJXQ1VoVnFueTNGNEtBdHdJbWQ5Tk9WZkw1a3NpUUNRbGFSMEN1UlJ5QVEv?=
 =?utf-8?B?bExuMStCQnBUR1NYY21mTDNVOFptSm9tZm93MWJVTnlhK3U5Q2RWcWVyS1JM?=
 =?utf-8?B?aGJMTDRvUXBSNFk2VzJ3T0lwcWMrRTZDblNFS1pDRWNKdUhxS0FjK0MrMEk5?=
 =?utf-8?B?K3p6MHFqU3VKQno1MEIwc1daQXBScnkwRFhmNHdQdXoyTk9XdUk0RXA1Z0xm?=
 =?utf-8?B?b3BxZ3NwSEVwUTJpQ2tCOGxrZEZTUDdlSGZTeGFIZzNvdllSRlU2Y3d2MnJP?=
 =?utf-8?B?TEJmREIxRDAxbER3T09Uc3pqenB4UEpNaW1aMjFFS2NRU1dYZkNYMWMzL3lF?=
 =?utf-8?B?Vm5zZlhIdGdaQUgvb3I2a0pRSVRlbTVkVmkyRGNiWFRULzRpRDdEbEszZnRm?=
 =?utf-8?B?WERMdDZzVVB3NDVaeGx5U2F4WjhuWEFIME56MnZWRFVHVnBHVmpJbXNoZjEr?=
 =?utf-8?B?YURLZmU0UVRWQWdNeTFqRHFxVmRHU1FhYXhURHh2cGxVcDhnaDBWY3BEMjJD?=
 =?utf-8?B?VVZyck85NXc2SkdGTmhlUW9zaDZoYm5xNXMranhQd3grcEI1b1V1bTh6NW1w?=
 =?utf-8?B?WmhISEdtMlBLM21oYytCdnFzY25NdGlmTVdzWXBZVDhpQW56ZVBWSU1ZQ1R3?=
 =?utf-8?B?Yk5NVXJzWCtzS2pIbVo2YWRabncrKyt2Y0dyblZGbm9ReHFWcWMvVEEzQlJn?=
 =?utf-8?B?SjdCbjBENjRJUzJkZVR6UCtqNThmU012Z21kWllPN0k5UWY2eEVOcCtZTjk1?=
 =?utf-8?B?T3B3aTVaWnAyQkRraWJGNm9BVm5iS1c0K1ZkbUZXbzdTdkZMVTZmVGc3TGcv?=
 =?utf-8?B?VmM4djZMT2tVblJNSFlFSU0zWTJTWjZ5WkNVdXdyclc1S1BzM2gxNitZaCtU?=
 =?utf-8?B?ZjhIcnViZTNzTmh6VVBKYUhwdTRLdFJTUy9oczlTMWZrb0U4VDVvWURYeEtH?=
 =?utf-8?B?cTkwOHhoRTNQQlN4K21zRzcza1cyb1MwMmJ2SHRDaTVEVUdHamJ3bHFiNVhD?=
 =?utf-8?B?M0tpQkRUSzFtVkgxZG45Y3ZhWUlnS3QraVNGdXV5SStIMk5rcFlOZEpkQXRm?=
 =?utf-8?B?WUw2OUYydzIrSWM3MHhpWW5wUENjaXlOUEtUVmNmQ1ZmZllsY2lneTdRM3BD?=
 =?utf-8?B?SEZ5UDkrblpxYVJTRzhNODRsYjdBWjFGYmJTbVllUXhGd1JzSm9PWE5Gd2Iz?=
 =?utf-8?B?V1NJME05MTZ0SSs2dWJRZXpoMkVmQ0pBcmxTMlkrQ3ZHWFRldlF3bmhIQUxy?=
 =?utf-8?B?U0NkclFLRFNjVTVmSDk2Zmk5RjI2bXpoRGxLQWZ6NDJvY1FJcnY5a3JvaWZn?=
 =?utf-8?B?b3BJZEVGTnBYcnhBSGMrek1NZVZNRlloUXpqZzFsTjJBZjRndU83R0FsSG5q?=
 =?utf-8?B?MSt5UUh5T2RuZmxrY0N1M1VTd0Q1SkxkU2dkcnZwaVJEbmlES2k0b0RSdmtr?=
 =?utf-8?B?c2RJSzRRdk04ZS93NktwcjRkVk4yQVlrRDY1c3BNblFNczJsajlFMHBRR3Vt?=
 =?utf-8?B?bDlmcVZqRlFsVzVHSG44Wm10VEh6T2dZMWt6REExcHBaUFYwdER6MjcxcDRq?=
 =?utf-8?B?dHVMZHg4UTF1MWdhUFJjeHFZVkRWTW5mU3ljWVcrMzgyYlV1NUlvQUhCZWJ4?=
 =?utf-8?B?a0d4eVZGN05LQ3BEYXVzRWRaSEhQN1ZpeXR5UVdlNjZ0eVJzanM0Vll4U1pm?=
 =?utf-8?B?dEs1UG41NEQ0cjlNL1dpSFZjRHJpQUhEdGRYSnB6T29BNzhHRTBWa050OWtr?=
 =?utf-8?Q?iVOCRT/ko7M=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SEYvTVYyaFNyR0cvQlRqWVU5d3BRSlJxUDFCN2tNOWNNYUhUcVBVWEFycm1q?=
 =?utf-8?B?WjJiVDdtZVkxZ1BLeG82V04xV3l0YVIyZU15OGNoTE43Q0NUeHVJREFjakp4?=
 =?utf-8?B?K2gremVidVlhc0xLcmJTZTNhRWdtVjRqMTcxWmlCY1NKWlVGa2FVbGVlWDlo?=
 =?utf-8?B?RHpVWDBvcTMrd1B0cWRWTVFBNDhmN3VDV0E2K2ZoMno0dWdUQTdSZXNDTnJi?=
 =?utf-8?B?dE00NzBDUktZMmRYc2YwaXRYMnFWWjliSUU0NXN0UDRkcUFGZ2VpR0hPZmE0?=
 =?utf-8?B?dTV1QXBodG9WK1BKUllYaFFnNGtnKzRGbG9sd0dieUxoOWxzSkZBazNjdFgx?=
 =?utf-8?B?L3Z2Z0xyMlMxdGphSFFWWWtzakF5VFBLMkd5dmRvKzJDQmRNWHZWUmppdVpa?=
 =?utf-8?B?UWR2UjlJQWZ4SFFKYi9RVkZlYWljZUt1K1JCYmxFRVhPMXk0Z2kvVzFncTBj?=
 =?utf-8?B?WFpxNmd6WXVaUzVNYWVjL0t0U3g4d0FSYWJHa0xZV2xJMkgzazdDdXhvajEr?=
 =?utf-8?B?OHBDNGZtcm04VlNrbzhHdThNVXdxUHF2aW1xRUE5MHZyc2RzUkhsZTRKdVZl?=
 =?utf-8?B?WDN0dG1aOVA4U1ZEZHdaSFY3MHFkV2w2Q2ZmWWd1UFppckpFT1JvNGVtakQ3?=
 =?utf-8?B?eDdGMms4eVQ5Qm0rNE5VSW5rNUpITkE2eDV0VHNNTVVIUVd6UkwwaUtCRmJl?=
 =?utf-8?B?cnMwbEdOZTd2OElacy8vc3RlWTFLejRkUVFxUW9WRjh0WUFzMGNkL28xNTBH?=
 =?utf-8?B?YzY2YSsyM1Yxd2MwVXA1MXlGQlRZUlFFZmJtYWk3bEM2ZHZ3S3Z2M0FrNFZl?=
 =?utf-8?B?Uk56RDh6ZWJtTHhKY0FNV1FGTXgwb1Zka0dyRjd1QWJYdmdwbHlVVE16ZHla?=
 =?utf-8?B?aDMzZHNSdEl4d29OQVZ4bWIyYlhlUWd5YzZXUVkrcGZLb2dXOFA0Y2U3NWRU?=
 =?utf-8?B?WGdZUTVQRlhsTVFIclE4NTF3ckFQb3BEYWlmS3RzRTlDU011cGhpWFRBTXlP?=
 =?utf-8?B?cm50bXN4NTd0ZHV3QTNuWjE1ZXE1dEs5MElnYXNqcWpUOFJmd3h5OWMzKzdO?=
 =?utf-8?B?bmI2N0l1MXpoNzhZZGNIM3l6SXoxcGM3UmNicGg0bVc0NG9LazliUlpPVlZX?=
 =?utf-8?B?dE1MQTdEQ3lzMkUyNGNYc0hmenMyN1VsWTNuQjBaV1JNc3V6S0xwajFDRE5D?=
 =?utf-8?B?ZW1CRGlWTk9WN00weEhjYXBBandsU2pLMUlISmk1ZktVaHNIYS9NSWZSZmNN?=
 =?utf-8?B?bDgzKzUxbHV1NmtvOVRPaklCOHRyR2hSTFJxQnU5eWoyQ0RNMUdPQ09iOE43?=
 =?utf-8?B?RlZacGZvcko3S3QxLy9DUU51TTJoaXI5Z3VGenZJUFFHcHZBa3F0aDdySzA5?=
 =?utf-8?B?b3Zxa2ZtZndTSmlud3g4NzVpTUJsbkl4aC9EZm4zUDJaT294TDc3WjlnaGd6?=
 =?utf-8?B?TEZGYkdHTEtqaUxYb0pHWnpScksyLzJubHlNQ0ZjRXNOdU15YmJZRlJDaVRC?=
 =?utf-8?B?YzM3enYxM1RtNGpHV1c1cHZJbllId3VlaGtyQjVLbHdhYU9wVHhsK1k5QWc0?=
 =?utf-8?B?SWE2RjJibDRYb0FWUUFNYnJHcWV4ZnlhQWlBN0pYQ29jQ3VGSTlYdUNhb2lE?=
 =?utf-8?B?SWprSjJWWUloT0I5dFE4NGhiaGFOVUVVR2FLYlBpR1kvNnBoMXRyK1VtaW1S?=
 =?utf-8?B?MEZYQWlRK2lkTUdPc21pMjBvL1NBVDZuQnl2TCsyZEtxWkF0SFk4TGswNDRT?=
 =?utf-8?B?b1A0azhnVzUwTE9uZW1zMXJDamVlT01wOFN0V0ZUYnFRQk1GN25PdGdwRmRR?=
 =?utf-8?B?c3hCelc2Z0w1VlY5UmpoTE5vSVgyOTdKQW1pS05ZVXREbzBSdXQ0QjJTT2ZU?=
 =?utf-8?B?RGFGbFNjSk1kQiszTmZIM3VIMzVmZXBKZXVXQ1ZaYVdyYkVoUDk2eHFpQjJ3?=
 =?utf-8?B?KzltQmxHMnlXRHRheHpOWGE5bVVWM09yc1FpcFdaUGsxaXdBY2tjbS9Zc2o3?=
 =?utf-8?B?amZFdm8rV05mYm1JMlNxYzFMYXEvdWk5cEJ2QU5QVW9BcXlSakt5UTlBUVJ3?=
 =?utf-8?B?TDVOZXl3dzg5VGZYMkd2dktnNzByK3BnVmRJa0NEczBNaCtOS01tNytUdGM1?=
 =?utf-8?Q?7pXsg70WS84nHuNMz8UbrFvnO?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	mk2l8yVlhcfqkVGjbl3agmcVrwT3Oz5t4hZZfn/AL0muNy1HgTBp+c7wxQOFY3U2la/erV2NkhxNaqEj700lwUFqWSwy+xlb+6zjX2Mh8GJcnKkkFvirROIvu7/7YVIo4PUJCvwUMi3O1oFGElG1t2bGxLPRiHfyXhgjr42CjQNFbYt6VoVD02Psj/npo3d7W1UDsKzVjIULUC9+o/NVpjxmviU3KJPFEOcTgK5oMlXlTT3QToTFfMma0bXJE7+jpky5N1ZqLJbwTDg7BJiag4XCmP1w9mrmLjRkXUDpobk6ar0Sty6vaScr+q/i2WD5Y3uc38rX5RHZrvDNhA1gotxKIXQvQnQXw33CBCCbOhlK/y3fzbYBnS3MtVBcPakE2u5qNZeBhXWUA0sMkWq5itaT3BeNHCRf2mCcJi1blENn8droRIbbZ0z6Yt7yq+Ieb2T3cYadebDCWjJXzGAQ2WJa3UWJ+A8KONXIm41IdJELlLoMeOIMJTRHyqfep+7+lazXLLq3KMPE+sfb/0c51eWDtxOLeUhJgmS1BnS8ZPxKTzNK9DNsQ7/ppBCdQxQGkinsoxaqv0+ySJ9ytrtto0Tp6HhSaErITlGleHUCOZE=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: af2f6d18-ad64-47ac-96f2-08ddfba194ad
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2025 19:35:56.2442
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C/tnHnPR2d1sAue7EdaLKpXiRSx35IxYJbHcLzu5PjAbYBGYFnKwuWn3YZKfdn+FZA+N7Bc4TDWzJ9DKnEwrsA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF5B5767B72
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_06,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 adultscore=0
 bulkscore=0 phishscore=0 suspectscore=0 spamscore=0 mlxscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2508110000 definitions=main-2509240171
X-Authority-Analysis: v=2.4 cv=C5XpyRP+ c=1 sm=1 tr=0 ts=68d44823 b=1 cx=c_pps
 a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=gJAts9LzvbAACuw7y8gA:9
 a=QEXdDO2ut3YA:10 cc=ntf awl=host:12090
X-Proofpoint-GUID: _IUxH6hL0InhiyxyLg5PYOdXlC2ZQiq8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAxNiBTYWx0ZWRfX3nPiZ9CtBTot
 jpLL7dwb7WAs6hsbu7gF4ri72hgykgvJ6Qc5uE8V12/HNSgXYrtHTmu24104iXsYJhqFRBRou8U
 RxC1UTS2Im3dp9CM1DilW7WM2u5xTdypCsvyTDLL5NImbVSli0YkASIgFHpFF8OI08dkXxhjbvw
 iBxRQySUAdwB30F/IlUMxBx5HWMJuInHDwZPya88S1zhedlBmFG+5irf2hoj4eUWJc9SbZk0Hej
 zAP0atqcmCtll3N+7FgZGNOFBEsEj/VBLZ9yzf5ICDtLkqw8GEuOV8Anv2cb7BPokdnWK7+zoJE
 wwGB2xPVoAG97m6HtsYc/8Px2sFSFEC6bEKb+1WQnlNF9bn1fRuMZrV0tjGuuaca158APTP4AUK
 Rr8JbL75XlFASOMH/7cV35V/8OkV+Q==
X-Proofpoint-ORIG-GUID: _IUxH6hL0InhiyxyLg5PYOdXlC2ZQiq8

Reviewed-by: Eugene Loh <eugene.loh@oracle.com>

On 9/23/25 21:48, Kris Van Hees via DTrace-devel wrote:
> The "and %r0, 0xffffffff' instruction does not actually mask off the
> lower 32 bits as one would expect because 0xffffffff is interpreted as
> -1 and then sign-extended to a 64-bit value, i.e. keeping all bits.
>
> The "mov32 %r0, %r0" instruction does correctly mask off the lower 32
> bits because it forced the value in %r0 to be a 32-bit value.
>
> Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
> ---
>   include/bpf_asm.h | 11 +++++++++++
>   libdtrace/dt_cg.c |  3 ++-
>   2 files changed, 13 insertions(+), 1 deletion(-)
>
> diff --git a/include/bpf_asm.h b/include/bpf_asm.h
> index 152d2312..63987e01 100644
> --- a/include/bpf_asm.h
> +++ b/include/bpf_asm.h
> @@ -36,6 +36,15 @@
>   		.imm = 0						\
>   	})
>   
> +#define BPF_ALU32_REG(op, dst, src)					\
> +	((struct bpf_insn) {						\
> +		.code = BPF_ALU | (op) | BPF_X,				\
> +		.dst_reg = (dst),					\
> +		.src_reg = (src),					\
> +		.off = 0,						\
> +		.imm = 0						\
> +	})
> +
>   #define BPF_END_REG(sz, dst, dir)					\
>   	((struct bpf_insn) {						\
>   		.code = BPF_ALU | BPF_END | (dir),			\
> @@ -68,6 +77,8 @@
>   #define BPF_MOV_REG(dst, src)	BPF_ALU64_REG(BPF_MOV, dst, src)
>   #define BPF_MOV_IMM(dst, val)	BPF_ALU64_IMM(BPF_MOV, dst, val)
>   
> +#define BPF_MOV32_REG(dst, src)	BPF_ALU32_REG(BPF_MOV, dst, src)
> +
>   #define BPF_LOAD(sz, dst, src, ofs)					\
>   	((struct bpf_insn) {						\
>   		.code = BPF_LDX | BPF_MEM | (sz),			\
> diff --git a/libdtrace/dt_cg.c b/libdtrace/dt_cg.c
> index a8f2c9d2..28b7e7c4 100644
> --- a/libdtrace/dt_cg.c
> +++ b/libdtrace/dt_cg.c
> @@ -2757,7 +2757,8 @@ dt_cg_act_stack_sub(dt_pcb_t *pcb, dt_node_t *dnp, int reg, int off, dtrace_actk
>   		dt_regset_xalloc(drp, BPF_REG_0);
>   		emit(dlp,  BPF_CALL_HELPER(BPF_FUNC_get_current_pid_tgid));
>   		dt_regset_free_args(drp);
> -		emit(dlp,  BPF_ALU64_IMM(BPF_AND, BPF_REG_0, 0xffffffff));
> +		/* mov32 %r0, %r0 effectively masks the lower 32 bits. */
> +		emit(dlp,  BPF_MOV32_REG(BPF_REG_0, BPF_REG_0));
>   		emit(dlp,  BPF_STORE(BPF_DW, reg, off, BPF_REG_0));
>   		dt_regset_free(drp, BPF_REG_0);
>   	}
