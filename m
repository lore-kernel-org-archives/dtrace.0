Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 242F5F9D6
	for <dtrace@lists.linux.dev>; Wed, 12 Mar 2025 05:18:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741756702; cv=fail; b=lL+Yna3d4MyBfkv+yZtjh5gKzG0RhwrvBDVwhLUGXg7m+YE90C1vcz7TGSfrbtcobXqzesX/QVFrm4UDc1zVKe2CeFc7ZFAvQgArDEvmJJsUCQ6xcjN0Sm9CmdToU8rsHOXfL4mrK0efNcTKUsLdahS2dDf2pkTESz57pkEfJ1c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741756702; c=relaxed/simple;
	bh=Z0c9vn9uhEMW1DHr6HsXel6ukiD+sq4mXO/tNEXPmUE=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=iW16AEsgWlG4X+LRCf79NhgZ/3ud3fBAtlDx7/Jx0j1w8tpBZKvoA03ANAuoBZCRFxqdqhknkgmWlK0kIDNGNfDqJ+LEt0aVxpeSmDrA62JPGdIyfEwxzQo+58fcVk891fyUjEEQbzOtm0bx2eClA1cdaVkLY/57Nit+KFD0mlk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=g7yA068Z; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=fSci2bhm; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="g7yA068Z";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="fSci2bhm"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52C1g46m016201
	for <dtrace@lists.linux.dev>; Wed, 12 Mar 2025 05:18:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=ZDfpQNCCLOHMSf8lxxBh/6VpPTsdXyRhHdbtjQ0e2vU=; b=
	g7yA068ZAxBJjladiMYMZjxwx3Ir6zDikwSXNa5JWz0PxqOCJ26fcyuMVm5gQlWc
	eV30TQ2e915F8xRnG6HChzNfkqf4ZbXnJMX3doBiuruR3MUrqtlbogpIlqfXLk0F
	R4NQ23+4n8T/8ElSTuu5HSnD4exReYLU1aCd9JjV0VF0FaZUEyY7t3KrtMWAUkk2
	pQRRj0qPSXEFD+eaU7eM8Sww3NUOZrAigx7HdA8/bQ/5REdVCvvKkZgZ/UqpVFXp
	dCVrIqyKOb9ETtHCnzkYN/3hgHni7tKfC3a7owTYxvzXb9egZKIVd6pterLdZHpb
	mr047/a+5Qryrgp/YK1QYA==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 45au4drury-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 12 Mar 2025 05:18:17 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 52C4ok5A012229
	for <dtrace@lists.linux.dev>; Wed, 12 Mar 2025 05:18:17 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2049.outbound.protection.outlook.com [104.47.70.49])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 45atn0sc0e-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 12 Mar 2025 05:18:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hJTPKL4vkxCtuw6phrOPpF/Bd91OuPHRC9k7DHnQG+IMOtrKG4NnQI0GInUZ82k3Q9mEEEL1hWMxh7hJFs4xMNN4kRKR0xkX/9fQVdxogXAf8PZyi35dtebZkKwhnY7j3dXoKjGA7+NKhNm0u47HvYz+ooH865q5DWjkGTFMSiFE9KnyamoyeQzl1kR2M5lT3H7askOtVM5eLFRj+kljs96GlrrPTWf/yP3gNCdUWs5R8KBx3QadFOfkmdctKTYhsyUgJ9WHoAkAM/6INHmLIW8siNss4O7/0KN/uToBNb8WriRp2bZT+dK4jtMhhRFK3NdqCyzqf5RbKtxvF2sdYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZDfpQNCCLOHMSf8lxxBh/6VpPTsdXyRhHdbtjQ0e2vU=;
 b=TBL7LxQpVav9Gwa8DIkgF1Sr9EySjlmapLD0/0VzwksqvWDZ77YMwHl3ziInBNHChAYS0KY4RgdGvcagNZdv2fCIs6B5FcQIa32R6Ekx1g0K+k1LPcaVA833zkrw/GamGwbf7q8vPJMj4tHwtq14EM4KmZxBkP7OO1JqipDdGF8snIcWCYOq8JTe1i/gDeRwqxVbcLmkfgdtLrrrfZC8x9ljyF0agSzoQfjowNuFbUw+W9gKH7kP7XSPXLdsFkD4kFAFc3gHsDuf0BoJ3LEwQ9tpKcWcQva6nA9+ym6k54ugboM4TMcpzxpC6zN7e6KOSJ/MjFMOM1jFawZQvsQy9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZDfpQNCCLOHMSf8lxxBh/6VpPTsdXyRhHdbtjQ0e2vU=;
 b=fSci2bhmk4gQ2hdvNNEzwLMZ+9rEYk4EorqnqsJP7Pblqt87WOAFi2ZOdc82n+mOwZs6G1NfZhdkwUayqJAVtOsPsPTnP7ZLQ/uMQ3FOin232Mg+sYEhgMGpy1YfrMzgDZhjx3u4Jr3f/O0GRg8wfW2YJW1G78h3v0tE4T0VtnM=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by MN2PR10MB4336.namprd10.prod.outlook.com (2603:10b6:208:15f::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.27; Wed, 12 Mar
 2025 05:17:54 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%5]) with mapi id 15.20.8511.026; Wed, 12 Mar 2025
 05:17:54 +0000
Message-ID: <a7159b93-884b-9911-b736-f500b3b8a6de@oracle.com>
Date: Wed, 12 Mar 2025 01:17:51 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 6/8] fbt: performance improvements
Content-Language: en-US
To: Kris Van Hees <kris.van.hees@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
References: <20250307213441.9495-1-kris.van.hees@oracle.com>
 <20250307213441.9495-5-kris.van.hees@oracle.com>
From: Eugene Loh <eugene.loh@oracle.com>
In-Reply-To: <20250307213441.9495-5-kris.van.hees@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BN0PR03CA0037.namprd03.prod.outlook.com
 (2603:10b6:408:e7::12) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|MN2PR10MB4336:EE_
X-MS-Office365-Filtering-Correlation-Id: 4e217404-5b82-4dcf-7b6c-08dd61253e3d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RUVSQUxsZ0xXY3hIbGdHSXVTRWx3N2srUE9lOUJwZFhWTWVCT0NqNzhvTEFK?=
 =?utf-8?B?Q2MwNUF4Q1ZzeVI5UEdaYnAyU1FmbDU0aVFSV1JiVTY2OUxNTjZNUHBZa3Ja?=
 =?utf-8?B?RDZXdDR4eFBqNmZHcnZSb1RjY2cva0wyV3V5TS9VNmhQSjV3TmdpOFF6YUdl?=
 =?utf-8?B?YnN5QUxNSk80WWl5VFpTOXBpaW5yY1hhVFZIdnQyMDVHMXdTSUdqUWVFOU1B?=
 =?utf-8?B?dFhHTVAxSGp6NDNwRXExelJUMHBsOTZmOXN6bWlyM3UwTTlUWlVrak5nMlVB?=
 =?utf-8?B?cXY3Yk9sSmVMZ1I1eUo2bG1rSTEzL1hmTCtpSVJUeVYvNk1MWFc5cXV5b3Nj?=
 =?utf-8?B?S1hSbnlPSE9yc3pnUkIrLzM2SWhlV09QSXdXd3RPV0hUZGIrQjJYS09EY0lG?=
 =?utf-8?B?b1JVTkhZNm40VzZ6UjljN050RVRQb2t6ZndFS3IwNE9iL21uNFd2enp4UW5J?=
 =?utf-8?B?ZDVtVkFYazN2TTdlQUxFV2hmRy9KTVdHdFlxT3NsZHZoSy9ETDVRQkZXYmZi?=
 =?utf-8?B?Tkx1anYyRlRNSnduRWxSbUo1TkFVUGdMMXRnUmlETHVJWXZZc0FaajFpeXRG?=
 =?utf-8?B?b3NpOGh0MzVhWnN4WlBXOGJ5YW8yVDZCMnZjcy92S0F6eldrby9rMHVFaHd1?=
 =?utf-8?B?YXl6VUQvcUs1RXJrd1F5VTg2M2tQeG5wYWlNK2ROMzNGL2psbnRmb1JhT1ZC?=
 =?utf-8?B?ZTg5MzNjdTMxWTczRnMxVzFBaStVR01WRFpOWCtjSFJCOWwzOHp2SUxuMjUw?=
 =?utf-8?B?ajdZOFRmaFhzV2NEYldFQUhxZ2lNQ3lhNGZoRG0xZHljNkJDYjV3M1crZUpn?=
 =?utf-8?B?V2M0RE1zN2MrMUcxMVhOb2c5ZG96VVNuVmppNXhkMldKY1BhVXZiL3U2Mlpl?=
 =?utf-8?B?OUg2S2NRRWNLc3hYMDRtMDU2T3IzTnpJVnhCZlZ3YlBUL2dDUlVIODkvOXI5?=
 =?utf-8?B?b01EUmV6aVhhMkdLTklqM3dvT1EyMjliNk1kNHZhK0ZIOFlIQVRsOXZ2WlJZ?=
 =?utf-8?B?QkFlNWxCUHFsQ0szYTRDU2UxUkVlMGVBb3llT0pGRllFVUZRNXBISDRLMGhL?=
 =?utf-8?B?MDhZbVdLbzRwUGplVVpIS1NCc2ZrY2xIRFlJZCttbURHdWljaE95VlZzUXd0?=
 =?utf-8?B?c3BZbDdGR2lDSWFFeGpYV3hxMFlaMkk4UGRHSTdSV0dyUTJhRUFwcHBWYlFN?=
 =?utf-8?B?aE1mbm9FenFnNlVKMlA1MjNVSnFuRkxZVkRvL1hWKzN2dm1lSEhBd1FhQXE2?=
 =?utf-8?B?OTZDN0lRS25XUDNlUURBWDJWeGw1QVRwSERiek5HMGdoTFZMSy9taXpVaXlu?=
 =?utf-8?B?ZDRQUGcxRHFjbCtSd3Bjb0FhWEV5SUIwckVVdkFYYXZCelZqNWhaUFFsMmhJ?=
 =?utf-8?B?eFRpZVVoWjk1L1d1VXZjSlZ3TEovcmFONHJ2cGtSYU5lSmQ2ajQ5aTZ6aDlY?=
 =?utf-8?B?T1RGUTVnc2RJbnlhQXRrM2JDZEV5a2ppb0ZieTRYMjIySjJ3Z2FoWUZTbVNL?=
 =?utf-8?B?SGs5VHlJak1YTlVXRkQ0SXZlR29uSmlMelAvbWxQM2JUaXBXTGZ1VkVzdWp3?=
 =?utf-8?B?WTk4djlhZkRiL3gvbCtYUDhxRkZrYWNHYytucmwzdFlraFVnbWJtSlZvTjdN?=
 =?utf-8?B?OGJqMFpTODRMcVh1NEF5bkpIVFpSYmd4TlNUeG1VMkFsT2RUdnUvc3lVSGtV?=
 =?utf-8?B?TzJ0MU5wVnlFRDlDeklNbGJwK3dLbnRSblJsK0VMTUZxc004N0JsVk9UN2Nt?=
 =?utf-8?B?SytCUDRocUc3dlFnYXNXQ3Y1SHBSV2NsNEhURkNRUFIvek93YXNaTSs0Tytn?=
 =?utf-8?B?cWNxVmlwV0xCb3lnZU9MOXZ4Q0tuWUhFOVpQbi9hdjcyN0hxMDJGYWV5RnhQ?=
 =?utf-8?Q?EwlQew06XBNjr?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NWVXdTh1Tm5pL3hMeTF2cDdkSU51T1FUWmU2eFR5Mll4QlhCdU9OeExwcnN0?=
 =?utf-8?B?Zk01TndMSi8vT3ExRVZhdWtSODhFZ2xlYmp1eWRlM1h1SkZORFRMYWNWNW50?=
 =?utf-8?B?aWNFc1MzbWljVzhtUUN6TVVwM1pPOGlTZWN2WHlULzJTYUtsZUJRdnlMVnla?=
 =?utf-8?B?dzBraUUzN0cxYjN4MVJQa2lwcEMwSW1qZ1hxSTBQYU53Ty9rUS9FSHNPbFBs?=
 =?utf-8?B?WXBnTjZzSStaUnpCVFJaQ0xCZHcwQ2dyN3FWUGx2TnA2QVZVRlV4RW5DRlI0?=
 =?utf-8?B?cTE3Z3ZsSkhBT01wd0JjQWxma0xUYytoeVhKaUJZVWhvR1FFZXRBTzREQ0Uy?=
 =?utf-8?B?M25STDhudzhiS2VrdzhYWUxkZTFBWklmUmRLTS9jS1cvR2FBTWRpc0lTZGZu?=
 =?utf-8?B?SWRMTU1rQjVneCt4Ukt6UUR6d0tLR2cxMjJpRG50US93dE5uaXdLck9KWW4w?=
 =?utf-8?B?Q2xvZWkySUR5L2JHVW1kYzZXT2FHMXN2aGttUkVxVHVWSmI5YlJjSDlzVS8r?=
 =?utf-8?B?cGNwMFFQOWg1T3Fka0xHS1M1WnU2MmViMFBvMXNtaCtkdUFaMEp2Mk0wT3RK?=
 =?utf-8?B?bzhWRHNGRUVCdnlpTi9FTWthc2xodFJoWkY0MnlVRmw4bVkxTUNvelJsdit1?=
 =?utf-8?B?dEFwMUZ4NGdJWCt2T1QwM1J5QVBBcnFqTHVXSzA3ZmFSd3ZxU3MzNUNkZ1Fz?=
 =?utf-8?B?aEI3SENNYjJlUTFQWENUdjhTOWtMV25yRldJMEJvR1F0RW5OT0tiWFg5WTM3?=
 =?utf-8?B?d1BqbVhuYnhmbFhMNXJwcEVza3RCUEV0SkpJM2hQLzJESWdGOVBIcm5tUVpL?=
 =?utf-8?B?dHdTN1BpYmx0QWdxSnArUEJEQi9nZ3pZTkQyTjlXS3BPUENhTUJtdVhsUlhW?=
 =?utf-8?B?OGxMR2lvZVFEYXZjSWJ2bWNUQlJVdFVJc2l2NmtYbjBsdTVlQ1pJbEh0T1FW?=
 =?utf-8?B?cHVtbmhSYmJ6UVdXbCsvUVlxenA0eWdJTHJwMzE2S29Eb1BCdlM4dHdJTDNp?=
 =?utf-8?B?RUNBZ01iQnlBZ1B4WCtUdnl3eDVwRjRHOWFtME9kR0hqZnU2NHBzTkRFL3ZD?=
 =?utf-8?B?aXdjbCtnVkdPYzdLSkFPQkd5UzJrYUtXVmJzRlNrWW85V0FVZS92SVlJdWJY?=
 =?utf-8?B?b2ZHby82ZStsMUpxdnBQSGNkZEJtd1Nwc2FVMkZuWlhUQW5OaEQ2UEVQOTBp?=
 =?utf-8?B?UnBEV0QvU0lrRHJCb0RxZFY5elVZSXRsaEs1NlMzMkF6R3oxTk9aOTQ0YmZI?=
 =?utf-8?B?TmNpazJpMEJseFJFRGw3SU1QbzJGZ1NnTFVELzZ2eW9RaFRIdVJMazJ1VFkx?=
 =?utf-8?B?QXNXSUQzOCtMcW95K3BPZnNDSVhqbWhwbVdYdTMrRmVTOThoWUh3L0tPZENZ?=
 =?utf-8?B?QUtSWWt1S3hwRnhIMzE3TzZXOStsbzl0U0wwV0hHdmhrajFxa1NGYnlGNHVr?=
 =?utf-8?B?WWkzUzZDaWo5YjFoTmxxa21aeGhNL3ZLVzN6NDVLcTRKalRpUWtGQWJMSW1i?=
 =?utf-8?B?U0pvZi9hVnZETTJZN3YxdHdnblBldmp6UFFWWWRtbDM3YUN3cTFqUWNsNk95?=
 =?utf-8?B?OVBFcWthaE5TMzRidlhuNFVUM3FCTGFPT2MzOU9jcm8xM2Z2ekg3eDVHZDM5?=
 =?utf-8?B?M21pNW9nRXFVZUdjNkl4TDFxOWhwUmgvbXJtcGd0MHI1ZkRPTWxQRlcrMk8z?=
 =?utf-8?B?MmdrVCtSVk9DeDJtVU9XeFZnemVzeGR5MElQTmlSdThGVUNLVlN0TVRqaFRi?=
 =?utf-8?B?STlpNUdFaStZYS96OUs3WTlIM3llRUVxUUVRNnFtS0hBV3VZcitJS2h5MUI3?=
 =?utf-8?B?QU1HNDBhMFhUT1NhUmtqNGk0dGFoYmZnZWdqMkpoZkJvUCtJaldMTWd2RFNl?=
 =?utf-8?B?UzhzOTZQVzRUc0szRVQ5V2YxbjR2ZlRpYUpudkxkY1B6UGpYMnh2eXo1MFYr?=
 =?utf-8?B?R1h4a3o5MlVicmszSHY1d1hQU3RIQTNtWWtXVVZFeEtKWHhiNVpLcms4WHN3?=
 =?utf-8?B?YjFOY0V3R2pOUmNaa1BISlpMeXpLT1hkK3BtaStNYmg1UDVlQkR3Y1Byck9x?=
 =?utf-8?B?UEVDRmRpaU0xdzFBZlI2T1IvNGhLd1g5MEQyTVBmNmI3Z0MzenpQR3FSUkQ5?=
 =?utf-8?Q?Dz+E1VF3QyEXoEm+JiaQlSNzP?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	ukMv0VxFsd0AfxgV4OG+WoYI/EBBdI7Kw3dysNuvwqQwSNi1Aj/FF16ftJbTq3eQx8qekfWQVTE2iTTUuftRYrrU0ZvyaoIo8dI2DexXfiu2RENmDieO7agdzgkF/ykWuvBwB+i4V6Ii6YdrPzvlVrNbQFWobZvIOquVIGNtAaTb1OAiXGB+TBHqrP7YAFEvT96fO/a1AuhPEzWfGab3+PdXtyU1ni7jmQIQj1ZTb1PUV12bC55aiYI3MxP0s1KarBhs9He9fKdmll/P5qCZsBc1nk2SljCwcynR20BogkxCPIL85OI/G6wPU5Ehaa8eFy75i0C7zEol7AavZEno8kUVUavsjwzGY0ZCknOEH9MYA7QH+yijYd3h1ofp9HE+n8FxQGsX3ZILhxTzZzXoDgagZYMhAtAUpFqEWtut9bmIVyI4LMTuQPcfWbTkQ5qJsJECiBSXtTf/s6axNH9igVDoCYMrAQ0aVZkzYSuOgzdHsU8bKrHepKbnDwmSGa/e3AG9WtaNZWLIX7+sq85ojk69XbOwTSNRzYTBD9XvsPHmptKCTpCVISS+z0AFn3Sb/fPvMu4WAaysYpCpgcbvTRAKJIRQRrWJkNRDEVksF7I=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e217404-5b82-4dcf-7b6c-08dd61253e3d
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2025 05:17:54.3678
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jfxISbd6noGOI1qYRoY2isRDEYGkk2bIcvB1SKpfvPJG4hWZe3Kcz+VCDPyFB1ANKVw1IyK7j+duNISlRQ6nTA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR10MB4336
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-12_01,2025-03-11_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 phishscore=0 spamscore=0
 mlxscore=0 mlxlogscore=999 adultscore=0 malwarescore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2502280000
 definitions=main-2503120036
X-Proofpoint-ORIG-GUID: j82VUAo6nNOQBbwDLXN0OmRdwJVNJBnn
X-Proofpoint-GUID: j82VUAo6nNOQBbwDLXN0OmRdwJVNJBnn

Sorry for the slow progress.  Anyhow, with this patch, I get failures on 
test/unittest/lockstat/tst.lockstat-summary.d on x86 UEK7 systems.  
Stuff like:

         dtrace: could not enable tracing: BPF program load for 
'fbt:vmlinux:native_queued_spin_lock_slowp: Invalid argument

Well, in dt_prov_lockstat.c, I see:
         { "spin-spin", DTRACE_PROBESPEC_FUNC, "fbt::queued_spin_lock_*" },
         { "spin-spin", DTRACE_PROBESPEC_FUNC, 
"fbt::native_queued_spin_lock_*" },

And on those problematic systems, I see:
         $ sudo build/run-dtrace -lP fbt |& grep native_queued
         98429        fbt           vmlinux 
native_queued_spin_lock_slowpath return
         98428        fbt           vmlinux 
native_queued_spin_lock_slowpath entry
          9433        fbt           vmlinux 
native_queued_spin_lock_slowpath.part.0 return
          9432        fbt           vmlinux 
native_queued_spin_lock_slowpath.part.0 entry

In contrast, on UEK8, "dtrace -lP fbt" does not include the .part.0 probes.

Back on the UEK7 systems, if I modify dt_prov_lockstat.c like this:
     -   { "spin-spin", DTRACE_PROBESPEC_FUNC, 
"fbt::native_queued_spin_lock_*" },
     +   { "spin-spin", DTRACE_PROBESPEC_FUNC, 
"fbt::native_queued_spin_lock_slowpath" },
the test passes.

Is that the right change to make?  If so, shall I submit a patch, or 
should it go with your patch series?

On 3/7/25 16:34, Kris Van Hees wrote:
> Up until now, FBT probes were registered for every symbol that was
> listed as traceable.  Most tracing session do not use most or even
> any of these, and the process of registering them all was quite
> slow.
>
> Going forward, FBT probes are registered on demand.
>
> If any FBT probes are to be registered, the first will incur the
> cost of reading the entire list of traceable symbols.  Any further
> FBT probe registration will be able to be satisfied based on that
> initial processing.  The performance improvement is therefore quite
> significant for tracing sessions that do not trigger any FBT probe
> registration, and if FBT probes are used, the improvement is still
> quite noticable because only the probes that are actually needed
> get registered.
>
> Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
> ---
>   libdtrace/dt_module.c   |  78 +++++++++++++++
>   libdtrace/dt_module.h   |   2 +
>   libdtrace/dt_prov_fbt.c | 217 +++++++++++++++++++++++++++-------------
>   3 files changed, 228 insertions(+), 69 deletions(-)
>
> diff --git a/libdtrace/dt_module.c b/libdtrace/dt_module.c
> index 2e915e2f..e7553a07 100644
> --- a/libdtrace/dt_module.c
> +++ b/libdtrace/dt_module.c
> @@ -22,6 +22,7 @@
>   #include <port.h>
>   
>   #include <zlib.h>
> +#include <tracefs.h>
>   
>   #include <dt_kernel_module.h>
>   #include <dt_module.h>
> @@ -1044,6 +1045,83 @@ dt_kern_module_find_ctf(dtrace_hdl_t *dtp, dt_module_t *dmp)
>   	}
>   }
>   
> +#define PROBE_LIST		TRACEFS "available_filter_functions"
> +
> +/*
> + * Determine which kernel functions are traceable and mark them.
> + */
> +void
> +dt_modsym_mark_traceable(dtrace_hdl_t *dtp)
> +{
> +	FILE			*f;
> +	char			*buf = NULL;
> +	size_t			len = 0;
> +
> +	if (dt_symtab_traceable(dtp->dt_exec->dm_kernsyms))
> +		return;
> +
> +	f = fopen(PROBE_LIST, "r");
> +	if (f == NULL)
> +		return;
> +
> +	while (getline(&buf, &len, f) >= 0) {
> +		char			*p;
> +		dt_symbol_t		*sym = NULL;
> +
> +		/*
> +		 * Here buf is either "funcname\n" or "funcname [modname]\n".
> +		 * The last line may not have a linefeed.
> +		 */
> +		p = strchr(buf, '\n');
> +		if (p) {
> +			*p = '\0';
> +			if (p > buf && *(--p) == ']')
> +				*p = '\0';
> +		}
> +
> +		/*
> +		 * Now buf is either "funcname" or "funcname [modname".  If
> +		 * there is no module name provided, we will use the default.
> +		 */
> +		p = strchr(buf, ' ');
> +		if (p) {
> +			*p++ = '\0';
> +			if (*p == '[')
> +				p++;
> +		}
> +
> +#define strstarts(var, x) (strncmp(var, x, strlen (x)) == 0)
> +		/* Weed out __ftrace_invalid_address___* entries. */
> +		if (strstarts(buf, "__ftrace_invalid_address__") ||
> +		    strstarts(buf, "__probestub_") ||
> +		    strstarts(buf, "__traceiter_"))
> +			continue;
> +#undef strstarts
> +
> +		/*
> +		 * If we have a module name, look for the symbol in that
> +		 * module.
> +		 * If not, perform a general symbol lookup to find its first
> +		 * instance.
> +		 */
> +		if (p) {
> +			dt_module_t	*dmp = dt_module_lookup_by_name(dtp, p);
> +
> +			if (dmp)
> +				sym = dt_module_symbol_by_name(dtp, dmp, buf);
> +		} else
> +			sym = dt_symbol_by_name(dtp, buf);
> +
> +		if (sym)
> +			dt_symbol_set_traceable(sym);
> +	}
> +
> +	free(buf);
> +	fclose(f);
> +
> +	dt_symtab_set_traceable(dtp->dt_exec->dm_kernsyms);
> +}
> +
>   /*
>    * Symbol data can be collected in three ways:
>    *  - kallmodsyms
> diff --git a/libdtrace/dt_module.h b/libdtrace/dt_module.h
> index 56df17a6..dd3ad17c 100644
> --- a/libdtrace/dt_module.h
> +++ b/libdtrace/dt_module.h
> @@ -25,6 +25,8 @@ extern dt_ident_t *dt_module_extern(dtrace_hdl_t *, dt_module_t *,
>   
>   extern const char *dt_module_modelname(dt_module_t *);
>   
> +extern void dt_modsym_mark_traceable(dtrace_hdl_t *);
> +
>   #ifdef	__cplusplus
>   }
>   #endif
> diff --git a/libdtrace/dt_prov_fbt.c b/libdtrace/dt_prov_fbt.c
> index eef93879..d837e14d 100644
> --- a/libdtrace/dt_prov_fbt.c
> +++ b/libdtrace/dt_prov_fbt.c
> @@ -41,10 +41,8 @@
>   #include "dt_pt_regs.h"
>   
>   static const char		prvname[] = "fbt";
> -static const char		modname[] = "vmlinux";
>   
>   #define KPROBE_EVENTS		TRACEFS "kprobe_events"
> -#define PROBE_LIST		TRACEFS "available_filter_functions"
>   
>   #define FBT_GROUP_FMT		GROUP_FMT "_%s"
>   #define FBT_GROUP_DATA		GROUP_DATA, prp->desc->prb
> @@ -61,19 +59,11 @@ dt_provimpl_t			dt_fbt_fprobe;
>   dt_provimpl_t			dt_fbt_kprobe;
>   
>   /*
> - * Scan the PROBE_LIST file and add entry and return probes for every function
> - * that is listed.
> + * Create the fbt provider.
>    */
>   static int populate(dtrace_hdl_t *dtp)
>   {
>   	dt_provider_t		*prv;
> -	FILE			*f;
> -	char			*buf = NULL;
> -	char			*p;
> -	const char		*mod = modname;
> -	size_t			n;
> -	dtrace_syminfo_t	sip;
> -	dtrace_probedesc_t	pd;
>   
>   	dt_fbt = BPF_HAS(dtp, BPF_FEAT_FENTRY) ? dt_fbt_fprobe : dt_fbt_kprobe;
>   
> @@ -81,79 +71,166 @@ static int populate(dtrace_hdl_t *dtp)
>   	if (prv == NULL)
>   		return -1;			/* errno already set */
>   
> -	f = fopen(PROBE_LIST, "r");
> -	if (f == NULL)
> +	return 0;
> +}
> +
> +/* Create a probe (if it does not exist yet). */
> +static int provide_probe(dtrace_hdl_t *dtp, const dtrace_probedesc_t *pdp)
> +{
> +	dt_provider_t	*prv = dt_provider_lookup(dtp, pdp->prv);
> +
> +	if (prv == NULL)
> +		return 0;
> +	if (dt_probe_lookup(dtp, pdp) != NULL)
>   		return 0;
> +	if (dt_tp_probe_insert(dtp, prv, pdp->prv, pdp->mod, pdp->fun, pdp->prb))
> +		return 1;
>   
> -	while (getline(&buf, &n, f) >= 0) {
> -		/*
> -		 * Here buf is either "funcname\n" or "funcname [modname]\n".
> -		 * The last line may not have a linefeed.
> -		 */
> -		p = strchr(buf, '\n');
> -		if (p) {
> -			*p = '\0';
> -			if (p > buf && *(--p) == ']')
> -				*p = '\0';
> +	return 0;
> +}
> +
> +/*
> + * Try to provide probes for the given probe description.  The caller ensures
> + * that the provider name in probe desxcription (if any) is a match for this
> + * provider.  When this is called, we already know that this provider matches
> + * the provider component of the probe specification.
> + */
> +#define FBT_ENTRY	1
> +#define FBT_RETURN	2
> +
> +static int provide(dtrace_hdl_t *dtp, const dtrace_probedesc_t *pdp)
> +{
> +	int			n = 0;
> +	int			prb = 0;
> +	dt_module_t		*dmp = NULL;
> +	dt_symbol_t		*sym = NULL;
> +	dt_htab_next_t		*it = NULL;
> +	dtrace_probedesc_t	pd;
> +
> +	dt_modsym_mark_traceable(dtp);
> +
> +	/*
> +	 * Nothing to do if a probe name is specified and cannot match 'entry'
> +	 * or 'return'.
> +	 */
> +	if (dt_gmatch("entry", pdp->prb))
> +		prb |= FBT_ENTRY;
> +	if (dt_gmatch("return", pdp->prb))
> +		prb |= FBT_RETURN;
> +	if (prb == 0)
> +		return 0;
> +
> +	/* Synthetic function names are not supported for FBT. */
> +	if (strchr(pdp->fun, '.'))
> +		return 0;
> +
> +	/*
> +	 * If we have an explicit module name, check it.  If not found, we can
> +	 * ignore this request.
> +	 */
> +	if (pdp->mod[0] != '\0' && strchr(pdp->mod, '*') == NULL) {
> +		dmp = dt_module_lookup_by_name(dtp, pdp->mod);
> +		if (dmp == NULL)
> +			return 0;
> +	}
> +
> +	/*
> +	 * If we have an explicit function name, we start with a basic symbol
> +	 * name lookup.
> +	 */
> +	if (pdp->fun[0] != '\0' && strchr(pdp->fun, '*') == NULL) {
> +		/* If we have a module, use it. */
> +		if (dmp != NULL) {
> +			sym = dt_module_symbol_by_name(dtp, dmp, pdp->fun);
> +			if (sym == NULL)
> +				return 0;
> +			if (!dt_symbol_traceable(sym))
> +				return 0;
> +
> +			pd.id = DTRACE_IDNONE;
> +			pd.prv = pdp->prv;
> +			pd.mod = dmp->dm_name;
> +			pd.fun = pdp->fun;
> +
> +			if (prb & FBT_ENTRY) {
> +				pd.prb = "entry";
> +				n += provide_probe(dtp, &pd);
> +			}
> +			if (prb & FBT_RETURN) {
> +				pd.prb = "return";
> +				n += provide_probe(dtp, &pd);
> +			}
> +
> +			return n;
>   		}
>   
> -		/*
> -		 * Now buf is either "funcname" or "funcname [modname".  If
> -		 * there is no module name provided, we will use the default.
> -		 */
> -		p = strchr(buf, ' ');
> -		if (p) {
> -			*p++ = '\0';
> -			if (*p == '[')
> -				p++;
> +		sym = dt_symbol_by_name(dtp, pdp->fun);
> +		while (sym != NULL) {
> +			const char	*mod = dt_symbol_module(sym)->dm_name;
> +
> +			if (dt_symbol_traceable(sym) &&
> +			    dt_gmatch(mod, pdp->mod)) {
> +				pd.id = DTRACE_IDNONE;
> +				pd.prv = pdp->prv;
> +				pd.mod = mod;
> +				pd.fun = pdp->fun;
> +
> +				if (prb & FBT_ENTRY) {
> +					pd.prb = "entry";
> +					n += provide_probe(dtp, &pd);
> +				}
> +				if (prb & FBT_RETURN) {
> +					pd.prb = "return";
> +					n += provide_probe(dtp, &pd);
> +				}
> +
> +			}
> +			sym = dt_symbol_by_name_next(sym);
>   		}
>   
> -		/* Weed out synthetic symbol names (that are invalid). */
> -		if (strchr(buf, '.') != NULL)
> +		return n;
> +	}
> +
> +	/*
> +	 * No explicit function name.  We need to go through all possible
> +	 * symbol names and see if they match.
> +	 */
> +	while ((sym = dt_htab_next(dtp->dt_kernsyms, &it)) != NULL) {
> +		dt_module_t	*smp;
> +		const char	*fun;
> +
> +		/* Ensure the symbol can be traced. */
> +		if (!dt_symbol_traceable(sym))
>   			continue;
>   
> -#define strstarts(var, x) (strncmp(var, x, strlen (x)) == 0)
> -		/* Weed out __ftrace_invalid_address___* entries. */
> -		if (strstarts(buf, "__ftrace_invalid_address__") ||
> -		    strstarts(buf, "__probestub_") ||
> -		    strstarts(buf, "__traceiter_"))
> +		/* Match the function name. */
> +		fun = dt_symbol_name(sym);
> +		if (!dt_gmatch(fun, pdp->fun))
>   			continue;
> -#undef strstarts
>   
> -		/*
> -		 * If we did not see a module name, perform a symbol lookup to
> -		 * try to determine the module name.
> -		 */
> -		if (!p) {
> -			if (dtrace_lookup_by_name(dtp, DTRACE_OBJ_KMODS, buf,
> -						  NULL, &sip) == 0)
> -				mod = sip.object;
> -		} else
> -			mod = p;
> +		/* Validate the module name. */
> +		smp = dt_symbol_module(sym);
> +		if (dmp) {
> +			if (smp != dmp)
> +				continue;
> +		} else if (!dt_gmatch(smp->dm_name, pdp->mod))
> +			continue;
>   
> -		/*
> -		 * Due to the lack of module names in
> -		 * TRACEFS/available_filter_functions, there are some duplicate
> -		 * function names.  We need to make sure that we do not create
> -		 * duplicate probes for these.
> -		 */
>   		pd.id = DTRACE_IDNONE;
> -		pd.prv = prvname;
> -		pd.mod = mod;
> -		pd.fun = buf;
> -		pd.prb = "entry";
> -		if (dt_probe_lookup(dtp, &pd) != NULL)
> -			continue;
> +		pd.prv = pdp->prv;
> +		pd.mod = smp->dm_name;
> +		pd.fun = fun;
>   
> -		if (dt_tp_probe_insert(dtp, prv, prvname, mod, buf, "entry"))
> -			n++;
> -		if (dt_tp_probe_insert(dtp, prv, prvname, mod, buf, "return"))
> -			n++;
> +		if (prb & FBT_ENTRY) {
> +			pd.prb = "entry";
> +			n += provide_probe(dtp, &pd);
> +		}
> +		if (prb & FBT_RETURN) {
> +			pd.prb = "return";
> +			n += provide_probe(dtp, &pd);
> +		}
>   	}
>   
> -	free(buf);
> -	fclose(f);
> -
>   	return n;
>   }
>   
> @@ -447,6 +524,7 @@ dt_provimpl_t	dt_fbt_fprobe = {
>   	.prog_type	= BPF_PROG_TYPE_TRACING,
>   	.stack_skip	= 4,
>   	.populate	= &populate,
> +	.provide	= &provide,
>   	.load_prog	= &fprobe_prog_load,
>   	.trampoline	= &fprobe_trampoline,
>   	.attach		= &dt_tp_probe_attach_raw,
> @@ -459,6 +537,7 @@ dt_provimpl_t	dt_fbt_kprobe = {
>   	.name		= prvname,
>   	.prog_type	= BPF_PROG_TYPE_KPROBE,
>   	.populate	= &populate,
> +	.provide	= &provide,
>   	.load_prog	= &dt_bpf_prog_load,
>   	.trampoline	= &kprobe_trampoline,
>   	.attach		= &kprobe_attach,
