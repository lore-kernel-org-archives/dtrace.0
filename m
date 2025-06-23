Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C3111F582B
	for <dtrace@lists.linux.dev>; Mon, 23 Jun 2025 20:33:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750710823; cv=fail; b=REbJJqJgj4vxd5LjbtFcG7bQoo4rknhCq4buOzVmpNV+HZkCCLsa9Le4xz9BapcZkdsYDhV99dwZd9+WKfONtzhhm8vt0HhIVWFhL+PMNKig9/VSwoFfCsoDbhlOfj3fWyolQNmg0v8pZc7z/4nIFO91JsDJ7FV3Wae9l0LLYCw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750710823; c=relaxed/simple;
	bh=Low/efv8tguZhpLhs/BKisE3roZWoCYGoDM4L2zAof8=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=eKuB58PAQhNxbZX/6B2FRvV4+oyIghjqKY5Dux3zOEQ9Idmnc/iY5VZ080b3sHrWW8qIMAE4y+/dqZF5Ig7R5CQkDdghVnyk9+eQ1PHhY0z8r+BJhfD9e72Qn58VpzAEvGEPG6IY4BShnm3xfkPGLp3TeWiYA9TGmILiv450/B8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Tu08l/ba; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=vlBXCkeD; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Tu08l/ba";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="vlBXCkeD"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55NGXX7K015545
	for <dtrace@lists.linux.dev>; Mon, 23 Jun 2025 20:33:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=M02LH4axnbD6njy7t20K5SNyJHEl1GyAtpkVe2WhY5U=; b=
	Tu08l/baI746iueIRF5nc4bx90BkK0eIBIOvQsY1Ky6UNFxEsY4p0LLcMYxMvc5x
	mq+jewlFJ2Ot2DGYt6RqmK1Db93PCYQe3b9cxfhKf4JiPjxHEbDb9oVsJO79ram8
	Dn2+hxxpBWZIfe12YefEa3rzg70hpVyisDlR9Rf/4ZnxBvf++ns82XJ/AzR6pyjd
	q65JJ6kqJKE8GtjDqAREXcj2+I3rOTiWsIeYeAzKHncbsfDdaaorpL9I/dbK/iFj
	aFBTX6siOoLB9Ov/cEFin72pOaW9qTGi7IpqHpqGZLHe6j6Yg6miVcbE/Y9q43yP
	o1yGZUQWkxHBuIzosufYUg==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47egt5jjwv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 23 Jun 2025 20:33:40 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55NJ5r3X005015
	for <dtrace@lists.linux.dev>; Mon, 23 Jun 2025 20:33:39 GMT
Received: from nam02-bn1-obe.outbound.protection.outlook.com (mail-bn1nam02on2056.outbound.protection.outlook.com [40.107.212.56])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 47ehq2tsmq-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 23 Jun 2025 20:33:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VeKd7BZbzUyyVmePcDw04huRpMOyiPV64Z6v5VtM44f+kDBjNuV3aZ+uIZBhG+lVFF3pAKj6HLIqYnAOrwUcIoyMB6klv5awHU8UwZXpOc+T9Km0lmP9YnwKdfWmMtokza8cay4MuUhedcx6adsKn6mSNIoPC9QeI6lcmIaxvOYm2MU2Y+KkqnvrLl97Xe4LAvdkc7MDVf72nK/Ceqm/T7CdgkYWAOCkL0q8vqJ/PQmWaPhVztAnXpf/fnBvn9cuIMJlXLu190PCRPk1800bwtU7RIH4sk30zt+UYSWUp2pwYLfF8jUUzIxW/hGpVFf6oN7+QV3edNr4nYBBk359Ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M02LH4axnbD6njy7t20K5SNyJHEl1GyAtpkVe2WhY5U=;
 b=LPd26JsX5a+E2Ke7ogu8GQ6iWZ8g6lMY/4MrSeBijaKX2X0eeZhHEGlFijcwSUhqQPcoUQUpSs5GLQjXSrpT1Chtt3CUuHwsbQAaUamMY+ebXjpQFtanLgozYtWNDSneDiQWvswkRiumYqxJ3/MMfto8lGn/NHATGmx6669ftMr40/1La+iPsXWEMlUtI1VEaqy0b4RffCObdV9NyNmuwsoVoQsle+sJu9heFlvli4GqocdeE9Oe5tjL8CiZFqN0j13LVc/Ir/CXxW6V3FbCKn8ulPzRFKFAXMVSzoYNoeqUiACWNWfS20AzKQ42krtc/yEZmm2dy3u5Sg50m4CaUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M02LH4axnbD6njy7t20K5SNyJHEl1GyAtpkVe2WhY5U=;
 b=vlBXCkeDZIAWcloVE3GY3eVQDOBoWOER2Rvh6QAYblDjVY/MdEOR/6w0oHVOoNZS9tUs13biZwDPzOc+VaRP33we9Tqc+tR85FHmB/ixCTcMvd3g10pwU/QoAA/5M49+5ILUJZLoRP+XTHN21vZ/qisuIawyNp5hjsO8xcgHEvM=
Received: from SJ0PR10MB5647.namprd10.prod.outlook.com (2603:10b6:a03:3da::17)
 by DM4PR10MB6231.namprd10.prod.outlook.com (2603:10b6:8:8e::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.27; Mon, 23 Jun
 2025 20:33:36 +0000
Received: from SJ0PR10MB5647.namprd10.prod.outlook.com
 ([fe80::8db4:df1d:6afd:e4a7]) by SJ0PR10MB5647.namprd10.prod.outlook.com
 ([fe80::8db4:df1d:6afd:e4a7%5]) with mapi id 15.20.8857.026; Mon, 23 Jun 2025
 20:33:36 +0000
Message-ID: <10ca48a3-7e72-f0dd-4fdc-72baf3d52ac6@oracle.com>
Date: Mon, 23 Jun 2025 16:33:28 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH] test: Suppress some white space
Content-Language: en-US
To: Nick Alcock <nick.alcock@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
References: <20250609180647.4424-1-eugene.loh@oracle.com>
 <87cyb7enqu.fsf@esperi.org.uk>
From: Eugene Loh <eugene.loh@oracle.com>
In-Reply-To: <87cyb7enqu.fsf@esperi.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: ROAP284CA0431.BRAP284.PROD.OUTLOOK.COM
 (2603:10d6:10:144::18) To SJ0PR10MB5647.namprd10.prod.outlook.com
 (2603:10b6:a03:3da::17)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5647:EE_|DM4PR10MB6231:EE_
X-MS-Office365-Filtering-Correlation-Id: e9b1145e-8023-4484-8248-08ddb2953a7c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VVhDRytWNm43VFI3YlM1d1Y4dTMrQlVKNzJLYUo5cXEwckxobXMvL3REc1VG?=
 =?utf-8?B?ZVFFVC91bFRPYVpUNU16V2xDWVJaZ3U2c2lQSlhpTUFtSjFvTWgrTkRjWklm?=
 =?utf-8?B?Qzk0YjlUNnJtUnh2UWszeXRhNlM4RFlQaHVDaVlGSysvQ3d1cE10TGc0RlpT?=
 =?utf-8?B?SEU3RHcvR2RwZkpLRmo5TlVZSkNyTVlPK05tbTF0YUtJb1YzL3lXSm5zYkp1?=
 =?utf-8?B?eEVpUkYreHJOTzIwR2tkNVBXbXVPVUJCNzJmZUpYKzBQVEdZeW5zNmw0TVdx?=
 =?utf-8?B?M2pkVXRiNk9nbEN3TG1UT2xzOUMwRmpCU0NSZGM3aHZLbFZOaTZMTXQ1dzhH?=
 =?utf-8?B?TTFZR3AyUU5FQzVQcHMxaklMbHcyNlBvOERwZXpJU0FVOTZQdjJqTlV3NVM5?=
 =?utf-8?B?c2pOM0wva2pCY0ZkQnlra3RoVUxscmp3OTZDcjFmUDBhcWo2QkxTUGN3NEJx?=
 =?utf-8?B?eHkzYmpoaVdoTlQ5elQwU2FqUmNTMmxaTC95TjRVYjQ4RHJjQkNkTUIyb1FI?=
 =?utf-8?B?eWlRc21OM1VoRmpVaTU0aG5nQUN5RmppK0ljWXM2VVcxbjArcmFiU21nS2RQ?=
 =?utf-8?B?N3lvQUtwT0pOZ3o5bjErVGQxTDYyWUZzR1M4SkVKQ3poZW82UWV3Tzg4Q3Zz?=
 =?utf-8?B?NTZmTVAvMWlBbGJuUU5zZnAyQWw2MWlHbjNoL1RKczJTZWZnRUl3VG4vMno2?=
 =?utf-8?B?by8rdURPMlhLVmRNQ1dCWkpKMFE0YS9rVGZINDZmK21pMG95WktCQ3p1NW9a?=
 =?utf-8?B?MFowbXV5MGxwKzBiWTIxNThqTHRuSzRtd2ZhOE9JQUJxelBDbkxzRGl4Z1NP?=
 =?utf-8?B?U3l5M2hOU1NHb1V4OHpZTDU2UkI5a3pyaHlSSlA3MTB2c3NyMVNld2FLZ2Nr?=
 =?utf-8?B?TVBqcmJMc3JkQmE1dGhZQTFKNTNsZ1dYQnU3TGlkSjM0bEhDbWdpYkNXM0xO?=
 =?utf-8?B?dVNvdlo4dHg2VldyZ3pkeGNRMERDWEJidkVZbVNNZXNaZjl0TTZXT1JlNGVI?=
 =?utf-8?B?RTNMTDRnZzF2VDFxTjFiZkVkZ1lGZ3ErMHcxdlcxdzlUZTV2dnA2YmVNSmx3?=
 =?utf-8?B?WnJkTGxRbmFQUXNpK0dmTGpzS1RtNWZWMTN0M3dKQjBwOUZhbHFLY053Wm5o?=
 =?utf-8?B?d2ZGMkZyUVdQNXhxRi9sdU12WTFsZStTZ1ZtRXFEaXVVRTd1TXpNb0FFN1ov?=
 =?utf-8?B?OG5JUjNYWEZzM0lkRXFqMXVaUEhnTzJuK0xJTlFLMUJIbXZpc2Y0K0hwY2d5?=
 =?utf-8?B?cnRabkdCdFVwWDUwYnQ1N0UrUGdZTGFOV1orcnk0VFVib1hGSVRWdjluQVZU?=
 =?utf-8?B?OVEzVVdPVGdzRGNhSDRFU0o0WjV4NndpTzFYeUhVdEpvSGduR2dBL21jYkJt?=
 =?utf-8?B?b3ViT0FRY2lxMlhZdS9iS2tURHdNdmdZcVBrQk9LMDNXQzRnc3FSdjByYXFS?=
 =?utf-8?B?aWtoQUxrMW02Ty9EOW1QREdIbnBrTDRlRy9rOWtrNktXS2pHVFdvdGplc3hD?=
 =?utf-8?B?U0k4bU1RK0JqQ2poRUxEOTU4alJvTXhQQXViYTh1dFE5TlZIREMyWjdqSmR5?=
 =?utf-8?B?SnhsZEd0b0ZPUWt0dWhKZEZyalZBS2pOYlVGNDJKakJnOUtmcVo3QVZLRGFU?=
 =?utf-8?B?Y2NSNGU0bkhiZndNVkNPWmw2MVRDNVhQV0ZWaDZncFYzUTBuSWc4M0tFTG9X?=
 =?utf-8?B?UEJHRFFHKy9ncXhGMGk4VlU3TXp2WkczTTkwaHdIZmZxUEFadXRRVEZvVDZW?=
 =?utf-8?B?eVBJcEVxaTUwM1IyZWlnSHd1d2xXTUxRdUY3MHpCTTMxdFRqM3dlckRLT1Vx?=
 =?utf-8?B?VHVLVWY0czBFTDlEeUZ3TE5UWjB4WHh0UENvMjQ3V2xPWTI1eWk4UWZiYklq?=
 =?utf-8?B?cGRrNXl5OHE2QWhIS3UwRVVYTXBBeWQyM0dsanh3cVBhL0FvUHZ4dTE4UWRz?=
 =?utf-8?Q?1i7V+vS/JNg=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB5647.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YzF5ejlrVFlYdlRrcTNiaU1iOFQzZTFjbS9wdkdnRHpQNXkvRFdvYldoQXhZ?=
 =?utf-8?B?Wjd5allVendzK1AvUGdXZm0rd1B3V3BDS3FuVGJxMnVQbTJNSy9OV2cvTG5p?=
 =?utf-8?B?ODlHWXRiYUptdnJEYWJrUjdETSt3WXFmK04wZFNGd1YrSTVQNkNWUXFQaG5k?=
 =?utf-8?B?bDNEY2VqamVxd0Z3cG12Y1ppZ0wzeGdLMDgvU1dwV3QzSWtCUTNQV0FNVFQ5?=
 =?utf-8?B?a3JVa0UyQjJ0ME5pbmZaMDdmWDZTQmtVTlJPR3RJeGY3QUxjWjFnZStNNjNK?=
 =?utf-8?B?NHg3T0F4OGxac3VkSDF5TDdwYmxzRThISlRmV1JtVU9TNW1ad29UZmNOczdS?=
 =?utf-8?B?SVdpemNUWUpFSEEybDk4eDlXOTNkT3hOY0tyM3dzMGlwckttYS8ybUFTZm1p?=
 =?utf-8?B?Wkg1cVNNUUtzRVNtaGl4a2MwblBSSmJlZ2F3Z2xyMGR6cWlOdzgyakRmSjBr?=
 =?utf-8?B?YUVFbCtQNDIwZzJkZThJRG1lemMyODNkVWF3REQ4L0hrMVdZKzhOenkwNC9D?=
 =?utf-8?B?RmlKbXRUWll1cTdTVk9TYVBnUnp6c0hIdTNVcndPYzdST2dNMjJoRGRyMjdW?=
 =?utf-8?B?RWZRSTV2U0IweFJTd2ljMTRsRGIyUDNTMWp4Z2JFbWcyZ1lHSHdrV0ZjQTJ6?=
 =?utf-8?B?dGJLbzBrdktIUHlDQWNyazFpUURhSVlSL3BsWEY0cFJEdWNIRSt6V3N0WlBa?=
 =?utf-8?B?eGQ0QjZjbTBnTEZVMjdzcmsyR1NPNlpsb0lUanNGTGRwNXkrTHRMZ0poN1Rs?=
 =?utf-8?B?Y0J0bStneFRvM0ZObE5vaFZJTjI1KzdVMmVnWkZlZE9rM0duU1kydjBOamxV?=
 =?utf-8?B?V1lCWVMyYXdKRm8vOW12d1VtV2F6d0pVV0ZRbmlhOFBaTnlhV05DUUd0c2lD?=
 =?utf-8?B?R3pZTWtNSytzWFlXZ3dIalhLUDU1eVErVDI4bGUzL1BJQnk0QWVweWdhNHhm?=
 =?utf-8?B?S2o5K3pQQTZNbWk4QTdaZXA4cWVXTkVwK3RicEZpVHpBSkFoeWcvMEhXb1N6?=
 =?utf-8?B?b1VPTWwvdVdMZmJCeUpQWFNIc0dYS2M3bFM0NHhqaUZHQXg1WmxhYjhzMUh2?=
 =?utf-8?B?UmtzNkgvLzJGNWhEYTlQSUxEKzFvMUptKytnb0ZaRTJIQmF1WFlEVEFCeDlY?=
 =?utf-8?B?dklURW5qNUlMVnJIcUFDSW1OVjhDQ3pPcUhBOHdudnNObWg4U2ttaWJCemdY?=
 =?utf-8?B?Z1EzV3BnSmRNS3dVcmRGRVZqdEREV0x4QXZ4LzAwQisyY1pMUXBueXA0T0JY?=
 =?utf-8?B?YzdqdGFZdmpEVDQ1cnBIRTExV2wyWXRXSEVNTDNodFk5VlBleDNPSUlvV2dW?=
 =?utf-8?B?YXd1NFV1QmZsM3ZVVlJET1lMZkYraWRNSE83clpWNndrR3dIMzZVM2h5S2li?=
 =?utf-8?B?aDh4elNLbWs3cEswN2V1ell3aXZSZmZRSC83eUZSenVRYTVuNkdVTEU4TEg1?=
 =?utf-8?B?bmp0T0Vwd25UUlZTbXJZU2cwa29sYnFjYUw5SGR6RXp0NnVEdTI3dVUvNTJ3?=
 =?utf-8?B?UVYyb0xGZSs5RnZ5WHhNcTVTbkFyaWtsZGwybUlDdmZLZ21qRUp2Nk4xMUEz?=
 =?utf-8?B?alJYRTFRUGwvcktWcmdRUVdRYTYzUU5ZdU9WQ0hJdjl4WmlGTTBCWlpWLzBt?=
 =?utf-8?B?eUJVcHM3cmJhZFZIK0pCYytvYkhZUzJPMzFnNk91K2xVQStWTG9pS0c2Unk3?=
 =?utf-8?B?STQ5UHA5S3h3RCtGeFhQOG1MOWhtSEtkUFo0a2Jka0FUeDhDUFVWYTZQU3Vr?=
 =?utf-8?B?TklMRlI0bisrN2pkTm9iNWhCRTdGNEljd1ZLU3NkRTRvanRqYUxsU3FpWUpB?=
 =?utf-8?B?RU1lU1A5TDhNY3Nzcnk3TmxLNFdDSzNmWlFWNjIxckVyRy96Ujh4di9YY2Jn?=
 =?utf-8?B?eEw3UTBuNEpKcGZRL1kwV2NSR3Noa2dDZWNqNlJwQzE0MjZHZGtWUE5uZ0Vv?=
 =?utf-8?B?VUZEdSs0U1RkdzJkRTFzd0dwTGZZMmJJc0dVMlNjNzgxbHF5VTJVbC9Ccldo?=
 =?utf-8?B?ZGdkWE1hR2FzUEJ3M3FiQWtqMUlMVkRnYmpDQWozRWV2K3hFYkJYbGJ1OHMy?=
 =?utf-8?B?S3hiYkp2YWZlcFR6azcwVHpmWThybXBhNVRGdGM3Tjc3UlBTNTFyNW1QVnNm?=
 =?utf-8?Q?fuJOQj/0LoJlrxJuC7v2jAdA0?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	z7ZMXwFq/Gl27IZq1cnUuLmxQ+5RXDyzRyPAd5tC6sE317ZbB5W9/29pJy55Xotn4G+osdOPRT7M7/Te6pDH3doOkjmVyc2WjUNrGhdcgnDxGwO/16qfJSbgYVBvcZ79iLUqw+5H09Y208/F8imUu24+y6Ks+Foz0ErFVxBbhq3MIn8lK0pmi9qjtqe9sYZa8/S++kGIHkpZFfHvbCSsntehrNujQdB+PUsh6h/+qysQKFMJM4SZwZSiLcdR0nXiIlvFeOgSQItdH7n4VWpSJ5vn4bWQZgKufLFpqRYnLD1iif1CbxoZ5n/gR6nyNMnjEwl0/VLLLoUa3jL1X5Ug0u3hg9vD/KMPYNQtsDT4P+80kx63IaJsiA1twXA+wRFvaQ2y8Fe4H2I1RtEPlAHsptNbyRNTvQLAiUMPw1a8QnTHqwm71ZMoVPH+aQ2sKqyO1Dt00hdAJcgwv4FLMFFaF4pryhtItIVwlmm3CKjm55xgUTViwLA8aguIoJOkAy4LxcU2PTo1jckX8lz04AwpU2+tPqeKUn1jmPS3HaLXRphr0cGR3M4D+pXVs2YRBE4oFhF+hE1xoUd4P0ummTuzXLTKf2wftFeNqX7616vJaPo=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e9b1145e-8023-4484-8248-08ddb2953a7c
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB5647.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2025 20:33:36.1780
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gA1w+P9Klpy4GJvQDMDqnbWrDx0SIivkUY6PmqfUG21VG4ptIDKCo/kJdWLPQW2RvcI6QOIt8LqFDa+MjykODQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR10MB6231
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-23_06,2025-06-23_07,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 mlxlogscore=999
 spamscore=0 malwarescore=0 suspectscore=0 mlxscore=0 bulkscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2506230136
X-Proofpoint-GUID: GwukR6wJmjIojS8vWrG92N0PHhZL2V8c
X-Authority-Analysis: v=2.4 cv=PMYP+eqC c=1 sm=1 tr=0 ts=6859ba24 cx=c_pps a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=ZJo0mr68riz05gdsfMcA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIzMDEzNiBTYWx0ZWRfX3MWKSqKvAZx+ hgY/Bm4BYxwIg5hlTigxlVV+A2iS+G3OuaNXSTZOBmGsnSc2Jxw846VkrZCfTUgsA0uSphLPuF0 UVubEhZNErljU8GXsk9gy0Av8Lr0HMYAOdk9OyzSwKBdqTNeIGBYv9etp9rRnyPRKW4ERC3I/7J
 DV/82+M8uCmmgfhiD28FDvSHpb7sSOMcXrQM+/Q3bIEPq7di283T6j538fLguVgzsSg8efdI1K7 Jb2KvRjQLPVA/E+3U1nv25Gl7CuJZLkA5HAzT2UjYiFiiIJq+JOSVFjAt50oIC78TzQ4FKO1Ezm I6+WjKge+ave/eSaYRDtw0UEEbPS6g21GmaqbtfmJvQlxXaW81/g/2ZbrE1kfwgvRFD+typgAxK
 +/1CS2YlJeO9shBRxPTqfwyvMQWMrQmeRl9H5FfgDMqBpkNeuD3phzG0xyse1af8RACVtfCI
X-Proofpoint-ORIG-GUID: GwukR6wJmjIojS8vWrG92N0PHhZL2V8c

On 6/13/25 10:10, Nick Alcock wrote:

> On 9 Jun 2025, eugene loh spake thusly:
>
>> From: Eugene Loh <eugene.loh@oracle.com>
>>
>> The test suite turns pointers into "{ptr}" so that results
>> comparisons will not be sensitive to particular pointer offset
>> values.
>>
>> If these offsets change in width -- say, from 0xf0 to 0x100 --
>> the amount of white space in the postprocessed output can change.
>>
>> Add additional postprocessing to a test that sometimes fails due
>> to this problem.
> Hmm... this would work for this test, but maybe we should change the
> {ptr} substitution in runtest.sh itself so that it gets this right in
> the general case?
>
> Something like
>
> diff --git a/runtest.sh b/runtest.sh
> index 156e7dec8a1c3..c5703a81bc6d4 100755
> --- a/runtest.sh
> +++ b/runtest.sh
> @@ -509,7 +509,7 @@ postprocess()
>       # TODO: may need adjustment or making optional if scripts emit hex
>       # values which are not continuously variable.
>   
> -    sed -e '/^==[0-9][0-9]*== /!s,0x[0-9a-f][0-9a-f]*,{ptr},g' \
> +    sed -e '/^==[0-9][0-9]*== /!s,0x[0-9a-f][0-9a-f]*\([ \t]*\),{ptr}\1,g' \
>   	-e 's,at BPF pc [1-9][0-9]*,at BPF pc NNN,' < $tmpdir/pp.out > $final
>   
>       return $retval
>
> might work. (Obviously the lines would no longer line up, but the number
> of spaces would remain the same as they were before the substitution.)
>
> Lots and lots of expected results would need regenerating after this,
> of course...

I agree that one can make a case for a broader change, but I'm not 
convinced that that would be the better way.  FWIW, there were these two 
commits
         6f398f229 test: Make tests more resilient to different prid widths
         72a79b784 test: Improve resilience of tests to ptr widths
that took the narrower, more tactical approach to such a problem.

I vote for the expedient route:  a "Reviewed-by" and we move on. But 
then, in this case, my vote doesn't count!
