Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECAAD211491
	for <dtrace@lists.linux.dev>; Thu, 28 Aug 2025 19:25:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756409156; cv=fail; b=qzzWCC/m6ywGDT9wclHtMVQaCoeErnPSKE79PI5Ui2+y2w5mtlGMfdhv871/DHZ0zUBt36qQVAfrgKNAmUfjQOuz7aDJRfUeHDAHN0tKICKGeJ1fg698K+/Dit3XR9/Qur8Y3VWGUlZu2L+oCz5Etly2Lfz7Qqe02bub25nE9xo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756409156; c=relaxed/simple;
	bh=vltt9PsNR2iCt65+lbaQMeFegN8oEhF8jWnGh54fJ7o=;
	h=Message-ID:Date:Subject:From:To:Cc:References:In-Reply-To:
	 Content-Type:MIME-Version; b=GfYe7D06ILI+O38Hz5+nDJAIRDezXPZMBkkksckgFk0aJZzSPMwaOpwvqVdlHH6F+6U4fSiZnWyKhZC9wCyY+c9DoOo4AhyqMukAqJvbd5UnaeyvrOo31Xr3v5GWElGZrhheVtuhKh2M/xFwOaDToVa0/1h++AePvVhDfgQEdRM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=p3xmGjHu; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=ptzOJX3l; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="p3xmGjHu";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="ptzOJX3l"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57SHMsil006590
	for <dtrace@lists.linux.dev>; Thu, 28 Aug 2025 19:25:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=s7QhedSw1AoIaZu8jL1fk97adyx2hxAQ9qP5V9lFGwU=; b=
	p3xmGjHuDOo/IFDxHDcrxfna66aapkkI3O69vqOC5ZSeQ5SZJvRC8XFwzvu3Ygr6
	k45Wt/u8vGJ9dlh2akrhfBfHYYRXBFdEDpgziABOeSzXCRERKZbCYGdyEJhfqRia
	CEm8qXu9Dzeb1+LURMh+XRuf90optQ21bbICCAcVFh4ll6intq5MbY5so4D1k3Sc
	knb8E0DiQiLJaV+YDc1VayS+/nOyxBW+2xwovZxH8Ns8armH9xDaSypcY/AwRAhH
	c5CwvwccMFvG+CqQrTo/xwcf30aTPzL7rdzVWwaQER6UQYgflZ4+kRiuZPkGSzFI
	16CrHP4hpchekF8FIZKwPA==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 48q42t93nj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 28 Aug 2025 19:25:53 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 57SI05Qk005016
	for <dtrace@lists.linux.dev>; Thu, 28 Aug 2025 19:25:53 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11on2040.outbound.protection.outlook.com [40.107.236.40])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 48qj8cjefy-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 28 Aug 2025 19:25:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w+RzCiMeoT95r6bjzJDEvh7SSWLoaQMcCkf9qYw6mDf+HntFTbxNLdlx/mPjtDMQIoBEALdraOGuxHA2Z6S8zXUVRA0TXig/W1RNkr0SEsFpzICacR4+bZEHtLlpAgZWTcrADZNnvYdRRC9dgXdBGGOOTF6tAiqgiIb+FLfmvRWdUSS0cUP5VkLphgf6Zoh02veC4I3nNNjibQjuJrSvMlRIZxNsJ0y+Y90xehENOZJQNVyCYabSXpJb7p2skAI19pwLRsaolDLtnUz5/K1jJfcebUYB/Gyw5VhgRZqxoOmMawm/LMuNQxLIzw1Beas/lEM9ftU2Pwa2LraQi5rXrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s7QhedSw1AoIaZu8jL1fk97adyx2hxAQ9qP5V9lFGwU=;
 b=vyAy8mq8Z88LYUvXmaB1KhSV/TUW7h/8+d01XuX5pBz72ALDmlYWfr8GdbdiU8DsaF6NphDraGXbjC2WgfcSIukSUf1T6TyBhGm6jII7m/Abwysa+teefi5XNCZsI+LBzbuy4YYx6Qf+kw8jjDRxTt/FElUjviQVtgAtixvLlOXPzTdzu3ciLtMhDxyTWGS/xk+xheTcYhJnlRBvREMusEkzqokrTECQ4g9g6dkD3ApatmdMbyMWGYlI9bg83D+MSzcNk2he1iBuJDRBAN4qmFcD4tpDmyFWE3b2rIEiJMQkx4WMtiImBwZtaQYunIM/0WdLwD+h24GhoXPpxWBJDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s7QhedSw1AoIaZu8jL1fk97adyx2hxAQ9qP5V9lFGwU=;
 b=ptzOJX3lm0POQDKL4SM1kjhn08kMqIewGe2TqB8U/xvguEmTdtDIPpX9TpvEvxRoWYYGWuxueyuKUGG4TEUoIuvKUYyf0lyBDSCEg+zTyGqPmHpJeAPYexBFN6NcE5/zFPftDfSla8Cj8WAZb6bd/+mCYufD8RGqDtEOdo1O+7I=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by DS0PR10MB6152.namprd10.prod.outlook.com (2603:10b6:8:c4::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.19; Thu, 28 Aug
 2025 19:25:43 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%6]) with mapi id 15.20.9073.010; Thu, 28 Aug 2025
 19:25:42 +0000
Message-ID: <b186d562-5dd9-d564-487d-d0e91d78b23a@oracle.com>
Date: Thu, 28 Aug 2025 15:25:39 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [DTrace-devel] [PATCH 1/5] udp: new provider
Content-Language: en-US
From: Eugene Loh <eugene.loh@oracle.com>
To: Alan Maguire <alan.maguire@oracle.com>, dtrace@lists.linux.dev
Cc: dtrace-devel@oss.oracle.com
References: <20250822181629.30972-1-alan.maguire@oracle.com>
 <20250822181629.30972-2-alan.maguire@oracle.com>
 <1fd04dcc-4c22-cf62-c050-19b22b1dfa0e@oracle.com>
In-Reply-To: <1fd04dcc-4c22-cf62-c050-19b22b1dfa0e@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BN9P222CA0004.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:408:10c::9) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|DS0PR10MB6152:EE_
X-MS-Office365-Filtering-Correlation-Id: d2a6c327-8077-4560-6405-08dde668ae01
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZjQrWEpsbGxqS21WbXF4ZlFiOWYzSTlGVnY1V29pUTJvdWkydjVBV2QrdFFp?=
 =?utf-8?B?N05EQUc4bUtlZnVSUGpFZ2VjdHBoUHNqVlN0eVR4aFczanZ0Y29OdENHSVhk?=
 =?utf-8?B?WVZnYWxQaUpQTyswT3ErcG5zVk01clBBM0tjdzhsQTN3Q092OTVmcW1XWDMv?=
 =?utf-8?B?dEJ2SFlobU5UU3k4cnlQcTZoZnBNRCtwSkR2YmxiQmF4bnBVYmVPaklNOHNR?=
 =?utf-8?B?NURFMkVKRXNzSFViVlpKdTc5UTIrVCt3NHEya2duQktjdiswcER4RVV0MldM?=
 =?utf-8?B?c2sxYjQxdFBOMEsxWGdQdk5xakZ2YTdVN2FCU1NqNGRyb0kzRENBazExbnZD?=
 =?utf-8?B?WWJUZnhheWZBcUVlSEFCamZzR2xSUHFWSS9iVk5DODNIcGlBVHNjQ1daTDlx?=
 =?utf-8?B?WCtOR3V5aUtCU2trTk9sSlE4aHRMeFVtc0g0cXZkQnNFdlphUVNXYzNzcXF1?=
 =?utf-8?B?Ly8xVjNEeG9OYlNmT0V6TTdQOWh5N295ZTRaMHdsK09vY2c5SXVMZDc4Z2Vo?=
 =?utf-8?B?OW4xY0NxWFlnaDlXbWR1NEhtVm83VTk2UGd2bURSekNPVm8vUW94eTRGMk11?=
 =?utf-8?B?TEVKbTJWZmV5L0hIVGJLbDBJRC9tVW9SazlYTy9XSHdtaWYrLzlBdnh6Skxn?=
 =?utf-8?B?OHEwVmVmTDVEaTZqc2xCcmJmbVBzSFdJckxheEpLMTgremozMzF4ZW5wbnov?=
 =?utf-8?B?L2U3aCtzRGZnQzNlMHA4MHlLZERsbDQ0c3ZEakZoVm1zdGdBVGxhOTVFamFP?=
 =?utf-8?B?d2tUbk9IaEFKaVdrOWdOWEJmakVBWFdqTk11YXJkL0hXMzJsRXZJaVVoM0FE?=
 =?utf-8?B?WFIxY1VPbHZqNVdzTDNiZ0FqTUQzbHlzUU8wMzdpcVpkbGQydjI0VWtmbDVj?=
 =?utf-8?B?dm5kVVp5SFVNZGQvQ0NRY0NUVFFZcTZ1UW40MW4xY0xOSk5ueVhNRjRzN0U5?=
 =?utf-8?B?SExJY0V4Yit0UUJqS0VrUmZSbENOMTBIQ2g5WFV0OGZ5V3kzdFhmWHpvOTE3?=
 =?utf-8?B?bjVIOEFWVER2WmVoUklzRndLaEZ5MzNmNHZuemkyMFlTNFlvTXdFdCtpeit2?=
 =?utf-8?B?SmNzdXVCbXlVcGdqd2NpVmNLZFdUaHJlNllXSEFoYXZVRzgvcGN3Tk1nTlB2?=
 =?utf-8?B?UTlxdmNIOVFUaFQ0eGRTNjVweHlkTDIrL2czdkpKNytDSUUyVnFjNUhzd1pu?=
 =?utf-8?B?L0pHUzZTTUhLR25CYmRMZGFvS0pSc0kxdlA3b29YZm5OdXdTUG9xYnFDSlZD?=
 =?utf-8?B?NmJJWHkxMFFyeCt3Z0FkdklSRlpiSW5rc0RjRWptUjZFVFprWCtFV1lkakdk?=
 =?utf-8?B?c1BRRTlrZHg2Q0RUaytIWTA4VGpSeVBncUdlcDlhWWFlbWF3bVMvMktPKzBC?=
 =?utf-8?B?bnVBY09pVTAwNHhBMXE1Y1Q2aFVVM1VvUWo5Tmc5RmxkeGNIejBkWXh5bFJt?=
 =?utf-8?B?bGwxbDNhb2lCY3d2RmdzYlYvVUZnSmNUQWFqUzAwNzJnKzlHUnBBQjY2YlAx?=
 =?utf-8?B?OTBHVlIwOFlJekR4aFNZbXhvOHlvSDg0QnZ1VjExNHpjSFh0Wld3bkFWZndr?=
 =?utf-8?B?NDJSanZjaTdtejUzMWx6VjBZNWl2NlRqTDFSMlpYaldPSDUyV1N2d0VVWkFK?=
 =?utf-8?B?V3hxb2VSZ1BCK2lHSlJWbzhSSWVZdjdUOG56NXRhbkx0Zk9yb3A4bUJHUi9I?=
 =?utf-8?B?QWlLOVRSN3ZGb05sWXE1V0daYkJMWW1UaXFTTUhRKzFOMGk5ZlM5S0hRcktL?=
 =?utf-8?B?Ly85cXIxMUtQTVg5RUJ5K3BIdlhXMWFWcDhEd3R6V0NNTnpmVW92L1hvM1g4?=
 =?utf-8?B?UXZXVFFWdll2YWNiVXBQMXoyWisvM0Z0Nk1yaEJOL0NsQUZIOWdqcHVWVHVn?=
 =?utf-8?B?dFpMZEdydm0rQVpoWWRUQjVjV2wzZ2R1dUd0T2N2dmQvMlE9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZUVUSnhNbmp6VjZ3dlp2SlFZVHl3N2g1OGFtNmZKSVgvZm1hSEc5OGxEb1lD?=
 =?utf-8?B?NXZnMDE3T1NNNWJwbGJYejltWUUxYi9mNTU4aVVmMDNuaXlSeHpiY2RQbVpC?=
 =?utf-8?B?eW5yT0NaUDYwYi9HVUxHV1Q2MUhWblI3QjF0NmF2SEpUbklxcXNkTm5FUXk4?=
 =?utf-8?B?cWo0UkVWb1RodmE0TG1sT1J1RVdRMUp5Vng3UzlWakdrVzRBcHRxS1hyVitF?=
 =?utf-8?B?YU13TGNBUmJ3M3pneXI1aHRMNVZXSXNncFNDM2dWak11VUUwTUtjS3BEVVlX?=
 =?utf-8?B?RndJd3NLZ1d4WVhxQUE0YUNmYzBrcjdrREk4ZStNczEzREIwUDFnVmFlNC9B?=
 =?utf-8?B?WnZ3TGU1Z25sUTd3STE0Nkg5dHVOWlM5VjY2RXNBVDZNNTB5ZVJlRFZFaXJX?=
 =?utf-8?B?NHpiT1Z0YWxSeTBqVG84Mkxma2piNGdOOWFQSkR3dUF6bzJSRWZMMDNna04y?=
 =?utf-8?B?NUNEY08wbVZqeGpiNkE5MXJreVRZaFVmc2J0RGZFUE94UWFnSTl0QUw0MkNW?=
 =?utf-8?B?SGZxTTRXa3REc3paejQvYUQ4b0Vmbkw5WS85NC85cDkrYnVaQnNlVDZsZEwx?=
 =?utf-8?B?dnVWRmdhZnpGbVlNY3MzaGE4dDBEQnpDYi95R0E0MmFteUFUMjg0MzlGN203?=
 =?utf-8?B?aVBtYVZmc3dkQ0FJS3M0ZTFxcGhBLzBVZTZYWGhQVDVtb3hMSU8rRVBVS3ZH?=
 =?utf-8?B?ZDA1RWZmaEl1YmZrL2JWLzNBdURheThNZHBZLy92S2ZxejgzV0drNWFvS0tP?=
 =?utf-8?B?OFZXZW1ocWVXRDZxOEZZZWdKbUViODJwWk50VFZCWGh5U2U5STBaUGRwU2hu?=
 =?utf-8?B?RnI4N3Y3Y0cyWWZFRVN5REl1a28xV215ZTdULzlQa0VBbXpOTHl3OHAyZ29J?=
 =?utf-8?B?Y1VBNG5HZ01TMncyakRQenJ5OXd5MTNBa3RZTkxaYTllSjc5OFljU1I0dEkw?=
 =?utf-8?B?TVZibFVmUUR4WENxT1ZwSyt1Q1F1cWZPT1B3WGthMEV4OEE5enpwa3FldCtS?=
 =?utf-8?B?UkVnL1BMSmlCdjRlMnp2eTd6aFpSMkkzSUh3QVc4N2Evd0pKLzhUMytLa1JZ?=
 =?utf-8?B?ZkxZUFhRNytjT3E3UGg2YVBMNll1cWxvWmVYSUk2OEFxUlhoc2lBM1V4Qllz?=
 =?utf-8?B?UTVNQnVhb3BqaTBnRkRFUnRIaE9GeGJ5NlFwRVpweTNiSmo3OVBtVTNVM2tS?=
 =?utf-8?B?VkZRUVBlcyttem82c0NxSUJBNXN4WnltVStzVDNrVkgyY294aDQrYnBvWXor?=
 =?utf-8?B?NUozS2U0ckxSYUhqdjRjaFRSQUpOYXhpZzE3VzBpNkZUZysrU2xKblZaUGky?=
 =?utf-8?B?VGgySjVEdXVhWkZOZ0JWWUhUMDB5WjQrTVBVWkVjUUY1SGVaOWw0ZGJYbEc5?=
 =?utf-8?B?aEt2VGswVjEzUnlhSURZWFNURFBHQU05SEkxZVQ5WEJOeU01Z1BYNG1QSlNz?=
 =?utf-8?B?UUpSNTVoWnZmcUMxcW15ZGJvcmNXS2lXOGdSUVVTUU95Wk5veS9uWHFnQ1VY?=
 =?utf-8?B?b0tGWDg0YnpraTU2OGdtK1R5WEpzWUdLYnhFSGQxWHZ3RU5HOWs1SFRMOHY3?=
 =?utf-8?B?dmZkbUJzTmVWcGtEc1ptQkY0aHF1ck5WWlZxdHJMNkdWRGtCTFIvWVVsOVVJ?=
 =?utf-8?B?SEpoOVJLb2xNZkdCTWRSWFFFb013L1c1UnhLUXhmZ1hmamxJTHU2QjZwM2Q4?=
 =?utf-8?B?TGQxdU4yK3J3SlhjTGVBYVhMSVcyUjRvbmxJa0FiSVQyMWlrSDVmVnc4di9P?=
 =?utf-8?B?WWRmcUhjWGE1d1oxMUR1K1dZYjFoeFdwVGVldGRTU2Fwb29OMEh4c3Q2OE1V?=
 =?utf-8?B?dGYySEsweFdkbmZtSzVRQllRWWpxRjlGaGROMWRRYmpzZEtIR1lXdTNoWXp2?=
 =?utf-8?B?UnRIZTBua1hKV0VaMEkwN2xLQkx2V0VnTGE2YmtabHB2M3dERzRXeURPMkQz?=
 =?utf-8?B?WGRKYlNyWWM5bjVadHpPQmk2YUIrSGJ0ZC9VQjN2Rnltb01iTmlWWHpyT2tr?=
 =?utf-8?B?YjlkRi91NkVWcjBNellkTVpaQVZtUG9tK1Z1NTVVdUhuK2t2T2RyTExybDB1?=
 =?utf-8?B?Mm9OYmJ3SVd4YTFGb3Q1OFdqS3g1L0FkS25IMTVQcWVVQzNURmRid1ltcExy?=
 =?utf-8?Q?uP4ClSvyElCehh4McZu32Ahhb?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	HAaWqkjl0bQeOpPzfMWywfjpd9PdTVbyC9eHUzZfSCI3KngKKX5/7EgzeIW+FzEeDdXWv4yjV6HyMomNmIRl8Xo7G2C8zv3MblCkfCbwRXk/kqbGLNe701l430LbURmOriCxirE3M1NZ7NGQT8ADDsZ4wMyeHwTNDWQodYYaUduROmkzRNGQigj2nYWbvp5MMk4/w0oU1MkBeKGjJoM8UScTAgP1SJg3R7ELQ6AzexAtfE2rytw62uKcnpYMuh3uIGIai3HtopicK4VaRYyIU29UuNE339GEYNCgPdWfyPPGVFz7iP80vuEmFFicK+pkAldqkRzkPcLY238iYutf5M3/iahTcTSK6eyY7q0E0l3ftb3eykA6V3CxzMf50+YjTGdWSBn4eIvbT4rH2iACYmkhQyPEbJqwLB8fLAiK12Hqys3yLwvpNVovaYjIDZiubemQwYYiqKpi66edyoHUrMSpxmXAOoIoY1+9txzhwo70h1cofmxn78ukTq2CcmqkEXSvTN1AzA86vlNVlVDL/CMiM276tY97eWDdlgnUUFpiUaPbDrelI34ii6FPGb+RGOIZVsMVJbK7Qtd919GJMYUaGqf97y2vA1U4uQ+lF6o=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d2a6c327-8077-4560-6405-08dde668ae01
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2025 19:25:42.9266
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: L2IlEaEQ+/vwv1yD46hRfeBVsIxqRcuLIvrWI0z3hiAYZD7XQSqFe467WPkVdx67QpmhdCLb1kmlgf0skWEmFg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB6152
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-28_04,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 suspectscore=0 spamscore=0
 phishscore=0 bulkscore=0 mlxscore=0 mlxlogscore=999 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2508110000
 definitions=main-2508280163
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAxMyBTYWx0ZWRfX8MTqYBAtvtj1
 86CZIgJdoqLr9fW8nxSYeDRjXy7pwnJe9ti/1u2FWvL6LBVu0m1xhcXcWr7uDpQStReWq3psAo9
 r/XeYCdRkt1dsjCTCNj5nYLLf/RHyHT3DHPy/LOJRs3QDlQVmuEVSesCk49vhpAwJJ9edgPgFJn
 PNzycn4n1T4ESK8zuTKcksWVHmpLWldblZwL6SRfsbObgJOoJtRhBr2wNvDeWOtfqiPIAW7LO+n
 a/uDvzqn4jj4MirDoz33CZL3jAgY7UDDwt+UvVZ+IXqWL3RQzDM2+hGpo+orSTiA5P/H1jp4vO7
 2Yc8tco19/jaWNI296+cxX3hqFSnWtHDrSC9NcUo5Gwno+g2frH6hNErqqwhxooFQ0JDcTQpmDr
 22qaPILITRwXkLYy3v2aJdvP/+lbww==
X-Proofpoint-ORIG-GUID: In3qgJUrMVlBr3CGhearyRQCkAAJGZI5
X-Authority-Analysis: v=2.4 cv=RqfFLDmK c=1 sm=1 tr=0 ts=68b0ad41 b=1 cx=c_pps
 a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=GoEa3M9JfhUA:10 a=r3hrD9iVPEujusYZDD8A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 cc=ntf awl=host:12068
X-Proofpoint-GUID: In3qgJUrMVlBr3CGhearyRQCkAAJGZI5

On 8/28/25 13:56, Eugene Loh wrote:

> Anyhow, testing x86 and arm for OL8/UEK6 OL8/UEK7 OL9/UEK7 OL9/UEK8 
> OL10/UEK8, I get
>     test/unittest/udp/tst.ipv6localudp.sh: FAIL: expected results differ.
> for
>     x86/OL8/UEK7
>     x86/OL9/UEK7
>     x86/OL9/UEK8
>     x86/OL10/UEK8
>     arm/OL10/UEK8
> If you like, I can investigate more or report more details.  I just 
> didn't want to dive in too deep without checking in with you first.

I took a quick and sloppy look at this.  I looked at only one VM. The 
failure was:

     test/unittest/udp/tst.ipv6localudp.sh
     Diff against expected:
      Minimum UDP events seen

     -ip:::send - yes
     +ip:::send - no
     -ip:::receive - yes
     +ip:::receive - no
     -udp:::send - yes
     +udp:::send - no
      udp:::receive - yes

I tried:

     diff --git a/libdtrace/dt_prov_udp.c b/libdtrace/dt_prov_udp.c
     @@ -31,7 +31,7 @@ static probe_dep_t probes[] = {
              { "send",
                DTRACE_PROBESPEC_NAME,   "fbt::ip_send_skb:entry" },
              { "send",
     -          DTRACE_PROBESPEC_NAME,   "fbt::ip6_send_skb:entry" },
     +          DTRACE_PROBESPEC_NAME,   "rawfbt::ip6_send_skb:entry" },
              { NULL, }
      };

     diff --git a/libdtrace/dt_prov_ip.c b/libdtrace/dt_prov_ip.c
     @@ -21,11 +21,11 @@ static probe_dep_t probes[] = {
              { "receive",
                DTRACE_PROBESPEC_NAME, "fbt::ip_local_deliver:entry" },
              { "receive",
     -          DTRACE_PROBESPEC_NAME,   "fbt::ip6_input:entry" },
     +          DTRACE_PROBESPEC_NAME,   "rawfbt::ip6_input:entry" },
              { "send",
                DTRACE_PROBESPEC_NAME, "fbt::ip_finish_output:entry" },
              { "send",
     -          DTRACE_PROBESPEC_NAME, "fbt::ip6_finish_output:entry" },
     +          DTRACE_PROBESPEC_NAME, "rawfbt::ip6_finish_output:entry" },
              { NULL, }
      };

(The last change is also in another patch I recently posted and you 
R-b.)  With these changes on that VM, the test passes.

The whole thing suggests to me that we need a better audit of such 
issues, better understanding, and more/better tests.
