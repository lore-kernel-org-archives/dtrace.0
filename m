Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3D6A17C220
	for <dtrace@lists.linux.dev>; Mon, 11 Aug 2025 20:52:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754945574; cv=fail; b=Z5NkmqChkwdNTYXuDlZQy3FwqDcnTMxVEuTd8OZ0pNIesB/IwuWMod0MV2Z99Bm9yqHrDLMzehW35qR9fh1GJFVMuHYSSNyAO6SQQaOS8Hi+JQA+DsRir1udA3UX1HV9j2poQIW4ckB2JsH6xiKKW5L3k8PUo8hsZCFXM2mVf14=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754945574; c=relaxed/simple;
	bh=Cfk2jsx8IzNTPBfEmMbqm9jyhWbiRR8SxYLXdHiPK0M=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=jfQe6V2t0eajvNofXh/XL3RsXkr7vXoXctefc+4B5yLtmo5EG6+f32r+ha3SXzCBy/ebR3w5QAEyVEnUsQTVkaF1GaBemY0EAq7zk53KvK3yG7oGQf8j9tDwc7aA+I2iARjh060GTjXrAseYvNWcwbv98muuhZZ7FM0l1YVSLpE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=qaP3/fEP; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=UI1aEgNt; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="qaP3/fEP";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="UI1aEgNt"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57BKiU8F016712
	for <dtrace@lists.linux.dev>; Mon, 11 Aug 2025 20:52:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=YN8OmLFlWJrfu7rP6+YRcrlzahmaoVPhqNt6sIFCkcg=; b=
	qaP3/fEPQjhGow3ghpDt7K3ijNaZ8mWHKuxtQPP/59AKZrozGyde/UmDwV1x4NM1
	ii/9DRVEJ6DNmxH8hG+4vWOjZOD5VzywXMAtJEm9F6U362TBsqngpQMK0M9jykjP
	eLcv3KcIMLmRlUsfObfzwi8DL06amH9pWsY0MdVsq/Prmgl60gMbr+htxyp4WjmV
	mBBvSv43c+UUi+k6jw+FlE9xA5STTM8qOnIEbZxjEwvfyV/RHoeCS2FtbSeKbe39
	gXVW/dLZI9vOntC4p/Yx3LbGtS42nKQiZ1w2yf1Qt0dSr9gYHvV9cvfER2lDP4m2
	HQUX2cK8rSy1aee4D4wnQw==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 48dw8ebf97-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 11 Aug 2025 20:52:51 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 57BJLiM7030131
	for <dtrace@lists.linux.dev>; Mon, 11 Aug 2025 20:52:51 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12on2082.outbound.protection.outlook.com [40.107.244.82])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 48dvs94yyr-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 11 Aug 2025 20:52:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DCqXeR2AWUG/Mc9++UhFUlpCZDz4Y4g2uw4BZ3XWQeTZesUpwUT7MdkcltWZwfInJu6gSaY8/zd4OG+uYX6a6iHaWGCBDK7msjvhIk3DbG8K8NVr5gstogdn5HjhZe5SsVTsJj2KRU9fiMX+Z85clT2K6z04Q3go93B7KSX0OCjahGdXOYJrUrFQqyNA7zOuAB4tUe5UdSR8PS0vqZVVLRtGte++3/fObNEimym02DfuY+JsO8kXVsVHY4xbqg8079yiw525TDUzALG5hzw3yXumquSKNv7pLkocW3W9Xc9OM/S0NiLihRIaAMBx1TT4BzWmiJvQrLtsW7OdXLrWjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YN8OmLFlWJrfu7rP6+YRcrlzahmaoVPhqNt6sIFCkcg=;
 b=Orbd+ZN3XCBEEAlkoj7aoGzUPUvpKSNf9dt8CfnJ+9TQEXTJbBFup3lB6axaf5wCtM3Rtf4IzyErL6wSj4jadPXqkOuHykMBKUiqakffcsUn+dnET7SLmNbgHAygpZK2AMwb1iPq9D/dnx1iF7pi8kANFGhqaPNq7OKP/kEcDrbM6VOK+agsaFBjhbKajIijVoqtHnO2ZVBHQcJOspr2f+e1qx2aXgkMC1jdAfgnwKOzBi2U1y8IGtwZ3nl9ynh0Of1lBvlF6LTADO3pnkc2a+cUt/Q7Owm71/cDIL2l5EOzdDc87KwgSk0ERiSnxOce3vrcKKG6YN8PBBpoYB4p1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YN8OmLFlWJrfu7rP6+YRcrlzahmaoVPhqNt6sIFCkcg=;
 b=UI1aEgNtR9Tj/hd1Tngg72B9GORD7gCzKYLJ/EW+t4woSyM4WBy0mmB25ye1GxKwydJ4iVXAtAXHQMF3Qmczp2z9oT6VvmkITLaaXYVWqlQ6FXP2zgwoMXEQVlz4/A+isk44x08nYVLXcdlDhh3YljdTeJs4D3rM0EQPcR4gNIo=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by IA4PR10MB8448.namprd10.prod.outlook.com (2603:10b6:208:560::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.21; Mon, 11 Aug
 2025 20:52:47 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%6]) with mapi id 15.20.9009.021; Mon, 11 Aug 2025
 20:52:47 +0000
Message-ID: <c60dfe7f-9107-dc90-eed3-1a5afe6fe93a@oracle.com>
Date: Mon, 11 Aug 2025 16:52:43 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH] No uprobes on ARM autiasp instructions
Content-Language: en-US
To: Kris Van Hees <kris.van.hees@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
References: <20250610211042.20522-1-eugene.loh@oracle.com>
 <aJouQe8qUJSIPKD7@oracle.com>
From: Eugene Loh <eugene.loh@oracle.com>
In-Reply-To: <aJouQe8qUJSIPKD7@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MN2PR05CA0031.namprd05.prod.outlook.com
 (2603:10b6:208:c0::44) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|IA4PR10MB8448:EE_
X-MS-Office365-Filtering-Correlation-Id: 28fab977-8ffe-4bdb-3377-08ddd919071c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TmY4VzQza0xvSTlEL1dTSXpVUGZnZ0s3SEM2QTRJTWl2aW1YQ1lSKyt6dVdU?=
 =?utf-8?B?Y3l2MTg3THNBR2VHV2xRNnozSHd5amR6ZWYyY24xRmZUNXJqZmZVVHY1VjBP?=
 =?utf-8?B?OG5mOEIwMndIbHl4QUhWUFZDeVlnQ1dnYjBjYVIrdXhnSWJMeXpWWE5sUzJ0?=
 =?utf-8?B?Unl3aFJjMG03UTFKOG9Yb2tHRnNEODlXOWFZK1pIWmQ1UDE3bGJ5VVZ0WXJI?=
 =?utf-8?B?V2dWYWRqNVU3d1owT2ZjT2owSkhFbVEzMFUwdlp5UXFqOXJjZkphcGh3S3dO?=
 =?utf-8?B?Vk1zaUIydU1MRXRhU002TVhxWEsxQnFUN25wbXpwaG5EcTlQaWdGUzcvNmtL?=
 =?utf-8?B?MHN0QWdJTCttSFd0bU03OUFDd1ZlbzJHeVo1Q3BkREtkRlMyRVpQMVRqZ2NY?=
 =?utf-8?B?R1RPakd6RzBWdWhTTFB0ZVNjUHpMdWwrV1JWTXdMSXFLSWdzdVZFblhaWUJy?=
 =?utf-8?B?by9QYWVPZHgrS3lkeGtrVG5IY1hWRGpvWWE2SWdtSVZWbTcrMVhaTnBGb1NJ?=
 =?utf-8?B?Q3ZFTzhONTI3OXlsU3d3OTZ2aTFpTGJtUGZpYzBxemJWSmJXaWdXNllXdHNy?=
 =?utf-8?B?bHZ1VzRqazRpbkhTekFSQjN3YVBXcnpWdWRvKzVCZDUrcWY5Y2xaKytmTzVP?=
 =?utf-8?B?Qjh4dHZRMGVHRkdiK0dVWDhEUW1tamFJUHhBb0FOQ1prOGkvQ1FTSXFGR0dJ?=
 =?utf-8?B?T3kvem1WVTN5a0wzZTNIaFVHWDZ1UHVHSUpCTWcyNmRGU05BOE1Id3Rjbktz?=
 =?utf-8?B?WjFKUjZzWUtQVCtySk8zU3lKUG1WeGdiYlFVMkhUbVBwSVB5T1JNSFlLZ08w?=
 =?utf-8?B?bnlsMWh3QWVsQ2ljUDdjd0piVUxna0l4Z3dnQWlGQ3dBNVpKNVRMK21tc2wz?=
 =?utf-8?B?ZlVQa3dRbWttUVQ1NmNJYmtwSTFRMVhNci9ZUVBnaVpQYXFlK1ZqNGxWbWNV?=
 =?utf-8?B?eHRHZnhhbFZQNTZWdm50SDVwRUtsQ0s5OVN2Q3VPLzBzMlhFb3U1MG5BSnAr?=
 =?utf-8?B?K2x6ejcwSXVkVU1QbHl5d0dkdjY5TXdSOTM2OFZPK1FMUWRVWVZtM01UdHNC?=
 =?utf-8?B?ekxYMXdjU1U4TTZpWlpxeXlpb0htK1ZQRkFlNy9uRHZwRk9ncHU4ZG5QcGtv?=
 =?utf-8?B?MFllZDRKYm5OeWRLOVhYMlJIRG5RYnVOcy8waCtzQXFrb1pKa2FYaEI4RGdk?=
 =?utf-8?B?V2xORE9mUVN6cG1FeGhJYjdVRjRULzZyYVBYOG1LdDNpMDZmeVlzcXZCbXpl?=
 =?utf-8?B?TlFxcmF6SnEyWUJUZ1NEM0tvZ2xqejRuaE80ZGp5VzNBZm1nTVFXKzhodFBT?=
 =?utf-8?B?WlhUYmZaaFVpZ2hEMGx6ZEdzQkdjL0JNbGhYdWhNYjB3Y05vTVZseXpDWHZD?=
 =?utf-8?B?bFdWVENBZ2w5cjRaVGhwRjUzWFZzWXFHc2RWZ2FYdnBjWGtMM1orUDBESTUx?=
 =?utf-8?B?cXE5eHBWejY3Z3hmYlgxMXN4czV3Y2lMZE1YZEJxZ1A2U3BVekxxRU1Oc2h6?=
 =?utf-8?B?ZDA3QnNGOEFhN1J6eVRGVnBuWlNVc0poTHdLSjNrTzNOSkFtaTRpQTRhMFFQ?=
 =?utf-8?B?L0lIc0plOUMwVS8vcFdVVUdPSVdmcVE2YVRHbW1HOGZtUGhzWjlrcnArb0hM?=
 =?utf-8?B?alNCeGZsTFFqRTdIVVM3cFFMcVZROEhyRnlmcVRzMlNTczk1WnN3dEJua2I0?=
 =?utf-8?B?VTg5eHU5UXhNSHNxUGJXNzdMVWVsRXVuUk5GenFzOWFOR2tNbUJZTmFIczl5?=
 =?utf-8?B?NG1oSVgvcURjcC85SjV2a3ZmV2JMU1JDM2Y5QTNUYnpGUVpxWm0xMEZSRFhN?=
 =?utf-8?B?WlNDUUJZUEV4bVNLVDV2WVJWVUxIQ3ROVEM2amZFK2Z6SWlLOUE5bysxVnhy?=
 =?utf-8?B?UTNhdmtxZ1RQM0MzbnAwUkVaSG4vemdpZVgwVHFGZ21va1RNZ0VqVHJwcHh2?=
 =?utf-8?Q?rpS6fludEyg=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?L2RaM3ZmVS82QkkyVlV4WmRHUDZBVFR3ME1ab2VVL1h3OTRTaDdCZ2pBNnd0?=
 =?utf-8?B?YzlTYW93VzlueUsxYUV1U3ZBUS8rcXRKMjVmWmllblI4M01Wb1ZtSFdQZXhh?=
 =?utf-8?B?REg1MHpqSHhxK04xWDRhRy9QOFFFbHRNQXA1RHQxWkJiYzczbTd0SGVnL2ww?=
 =?utf-8?B?VC9yQWNFMWdJb2J6dzF1MFMyYzV4b2dySTVMbWIvQ3pKT3diL1dhUlh2QVVp?=
 =?utf-8?B?NllwOTBzaFlNblhSSUpCY0dESmVXMU9zZDJNRC91WTZRcGZHZldhcVhZSHg4?=
 =?utf-8?B?ci9CMU5wVHNQbTJjUGcyYjFUa0lzVmdLSEV1ME9Bd1BUZjZYUi9zL0RsU0RZ?=
 =?utf-8?B?amo4aktHelBDdkF3MktIOVVZdWlJTnl4cWgzaTZlZStoa2FxTzZMekdlVWJw?=
 =?utf-8?B?cG1BaVoxdW9NTzdNM1MyZEsvTk5IR1RaYzBSeVB0UWlFMkoxUDNYdlFxdUcw?=
 =?utf-8?B?WUVCby9NQjF4eVNsUXJKcEdsaXFqdzI4L0tCV1N4SVk5YnQ2TkdCdzFFTmlE?=
 =?utf-8?B?TkFRQ3ZaOFd1YU80Qm1WUk9BQ25FUzdpSFdVYWJPNml4RlVmKzJTY0kwZmZB?=
 =?utf-8?B?T0picmt0WXEwNU5WWDYvc0hxY1RwQWFyQU1Lb1pXY2JyZGt4RFQzUEhEVFF4?=
 =?utf-8?B?Rm9KSWNERitQdzk1eHhsN2FrUk9OaXp1RFJibk1wSmxMV3hCVE8ya3paYUNx?=
 =?utf-8?B?NFc1aW9MRTlXZk14ZkZkWnJQNlFoQTdvbStoaHdkZGRQeVI3eU9ZQUcyM0dE?=
 =?utf-8?B?YzBKREhjSTRSdjZwWTUrQnd6Um0vRzB5aWpncVBRNUdHUVorNGlRcnBzTGdM?=
 =?utf-8?B?V3Q2Uy9qWWxiUmVsTHdBV0NNV3oybTJlMytqNnc5TzNJNjlHeitESVlRdUVR?=
 =?utf-8?B?cHBHdWpEYkJsRGZONjZ4djNyYkVhZ1I5WlpwZy94NGYzOG5kWHI5cWw5UFhT?=
 =?utf-8?B?YjF5T1hzcFBDRWE3bmJOcTdwdTE0RnZxTjIyWC9NWmtvMXlyMEJOR3d3OGQ0?=
 =?utf-8?B?MUkxOFBydEVtbHcwa0FqaHhOaEpueS9lMlZvL0VEcUdMU1ZsM1FOdUNlaHRO?=
 =?utf-8?B?REtiZFRxbzVaMy92VW1DM0JHMGhFQXBjTllUOVFFRXNlN2ppZXRkemZKWnVD?=
 =?utf-8?B?M1JabGU5cGlZcWR2VzRSNjVGQm9EU0hUMHpWVDRYbXFiN2M0QkZHVXZ2MWpJ?=
 =?utf-8?B?K1JQMUVxU1JxQkNHWUV6V25YN0YybmQ4T0hxL3BTSGx5Ynk0MUdEeUFHekx1?=
 =?utf-8?B?MDBMRGdRTk14b04yL2NDVE0vR0c1bjFiL2FtNVpCYWVNbGcyUHcxU3FwSE1D?=
 =?utf-8?B?cis1ZGpOMm9uckVEbjk1UDV3RWNCMnRxQ1dxTmJuR0JjQlMxZDZxQlp0UTg5?=
 =?utf-8?B?ejI3NG1TU0Q5aFhiamVyRVhuemszenRnWG85bytPR0VRd0YvUWtRL0dPNmZj?=
 =?utf-8?B?TGhnd05wREU2a2hOZDBnR0t4cWw2eVhpSEh6VURxdUNwOWh3WDA0YmNsdGEy?=
 =?utf-8?B?c1B4MUNxN1pNQVo3Wm8zYWlhK2o0VWZRbjVMQnN1RjRrOGVWcXRTa2lHdDBY?=
 =?utf-8?B?VElGbVdLenovUlBJZjE5UTJBdS9pc05SZGtRZWVjYTVVSk1aS2lYKzBMWTV4?=
 =?utf-8?B?WFRGRUhmZlNCREd4elRCUWJ0Qk9OVWgvVnpGU1lTSlJYcVJwOVQzZ25xOUJI?=
 =?utf-8?B?TGFwaFhPZGJHSy9Vb0R5ZDM3aENHZVpaWWhhTUtmb3UzYnU0VnBPNTZKczFh?=
 =?utf-8?B?YTNMdGh6cTFsdlBPYTYwNHVIOTNuekJPRmJiZ2k3Q2k4ckJERVhjUTI3UXpL?=
 =?utf-8?B?YXhRMmtvc0lKV21BWjNYbHlZcm9pb2tNSkxGM0RnVlpyRm1zcm9iQ1BINDF2?=
 =?utf-8?B?d1dpcEZPWDN2Sk8razBYbElwbEhXR3N1TXFRWDJlZmhCYkZmb0hVcUdTamlW?=
 =?utf-8?B?dGdqakVXZzZoWkwwdjN4VFNYYnAweW1NYXdLbHlvOWJENmc4UWhrdGkvSEJl?=
 =?utf-8?B?eVRGbDU1Y2NPTS9UekdMSkppdkJNYzlJbFBJNE1odjFTU2ZSTHVlbkJDS2xB?=
 =?utf-8?B?OUhSWG1PdXVmbHM3MEV0QjNyb3NJV0w5UnY0NzF6YXRwaHoyajZBNVhHMFhX?=
 =?utf-8?Q?c3K+DXlpU7Dv3k6QD00rEHIhY?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	LS0jtehmNpC85LwtZDX2To1exvoXlIFfQlX6KpKNr3PNGmTxYwTHUOui+TFQP7ZpLFgEaTA0KgQteAe347mx5F4NR94MQszs48bkruw2hqDBZ43XAJHY47Q/oQO3FGtDS+RlARyjtSq+3yf4OuSf0n+Ta0JewGSl4ZnunlDrA6AzNjND7+kieTbV2uco+rR/gQNmVK+LZOKRqeWbAAIjj+8rmZmH1IGDRHzzCtj8zHQCslwzWk7RRn3oVpwn7QNOoYqVBAEV84ZMmPcs67I02NeWVezqz0YS/39VQlxdqRST3xs0IaNrITfyXBlpNvOUHE/Lp1FWBzG+73M0vV1+gZ9tIGXEt0xnRFoCAGiUnhcnp68Ca5Um67GIBpgm5hMhBteIl2ePZ34qAGi4+daQ3Pit15YlXNQIKHu+Dekiei642Fa6nD9tLDVqffqaAzka9VN5LxigFyHm7t6DML9nwLsmrGNE/zVF9O+kKGhg7H2v1uCxq1Ns7F3+8Q9DbqQhlT9uwiWmm/L7vlQcRhdYPisPc4P2JmugI9KRpMMAyfCLiN5TVmBA4JanEO9EtJS9qB/vBUInSjc1SwtZG+ZS8E397C7zzTyFr5gqQ+h7AP4=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 28fab977-8ffe-4bdb-3377-08ddd919071c
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2025 20:52:47.4937
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8A78T9k8H3E02hH7DkT5+qqiS38mzsskExXEr/SYo4xxCoeoJooNFh1zeAnFJwh1qnX82ReHGXcW90xuSXty8g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR10MB8448
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-11_04,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 phishscore=0
 adultscore=0 mlxscore=0 bulkscore=0 spamscore=0 mlxlogscore=999
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2507300000 definitions=main-2508110143
X-Proofpoint-GUID: JmTfTaAzC7IIBE7t-03Qazm3yQ6Tkpz_
X-Proofpoint-ORIG-GUID: JmTfTaAzC7IIBE7t-03Qazm3yQ6Tkpz_
X-Authority-Analysis: v=2.4 cv=ePQTjGp1 c=1 sm=1 tr=0 ts=689a5823 cx=c_pps
 a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=QPMb9nn2dBNeuKtoj_EA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODExMDE0NCBTYWx0ZWRfX+Gc0G8c9z2BF
 vnXaBYHCD37oY1m+qJLkEhoG27mYCART0sU2EudGcNrQOjf7WczaNuYVFWQmrkG8vq3X8LTVnp1
 yhNKaBXy+6YKpKwTtFTmw7+7d9vbziOTtqGq7bxp0jTDcIOR6dDtHL4dY7VbkicfWjLtWn1aZKj
 5pyodIPf7zybFHPrdkMGyN9MlzepOomN5B/jCZ146ypyLbc2rGWa0VDyuOAZXvRs9oTAB5baa0b
 wAJYModw3YSN1V+mRS8CnenWFP1DQWVnduYMPS05e9Bj6YFTBozhvJO+/yX+hHofQ5NMu7jPDBl
 YT0mJ+Uf/pWEuAj9BnfQSs79YfF172nRZE3ctpIqdoYFMJW4HE67Q5PItI31ygjsXxQuOMT4870
 VMPx/4744frwN1ti/lUFSqUv+dXNjYOA9xPF1BnXgO3u2trFlkQ7bnhvg5msoTqiFbFW9PRG

On 8/11/25 13:54, Kris Van Hees wrote:

> On Tue, Jun 10, 2025 at 05:10:42PM -0400, eugene.loh@oracle.com wrote:
>> From: Eugene Loh <eugene.loh@oracle.com>
>>
>> New compilers emit autiasp instructions much more liberally.
>> A test like test/unittest/pid/tst.entry_off0.sh, which tries
>> to put a probe on each instruction, may fail.
>>
>> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
>> ---
>>   libdtrace/dt_pid.c | 23 +++++++++++++++++------
>>   1 file changed, 17 insertions(+), 6 deletions(-)
>>
>> diff --git a/libdtrace/dt_pid.c b/libdtrace/dt_pid.c
>> index e2d4e540d..833e9b647 100644
>> --- a/libdtrace/dt_pid.c
>> +++ b/libdtrace/dt_pid.c
>> @@ -279,12 +279,17 @@ dt_pid_per_sym(dt_pid_probe_t *pp, const GElf_Sym *symp, const char *func)
>>   
>>   		nmatches++;
>>   	} else if (glob) {
>> -#if defined(__amd64)
>>   		/*
>> -		 * We need to step through the instructions to find their
>> -		 * offsets.  This is difficult on x86, which has variable
>> -		 * instruction lengths.  We invoke the disassembler in
>> -		 * libopcodes.
>> +		 * We need the instructions for two reasons:
>> +		 * = On x86, instructions have varying lengths.  So,
>> +		 *   to step through the instructions, we need to
>> +		 *   disassemble them to know what they are.
>> +		 *   We invoke the disassembler in libopcodes.
>> +		 *   (On ARM, we step through 4 bytes at a time.)
>> +		 * = On both x86 and arm, we want to skip certain
>> +		 *   instructions.  So, again, we need to know what they are.
>> +		 */
>> +		/*
>>   		 *
>>   		 * We look for the Elf pointer.  It is already stored in
>>   		 * file_elf in file_info_t, but getting it back over here
>> @@ -298,7 +303,6 @@ dt_pid_per_sym(dt_pid_probe_t *pp, const GElf_Sym *symp, const char *func)
>>   		GElf_Shdr shdr;
>>   		Elf_Data *data;
>>   		size_t shstrndx, off;
>> -		disassembler_ftype disasm;
>>   
>>   		/* Set things up. */
>>   		fd = open(pp->dpp_fname, O_RDONLY);
>> @@ -344,12 +348,14 @@ dt_pid_per_sym(dt_pid_probe_t *pp, const GElf_Sym *symp, const char *func)
>>   		/* Get the instructions. */
>>   		data = elf_getdata(scn, NULL);
>>   
>> +#if defined(__amd64)
>>   		/*
>>   		 * "Disassemble" instructions just to get the offsets.
>>   		 *
>>   		 * Unfortunately, libopcodes's disassembler() has a different
>>   		 * interface in binutils versions before 2.29.
>>   		 */
>> +		disassembler_ftype disasm;
>>   #if defined(HAVE_DIS1) == defined(HAVE_DIS4)
>>   #error expect disassembler() to have 1 or else 4 arguments
>>   #endif
>> @@ -390,6 +396,11 @@ dt_pid_per_sym(dt_pid_probe_t *pp, const GElf_Sym *symp, const char *func)
>>   			/* Newer kernels do not allow uprobes on "hlt" instructions. */
>>   			if ((unsigned int)disasm_info.buffer[off] == 0xf4)
>>   				continue;
>> +#else
>> +			/* On ARM, we cannot place uprobes on "autiasp" instructions. */
>> +			if (*((unsigned int *)(data->d_buf + (sym.st_value + off - shdr.sh_addr)))
>> +			    == 0xd50323bf)
> Are there symbolic names we can use here?  From an include file concerning
> opcodes or (worst case) define one ourselves.  From the comment, I can assume
> that the 32-bit hex value you give must be that instruction.  But is it an
> actual 4-byte instruction without any values taht can be set for different
> uses, etc?  Perhaps a define and a comment explaining the value might be
> useful here.
>
> And perhaps do the same for the 'hlt' x86 instruction mentioned above it?

Quite frankly, I'm not familiar with these instructions, and the 
situation is getting worse.  There is another x86 instruction prefix 
that causes a problem and needs to be added -- some "multi-byte nop 0x66 
0x66" thing.

I'm tempted to go another route.  Instead of building a list of hlt, 
autiasp, etc., just exclude the ones that don't work.  That is, if I ask 
for pid$pid:$mod:$fun:*, silently ignore the offsets that don't work.

If I remember correctly, a challenge with this approach is that you 
don't know until later that a particular offset will be a problem. Each 
offset would entail an extra runtime check.  That seems unfortunate (and 
unnecessary, if one could know in advance which offsets are okay), but 
maybe it's not such a big deal if you have a lot of probes anyhow.

Anyhow, I don't know these instruction sets.  It might be nice to have a 
solution that does not require specific knowledge of instruction sets 
(and other info).

>> +				continue;
>>   #endif
>>   
>>   			snprintf(offstr, sizeof(offstr), "%lx", off);
>> -- 
>> 2.43.5
>>
