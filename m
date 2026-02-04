Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28A20309F09
	for <dtrace@lists.linux.dev>; Wed,  4 Feb 2026 06:25:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770186310; cv=fail; b=StbjLoAvXgmjMttFv+rsP0QGcfmV9bHwCyhdN8BFc72RnppQt+1ZjodOp4PXWTEDpAXAQn8RmuA79WeA1PyYgwHk2t/rh2XOpcKPupsDg/w/XnVmoKRPJuJmBo3As6TCxer/Rq7QFTlRKRcSDcVUfUYcjGYPIrp2l1lXxL9i02o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770186310; c=relaxed/simple;
	bh=EtQ69gCUPkjnBMLhMBmlRHiyJKh2uUDHe28L+pU/Ysc=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=ReXcahMds78L92FqLlRdbGpK2IiyGmoUVH52/xpkeU82kycvMujENQ/yvHnFJu8/CLt7o16B/4CnEXzjcJpAO6m2UfZKcQjHEsR/xn5Vd4EpOZON9RS8gO0+YMlnuc+idskr4orOPQnA1LQRTb6NuBiJdn5ZVgzcW5DHYcQsw48=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=C3pcczRP; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=H7i9f9Sd; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="C3pcczRP";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="H7i9f9Sd"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 613IuHcI4161527
	for <dtrace@lists.linux.dev>; Wed, 4 Feb 2026 06:25:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=qEVfPIaaxYrK2jXer9d4nMSLpo4iSYfMgBFj2qjz6Io=; b=
	C3pcczRPfO/B6rweetPRcoPiSWQFceYJ4tzMqFZtHHxjwBkB86a5gWh0/gfcu0C6
	ZZFttD2CCTHhIPza/y4SsO8jxshO7c6XdF2vocNzyckAAbsE6WkVY2fM3qcA1f7d
	vET/SiLYt+9kTNuhqI8Qaf4GcTNn4lPWSGiQfE12/awEClgVIcGIygO9EWseeglF
	VqZy38UH3gLBpVK8g68hNHWmEH5U7haFvDN+qtM45o5NxY59IA2gxOfCG1E8zZU9
	GTQIsYjG4W7vj7b9tJjGTlbBJvr6Hf35oeus5lhLFwQEMUAlUW49jjpU+v8VJWhm
	n5RKQ8i2fdrcXHVSgIgs8Q==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4c3j8uhaa9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 04 Feb 2026 06:25:09 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 6144pmw8025884
	for <dtrace@lists.linux.dev>; Wed, 4 Feb 2026 06:25:07 GMT
Received: from sn4pr2101cu001.outbound.protection.outlook.com (mail-southcentralusazon11012003.outbound.protection.outlook.com [40.93.195.3])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4c2579mb0a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 04 Feb 2026 06:25:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ciSl+D33YMxzni7hUZxSXiPgpdSxkVOYHVa1fRRLOz950NGudGoNLETbw0TlWMSfLEAU1UXt6aJieQ/kGtsa6vQhTis/8w/AUwYLhn2j23JuGheq7YdEU6UMOu/yFI6XLx2HDnZRqVhhpFcXrzCfODhzdLdmOjitB0O2blokibPOkaWwNtoguds84xn8D2OdqeQw+0EXkBBH3OuvHEyJeBq0wVKkqzP4ZUyXMZgM2avOI4YLpQBp25sx1BYosAdzJSqyqyeRKITqeDVXgHRZj+d+EnpQBoT7FsE4BMCrmjJoDZg5mpvi/4R+bhn2N6HtX9CJwKqzjbm6ZjJP7E+qIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qEVfPIaaxYrK2jXer9d4nMSLpo4iSYfMgBFj2qjz6Io=;
 b=sXs2+rWxRmDRlReFq7SCv67Bx59+8z8d1TtE7Mqt4Sr81UFkB1NrsglcNuY6E4uydA/RcKhgDTdl92nwPGlKfRY04S3r7oD00RTilDEoeOPOG6t1GVHYMquj5814QUOT7u86y67JoC7AxqFPiptuyPxd3CZQkp7zaj6ljIa4mTlq0PtPZbhS2lcJ08nuogpyb0cJWcGPJoCDI8B29dQCuLg7t9imewVbfEuqFxfCXBA/GRqaQQT84NcA3rGwwv66jaBB/Pgs7bMEd0SI/s0JHfyXhMtkXwzojPWDFgllETRAvG7o2meMxFjyDMn1M07i5D8B8PdE0x0CsqOVdYGMSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qEVfPIaaxYrK2jXer9d4nMSLpo4iSYfMgBFj2qjz6Io=;
 b=H7i9f9SdaJrxWRE8mH05xyv5FApF43el3zjvVOcH8jMefZqAhntIIkZ7AeUtN4IYAYO4LupQMmhYAldLO7sow/mMmzNIYa0rONguG76DRo5KauEMxvZNuMHyfRbYy9mj1fg3cBKUM8u/MPGDjI3V+TLL5ZOaLJSrp4d6QSe5bh8=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by SJ2PR10MB7598.namprd10.prod.outlook.com (2603:10b6:a03:540::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Wed, 4 Feb
 2026 06:25:05 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b%6]) with mapi id 15.20.9587.010; Wed, 4 Feb 2026
 06:25:05 +0000
Message-ID: <e995f8d8-205e-769d-1f4b-a78f448156da@oracle.com>
Date: Wed, 4 Feb 2026 01:25:03 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v2] usdt, stapsdt: fix argument handling for
 multi-location probes
Content-Language: en-US
To: Kris Van Hees <kris.van.hees@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
References: <DS0PR10MB7522F828BE6550D1851B3CEFC298A@DS0PR10MB7522.namprd10.prod.outlook.com>
From: Eugene Loh <eugene.loh@oracle.com>
In-Reply-To: <DS0PR10MB7522F828BE6550D1851B3CEFC298A@DS0PR10MB7522.namprd10.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PH7P221CA0082.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:510:328::21) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|SJ2PR10MB7598:EE_
X-MS-Office365-Filtering-Correlation-Id: fd0b4db6-a2bd-40dc-612e-08de63b622a2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|7142099003|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SFZlVDl6em8wRjhEYTlFZjVSall1WXBOb241eEd6eVN6dHhrTlh5QWNadnJU?=
 =?utf-8?B?dFJPQlFOMm4xRklmUGRtZEFWamMyNVV2WEJUSEFoWkxoZHlHd2FSK0F0T0lY?=
 =?utf-8?B?MnZVRnJiZ1lzR2R6NXFLanN2QVdlZXYzbEs2KzZyZGgvcjVwMUZzZTd4dS9C?=
 =?utf-8?B?ekFObmMvcmhXa3EzeTdKMEFBZDdQNTFwYzhRUE1hMk1PakI5RzV0TTdDdnBn?=
 =?utf-8?B?M0lwZGRlbllRcVM0SGF1UXpGdXh1LzVzOE9rQ2krWW9OUWZLV01WaklSaW1o?=
 =?utf-8?B?RzNoajNmeElBb1lIbm9zS0xIYndOVHpqM0JlOEVVRUtiekdwd01GQU1IRE5o?=
 =?utf-8?B?ZmZLTUVYY0hsS2MreUZTR1dxWFNFakg3OWducEJlRGhVdlcydTU4RWNNRjAz?=
 =?utf-8?B?ekp4SHJZb09CazRseU1xMWlpZ0xGbUJPMWtZY2dPa1RaYmVwZkQ5OGZoTUpy?=
 =?utf-8?B?RmdmNW5jMU9vcjVLZFplS0ZabkRhWm1LVCtyU3d4aDl2dVNJM2c1dW8vZFIw?=
 =?utf-8?B?TWNqQS9Sd0tYQ3lBMlVnZEFKNWxTNG9DSkFFNkp3bVc0YXVLUUJhdFErMGZM?=
 =?utf-8?B?aDI5dThuTEFFbVkvMFRwV3VtV2gvbU5qWWErZzIvNGNHOG0vc0t6K09xZ2JF?=
 =?utf-8?B?N1Y0bDEzQTU4dWpBMURMSUdYM2dTM2tVek9FMGVpeHhOeW5hVnhQS211Zmtr?=
 =?utf-8?B?VlFJSXRoZkJWY3ZKVkE0NlNNc1VwRzdZbmNTay9vUVFGbE9zY25NdlhqNi9D?=
 =?utf-8?B?eGxZUEI0ZHUzNUpMNzY2cHB0aHJMVHNjckROUzRpYTY4bjkweGxLRU5JSG45?=
 =?utf-8?B?c2RoUWxteHc5a0dscThlY3BxNnNweVFxd2EzN2tTZ1gyTHcxbGJlRWo1cUx4?=
 =?utf-8?B?V3FHNklqZ1JYVUN6NHg4NVlPaWRDeHNhSTVwcitaTkpYeTFtdFdGVFNkaGR6?=
 =?utf-8?B?MDI2NDZMcWFMS3MwbHBBTVF6UjhjbUlnK05QYjMrdnVzb1Zoa3dlUDRYWW1w?=
 =?utf-8?B?MFZYdDI5Zm91bG5oRDArTE9XSzFUMXNrM1VhR0NpZGdNYlBPSXdpUG1QQ0E0?=
 =?utf-8?B?a3B2MlpiRlZUa05Pa0lBeEQyWUZxUG1ZREZnWkprcGdNaDMwZ0hOSWdla0tR?=
 =?utf-8?B?di9uM3BuWTJMVkZ0WHc0bndVTHBWbHRqL1crRTlweThBODNuY2dOeDNDVXRh?=
 =?utf-8?B?V2t1ckJpVFFyTlZRMnExckVET2tBeS9yN3FBTGxBM25SaXNqRG5FazdBbnJa?=
 =?utf-8?B?dS8rdkNlbjFUSE16VnpNZDI2WlpudS9UdWdKWWJEREc3WGRVazdQdDZNWnlZ?=
 =?utf-8?B?WXhLTDJWb3BzYk0vWWJlVkRrOFBKWmRtQlU0aVNGQlhWVDNMUktGNHhVcDcx?=
 =?utf-8?B?YVl3Q0tDTTFLK1k5b2hxaGxsRjdCY0NvNHk3dU9McUltc29ETE9HTmVhTkpF?=
 =?utf-8?B?SWY0ZlQyb2d4bjUzSmtXTDI4YXcrUmxpZzVaakdsd2djeVFHeWI2blc3Rnkv?=
 =?utf-8?B?YW5HcFhFTWpMNHc3WU9IZHkvWnBZNHg1ZEtvT2FsLy9vRW1hK1VGNmhuOGhE?=
 =?utf-8?B?N09ITWtLUmxwQUxvcHRmczR3YWlNbld1c1BsZWZZRzBBUWJXT2xKYXFneldD?=
 =?utf-8?B?VjNoWmVhRURLZUhRcFhaVTJwT2hKR1NQOFVtNnFYSkJmNy9rUEVoVHdaQ2V6?=
 =?utf-8?B?dmFTdFQvNlhFVWgzVDVWY3hvYzFUSXdDb2xHblp6OFhiR21OdTV6UGppai94?=
 =?utf-8?B?Q0tLdWNTWkpQWFloL0IvWkZvTmlnbmtQYkQvSEh6OVhidmZaSkVleXYxd0t3?=
 =?utf-8?B?YnllM1BjVUF3TS93R3N4SWIzcVBBMW9sUkNpNFFBNE16NTlNQTVrZkFacEVB?=
 =?utf-8?B?SU10SW54S2lua0lxREwxVWtOUTFDWHBwME9jaEc5WWRrY0YzZEhCKzhBWGJK?=
 =?utf-8?B?T0dGdEJQQjNDMTZaaHRnT2dSMFM2cEVyY25iMEVpRDBBZFh5TGQ4b3J5NmdC?=
 =?utf-8?B?dEs5VHdSZEdTZVRhOGdKVGUwaFc4dnVmaWxKV1JhYjZtRjU0c2dId2E0VlJl?=
 =?utf-8?B?SmJ4QWhndXJrQ081Z1NJV1RlQ3BBVEpHczVVNGNReWtkSjdwQ1U2Y1pWWU1O?=
 =?utf-8?Q?ymAgLbNkbCmScL6qh4JPXDVeI?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7142099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ay9kQ0ZRNXNPVHg1OXd3czJnTUZSdW0rMUdBc204T3R4VFNGc1JyMmdnei9k?=
 =?utf-8?B?NEhreFJybHF1ejd6Wldta3pQZE9aV2ZucHdZSjQ0WWFwWk9jVkhFSEh0ZHNq?=
 =?utf-8?B?a01HY1YzWElJRjY2OXBGaEJDdFJTaC92Q1NWTkV5Sjh2WWJTM1VlaXl3ZlFY?=
 =?utf-8?B?c1NZM3ZQNkJ4bjVjU3RXdmp2RGg4a09NYk80dm1yaHVGeVBPRFM2aWNWY2xY?=
 =?utf-8?B?UzJQV2VBMlpDSzU1bjRiZHplWlhBcXI4bDBtQnc2QTB2S2t0KzJ5ckd1YUhi?=
 =?utf-8?B?aHlaUVVUc0MrMXdmREp2b3pHNmdtVERYNnFsSFFhUGZWeGVqektVbE0vMkxQ?=
 =?utf-8?B?VkRuMTlnc1lka2pTR0oxbS8rUDl4YThNRnJNSVNhUmhQRmFqU25qVlErT3R3?=
 =?utf-8?B?WThjUGQ3bjV3TjdqMU1yUGd4R2ZBUis4VE0wRk9mZXp1U1lVUDVLU1hiNVRK?=
 =?utf-8?B?eGQ0L011RStLdGdPcU5hS043S3JpTG55UElEbTNCVGR0SG92VmlsR2NFNzJC?=
 =?utf-8?B?SkZvQXB3dXZtTlhrNElUY2hOVDVlekd1YTYxdGVtTWNRTkxnR3kwaHd4UGl3?=
 =?utf-8?B?TDhud0VJMWlaOWRvZmhLQ1dEQnFnZHdjTlU4Q0NoYnVBdjUrQVByRmcrWmh3?=
 =?utf-8?B?N2tTd1liWlFxdDlkZVJ4UTJqb3hIZ1RmbWRxcWc5NDFHdkxhdjFrODVjSFRp?=
 =?utf-8?B?NitzTitxSnE3SXhUb3FPOVpXcm10eUpjbFFqK3dxTWZuZlJsb2g2eHRKWS9k?=
 =?utf-8?B?eHhjYWk4aXd3WkNGbzZpR0RTUkxRdHFheHVEaDRkckJCNEUyaEVTbmhRM0gz?=
 =?utf-8?B?OWtNQnJqb1BaVEhTeS9idVJ4NmZYSTBRMVd4Y1J2R2RkNEYvTDk1a1VPZnlL?=
 =?utf-8?B?K2phUm1sK3hXR0VDSmJqT2cxcGFJcm1qTmVnak5Ib1IrNDhuajM0ZDJOQ00y?=
 =?utf-8?B?Y3lmYkhROXhabnBSemJKN1E2N1l1UDh0aUhGWmQvenl4ZHF5OW5OU0FkdFVy?=
 =?utf-8?B?Y1l4UWVldWlRNk5NekZ6MTJhblNzblhpdnhHK0VUbmJEVjcxSnpESjhidElt?=
 =?utf-8?B?T0tlcjdOTFB1ZHAveFpnajdIS0t1NlBMRTYyNnFWRzdHNnpGMmIybVdKek5E?=
 =?utf-8?B?bDVmak1pVXlxRHFiTmNhbnN1dzlrdXVVQUY2WmtVajd3YXVERWk0VlUwZjlr?=
 =?utf-8?B?WTRqSjBHcDl4Y3liMmNjZGRnVElVQWx4bzVBVGR1T0J6dTNjaXVTejBvMGFV?=
 =?utf-8?B?cFBEbFNRRjloMzE1ZUVDM3I0Mm9OOUppVnNlcCtIeUhBd2M4K1gxdTNhYURM?=
 =?utf-8?B?bG5uNzk5bHQ3VjJlT1l3QytMMmRRQXBmQzUxQ3cxT3lBUGRlUFg0eVV1Y2Z6?=
 =?utf-8?B?dXFCRkx5bEh4a3dIcFZTVEVjdVFkaTR6eFc1azdRSWJZQXQrOWlhc1NOWWJG?=
 =?utf-8?B?NGp5ZFR1bk94d0pDZkIxWmxNSzRyRUJKcXB1cS80YlpuTVZDOXQwaVhKcHNw?=
 =?utf-8?B?OEt0YUsyc2R2a09tQzRHaGI2TFcrSGtTZEQ4S0hSM2wwMDFoWU1vZkNudTNa?=
 =?utf-8?B?R1AzdVNvNjVsazA1TTZPQ3k2QkRqdTJsbkxtQ2pXMFJFYWhMenliUmt2OUJk?=
 =?utf-8?B?UzJLSFpKUnNlVmcyNXlMVkxZY2J1S20wRi92eWlqdjJDVjRpOWFDd2E2dU1u?=
 =?utf-8?B?UUlLMlM3Y1krZnhlZDFHYy9BS2VYZlRwSEdpOGFLT0xvanFyRW9IckZvckg5?=
 =?utf-8?B?VFVETWl5YXRTT0x6cWlJUnEzdXFQb1pYb1lxUkFRZ2l2RzdZYlRTVlVld1pX?=
 =?utf-8?B?dHY4bWNQVlYvNTREM25LTld3VGJTUU1aTnRCaEVFNVZKcFFuNElTUWxabWk5?=
 =?utf-8?B?ZTBBYUk5T2trc2hTVit2Y2RXTmpNT3M1ZU9LcEs5Y1M2UStNSjZWQVVqOHFm?=
 =?utf-8?B?QTQzQ21WS2E4Ri91emZSSUFTWEZydkJhbU1kSzZldjBpa1pUQTVuRmR6MUxL?=
 =?utf-8?B?dUtpYlV5SnhMbUx2ZS9lSTRlMFhnaS9CYVoyazZQZitSQUJsTkJaZnY4N0w2?=
 =?utf-8?B?L041MWY5a0FOanI0NkZzTU9HZ0h5M3VUZ3pmOXBodEsvVWxGTVJZNTg2Tmw4?=
 =?utf-8?B?YVZzdG5IalBIaytMbURPZlUwSkRiZ1RwbDl5dXM1M3lNRGhlOTg1ZkhCbU1m?=
 =?utf-8?B?NUxBMGlNRmlhdXQ5REFoLzR6WVZQc1NpMU5jRENwbVdrcjBoN01Ic2swZXRI?=
 =?utf-8?B?M3VxR0ZQdXpQcm9ZaXlUdWZSdjRLUUZha3I4cTBoUUZvNVF2MXJpNUhvYXlN?=
 =?utf-8?B?Z29pR1d1cjdFVCtPWEx1Z3cwMjlEOExRQm5rckdZcGJVa25kWXNWQT09?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	G+pBOOYU10U20pQ+9aElz/e4wFwyfKNjhT0WVnc8PeU3NfIDYYtz++MtybClhGJ1jYqB79mfBhqpNohHwKdGXDcmZOj3B771bVhY/d9VXP+XPyhi4t4sZzZEOAcjY7wElmMiaayR0nGKgSwXNcxxGFDxQCbhHnJYEKMOVK8unAR7RJ41tlD3cGjL4byWcRdcPEjSXr5QqR/jqFul+hi8xNBgMMidINEi9BWuOPQwcoO+6/aAFsYI4eaye4ZFeT77Sr40nBpvSWlikiC5VAk0JDs8jFf8xchdM3xhM06q6XC9t4h5+wQ+yzBNWlRCX4y42y7kGb4BzUZCDtwjz14GFz2ylFDXup8ef7MPSj2j0fAjQNs3CLVfwLPvRco8FB4Ma+cSNqJhya8Pd6j75QcFEvyZz4zEBcaox1yqMS59ojyvUfsse1WDqf6e55WVUcJ/PEbHmxDGNT3DDyEEkv4nKyUcHOqMLHAeQn6Mc5o5wITgTFkAN8B7yWEe2YWA+YAhfhAfp/7jLTaq2aJiV8NXHKdw6EBltpqqD4if8nmj35vp9Yux3lmN99/Hrm+Yk46EQeHxXAvkZtJNj3iDzeRzFBLMgXhjI+rIDDMefi2MpPE=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fd0b4db6-a2bd-40dc-612e-08de63b622a2
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2026 06:25:05.1108
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ST/F++E7TiXGiwQav7nY69JWvJjvjkMFLqIae+9uSUbKMW5hQbxSi0wUKW1mX2LQBEra1a+OIkLClsEnrCue3g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR10MB7598
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-03_07,2026-02-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 mlxscore=0 adultscore=0
 spamscore=0 bulkscore=0 mlxlogscore=999 phishscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2601150000
 definitions=main-2602040045
X-Proofpoint-GUID: eMW4Qk9QGFYyFZ9F0KkCQsaIy5XTo1DZ
X-Proofpoint-ORIG-GUID: eMW4Qk9QGFYyFZ9F0KkCQsaIy5XTo1DZ
X-Authority-Analysis: v=2.4 cv=BJS+bVQG c=1 sm=1 tr=0 ts=6982e645 b=1 cx=c_pps
 a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=yPCof4ZbAAAA:8 a=96qKUll7DfSS2SHURv0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 cc=ntf awl=host:13644
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA0MDA0NSBTYWx0ZWRfX/b8HN28XJbNS
 +o8ev+m0t8/cbDipuzHEIKnV3IfMaA/ELBNeRTPXxuTYssdor8iQ2C7Qaxiy7uo8AKKG1nNi4+z
 FK1DqN/hIi/ETTaSHYQaKFVVxdGbqPQPG46t4d5zBwBfkJvRGP1onzeVoPqmP7mWS3nqqwc6qlj
 /R7jcyTUmxSxUJcB8C1y11Zt2UP3yLAkMtrddtNx/AbYR0Wtf1Thq9Euwt4mLJjRji8AguhrrAD
 RBhYurFtqXc/I9Dca5AkILJaDFptLhyNowRm/XSDYZFKNhw/GLXxr87QGqBNJKkFdipEU/sTaiQ
 D8hUOjDTqMDcwsc8nKarWE8KajV4RtdAb9y3XmDVhPcZRuWaNatBimIH7HnYoRDaadmDkElyJzy
 3dQRLToQbZHjCRr8dTcjVvjpBG+g6pRB5iOYd/gBUr9ZMUnRid0d2PbY4Lz4EZqgXjiWtXBZyvt
 tauMLQQ0DGp2I2uy9Wwbxq5M8rrBefsnNWTg9j+o=

Thanks.  The tests pass on all platforms I tried.

I did want to check something.  The subject line says both usdt and 
stapsdt.  The commit message talks of usdt.  The bug report indicts both 
usdt and stapsdt.

So, there is a problem with stapsdt;  the patch fixes and tests that.  
That much is great.

However, the new multiloc usdt test seems to pass for me even without 
the fix.  So was there a usdt problem?  Is the multiloc usdt test good 
enough to show it?

On 2/3/26 21:06, Kris Van Hees wrote:

> When a USDT probe has multiple call sites in the same function, only one
> of the probe programs retrieves the argument values correctly.  The
> probe argument data is collected for the first underlying probe, and then
> skipped for any subsequent underlying probes.
>
> Since it is not guaranteed that the argument description is identical for
> all underlying probes (although it is almost always that way), we need to
> process the argument description string for each underlying probe.
>
> Orabug: 38922360
> Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
> ---
>   libdtrace/dt_pid.c                            |  9 ++-
>   libdtrace/dt_prov_uprobe.c                    | 10 +--
>   test/unittest/usdt/tst.multiloc.r             |  4 ++
>   test/unittest/usdt/tst.multiloc.sh            | 69 +++++++++++++++++++
>   .../usdt/tst.stapsdt-notes-bug38922360.r      |  4 ++
>   .../usdt/tst.stapsdt-notes-bug38922360.sh     | 54 +++++++++++++++
>   6 files changed, 140 insertions(+), 10 deletions(-)
>   create mode 100644 test/unittest/usdt/tst.multiloc.r
>   create mode 100755 test/unittest/usdt/tst.multiloc.sh
>   create mode 100644 test/unittest/usdt/tst.stapsdt-notes-bug38922360.r
>   create mode 100755 test/unittest/usdt/tst.stapsdt-notes-bug38922360.sh
>
> diff --git a/libdtrace/dt_pid.c b/libdtrace/dt_pid.c
> index 6f93123f..a379a0fe 100644
> --- a/libdtrace/dt_pid.c
> +++ b/libdtrace/dt_pid.c
> @@ -1350,9 +1350,16 @@ dt_stapsdt_parse(dtrace_hdl_t *dtp, dt_proc_t *dpr, dtrace_probedesc_t *pdp,
>   		if (strcmp(pdp->prb, "*") != 0 &&
>   		    (strlen(pdp->prb) > 0 && strcmp(pdp->prb, prbname) != 0))
>   			continue;
> -		if (prb + strlen(prb) + 1 < dbuf + doff + nhdr.n_descsz)
> +		if (prb + strlen(prb) + 1 < dbuf + doff + nhdr.n_descsz) {
> +			char	*p;
> +
>   			psp.pps_sargv = prb + strlen(prb) + 1;
>   
> +			for (p = psp.pps_sargv; (p = strchr(p, '@')) != NULL;
> +			     p++)
> +				psp.pps_nargc++;
> +		}
> +
>   		psp.pps_type = DTPPT_STAPSDT;
>   		psp.pps_prv = prvname;
>   		psp.pps_mod = mod;
> diff --git a/libdtrace/dt_prov_uprobe.c b/libdtrace/dt_prov_uprobe.c
> index 6d1c0f65..e575b072 100644
> --- a/libdtrace/dt_prov_uprobe.c
> +++ b/libdtrace/dt_prov_uprobe.c
> @@ -1659,15 +1659,7 @@ static int probe_info_stap(dtrace_hdl_t *dtp, const dt_probe_t *prp,
>   	if (!upp || upp->sargv == NULL)
>   		goto done;
>   
> -	/* First count the arguments. */
> -	for (p = upp->sargv; p != NULL; argc++) {
> -		p = strchr(p, '@');
> -		if (p++ == NULL)
> -			break;
> -	}
> -
> -	/* Record number of arguments, and allocate descriptors. */
> -	upp->sargc = argc;
> +	argc = upp->sargc;
>   	if (argc == 0)
>   		goto done;
>   
> diff --git a/test/unittest/usdt/tst.multiloc.r b/test/unittest/usdt/tst.multiloc.r
> new file mode 100644
> index 00000000..a0bbc7a8
> --- /dev/null
> +++ b/test/unittest/usdt/tst.multiloc.r
> @@ -0,0 +1,4 @@
> +main
> +test:main:args main
> +test:main:args main
> +
> diff --git a/test/unittest/usdt/tst.multiloc.sh b/test/unittest/usdt/tst.multiloc.sh
> new file mode 100755
> index 00000000..19d5d6c1
> --- /dev/null
> +++ b/test/unittest/usdt/tst.multiloc.sh
> @@ -0,0 +1,69 @@
> +#!/bin/bash
> +#
> +# Oracle Linux DTrace.
> +# Copyright (c) 2026, Oracle and/or its affiliates. All rights reserved.
> +# Licensed under the Universal Permissive License v 1.0 as shown at
> +# http://oss.oracle.com/licenses/upl.
> +
> +# This test covers USDT probes firing from multiple locations in the same
> +# function, verifying that argument data is correct.
> +
> +if [ $# != 1 ]; then
> +	echo expected one argument: '<'dtrace-path'>'
> +	exit 2
> +fi
> +
> +dtrace=$1
> +CFLAGS="-std=gnu89 $test_cppflags"
> +LDFLAGS="$test_ldflags"
> +
> +DIRNAME="$tmpdir/usdt-multiloc.$$.$RANDOM"
> +mkdir -p $DIRNAME
> +cd $DIRNAME
> +
> +cat > test.c <<EOF
> +#include <sys/sdt.h>
> +#include <stdio.h>
> +
> +int
> +main(int argc, char **argv)
> +{
> +	printf("%s\n", __func__);
> +	DTRACE_PROBE1(test_prov, args, __func__);
> +	DTRACE_PROBE1(test_prov, args, __func__);
> +}
> +EOF
> +
> +cat > prov.d <<EOF
> +provider test_prov {
> +	probe args(char *);
> +};
> +EOF
> +
> +${CC} ${CFLAGS} -c test.c
> +if [ $? -ne 0 ]; then
> +	echo "failed to compile test.c" >& 2
> +	exit 1
> +fi
> +$dtrace $dt_flags -G -s prov.d test.o
> +if [ $? -ne 0 ]; then
> +	echo "failed to create DOF" >& 2
> +	exit 1
> +fi
> +${CC} ${LDFLAGS} -o test test.o prov.o
> +if [ $? -ne 0 ]; then
> +	echo "failed to link final executable" >& 2
> +	exit 1
> +fi
> +
> +$dtrace $dt_flags -c './test arg1val' -qs /dev/stdin <<EOF
> +test_prov\$target:::args
> +{
> +	printf("%s:%s:%s %s\n", probemod, probefunc, probename,
> +	       copyinstr(arg0));
> +}
> +
> +EOF
> +status=$?
> +
> +exit $status
> diff --git a/test/unittest/usdt/tst.stapsdt-notes-bug38922360.r b/test/unittest/usdt/tst.stapsdt-notes-bug38922360.r
> new file mode 100644
> index 00000000..a0bbc7a8
> --- /dev/null
> +++ b/test/unittest/usdt/tst.stapsdt-notes-bug38922360.r
> @@ -0,0 +1,4 @@
> +main
> +test:main:args main
> +test:main:args main
> +
> diff --git a/test/unittest/usdt/tst.stapsdt-notes-bug38922360.sh b/test/unittest/usdt/tst.stapsdt-notes-bug38922360.sh
> new file mode 100755
> index 00000000..ea0d6880
> --- /dev/null
> +++ b/test/unittest/usdt/tst.stapsdt-notes-bug38922360.sh
> @@ -0,0 +1,54 @@
> +#!/bin/bash
> +#
> +# Oracle Linux DTrace.
> +# Copyright (c) 2026, Oracle and/or its affiliates. All rights reserved.
> +# Licensed under the Universal Permissive License v 1.0 as shown at
> +# http://oss.oracle.com/licenses/upl.
> +
> +# This test covers stapsdt probes fired by the STAP_PROBEn macros, verifying
> +# that argument data is processed correctly when the same probe is used in
> +# multiple locations.
> +
> +if [ $# != 1 ]; then
> +	echo expected one argument: '<'dtrace-path'>'
> +	exit 2
> +fi
> +
> +dtrace=$1
> +CFLAGS="-std=gnu89 -I${PWD}/test/unittest/usdt $test_cppflags"
> +LDFLAGS="$test_ldflags"
> +
> +DIRNAME="$tmpdir/usdt-notes-bug38922360.$$.$RANDOM"
> +mkdir -p $DIRNAME
> +cd $DIRNAME
> +
> +cat > test.c <<EOF
> +#include <sdt_notes.h>
> +#include <stdio.h>
> +
> +int
> +main(int argc, char **argv)
> +{
> +	printf("%s\n", __func__);
> +	STAP_PROBE1(test_prov, args, __func__);
> +	STAP_PROBE1(test_prov, args, __func__);
> +}
> +EOF
> +
> +${CC} ${CFLAGS} -o test test.c
> +if [ $? -ne 0 ]; then
> +	echo "failed to compile test.c" >& 2
> +	exit 1
> +fi
> +
> +$dtrace -c './test arg1val' -qs /dev/stdin <<EOF
> +test_prov\$target:::args
> +{
> +	printf("%s:%s:%s %s\n", probemod, probefunc, probename,
> +	       copyinstr(arg0));
> +}
> +
> +EOF
> +status=$?
> +
> +exit $status
