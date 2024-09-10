Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29D5919148A
	for <dtrace@lists.linux.dev>; Tue, 10 Sep 2024 15:20:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725981640; cv=fail; b=N1yO9jYO0yOdlKfZemT1TTAJC8D7JuhMe8W0rA3D2XqPu2k4BKmv/3+1G5kM44WqIv+TFjjfU6hWRKKbCt94yJXBUsciLyAwsVGBwMGLnhnrBx15WlF6S+TSXvbxekn3DK0hH7Aj3n5QKIfwcd6Makl53iYVvzBe3LjZlA9ana8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725981640; c=relaxed/simple;
	bh=V8UsgLce61UC/hBjoHoJUc7Ibt8kuFNkiskik9sV/Oo=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=iWbPxlDV+abLeEf9l1vRlJfB3bEPNqLETIY/bQDmiLbKxbZ9l+O3nyb27trsfWugxHlDNCZgHYXlNfDMsDj3NHtL5MyoN+Jikh5UcB4psSEOo8YKNdxpgyf/A1JD2Ch/N3djX8UuJxPnT5YdwY+en5qRE0c9aYOvMdleRmilYf4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=BMqj41lx; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=ZaYGUvZa; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="BMqj41lx";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="ZaYGUvZa"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48AF3ffE025134
	for <dtrace@lists.linux.dev>; Tue, 10 Sep 2024 15:20:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	message-id:date:subject:to:references:from:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=
	corp-2023-11-20; bh=aKfjq+CUeUm/PAOBFSOdB4jeb3oqK4a7Vd9wwYIM1PA=; b=
	BMqj41lxoUOisvZyU9qNrioOg2eWTKa/0eNg0Kdgs/JDaeuHPoGjTzEdzcsG85Pj
	o+ke5MKCzl0LqtT+yBFVYI/VUvGdz9cp2EumaWxBo9leihWMNW4uI2Z/Ns9gJW3B
	RuTLmsd9LYTI3iHDuIYThHQYvfsYPEPniQbZN5JtsKUWB7rCU1eDEibN3LmIQqxu
	AVwyfT81n0vVdOR1c0gWZjw9tX/g/hwiOL4AZt8kHP8rYPiKQjKl5ibWrL96YxOe
	8GTI/FOhVL9aiRTDe02ZAuHIjgLL2duDuVqmUzOpSmtiQaQVlOlJZuK83IjYDOuT
	5ROEeij1A07SV0qkwDFMjA==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 41gdrb5xmh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 10 Sep 2024 15:20:38 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 48AF2ek2031623
	for <dtrace@lists.linux.dev>; Tue, 10 Sep 2024 15:20:37 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2044.outbound.protection.outlook.com [104.47.66.44])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 41gd997bj7-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 10 Sep 2024 15:20:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MremE5BRk2/z24NIXwHxCvpr5sJt/e+0/EPOg5FkTgICcLwIaiN25C96tQ1eQKCZHGuQkHlBcceRKppqAMwftQKiXkOHSqa8mIv3sMgyO2+KiYbo4Mgrv3vFcj+7FvwaPl+qjkgiPuP4p/aGidkPDdBd32KEGQrm5O/JMpaRoQUntbG3i1u91kWuoRLsCdNpIn6OZYVuncO1w4+8P/34g60uoaI/Xv9fFz+/NKl9icSUIXc7cpRnufNtJJZl+lUAyM80NkduoguopVxZ7Aq93Jrai9GIeYjjl3qsxXFRdCqFRk0u9zkdJfY34gnum2j6ajI12aA9Z5BXnk7aKPguyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aKfjq+CUeUm/PAOBFSOdB4jeb3oqK4a7Vd9wwYIM1PA=;
 b=GG0yUB/kUfJ+3P7W5IDH0IFai430d8DjWxi0UJfGZMi/erCdzQCq8qu0rmxQrF5lYolnTTS+aJaycscIT746BrDMHrBUbF055BRHf5kAm9jGAu8NAGJKAOV1/dgyjPeKamq3FgMDYc6HscKCOkpNB5RLAJKGua358mViXG+ge6l+MJNNV+ECvS56OSD28n5b7f4HP7UWLWCU5G4DgB9k9XKskOpD9oY9jwrPnDNLGO/5MDKB+gIVdHctiKIo57ACNFU9A5iJr8IoDpOq8r2LMNv8q9d2/7C/HWhAMTQit950TMV9vBfXJzfim8U/3zmE6bCPNNZwcTNjXdptivuFdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aKfjq+CUeUm/PAOBFSOdB4jeb3oqK4a7Vd9wwYIM1PA=;
 b=ZaYGUvZa3wfpYUqhFQz9IXs84c9h3nwYUsqlQPUcW9GAjtbWHfaAEjNV/M+e985toQShihPUwFDXdOISQK/yAu3iwTcyEnTqowXYzFsOz537Ke7By0U72kGzID88wqDojptvyLguW2Tx2XTK0KVFU1Aeuj+WIzh5R43k8J2SzTU=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by PH7PR10MB6336.namprd10.prod.outlook.com (2603:10b6:510:1b3::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.16; Tue, 10 Sep
 2024 15:20:33 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%3]) with mapi id 15.20.7962.014; Tue, 10 Sep 2024
 15:20:32 +0000
Message-ID: <32dc5af3-7f07-5172-b7c5-9a9dfcceb5a1@oracle.com>
Date: Tue, 10 Sep 2024 11:20:28 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v2] error: ERROR probe firing should not corrupt probe
 arguments
Content-Language: en-US
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
References: <SN7PR10MB6287064DED46D0F4E2F055D2C29A2@SN7PR10MB6287.namprd10.prod.outlook.com>
 <65f82c4f-e826-2f66-2ff5-b38bea4de817@oracle.com>
 <Zt/lE5Ye0q+wOE8K@oracle.com>
From: Eugene Loh <eugene.loh@oracle.com>
In-Reply-To: <Zt/lE5Ye0q+wOE8K@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BL0PR1501CA0003.namprd15.prod.outlook.com
 (2603:10b6:207:17::16) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|PH7PR10MB6336:EE_
X-MS-Office365-Filtering-Correlation-Id: 6dcc1014-3617-4300-a7e8-08dcd1ac1c7a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UDFteHRsQ0xGMVZQWTdTcDVLUnB2alJvRGhwbGwxTGVzdUZ2Zis0V1dxdEQx?=
 =?utf-8?B?Z1J1M05UaC84cVVkVTYxVWxpSzAzWVJKRTlRTDJvTnRudWx5WGdlZktWWDhx?=
 =?utf-8?B?YjVoV0lCWVh2c2Z3OEpxR3UyazBuOHhYbGF5bjJwU3cyK1hLS2krNHRCcHJx?=
 =?utf-8?B?Ri8wU0VDTzUyamV4TklhakZaREo4UWdjQ204elptdlJMZ1J5TEh3WmY0NXJ3?=
 =?utf-8?B?KzBYQ1VRc01aT1cwZG1lUzI5cHRVejliQnIzSzBzdHdUNXZPWGxXN0FjSitu?=
 =?utf-8?B?UjE3ckZHTG9wdGVjanNZaHZBVGxhMDRwbTViTXl0Z1FGNWN2dmhyTmFwYktO?=
 =?utf-8?B?U0ZSYTFHRUFESVV2cUxiYnpTSm5LZE42OUxkVXdPbU9mb2pxWFJycDlqWk5W?=
 =?utf-8?B?cjVXRTlaR0J0NWd1eCtQeXBmYWlhV1hnaFVyS3BMd2x6ejlQSUdFWWlyUDJq?=
 =?utf-8?B?TUlKSTBoVS9MWmlIUXR1Wll3SXRqNVYwdHhNdnR1SW9sanBKbmdscjFTSlli?=
 =?utf-8?B?SjgyR2JSelVsTzZSS1BNVUZOS1l2ekJlUnQwelNpTTd3RXptRkFmdzBxd0ty?=
 =?utf-8?B?TkphQk1CMjVidTVQOElwVE1hL2ZNdFVhUU0zWm1UM3ZrZjdKVE1lL0pFRUJT?=
 =?utf-8?B?cFRaZ0RFaU5WOS93OUtyQnhTQkZsczZGNUE5cXhYZTRGVktMSjFGS29BY3Zl?=
 =?utf-8?B?N2Fvb1pRYVZuMlorZ1QrU1hFOFdoS0JUZURUSkszcGV4cURIYWpDTjJkb085?=
 =?utf-8?B?a1c1c0NhY2h1K3RLK24xK1dqUnUxTDl3N0JrNGYxcjI3a291U3kxekFFNzBS?=
 =?utf-8?B?dStqY0Z4S1JiNlhvYkZtT21MMG5vM1lhYnFPTCtUUDI2UTl2V0gwUkhVei9S?=
 =?utf-8?B?d2ZmRnNEM3EzRElKYldTWDc1TG9hVGVZUk5QNlVGeW40ZW5kWHo0TVNJemNE?=
 =?utf-8?B?MFVHRm04MWVtU0YwVGRSQm1LMS9aRUw3WVdSekxENWFPeFFsby9SdEdTZDU2?=
 =?utf-8?B?emJCVnpWUGtPSWFGWU1ISm15cjdGQ3I3eERqWnJ3NkpDSVJrTzZTRWFPSTN0?=
 =?utf-8?B?VVZWeFdzZEx1VzNzU3FpUVk4YzVKU1N4blkrTmFQNkZMVEpneGdOTlVZUE5F?=
 =?utf-8?B?QThVK1hPanByUG1xZUNvSk9kc000TTcrczR5RFFzQ2VMNi82Rmdsb0tESzlV?=
 =?utf-8?B?MzlkN05aWlhEWEV1djRmZDZBbWFkWkhteFFMV01PeSt4a2VUajJwMDNvSWZQ?=
 =?utf-8?B?MC84eGdMR21hSmFIb2hqVlB6dFlEYWtYRm1Kc2dMMGJ1OVhnZW0xZGNOVUdo?=
 =?utf-8?B?U1FOQktmK1JFRGdpN0JpUU9vMzlTODRiTUtKeHN5enRYUisxWXdrVnFuaTN6?=
 =?utf-8?B?WDdIdVlzN0QvazFrTmhwb0NCd3R5Z1hWbUxVaHlIQ1JnVWlpTEpZbHdDdGcr?=
 =?utf-8?B?UFoxQ09pRFNZTk1VcVgwQUUzN1V5Z0gwWEhNNFgvT1Z1cmV6eVF2MzZqY1lM?=
 =?utf-8?B?Uld6QVB6UHNFNG03SWpPKzA5b3BVakEydHg2T0NmNnZGdERoQ2VLS2k2by9q?=
 =?utf-8?B?VkZiUVV1ZmtHS05lVWVKMG9EUFNUOFAzQ0Roem1NSTdma2dnSitHenhKV0xt?=
 =?utf-8?B?UTZJODA0Wk4zdmRGNVhFT29JVE1BS2xxNHl1dkxtb3dCbW9jOEFNU1hkK1BG?=
 =?utf-8?B?OVlHSnRwWmlwbEdETHQrRmFINW95aGMxOGxvK2VZWGRGcElFUnp6ZjRIalRk?=
 =?utf-8?B?UGR2UTJNOEVBNjJ1V2VLMlAxRnZ2Nyt5QVdXVUl0Qm9TbWEzdzZ1ajk2VEgx?=
 =?utf-8?B?a0pOWnVKK29jR3lvdkhBdz09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YXdNZ3o0K1JEcEwwbzZUSWVxZ01iN3gvNmUyUWVhSlVlSDNYeEZSTERhYkRw?=
 =?utf-8?B?YzlhVjN4VVYzeU5aYlo0eVg1aEJycWlRdkU4eStuaWRLRDFpYUtsY3JxM2pJ?=
 =?utf-8?B?Ynh4clpuNmF3U0xFNWxNME8rREJCNHE5NWlXeHJzTGZUaU1tUEJhMmlIMnIw?=
 =?utf-8?B?UnBqcS9xTUlrcTViYis0N3JzQzFiNFdUd2ZuOHlqMzBJU2JIcDRoSEwveW0y?=
 =?utf-8?B?cGpibE9OM3oxdUxBV1k0UFU2dHVnZWhJa1o1WnF0OWNUMTl6WWlMMXVjelVF?=
 =?utf-8?B?ZmZPbWZZcVQ0aDJCWUhzcVcwNmNMcXlkVmNEd0o5ZWwvcGJibWgySW9aZHpG?=
 =?utf-8?B?enNEQXJzUFlNNElsbjNMSS9ldThzYjVuRVFhRFZKNnhDVDUxTG85RWZPVldE?=
 =?utf-8?B?TG90MEwyUUVmQ2M1NVk3QXpjaVpEa1EvOU0yUkhKSWNNK2NlcTFPMk9idmUy?=
 =?utf-8?B?UXplallkQnVac0hzbGtjWEdqOHFzc04rc2NnNHNHbTNzY2dWcW5BYWY2U1RW?=
 =?utf-8?B?aE1hREJjYkNWUUxiRjNXMWZMYlhVL01PZnNSTFRmWCtYenJlTHFOSWtsU2FO?=
 =?utf-8?B?d2Rwc2JpNWk0MTlIR01OcE10QVZXVWNUbGxzb1NWZ2UyWDRxT3dtVWIrSlhh?=
 =?utf-8?B?ZGlnVGRLQzFtUk5vckR2a2lKaTFNM1ZVd3ZvNE02VFdmYTZOQzZKOFlPam5o?=
 =?utf-8?B?Z1RNUXRuL3BXdlY2WXNITWNvYk9NUlR0U0Jub2pPMlhLb0doVDNMWVJHYUlH?=
 =?utf-8?B?aXNKTTJxT0VlWi82SjB6SmZZeDh2YVFSZFZZZzdTZHlzQWdOYzdndlMreVdj?=
 =?utf-8?B?UU91OVZLaHQvRHYwc04vQ05oSisrTHhmV0tXeEhCZFdPQ0x2dCtlbEVYanpn?=
 =?utf-8?B?OXRYZUladEVWZHlRMjNRT2RLWUNaa1ROWndaT1N2UVRQNmloTE1yZ1pPUGJG?=
 =?utf-8?B?di9FTGFIbFNUbXBWbHVwTFYyL29JeDZ6WFoxazlkVXdKdGErbzFZT2lVdmVi?=
 =?utf-8?B?Rk12V005cTNLcGE5YUxVRGxZWFdlOWNVY0hMSHE0bENOZEdDY1R0blhSRVNm?=
 =?utf-8?B?aGpzTDlTWERBMWRubGtQb3ZaelRENGNFT0svemJCVFNGUVBjK1lxVTV3bE9y?=
 =?utf-8?B?bmlrUG1kUWhzaG9lZTl0bHNrV2xvbzg3MEQzVmc5NFMyYitWM3gwTWY3ZVJM?=
 =?utf-8?B?a1kxdkcvV09aYjlnbVc4UWNOMzBBYzdyK3BveDNMUVBoR2xBZW1YdEdha3Vw?=
 =?utf-8?B?clpTWWJYd1RRVHpjWmY3b2NQK0UvbjhXajFhQjJCTVZXYWxwLzFDdGpKNEVB?=
 =?utf-8?B?QUNHVm1sbmtUdmtVTERVcVVMaGlhZDlmZFEyeXBZNUJOd0daUWppb0lNQW1t?=
 =?utf-8?B?dUdZK1hoRUQxNEhMTFpGYXFZYzdpczhSSGhYcmgzZmpLK3VqUHJ4TkVuQTJF?=
 =?utf-8?B?N2R5YThyVmdDSG55TFpxcDkwL3VHN21SaU52NWpnRU1Kck04ZlRXaW9nK2Rp?=
 =?utf-8?B?a2E3MnMzZEZOaU1yQkpHb0t3WElPOWE5TDBqNTl2SmR4eGR4QjVjeGtSdEpz?=
 =?utf-8?B?KzZTV0xSekwzeHJJNVhRMS9RTXRvNThOdHJuNDJOcE50Q2RZRVN5cmtjRWdC?=
 =?utf-8?B?SFdLNUNodi9BL3VwRVNNZzFoM1J1eFdCc0FEWVpqVFFVeW1WYjRRYlZMQmNS?=
 =?utf-8?B?aEp1OGlSNVJKZURRbDV6TWlEUVU4dUNDek05RkgzNkhWZmtMU2hrWW5DY0E5?=
 =?utf-8?B?SnpXWUVRR2NJejdhbG1YdkJjd2hiSjArcjhEUjF5U2tVM2VIS0RJcFBUc0lj?=
 =?utf-8?B?aFp4REFwSXlZalZ3d2IwVDhXZEFERjAzVklTZ0x5VGJ0S2YyRTVQUWk4T0ZF?=
 =?utf-8?B?M0hweDlZUU1CeWptNUJxbG8rYlBQbWtYaXNUQ3Q5R0hYSHRNd29DZXBjdmIy?=
 =?utf-8?B?R2R4Tzl2MnJ1SU41RlBXc3ZTKzAwNFd3YXNFeXNBV1VQQmZ4aDdmVThQUUJ5?=
 =?utf-8?B?M1ljS2I0aG1kcWJFY3VRTWpSTDZKSVJ2T2RRY0c5ZEszUnNqRjl4WTkxYjNt?=
 =?utf-8?B?NG9za3YzdEwxekRyYVBIWUtBb05aTEtRVnRESERvLzdxaTU0cFNEWk1iSTB0?=
 =?utf-8?Q?J6XlAK3lDMSXeUWwMSEXNxyOM?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	PPzPA0BPq0ydCjE8SFv/0xMLxf2ktnIoz9CWS/+k2v1xyzCJlviJt5jQY8OHS5xDaGP+fxbfw49BMnz7HpuQc6LWzFTeZUns2+WmlD33TkRYDgxeJFD7Atz2L3jmXH4N3g5K2OYkycEH3yQieS0pngkIXk1vQSMn+JQvjc6jB6l8VkWPx46rCdw+J/3n43au6upxII+63rBG5GZZHugqz1jJMDXUGxpNiMK8CxGndo0O4eEdJpU3roOFr0j32a02x5+KRoaHNQAqif9Vx+lZs3xFZWAbZeuQDh/6yRYPkvNm3Anqmxkg4Tp0z3wkF1jydQiV5HDPp8vTI90m1kBz16dT7Ufubp3W7Yxlzpf/ZFUpYFaL/3wy9MnoOMewLTkFRSamn/CXsEITkNixwpyt/8GWILpHQilR+Frfu5KSND3+SFa2QPZeQqcJEgmnayxNLLSYTNeN/oe/ddT5m7GzBPKG7TPlSEssnzUCzw2//jmYydIWeMybEJTlZ34ve7+fgAnjAkcr4sjPs15Mx5QgnzyKgs9NK8ajMXqugl4a/7yxbrQYMEf+Z2kR0hig6lsqsZ58PT1/HKdkaH6jUySCLG81cMSNoFWntWlw/iplvaM=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6dcc1014-3617-4300-a7e8-08dcd1ac1c7a
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2024 15:20:32.5001
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: A0ORUkn26B1mp3rIHcrK3Vc6izQMcUBVIJx4/NsI6TojiLGs6pT4b3NhFJ6FcD8qwqOlvM/KqsRRfG1QOta5mw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB6336
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-10_04,2024-09-09_02,2024-09-02_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 mlxlogscore=999 bulkscore=0
 suspectscore=0 phishscore=0 mlxscore=0 adultscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2408220000
 definitions=main-2409100114
X-Proofpoint-ORIG-GUID: schmfXJ09_wsJgO-h94KOUzWM9-S-uPR
X-Proofpoint-GUID: schmfXJ09_wsJgO-h94KOUzWM9-S-uPR

On 9/10/24 02:20, Kris Van Hees wrote:

> On Tue, Sep 10, 2024 at 01:51:41AM -0400, Eugene Loh wrote:
>> On 9/10/24 00:33, Kris Van Hees wrote:
>>> diff --git a/libdtrace/dt_dctx.h b/libdtrace/dt_dctx.h
>>> @@ -31,6 +31,7 @@ typedef struct dt_mstate {
>>>    	dt_pt_regs	regs;		/* CPU registers */
>>>    	uint64_t	argv[10];	/* Probe arguments */
>>>    	uint64_t	saved_argv[10];	/* Saved probe arguments */
>>> +	uint64_t	error_argv[6];	/* ERROR probe saved arguments */
>> I don't think such a thing is needed in mstate.  It suffices to use local
>> storage in dt_probe_error(), which is probably what you really meant to do.
>> Plus, calling it error_argv[] is misleading since these are the args that
>> you are *NOT* using for the ERROR probe.
> No, because that makes the stack too large and then the BPF verifier rejects
> the program.

Just to be clear, do you mean the test program will fail?  Or the test 
program passes, but you simply do not want to add to stack pressure?
