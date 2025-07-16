Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3652B2E3715
	for <dtrace@lists.linux.dev>; Wed, 16 Jul 2025 04:43:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752640998; cv=fail; b=BZaEonzmBcqYKyxP9zv1agM/WX3gF4O9N4a7RsBHD4MCjV9Z74kwrSx3v1dmtyXs5jMHnNvp54FGyuwclX5Dk1Vk7PTpid3tKu7JUQVkVm+boUKfpsuO9d/WktwSXQtab0gMlU4+/kmvmyk1jP9Dg223/fwgM815Up17OQOJcsQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752640998; c=relaxed/simple;
	bh=WMDEtSPaok7XL7FW4Chw8Me75IN4PyCpLUTbzZXp1a4=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=khLXCSEG1g81UWpu5+yNJ31ntlmXpE2E5i6Hd6BdHOq83oVIaljRTKJ40BV9kIBwNFKu6EpjElZ8yzjv5VFs82wa7nzBXrT1r5TYG3uD9xm2MIUgw4qF18IkrtDJ6QdveZaiFs/E2HsyruoETch5f+bPTWG/bpUj5nuJ7pdrJiI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=ibOY2vIS; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=v7YpgMO4; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="ibOY2vIS";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="v7YpgMO4"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56G4DxPd031753
	for <dtrace@lists.linux.dev>; Wed, 16 Jul 2025 04:43:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=iRoaPe56tsCYRK97oo+vEVaso4W+PdiXkiWnHFRob10=; b=
	ibOY2vISVegBnZf6MQON8gkCeck0KPag7QGWrKhUmifY1w0kxHqxpf4A3g7AoEMx
	PRLLpFd07Tl+hh0J2WllRsr1LcYPCJpw14/YRH0zjJQhTuD5UUyM1BZfUsD1qP0E
	AaEpDXgoj/DTutLptl6rtN4JgmOlYpODwFVL2CodYBeMSnb9Mo2zN5tNO6Px9/G3
	gmQI25w2Lphg0I/f2zpxA4J4NdrJvrTwDga5lfAPNizqgWuVv2m/gQxY7x38q6XF
	fJFTL9KP5Ju88R4a5T8t/FwijG77mKo69+CLTdJtFKSudXWIYDv1rG9UCso9+FGd
	X16zKthH9r7DNbaHZ0pZSg==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47uk8g060p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 16 Jul 2025 04:43:16 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 56G2UC3M013057
	for <dtrace@lists.linux.dev>; Wed, 16 Jul 2025 04:43:14 GMT
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11011020.outbound.protection.outlook.com [52.101.62.20])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 47ue5ac1pu-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 16 Jul 2025 04:43:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FTZAWNAIsD3IjT1Z+zq5offB3GzT2PxczViMpxF0k0WyuZYMQFmTf52MPU1+TFYm6MX8XoWgVWfsV005xeFGpWmRwVsPCHw5qRoTByqgPbBc5lMBwbAdcE0ixaB4wfthED5p4rz0D9R5RCLPuCjMhaWptz+mgo7M5fzcOFX83m/dOKPhgP8TB8rT4o1Hek9+Zb247YGSfgVxw1fai1PblKTvQvNh+/nwjJOPtipdJQRssFGIcptqeKCXZcA+2uoz6OX3ZQ7yh7Gi2KwPNInmed+EaDjJUzpHJ2ddAeit2sTjcqvKmFjdxJugt/GyPuLQSx0VrLjAHvtfhGRXTT8aHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iRoaPe56tsCYRK97oo+vEVaso4W+PdiXkiWnHFRob10=;
 b=RI79USGGmLynhvAukftxW3xVbR1zLbF9cqOSOW172JBGmB5wwGH1wwXNgmY9nFrFWLPdsrKtB1twRZ5mwGDg3kURzoeycB6OccohziHVe3O/8y0XUkC4L84a4jFUyFI09b6L5qjyORIFEpqfiqKLd+e6J3sGAQE57vAt7K4VIZXgMdxghF6ltYAxLm0uNBYSHq/9EoZLRPzEYyLjG7GVn+pDu27RYQ7UAXWZZZrAyVhEK0oHpvrn7tYLGEIA8eaQWoMM8k7F9ljYTMmPHp5mfDPOMFomg13o//jOGcCYilC77XQFpfBX+UXUmak+3c+sVaPkHuVWR+aoxcZm23HB0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iRoaPe56tsCYRK97oo+vEVaso4W+PdiXkiWnHFRob10=;
 b=v7YpgMO4yGcZT3a/1SRvrHZpEsISZqynvBKqyEgYHYuM5FG5oWFIzJctdSH+Z2c7FbKb6mS2CqgumUR6tWrdAafOu8lKSpxX53S/O0NrdEK1VBG+O8hw0eO0xut6tacDCu36iva6eS+Jiff+0U2H2+R8vyKjdasU4i50BYhhbqs=
Received: from SJ0PR10MB5647.namprd10.prod.outlook.com (2603:10b6:a03:3da::17)
 by MN2PR10MB4157.namprd10.prod.outlook.com (2603:10b6:208:1dc::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.32; Wed, 16 Jul
 2025 04:43:12 +0000
Received: from SJ0PR10MB5647.namprd10.prod.outlook.com
 ([fe80::8db4:df1d:6afd:e4a7]) by SJ0PR10MB5647.namprd10.prod.outlook.com
 ([fe80::8db4:df1d:6afd:e4a7%5]) with mapi id 15.20.8922.028; Wed, 16 Jul 2025
 04:43:12 +0000
Message-ID: <1c67ce82-fbe6-2fa1-f8dd-c92ea3eb0932@oracle.com>
Date: Wed, 16 Jul 2025 00:43:10 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 1/3] parser: add dt_node_is_tstring()
Content-Language: en-US
To: Kris Van Hees <kris.van.hees@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
References: <SJ0PR10MB56724E05E20180520803DE8DC257A@SJ0PR10MB5672.namprd10.prod.outlook.com>
From: Eugene Loh <eugene.loh@oracle.com>
In-Reply-To: <SJ0PR10MB56724E05E20180520803DE8DC257A@SJ0PR10MB5672.namprd10.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PH7PR10CA0001.namprd10.prod.outlook.com
 (2603:10b6:510:23d::23) To SJ0PR10MB5647.namprd10.prod.outlook.com
 (2603:10b6:a03:3da::17)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5647:EE_|MN2PR10MB4157:EE_
X-MS-Office365-Filtering-Correlation-Id: be2928b1-5ba8-4ac6-f0df-08ddc4234508
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NDNRRVd5NEJ0bTc1Rzhkd2pNYmQ4ZXVRbkgzaXRmS0dTUkl0M0h6aFRidVFS?=
 =?utf-8?B?cklmclZrazU4RHJQdkkzVVlmRnc5ZGlkRjdlclRWR2crK3J3dzNDdWVPRUZN?=
 =?utf-8?B?VUZINWRlckozdW5zR3BMMU1rbW8zY2NxVTgrZDBSU044Q0pMNklEVTFmWVJh?=
 =?utf-8?B?UWdPaUhLbUM1ZU1ycERwTXpVUGFZM1NxTmFHd2ZQcWpVeUpGNDZoMjJUZ1Nq?=
 =?utf-8?B?S294OXo5cXhPdndzRHlTdVJuUi9JTzVvdjA3WFRTdDZzUXlUOEpoRncrWW9H?=
 =?utf-8?B?ZC9CSHlIcWxKS3pnZkJtRjNmYlh2aEIrcXhBdUhxNFA0Rk5reE8zMzYrZDhI?=
 =?utf-8?B?ZlMyNXFkenJnWFNSMjFyWU1JZThpWEF6R3lNZ0JoeFFMeGNQUkJCY3JGeVBR?=
 =?utf-8?B?VlNZRXVrVnI5aFMvVGdLVEd3MlVLWkYwbndhT1lHMXZCSGpON0RpWUNpOFBk?=
 =?utf-8?B?ZnFsUlE3c2tnbm9pV2tRSW1ISjd3SWtYUzNqd0dySWNBczBqQU1lcTFiY2U1?=
 =?utf-8?B?anVIZEJ1WVl1RnJ6dmwzOWtJb1VxeklyUTM4b0tWaTRRWFpoK0NqT2lLRVVn?=
 =?utf-8?B?SXdRamVQWmx1UVQ5Ti90MTNsTVdsRnVNTlh1MHliWmQ4bVdWL3FETGdxSSs2?=
 =?utf-8?B?RG1jZU1xUFptZEtUUkhFMnJjYzdwaHVpRXl2Tk1NaUtCT2dTcVFnVTVaa25i?=
 =?utf-8?B?WjgwUW9YbzQ4WnhheUNPbU9LblgzMjVJMTBNL3o5d1A3cGxJR1lFd01ablND?=
 =?utf-8?B?UlBTQTRlQmJ2MjJ3R2xBVHZZTVoveGNwU3o2bjdEbTVVUWNKeHI5OGcyalBL?=
 =?utf-8?B?cGVwQTRKcGtIMmVaNkVneFVRalZCSXNhTHBJRkpHZW1SaFlEOVFVVUJ1ME9j?=
 =?utf-8?B?U1c3TTBGQ3dyc25hNXhFZGNpSndhTGZTSUdzVHF0Z0ZOUGM3bWY1ZzFGSGF6?=
 =?utf-8?B?TDVWV3c4bStIRU5vQXpOUHM1NFNwM0hQbXhvaEJRSTNaQjRUbXNUMm9GV2NL?=
 =?utf-8?B?RTJ6UlZ0cDRrVVFCUXhNK2pWT3VMUjErS05VWGJyc1JvdmsxMDJIVHlyTHM1?=
 =?utf-8?B?MXZadXpocm1VNnl6ekplOStDc0c5Vm9GcGl4ZGZvdXBkZXQxbmorWE1idkFC?=
 =?utf-8?B?d1ptS0s5WllFeEhkdVVGamw5azRONjdabklMVHh4N0s3UVRtTnlwTFZiUEhL?=
 =?utf-8?B?VUtGcVFmTnZhbnN4dk9MalRyWFNlZGhQQTE2MDFXY1RsVEVKNFZiZlpubXI1?=
 =?utf-8?B?ODFkVGRFODlpTGVURjhid0pVWjN0bDBjUjh2RFBlT01BdmUyN2F3ZUFqUjlT?=
 =?utf-8?B?RVBVRG41anRNSFNnM1duTEdudTVTNlliajQ2U1NaaXBQcjFuWno4NjJ5MFRT?=
 =?utf-8?B?dXE3T01FZUJ4YXZubndCQlYvSUFPNnVGdEs5c2J5WGJTWlQ4akxVZmhrQjVB?=
 =?utf-8?B?anB5TXVncWU5eFNpNmk3QVVNWHE0RmRHbHkza1dNWnJYVHFsSmtza2JJT29t?=
 =?utf-8?B?WkFmbExyQnFWNHpFVUpCVGw5TTFIbmZZbXdwdGk3emU0cGRrTDVaNTZ4QzAv?=
 =?utf-8?B?OG5EeDdQaUJPWXR3aE9NVmNNTFNGVVdLOUJVK3I3K0FmcU1yajVXZlM4UlJX?=
 =?utf-8?B?Tk1KUlJjdXFiZjBYeVJyTkhoTUUySnAyblQ2VnZBdjliMUQ2OTRpdnZCc0NC?=
 =?utf-8?B?dVhzQXlIaVl6N3RPRjFvaTZUOXJETzMzNDNrUWpXNm1HNkpzOUpuYUtBN2t1?=
 =?utf-8?B?SmFBeVlDZ1BVOGF5UmhqTEd0aFlMaUhTdmJVS25SdXJGdUpZYUozVjJiZzlP?=
 =?utf-8?B?NGttYVd1VzlYSnlnYjlXd3RIc29udnc3RjlqL0xzeGxKTzhXMk5VZXVQSUth?=
 =?utf-8?B?VEpCbXdVSFVKZmJscEg4Z2NMdUNqN2dCWHNEUjFJd2VWaUtUSncxWDg0NHRm?=
 =?utf-8?Q?Wt9rzZ3mI5o=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB5647.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bS9ZRlNEdU80cXpRdW0xci9nWGlvT2VjMnY3U0UzZnNlVlBrOFEwWVB4MFVp?=
 =?utf-8?B?M21ZaGxKRW5FSUxmRi9zZ0JxYS9rSk5lcTNROHNTNlYzYjdFUEI4RUhqandN?=
 =?utf-8?B?NjRTNkZSR0lyWDJ0aWFoOHc2a3NGN0xVS0oyS2F3cWRNOWNOQXJsS1lLTDNZ?=
 =?utf-8?B?ZDZTYmJSM0o1dlNKeDlzdjkzaTIwRnhYUU83RWJHRFRORWNHV2tFZGQvVGZC?=
 =?utf-8?B?TWdVejBHOFVWOWZwVlZJUUEwaWZtSm00RkcxYUliMzAwS2paNElhNDN1dHZi?=
 =?utf-8?B?L0IvVWNBNG51RFV3ZkhoTDdmOXJrYzY2blF2QUdpdHpiRlF1UXVlZEhldDds?=
 =?utf-8?B?c0V5NWpWSnJjdWVGejlwUVVOU0V2SEhTZC9VV0owUjJ5N2NkdnB2eGtLRUp5?=
 =?utf-8?B?eU1ZUHd6cE5iTWMxS3d1UWpOdy90NStleFlDbnh6clZCbkhYSUtNdmdlUkd6?=
 =?utf-8?B?MHp2Y3FCTjJ3KzUyZzJLeTNVa0FaMWxTai9EVGFUN2VZRHFHbEFBaitPSGR5?=
 =?utf-8?B?OEFubTBSQXVMOHlyUUdGNzB4QStTT3NIVWRrZWY0N28vUUc2bVNWM0ppaExs?=
 =?utf-8?B?T3dMcWZLVW8wdERHQXN0cFZ1QzE0S3VKTHhXdHdTRHlDdmpVendNNzM3VEVk?=
 =?utf-8?B?SDE4SUxoWW9EUFF3REMvL3VUYnIxeXhuc2NtVWVRNGhYWWtyVVlNcmxmOGQr?=
 =?utf-8?B?bmxvR1J0WlhmOE93cDExTWVucjNTMnhYZWl0ajRFUXY4R2l3bFhOS1pYZjF3?=
 =?utf-8?B?NktwMk9WQ3JPSFhzdCtLNklaS3BzcmdyT0htNnlrb1BNTU13QkNUeUJYRzB6?=
 =?utf-8?B?WW96Z2pVeW5PSU16OThVMG9GUU0zOWVoT1FhbW50SFhtc3Z4dC94dnYrb1Zu?=
 =?utf-8?B?UG40bElpN2Q0MXE3d055dW9JSEJQMTNnL1BhRS9mVi9jaVhRVWtFRzY4UkRU?=
 =?utf-8?B?dURudjJiRjR3K0N1UVdOWWdQYkZyeFBiaDBIS29EakxaS0plUCthNDJPZHBs?=
 =?utf-8?B?dFVKbjd2MHhYNDRZNXdiak1oelF2MmZ0YVQrUThrbi9leFZOU2E1bGJKQXpy?=
 =?utf-8?B?WktnREpxdHdFOGFMR3NMY2NYSEJIc0dscVl3ckp6Znlubk9nZEcvL3JnQ2l3?=
 =?utf-8?B?bjdoY1lGTlpwZ29HTlZqYzNRdlplU25ENTVJQTcyZlZCa3FyeVoyVVVySklK?=
 =?utf-8?B?bG1rS3lRRys4Ykdra3hXcHQwUGNiY0ZIWElRdStJcmc5OVlLcTMwZ0JIODBH?=
 =?utf-8?B?cC9jeWE3aUtvbHJyeFV6blpkdHJINzF6T0Y2aFppSjBuOEJ4RmdMbHpveFZx?=
 =?utf-8?B?STNva1RXRURNWDQxWkF2bjkrNTR4T2Y3Z1NlUEtZV3k2SnJ0Y2plZXdMTkJp?=
 =?utf-8?B?VGdRRDVsampndlhjaXlmTkRnVGZma2pjdTNBR0N3RmxFVHM3UVJEcFg0eVhH?=
 =?utf-8?B?a2NIZHg5UmFxTWdGSzVTbXhoMDR1MWM4eStxTmx6eUxFeGVPQTB5NEU1TVBj?=
 =?utf-8?B?SWVYaGhzR1ZsTFNKbXdOdmZqbUZCaTRxTHBlQVBCY0M4NndPVjlKM3lKa0pK?=
 =?utf-8?B?RGdGOU1uVXZiOUNOUmREV1h3eG9JbEJ3SDBkYUo1NlFLWTlab2hVRmUvZnVz?=
 =?utf-8?B?NUZyTkhENCsrblpYTTUwZStJM1ZpYTZ3ajVwcjkxTVRSS3ZXK3EwMTZZTGk2?=
 =?utf-8?B?RFY3dXF1bHlEdjhZd0g2SVFCSWxKWVZZT2RkVFFGQk9JQXlvd0MvQVpVMmpY?=
 =?utf-8?B?ZEhIY0pZc2U2ZlhxTGtaWFJ1WHB1Rjk3bXI3NzhvK1g1TTBCcEhva0I4Y3dz?=
 =?utf-8?B?dnZwS0FTM0lCRzJXWmhJdHNnVDV1Qk1GS0xwUXIxdU1rTTRGOEhNc2RPYTIx?=
 =?utf-8?B?UVYraWpjczk4cy90ZjQ5cmFwUjJ1dmF5WE1sUEVNaklQTTlPYjBOTjVOZFhZ?=
 =?utf-8?B?dExTQ3dTd1JoR0M1cEJhaHFtZkdVWWkwN215UTJKelcyNEJ3b1QxVFRyV0Nv?=
 =?utf-8?B?N0F1RHYzREh6Q1RvMUdIM3MyUXJhTlRsZ1JSV0tKQitvVlZVMWNjdC9HdXlG?=
 =?utf-8?B?Sk8zZHFuSXk0bzMraDFPWXR5WEp0ZWlCSE9zSTljZnI4TWp4MnE5UEFzZWdS?=
 =?utf-8?Q?dKPb+bA2xOeW2xEUWAj/zcB92?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	o15YCs3xWvzbHgHYjMg5pOvarQKDS6ygE2o7jA2O5pLdsYarHSsdN1nAakYhv7Ld3aVRnHmy8ISkI2iv+JZaL5yJZ6Ohwm7tw//YE/01DMumc03O5SLMJ4akE50ROBExWIK8WDSJCje0rmxekv+94sQKw6MZJNmFKlu2qST3av1SorogBqWcIMZjYY7rhgWcuU8nlfoovJT5q3mFM39Pw7U99/01UeM9R7gJyjf9pwdFJMb1Pur1Wv6fl8WjsS8YYmRT908er4I4vIFWyqyIHj90p/2hn3gvbfl9esk3q/3DzrQI/aYYN0M2i9W5g74/FAJHSVmnHDI/g9qqdg0TYcEiSGsdVBLiXhpxwbqOYQbLJ7ZTIeC4Kro/fsP7Wf5h7GT5crl+JjuSmUgzDxxcnC+dT5fH+/1jXIJKQtHGTn+dfIuunjyc8UQS4nfGaeY2+9UwCjwnqDGnKcHFjAhU2iouEquAjKjbNA1IE5ZbajPFbqjTeIKmVzK8asbJ/EYZYe6X6euWkvLJG+JJJfDY381wvH8IPCKgi1sTymg4p0UEhLNBay3yNuV+9MmiXlyOLHvBxNYJ5DnEM7T6Rjjo7BZDa469+1n8exS6Rfi3p7M=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: be2928b1-5ba8-4ac6-f0df-08ddc4234508
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB5647.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2025 04:43:12.0544
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zM0cEWhSF8fiS+s/TBT8i/o1bBVyslyVVsnBJ+XLH9IjvpjZ5MwvaZVpSpqf+i9tTVuM5e3PeNRzmAatdTISVA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR10MB4157
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-16_01,2025-07-15_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 mlxscore=0 malwarescore=0
 phishscore=0 spamscore=0 mlxlogscore=999 bulkscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2507160039
X-Proofpoint-ORIG-GUID: 4L0juiLmmsfkz3rqxmBaIa3f3CGvXDDY
X-Authority-Analysis: v=2.4 cv=Of+YDgTY c=1 sm=1 tr=0 ts=68772de4 b=1 cx=c_pps a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=OTi0qVZNva3CdtRRZtQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 cc=ntf awl=host:12061
X-Proofpoint-GUID: 4L0juiLmmsfkz3rqxmBaIa3f3CGvXDDY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE2MDAzOSBTYWx0ZWRfXwCDeuVeWHPEB 58RdC2Krrq5dUcgB0mFp6T1QO5bwoRDk+ZevZJ81nH08Zurj6vjy591lYqKsnNATwekgZua8v/x gVVE2fybsvaGQJZFSEjKj5SsL8AykvW0ZwaQQAmolUrPNSELWgq5u/HPyBlCgUIABaPRfrtUvNt
 5gZRePHEVkiDQRA2MIuATsTIpxL2+xogMYUwe20+vVc2zF1yNEvzg97jRkeYOw9v+tTS4lfCXTH UNIIWGYq+ffckRLSvos4BQTfv1cy/3lk56zwiMb8tXPdb74N/wSrlch4+q++Fo2pu8Nq7fs2LPE hLx2ev0v8K4b2NxkN2R/jf6xwFaIUz30VyZuIrUMAZdH4iYvGEvmpYGgiDA1TzO8fOwsFrAUBJd
 nt1lyv5euZG++tCll0hM8DP2jJoBfdENAHPBzuFHsoF0MAljK4BESzN/uWusuNxnihTVlrO3

Reviewed-by: Eugene Loh <eugene.loh@oracle.com>

Two minor comments:

1.  It is practically unheard of in our code base to start the switch 
statement with the default case.  With maybe one exception, we put the 
default case at the end.

2.  How about using this function in dt_cg_tstring_free() so that it becomes

     static void
     dt_cg_tstring_free(dt_pcb_t *pcb, dt_node_t *dnp)
     {
         if (dt_node_is_tstring(dnp) {
             dt_cg_tstring_xfree(pcb, dnp->dn_tstring->dn_value);
             dnp->dn_tstring = NULL;
         }
     }

On 7/15/25 15:50, Kris Van Hees wrote:

> Returns 1 if the given node has a tstring associated with it.  Internal
> change to make implementing optimized tstring-handling easier.
>
> Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
> ---
>   libdtrace/dt_parser.c | 15 +++++++++++++++
>   libdtrace/dt_parser.h |  1 +
>   2 files changed, 16 insertions(+)
>
> diff --git a/libdtrace/dt_parser.c b/libdtrace/dt_parser.c
> index eefe8341..f777a910 100644
> --- a/libdtrace/dt_parser.c
> +++ b/libdtrace/dt_parser.c
> @@ -1227,6 +1227,21 @@ dt_node_is_actfunc(const dt_node_t *dnp)
>   	    dnp->dn_ident->di_kind == DT_IDENT_ACTFUNC;
>   }
>   
> +int
> +dt_node_is_tstring(const dt_node_t *dnp)
> +{
> +	switch (dnp->dn_kind) {
> +	default:
> +		return 0;
> +	case DT_NODE_FUNC:
> +	case DT_NODE_OP1:
> +	case DT_NODE_OP2:
> +	case DT_NODE_OP3:
> +	case DT_NODE_DEXPR:
> +		return dnp->dn_tstring != NULL;
> +	}
> +}
> +
>   /*
>    * The original rules for integer constant typing are described in K&R[A2.5.1].
>    * However, since we support long long, we instead use the rules from ISO C99
> diff --git a/libdtrace/dt_parser.h b/libdtrace/dt_parser.h
> index 13f3cc99..ff32a84a 100644
> --- a/libdtrace/dt_parser.h
> +++ b/libdtrace/dt_parser.h
> @@ -182,6 +182,7 @@ extern int dt_node_is_ptrcompat(const dt_node_t *, const dt_node_t *,
>   extern int dt_node_is_argcompat(const dt_node_t *, const dt_node_t *);
>   extern int dt_node_is_posconst(const dt_node_t *);
>   extern int dt_node_is_actfunc(const dt_node_t *);
> +extern int dt_node_is_tstring(const dt_node_t *);
>   
>   extern dt_node_t *dt_node_int(uintmax_t);
>   extern dt_node_t *dt_node_string(char *);
