Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 048C12E7BD4
	for <dtrace@lists.linux.dev>; Tue, 12 Aug 2025 18:21:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755022882; cv=fail; b=NDrqvCvlwgSgB8pFfO0vTok/IrvVVDxI1CiNpfLL6u3ZhRbRlKNnuwZwaU6tGigrBho9SMwTjsE3FlwqrdB5EshRMEi/34MHQxbfQbkSvlVkuFeIU71mkS5v0qybON3C8pTPnkjfl8BWnrOfH+NP+hJXTC0WiOAYXhydJt79+1s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755022882; c=relaxed/simple;
	bh=BHjBGLiic3GGAaNBFzNNfiYl3nVQDdimTYXH/pO6dVk=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=NaueLcrt8whMre+753l0SGDoBn6B0aqjEmyd/2tF+CpQmiKqlGrTO3J79zRkXestCIIP0nM0lscmTBFrDKW7xzNpWP555MO7aZpxcS1iqu2P5l2fdyKjKHOrN0U5tlcaPHIWdxd7OQZfcQtastLAA8cILV0IO0IPqY/GBiohWck=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=cHXHUz1k; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=kjXsd2qu; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="cHXHUz1k";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="kjXsd2qu"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57CDBwTl025257
	for <dtrace@lists.linux.dev>; Tue, 12 Aug 2025 18:21:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=s38w6CT3d6b7pAQcEMakpPOHP/C7g6YXZJPiU/7PFfk=; b=
	cHXHUz1keI8A+cvJzGF3n1fqSp+zApKpPddJ7MesCbUriPPlrynrzef92HndoRBh
	8iEoWqiKD6VHk3kQqjS/VbrqDTGIn8J2HuA+QoAGT3uelgHS0AAWBHplDO0q9Noa
	8OFZcFeVnUppmddAhRhkXA6+U2gzfmz9lifYryd1zFaqszCszDGABcIfVH+/dsNl
	4VWSUDHViqzaF6nnw57/iePOPVUArTE1kn2fWU5uu70TVBBdxjhf48/b3hpHIV+J
	nfo4+9qUTFpP80nsw9LCXuTMusXvR8RHqJCQ23k838fW+wT/LLKwjEeGXaVOWJcV
	wUD6H8KVPqk5cqNe9JICDQ==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 48dwxv5afq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 12 Aug 2025 18:21:19 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 57CH8HvM009660
	for <dtrace@lists.linux.dev>; Tue, 12 Aug 2025 18:21:19 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11on2063.outbound.protection.outlook.com [40.107.220.63])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 48dvsgmq2r-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 12 Aug 2025 18:21:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eepEe6K7Z15tHetjs428XOziTJ00jgNzlj6sPd22yqr65jY5nQacx1Luo8XhRynM1iSIdCL+J3D1L4DpnVCZLceEhG8YjyHmA6+istFt3U3i9XAvvZ22S+PxlT9t8gnEgt1RR+Rtg3a+PZlF0BhexuFG09lYd+l9rjMlNs8Ty8b5W437PYQxgJoVU8Yo6EBspYjkSWI2FYQoHKvlKYEwf9g2zgYR7Sh+PqP+hZMidFtqdOSVaiI1YlFnEPHpUCprZ2MjnbqMWUmpsa2aPcxNLeM+SyLOXODXr1Cqgkx2Jih0qUkDShqJjklnMiV5cZSQ2Cc5dZJzIOtUAE8LiTY0fQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s38w6CT3d6b7pAQcEMakpPOHP/C7g6YXZJPiU/7PFfk=;
 b=BhfCVWdb8oDbaS//TiGtajWU2108VDotSLeLmWjdJxufp4Mo0W+vWvAPXKZZh0VowmfLwPF0iXCR9O0fsQuVUVGMObvpvSkKwNJSTxUP//I6u9Smp1Ak4ahgElj9WSOyG4xo84PRaSe8kEgwgm4iV8/YIL33sj0zW4uvlsSroAi9/aTRCDUg0SOUqL+jDGb1PwgXvcejojapKGZ2ipgK7042Pz4OlMM2alr0b9wkF/xZ0CFRZRdFBnMOthgg3udwnQMYsxlRmFw+D922ktFXdc+uFwPzihiLjXfvmM84M/MhC+7Pi7VInph57rX6K7JAdl74sWpWhq0eEiB/u/YMWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s38w6CT3d6b7pAQcEMakpPOHP/C7g6YXZJPiU/7PFfk=;
 b=kjXsd2quMV8NMZNyCBKi3bmL/zpf41wI6F9MRcINobSXVbe3q9Ch86MGMgQzbLxSRuimfyYdMKGFZlmJh0iTb/v1C2cVlT2mAawIWcDUHVk7IFr9XvsHD8xzO4QJDewO9fdmfvoq1xflZkGFw0iyKzZM6LSgIK5DkXWDP23UgIM=
Received: from SJ0PR10MB5647.namprd10.prod.outlook.com (2603:10b6:a03:3da::17)
 by DS7PR10MB4928.namprd10.prod.outlook.com (2603:10b6:5:3a1::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.22; Tue, 12 Aug
 2025 18:21:15 +0000
Received: from SJ0PR10MB5647.namprd10.prod.outlook.com
 ([fe80::8db4:df1d:6afd:e4a7]) by SJ0PR10MB5647.namprd10.prod.outlook.com
 ([fe80::8db4:df1d:6afd:e4a7%6]) with mapi id 15.20.9031.012; Tue, 12 Aug 2025
 18:21:15 +0000
Message-ID: <986613b2-de0b-f4d5-b67e-b59bccbbd109@oracle.com>
Date: Tue, 12 Aug 2025 14:21:14 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [DTrace-devel] [PATCH v2] test: adjust sdt.tst.args.d for
 task_rename tracepoint differences
Content-Language: en-US
To: Kris Van Hees <kris.van.hees@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
References: <SJ0PR10MB5672FDB3619D9510E90ABBDFC22BA@SJ0PR10MB5672.namprd10.prod.outlook.com>
From: Eugene Loh <eugene.loh@oracle.com>
In-Reply-To: <SJ0PR10MB5672FDB3619D9510E90ABBDFC22BA@SJ0PR10MB5672.namprd10.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR05CA0120.namprd05.prod.outlook.com
 (2603:10b6:a03:334::35) To SJ0PR10MB5647.namprd10.prod.outlook.com
 (2603:10b6:a03:3da::17)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5647:EE_|DS7PR10MB4928:EE_
X-MS-Office365-Filtering-Correlation-Id: ea4a9b50-d3b6-4db8-01f9-08ddd9cd066a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?OHJ5Z1BDMTM2OTl6ZzdYWGVNWmptc29yVnA4NWVxVHEwL3hwWC9DcWd4cWhG?=
 =?utf-8?B?VDFVT0s0QUwwaENmR0p4eVI0UmJVRjB3T2QydThUQitUUGlZaVp3Q05VSi84?=
 =?utf-8?B?WDErNks0UkFDRWhGR3BkeDNRQ29PVEszSlJtenYvL3NSTWEwZk90NTJZRUs3?=
 =?utf-8?B?Y2NVSWJqM2FrNGNyTnRqQ3JFc2kzQ2RXa216SG11YWZFZUpoUnFjV2VFVElO?=
 =?utf-8?B?ZHVnS0J4NGlpV3Z0VWhIODBrZGh4WHhoQzZ6Q0xHRWJpTXdFTWNHODc0V3Ja?=
 =?utf-8?B?QUZkR1dvdE5tWnczditXYytmQ3JOTVVUYmx2dXdabDd5eG5VZ2k1VlJsMjhJ?=
 =?utf-8?B?d2ZWNzFzVUtFSEsveGNxd3RZcUdwbllKYlJkWFYrZExXOFRUa2Z0U2t4aWtD?=
 =?utf-8?B?ZmtJQnhzTE9iVitkZEJZc0lHRzh4bGVUcFpKd212ZnczVHRtc0srejJyTzBx?=
 =?utf-8?B?ZVdUK01DekJFWTk5eCs5eVZKLzF1Y3VrQmh5RG5qVVNVcTRPSkVDeFo5YkJq?=
 =?utf-8?B?N0RQL3RXMGlyczF3dUo1b1FXT084NWRsaVd0YUYrSkhRWmxvMThmeXdTaElo?=
 =?utf-8?B?R0hLdEFVK3RZRU9pclh4MVRUMEtwRVdhQ3hBQSt2M2tqUmF1NnFVWHhWR1FO?=
 =?utf-8?B?c003RVJseWsxOEFaTTFhbVNxL1dpZlhuc08yL0hXMkNibDhVcVQ3eVBWcG45?=
 =?utf-8?B?V1duWU84UHU5ZEU0MTBGZm5iRlp1OW9MWmFiMTVlZHR0UFVJRFRyT29wQWN2?=
 =?utf-8?B?NkVxOHAxenVxRDBIODBCVGVNOGRJZ3hOYnE2bmw5aUtoK0trK3JzV05GYTdn?=
 =?utf-8?B?V3R3NXJ4bmRWV2FFQVlFd2VHNHVJa3EwUDZKbDZ3ZmNJSlR4WWpRcHJCRWs4?=
 =?utf-8?B?eFRzNFN2clU0bEF6UGU5dVFyWXFrZk1aaUZEMlFOdm5MSGhIWnM5U1I4bTVQ?=
 =?utf-8?B?bTN4TEtkdXBlK2Rtalg1UEFMS0Z1UlQxVjFtYWp5ZFJtSlBHeVJuYWdqYmV6?=
 =?utf-8?B?U25RWXdQUUx2RlBOU1MzU0FJKzhsMnJnbzBGRkl1NGtkVVRNK0J0TkhLM2J4?=
 =?utf-8?B?a00zaVh0Qk5SZmxsVjdCdkFwNXVqUEtndmw5K2JNZFRxSVBOUDNGUEQxVzJK?=
 =?utf-8?B?NFRtOXBDd0hTbUFVbUVrbVBsOG9rTDNaNVhsa3dNQUpxdDFhOHY3V3ZpR2tI?=
 =?utf-8?B?RWM1RG1DUEMwWVN0U2JNZDBidkY5ajJGNysvTkdudjJpNk02TU9GdlFtQ3I1?=
 =?utf-8?B?Yktmc3NacmhtRTRHMjNadEFWRXVPL0dwQSt4M0xLYktqdmxBVTkybjJ6SEtB?=
 =?utf-8?B?V0lQNUxDcmI2cUxlQXV6dGF5MTFORjdoN29rRTdpK3lsRnVTaVFkbjQ5YTJj?=
 =?utf-8?B?TThjdUNuRDhxNEg1T3NzNktCRjloeGdUdFZtelY3VUp2TVF3cVUrMzNESUFn?=
 =?utf-8?B?WFVMZk1RRnErQno2Mm9VVzE4SjVPcWVXcFRhOENOQmV3V0NZY25RRFdObS9w?=
 =?utf-8?B?cDRrcUZjYVVHOXM4ZFcwaXdqZ3BMTVJYQ1dHbmRCNWRhSnowTi9DR2FiMlVE?=
 =?utf-8?B?NDloM0daSFNaVmJtcHlKUms2WXNmNTFWZ21NTGpkZzZsZ21lTGh5ZXV4a3R3?=
 =?utf-8?B?VGVRQjBnR0Q4Q2NXVkxvSmZaZ210MjBBaGplK1JkVlUzUmkrTkZFbFJsYjdB?=
 =?utf-8?B?RVhCL2RvUUJYY0FTc3VSeXVUOXN3T2JWUjdzZ1g5WGJaM3AvLzFab2d3WDc0?=
 =?utf-8?B?U25hU0hkdE9VZk9pWTd2OEFQZTZ0Skdlcm9oSFB3aGpDbDRnM2dLWmlPUS9t?=
 =?utf-8?B?SHZmWFAxS2RpSnFGSGdVWTdFNHdrN3JvOTJQNldBY28xR082QTUwbFowTGkz?=
 =?utf-8?B?c0ozWWpJbGJDWmRoVXpReTJSdkVXb1A0Y25QaUthQXFlZ3kwb1hCWkZKTE9F?=
 =?utf-8?Q?UKLwbdybSFw=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB5647.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?amhKamJiTTRPajdiY3Zrd2F6TXRDOEVZMzdHUTMvMWlQdkw2U1VzVFEwcjhp?=
 =?utf-8?B?Tm9QdndkUXRDUjhST2JuM3JDVnlScHZtUFNzcEg3QlpXUi9oVUdOamo1MHlF?=
 =?utf-8?B?eSthVVNtOWxoUWNLOGpHS292c1BTSnN3RkdMeWYrUDhRZCtoQ204cC92cXU3?=
 =?utf-8?B?L3ZmajlXNlJzZWdZNzcyeFpoZmEwVXFsTkVRdTIrRlpVaEo0NEZLNVVYRDF6?=
 =?utf-8?B?eXFpVW1rZVJwNUR5eC9ZWjZ4VHpmUnA2TjFhWndTbE1uRU52MUppRkJ6bDRa?=
 =?utf-8?B?c3daeklFSEpmWURCVnR0TmJxYXdaQTc5U1l2cjIyVmpiNHpYR1EvL0NLbXlv?=
 =?utf-8?B?bkRwSkVteUtSSzhHSHNXSjZXeDZqdXcxcXJMMkJycDl4KzVNd2FIWE9UekN1?=
 =?utf-8?B?T3AyZEJ1MFVYeFIrOGlrL244RjRITzBNV0lpZURjcW1HbVBPekt4azJRN2dN?=
 =?utf-8?B?a3ZkeElRVUxIdUNnYXBQbmswTUNjZUx4WVpnbXFWV3hScWsxOSt4eUdZZERX?=
 =?utf-8?B?a3B5M2xOVFE3Um4wQWM0Z0JGS1ZkRUkyaGlLWjRCU0VPaWgzcVYrVmRXNXAw?=
 =?utf-8?B?VitUUUtEcnlPbWNPWWQwMndQRlYzMTMrUi9ybmloN2pqMnErZ0xzOEZkZjRp?=
 =?utf-8?B?Wkcwd2lpcHA2U3RGYytESGlZREtMM3BudXQvOHRDRjhoNlQrbno3cytla3gz?=
 =?utf-8?B?YW5adUdtNC9yNW85djNTNTV5bUc0RFhja2FvVWRCZXRBZkIvNWhNaENPdHhR?=
 =?utf-8?B?NEZSMndod0sxeFdVdGw1eTJTck1YdWJLdWpjVkhQQzR4eTgwSHRLN24rOG16?=
 =?utf-8?B?QUhYNzFCUjQzWUdla1NHdytibGo0cCtGQWhWRG5ScHRyVHNKK1d4dmREczV2?=
 =?utf-8?B?dGJzMzdhSTNiaU5yc2RQTURsMStBRE82aEpuek5wM1R3Ujh6WVphdDZJTVF4?=
 =?utf-8?B?WU1oTGk5SkdOUCtwUEcvU0Y4S2NSTWhsdmRtOS9TM0NuZ211Q3BJVkFpTlBk?=
 =?utf-8?B?aVpjbW9hbWNJQ25XUHdvd09kL1ZBRUV2R3NOSDJZcERtQzFWcWlma01mYzdE?=
 =?utf-8?B?VEo2ZlJxblV3YzVsZDFPNHhHS0Y3OHpBQldrSFNQRmphY0ZiNzhGNXcxdXov?=
 =?utf-8?B?VW1SdG1uSUMzTTJiS09YQWNvelNIVVlMelFHNXVwZWg1VmVFRUJ6Zmlna3lF?=
 =?utf-8?B?T0YxZEpGTG8xVUVtQTQxNFNxZ3BuSGp1L0tHRXR2eXo0ellsM1lnOEdpRTlH?=
 =?utf-8?B?TUw3Mmw2ZUY5cElRbWVjd1FEdnJ2MTJwZVE0Sll6dnN6OWk5OE5EM28yNWxX?=
 =?utf-8?B?ZTF6THFsY0NYSTlnRGk0dHBXN09NSXZUeXdkUGp0T0xaVzlLbUwxVmFSMGxY?=
 =?utf-8?B?a2t6VkhNQkIrajNnRG8rMSsyZWRWVS93UGdNNW9CY1NRSyt1UlJEK2pJb2l1?=
 =?utf-8?B?ZGszRnpOV1RtZW1FT0hMYnh6Vm9aMUYrNDY0Q3dkb3ZFSnJZclc0aDdQRDFO?=
 =?utf-8?B?dXc4S00wbUdIRndCZXdubTFkYVFXc2kyZTFab0RDd3FQL3UvOTgvS1l0NW96?=
 =?utf-8?B?N1IzSk8rK2UzK2lYV2NkL0JqbG9GTE9CZ3BHOVVjTVM3VkhhRTAva1FaeFhV?=
 =?utf-8?B?dHRjbFMvSTFpQWJtWXRDUkZUaktBdUwzMFRZNWZCaU1DYitiSzIyWDIyRGhn?=
 =?utf-8?B?bWpEQjh2dzdQaWJpMUZOcXk1M2tqbTFtYnF4dzJrU1d2eVJrbWVLalNkZWZw?=
 =?utf-8?B?cW5xa00rV2RSNzAyMkZTbXNoS283WklzMzF3aFU0U2k3N0RLb3JCcVVvQnNR?=
 =?utf-8?B?T3JMZ3NVckVYMkVJYVhleC80Yis4djZaYUE0WW9YODJNQ1dVM2xRSTUyVDZN?=
 =?utf-8?B?S1NGb0dmekN0MnRPemVkS29YdWhFczd6Q1NUZFBhaEplZmdBL3F2UEZzT1R4?=
 =?utf-8?B?SUxhNzR5OUpic28yVytpSFhKQ2g2TXpSZm5lbmxxb3M2ZEkwM1NJcG56V2ti?=
 =?utf-8?B?SEp4bXJJY1NpUDNOdVFNNmJjOExENFpSVnE2eHdjWTRVVjdnM3llSEZuUThH?=
 =?utf-8?B?THF3ekdlNzR1QUZBSjlKT3NtcHV5TlBMY2JpTTFUZ1Y3L1lYb0FhUE5OaTRv?=
 =?utf-8?Q?uYoqPzLc8l5A55YlbTfqXaCpJ?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	GvNJfL6CSRvsFl/NNktzRjMFmFyK3Zu0fiGmzHqkAqvuYruvoUQ28CKlXZcTE1eNGphqvtkQfEdy/5071WtknPnCGB0fw4sDgeMqWE1B+9DGHnUH/99q5abBlLVi2mI5b/w2mt9sKXHxtw59l8BCVZZxkJLBVbu6jMyY6ir+lP1CGY4XmIPp5vPads/iVx2kufTP5H02/VDqx0UXaJtvIUdSox4skJQvdE2EPxlxQ5VF+oXJJXzDRDbRXEWOpwzyvT5WisZblVSitf2eQZQcDf2SSGLhmZp8Cn4NinSDgtC0yx1+deO8texPjQ8NJ4zNddaPCEVrfBsJn/gUHrnRFaULu7k/B+Fil8U0u0nYJQSgyIQDrFlvJ/UoOYygaWH7lYxq4Ja6oBZc51rea4nxCHyuN8qc/PPvJVfav3GAqy8qVOe3LsxZaeR3cfX6JQS4RcnyWRMBGSNqaoYuozDVsXSZUnkncGiU1qnFoTsvP7SgtUraZnqE5v+jsuuNtho09fRJOvQE4KkI27w3JHtOGP+AkmtS/Ab/EK3h5LY64RGFP4axpOUjG6CdQt7ws8TeGdOe9Ik7TLI5zJWaBa2QJvrh0QOtFfYshKlCevCnMVU=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ea4a9b50-d3b6-4db8-01f9-08ddd9cd066a
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB5647.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2025 18:21:15.7269
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PAGtWr+H+EZLaVgsAZSfQtI8ltn1Y+RJuKpx5twLOh+R+B931nEnud29Xv0TqqmMk3m+dzhIUb+slqXGuEVUEA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB4928
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-12_07,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 bulkscore=0
 adultscore=0 mlxscore=0 phishscore=0 spamscore=0 suspectscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2507300000 definitions=main-2508120176
X-Proofpoint-GUID: 2R2QlDLyR184mehev26f0YplIGjiUzCV
X-Proofpoint-ORIG-GUID: 2R2QlDLyR184mehev26f0YplIGjiUzCV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODEyMDE3NiBTYWx0ZWRfX2xo/DWq5AL/4
 MihI/l4s+hLQSFxruwkhw2rBjXGxQsypcYCt9hS/V1nTa+MgKfTzAvJO4RmcvvaB9+sDWWFmLfk
 8745g+Qf4ALR58SamVeJKF5bSxcKAq0QnY1mc4ST/1qFsQhJbBiF9NVAsWp+wd0/NhQyBPZv4N3
 G9R1CuFy5el59xuFlNejre/vpET+UefQHS1bn7EIar6lHpnlAm7toyDnyKE6AZ0KJI05kzYJZbI
 AamFIqxsfFX7jAHp9KxCLTMImXOO7vfV9JZ8W2YR/tI+0yMvgXdfy/2uHiorcEuryqyFsSP9hx3
 pi4bPlWH+eCRxVhdEsht7iuQ4fNypEIx3yD4Lu1us3kWT7NJQIwKei0WOEwU9S6jqO80WPLB2vX
 5b8if1+9modLjbqJz+lloPbcXewK/WJZmLQfAc4mIb3jmz8bS86cJ3NUgyrnzqbusZXyHOwR
X-Authority-Analysis: v=2.4 cv=KJZaDEFo c=1 sm=1 tr=0 ts=689b861f b=1 cx=c_pps
 a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=eSGOEz22HbIQEaH1lfIA:9
 a=QEXdDO2ut3YA:10 cc=ntf awl=host:12069

Reviewed-by: Eugene Loh <eugene.loh@oracle.com>

On 8/12/25 14:09, Kris Van Hees via DTrace-devel wrote:
> As of kernel 6.14, the task_rename tracepoint provides only 3 arguments
> rather than 4 (the pid got dropped).
>
> Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
> ---
>   test/unittest/sdt/tst.args-3.d                | 42 +++++++++++++++++++
>   .../unittest/sdt/{tst.args.r => tst.args-3.r} |  0
>   test/unittest/sdt/tst.args-3.x                | 14 +++++++
>   .../unittest/sdt/{tst.args.d => tst.args-4.d} |  0
>   test/unittest/sdt/tst.args-4.r                |  2 +
>   test/unittest/sdt/tst.args-4.x                | 13 ++++++
>   6 files changed, 71 insertions(+)
>   create mode 100644 test/unittest/sdt/tst.args-3.d
>   rename test/unittest/sdt/{tst.args.r => tst.args-3.r} (100%)
>   create mode 100755 test/unittest/sdt/tst.args-3.x
>   rename test/unittest/sdt/{tst.args.d => tst.args-4.d} (100%)
>   create mode 100644 test/unittest/sdt/tst.args-4.r
>   create mode 100755 test/unittest/sdt/tst.args-4.x
>
> diff --git a/test/unittest/sdt/tst.args-3.d b/test/unittest/sdt/tst.args-3.d
> new file mode 100644
> index 000000000..ae070cb72
> --- /dev/null
> +++ b/test/unittest/sdt/tst.args-3.d
> @@ -0,0 +1,42 @@
> +/*
> + * Oracle Linux DTrace.
> + * Copyright (c) 2021, 2025, Oracle and/or its affiliates. All rights reserved.
> + * Licensed under the Universal Permissive License v 1.0 as shown at
> + * http://oss.oracle.com/licenses/upl.
> + */
> +
> +#pragma D option destructive
> +#pragma D option quiet
> +
> +/*
> + * Ensure that arguments to SDT probes can be retrieved correctly.
> + */
> +BEGIN
> +{
> +	/* Timeout after 5 seconds */
> +	timeout = timestamp + 5000000000;
> +	system("ls >/dev/null");
> +}
> +
> +/*
> + * The 'task_rename' tracepoint passes the following arguments:
> + *
> + *	char	oldcomm[16]
> + *	char	newcomm[16]
> + *	short	oom_score_adj
> + */
> +this char v;
> +this bool done;
> +
> +sdt:task::task_rename
> +{
> +	printf("PID OK, oldcomm [%s], newcomm [%s], oom_score_adj %hd\n", stringof(args[0]), stringof(args[1]), args[2]);
> +	exit(0);
> +}
> +
> +profile:::tick-1
> +/timestamp > timeout/
> +{
> +	trace("test timed out");
> +	exit(1);
> +}
> diff --git a/test/unittest/sdt/tst.args.r b/test/unittest/sdt/tst.args-3.r
> similarity index 100%
> rename from test/unittest/sdt/tst.args.r
> rename to test/unittest/sdt/tst.args-3.r
> diff --git a/test/unittest/sdt/tst.args-3.x b/test/unittest/sdt/tst.args-3.x
> new file mode 100755
> index 000000000..80c135543
> --- /dev/null
> +++ b/test/unittest/sdt/tst.args-3.x
> @@ -0,0 +1,14 @@
> +#!/bin/bash
> +
> +read MAJOR MINOR <<< `uname -r | grep -Eo '^[0-9]+\.[0-9]+' | tr '.' ' '`
> +
> +if [ $MAJOR -lt 6 ]; then
> +	echo "tst.args-3.d disabled on kernels < 6.14"
> +	exit 2
> +fi
> +if [ $MAJOR -eq 6 -a $MINOR -lt 14 ]; then
> +	echo "tst.args-3.d disabled on kernels < 6.14"
> +	exit 2
> +fi
> +
> +exit 0
> diff --git a/test/unittest/sdt/tst.args.d b/test/unittest/sdt/tst.args-4.d
> similarity index 100%
> rename from test/unittest/sdt/tst.args.d
> rename to test/unittest/sdt/tst.args-4.d
> diff --git a/test/unittest/sdt/tst.args-4.r b/test/unittest/sdt/tst.args-4.r
> new file mode 100644
> index 000000000..52854c0b3
> --- /dev/null
> +++ b/test/unittest/sdt/tst.args-4.r
> @@ -0,0 +1,2 @@
> +PID OK, oldcomm [dtrace], newcomm [sh], oom_score_adj 0
> +
> diff --git a/test/unittest/sdt/tst.args-4.x b/test/unittest/sdt/tst.args-4.x
> new file mode 100755
> index 000000000..74a0234bf
> --- /dev/null
> +++ b/test/unittest/sdt/tst.args-4.x
> @@ -0,0 +1,13 @@
> +#!/bin/bash
> +
> +read MAJOR MINOR <<< `uname -r | grep -Eo '^[0-9]+\.[0-9]+' | tr '.' ' '`
> +
> +if [ $MAJOR -lt 6 ]; then
> +	exit 0
> +fi
> +if [ $MAJOR -eq 6 -a $MINOR -lt 14 ]; then
> +	exit 0
> +fi
> +
> +echo "tst.args-4.d disabled on kernels >= 6.14"
> +exit 2
