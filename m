Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D48EE2022F5
	for <dtrace@lists.linux.dev>; Fri, 18 Oct 2024 16:16:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729268171; cv=fail; b=Ju1ZnoHRPOVcqMIKnqPhtkjS0H81usuuoi85y9zKUX55yiyu9vyv78BPKVBWjv/Eok0Ok7r/8QmKCp5YFU1d8+14e5845bIxAFUFWjMoT3iIxEWgcLtjZtpPMsMM+dhh9KgpUa4puLoclS+Q5gyfvHT6hnaWK/Ezyukom2cNKWw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729268171; c=relaxed/simple;
	bh=0xeLdryD6sZ9BfodZUqeF81NgSzBZ8XhssSjixWyAok=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=fZTNat1cGFZ8O8pBWgVWG6thwBKtk0zvCdMPg2AP8v28hO7TRvsqWHHzF6Z/gKz+XtJGh3AbNFWSEgqQXKhVjRj9bU+i/BIb4lfmbP1lJAFY4JDW7KSPpZFMsuh+M7jupBqhMW4lsbV7C+O9NWTL+H4Gf6uWloa+q8tGZ/nacUI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=MpNP09yW; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=A3/6nOW0; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="MpNP09yW";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="A3/6nOW0"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49IEBgDU019346
	for <dtrace@lists.linux.dev>; Fri, 18 Oct 2024 16:16:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=y2ZiODS2w62uDf5bKCAYKejU0aFonGqek/UbNCG5nBQ=; b=
	MpNP09yWHiKcwEcvWJQLNT711HU4zkjxgONuyPE4QpZHDZ2N7rCGtUfty+nTXysp
	DBADt059M4DVqOz9aDS1rNPG3zdH05nTqGLYbgdpE9CuYX/fg8KYfKLDONM3EEO9
	87Y7c9E00tVUt5e+ywOEN3zUJFaRLcZiKaGZ1bVbSsid+l46ef4WjIyf6KZ/QkCE
	07ae7H0+TwB1DRe1g6b0q8UP+kacwwMAs5XBfX51KKapnJ24wQpt12Vf8o5pRxtE
	5BYTMin4sZAbKY3ihU+hBF4rRWeFR/R5Jr4LBHHJ7Qu7hriLbDQcu1ERqeZEhoCh
	EDRYozOwqjEtxsPKmxD0qw==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 427fhcrtsb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 18 Oct 2024 16:16:07 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 49IFdMR8014014
	for <dtrace@lists.linux.dev>; Fri, 18 Oct 2024 16:16:06 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2046.outbound.protection.outlook.com [104.47.55.46])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 427fjbrwg4-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 18 Oct 2024 16:16:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w/EryzAw2P9n2+e1CmV28GW4ElfRNcrDO6a92xaW6bUX87B2SK9cM0jj84H/RV8eCCal/Yprc0m5dlJXn3biQbuieSuy1kSYSVaaLXoDZBTVU5r4Y9xSkXQVMGCZsbKbAtLL4SEeG69VIWe2k2QlA+BHYSsVP0O095p3GHy8/NTbJM4HUAS9eqJ1gGy5Xqji/Aq3uXZ5/hCkr8cLzIQm6bG70FYXOM+IYM6HGTPgyGAmiH4pkkOPKFpbEVAYVLgzdS56VCk5A1fR3U32NiO6DGGIMk3TZLYORxyq6c+zWu8UnlTuNpkzhXUe3CHg8xzvbCcL24E111JEyYbzHdjsnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y2ZiODS2w62uDf5bKCAYKejU0aFonGqek/UbNCG5nBQ=;
 b=GV2fFxv14ZQFZZVFhDgCuydTGqDeB41xrkxA1yFX9BQlQlCfaYticDboET3uyr+du+YE2dA0v2qDZwERqZkR0lCV9R8KIfdRNKoB1EKMu41NyPBHBLYrhKes4tfNUfVr7q3Bzo85D0hSUtbpJM3aKB479G8jAvn98OIZX95ins8nRIiR3oYmvAfu6uanvti9N42O56E/9WMa+4ZFm87mDxTMJ1iyWSNCz9uiXHtyBJPIimXttpcnhKFccMB0YtGJlv5u8qD0YHhlzvnhR6RN1jngGCfht6GdbTo/5wAc+ektbqD52TqBGR0oAVUiv6yTRHRqAQ8eMqHuj9wYhDesJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y2ZiODS2w62uDf5bKCAYKejU0aFonGqek/UbNCG5nBQ=;
 b=A3/6nOW0/PWB7Fwk4/Uv5XPDwu+UQudK8jz7vljYS6AxXb/kTcit9TMndTOH4QKfl0DnppefWFMI6SpTZZ9AMx8Zlvk8LhpvUWyq7fBfnB6euLrqEdEUSgMAqqPtAIfXsPlcMpd/5PNJYLMiw8UoJb708hP6T1/61TQk0fvlSKQ=
Received: from BLAPR10MB5267.namprd10.prod.outlook.com (2603:10b6:208:30e::22)
 by CH3PR10MB7532.namprd10.prod.outlook.com (2603:10b6:610:156::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.24; Fri, 18 Oct
 2024 16:16:03 +0000
Received: from BLAPR10MB5267.namprd10.prod.outlook.com
 ([fe80::682b:c879:9f97:a34f]) by BLAPR10MB5267.namprd10.prod.outlook.com
 ([fe80::682b:c879:9f97:a34f%7]) with mapi id 15.20.8069.024; Fri, 18 Oct 2024
 16:16:03 +0000
Message-ID: <d8aeeabb-fc53-44a6-9f8c-c5b3a1d8ae40@oracle.com>
Date: Fri, 18 Oct 2024 17:15:59 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 dtrace 0/4] kprobe support for .isra.0, sched fix
To: Kris Van Hees <kris.van.hees@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
References: <20241016155409.4038017-1-alan.maguire@oracle.com>
 <ZxKBrsZZH0hV6cdD@kvh-deb-bpf.us.oracle.com>
Content-Language: en-GB
From: Alan Maguire <alan.maguire@oracle.com>
In-Reply-To: <ZxKBrsZZH0hV6cdD@kvh-deb-bpf.us.oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P265CA0164.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:9::32) To BLAPR10MB5267.namprd10.prod.outlook.com
 (2603:10b6:208:30e::22)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BLAPR10MB5267:EE_|CH3PR10MB7532:EE_
X-MS-Office365-Filtering-Correlation-Id: 020f592d-d8a3-4b2a-ced4-08dcef9029a0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|10070799003|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?anZMQXlNdUc5VDBiVGlmOG1LUEtGRTZKWnlNTXhNK0g4cmVUUnI4YzlzMnRx?=
 =?utf-8?B?UTg5d2toemw1MlVWMWZCeEtaaHptUkFKQlFnTFBuZkE3SzRLQjkycVlaL092?=
 =?utf-8?B?cm4rSkhtVElKZ1RwRUthSjl6WTAxbExUdS9lVG1qMm8zVFFETHlYVFJsd00x?=
 =?utf-8?B?T1FrNnczL1ltcmxIV0xUOUdIcGkvT1B4V1ExTnVzdGc5K25tbmxITXdmQ3hs?=
 =?utf-8?B?M3hQSVlLaXM3ZG9NTVhwRkNMcFE5NEc0WGp5Z3EveE9USjFSTWRsUDQ5akw1?=
 =?utf-8?B?eUREYjFxUG9tMVl4RmdwaTM2Y2NXRzRUYjRuc0Y0MEdXc0MyWEYvRUVvWE9C?=
 =?utf-8?B?d2lWUGhnTG9CMUtjKy80RXNKZnVSdk9rUVk2NU1IZlpCZ2JxOGFGZ3pCV1Av?=
 =?utf-8?B?TjlFSExHdXdlQWJMejl6dmQ4NUhUdXY4VUhTK3V4c0ltK3lLZE9hWUtYNllo?=
 =?utf-8?B?OTdTR2l1VCtVUEkwQnBZcnVqUUZWaXdhMmk0bzNjLzkrNnltdmFaZnB3d0Iv?=
 =?utf-8?B?ZWFFV0wyYTVQeE9PNWhPQnhDeXlvQllMVXRYTWJ3Mjlvb3dEWDZheW5xTzBV?=
 =?utf-8?B?Y0FzcVo1akV6eDFEeGlPMXcvclYwMHQrTlNURTFyY09XL08vaEtZQThmd2VJ?=
 =?utf-8?B?RC80RnFrR0VDeHI3c2t1UHZ1T2VxU0w2OWZyZklrakh6YjlpY1daNzl1ZXZF?=
 =?utf-8?B?VEpleFRtYTB1SHhqL09jVkxOOE1jL08vTWtPUmI2M0RFSG4rOXBzdCtnYTMz?=
 =?utf-8?B?QjBOUHRicEtJUlhQWnU5T2dCSWlFSm1PL3RtNDQvY1hjTDNNeEdUZkpXZ3dq?=
 =?utf-8?B?TmdQa1BMSm5vOGhsUTRZeE9CaWhqd2hJd0I4dXdHUmdIZUY1QXluZ1d5TzBx?=
 =?utf-8?B?SmZBQWxxT0JRa0hMakZDTlVvNHZ5NUs0MXF2UmxGQUFlWHRoYXhmVlgzVkJZ?=
 =?utf-8?B?eVFQWFI0TjdSWHVhTFdtb0hoUVVoSmhzdjJrOUFTczZ3ZXlQZEorSkl6ZVA4?=
 =?utf-8?B?aW5Za2VJNmJQbWxMUUZzbzBRc1lsc0lNUUtMVmlDN2RzRVdidVRaTG0xUmR1?=
 =?utf-8?B?QVVOcnNCb0NEaEtTMTUwUnBkVWFFdFIyL1h5cFB1YzViamF2SWVJQ2I0aytG?=
 =?utf-8?B?SHlPRWxxODBvUENJNnpJUFFkYVFoL0E0a3hTb0hYVUdpaHNMZS9kb2oxbU1K?=
 =?utf-8?B?YWkrVDAwSmpaREZVRWRwd2hsYmpuUVFkWncvV2VIOFpFNGxaNzhmaHJja0RG?=
 =?utf-8?B?Q1A0bWtXVXNMUkZCL1pVUFdYYjJiVWx3SEpubVdUUFVuK2Zqa1MvRTlkaTZV?=
 =?utf-8?B?UXNnRjZSa3MxY09qQlhmWDd5TnRIRnhEUFZXYzd4OHRzOXVtM1JzSzltLzJa?=
 =?utf-8?B?aWM1azhvMXV2RjNtajVzQWdRaGszWlliUVQwVEczVEUrRmZ2TVlMdlJTQWwx?=
 =?utf-8?B?UjBISDBXTFZBT0tNRWVGem5GWDJEYWNmSDZ1Zkp1RG14VFpGZDlTRG9yWVc2?=
 =?utf-8?B?WGw3TnEzQ3FpSUE4cVpyR1g2TURmblJ1YWFydWFEODYrY0xiKzlUbXExMXY3?=
 =?utf-8?B?SHRTVUljS084c21EaW1PVWxjOW5YUWtsYk9ST0svZG5VLzJsMHllR3hMNEk3?=
 =?utf-8?B?eVRaaTBXeDl1R1hLRWxlSEZ6NnZmZzllYW5CWGp6c2tuY0p2STB0L0hpWWJI?=
 =?utf-8?B?aG5rR0lqWHF0SVJZTi9RVHZQVUdhYkNQbnFEVUZIMXg3WktMclNWSU5BNnZk?=
 =?utf-8?Q?PffW/EvYzjSG9lYUoFX+VCnMhnt8iiw2RU6navl?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BLAPR10MB5267.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(10070799003)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?elhzMDZ1TzRBY09RWS85Y0JEV3NmRC9aTi84dVNtVVk4d2pNL1lWSUdpczlO?=
 =?utf-8?B?VXJYUzFoc1ZDTXZ3VnJVMHozeHJ6N085MnRnd2h2Y253YjVKZmVxSGV1MG16?=
 =?utf-8?B?RmpmcWlleGUyYkI1MjV5QktkeU84cVBIR05HMTdQRVlMZjBXL0JZM1FpREJV?=
 =?utf-8?B?RXJ0c0JOemM5aTlRa1Q2eHI2c3d1a3dRR3hpMDRLTFpUdzR0T0hmbTlHT0Uv?=
 =?utf-8?B?SkFmbzk3dSsycXNxK2VTWGd0ZG53cXdzMyt3dWpCNWJPcjhIV2lZMEhQQ3lo?=
 =?utf-8?B?YUpjSWNMZkM4dytUM3F2WHlYa20zaGlxQkdIODhpS0NxQnFDM3dGTEN0R09R?=
 =?utf-8?B?OTNsS1BkVXBKbGVkdXRvVEswQ1BEdlhrK2dmNGpQVnk5eE1Tdm5KQkdiMEdw?=
 =?utf-8?B?V1dCOTNoSWN0ZTd0TkhaRENLMkpnNDh3UTYwUHJRNGFKOTk5RmNUWGVtM0hn?=
 =?utf-8?B?Y2hiRHV1TmRCMytqVEE0MUZUaVVvQWhyQnZoK2RoM3d2aHVtNVZkcldEOFRM?=
 =?utf-8?B?YVJMMjhNQUZmV05lazFkNUE2Tkl1MW9sb0JpcEYrdlZiVldDcVZWWmsxR0JO?=
 =?utf-8?B?OEVyUlQyMnJ2SFIrSStLclcyaHpKSDBJbFlsbkFrMS9hT1hHYStVRitIcUVJ?=
 =?utf-8?B?UklhSFFpcjlLZ09hM1RGWGpNbUFPemtkZGxuTUNwR254c2RTaWN3SXdRZTh2?=
 =?utf-8?B?UVpMaW1SSVdwdFU1aEUrdHVCRm9iODI1VDhqVnRJY0RHd1BXUUplUUJNdVRC?=
 =?utf-8?B?bjZCV1BENGdoeU1kb1RUUm1CT2MzU28zTzRwODVxSGRZNlkwVUEwOVFUaFdU?=
 =?utf-8?B?YVN1TXJzUFFyTVVBRHZ3R2xFTWpRQ0VtQU84U0ZDVmJ6b1JCY1RGMW9GVWJi?=
 =?utf-8?B?RVFoSmxxanpNOXA3NkJwUDhkZ0orcUNuU0VSKzlsSUxqQmZqQTZ1UFgvQkpz?=
 =?utf-8?B?WFloOE1qcGpmSGE5WUlUYTFQTjVYRmV0dzRRaDFrN3V6Sk0vNHc5a1ZYMW5r?=
 =?utf-8?B?OHV2U1pGYUFxY0lNTGloRjAzemFyaDdwc1RWcmthOEZCV3d1clMwSVRrMWtZ?=
 =?utf-8?B?eXlNZmJZeWdzbHROWWNIcVhRN1FRaWc0TUhYSHJDa0Z5YVVDeW9nazkzK2dN?=
 =?utf-8?B?RXlKT3FVZ2xFeEJDckRJNjdXaEV4dWpZVlBzUUd6RDhlZlFyd3dDRFBLSjRh?=
 =?utf-8?B?NHFtdnI2Mjl6cTJoRkJLWWhJVklLMmJkTVVzZXJ0RGNnQU9Ba2FKcEpvc2Np?=
 =?utf-8?B?cndoSlJtL1VrclZTKytrNkF0djVwa0pTM29wU3YzMTBVWEVibjlJZTg0Yi9O?=
 =?utf-8?B?cVI2VytCRENVQTY2ZHhZenhrY0gzVEl5OXpTOU1TQU9BZ3FUbWZ4TFhsWldQ?=
 =?utf-8?B?dzdGQnB5c3RITWhMeE1SUXVtbkhQUUJLczV2QkZWdVFXSG15SU1DNHZrMXF3?=
 =?utf-8?B?aHNQdHA2aCtSYVBEMWJzNHZaWjBNazB6cEtJTUpvNXJlYUpNbVZDanlRMDMy?=
 =?utf-8?B?bm1JTTFJejFqdmN5QXZPWVpYVzZrQjd1ektmZDg4RGpBcUhyelVhWFVHaVEv?=
 =?utf-8?B?enh2ZkE1K2hwTTRRRDRVdHZuQVY1akN6TW1ieGJkTG55KzBVSDh6eUVEZWNv?=
 =?utf-8?B?RlhyVXgvR2pEUmVnbHJwSW5iMURvNTkvcXNsMEpOUUtaYVNFZzJ0VW9QbDdn?=
 =?utf-8?B?cjEzbWJReThScTBVaHprUjBOc2l1Q0hlVTg4cEdRd1M0RHBRdi93aUgzY2p3?=
 =?utf-8?B?MGxzaXRtQ29VZVpGMEtodjg0UGpzOWpQOVJwZGhGYTZBTUJzOU0rcUJyWHhP?=
 =?utf-8?B?RjZEbVJ3NnE5N25CSHBvamhqenlBZXhxWk9TcDZZWTl6UWZnVmVOd1U1WGxJ?=
 =?utf-8?B?NlorMTFmNTA1NHRTVURhT3VyUzFiWkZEVERiTTVMMXp4N2N2bmtNVldyRHJo?=
 =?utf-8?B?VnRMaFhoNGt6TDkzaFdkZG9nRWkrOU40VUdaa0ZjT3g0V0t0aXBrYXA1TktZ?=
 =?utf-8?B?MVJORElkR2dOT1llSGNVUndkVnpOa3ZiZUZwMnJPazI0cjRIYVhVSmdjekpO?=
 =?utf-8?B?QnV2YUNHN0tiUEg0RXU5WXQ5VHRsT0o5K0EzaUJWVHE0VzVHT2pOVUx1ekxC?=
 =?utf-8?B?dldMaUtQUnkzMEFFSUN3UG1HeFNsNUNYanJsaU5CSFB2aW1jTUhmMmcrSkFl?=
 =?utf-8?Q?XPvNFUnUkH5K7VHqaG0MQaU=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	7hPYPV3r0ZFyssqLGWkFN1gS9AOTdsfDAvkAVhLfjq25+3q448QUYRzjbt5Mq6Q3qBynRDkC80tz/MCKYn024e+exFa1574Ikf24QHMKSInvieoFxmwFse/RN1x3pQpZSaBWTT3ggrOn2Triw9eUnHFhWKTNmo1aYhr7101enyR7BqTum1dZf99Nvb6wYrgMItIABER1aEvnJKTl7Ozafd4FDW0R8euItefQsV7XEvn1Dj9vrsZRFfQgHtbupCwwNZ5/+EtQVbkdwbSICa2NZ0yjxzMUYTHVYAPzcbPaxPyRxwPT8zO7sv8MZ1yupf5CkqErwigK2DGPZbKL6IsEKRIdnYpzRzZLPck99fGLSu55aStgVDEI54AnuDWDyQ3OQQX9MoqE2nQXL7In0WXGGQmskPCfmA0wjOcNSFRMn9oYEVhI3BZh7MdvAZkxOYroKvD+L+XNNWzyBJLllJAQt2W1NcKEPife7br3r4TBizgpG48Sbm+TqMpI8LioYyomUjzX4Ciee3yD/Pcss9BLm6d3zHF+G9q/S62QnnaUMTnyw9l3bPAdNMaXjddRCwk+WPt35ftKS1SCWUI1OiL4O+i+LN0n31o+8whb9CwRroY=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 020f592d-d8a3-4b2a-ced4-08dcef9029a0
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB5267.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2024 16:16:03.4540
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z1ae2BAv+fa959HYaTCmwgcSzx7SqJnilgsX2nI0ilz7zjNCk3iNv72pbjqdpNG06wTXSczkUEdbsChDeeWJMw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB7532
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-18_11,2024-10-17_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 phishscore=0 mlxscore=0
 mlxlogscore=999 bulkscore=0 spamscore=0 suspectscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2409260000
 definitions=main-2410180104
X-Proofpoint-GUID: b_RieUmJGGJCE1RmS06F7sH20xrYa3Pe
X-Proofpoint-ORIG-GUID: b_RieUmJGGJCE1RmS06F7sH20xrYa3Pe

On 18/10/2024 16:41, Kris Van Hees wrote:
> Before I review further, I have a question...  Do we need to consider the
> <func>.<suffix> symbols as separate probes from <func> (at a user level),
> or can we group them together?  I am hoping that grouping them together
> would be the preference if only because the suffix versions result from
> compiler optimizations and it is therefore likely that a user would want to
> be able to probe <func> and expect it to work even if the compiler decided
> to do something under the covers that results in a suffix-variant to also
> be created.
>

Right, that's one of the changes in this patch series versus v2. We
expose the probe as <func>, even if it the underlying function has
become <func>.<suffix>. This provides more stability to the user and we
are guaranteed it still represents a function boundary because of its
presence in available_filter_functions (this implies it has an
associated mcount-tagged fentry site).

Alan

> Kris
> 
> On Wed, Oct 16, 2024 at 04:54:05PM +0100, Alan Maguire wrote:
>> This series is focused on solving a few issues with fprobe-based
>> attachment which prevent us being able to attach to functions
>> like finish_task_switch.isra.0.  Such functions are present in
>> available_filter_functions, and represent real function boundaries
>> (since they correspond to the mcount function boundary sites)
>> but because they either lack BTF representations, or because
>> those BTF representations are named without the .isra suffix, attach
>> via fentry/fexit is currently impossible.  Falling back to the
>> kprobe implementation is the best solution here.
>>
>> However, for stability, it is best to represent the probes for
>> these functions without the ".isra" suffix, so we need to store
>> the full function name (with suffix) in the tracepoint data when
>> the probe is populated.  Patch 1 supports this.
>>
>> Patch 2 ensures that we use kprobe implementation for any "."-suffixed
>> functions.  An additional fbt provider with kprobe implementation is
>> created to support this (so as not to  disturb existing fprobes for other
>> functions).  At kprobe attach we use the full function name stored
>> as tp event data to carry out attach.
>>
>> Next we need to ensure we do not end up with a mix of kprobes and
>> fprobes.  Ideally we would do this in a more fine-grained manner, but
>> for now just ensure we do not have an fprobe/kprobe mix program-wide.
>> When fprobes are active, we will only use kprobes for "."-suffixed
>> functions that are used, so in practice such mixes will be relatively
>> rare.
>>
>> As Kris pointed out [1] at compilation time, trampolines have not yet been
>> set up, so we can replace the provider underlying fbt at that time.
>> The probe_info() callbacks are used to check for a mix of kprobe and
>> fprobe implementations; we check for multiple fbt providers which
>> have a count of used probes > 0; if this occurs, switch the fbt provider
>> using fprobe to use the kprobe implementation and reset any event
>> ids associated with fprobes from the BTF id used in fprobes to 0.
>>
>> Finally we can then use fbt::finish_task_switch:return as the
>> dependent probe for sched:::on-cpu, as we now can probe it even
>> if it becomes finish_task_switch.isra.0.
>>
>> So to recap:
>>
>> Patch 1 supports storing/freeing event data with tp events.
>> Patch 2 allows tracing of "."-suffixed functions like
>> finish_task_switch.isra.0 via a kprobe-backed fbt implementation.
>> Patch 3 ensures we do not end up with a kprobe/fprobe mix.
>> Patch 4 then uses the fact we can now trace "."-suffixed functions
>> (with kprobe fallback) by using fbt:vmlinux:finish_task_switch:return
>> as the kprobe dependent event for sched:::on-cpu  . This function is
>> often optimized to become finish_task_switch.isra.0.
>>
>> Tested on upstream, 5.15 and 5.4 kernels.
>>
>> Changes since v2:
>>
>> - probe function name exposed drops the suffix (Kris, patches 1, 2)
>> - restrict kprobe use to "."-suffixed functions; this makes their use
>>   less likely in the fprobe environment.  Do this instead of creating
>>   a "fake" fprobe probe with kprobe backing (Kris, patch 2)
>> - modify fallback logic to handle kprobe/fprobe mix (patch 3)
>> - modify sched:::on-cpu to use fbt::finish_task_switch:return ; no
>>   wildcard needed now that probe function name is unsuffixed.
>>
>> Changes since v1:
>>
>> - simplified approach by just swapping out probe impl when BTF lookup fails
>>   (Kris, patch 2)
>>
>> [1] https://lore.kernel.org/dtrace/20241009140236.883884-1-alan.maguire@oracle.com/
>>
>> Alan Maguire (4):
>>   dt_provider_tp: add optional event data, freed on tp free
>>   fbt: support "."-suffixed functions for kprobes
>>   fbt: avoid mix of kprobe, fprobe implementations for used probes
>>   sched: fix on-cpu firing for kernels < 5.16
>>
>>  libdtrace/dt_prov_fbt.c    | 138 ++++++++++++++++++++++++++++++++-----
>>  libdtrace/dt_prov_sched.c  |  23 +------
>>  libdtrace/dt_provider_tp.c |  27 ++++++++
>>  libdtrace/dt_provider_tp.h |   8 +++
>>  4 files changed, 158 insertions(+), 38 deletions(-)
>>
>> -- 
>> 2.43.5
>>

