Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C531C2AC17
	for <dtrace@lists.linux.dev>; Sun, 15 Jun 2025 17:50:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750009813; cv=fail; b=Zewx0yD+1pO5vRUu+1OfsqPJKnGg8www9OCMVygmxRYk6a2/F2RDZIGhrKzELk1yAFZPFiTDR9ZdMjPQK/lBHyQcvhGmT4tWwRVUQXogd5L8HRQjwbgGV8gcn50YWzQmrF/3XzKgI2+ni8ndvVX1ouzWDOvNVwWzW0iqYGSyUL8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750009813; c=relaxed/simple;
	bh=ZpIbTlo9YY0iLNg6yrGGYkd2xTKFrIDYPrgmdpadvUM=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=rAXBLzsuAcmRTPWNbOz0+0P1DBwccp3XI4rtHPAYzNWXIKS0po6W6zTd/IG8l5FKftfkeQl2ADVBswAtAbguR79KHNaXTQHCaSWyAvSDD2W0nC/FNGAAyJG7wWEt4nUje8bIzXEQP1uKd8Djqp326LNd+NhQs9mJM+xPZg35iC8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=W+jjzmVT; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=yPFHj0PM; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="W+jjzmVT";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="yPFHj0PM"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55FFUrMK028573
	for <dtrace@lists.linux.dev>; Sun, 15 Jun 2025 17:50:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=0yjGlp02l8Nxw7dgPxtB775ncHSmk76nGAon+CcjM08=; b=
	W+jjzmVTena/7BvVNyHbxCqKR3Y2Eaxpw83XcEfJo0RjK8shYchLdzdWyYaSSzZC
	/ZJS/qMmR4PtGuaAFXCBzHGJCFSyb6r4VBVcVVn472VI1KRiR4yLWtNEbyM6jXPR
	A8Wj2+ja4mYss956U7pykr5dAbDt+JjTqpVsWqq/76TfEhct93tvrVkAjVv3jbnF
	mpgRr5FBKeKmwzwHOg4b7w3nGqyS05MDJOhYFwRC7A8drZvCjXrtDQBotojVHi0h
	xKMxg7xztd7giuT/bG7+QCrqxfNS0aVaiJGgILWSxFOzbAxZD6YL1JVY6QXu7xLa
	fP5K24QlB+dYljU0VQFk8w==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 478yv519xf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Sun, 15 Jun 2025 17:50:10 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55FGLirw035184
	for <dtrace@lists.linux.dev>; Sun, 15 Jun 2025 17:50:09 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12on2057.outbound.protection.outlook.com [40.107.237.57])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 478yh6ws9p-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Sun, 15 Jun 2025 17:50:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cKXa9hsSevGWhAUgC0w86dHayC2Ssgzz01Ks1T9xL0f8gi//6xKCSu7U+XhD5kezX8+tJwHoXEOvdvIt7NqxCODwCD0AMdWngTKcJ0yH/BqI+TojKktwkOPHdzpOP3/edwZnmhxV9jEMnqO5PnL5TP3Pew58lsSYyBn6q7soYX/Rkfp6aRnDq9E6GE63C6EabOKtbTLwQvgaScy77ckU7ojy9XLNa2gA0li3kkr2F9o2RYjAf3NOt4GcmFwF8Om+QQtZq2o/cwX2wNyFV/dpv5VlkGt1kCH3Osv70kxmVh8wZIUy8WOcsgrbsqnkzZ4VKt7fHnkpRqMaPgbekGbU1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0yjGlp02l8Nxw7dgPxtB775ncHSmk76nGAon+CcjM08=;
 b=vdQizUxMdtripVr4x+9TlXDvgy+VXmis+fMpYFKL9vtXDwCuhWtkC1f/k24t5OhyxdszuTvtk63IJzeMpiOTLVm0cOOJW3n22UMywcFANaaWCkdqi8ZkKYfzpHqq889DlPyMipUF4F8f6PVtsJP7eR3yobXy+HAxfgV8WkoaZ0rzbxpB+88Grw3Or/MCaKUkqGma7xRFxHyYB19OXFKdX+jTbXoSATr1RG2b6ZdOOYrPLu0zrIBrFNxOEnoZkjlXk77u9ql0nG5ElBSmN0bi2Y+wlRFzGP+6/ewnXM4s8HadbK6Md7661M98UOQDjlzS2VnT0HRN7pTBH3/n8pO2Ng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0yjGlp02l8Nxw7dgPxtB775ncHSmk76nGAon+CcjM08=;
 b=yPFHj0PMhs5Wx5V1dE7MbzzK8eEVPmWRH76dbwjIZInrQ6UD8zjLWHytMhSSkvp0XX9Ylqtak+bVVgSs3nSQ1hrdipuZ/cqowYrO/fcBFVEcj3d/lQQZ6aShgR1Ny6GyBqsrCSAXtqNv0T2HrKIOSgTAQ2I6T2UMUvVCG9bwOuE=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by DS7PR10MB5997.namprd10.prod.outlook.com (2603:10b6:8:9f::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Sun, 15 Jun
 2025 17:50:06 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%2]) with mapi id 15.20.8792.033; Sun, 15 Jun 2025
 17:50:06 +0000
Message-ID: <4e0a07a6-04a0-3d60-af59-ba32a41a03f6@oracle.com>
Date: Sun, 15 Jun 2025 13:50:02 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 11/14] Test: caller and stackdepth tests for proc provider
Content-Language: en-US
To: Nick Alcock <nick.alcock@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
References: <20250522180118.27343-1-eugene.loh@oracle.com>
 <20250522180118.27343-11-eugene.loh@oracle.com>
 <87ikkzbsmb.fsf@esperi.org.uk>
From: Eugene Loh <eugene.loh@oracle.com>
In-Reply-To: <87ikkzbsmb.fsf@esperi.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQBPR0101CA0347.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:6b::8) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|DS7PR10MB5997:EE_
X-MS-Office365-Filtering-Correlation-Id: c14ddb7c-b830-4f5a-5716-08ddac35101d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NzRhUnpYYUpJWkpvQ1hpbzAwaENsTUxqWVQ4Z1J4Mmk4N3RFYTkxSitXbkMy?=
 =?utf-8?B?QXlhejlBeVNJWGhBNEZ0cXlKbXh1NDkrOUpyT3RWdS9BSktJb2F2L2k3TWV3?=
 =?utf-8?B?bEcxTmNwVVZ1b29jSm1YRzFFY25YMjhVU2lZNXlGT0xqR3puTGxzQ0xIMExQ?=
 =?utf-8?B?dUZWZUxuLzF0WW1lNjBQZnA1Wis2ZGJBWHhlOTVqSkkya28yZG9QSm9MZVo0?=
 =?utf-8?B?VytnVXVXeTZ3Qnh5bmpYN0NaN2FrWmhzRmsyNkpHVjB4aUpubGh4blkvMlBQ?=
 =?utf-8?B?ZDhVdXpvUE8rdWFOR203WFUrc3NoVlMxcVluQ3ZLdHVxaXgvZ3E5ek9wSkVs?=
 =?utf-8?B?Y3FhNGpVZnNxUEozU2lIb1UvcmFnVGl1ci8zeDVnV2VhQndmcTYxRnkrSXlX?=
 =?utf-8?B?VExJREwvalZsNnlaZ3JlbnlEcHY1cW1CMHl6NVltYjMzS2NIQXdzdTlDYWdT?=
 =?utf-8?B?WkJMcUZpSmpxL1oyeldZekpQb3FVbS9wL0lZMVdjbE9KeXUyS0gwRHB6L0hW?=
 =?utf-8?B?RklkUlJuRW1PcUdndzZqUG5oV1hjcElTMUNKN0R0T2pYOUdDdTlscDdlVS85?=
 =?utf-8?B?U2dLaWV2MFhrUUxycEpLUkpZTGFVclY5bUJhWlJkSitwMFd1WWs2UE9rcEVW?=
 =?utf-8?B?OWE0UkxBZUlBRXRVakhkYks0Zzd3VlRuMlRYNGQ5MDR1cnRkN21jTURxZ3FM?=
 =?utf-8?B?dGVKRndoaFpCbWI3ejhaY09sY0xaQUpRMUFLQk16ZWgxOVVRd0xjWnJYOE01?=
 =?utf-8?B?RU52VDJNWlJRS0NLQ0ZuekdRWjJUQzZCdnU3SkxkeG9VV3k4ajduZTJrTUFX?=
 =?utf-8?B?V1I0dUk5OXNnamxVcXZsd2Z6VTVldzlISUVpaTFpRm9uZm1ZWVVFMDlqdmVv?=
 =?utf-8?B?NjV3T1YzTlpMdEtRSDB4VTVoMEVibUZ6VUxSaUJGZDQ4UTFnUFRaOVJRZU1J?=
 =?utf-8?B?bVZMV2JvaitTcStnaUp1eDB6b2VuVFBxSW13MkVNcVJlbGpRSWhXSmp1ZnZ6?=
 =?utf-8?B?QUlYWFVvV3pFbTdJOEFLRXRvWXhQYkU5OVZaRUFmbjM2ZGVrdmhUL3A5OFZv?=
 =?utf-8?B?WDlidzQzMWVCKzd3NXAyMEFKc2xTSjQ0a1J3ZWRWeXY2cEZ4Q0o4SktWWUVJ?=
 =?utf-8?B?ekRKM0MvZW9IcGdxWFZwdHgrTnFrNURBTXI5WDNRZ0RlQXdWNEEzMzk3MFhS?=
 =?utf-8?B?REtJaW5ITnBQQVAyUmovWFJ2Ly95TUNKUUQ3TmF5cFlPZ2N2eC80YTFhSHZU?=
 =?utf-8?B?akxDKzV3VzBHMXdCS1U2dHloOUJSR01UbWpkQlJua3lIelQyVjAxZGhGRXN6?=
 =?utf-8?B?Zk9rQXdTalZQeVp2bEY0Zk5GbDAxR24xQ080WHFsaUxSWUwyamllTEdnb3JW?=
 =?utf-8?B?T3ZNNGZ0ejdvZVZNNDVOVENnT0xOVkVrbk8wWGZnV05GUVlhMjU5Z2dkTmR5?=
 =?utf-8?B?RFRYc1BHS2FJYjdMWW5PSEp0SlBiNjhoSW9ZVkRqbXBVVDUzbk9BeUxLNmE0?=
 =?utf-8?B?OG8vWGhrRlc1U0xhVno5NkNCQkE4am51ZW81SzAvUE9Ycm4zY2oxZ1JvSmRS?=
 =?utf-8?B?TldhMEl4MUxVdXNJVjZ3S09ZVFMrSW1zcUxkVkExaXBSS3hyMEtWQ3NSNXFG?=
 =?utf-8?B?dzJBamtUZFNpTENEam9iUFdENUh1TGtybkFDTkdVTWFkZUlXRUdHdFpPaHlR?=
 =?utf-8?B?OC9ETVJFU3BDZnFFVnRXQlIyWER5NFFDd0ZsMmwvdmpOaCtNRG1xRGtEbnlu?=
 =?utf-8?B?S3Z0cHlrSUQ1NlZUcEYxdkdsWE05T3pFajVNOWZSdGMzZVlIalBrZUltRE4v?=
 =?utf-8?B?SmkxblIvZWlLSVkyRnpMUW1TV0FNa09yVmJLSndKUlVXL1kySlJDSjJUdVNn?=
 =?utf-8?B?bDA5eGg5ZVBMczg4UU1EaUtFWENwT1l2Z0haeFQ2NWFjUE4vYXN5OGpEVnFC?=
 =?utf-8?Q?5jkAtgYAuEI=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RDBGTWc2bWxpekdMQXRPNE1tSGN2akNqMmVNc1ZWb0NlY1dyaEdsTE1aM0Fa?=
 =?utf-8?B?ZWpBVlJTMUZtMURlNEpiZmlFSHF2b29zZEJ0VFdVSDV5Z2FQSFRPOW5HMjRQ?=
 =?utf-8?B?QU5ML2xPL3BzMmN4VVVueGpNUDk4RG1YZDMydEt6TTNzcmhLMkQzd0FoSlc3?=
 =?utf-8?B?Zy9lYktHcHRxRDl1bDRDWHJDNms2R2NaWFNNd0JYN3dVSVJrd3NYc3RlS3RJ?=
 =?utf-8?B?TkovSUlrL2VQNGZPeXlzSHJNaGxOWUpVUGxaS3hLc0k2UGduMEdvSHdkdkNv?=
 =?utf-8?B?dE51TGxUL0N5Q2ZRRXpqbU9TUjIvUVYvVTRWdUkyVUVIK1d1VkpaMmdHckhD?=
 =?utf-8?B?RWg4L00rbWFnenNXOWltUHV2UjNKc0FDNEtIY2FCajBqa2liSkhNdzNjRVc0?=
 =?utf-8?B?Q2dqcktBZlpBVzZ0NWVqaE1rTFRKK0l0aTRRVHlhVkZhRGIxTkFwU29BWDFz?=
 =?utf-8?B?SDh4MjRTV0M0WkxGeVhXRG5iVDZNcVdxaTRIRWFUZ2d6UFFBdm5JaHQwOFBw?=
 =?utf-8?B?RytwL3ZCcVJVSkFMaUhSa3gvTDMzcWhXN3EvS0N0aGhoKzVMdFA4Y1BPbWFs?=
 =?utf-8?B?Q0dzY0h4ejY2UCtHa2dPeFlyVjJaV1paODB6U2dqTVNuUGIvUFZrWTVVVjEx?=
 =?utf-8?B?eDFWanBHOEUzUFJSRTFsdUFVamhhUmJZcUI3YmtxazVqRjQzd1pmOXoyaFd4?=
 =?utf-8?B?N1d6ZXlVOTRtT3AxNVVGdEdDYWdxeXFTOVErMnd0WE9zSjNJZi9UT01mWms1?=
 =?utf-8?B?UVJpcGs0OSt0MS96UzlJRHkrLzlsQm5rRXFDQmpHWllWd0FtQ0hVR0Ixd3Fk?=
 =?utf-8?B?RGtSMXErVmloeFRwOUJIaC9sbzlXT0tUNnpFUXRtaS9jRFlNVDJqSHordG9T?=
 =?utf-8?B?ZWxENkJFTVRlQnVVRnJTZ243RDlpam1aRGYvck85aDFrQ1ZzWWhNYmY0MzV2?=
 =?utf-8?B?M09TSSs0TTUvemw2bW9zeWg3b0dDelJhV1hoZUxjcDRiS0xRT1JVOVphc0RC?=
 =?utf-8?B?RXNkNS9kV3JFazBYSDIxQXpTcE9mS2NEbGY4MmRTME9wbTk0U0FVOHZLV3Fr?=
 =?utf-8?B?NmdtT05YL0dnT1A0d2VGUUgrK0lWREhnNC9ZZUNPRTVPVnh5K3lXL3lycDFX?=
 =?utf-8?B?alFsMU43Y2FRUXhJVGdoYXZaUUpLZS9iRTlKT2RHRGdDa2RkOUlWNEFzd2do?=
 =?utf-8?B?RjRWS2p0RXZWaUlqV2VkUUlBdHZvY2tGQisrYWMxblpGRkxIZnpCVjFDdGhi?=
 =?utf-8?B?ZUJJMkF5bzFlV2lUVUhQYXlIUnBYdGlVYnFsQW00cDNmMFU0VE1jdlZWM0d1?=
 =?utf-8?B?cGxxVm8zNTA3YVljVGU5UW03UDU1a2FBUTNhYUhoaGNhT1REUm9EUVEzZVFE?=
 =?utf-8?B?Skc5TzNaYmVJV0VwVG0rY3BOS1pPak5XZ014bzV0SHFuZ21USFVESmFhYmhX?=
 =?utf-8?B?ZytnU2VLRk0vSGFQUTVjR0FQdjh2YlNvcWtWM1RtdW5yRnRmV3hudkx5Nk9o?=
 =?utf-8?B?dDNvdWsvdDkwVlhjME9SWlcyNGpZeHFzTkpLZDBJandlczNmNDl3Y3pzQjNl?=
 =?utf-8?B?enVFS0NpSVFpV1VKbzh0K2hjZ0RmZllVcHgxbkVoWjIwcmhiUDJMZWJvUEpl?=
 =?utf-8?B?eHB1dERDZlNsVk1NVGxOYnZUb1IxY0RDcWlQZ0tkNUd5TnVhaWdXS2dENHd3?=
 =?utf-8?B?TjliRFRYQm9Dd0EwYWtoalprVk5TUVNoOUFKRlJrVlRVK00wclhBSGw4dUpX?=
 =?utf-8?B?RWExK1NsSnFBUnBINTNibnRMWnZLcVB0aFZmQWxBN3NlQzhnMjRsTGR6dlZG?=
 =?utf-8?B?blZOcFVZS0ZpQXB1eVg1bDNmdFpmUjVWQkpZMCtTdlYzTDU3TmRpNjlHOTJG?=
 =?utf-8?B?UHhVazRzYXZpWlZCMlZaOHh1NFVUSGtQbTdIRFIxS1FxWktnaDZRd3A3Mlda?=
 =?utf-8?B?bHBlMDFPK1RBTnJwR3owWGdCRUc0bDdxd2E3Q1pzVkVLK3lwaUc4YVdKSFJu?=
 =?utf-8?B?bWV6cHVKTDdQZWhMbVlpR2xYZTVSaUphMUJlWnkrT0xuZmVlU1JkUjFPckxX?=
 =?utf-8?B?OUlxd3paUFEwaGtvamw0WWVSWWtTMnVmMTJueWdLandMK1NPWGF1a3dib1I5?=
 =?utf-8?Q?nSf1R+zaHH6kD+dyryJtWeVYf?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	xZfZtcIhCZo7S4kGiLdH92r+0ZIBs6+V7w4nQtUlyn406lYuuu9tuQjKaGSg0i7YIJIlNs0Iq4MZ5J6vZUviPtdAvXF3AUoKzzYvxDpm99l82u5Ov+g6f15LYvy9tI9/pJVDyd5f5TsW2twDvYmQEyNWT9i7p4JO6RbWdtGzS0jfUW4MF5WRcllEVfXr4zgLv9Lcy4q1BUxu+pl6LhduEQHA9HSyIlBdT20tsHVqEy7jAdBweHTXy+fQW3o3GM1T6tGXmru4IVZHqyLvqFpggXkuogJfdQ6Pj7t7ppfdGh8deO0+SGZ/Eor5IXMzhMrCrwy2wPxBo4DgAuhsUK5CyLvlk//zgSeMt+Izwise3mTCGObntSWhfTr5jK+OrO+iYJQzLAfi2sr/JAbaq9eVxhQK8bNb22ACrWGCodYK7XnDe7FScnLbk6mUWTByXAK2Mxw/8sxoi4u/2RZA7SF7VpU8GX7rzcEsaZ2+u7V/qnsgwPUnRCCBuj0q2+ONDzn3k51M3bti9jFJbrBQIfZnl6khCG75HWjMd09q8OcjERKajX1WYTcRP7RKeUtrfVE3RzD8lHX83oTqwv3QqTUQMVUM0gGc0N6pzst13m/0Bz0=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c14ddb7c-b830-4f5a-5716-08ddac35101d
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2025 17:50:06.2359
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rWVjyKBZsIH8PTghTBTcv/544DVQd25i1rKRy+l6Wct3DO0s2lOKjgMK9w3QJWJ088Ga68wFDiVNkSPRm3ezOQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB5997
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-15_08,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 spamscore=0
 malwarescore=0 adultscore=0 phishscore=0 suspectscore=0 mlxscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2506150132
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE1MDEzMSBTYWx0ZWRfXzJb9ViU8cp3g 1K3dmx1FjWAWm+jbnLb4W9mhkEwt8Isg6mlKFNIYbXjSUlAYxKGZZpNUKIkaUPpVWicvV85qyOI DpwVwT1LQvza7NY073IDArZPpg7dzmTuG1sQ9VHF2TwhRlH8rMVb+52sG5h5IBek6qCjDLqhxmc
 c8lr2LNA6/55G0cSb1LcyHxCmngPPMN5OSqRtq9AU0WTUxPoe1u2pjlEumTzvXh+eMGRo15nMSm Q0i+xPkT5ljrKMk8jiHcLW3+iFMa+JDqLmF4oPlnnibFD77BicnHaWtgHGWD2+CutCainWGLQ9m dsfsl7sCDr6GOHyL/Jy34EebFXbaus/bWsgdEW7DooM5xSush0I3XqyM5hmyRbVYRhSmiFjp5hQ
 yR+I/saQ5aHcQ4IC7+3WCaffTAUtdKSg8FWY0VtaCyVKv+bTVpd0HRhx+XFMdgvaheiC8clv
X-Proofpoint-GUID: fyXwA5zqTE4YaIwynpSi3iyeMPZVR331
X-Proofpoint-ORIG-GUID: fyXwA5zqTE4YaIwynpSi3iyeMPZVR331
X-Authority-Analysis: v=2.4 cv=W9c4VQWk c=1 sm=1 tr=0 ts=684f07d2 cx=c_pps a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=ITU4Bk_ZR0TggFG1Tm4A:9 a=QEXdDO2ut3YA:10

Thanks.

I'm getting to these out of order, but I figured I'd mention that I'm 
going to turn the capitalized "Test:" into "test:" for this series of 
patches to conform to the style in related patches.

On 6/13/25 10:53, Nick Alcock wrote:
> On 22 May 2025, eugene loh told this:
>
>> From: Eugene Loh <eugene.loh@oracle.com>
>>
>> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
> Reviewed-by: Nick Alcock <nick.alcock@oracle.com>
>
