Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38EA71A4879
	for <dtrace@lists.linux.dev>; Thu,  1 Aug 2024 17:39:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722533954; cv=fail; b=fhSXA1pmX+eLUARhxLs3cts4SIuO2SzFS0UTgBnlmF6YE9bpHvEllJcgv++JRK3FpoLWfKs1H7y7KP6heuyc8ewamoJElVuWcW03oLf28buiMzAmF/AoEcTzVi0FRwWRNDw5Xu1eBI3BUXVMAJKFgI+XII4fpFzaG/l8t4Pkzzc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722533954; c=relaxed/simple;
	bh=4t/hP+MQGjDUlyPc66Ja7cUksyVtfl8hz0ij2gfHDoE=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=La4Pl0E3Btxf/cyJEe9Vtm/GBDRz+ICk0nju6O1U70tzhYh0qQbx79uRa3HaGFa+pBoMuR0K/RQc5uJIXclAqPiKQ5eGY0VQG+ju8u98YeuYmR2Qs6jM25eGNgL8DcQqN7C4ItlwUL90PNtFCOHOZOcPM4rULj776mmoTmrlP6E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=eZ+Yx7FO; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=JVQaJXZ5; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="eZ+Yx7FO";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="JVQaJXZ5"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 471H0Unf008125
	for <dtrace@lists.linux.dev>; Thu, 1 Aug 2024 17:39:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	message-id:date:subject:to:references:from:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=
	corp-2023-11-20; bh=qHC3d+I+LXbyI45+iRaJtXkqSlzixDdXtHpJc173Ga4=; b=
	eZ+Yx7FO5GxIpQ2HdYQ7a3fG76YmWzKA5JBy5jT0ApkMs/j5+3adxnUrNlM8RYnK
	CuFQSXJgZvS/TsLTklI9ubYyTFe+xPX50Pnu4wwBwP3eI2ZPUX0qFX0OSwxXOi9G
	pS0Uy5Gk43ZADZw9BiDc4PskUje8/CtBaRo4o9qiyxRF/45WDEwJft5f40Hyx5W1
	ranCKGjBvAVm+RTykpAFAomMkbUju2X11Q1o2EMxVd9xTWXV1XOvcCshoCPOruzc
	lzpJWfbbtqJpz3BQSNRdoHiv0Y2fewoCjkUWKABSmXvsWbCtd5rD1aDi93topSjc
	YtLx9KEXihy070MgrrVi0A==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 40msestba0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 01 Aug 2024 17:39:11 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 471HFTTH019132
	for <dtrace@lists.linux.dev>; Thu, 1 Aug 2024 17:39:09 GMT
Received: from nam04-dm6-obe.outbound.protection.outlook.com (mail-dm6nam04lp2041.outbound.protection.outlook.com [104.47.73.41])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 40qjmty8wg-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 01 Aug 2024 17:39:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BXPMcxeIN4/vBjat+9uwHJjp4bk3WETTIfbUR+Tmr0m2m2LS1qLkrV0LuOgSj+XrTH+usHQyUVZJJ984HMAiB6JqZFrfeIUZZgNXjv1ci+9GwNYlKtWI+GPZkmLH27z5TLoERdRDQ9KG3OrLRhzLyrJwwHpCxl9M8G8c1ANy+r6jrpgFSmcYujxXgIQtg29s1rBQ8w+hkaG5zb7Q9K/XWrnaGp0cDfWVFVOxR+M7FUIJv0BA5iAM3Z4SyIej25ampdkyAS83pIFxR2XdspMke7YK6UabUyltpRWYvayl0n+L+BJPUXl/5BLx11aM/7WDS4ZA0n70aN2aZI1WE39QUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qHC3d+I+LXbyI45+iRaJtXkqSlzixDdXtHpJc173Ga4=;
 b=ns6VPRvrTvQmQtNu6iu8RjpQ70AqjgbSuWhSpebHTID9bsb7fkd3PwaSdiLkAY6sv5/r3VEuy33fEWcvXdBIARFrzI93+FbvjjpzInVpS/OaBW9L1CrY8kH8JislJWofzLDIiwsI41/jpJdy9pLl3ttdR6zSEDgZ2077rsKFBfdftGrXKweE+gLkN79ifjCJMYb17T6FE+sZZpGrAwSPWGXupCzemkK4MZz5EfAO0dOx6Q9JHQBOc2A4XiJ1qpVRg6fzrYM8xjHCTohT7SJ+wVHIkFvXWaQSF29us7QfsbyB0aa798y1oa/H+Faok4WAnJd6J6O3safhHP6+VmDFrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qHC3d+I+LXbyI45+iRaJtXkqSlzixDdXtHpJc173Ga4=;
 b=JVQaJXZ5s07IB+7aAT10JByAAuFu5DjwDQ++EeShMLn1KDgkf+A43ZGYNi9lgCLF5rM0AdctHwMF43CHZp70Xh0IYFNKzCE8M15a9MfJQGSPji9VZWKfXEcpJIy7FuYHmzEoeCrtCauyJO4i1DCgOu6D2sDXjdBe6PXWVzQ5uzA=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by LV8PR10MB7752.namprd10.prod.outlook.com (2603:10b6:408:1e7::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.33; Thu, 1 Aug
 2024 17:39:07 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%5]) with mapi id 15.20.7828.023; Thu, 1 Aug 2024
 17:39:07 +0000
Message-ID: <3452f964-e560-6fdd-cfbc-ddfe9ad1915b@oracle.com>
Date: Thu, 1 Aug 2024 13:39:03 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [DTrace-devel] [PATCH] test: adjust err.unloaded_var.x to match
 test
Content-Language: en-US
To: dtrace-devel@oss.oracle.com, dtrace@lists.linux.dev
References: <SN7PR10MB6287E893C7C56380F927732CC2B22@SN7PR10MB6287.namprd10.prod.outlook.com>
From: Eugene Loh <eugene.loh@oracle.com>
In-Reply-To: <SN7PR10MB6287E893C7C56380F927732CC2B22@SN7PR10MB6287.namprd10.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BL0PR01CA0022.prod.exchangelabs.com (2603:10b6:208:71::35)
 To CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|LV8PR10MB7752:EE_
X-MS-Office365-Filtering-Correlation-Id: 995c7eac-cb5c-4ba9-70b2-08dcb250d7e5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TU1iZ2ZnK0JKWnN5S2ZkT09QMmkwUFNpdjlkdjdwTXNpZUVxM3E1T2JaeDN1?=
 =?utf-8?B?RWVTeXh6R0o3UzVhWW5EdjZJQXhVSDhMcGdSdHF2SHV2dkVtWCtDNkJaTVR1?=
 =?utf-8?B?bGo4bHlQbVpYdUFZbDhNaUh3QnJXbVdzeUpZc0RzM0lrUkd4bXBpWFptbTVo?=
 =?utf-8?B?TUtURUNnQWVjNzdlOVdLTkRtUnFoYUFxK2FheDA3eElRdC9sQTlHd1hzZUdL?=
 =?utf-8?B?MXhOVWRlRG5GTUw5UmZRSGk1OHAzcjBCR1l0eUJmdzNFUm5lYktDcEtxdXA2?=
 =?utf-8?B?S0dWa1FFOG14dFI1N0VQWTR2VUNHTlI5MCtFbmsybno1d2hPK2ptT3l3WVlZ?=
 =?utf-8?B?ZjRNK28wMWNpQ2psVEZtd3Q3d3hLNVhTMmh5ZGRoSjZJc3B3K2ZFMStyK05y?=
 =?utf-8?B?Unc5Ym5sc3p6M1dqSE94R2lnN1pPUVR6SExldCtpYlRSbThEeEdQZVhxWFFS?=
 =?utf-8?B?MFBLWHNqeUFrNmpNaS90UXZVK3ZtOWloaUVacXdhdTdCbUYxL0VVNEFlSVhO?=
 =?utf-8?B?Q2U1SXE0eVI3WEtqaE40ZU9kZ2h0UlJNV0N2RTZhK3VxQWd1d1pNZmVmcDIy?=
 =?utf-8?B?cEErQWZZdUFuVm1rc1lzZzBmNk9ON2tUZ1ZHWHR0RkttNGhhQlJZYUZqQXln?=
 =?utf-8?B?Y3RuWExjWEJDdU5PS0l5dHFwOFJlTkVTazBOdmVIMGYrNzBZMGVmZUF0ZUJR?=
 =?utf-8?B?VzRYOFlhNXNsL3B5WllISHh3MjFMMHpXdU5kN0NhMHljUlhwUGttM3pFSEg2?=
 =?utf-8?B?K3FxUU1QMGNScnZqa2IwTXlERmYxeDY2L1FUVGlKL0kvMFhZZTVtZDkxRVor?=
 =?utf-8?B?SmNDTWFUQTErS1dUSTdTblE4Q3pJTWsyREJpdEI3N1BiQTMrSWM3RDJlZnBq?=
 =?utf-8?B?NEdUYXdZQ2ZKU0dwOWRMbER5ZXdyRmRJV2lFV1VEcG1pV3ZPUDVKcWtvNDY2?=
 =?utf-8?B?VjdLeXVqYVgzOHVSVENKSldiMmxJZk1xejJyOXd3QUlIUXRMTVUzbzZodytn?=
 =?utf-8?B?cUF4b2pqemliMGc0eTdSQzF5SUt5VlpjSGNrS2FrZFd4ZUhvK25wSDNOc0J3?=
 =?utf-8?B?UnkwdVY4am4yMzRrUjdpNkVwclpLaTVyWEg3dE1kdVJLa2tObDdaSjNBVU9Z?=
 =?utf-8?B?RFRxaU1lcnF0TytXOFpNY2JlUkl0Y3Z3Z3RtTnVrUU5lUnkrZmNpdkp3NEdH?=
 =?utf-8?B?U1BXVlBlY0tEdW9KUnBBMlhqK0VxdGJpZHRoeDZnN1QwNlcvU1E4dTVncEZr?=
 =?utf-8?B?T2xURjdyWEZIUXgxUVd4NGU5Y3crV2RTZHRBdTVmd0loWWhrcnNBYlRPdWh2?=
 =?utf-8?B?aWFZRjU2dUxxMFFwOEl1Y1E2QXN5VmQ4SkN5alhxNWJoWEhieDNuYk1nYTk5?=
 =?utf-8?B?MGJXbFd0cmhUZFlqUnd0elJzenpweVRkN3FhNHFCSmVmQk0xWnJ0NEI5Snpm?=
 =?utf-8?B?YUVIcTRKTVRQa3hlOEJsVS8rblhSbVVwY1Vyb0FCOTZvbUxZSUNTU1NPc3Fl?=
 =?utf-8?B?YXgxT0hkRGQ0MDNkbzI4NWVLMEVEMGhwOUxLRHZOMFg1Y2k2ZGFTZWFyREdJ?=
 =?utf-8?B?QVpKN0hiSWFQckV2WGU4ZTRieTU3cGdTRGkrUEx2WnZDU0tlb0loejV4Z1pk?=
 =?utf-8?B?ZVhRcks1NU94SU83Y0IxKzhuaHhjVEtVaWR5S1hMR3NxMmFVNVlBS0Z0aHhs?=
 =?utf-8?B?QkZSWHlML1cwbUgveWVEOGZhV1FHMWRDOGcyTTcreDEyQjhqdjNkVlRJemo3?=
 =?utf-8?B?dlFvUUtKb1hEaXhLSlFVUUxDT0JjYjVnTHk3a3k2TWNhRU9iZUR3SHJzcEQ3?=
 =?utf-8?Q?Mjb5ERu5H4XnpfFMcMt7Bj6TGkToxSTDdLSPE=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YkFxTXQ3MWc3cUVhS3NnS0hGMkgweHZDZ1Jzais5YnJEdi9QdFlITlFnTDZu?=
 =?utf-8?B?bzN1WnNvTEJaNnUwYnhNVWkzSitUNUxnRUZaUC9neHhvKzJlSHZLRHpKNC9w?=
 =?utf-8?B?SDIvbEtaWmxISjhZY1Nsb3hrQ0hhNGxUVDFFc1BZU2k4WXhUSGRKeWZETzBL?=
 =?utf-8?B?b2hFSTQ3d3VWT2NUbUhvRHJJUkZNRnlIak55d2VOR3NyM3crSUZrSGdBVExJ?=
 =?utf-8?B?UE5TTHM4UEVXVTZyK1AyTmVmUUhFS3NLYnBVSVBTRFZiMGI0OVkvR2RPWE9p?=
 =?utf-8?B?L2FVOWhESnNqOTVsNWlqekdkMTFxSEhZeVBObkx2RURURVJlcEl1ZFh2RGM0?=
 =?utf-8?B?eUpOcC9QTWhpWDNvUndkU09TcS83RVhGNWNnS1ltbTRJaVYyNzRIRnU2cXpj?=
 =?utf-8?B?ZzRpMmdtdVd6RVNjSzR4eTB6eWtuakdDSjh1VTRZYWZvRjB5VXE5UGxHZEtr?=
 =?utf-8?B?VlN0TUdvRXljcURhYXVlNjRkYnIwZll6K0pQa201ZFEvNGdNa2VUOEhGOXd2?=
 =?utf-8?B?aElMWDRscnJqeUY1VEZiZ1VtZFh5d0c5M1RkaXNJUWFzeC9zWnkvUXU1cmpn?=
 =?utf-8?B?L3NUSG9JbjcwbjFMOXJJTVZNSDFmWEYxbFZJWWJhNjI1REdKY1dKaU5MWm8x?=
 =?utf-8?B?Lzl5Y2lJditUUEFGNmx1czNmRFBleFlkZEppdDc1a2tmMTQwZ2tIQmY3SkRi?=
 =?utf-8?B?ODVBZE80NTI3ejlBREtTK2JhejJYdVQwRXNKellWRDJRMmQvc0NzeTV3SUlE?=
 =?utf-8?B?bUZ6ekUzaGhRcnQyeCtSWXF6M05XZnRHbG15UXBocU5tU3EyMndldkpLMTJ4?=
 =?utf-8?B?eGh4TFlkMzlaczN3K2kzVFIxbm5zWXF4WEQ1Q05yaUtNOGNzSHp0WUtCdE1m?=
 =?utf-8?B?NmRyeFRicDRoMWc1N3lXMkNReTFFREVjUVdIeFVQZFlkbnRQdkFnWGttdzlC?=
 =?utf-8?B?NXkzVm9Zays0VDJzS1lGMERHRVRZc1Q0Q2VLdVd1T250b2JuV0ZLV2ticHUx?=
 =?utf-8?B?eGpjTjM0eHlJTzBOcUpXS3EwVkxrYUlHWXRsTktzOUVadmxqRmpIRjdrU1Nh?=
 =?utf-8?B?MGJXTE04OFd2V0tKMUZ6T294ZlZCbEsrTWsvMUErMVhmYWVMaVl6NGo5NGpO?=
 =?utf-8?B?UWxXMy9aMUhRalR4OGI5YVhkQkFEQUFEbm1uM1ZVc3RwZUZCTGsyOTlsZmw2?=
 =?utf-8?B?N2RyRGZEMDVZN3VLQWJKdXRVZHNrYUpXSlZBeTNYNWhGS2dHNU9vKzNCR0p1?=
 =?utf-8?B?Y1FuemdJTnY4V1l4TVNVQmx6SEdaVFVTc1lxeHdWTFlONTUyUmo1OGhUdTZM?=
 =?utf-8?B?eTRQRTBjeXJDVTR5WnZueGx3RXF1UE9sbm54bm43WjZPWVVoQ1BPT0pkVGpp?=
 =?utf-8?B?dFNHWDhWUlUxdkJKNk51Z1YvVmdCZmlJUE8vZVZFRHFOQWQ1NVU1UmIzd3h4?=
 =?utf-8?B?TUpRYkJ6NDFUQlJlQ0FjK0pWck02R2NHNXZzQk1sdjJ0ang1VWp5eVpGMzNq?=
 =?utf-8?B?UVY4OGRFRXd6a01peUJYSEdYU2hyNkNTUkFnVDRVUWRyY0R0VDFIYTlYRm0r?=
 =?utf-8?B?UmhPSitqdnNoU1BTSk5iY2hNZjdUNjl0L3ZwVnBNUDJBRXQ0UUJUeGpDLzhF?=
 =?utf-8?B?d21mVEQwS2ttTGw4Q0xTOGM4YWI0MjVGTnA1am9ncU5MQzhpR1lVWjVmQU9C?=
 =?utf-8?B?bDFRaXRmbURDVDZFcTRZaGY0OW1JNXVmTm1SMjN1THVyNEZNekFZcUJKRXNF?=
 =?utf-8?B?RlYyRktrZ2xFaGRONmEwRzg2aXZ6cnFWTWhDbVQ2ZjRhUW5NOE5OWGpsODhH?=
 =?utf-8?B?d082eWMxWDlsaXJVNGo0eUNKM1VpUUdvTnRuSWdrbHNYQUtkVGxWait4L2Y2?=
 =?utf-8?B?d0lRa2pDZTVlWXdQRjhyOFgwUEQxZk1tYzhKZkRWcVlEUjBMUmk3NjhDeDhO?=
 =?utf-8?B?dCtKMnZVOXd5Tk9peWRiMUZid1NVcFZGWkl5b3Q5ZUs0clJQK2VpMjNKb0Q2?=
 =?utf-8?B?SEROZ3RqZ0R2a2tQOW9LNVRCUFFTbE8rR1N4VHZHVjYxbWc4bE9rcnpTc0xh?=
 =?utf-8?B?Nzl6cE9Pd0l0UkNHajlLYUVlYXRud0JrUHp6TzRxYmVXNWllcnRZUC8wZmpr?=
 =?utf-8?Q?9eWdQApqv0AiOGdWMOIiqmFPr?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	4ARhlMioAlJIAnFE/j7doNQGOhABKiy7PZaNIEVcQ8JhGi3nZTK5Y6cCtdT2BPi6Zw2ZCRvC7+x15R8wU1uDePSZTRF4SHPGwX0xMjtnEjODCVNfNYZTSsFPLFDuzbG71/OiV+WnvOnqqY6pm1f/j26FLR4136LYfhzydaNl4q1F+WVOlYauRe1tCw83CXZOIxZ88clHu83PNKK6HAHa7DhZ2B/86ydkqSlKBxxSAlw+Iv79E1jmLU6qBXqDBa7zqoEipHfN8D9pVn6b58v4zz8icGc6BmtmSPTMPDPz1jo90tt6MFfkn5qgIep/62vUtoT9Xi2eg0QGnRyLnusbH2U1uQqwzXUG3ZbcB5fjx94re0HoBfi75Usfvo18sUCitczb8a/r9IuR51QEU68FhwvQ8DiFnvW5Mp0ffwoP9kNlcioUH1/eMdAdA/Eg8uGhstdc4wUz4NCPBWTr5IEx9aO2GW2yQRQ6H3K/00kke3d3f+Q1C44ORIUYM6hbaRoLfJ4DZDjqqE+FiMCFT5x+vYrYjxZIdrX1QkYBjmDYoDwGsljPVT+3HRz7IwN8qztWFhqrJWn3WG9HGCPMbSWgOj8NuvQreW7CMazficlFyso=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 995c7eac-cb5c-4ba9-70b2-08dcb250d7e5
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2024 17:39:07.1206
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gIddtPQV/+UgKKBW+tfXCpMyls+mfvdgbDcj5IWzuErypkr81R+iCrRzDuyAXOhY9pS8SwUSP3kpRlHoA3pzhQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR10MB7752
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-01_16,2024-08-01_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 malwarescore=0
 suspectscore=0 mlxlogscore=999 phishscore=0 spamscore=0 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2407110000 definitions=main-2408010116
X-Proofpoint-ORIG-GUID: bHpR7wf8s_xBHvqnJOInkQrCkFkbfgbp
X-Proofpoint-GUID: bHpR7wf8s_xBHvqnJOInkQrCkFkbfgbp

Reviewed-by: Eugene Loh <eugene.loh@oracle.com>

On 8/1/24 13:04, Kris Van Hees via DTrace-devel wrote:
> Commit d9158b26 ("test: adjust err.unloaded_var.d again.") adjusted the
> test but failed to adjust the matching .x file.  Along with changing
> the kernel module name (and location), we can also drop the testing for
> the CTF archive since it is not necessary.  In addition, we allow for
> either gfs2.ko or gfs2.ko.xz to handle compressed kernel modules.
>
> Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
> ---
>   test/unittest/types/err.unloaded_var.x | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/test/unittest/types/err.unloaded_var.x b/test/unittest/types/err.unloaded_var.x
> index e8ad2e76..54c61d57 100755
> --- a/test/unittest/types/err.unloaded_var.x
> +++ b/test/unittest/types/err.unloaded_var.x
> @@ -2,7 +2,7 @@
>   # Licensed under the Universal Permissive License v 1.0 as shown at
>   # http://oss.oracle.com/licenses/upl.
>   #
> -# XFAIL if hysdn.ko not found (exit 1)
> -[[ ! -e /lib/modules/$(uname -r)/kernel/drivers/isdn/hysdn/hysdn.ko ]] &&
> -[[ ! -e /lib/modules/$(uname -r)/kernel/vmlinux.ctfa ]] && exit 1;
> +# XFAIL if gfs2.ko not found (exit 1)
> +[[ ! -e /lib/modules/$(uname -r)/kernel/fs/gfs2/gfs2.ko ]] &&
> +[[ ! -e /lib/modules/$(uname -r)/kernel/fs/gfs2/gfs2.ko.xz ]] && exit 1;
>   exit 0
