Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C90CA33F8A5
	for <dtrace@lists.linux.dev>; Fri, 17 Oct 2025 19:26:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760729207; cv=fail; b=Oc4driINRU5TrKyFV4qvxshRkQrc+NTGiwk55m3qZ1Ejmj2dRdS2E4/ISlcO8LzN3czpTe+bshzIY/ltleSLdoe4iHVXqclwAvwP0XZ8N73N8q8sT8/W55Hzt7qhy81pH9EiLHmQi4S7/6U0anZ7F6uaJRzYverv2hkj8HH6JNQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760729207; c=relaxed/simple;
	bh=KpQ24ycx5tqvDeaeyLDl6mCSV/XU/XOBCAypvSXsa7I=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=GeYaDtLwsdkO5qlRbtIygsSCsf4V8mx2qEAnfZHMmYn/tdpSUCd1/oFvooiSL8V6VMDXeHn0z8ItYZZDIIvyFbjGAfpmYIrgvoSYExynzD2Dqv53ybY3FYCbrE1+V3bxCTj/FM8y0IFjVbdrwNS+Qqi0MswFvCGKXdLSXrUwOz4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=FOgyoNdm; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=WzfH2MhI; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="FOgyoNdm";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="WzfH2MhI"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59HCdY8p010227
	for <dtrace@lists.linux.dev>; Fri, 17 Oct 2025 19:26:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=HfRXNndxg1AaLBiWZ1GSDCX7mVaTA/Ww5u0eIGaXmbM=; b=
	FOgyoNdm3PW1mDcr10vm3NyOc3b33suFlIZlADbuLjnDigwUQo9mtXV67N28ocb5
	xLcDegOsXA4o6jRasG5M39yxOlzDFS5jXVk/I1R5qHc8vTHOrZxo1AGjsG11Wxfn
	CKYX+RJ6n1T/jonnz3C4GeZE6tszYPcpY0X0b/E+wIMk8LvtWRrSBhzHIPKGAmVJ
	6Xn/P079ZSsdQ0AUQUi7HyHFdexzFLMEi/5XgVYDKe/WCy7Xm/3Pk7Q8hWo1XsWj
	fu8UclbkzDJ5mmzrLzOb8V3iZmOF/ZZdtWd3uSntI1byqWXlJhesAzUtAeN/1mY9
	0lplq89YvmBHv9sMyvXk5g==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 49qf47uf4a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 17 Oct 2025 19:26:44 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 59HIFZqX026021
	for <dtrace@lists.linux.dev>; Fri, 17 Oct 2025 19:26:43 GMT
Received: from ch5pr02cu005.outbound.protection.outlook.com (mail-northcentralusazon11012015.outbound.protection.outlook.com [40.107.200.15])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 49qdpkghxj-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 17 Oct 2025 19:26:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SA6AVqf65mK8ZKXy8qoOjq966B1zHvxc2yBDPU9acUW3GjetNf6MIzK/MlvTgbMTn0pKPLvhPLMMdrAswybH3xjUUSLs+YVhOkjMjylrvTaxCOlaSqffvvfvGGzrYNzT9AXIqHOb6qLuhYQ0Pm2xp0JYELMltpxt5COFBb3RKsFCnookK/d9gB7QyFG9cyEvP3ZlQclO+keILcH6wKUCaesK1Wf+cwF3Ft9lj/JDoSkR3EQ+6mxO0pZd3pg/g7tDmxraJbKLlZe+/EZHnj2cSDwC7gtfAWrAVNbKmeMPY4WLsDWRarkNg+pgkRHE8UATs1RD21kFgB2GZf5SFK9/ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HfRXNndxg1AaLBiWZ1GSDCX7mVaTA/Ww5u0eIGaXmbM=;
 b=D1qe7jZdWYskugSJoeoogalMQQ+2reqLQGMc0UKq8Y3AEfsXTRCposYIApvcPplbjb58ZFmQnk3RUNBeQX+wCUMfpiaX7ayAKIufUY3kqOwPJPKoDm7/r2gdmVauta0K5y6OCn1xMu/pbQMXPmjAqcansEfcG9MOr5uRkJEbL7zojKQeq+tv5iz47kinWtSmvnjBeb27vH+NCUFqlru0Euq8CewjKDEvndYFnAj1Tr0TXL6w+Pvo5nFdmbufO3tH7j4gHd6A6VraoPt9j/ap+cnqjAmcDgeTX2Rmh+UsDbhiL3Udd8j/4Wd/toDlrLsoQ7l60DObzlZwIeZz49pZ+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HfRXNndxg1AaLBiWZ1GSDCX7mVaTA/Ww5u0eIGaXmbM=;
 b=WzfH2MhI+zJXK947+mJomgeG1xJ9ysaj1LAC7xm5wE3pi/RKKbsS6Q536Nc0BUORMsz2jGzorUTXLRIpLmQvMQr7GG1nfQcKCz2gVdh8MSjvbhG2+ZvasqTAQy6EEk2aahL9YWNnOzZSq8VVRRJ0/OoxNiB1D7cUECJFF0NVD6M=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by DM3PPF8E7C782BE.namprd10.prod.outlook.com (2603:10b6:f:fc00::c35) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.13; Fri, 17 Oct
 2025 19:26:40 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b%6]) with mapi id 15.20.9228.011; Fri, 17 Oct 2025
 19:26:40 +0000
Message-ID: <1bbff8f3-e10a-2d65-87c4-ccbc9bb9a579@oracle.com>
Date: Fri, 17 Oct 2025 15:26:38 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH] test: Clean up stack_fbt test
Content-Language: en-US
To: Kris Van Hees <kris.van.hees@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
References: <20251016205641.15446-1-eugene.loh@oracle.com>
 <aPHf07N4ISwnhK7K@oracle.com>
 <87c44286-dd57-9368-da23-b2121febdc5c@oracle.com>
 <aPKB5Qd4L6aBoSe9@oracle.com>
From: Eugene Loh <eugene.loh@oracle.com>
In-Reply-To: <aPKB5Qd4L6aBoSe9@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PH7PR03CA0030.namprd03.prod.outlook.com
 (2603:10b6:510:339::35) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|DM3PPF8E7C782BE:EE_
X-MS-Office365-Filtering-Correlation-Id: 2c95fcb2-d897-4011-1be8-08de0db3190e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TkRoTVdZdmJPdFFFbGpQWlV1VURXZU9qRkJxVTI3ZnBKM00wNmFyNHNPWGw3?=
 =?utf-8?B?R2U1cTBPUDRONzQwbkVJTWIvK3BNSFNJc2Q1Q1Y0a0hLNlRuTzFHM3k3Wmtw?=
 =?utf-8?B?UUdDK1ZmQjZZdERMYzhGVUZhQWwwM1BBVkRIZHpEQ2ppZGdSMG4rSGRRSkZN?=
 =?utf-8?B?NVZkNVY1SDFmN3M2SUJ1RCtlbG9KeHNiak12RUJ6T2FCRXVIVjZEYUd0OURx?=
 =?utf-8?B?RjYzZjZmQzNMdmJoN2xKSHg0VVM4TmYxaWJzZkNjdWEvUHJJTWtYQU5xdnlB?=
 =?utf-8?B?MUZoQlorTXRTY3VLQjhkbHlwMk9MbUtEVEpFME5NWHZibWlaYmRYbkp5VUM2?=
 =?utf-8?B?TXJyck1DN3FvZG9SdWRRa3pmNXlXdkkzVnFQVTNkSGxqNDRCV2w0by9oZ0dC?=
 =?utf-8?B?dXQ0TG50YWdFb0M3QS8wN0pyKzN2bnZYNFAwa2MrWjFqODNBZEM0cmdSTkZ1?=
 =?utf-8?B?ZnhRak1iUW1STlJkQmM0LzR1aHNoSmk5YWpHQ0FORDRDZkwrSjZtRzhIRmZM?=
 =?utf-8?B?UVB0M2dFVStJWjFrOHU5Z2F3STR1c29KQkdFZkloYktEZHdOWXBnaElsc2cr?=
 =?utf-8?B?VWZHV1p0b0F2Y1R5ZWxGSWtieDRXdjNWeWVUeEg4eUJhbE9FT1VjM1pIelpZ?=
 =?utf-8?B?K1p4OVFPQ3JycUFCQ1FsUVRScUJrUUp4dTVpTHZsdXJ1YnVjakVYYWM4OHBT?=
 =?utf-8?B?R3AxcisvdGIrZFE4Z2hXbVRES2dHZlNnREZYeFp1TjJEYnlNSHErcERoZEhr?=
 =?utf-8?B?VlVtMHg2WmR4ZEl0bEhtNDZyTVh6Y1NPV1ZJZXlGMDJLeG5JM0pjRHJLMVph?=
 =?utf-8?B?R3V6bndaRGpKb1dJcmFTOEtVT0dJOWdRMXU1dk4rYmtnZUN3c1BLbExjVWR2?=
 =?utf-8?B?UmpyMi9qRWVwZklrSHgzZDhlTEM5dHJhL09ROXhXTzE4eVZHUk5PRFJ4WUg1?=
 =?utf-8?B?R3FXK2dHUks3Q0RScGdSaVpPS05iNGRJWjQyWHE2c1BhMmRlS0ZrcXlyR3J6?=
 =?utf-8?B?eFFXUlR5SnlhUitzNFErOXI1SkpNblI1ZUFOYkNFTXVSQytBblZ2eVpxV01W?=
 =?utf-8?B?SFJsTjljMnA4bW9MR1hnSCtySUFhQUcvQk5FMzFUTUVUUG5PRjJHYmRFZkNJ?=
 =?utf-8?B?ZDJwck5kb09TNUU5RXVXN2t3dkJKTnR0L0dJNkFIMEtsWU4xVUdVK3NrSlpp?=
 =?utf-8?B?UVRHSXJhUlNRODkxWDMvRC9hTFNzZXBUczN4ZXowQTg3OVgzb0l3aU1KVkdF?=
 =?utf-8?B?ck11ejBndXZYSTlTay9URkpEdTVlN25LVk9VQks2T1ZlaTR3VFBpNkphQThy?=
 =?utf-8?B?NHJLYURMOVdTRHR3MkhzQ3NaR0loSnMyamNVemM1UHlmS0taVkhOVHRDc3p0?=
 =?utf-8?B?VWVwWHV5aGJ5cWZkTFVWWTROZEFob2xTZGdBdlBpNW1VRnhDV3RXcmRlTjNT?=
 =?utf-8?B?djR6NUZwbklHUDIwTDVmTlZkVVNXd1BSdGtuNGZFdTBGL1pmUVl3OFlrTE5U?=
 =?utf-8?B?YlVqTUhLQjgzTHVTRklWdHdCdHlzdjZNc002S0RBSVhyK0hEd1pUNjZvM0R0?=
 =?utf-8?B?WnowMDF1TnJqaitvT2dIeUd3dll5aDZFbkRrSjREbGdpT1liQmk4TWtZZWpX?=
 =?utf-8?B?d3VUT3BOajZaYlJKZ3hLYTc1L0tWL3dtOUtUWnlKZlBwa2VBTHp2bHZrd0pl?=
 =?utf-8?B?bVlrQ1JCVkN5MEppaW12dlVFWm02dFNtVzVOTDZ1Y0JWWW44SHJtZGovVTJi?=
 =?utf-8?B?TjZ0L09yd2R6emVWQVFGMmRRVlhPVnFxbm9TaGxVM2hqMG9iUktFTHNweEFG?=
 =?utf-8?B?NDlJWlpHRE92czhHSGMvQVMzS0hFVWswczZGdi9IeVoxZXFCVUc2MDI3Rmdz?=
 =?utf-8?B?SDZCclRnKzNFa0syNUxxWXpJZ2Zad1RaU3ptRTJURXd3SEFLWGZ3UGxVdTZT?=
 =?utf-8?B?eTBObExCTFdGQU51bXV4WlZuZkkrazZJT0wvd0x3M3k0SWVWcFhqTTFla1RK?=
 =?utf-8?B?NnluQWFVZW5RPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Z0J5Qm1IRll6YmdIT2luVFdlRGdhRjlJNTA2OGxSRk14REcvc2FNblJkcWlZ?=
 =?utf-8?B?VWVYSEZrTVRUNlpMbk1RbVRtb2d2US9HM0ZpcThQd3VEZVo1WExhYjl3bVZo?=
 =?utf-8?B?bmlDdzlTSEtmQUpDbFNNUVppT280c3V5OFZkampzc0VnbmFRZ3NqbFhCRSsy?=
 =?utf-8?B?eVJZK2lYckRaNDNReU15V1BxYnF0MkZHdkZhWEhsWTNOOWVCVEswcEIweENY?=
 =?utf-8?B?K0xaNk5Tcm1OeWR5SG5PeVJhdHdwdEdyMjFNM2hRRUtwTHZBdStNRkg4RlpT?=
 =?utf-8?B?cElhZ0J3ZUtaVFBWbXJNeTE5K1RpZGhVb04zb2JrQ2daTTgxTkhDVnJlczdi?=
 =?utf-8?B?ZGhHUEcwMWZSb1l2R245dW15ZVBqa1pMSDFFVmRmTU9lYUp3VmlQczVzbzZ3?=
 =?utf-8?B?Qitya0FNWE5EUmdaQTYrWGlmY2xIT0RSMy9rNnVKNnFuM25lQ3JjaEdRNktL?=
 =?utf-8?B?L0JHTGRtQUkwRWFGbGJTbVNJbStCNjJMV1JrWU9pVFUrekUvbndlWEt6dWxQ?=
 =?utf-8?B?TGFsTUdibjVWZGlVMTUrNms4MEh2Ly9UY0g3cGU5dVc1WEZucjN2amNBWHZh?=
 =?utf-8?B?UWRwdkV5OExWRHVxejRJTFNFRncvU2NwQUtQcXkvdVBIRTVRYXhrOVVTOHQ3?=
 =?utf-8?B?eVBxbldGSWl4MVRsSkd5UEUwcHJNZ0lsQUVCSTkraXpJMVhLZStpNFFwOUVI?=
 =?utf-8?B?TnYwaWsrWVE2OG9HQVM4VlRINU1EWWpyVmsvaW9tTmRnYnRSR0MyM1psMGRt?=
 =?utf-8?B?a1FQS2U3cWxUSkFwODZiOUhKV1pPYlpwak5GTDB1U2hIQUtBS1d1SlNQTU9K?=
 =?utf-8?B?MzErazNweCtvdTNIVHZ1aUdDSHQreVVTb1hsRGs5bzdzNWdkY0c0TWxYTVlD?=
 =?utf-8?B?ZWpxcGdnVlBhSERkL2wvWTlkU0dCeVVLUGRRbWtnckoyQkNLYU5IWXVRWll3?=
 =?utf-8?B?MHlJUkV0TURSZnNsKzdRcytRY29qQlVmWmdLeDhXV1hDOTdSUmhQYW1VYit5?=
 =?utf-8?B?T1dvcmVocmRtNDdKRTNpbkZrd0kzTGZUcE1SZXRWVmxMWHFLWmJNS3pLbHJm?=
 =?utf-8?B?RmRkVHRTSmQyQ2R0TWwvS3hxUkVnOGtOZm8xVU5ZdUFtWkc3alFQS2I4R29v?=
 =?utf-8?B?K3d4Z2hNNHNZODRMcmpaWTJ4Wi9rTzEreTVKYTM4aWZ0ZlJTT3FJeWJVdVN6?=
 =?utf-8?B?Y2pub1N0OG16NmdKaEtQYUw4ZDRIblRCQjhGNHRSNXZ1dzF6VTBWQjVqeTNz?=
 =?utf-8?B?L0tDc3NlYUJLUUxrMDZ4M3JKM2VTS0V0UVNhUWhadGc1dStmd2htMzFqb2x1?=
 =?utf-8?B?V1J6eWxEQlBoZ2FZMi9BTFBOdUdrNmdPRWFrMGZCeDZ4QllLRENZdHJFOGhl?=
 =?utf-8?B?WGQ0NkNCRXpoVStZc2hUcEdkSTZlRjFTbXV1RjdkTytWanM5cGlrdS80SG54?=
 =?utf-8?B?TXhBUTBPaG5qb3FhOXlBeDFnMzFTVU1rM2JMZHNROERRMmZQT2ovV1ZxTGo5?=
 =?utf-8?B?VHZMckFORFZHVEtTU0V0SGVYREhQWWxxTFh1czI1Nlpkc0lXTXgvV25ucHFB?=
 =?utf-8?B?RXZLdmRYMGV5aEs5NXg3bUo0Q1RQR2R6S2EzSUIxQktZQzFiUnZxOXo5SCtJ?=
 =?utf-8?B?bVR3cEJXQkVjdjJsM010eUZHK1lSVitqK1YrZEFHOFN1ZGdJNkg0V0xDM0l6?=
 =?utf-8?B?RU1rbnlNa3g3QXF1TlJPWG5HeVBwVHBpNlc3Mkl6aHRsYnlZMTdWcE93RUZI?=
 =?utf-8?B?VmthOTlPeXQ5MS9jbUFuNmptZ005SnBnZmo3bXNOaE1PeGtnTC9oOTFwQ1BJ?=
 =?utf-8?B?SHJyenNrb3dxRDJoQ3RiWWFRc1dvb20zKzBVZ1MzYjVaeFZTNm9ybUxwdUZX?=
 =?utf-8?B?S2xoOUN6bngzV2VPRjZ1MG1QVVprTi9kNERCOWh1RGZkbFFnOUcwTCtEL2J6?=
 =?utf-8?B?c1B6UjNMK09hNkpiMTJDOUNKSVpGcjV1d1ppc1pxd0NuczJvMVZ4NDlRVyto?=
 =?utf-8?B?SS9tRDhwOWcySnBoZkh2TktUL0JvMHF1QmxycDlwcEd2N3VZek9vOFFJMjVy?=
 =?utf-8?B?Q0RCdU1yZFhERUxqZVZuTDlwUmlEZU5ka2lwQStoa1R1ODBnVjJzUVRPQUhx?=
 =?utf-8?Q?2BEJltB9eNQbeyx77vzTQ4InP?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	p3qwXMK0qQHVH7FzudnSrXnL5yJQvhhY9L+XSXw9f4X6H7pBWLT5hskdKNwcfrKb2Oke6H9FR0aaQpZboIl1skoSLriTQtNBn+NS7CIHQ8GCSJN/WznM82kguP7OD07N5411VdimUNANuCd4RVkkA2kxdYN6a0qVZskIpZusIcRHUflxqCPVURdSZvMUKE4UOK3xG5LgbuTTO2298MZDHcrwpKXAiO75Krt7X1qssrBNJmSyAW4ZVcXYvW4Yl8BV+A+iWGMSqPK0wgbaEvJUUw93uE9j7r8lL5Vw2fGnnJviq1HXcFOjBioMhAQrRlc9NY7j7wds6gSRS/2DJY6QivKLxP/j0xwA9NKNd7wU+kacdJCUbyQWwvECYgYW6L20n4DzHDZVzcJYfXEC6RXFoLqr/QPM/EFg1pSE7IFZFcnvZQQc23ERjlHqCZlA8nZub6dgrT7iBBpgLWlN1QRPiXmTnyh9vAaYpRReFFf9sq/ZZR6+LGUP2MOemDDHB4DVNdpNaS9tvKR4iMsy3Q0ccQxXL521OWISu7w0dcRKnE7eWUyJg7KkF/K7OY42pwdBlIleBGsUMyOvkczr3BNYaK+k1cE7H5S6mfT2y3AOWco=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c95fcb2-d897-4011-1be8-08de0db3190e
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2025 19:26:40.5337
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EENGheD3yr192V2ZiKiVGYuKFM7vS/iyj+reDTfXycVSDWbKF/x380Fx9fbupXIqcc3lnoh2WFdrhrmDrg0pNg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF8E7C782BE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-17_07,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 mlxlogscore=999
 malwarescore=0 mlxscore=0 spamscore=0 suspectscore=0 phishscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2510020000 definitions=main-2510170147
X-Authority-Analysis: v=2.4 cv=SK9PlevH c=1 sm=1 tr=0 ts=68f29874 b=1 cx=c_pps
 a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=x6icFKpwvdMA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=yPCof4ZbAAAA:8 a=A1LRvZI1Ug7z-f6Pca4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 cc=ntf awl=host:12091
X-Proofpoint-GUID: uyk1zrVdx2-ZugZQMl3rD6qSntIrTBKE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAxNiBTYWx0ZWRfX05nu+8Wh0ZLm
 D+2RlTz1n+heD/tY7AVLzpb8HKDic5T1fJ1PIrslu7koRoUH4YLz0qmiXCNKnZY1cuYDnSeznGF
 ZAftvhvodKxLqRyNgKjabQs8p3DRnjvlAx2J8/Anx6m3+jIEa4qTMnE40zzTT9tcc6bg5RpfURu
 Idhu6aPsLkb9rkKBrJjBGu1wL/Tw7RxKgTJPTnWkYXiQIbruC9oEhvZeyrkxCDJijqTth5kRzTB
 ySHJ6TF+ZzeiJheMY+/KnSrau691VoVwiliAfFftVa2r8DihFwD3DRQIUVbYhV3cPV86lSRt5yN
 H36akpOxk1xpF567emn+Hqp+LicQGeg9bZ1ZCa6j1FuSHPPp/DzQr9Ve6CCB7o9AFRiFs1gZmz6
 xRX3Z6yepMU71yPAkXGq9PDUW9XCT4+tmCNpGfNFUOHJJTv5MaQ=
X-Proofpoint-ORIG-GUID: uyk1zrVdx2-ZugZQMl3rD6qSntIrTBKE

On 10/17/25 13:50, Kris Van Hees wrote:

> On Fri, Oct 17, 2025 at 01:32:46PM -0400, Eugene Loh wrote:
>> On 10/17/25 02:18, Kris Van Hees wrote:
>>
>>> On Thu, Oct 16, 2025 at 04:56:41PM -0400, eugene.loh@oracle.com wrote:
>>>> From: Eugene Loh <eugene.loh@oracle.com>
>>>>
>>>> The idea behind the test is to check the stack() output for some fbt
>>>> probe for specific expected frames.  An attempt was made to specify the
>>>> exact stack that was expected, but there are too many variations among
>>>> kernel versions and so maintaining the test was difficult.  Loosen the
>>>> test to check for only a few expected frames.
>>>>
>>>> The test was also checking that stack()'s first 3 frames matched
>>>> stack(3), but such a test is already provided by, for example,
>>>>       test/unittest/printf/tst.stack.d
>>>>       test/unittest/stack/tst.stack.d
>>>> So, drop the stack(3) stuff.
>>> Since the kernel implementation can change between versions and architectures,
>>> why not just verify that the function we're probing is the top frame, and then
>>> perhaps for sanity ensure that the rest of the frames are resolved addresses
>>> (i.e. symbolic nmes rather than hex addresses)?  Although that perhaps might be
>>> a bit strict because I could see some architectures implementing the syscall
>>> stuff somehow with dynamically generated trampolines or something that would
>>> not have addr-to-symbol information.  Or ksplice might even cause that if the
>>> splicing took place while tracing was going on because we never re-read the list
>>> of kernel symbols after dtarce started.
>> That feels to me like a different sort of check.  The intention was not
>> simply that the result should be visually reasonable, but in fact that the
>> frames are "correct."  That's hard to do (because we don't exactly know what
>> "correct" means), but there seem to be certain specific frames that we can
>> generally expect to see.  Maybe there will be some systems where the
>> generated stack frames are totally different from what we normally expect,
>> but maybe those situations will be scarce enough that we can just look and
>> make one-off judgment calls that they're okay.
>>
>> Anyhow, the idea is to check that specific frames are there.
> OK, bvut that seems to be outside of the scope of DTrace testing because the
> stack traces that is reported is provided by kernel functionality and we are
> not testing the kernel inn our testsuite.

Hmm, if we are relying on something in the kernel that turns out to be 
faulty, then we should want to know about it and users will not care 
whose fault it is.  We care if we are delivering correct results.

> So, if we keep encountering issues
> with changes in the kernel causing tests like these to be updated, I think we
> need to reconsider what we are testing and ensure that we limit ourselves to
> testing DTrace rather than things like the kernel.  The kernel has its own
> mechanisms for testing that its features are accurate (or it should).  That is
> not the purpose of DTrace and its testsuite.
>
> As such, if the stack trace being reported has the correct top frame (the
> fuction that we are tracing), and we are able to resolve addresses (which is
> DTrace functionality in the consumer), then we have tested the appropriate
> functionality that DTrace provides.  Accuracy of the stack trace itself is not
> somehting under our control.  We can only report what we are provided with
> by the kernel itself.
>
>>>> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
>>>> ---
>>>>    test/unittest/stack/tst.stack_fbt.r  |  1 +
>>>>    test/unittest/stack/tst.stack_fbt.sh | 89 +++++++---------------------
>>>>    2 files changed, 23 insertions(+), 67 deletions(-)
>>>>    create mode 100644 test/unittest/stack/tst.stack_fbt.r
>>>>
>>>> diff --git a/test/unittest/stack/tst.stack_fbt.r b/test/unittest/stack/tst.stack_fbt.r
>>>> new file mode 100644
>>>> index 000000000..2e9ba477f
>>>> --- /dev/null
>>>> +++ b/test/unittest/stack/tst.stack_fbt.r
>>>> @@ -0,0 +1 @@
>>>> +success
>>>> diff --git a/test/unittest/stack/tst.stack_fbt.sh b/test/unittest/stack/tst.stack_fbt.sh
>>>> index 15b85be13..f3d321e7f 100755
>>>> --- a/test/unittest/stack/tst.stack_fbt.sh
>>>> +++ b/test/unittest/stack/tst.stack_fbt.sh
>>>> @@ -5,7 +5,7 @@
>>>>    # Licensed under the Universal Permissive License v 1.0 as shown at
>>>>    # http://oss.oracle.com/licenses/upl.
>>>>    #
>>>> -# Test the stack action with default stack depth and depth 3.
>>>> +# Check the stack action for expected frames.
>>>>    dtrace=$1
>>>> @@ -26,8 +26,6 @@ BEGIN
>>>>    fbt::vfs_write:entry
>>>>    {
>>>>    	stack();
>>>> -	printf("first 3 frames\n");
>>>> -	stack(3);
>>>>    	exit(0);
>>>>    }' >& dtrace.out
>>>> @@ -37,17 +35,16 @@ if [ $? -ne 0 ]; then
>>>>    	exit 1
>>>>    fi
>>>> -# Strip out
>>>> -# - blank lines
>>>> -# - "constprop"
>>>> -# - "isra"
>>>> +# Ignore blank lines and strip out
>>>> +# - ".constprop.[0-9]"
>>>>    # - "_after_hwframe"    (x86 starting with UEK8)
>>>> -# - pointer values
>>>> +# - "+0x[0-9a-f]*$"
>>>> +# - leading spaces
>>>>    awk 'NF != 0 { sub("\\.constprop\\.[0-9]", "");
>>>> -               sub("\\.isra\\.[0-9]", "");
>>>>                   sub("_after_hwframe\\+", "+");
>>>> -               sub(/+0x[0-9a-f]*$/, "+{ptr}");
>>>> +               sub(/+0x[0-9a-f]*$/, "");
>>>> +               sub(/^ */, "");
>>>>                   print }' dtrace.out > dtrace.post
>>>>    if [ $? -ne 0 ]; then
>>>>    	echo ERROR: awk failed
>>>> @@ -55,77 +52,35 @@ if [ $? -ne 0 ]; then
>>>>    	exit 1
>>>>    fi
>>>> -# Figure out what stack to expect.
>>>> +# Identify, in order, a few frames we expect to see.
>>>> -read MAJOR MINOR <<< `uname -r | grep -Eo '^[0-9]+\.[0-9]+' | tr '.' ' '`
>>>> -
>>>> -if [ $MAJOR -eq 5 -a $MINOR -lt 8 ]; then
>>>> -	# up to 5.8
>>>> -	KERVER="A"
>>>> -else
>>>> -	# starting at 5.8
>>>> -	KERVER="B"
>>>> -fi
>>>> -
>>>> -if [ $(uname -m) == "x86_64" -a $KERVER == "A" ]; then
>>>> -cat << EOF > dtrace.cmp
>>>> -              vmlinux\`vfs_write+{ptr}
>>>> -              vmlinux\`__x64_sys_write+{ptr}
>>>> -              vmlinux\`x64_sys_call+{ptr}
>>>> -              vmlinux\`do_syscall_64+{ptr}
>>>> -              vmlinux\`entry_SYSCALL_64+{ptr}
>>>> -EOF
>>>> -elif [ $(uname -m) == "aarch64" -a $KERVER == "A" ]; then
>>>> -cat << EOF > dtrace.cmp
>>>> -              vmlinux\`vfs_write
>>>> -              vmlinux\`__arm64_sys_write+{ptr}
>>>> -              vmlinux\`el0_svc_common+{ptr}
>>>> -              vmlinux\`el0_svc_handler+{ptr}
>>>> -              vmlinux\`el0_svc+{ptr}
>>>> -EOF
>>>> -elif [ $(uname -m) == "x86_64" -a $KERVER == "B" ]; then
>>>> -cat << EOF > dtrace.cmp
>>>> -              vmlinux\`vfs_write+{ptr}
>>>> -              vmlinux\`ksys_write+{ptr}
>>>> -              vmlinux\`do_syscall_64+{ptr}
>>>> -              vmlinux\`entry_SYSCALL_64+{ptr}
>>>> -EOF
>>>> -elif [ $(uname -m) == "aarch64" -a $KERVER == "B" ]; then
>>>> -cat << EOF > dtrace.cmp
>>>> -              vmlinux\`vfs_write
>>>> -              vmlinux\`__arm64_sys_write+{ptr}
>>>> -              vmlinux\`invoke_syscall+{ptr}
>>>> -              vmlinux\`el0_svc_common+{ptr}
>>>> -              vmlinux\`do_el0_svc+{ptr}
>>>> -              vmlinux\`el0_svc+{ptr}
>>>> -              vmlinux\`el0t_64_sync_handler+{ptr}
>>>> -              vmlinux\`el0t_64_sync+{ptr}
>>>> -EOF
>>>> +if [ $(uname -m) == "x86_64" ]; then
>>>> +	frames="vfs_write do_syscall_64 entry_SYSCALL_64"
>>>> +elif [ $(uname -m) == "aarch64" ]; then
>>>> +	frames="vfs_write __arm64_sys_write el0_svc_common el0_svc"
>>>>    else
>>>>    	echo ERROR: unrecognized platform
>>>>    	uname -r
>>>>    	uname -m
>>>>    	exit 1
>>>>    fi
>>>> -
>>>> -# Add the first 3 frames a second time.
>>>> -
>>>> -head -3 dtrace.cmp > dtrace.tmp
>>>> -echo first 3 frames >> dtrace.cmp
>>>> -cat dtrace.tmp >> dtrace.cmp
>>>> +for frame in $frames; do
>>>> +	echo 'vmlinux`'$frame >> dtrace.cmp
>>>> +done
>>>>    # Compare results.
>>>> -if ! diff -q dtrace.cmp dtrace.post; then
>>>> -	echo ERROR: results do not match
>>>> -	diff dtrace.cmp dtrace.post
>>>> -	echo "==== expect"
>>>> +diff dtrace.cmp dtrace.post | grep '^<' > missing.frames
>>>> +if [ `cat missing.frames | wc -l` -ne 0 ]; then
>>>> +	echo ERROR: missing some expected frames
>>>> +	echo === expected frames include:
>>>>    	cat dtrace.cmp
>>>> -	echo "==== actual"
>>>> +	echo === actual frames are:
>>>>    	cat dtrace.out
>>>> +	echo === missing expected frames:
>>>> +	cat missing.frames
>>>>    	exit 1
>>>>    fi
>>>>    echo success
>>>> -
>>>>    exit 0
>>>> -- 
>>>> 2.47.3
>>>>
