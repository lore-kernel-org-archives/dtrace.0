Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1277626FDB2
	for <dtrace@lists.linux.dev>; Thu, 23 Oct 2025 19:27:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761247654; cv=fail; b=oAfJUs/W3+EVZbGT1e9j6rO8yu4MXFlE4FkcouGpc6XD6+UJV8cWOZj8fwgNdRNYfGqh+S2ZX3L0s7eqGZPnNI0vCvYsjcPbj+3hAQiHW7hmsY1KPrAPBiHNoRUziK4SnL8Ogl0/t2fkquaIesNNslB4RTP3pjlFrWWqJo6XrNc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761247654; c=relaxed/simple;
	bh=3+9VNgO5QpF1ek2jGCnHRM0tTNExtabL3Av8m+LmZ/g=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=WMGiQP35n0KiECtBssU+zgYTDK0/zBp7FMWzbb+6e9CnWZY8CmRM/v1FTOhgpb9qNMiD4lIul+v3kFL6zlnndTrHOuHWigXEnmqnu6GKK7oxjf9jsqNucYBjA9xmz0kDzfzNXz8N16aEyBqNrUpuAIRa8CJZvomJ9FgTiWs/E6g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=H3FCgthQ; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=YgjWe9p5; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="H3FCgthQ";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="YgjWe9p5"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59NIC14v018335
	for <dtrace@lists.linux.dev>; Thu, 23 Oct 2025 19:27:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=AVkUt+ZaGCTbec8X0VrCCLsW3pIjw2wtI6OxN0ycg/k=; b=
	H3FCgthQ2bAKn/IlpW8YtmVFwhg8F6v1D4NWb6rtQUzbUQF6ki2cpogm+2jQsIC8
	EMEvNhLg7WKbK3usR7QZMgO4vbivZ/Z0CL/dg9K3n8dluj1jVWIEWHQM+uS3q53A
	5LoCSw5Dqu0O7ki4krN33JjmxvfCPiI2q/Eu7pFBKWjnVxyC8GmLugRyokBuHvWt
	MXW11lgdi1euo2g9IHV/8YiaYP2JEBQlf4HL3xe5uMCHo40c/LxTpxQq7tM5uBNu
	frw1iVkP8mtXpaSPxXv5K+vw05ZTrmvKKU2OI6zzaS5teD/gxxVMq61YCyX1FCUs
	57ePIbu/orMUoMQZtbRjPw==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 49xvcybaqs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 23 Oct 2025 19:27:31 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 59NHnOUQ022322
	for <dtrace@lists.linux.dev>; Thu, 23 Oct 2025 19:27:29 GMT
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11010015.outbound.protection.outlook.com [52.101.56.15])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 49v1bg1mex-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 23 Oct 2025 19:27:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QMtI6LMdD/2zRC8imHoNHXc8yYEZTy7N0eFxbt7DgAOAhyR4NB8WDPEm65IKJnFB0GzhPuFeSfSSzyjWsUdqXbeUbE/zeCuMzyxbcQu1dXSF2TdTgEsbURZ72NDbaooKco+cprHBZXBRdrJoli3BAMHn3gJ8mVkwBlAGkrjzFRKQzcSyg4r6SIgxhyu++HqS7Y1JXMthammEvHZlqzcbkW6ZzvmkFZbT4/bjvrZotG0OWM9vKHlXbSkwGQhOsliEW2N/372/pKTTafg+uaPLF8XwCQY6kbpIFshdUQErh2lrq17AeTghn2Rg9A3CjlvhKsIIQh6r/JG/CRj9LTjSCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AVkUt+ZaGCTbec8X0VrCCLsW3pIjw2wtI6OxN0ycg/k=;
 b=LbQNL7UljTk8MBzcFCYF9koJOTbZQ9lhb0jAqLWKB33Zaci0aa6dHJItc+Myfnz5hLO/AxYR3Ni05JKaoDrHALDURYtVtyO2QNQMtb0ecHI9lh4aQqDBPQnwa3uWpIano5eaKQxVthTVMhBusYThUPJ2ETDf5o0gJE22vApj+wQ7V1qb1UJPY8EJxM+Ri16gj2mZyemIMATz27KjWM9pnoUPj4KmeTaMRs3mohS0T3465szohxocQnW3gRXOfVwka+E4kyY+gFksF1XNKVlKKwUr6DHtd8B3SuPl8NsDsydUmRexNVcFxPHHGwx7sjfzgxaPN9XtRDpBk1hm2q0aMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AVkUt+ZaGCTbec8X0VrCCLsW3pIjw2wtI6OxN0ycg/k=;
 b=YgjWe9p54OIbmk2mLimo+nVEldCovDk/X8GPiGKrDRMzAwm4iwcq3ISbWfPZue2unD5fWCHZLuMLotEr5TY9hghWtWP1+k71SW+I0GImTY2ZYDgF5EG8fD23hHVLKkZ6M/dDUck0lmxAvbcA+12YYQTzRS3bMW4wQxBAW4tCXtY=
Received: from BLAPR10MB5075.namprd10.prod.outlook.com (2603:10b6:208:322::19)
 by PH7PR10MB5700.namprd10.prod.outlook.com (2603:10b6:510:125::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Thu, 23 Oct
 2025 19:27:25 +0000
Received: from BLAPR10MB5075.namprd10.prod.outlook.com
 ([fe80::8f5:4de9:81ce:f5c6]) by BLAPR10MB5075.namprd10.prod.outlook.com
 ([fe80::8f5:4de9:81ce:f5c6%5]) with mapi id 15.20.9228.010; Thu, 23 Oct 2025
 19:27:24 +0000
Message-ID: <5514345c-7166-4086-ac38-5670fcf3a497@oracle.com>
Date: Thu, 23 Oct 2025 13:27:21 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [DTrace-devel] [PATCH v2 09/20] doc: Fix anchor links for
 providers
To: eugene.loh@oracle.com, dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
References: <20251022032251.2010-1-eugene.loh@oracle.com>
 <20251022032251.2010-4-eugene.loh@oracle.com>
Content-Language: en-US
From: Elena Zannoni <elena.zannoni@oracle.com>
Organization: Oracle USA Inc.
In-Reply-To: <20251022032251.2010-4-eugene.loh@oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: CYXPR03CA0011.namprd03.prod.outlook.com
 (2603:10b6:930:d0::19) To BLAPR10MB5075.namprd10.prod.outlook.com
 (2603:10b6:208:322::19)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BLAPR10MB5075:EE_|PH7PR10MB5700:EE_
X-MS-Office365-Filtering-Correlation-Id: 813e6a9d-7ace-4f4d-891d-08de126a314a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|10070799003|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?S0pmSjFod1lVc2h2dGJIdmlkZkdqdDhDTWFrSUdLVDUvTnZDaW5hMUNxQ2xW?=
 =?utf-8?B?dmg5Nlp3SjI5bklBTkdZTS9pcjFDc1ZTNzVlUm54U3doSk5jeXNIa0ZKSWVF?=
 =?utf-8?B?MlZYZ0xFNkJWYkZmYy9qcVM2UGtQczN4N0tPTkJjeUs0ZkdtSEpoeldSMlRz?=
 =?utf-8?B?eTNPYVh0bWx3WjROeDdEYndwNTJYNzZDRWVWM3dSVzJoa2l4Z2lQSDJwNnJT?=
 =?utf-8?B?ZHFBSjdMc0M2VCtVNndKN2JUSGlaakduRXZISXNWYXl0S0dvdkFNZDkyYXBU?=
 =?utf-8?B?VE45cGNxQ0hpOU1oZ2VZMXl3ejk2Q1hJbVBTdTFPY0NGYmxLWFZqZUhEVjNp?=
 =?utf-8?B?NlhNb1g2TWlpemJqRXRYMTk4OHRtUDdIdU03ZWI3VFZySFJGL2hoVEx3N0hK?=
 =?utf-8?B?ZmR0WTB6VmREa0pDSGlnazkwb1VWenFwdFVyQ0tncDFCOEdlc0JpdHBwM3RF?=
 =?utf-8?B?b0ZGMzdrdW9yemQ1a05SaGVublJnbjNFNUZTUkxUbTNIV2ZoTUNVTzlhb2M2?=
 =?utf-8?B?WEpDc3RTenY0aUlqMkY5ZGxRUTZGV2ZUM1BTSzlUaWR2V0FaZ0F4WXcxQXo0?=
 =?utf-8?B?MFpPeDhXRWFRdnpOZmJBbktwVnovYit5R3VHaE11cjUrbFY5RUNGeTBpWmFW?=
 =?utf-8?B?anpKSGFhaWZCaytKTXRQN1Y0ZmxRalN4eXh3K1hiYXdDcXBwaVVPb25qVFF2?=
 =?utf-8?B?WkloOGZ1NHFJbWlSS1JxbElOMWlZNmhLdUhkamErYmd3UXBWQm5qaFN6Tisx?=
 =?utf-8?B?S01aL0ZXdDk2Qm8rKzIwc3kzNnh0UkdEc2ltWnBGZzltWWRuem4wdG50WENn?=
 =?utf-8?B?ZXBnWjVUR081QTlKclM2a2Rydy9YOTJheU1abEtsbmJ5eGtxSktjY0wrWUxm?=
 =?utf-8?B?a1dWQStFaDBQTjhTTiswMmQzSnVOZklFblUrZCtwbU5CNzFBWHQrUnd4L3pH?=
 =?utf-8?B?cms2UVY3TUllSnovRGxiUFJKQTV0VmlKR1YxbnF3ZzZ4UVBYZlY5c3ZkYW95?=
 =?utf-8?B?WjR0dWU2T2owSU9keDJXOUdqQ2JqOXRhbXZCcGxpRXlGOExGVjd6OTFKZXMr?=
 =?utf-8?B?VE1JUitQNTRsQTJiU2hiN3UzcHpsZEkycDdWOUFSanB6dXVxcFZHZUJVL01B?=
 =?utf-8?B?b0dWa3gyYXBuRlRiVXFNTzJ0S3FDZnlpUjEzN2NvRlBhSmoyWlFnZ2hwYVZy?=
 =?utf-8?B?cUFubWpYWU9VOXBaZFZGYTA2SCsweDcvajNnK0xUYlI0bmpMOUQwZm4rckVv?=
 =?utf-8?B?bWpQdDhhZXFreVpqVEpxaFB4MEJKZnh1bHRSeHNJYTdWR2pjaDkvSmlxMlpt?=
 =?utf-8?B?TEMzNGE2SmpLclBuTFdIRzM3TnFEY04rSXZvTDV0WUl4Zk9uZENYV0lJV2Za?=
 =?utf-8?B?VWVYVjNTVzNueTRLakV6cHJkdVNHSVdRT1pXRGFkQ1pCdm9FbDk1ZkxTWksr?=
 =?utf-8?B?ZE16ZEp1aDBPRzB4N3AyQTMreCt0TXNZTFdrRTNJUUlKNTNTY1lLUW1wUm1H?=
 =?utf-8?B?ckJpVE1qR0QzUHFuYjlZVkRTdDNVVVpvdVYzd1BnWHUrZzRhbFpnZzZ6Z1ZG?=
 =?utf-8?B?VDlmREdmUVZoOEdQM1ZGNGc4OXlCN1ZVSWlZRHNsM05WTGhESzBVcDRQVmlM?=
 =?utf-8?B?Z0tmVjN2N3JaU290cmFseW44TTBKR2g5TlhGenNXdnhQT1haNlFnZFBXQms4?=
 =?utf-8?B?TmtPWG9HQkEwSVQzY0FmZHhPdFpWUWNFTnBQVzltdEhvQlFHSzFQYnlBT2Zv?=
 =?utf-8?B?ZGg0bHprUG84N3ExNWhzYTVGV1ZJOXhleG9MSUl2cU5GaEFrajBjY3pwZDFq?=
 =?utf-8?B?cklnNXVVdjBwZTg4citnRXlXZ0p3YXlPUUc0OEpYRHJXb1RMcHRzbXd0MnJF?=
 =?utf-8?B?RFg4QTZlWlZWVm9wL0JlT0hRY09CS0VvL0c2elMxaW9Kekp1MitXQXBsVG9n?=
 =?utf-8?Q?q3JOiohxrXWzIpPW/wucUyCLAj325FOk?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BLAPR10MB5075.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(10070799003)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UG5tcjlwK09sVTFpMFJMMkdkQmxIOFdBM01DMEhHaWV6U2V1V3pBZURhVXNW?=
 =?utf-8?B?UDdvUnFKMFJRWnc1ZEVVb0E2UTFNd1pLVzZ6Ny9CMzlVSFNCMDNSTjNOZnZs?=
 =?utf-8?B?TmVpdnRWMUZWYlpmc1d6QXFQZWNBTmd5QStKZTN5ZkpHUExsR0x0UjJHcWdz?=
 =?utf-8?B?QkNsZXRJdUJPMnZDYjhyUVlpQ0RkeGdDaEhhaGpOeWFKWHpKNUFrUWlXaW9q?=
 =?utf-8?B?TElSS0F2TktycXZJNGxXRFJhYVRqRHNWa2RNNzh4a0hITkZJZmFXK0NMelFT?=
 =?utf-8?B?ZjJyak1mN2FiMXZKVkJ4Y2Fjd0czcnJGL2JxWkVSNmV0NTcvNDMyenhCUTlR?=
 =?utf-8?B?OVJ4RkJwOGxSY21HL2hxUDlvOUNTbS9CTGJrS0xiMTMrZm0yMHBUMEo0VnBw?=
 =?utf-8?B?eGw1SXF0TVRKRGhPdVBHWU1xUUZ3WUxNOExSb09wN3lPZ2R4WHVvZFJMenQx?=
 =?utf-8?B?R1BpN05BUzBkb3pMWXJXeUlEZTR4R0dDRHo5SzR1N25adlNkdm9ZSVhPK1ZX?=
 =?utf-8?B?aVhDbHBzanI3bEFKMGxBeHBxSndmSkpOQVd4S01zemw2OTB4N2E2SVVkSXJl?=
 =?utf-8?B?S2I1SDlWSTB3QWUxRU1KQ1FJRmlPL0VvUW5WU0F0ZERsQzNFYVRvR201QjN3?=
 =?utf-8?B?TXhJQmNEczBLREZvUTMweGt5eUVWbU56UWZXQSt4UkZZUE9HTG14WGRUWkNM?=
 =?utf-8?B?VkliWFYrVHhya1RuOStBQk5ZYkFqcFBVV0xBa09CK3BWRzgwQ293L0N1QnhT?=
 =?utf-8?B?QTRPN0w1dGFuMFNEZzNMYUQvOGZLMm81amo5eitPdjZKVGhQWGhsSEJ5c2lo?=
 =?utf-8?B?Z2VXcHZtUklFSS81K3ZkdTJ4QVlBU0hOYy9MOXdsbjcvRDVRYzBOR2NhT1N0?=
 =?utf-8?B?OGpnOGR6T3NDRCtYVDR1YXVkeW55d3JvOU5WVktnSkRPZnpHd1RpYUE5Wkpx?=
 =?utf-8?B?TGdyQUdUZTBWVHBObmxqYkg3a1FqSU12ZDBMSlVsdExXNHpSQ2t2UlBXK1ox?=
 =?utf-8?B?NDVGVHFkK2xUenM0dUMrU0RNaCsxWGNjbXdIclMycktNdUtjOWk5N3lqeEI3?=
 =?utf-8?B?ZVpzMVlDU1ZuSHFUbGlJVndBQ1N6azlqTkx0QmFDbTJ2VDEyRlgxVVNhRERZ?=
 =?utf-8?B?b3lkSzVsN1pidDdDYm1uYUZWWXRVakRBc3pSL2ZIOVlEM21kSTVQdmFJdXR6?=
 =?utf-8?B?QTdyMnhCeU1rTnB1VS9MS0JJVUlnRWsvYkQrdXVvSklrOFBTNjdNRkJmd0ln?=
 =?utf-8?B?MlpJN09ZYW55YkFDWEQvQ3U3a2FlTmFLSHRWYnFkZ1pIeEkwK3JyMGYvTnFW?=
 =?utf-8?B?TnZTWnRTZGZwdmp1T2VGSnBoRFFSWnNvRnNXQXJ4WVFFa29KY1BWOW4xNEtu?=
 =?utf-8?B?eWswaVNtZytwVjRzS1BrSmJsSGdoSHUvNkdQaGxmcHhOK1ErZzQ1Rm9YV2d1?=
 =?utf-8?B?bmZxdVQvUWgxVCtpdEJEK2t2ZGZYeERFajFabWxEdkZaQzVSKzhMM1NMbVAw?=
 =?utf-8?B?Nk5PWWhJVExOQUo4b0FPSjVzUDFXOE1TcUxmN1gxUEdab2VWd3RwbTNlWE5F?=
 =?utf-8?B?NlUxQ0lySjA1MVlCZjM4VzUrKytVK2RZR2IwMnFIbURGZ0drbVBlSUhhTXVY?=
 =?utf-8?B?NUpWL0RUMk9vRXFhZnNHcGt2OTV2TmJvUjNWWmhuYjhJSU5ydXlaT1MyenJN?=
 =?utf-8?B?UFVBb2txdmVVeFhEZHNuZlFCWUwzZUV2OUdndXByOEkrTHpjZ1I0RHRkaE1q?=
 =?utf-8?B?V3d6QVM5QUw4azEzczR3dWdYMjVpRy93a1Bic3dmc0hJR0VHdys5bkRFU0dE?=
 =?utf-8?B?ejRjcXViQyt4K0UzOUVkZG95V1BuaWxqMytpeUtCaFM4dHNUeVVFd3NxcXNh?=
 =?utf-8?B?RG1MbzJEN2lHTldTMTZWSXpMVzNYR2ZFOVoyb3hXMmFqejZBbFpjSk83QlF3?=
 =?utf-8?B?TzBTT1h1OTllQS85MzdKdHJKTDF1OGp0V01LbUV2cVNtTmFlaFVvR1N0OXR4?=
 =?utf-8?B?N3AzZktzaUFZSkFJRjN1N3NISGRkVnlSQVVqdnp2Lzk0M1R4TDZ2Yk55bk5q?=
 =?utf-8?B?TGxBT0ZJMUN3QkNHVU1EZ3gyWnM3Vm9aMmp5M29pdk0zQkU0S1Qxd0pZT3Vu?=
 =?utf-8?B?ekhlYy9ldDlITE1XMVpNOExMelpmWVBCOWh1ZURPTGtqSTN0MG1qbXh5OTJl?=
 =?utf-8?Q?hSonOSi9Vz5jAsG5D/mGaxQ=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	lSrXduFafyj7Gm9G83Qel4gRBKgcAA2k4KUD8VDD5MdQH9Kky2uaopAxftnoza1w+hz3v3Do8aIBN6SKZX2m0JZCbomEGqg7y8QZ027A5xJm1Qkia3Tyh8OIBqKo2eAP0EjTIAurxycqnCP0YnzKeCCv7Y5FOwk7OcT7hdYvTefjGQIC6Hcy/SEuc1wOS5ENQt4nzSzaPOPb6RJMzB4dOiQjMjxCB8Yp6Oo1rBFmKc6TproJiGPd4rmdH3wpYX2eSn2V0VxnsrNR3EAxmwNmQ9zsYlBF9N/r8sulF25QeSpKuli4a34u11j1ngZliK87HD/tFzdxgsvgj25SlmHfNo+z1iX2ffxxCqi99OymV5bVK7vBUMR+ddsKrXm8+9Ncf1SL7rcSNZSNROpWb2AK3gfMG+oFRWO1FciMGWUKWG1YdWzsRxWI6On8Vbi3tZmO7vyjYhdueReVTMYrCoUHB2EOFRLgnycTEa8JAi23bHi9OB0grJOALh/lMPpQN4wpvnC6UBJTbLWXq1/w2gKdieDebef7y5IAOwjDFxb7Rvn/3+qpOiFI0MUTWquWhi7l7nVwrVIl9afH6KXROpsFCvyyVo17WkdBqgD90mDbjsc=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 813e6a9d-7ace-4f4d-891d-08de126a314a
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB5075.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2025 19:27:24.5427
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0KnyhITpv3LhuZJmfbnqxSlTaiqaHRixis9mliYiE3cd4ZGMdiR57kPosYJq721MLcMr9YLn+KultruE5kW3Kao0JoDpPiw/+IFlqCeHQSA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB5700
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-23_02,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 mlxlogscore=999
 phishscore=0 bulkscore=0 mlxscore=0 adultscore=0 malwarescore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2510020000 definitions=main-2510230178
X-Authority-Analysis: v=2.4 cv=GqlPO01C c=1 sm=1 tr=0 ts=68fa81a3 b=1 cx=c_pps
 a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=x6icFKpwvdMA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=yPCof4ZbAAAA:8 a=SGGqjbfofPls9mMUoLsA:9 a=R9yh0YoDam0GcCW_:21
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 cc=ntf awl=host:13624
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDIyMDA3MyBTYWx0ZWRfX45HVcKN2e9lJ
 OWPz4vA+8T0G150pVyLBdGo2lu2zczyDlWYHO/tjpmntkA8+s9XukS789tFGLAwLq1zdEE01WTC
 IBIlKDOmKZxRSFqLPeMd2a+a/edDsWe1RVGnBe52fh0NrFFwjMVP1aS2SY/1LGmpWvmeV39Q79y
 QOOLLth1Fd3oQeAZZ3L+cGvFu9bEkCrZ1/+/MblehAjk9EaPod0Qp2y7BgL4ggYxmOPYtWS8Uvu
 AvfbWtYX/4NrbpWKcD1qeW0bFfcCyK6ZtWfOMApoRMgE90REn8L3GiCrtuq7vLuNECotAAsNC+c
 pRwFNRhQltRi8PWdYn0pd3YooI0WlvDVV/ChuDE4dklqlFNnwyNeOaGlyr/sRDdEJlGo16ZZKXL
 UMvKzyV3xDFwOqrct8nE6ESn1pQUdBOg0E1mFMcn4ch/G83Kehs=
X-Proofpoint-GUID: aJeweR1rdaqF-qKXPoaG8PNPyxKpH9WS
X-Proofpoint-ORIG-GUID: aJeweR1rdaqF-qKXPoaG8PNPyxKpH9WS


Reviewed-by: Elena Zannoni <elena.zannoni@oracle.com>

On 10/21/25 9:22 PM, eugene.loh--- via DTrace-devel wrote:
> From: Eugene Loh <eugene.loh@oracle.com>
> 
> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
> ---
>  ...StaticallyDefinedTracingofUserApplications.md | 10 +++++-----
>  doc/userguide/reference/dtrace_providers_cpc.md  | 10 +++++-----
>  .../reference/dtrace_providers_dtrace.md         | 10 +++++-----
>  doc/userguide/reference/dtrace_providers_fbt.md  | 10 +++++-----
>  doc/userguide/reference/dtrace_providers_io.md   | 16 ++++++++--------
>  .../reference/dtrace_providers_lockstat.md       | 10 +++++-----
>  doc/userguide/reference/dtrace_providers_pid.md  | 10 +++++-----
>  doc/userguide/reference/dtrace_providers_proc.md | 14 +++++++-------
>  .../reference/dtrace_providers_profile.md        | 12 ++++++------
>  .../reference/dtrace_providers_rawtp.md          |  4 ++--
>  .../reference/dtrace_providers_sched.md          | 14 +++++++-------
>  doc/userguide/reference/dtrace_providers_sdt.md  | 10 +++++-----
>  .../reference/dtrace_providers_syscall.md        |  8 ++++----
>  13 files changed, 69 insertions(+), 69 deletions(-)
> 
> diff --git a/doc/userguide/reference/dtrace-ref-StaticallyDefinedTracingofUserApplications.md b/doc/userguide/reference/dtrace-ref-StaticallyDefinedTracingofUserApplications.md
> index 7548bad83..e8298dea8 100644
> --- a/doc/userguide/reference/dtrace-ref-StaticallyDefinedTracingofUserApplications.md
> +++ b/doc/userguide/reference/dtrace-ref-StaticallyDefinedTracingofUserApplications.md
> @@ -1,5 +1,5 @@
>  
> -# USDT Provider {#dt_ref_usdt_prov}
> +# USDT Provider <a id="dt_ref_usdt_prov">
>  
>  Use the USDT provider, for user space statically defined tracing, to instrument user space code with probes that are meaningful for an application.
>  
> @@ -9,7 +9,7 @@ USDT is for user space processes. For kernel modules, statically defined tracing
>  
>  **Parent topic:**[DTrace Provider Reference](../reference/dtrace_providers.md)
>  
> -## Defining USDT Providers and Probes {#dt_ref_usdtprobes_prov}
> +## Defining USDT Providers and Probes <a id="dt_ref_usdtprobes_prov">
>  
>  Define USDT providers and probes in a `.d` file that you add to the source code. For example, a file `myproviders.d` contains:
>  
> @@ -37,7 +37,7 @@ The following example traces all processes with `myprov` probes, even if they ha
>  sudo dtrace -Z -n 'myprov*:::my-put { printf("put %d %d\n", arg0, arg1); }'
>  ```
>  
> -## Adding USDT Probes to Application Code {#dt_ref_usdt_probe_add_prov}
> +## Adding USDT Probes to Application Code <a id="dt_ref_usdt_probe_add_prov">
>  
>  Consider this C code `func.c`:
>  
> @@ -66,7 +66,7 @@ You can place probes in the code, referring to the probes by using the macros, w
>  
>  An optional optimization is to test if a probe is enabled. While the computational overhead of a disabled DTrace probe is often similar to a few no-op instructions, setting up probe arguments can be expensive. In this example, `bar(1111)` and `bar(2222)`might be costly function calls. Therefore, for each probe, DTrace also supplies an `is-enabled` macro, named by appending `_ENABLED`. In the example, `MYPROV_MY_PUT_ENABLED()` for the `my-put` probe, to help minimize the cost of any work associated with disabled probes.
>  
> -## Building Applications With USDT Probes {#dt_ref_usdt_build_prov}
> +## Building Applications With USDT Probes <a id="dt_ref_usdt_build_prov">
>  
>  The `dtrace` command becomes part of the build procedure, which can be thought of in four parts:
>  
> @@ -101,7 +101,7 @@ The `dtrace` command becomes part of the build procedure, which can be thought o
>      ```
>  
>  
> -## USDT Examples {#dt_ref_usdtexamples_prov}
> +## USDT Examples <a id="dt_ref_usdtexamples_prov">
>  
>  1.  Create a file `myproviders.d` that contains:
>  
> diff --git a/doc/userguide/reference/dtrace_providers_cpc.md b/doc/userguide/reference/dtrace_providers_cpc.md
> index 39b2ca6f5..742fd001b 100644
> --- a/doc/userguide/reference/dtrace_providers_cpc.md
> +++ b/doc/userguide/reference/dtrace_providers_cpc.md
> @@ -1,5 +1,5 @@
>  
> -# CPC Provider {#dt_ref_cpc_prov}
> +# CPC Provider <a id="dt_ref_cpc_prov">
>  
>  The CPU performance counter \(`cpc`\) provider makes available probes that are associated with CPU performance counter events.
>  
> @@ -11,7 +11,7 @@ Start with higher event counter values for CPC probes and reduce them through tr
>  
>  **Parent topic:**[DTrace Provider Reference](../reference/dtrace_providers.md)
>  
> -## cpc Probes {#dt_ref_cpcprobes_prov}
> +## cpc Probes <a id="dt_ref_cpcprobes_prov">
>  
>  Probes made available by the `cpc` provider have the following probe description format:
>  
> @@ -29,7 +29,7 @@ The definitions of the components of the probe name are listed in table.
>  
>  Note that when you list CPC probes, example count values are provided in the probe listings. The count values are artificially set high as a guideline.
>  
> -## cpc Probe Arguments {#dt_ref_cpcargs_prov}
> +## cpc Probe Arguments <a id="dt_ref_cpcargs_prov">
>  
>  The following table lists the argument types for the `cpc` probes.
>  
> @@ -40,7 +40,7 @@ The following table lists the argument types for the `cpc` probes.
>  
>  As the descriptions imply, if `arg0` is non-zero then `arg1` is zero; if `arg0` is zero then `arg1` is non-zero.
>  
> -## cpc Examples {#dt_ref_cpcexamples_prov}
> +## cpc Examples <a id="dt_ref_cpcexamples_prov">
>  
>  The following example illustrates the use of a probe published by the `cpc` provider.
>  
> @@ -56,7 +56,7 @@ cpc:::cycles-all-50000000
>  
>  ```
>  
> -## cpc Stability {#dt_ref_cpcstab_prov}
> +## cpc Stability <a id="dt_ref_cpcstab_prov">
>  
>  The `cpc` provider uses DTrace's stability mechanism to describe its stabilities. These values are listed in the following table.
>  
> diff --git a/doc/userguide/reference/dtrace_providers_dtrace.md b/doc/userguide/reference/dtrace_providers_dtrace.md
> index ef62c5040..cfe485848 100644
> --- a/doc/userguide/reference/dtrace_providers_dtrace.md
> +++ b/doc/userguide/reference/dtrace_providers_dtrace.md
> @@ -1,5 +1,5 @@
>  
> -# DTrace Provider {#dt_ref_dt_prov}
> +# DTrace Provider <a id="dt_ref_dt_prov">
>  
>  The `dtrace` provider includes several probes that are specific to DTrace itself.
>  
> @@ -7,7 +7,7 @@ Use these probes to initialize state before tracing begins, process state after
>  
>  **Parent topic:**[DTrace Provider Reference](../reference/dtrace_providers.md)
>  
> -## BEGIN Probe {#dt_ref_begin_prov}
> +## BEGIN Probe <a id="dt_ref_begin_prov">
>  
>  The `BEGIN` probe fires before any other probe.
>  
> @@ -34,7 +34,7 @@ syscall::mmap:entry
>  
>  The `BEGIN` probe fires in an unspecified context, which means the output of `stack` or `ustack`, and the value of context-specific variables such as `execname`, are all arbitrary. These values should not be relied upon or interpreted to infer any meaningful information. No arguments are defined for the `BEGIN` probe.
>  
> -## END Probe {#dt_ref_end_prov}
> +## END Probe <a id="dt_ref_end_prov">
>  
>  The `END` probe fires after all other probes.
>  
> @@ -64,7 +64,7 @@ As with the `BEGIN` probe, no arguments are defined for the `END` probe. The con
>  
>  The `[exit](function_exit.md)` function causes tracing to stop and the `END` probe to fire. However, a delay exists between the invocation of the `exit` function and when the `END` probe fires. During this delay, no further probes can fire. After a probe invokes the `exit` function, the `END` probe isn't fired until DTrace determines that `exit` has been called and stops tracing. The rate at which the exit status is checked can be set by using `statusrate` option.
>  
> -## ERROR Probe {#dt_ref_error_prov}
> +## ERROR Probe <a id="dt_ref_error_prov">
>  
>  The `ERROR` probe fires when a runtime error occurs during the processing of a clause for a DTrace probe.
>  
> @@ -311,7 +311,7 @@ None.
>  </td></tr><tbody></table>
>  If the actions that are taken in the `ERROR` probe cause an error, that error is silently dropped. The `ERROR` probe isn't recursively invoked.
>  
> -## dtrace Stability {#dt_ref_dtstability_prov}
> +## dtrace Stability <a id="dt_ref_dtstability_prov">
>  
>  The `dtrace` provider uses DTrace's stability mechanism to describe its stabilities. These values are listed in the following table.
>  
> diff --git a/doc/userguide/reference/dtrace_providers_fbt.md b/doc/userguide/reference/dtrace_providers_fbt.md
> index 885d59230..295a21d83 100644
> --- a/doc/userguide/reference/dtrace_providers_fbt.md
> +++ b/doc/userguide/reference/dtrace_providers_fbt.md
> @@ -1,5 +1,5 @@
>  
> -# FBT Provider {#dt_ref_fbt_prov}
> +# FBT Provider <a id="dt_ref_fbt_prov">
>  
>  The `fbt` \(Function Boundary Tracing\) provider includes probes that are associated with the entry to and return from most functions in the Linux kernel. Therefore, there could be tens of thousands of `fbt` probes.
>  
> @@ -15,17 +15,17 @@ Because of the large number of FPB probes that are available, be specific about
>  
>  **Parent topic:**[DTrace Provider Reference](../reference/dtrace_providers.md)
>  
> -## fbt Probes {#dt_ref_fbtprobes_prov}
> +## fbt Probes <a id="dt_ref_fbtprobes_prov">
>  
>  FBT provides an `entry` probe and a `return` probe for most functions in the kernel.
>  
> -## fbt Probe Arguments {#dt_ref_fbtargs_prov}
> +## fbt Probe Arguments <a id="dt_ref_fbtargs_prov">
>  
>  The arguments to `entry` probes are the same as the arguments to the corresponding operating system kernel function. These arguments can be accessed as `int64_t` values by using the `arg0`, `arg1`, `arg2`, ... variables.
>  
>  If the function has a return value, the return value is stored in `arg1` of the `return` probe. If a function doesn't have a return value, `arg1` isn't defined.
>  
> -## fbt Examples {#dt_ref_fbtexamples_prov}
> +## fbt Examples <a id="dt_ref_fbtexamples_prov">
>  
>  You can use the `fbt` provider to explore the kernel's implementation. The following example script creates an aggregation on the number of times different functions allocate kernel virtual memory. The results of the aggregation are printed when the script exits. This would help somebody to monitor what functions are memory intensive. Type the following D source code and save it in a file named `getkmemalloc.d`:
>  
> @@ -74,7 +74,7 @@ Running this script results in output similar to the following:
>  
>  The output shows the internal kernel functions that are making calls to the `kmem*alloc` system calls and can be used to find which kernel functions most often allocate kernel virtual memory on a system.
>  
> -## fbt Stability {#dt_ref_fbtstab_prov}
> +## fbt Stability <a id="dt_ref_fbtstab_prov">
>  
>  The `fbt` provider uses DTrace's stability mechanism to describe its stabilities. These stability values are listed in the following table.
>  
> diff --git a/doc/userguide/reference/dtrace_providers_io.md b/doc/userguide/reference/dtrace_providers_io.md
> index a458ab284..40851042c 100644
> --- a/doc/userguide/reference/dtrace_providers_io.md
> +++ b/doc/userguide/reference/dtrace_providers_io.md
> @@ -1,5 +1,5 @@
>  
> -# IO Provider {#dt_ref_io_prov}
> +# IO Provider <a id="dt_ref_io_prov">
>  
>  The `io` provider makes available probes that relate to data input and output.
>  
> @@ -7,7 +7,7 @@ For example, you can use the `io` provider to understand I/O by device, I/O type
>  
>  **Parent topic:**[DTrace Provider Reference](../reference/dtrace_providers.md)
>  
> -## io Probes {#dt_ref_ioprobes_prov}
> +## io Probes <a id="dt_ref_ioprobes_prov">
>  
>  The following table describes the probes for the `io` provider. For all `io` probes, the module is `vmlinux` and the function is an empty string.
>  
> @@ -54,7 +54,7 @@ Fires when a thread finishes waiting for the completion of an I/O request. The `
>  </td></tr><tbody></table>
>  The `io` probes fire for all I/O requests to peripheral devices, and for all file read and file write requests to an NFS server. Requests for metadata from an NFS server, for example, don't trigger `io` probes because of a `readdir()` request.
>  
> -## io Probe Arguments {#dt_ref_ioargs_prov}
> +## io Probe Arguments <a id="dt_ref_ioargs_prov">
>  
>  The following table describes the arguments for the `io` probes. The `argN` are implementation specific. Use `args[]` to access the probe arguments.
>  
> @@ -143,7 +143,7 @@ Probe
>  
>  DTrace doesn't provide the option to use `fileinfo_t` with `io` probes. In Linux, no information is accessible at the level where the `io` probes fire about the file where an I/O request originated.
>  
> -### bufinfo\_t {#dt_ref_iobuf_prov}
> +### bufinfo\_t <a id="dt_ref_iobuf_prov">
>  
>  The `bufinfo_t` structure is the abstraction that describes an I/O request. The buffer that corresponds to an I/O request is pointed to by `args[0]` in the `start`, `done`, `wait-start`, and `wait-done` probes. Detailed information about this data structure can be found in `/usr/lib64/dtrace/*version*/io.d`. The definition of `bufinfo_t` is as follows:
>  
> @@ -289,7 +289,7 @@ Indicates that the data is to be transferred from main memory to the peripheral
>  
>  `b_edev`: Contains the major and minor device numbers of the device accessed. You can use the D subroutines `getmajor` and `getminor` to extract the major and minor device numbers from the `b_edev` field.
>  
> -### devinfo\_t {#dt_ref_iodev_prov}
> +### devinfo\_t <a id="dt_ref_iodev_prov">
>  
>  The `devinfo_t` structure provides information about a device. The `devinfo_t` structure that corresponds to the destination device of an I/O is pointed to by `args[1]` in the `start`, `done`, `wait-start`, and `wait-done` probes. Detailed information about this data structure can be found in `/usr/lib64/dtrace/*version*/io.d`. The definition of `devinfo_t` is as follows:
>  
> @@ -318,7 +318,7 @@ DTrace translates the members of `devinfo_t` from the `buffer_head` for the Linu
>  
>  `dev_pathname`: Is the full path of the device. The path that's specified by `dev_pathname` includes components expressing the device node, the instance number, and the minor node. However, note that all three of these elements aren't necessarily expressed in the statistics name. For some devices, the statistics name consists of the device name and the instance number. For other devices, the name consists of the device name and the number of the minor node. So, two devices that have the same `dev_statname` migh differ in their `dev_pathname`.
>  
> -### fileinfo\_t {#dt_ref_iofile_prov}
> +### fileinfo\_t <a id="dt_ref_iofile_prov">
>  
>  **Note:**
>  
> @@ -352,7 +352,7 @@ The `fi_fs` field contains the name of the file system type, or `<none>`, if no
>  
>  The `fi_oflags` field contains the flags that were specified when opening the file.
>  
> -## io Examples {#dt_ref_ioexamples_prov}
> +## io Examples <a id="dt_ref_ioexamples_prov">
>  
>  The following example script displays information for every I/O as it's issued. Type the following source code and save it in a file named `iosnoop.d`.
>  
> @@ -517,7 +517,7 @@ sdc1 (/dev/sdc1)
>  
>  The previous output shows that the USB drive \(`sdc1`\) is clearly the limiting device. The throughput of `sdc1` is between 256K/sec and 512K/sec, while `dm-00` delivered I/O at anywhere from 8 MB/second to over 64 MB/second.
>  
> -## io Stability {#dt_ref_iostab_prov}
> +## io Stability <a id="dt_ref_iostab_prov">
>  
>  The `io` provider uses DTrace's stability mechanism to describe its stabilities. These values are listed in the following table.
>  
> diff --git a/doc/userguide/reference/dtrace_providers_lockstat.md b/doc/userguide/reference/dtrace_providers_lockstat.md
> index 98affd838..c1d3eb4de 100644
> --- a/doc/userguide/reference/dtrace_providers_lockstat.md
> +++ b/doc/userguide/reference/dtrace_providers_lockstat.md
> @@ -1,11 +1,11 @@
>  
> -# Lockstat Provider {#dt_ref_lockstat_prov}
> +# Lockstat Provider <a id="dt_ref_lockstat_prov">
>  
>  The `lockstat` provider provides probes that can be used to study lock usage and contention.
>  
>  **Parent topic:**[DTrace Provider Reference](../reference/dtrace_providers.md)
>  
> -## lockstat Probes {#dt_ref_lockstatprobes_prov}
> +## lockstat Probes <a id="dt_ref_lockstatprobes_prov">
>  
>  For all `lockstat` probes, the module name is `vmlinux` and the function name is an empty string.
>  
> @@ -44,7 +44,7 @@ The following probe fires before a lock is acquired if there was contention for
>  
>  Finally, an `adaptive-acquire-error` probe indicates an error acquiring an adaptive lock.
>  
> -## lockstat Probe Arguments {#dt_ref_lockstatargs_prov}
> +## lockstat Probe Arguments <a id="dt_ref_lockstatargs_prov">
>  
>  The following table lists the argument types for the `lockstat` probes. The `argN` are implementation specific. Use `args[]` to access the probe arguments.
>  
> @@ -245,7 +245,7 @@ Probe
>  
>  `args[0]` has a pointer to the lock in question. The probes that fire in case of contention report a `uint64_t` `args[1]`, which is the wait time in nanoseconds. The `rw` probes also report an `int` that's either `RW_READER` or `RW_WRITER`. Finally, `adaptive-acquire-error` reports an `int` with a non zero error.
>  
> -## lockstat Examples {#dt_ref_lockstatexamples_prov}
> +## lockstat Examples <a id="dt_ref_lockstatexamples_prov">
>  
>  The following examples illustrate the use of the probes that are published by the `lockstat` provider.
>  
> @@ -271,7 +271,7 @@ Run the program on the `date` command using `sudo dtrace -qs whatlock.d -c date`
>  
>  It might be surprising that so many locks are acquired with the `date` command. The large number of locks is a natural artifact of the fine-grained locking required of a scalable system such as the Linux kernel.
>  
> -## lockstat Stability {#dt_ref_lockstatstab_prov}
> +## lockstat Stability <a id="dt_ref_lockstatstab_prov">
>  
>  The `lockstat` provider uses DTrace's stability mechanism to describe its stabilities. These values are listed in the following table.
>  
> diff --git a/doc/userguide/reference/dtrace_providers_pid.md b/doc/userguide/reference/dtrace_providers_pid.md
> index c0c7bbb9a..184f2c081 100644
> --- a/doc/userguide/reference/dtrace_providers_pid.md
> +++ b/doc/userguide/reference/dtrace_providers_pid.md
> @@ -1,11 +1,11 @@
>  
> -# Pid Provider {#dt_ref_pid_prov}
> +# Pid Provider <a id="dt_ref_pid_prov">
>  
>  The `pid` provider traces a user process, both function `entry` and `return`, and an arbitrary instruction.
>  
>  **Parent topic:**[DTrace Provider Reference](../reference/dtrace_providers.md)
>  
> -## pid Probes {#dt_ref_pidprobes_prov}
> +## pid Probes <a id="dt_ref_pidprobes_prov">
>  
>  A probe is fully specified by naming its provider, module, function, and name.
>  
> @@ -52,7 +52,7 @@ The probe name is one of:
>  -   An instruction offset. The hexadecimal offset, without a leading `0x`, is relative to the named function, but it's an absolute offset when the function name is `-`.
>  
>  
> -## pid Probe Arguments {#dt_ref_pidargs_prov}
> +## pid Probe Arguments <a id="dt_ref_pidargs_prov">
>  
>  For `entry` probes, the probe arguments are the same arguments as those of the probed function.
>  
> @@ -60,7 +60,7 @@ For `return` probes, `arg1` is the return value of the probed function.
>  
>  For offset probes, there are no probe arguments.
>  
> -## pid Examples {#dt_ref_pidexamples_prov}
> +## pid Examples <a id="dt_ref_pidexamples_prov">
>  
>  Consider the following program, named `main.c`, that calls a function `foo()`:
>  
> @@ -173,7 +173,7 @@ The output looks similar to:
>  
>  We probe on the chosen instruction, using both a relative offset `foo:4`, and an absolute offset `-:40110a`. Both probes fire, both reporting the same PC `0x40110a`.
>  
> -## pid Stability {#dt_ref_pidstab_prov}
> +## pid Stability <a id="dt_ref_pidstab_prov">
>  
>  The `pid` provider uses DTrace's stability mechanism to describe its stabilities. These values are listed in the following table.
>  
> diff --git a/doc/userguide/reference/dtrace_providers_proc.md b/doc/userguide/reference/dtrace_providers_proc.md
> index 6c1fa8ecf..cf64bc28f 100644
> --- a/doc/userguide/reference/dtrace_providers_proc.md
> +++ b/doc/userguide/reference/dtrace_providers_proc.md
> @@ -1,5 +1,5 @@
>  
> -# Proc Provider {#dt_ref_proc_prov}
> +# Proc Provider <a id="dt_ref_proc_prov">
>  
>  The `proc` provider makes available the probes that pertain to the following activities: process creation and termination, LWP creation and termination, execution of new program images, and signal sending and handling.
>  
> @@ -7,7 +7,7 @@ The `proc` provider makes available the probes that pertain to the following act
>  
>  **Parent topic:**[DTrace Provider Reference](../reference/dtrace_providers.md)
>  
> -## proc Probes {#dt_ref_procprobes_prov}
> +## proc Probes <a id="dt_ref_procprobes_prov">
>  
>  The probes for the `proc` provider are listed in the following table.
>  
> @@ -128,7 +128,7 @@ Fires in the context of a newly created process. The `start` probe fires before
>  
>  No fundamental difference between a process and a thread that a process creates, exists in Linux. The threads of a process are set up so that they can share resources, but each thread has its own entry in the process table with its own process ID.
>  
> -## proc Probe Arguments {#dt_ref_procargs_prov}
> +## proc Probe Arguments <a id="dt_ref_procargs_prov">
>  
>  The following table lists the argument types for the `proc` probes. See [proc Probes](dtrace_providers_proc.md) for a description of the arguments. The `argN` are implementation specific. Use `args[]` to access the probe arguments.
>  
> @@ -357,7 +357,7 @@ Probe
>  —
>  
>  </td></tr><tbody></table>
> -### lwpsinfo\_t {#dt_ref_lwpsinfoproc_prov}
> +### lwpsinfo\_t <a id="dt_ref_lwpsinfoproc_prov">
>  
>  Several `proc` probes have arguments of type `lwpsinfo_t`. Detailed information about this data structure can be found in `/usr/lib64/dtrace/*version*/procfs.d`. Some structure members, while still recognized for historical reasons, aren't implemented. The definition of the `lwpsinfo_t` structure is as follows:
>  
> @@ -475,7 +475,7 @@ The thread is a zombie.
>   The equivalent Linux task state is `EXIT_ZOMBIE`, `EXIT_DEAD`, or `TASK_DEAD`.
>  
>  </td></tr><tbody></table>
> -### psinfo\_t {#dt_ref_procpsinfo_prov}
> +### psinfo\_t <a id="dt_ref_procpsinfo_prov">
>  
>  Several `proc` probes have an argument of type `psinfo_t`. Detailed information about this data structure can be found in `/usr/lib64/dtrace/*version*/procfs.d`. The definition of the `psinfo_t` structure, is as follows:
>  
> @@ -527,7 +527,7 @@ Lightweight processes don't exist in Linux. In Linux, processes and threads are
>  
>  `pr_dmodel` is set to either `PR_MODEL_ILP32`, denoting a 32–bit process, or `PR_MODEL_LP64`, denoting a 64–bit process.
>  
> -## proc Examples {#dt_ref_procexamples_prov}
> +## proc Examples <a id="dt_ref_procexamples_prov">
>  
>  The following examples illustrate the use of the probes that are published by the `proc` provider.
>  
> @@ -691,7 +691,7 @@ Running this script results in output similar to the following:
>             swapper/6             pmlogger           14 1
>  ```
>  
> -## proc Stability {#dt_ref_procstab_prov}
> +## proc Stability <a id="dt_ref_procstab_prov">
>  
>  The `proc` provider uses DTrace's stability mechanism to describe its stabilities. These values are listed in the following table.
>  
> diff --git a/doc/userguide/reference/dtrace_providers_profile.md b/doc/userguide/reference/dtrace_providers_profile.md
> index bcc8c64d2..da83e8561 100644
> --- a/doc/userguide/reference/dtrace_providers_profile.md
> +++ b/doc/userguide/reference/dtrace_providers_profile.md
> @@ -1,5 +1,5 @@
>  
> -# Profile Provider {#dt_ref_profile_prov}
> +# Profile Provider <a id="dt_ref_profile_prov">
>  
>  The `profile` provider includes probes that are associated with an interrupt that fires at some regular, specified time interval.
>  
> @@ -7,7 +7,7 @@ Such probes aren't associated with any particular point of execution, but rather
>  
>  **Parent topic:**[DTrace Provider Reference](../reference/dtrace_providers.md)
>  
> -## profile-*n* Probes {#dt_ref_profile-n_prov}
> +## profile-*n* Probes <a id="dt_ref_profile-n_prov">
>  
>  The `profile-*n*` probes fire at a fixed interval, at a high-interrupt level on all active CPUs.
>  
> @@ -86,7 +86,7 @@ days
>  hertz \(frequency expressed as rate per second\)
>  
>  </td></tr><tbody></table>
> -## tick-*n* Probes {#dt_ref_profile-tick-n_prov}
> +## tick-*n* Probes <a id="dt_ref_profile-tick-n_prov">
>  
>  The `tick-*n*` probes fire at fixed intervals, at a high interrupt level on only one CPU per interval.
>  
> @@ -98,7 +98,7 @@ The `tick-*n*` probes have several uses, such as providing some periodic output
>  
>  The highest available tick frequency is 5000 Hz \(`tick-5000`\).
>  
> -## profile Probe Arguments {#dt_ref_profargs_prov}
> +## profile Probe Arguments <a id="dt_ref_profargs_prov">
>  
>  The following table describes the arguments for the `profile` probes.
>  
> @@ -146,13 +146,13 @@ The arguments are as follows:
>  -   `upc`: user-space program counter
>  
>  
> -## profile Probe Creation {#dt_ref_profprobecreate_prov}
> +## profile Probe Creation <a id="dt_ref_profprobecreate_prov">
>  
>  Unlike other providers, the `profile` provider creates probes dynamically on an as-needed basis. Thus, the preferred probe might not appear in a listing of all probes, for example, when using the `dtrace -l -P profile` command, but the probe is created when it's explicitly enabled.
>  
>  A time interval that's too short causes the machine to continuously field time-based interrupts and denies service on the machine. The `profile` provider refuses to create a probe that would result in an interval of less than two hundred microseconds and returns an error.
>  
> -## prof Stability {#dt_ref_profstab_prov}
> +## prof Stability <a id="dt_ref_profstab_prov">
>  
>  The `profile` provider uses DTrace's stability mechanism to describe its stabilities. These stability values are listed in the following table.
>  
> diff --git a/doc/userguide/reference/dtrace_providers_rawtp.md b/doc/userguide/reference/dtrace_providers_rawtp.md
> index d85dd45a8..67cb0bedc 100644
> --- a/doc/userguide/reference/dtrace_providers_rawtp.md
> +++ b/doc/userguide/reference/dtrace_providers_rawtp.md
> @@ -1,5 +1,5 @@
>  
> -# Rawtp Provider {#dt_ref_rawtp_prov}
> +# Rawtp Provider <a id="dt_ref_rawtp_prov">
>  
>  The `rawtp` provider gives DTrace users access to the raw tracepoints exposed by the kernel tracing system, including access to the untranslated arguments of the associated tracepoint events.
>  
> @@ -17,7 +17,7 @@ sudo dtrace -lvP rawtp
>  
>  **Parent topic:**[DTrace Provider Reference](../reference/dtrace_providers.md)
>  
> -## rawtp Stability {#dt_ref_rawtpstab_prov}
> +## rawtp Stability <a id="dt_ref_rawtpstab_prov">
>  
>  The `rawtp` provider uses DTrace's stability mechanism to describe its stabilities. These stability values are listed in the following table.
>  
> diff --git a/doc/userguide/reference/dtrace_providers_sched.md b/doc/userguide/reference/dtrace_providers_sched.md
> index f6d183708..42f318e77 100644
> --- a/doc/userguide/reference/dtrace_providers_sched.md
> +++ b/doc/userguide/reference/dtrace_providers_sched.md
> @@ -1,5 +1,5 @@
>  
> -# Sched Provider {#dt_ref_sched_prov}
> +# Sched Provider <a id="dt_ref_sched_prov">
>  
>  The `sched` provider makes available probes related to CPU scheduling.
>  
> @@ -7,7 +7,7 @@ Because CPUs are the one resource that all threads must consume, the `sched` pro
>  
>  **Parent topic:**[DTrace Provider Reference](../reference/dtrace_providers.md)
>  
> -## sched Probes {#dt_ref_schedprob_prov}
> +## sched Probes <a id="dt_ref_schedprob_prov">
>  
>  The probes for the `sched` provider are listed in the following table. For all `sched` probes, the module is `vmlinux` and the function is an empty string.
>  
> @@ -76,7 +76,7 @@ Fires as a part of clock tick-based accounting. In clock tick-based accounting,
>  Fires immediately before the current thread wakes a thread sleeping on a synchronization object. Here, `args[0]` and `args[1]` refer to the sleeping thread, as an `lwpsinfo_t *` and `psinfo_t *`, respectively. The type and address of the synchronization object are contained in the `pr_stype` and `pr_wchan` members of the `lwpsinfo_t` of the sleeping thread. The meaning of this address is a private implementation detail, but the address value might be treated as a token unique to the synchronization object.
>  
>  </td></tr><tbody></table>
> -## sched Probe Arguments {#dt_ref_schedargs_prov}
> +## sched Probe Arguments <a id="dt_ref_schedargs_prov">
>  
>  Many of these probes refer to a particular thread. For these probes, the thread's `lwpsinfo_t` is pointed to by `args[0]` and the `psinfo_t` of the process containing the thread by `args[1]`. A few probes refer to a particular CPU. Its `cpuinfo_t` is pointed to by `args[2]`. Only `enqueue` has an `args[3]`, and that argument is a Boolean, as described. The `argN` values are implementation specific. Instead, use `args[]` to access the probe arguments.
>  
> @@ -243,11 +243,11 @@ Probe
>  —
>  
>  </td></tr><tbody></table>
> -### lwpsinfo\_t and psinfo\_t {#dt_ref_lwpsinfo_t_psinfo_t_sched_prov}
> +### lwpsinfo\_t and psinfo\_t <a id="dt_ref_lwpsinfo_t_psinfo_t_sched_prov">
>  
>  The `lwpsinfo_t` and `psinfo_t` structures are described in [Proc Provider](dtrace_providers_proc.md).
>  
> -### cpuinfo\_t {#dt_ref_cpuinfo_sched_prov}
> +### cpuinfo\_t <a id="dt_ref_cpuinfo_sched_prov">
>  
>  The `cpuinfo_t` structure defines a CPU. The `args[2]` arguments for the `enqueue` and `dequeue` probes point to the `cpuinfo_t` for the CPU associated with the run queue, which is sometimes different from the current CPU, whose `cpuinfo_t` is pointed to by the `curcpu` variable.
>  
> @@ -262,7 +262,7 @@ typedef struct cpuinfo {
>  } cpuinfo_t;
>  ```
>  
> -## sched Examples {#dt_ref_schedexamples_prov}
> +## sched Examples <a id="dt_ref_schedexamples_prov">
>  
>  The following examples illustrate the use of the probes that are published by the `sched` provider.
>  
> @@ -810,7 +810,7 @@ The output of the example script is two distributions of the millisecond offset
>  
>  The output histogram named `tick` shows that the clock tick is firing at a 1 millisecond offset. In this example, the output for `enqueue` is evenly spread across the ten millisecond interval and no spike is visible at 1 millisecond, so it seems the threads aren't being scheduled on a time basis.
>  
> -## sched Stability {#dt_ref_schedstab_prov}
> +## sched Stability <a id="dt_ref_schedstab_prov">
>  
>  The `sched` provider uses DTrace's stability mechanism to describe its stabilities. These values are listed in the following table.
>  
> diff --git a/doc/userguide/reference/dtrace_providers_sdt.md b/doc/userguide/reference/dtrace_providers_sdt.md
> index 442911fc7..b4490401a 100644
> --- a/doc/userguide/reference/dtrace_providers_sdt.md
> +++ b/doc/userguide/reference/dtrace_providers_sdt.md
> @@ -1,5 +1,5 @@
>  
> -# SDT Provider {#dt_ref_sdt_prov}
> +# SDT Provider <a id="dt_ref_sdt_prov">
>  
>  The Statically Defined Tracing \(SDT\) provider \(`sdt`\) creates probes at sites that a software programmer has formally designated. Thus, the SDT provider is chiefly of interest only to developers of new providers. Most users access SDT only indirectly by using other providers.
>  
> @@ -11,13 +11,13 @@ Both the name stability and the data stability of the probes are Private, which
>  
>  **Parent topic:**[DTrace Provider Reference](../reference/dtrace_providers.md)
>  
> -## Creating sdt Probes {#dt_ref_sdtcreatep_prov}
> +## Creating sdt Probes <a id="dt_ref_sdtcreatep_prov">
>  
>  If you are a device driver developer, you might be interested in creating `sdt` probes for a Linux driver that you are working on. The disabled probe effect of SDT is only the cost of several no-operation machine instructions. You are therefore encouraged to add `sdt` probes to device driver code as needed. Unless these probes negatively affect performance, you can leave them in shipped code.
>  
>  DTrace also provides a mechanism for application developers to define user-space static probes.
>  
> -### Declaring Probes {#dt_ref_sdtdeclp_prov}
> +### Declaring Probes <a id="dt_ref_sdtdeclp_prov">
>  
>  The `sdt` probes are declared by using the `DTRACE_PROBE` macro from `<linux/sdt.h>`.
>  
> @@ -34,11 +34,11 @@ SDT can also act as a metaprovider by registering probes so that they appear to
>  
>  Probes that use such macros appear to come from a provider other than `sdt`. The leading double underscore, provider name, and trailing underscore in the `name` argument are used to match the provider and aren't included in the probe name.
>  
> -### sdt Probe Arguments {#dt_ref_sdtparg_prov}
> +### sdt Probe Arguments <a id="dt_ref_sdtparg_prov">
>  
>  The arguments for each `sdt` probe are the arguments that are specified in the kernel source code in the corresponding `DTRACE_PROBE` macro reference. When declaring `sdt` probes, you can minimize their disabled probe effect by not dereferencing pointers and by not loading from global variables in the probe arguments. Both pointer dereferencing and global variable loading can be done safely in D functions that enable probes, so DTrace users can request these functions only when they're needed.
>  
> -## sdt Stability {#dt_ref_sdtstab_prov}
> +## sdt Stability <a id="dt_ref_sdtstab_prov">
>  
>  The `sdt` provider uses DTrace's stability mechanism to describe its stabilities. These values are listed in the following table.
>  
> diff --git a/doc/userguide/reference/dtrace_providers_syscall.md b/doc/userguide/reference/dtrace_providers_syscall.md
> index 880b7de69..dbd90303e 100644
> --- a/doc/userguide/reference/dtrace_providers_syscall.md
> +++ b/doc/userguide/reference/dtrace_providers_syscall.md
> @@ -1,5 +1,5 @@
>  
> -# Syscall Provider {#dt_ref_syscall_prov}
> +# Syscall Provider <a id="dt_ref_syscall_prov">
>  
>  The `syscall` provider makes available a probe at the entry to and return from every system call in the system.
>  
> @@ -7,17 +7,17 @@ Because system calls are the primary interface between user-level applications a
>  
>  **Parent topic:**[DTrace Provider Reference](../reference/dtrace_providers.md)
>  
> -## syscall Probes {#dt_ref_syscallprobes_prov}
> +## syscall Probes <a id="dt_ref_syscallprobes_prov">
>  
>  `syscall` provides a pair of probes for each system call: an `entry` probe that fires before the system call is entered, and a `return` probe that fires after the system call has completed, but before control has been transferred back to user-level. For all `syscall` probes, the function name is set as the name of the instrumented system call.
>  
>  Often, the system call names that are provided by `syscall` correspond to names in the Section 2 manual pages. However, some `syscall` provider probes don't directly correspond to any documented system call, such as the case where a system call might be a sub operation of another system call or where a system call might be private in that they span the user-kernel boundary.
>  
> -## syscall Probe Arguments {#dt_ref_syscallargs_prov}
> +## syscall Probe Arguments <a id="dt_ref_syscallargs_prov">
>  
>  For `entry` probes, the arguments, `arg0` ... `arg*n*`, are arguments to the system call. For return probes, both `arg0` and `arg1` contain the return value. A non-zero value in the D variable `errno` indicates a system call failure.
>  
> -## syscall Stability {#dt_ref_syscallstab_prov}
> +## syscall Stability <a id="dt_ref_syscallstab_prov">
>  
>  The `syscall` provider uses DTrace's stability mechanism to describe its stabilities. These stability values are listed in the following table.
>  

