Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D86F157A59
	for <dtrace@lists.linux.dev>; Mon, 16 Sep 2024 17:28:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726507720; cv=fail; b=O6ypT5G3geO4TR2vRLK7vU4fbJoX/W7O0bMhOkKimD60zsCO1Na98345xsRK+0yrPLS6QWl+jay5IJW8X//mzgbTs4JvyxvxTgNrRT04K5TXaDOInILyPBaegvGT2kDG4drHBsneCy3EJ7aQdDhTtheN3TWb4Kv2oyJ2S1qCRgg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726507720; c=relaxed/simple;
	bh=aT9pc9sNQ4rKccll80F8qgJOhC2jeR3+ZzYBwFJKd3I=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=dVymlYk4A5iwRSlAR2ea+2QFzrnwNxZiTYbWjDZB0/+dn7A6S12MbRpo8V8g8wbaEipf7rss18quCe6t180YHmVxHfMRflFefPnY4d2Apj27OnZQPR++SDKCwL5POgsLvQbS6LhRPdFahpqkdU/lFpax4yTMR8la3lICLmBy0cw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=RGe+E32l; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=OjsVwEQe; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="RGe+E32l";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="OjsVwEQe"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48GEMZgq006643
	for <dtrace@lists.linux.dev>; Mon, 16 Sep 2024 17:28:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	message-id:date:subject:to:references:from:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=
	corp-2023-11-20; bh=CxAiQomRlycb1ba66S5q7jRoACpJbD+B2oXjEocumZ8=; b=
	RGe+E32lhLKiyKGPstRhqRdM7ckbp1Xf+j/chpQh0xDB74uf65orbiremiyYBstH
	dTIH1yeYmXK13YHytiWzKX63o8/oKfKf/d17YSUy7QQipG5g/DLjIRaKm7y9OZvO
	Lhq6Fw+7Puwnz5DT4QksLvRnR0bsm10yHl1IFM92OHpN3lHrnAJiUjvbdL1gDI0s
	K2fgQAmnhVaLbfSoDrOSk87myI1otDoECjsld7tqEmzJuoUTwpEHQ4VCpSDNTGMt
	TOw5EMxNa1tEdDFPOvadCbY+7II5KsWUz+fyN34ZSyzVZvLHzZeASK9Lxqk6Zqkg
	haC9Uc9s3WRayUN7rDSZHw==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 41n3rwv0r9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 16 Sep 2024 17:28:37 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 48GGUP3S008276
	for <dtrace@lists.linux.dev>; Mon, 16 Sep 2024 17:28:36 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2168.outbound.protection.outlook.com [104.47.55.168])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 41nyfawec8-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 16 Sep 2024 17:28:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hwvX4k3/BNTs5i+pwjQAXVJajLUf+4ywwQWY3usQJipTlKZlNT3V6GbK2qS1nfE67VbnvPkk/TtXqDgYyGrdij1A7brElhIvcgGb0MsUbJANZkkyWH+kH50DtXwZe4leBEEqTIgVDboSR3ztcqb98FoeeH5LIo+wW40wxovO8Xz+SEpkKBKvEc7zraHHfmQXh6fmn2PyZy+8exKczl3EMA/QrjjLu/fUss/JvQbgV8dqGXg6G1bTKkfy4tP/Zi6g+a047I0oh0XjRiF9jkfHaU1thU0mV1XLX5HEYGc+1gFSyNoyeOWyAOefjSLNMe56hMKunEvnnV21T1MgnNfv3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CxAiQomRlycb1ba66S5q7jRoACpJbD+B2oXjEocumZ8=;
 b=m/MhRzmap+UrZ7d1UfSpJ47P39R26Gp8VLR4pK/oVpMuQYfPW2KZJYP/liMm4Sbh1HZTO4Z0aQ/xMCluekKcWW7bub1B93LWnI8zsbJRC/M2Xe/rTe0p6qnjmE+Dx2Fl0G5tVTNUvp19lZ33LByAiCQeRFb4rt4YqkLtU0coh9eBZobX2HQiwST+JrIk7pLQML1tePLFbdvlEZOT0SoBU8AL3A+rRHkHZYRqr9n1u004jkQ+thGuFp9irEQkid5LmEqZDetz1cF2tdRSvaW77T/5pYKuroebR/XPUwlUIAfCR0Sw+H+M8vKx9uKgO4l/JKx+evO5DXHzEM1EtoButA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CxAiQomRlycb1ba66S5q7jRoACpJbD+B2oXjEocumZ8=;
 b=OjsVwEQe/9J1WQYNp7zwb89d0NoaIxo83of1Rz+38/NuCex2vSlIlARI09PndyaBblgoYH8Ga6z3A5uesW83TJ91aQj6fxhFO/zVbgCJoR5sklofRQL89J5EV9XM1w9O199xP+0TXF1DN5JNGuZHQwubQjoM65W7aY6JR/yhWko=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by IA1PR10MB7336.namprd10.prod.outlook.com (2603:10b6:208:3ff::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.15; Mon, 16 Sep
 2024 17:28:34 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%3]) with mapi id 15.20.7982.012; Mon, 16 Sep 2024
 17:28:34 +0000
Message-ID: <be42b132-04ef-b6d3-7ab1-397aa66aebfe@oracle.com>
Date: Mon, 16 Sep 2024 13:28:31 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [DTrace-devel] [PATCH] Relocation processing of STBSZ in ERROR's
 get_bvar() is too early
Content-Language: en-US
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
References: <20240913233604.21269-1-eugene.loh@oracle.com>
 <ZuT6mHTMPMn2W9FH@oracle.com>
From: Eugene Loh <eugene.loh@oracle.com>
In-Reply-To: <ZuT6mHTMPMn2W9FH@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SA9P223CA0014.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:806:26::19) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|IA1PR10MB7336:EE_
X-MS-Office365-Filtering-Correlation-Id: 1068bbd7-581a-449e-dd05-08dcd674fdab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?S2p5a0JFSzc3THIvMzBuVVRtK0VMT09RQ25Hc3pKUVB1VWVRakVIZmxDT1FT?=
 =?utf-8?B?VmhhL2VEUkpqUWg2bENjRWViSVZ4clllT0FkZDl5aUJ0Tjk5R3MrK3lOWEZO?=
 =?utf-8?B?TUtCdzRBL1hIaUI4Szltc2U4cTNkZXVNbWtMVWV3NjFwOFNvK0EwZkJvUUNB?=
 =?utf-8?B?YitYVXBFZlk3RWRJUGhJMzA0NTI3bHRTYW9wNGVPa2F5T3pJQjltZUk0cDFh?=
 =?utf-8?B?V0dwR1NIK2EyZ2h5MDJXNlhWcVR2OGRLdWxRcnZUK0hQZDBKblFVK1dxMHVK?=
 =?utf-8?B?N1FWZnJqLzk3SGJ4V3d6bDFZZ2pJcCtZbUpEVkdwWDc2S0I2eVBadmlUMUlq?=
 =?utf-8?B?dldtSzhCVVYrOXozVk5USWRVTWtqcVRidGpteVpuaGxXcEFPUmRaSWQrRjUw?=
 =?utf-8?B?dkYrdVM0eXFTNXpFR0d1cTRLbTR4UGNrZE9MV3kvSEhnK21XcDNIeUF2NzZG?=
 =?utf-8?B?R0k2QU4vUUFSd0hiMnp6SDE2WUpEL2FMKzlNKzhOczJWMk9NZ0ZIeDc0QWQ5?=
 =?utf-8?B?MW10N3MzZkM0RlpiMFNCTkZFQXFsQ0x3dysxaHpOT25pTWE5c3RibS9NVy94?=
 =?utf-8?B?N0pUTDVLa2lOak05UTd3Q0pVY0QvZC9BY2hTUjlUaldPc3hMNWxxNXV6bWpk?=
 =?utf-8?B?Zk5QNnBCTTlSYUJWcjB6QkhRcGM2KzE5RjlOUGpmZmR6ZkJUc0hpVDJONXpF?=
 =?utf-8?B?WEZnK05iWHhydGUwTG9NU2dVa04yYlVBdVdNOUVkQksxdmtLazU5bXFTM1Nr?=
 =?utf-8?B?UWtncldUL1hrYjN5Y3RhT1lIVEF0dlNCa2JaT2lScFFDYXpmSk5LR2E0NlhQ?=
 =?utf-8?B?STN6WlNHZFF4RW1VM0h6cXllcmg2TE9iQjl5MWhiU2FFZmNNMmU3ckNjMmxY?=
 =?utf-8?B?UmRvNDRDNG54eXRpYXl3RVQwTEhxNS9RT2NjK1FGNExsaCtHQitYMkZscjdi?=
 =?utf-8?B?dDVuMGs1cWppVE5rMjZ5eDhnTXhCc0JSL05DM3RGVVJZTnhUMHRyU2l2NkRN?=
 =?utf-8?B?S2E2eDVKaGsvYlhQMG5oZ01Qc2xKY0dWZlVmTGJZYnhBZkZYNFFJS1ZSYkF3?=
 =?utf-8?B?eldFUkQzWHVuOEI5N1VvUm5lVTc1WUZoY3kxVXVqalNMSWJoMDR3NlEvMEpD?=
 =?utf-8?B?SmpkMnB2N1JqMjNUMlBiVENoTGxMNzlvTXNVMzZpMlVqZ0RCWHFLUXlSaGlL?=
 =?utf-8?B?aWEzSmwzb05pWWQ1ampLQmdxaXMwdFc5anBYYXNmK1dpLy9GQ0ZUMTVSam8y?=
 =?utf-8?B?aHZDT3JIRUlDWXFQNzlRNHdYTlR6VC9tK0Z1SUtpV1NZaUdGTHZwNEI3UmR0?=
 =?utf-8?B?eDFkYlpaR3dlVlhrRDNEakJHeXBMQ1lZY1hLb1NScGlqblpuQUttTHNBbkN2?=
 =?utf-8?B?ekFzY3NiaWxJSmo4SFVHb0UwZmZ6NnloZXV4NXNmS3NwTXhKK1lPQ2xaR2My?=
 =?utf-8?B?UGJlVTlCUTBqNmdTeG53cFJiNDMvNXhZOFB4TjQzaXl1VStlRzd6NlFMRE1I?=
 =?utf-8?B?SlJQdkJlYmVmM1dNdncvaXhHT1BEY21URHdGWTNzUWswMDF0TGo0L3VRSXlx?=
 =?utf-8?B?aGRmWnhiZkNHRGo5N1NieGJMTVJUTytQRlo4dmV2SjZxMnphL0J6Yktod2NX?=
 =?utf-8?B?VkNQNGVsNlRrcHlNSXBaSUVpa3pKck1LTWFEKzZENy9BR3MxTG14VzE1TzdQ?=
 =?utf-8?B?QnB5bVhXUFhNQU96MW1aOWwrd3lsejhQUCtFZ3lzbVkvT1d6emVGWGRzY1JK?=
 =?utf-8?B?SGJnSVBRZnA4QTN6UVpGNXkrd2tWODJKTkN1WG5uZG1uM1d0YzVad0V1RHdI?=
 =?utf-8?B?dDVKVHpSQUJBTEtFaS9JUT09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eU56SDd6WkpBUndBUThidENZTHg1TGZqb2RaYXg1cUhKRGZCODltQlBLNlRp?=
 =?utf-8?B?QWJIN01CQndNYlZWV3BOQ2puWmtyRHdlMVpNbXY2akt2NkNZY1h3N0JzVDYx?=
 =?utf-8?B?Yk41T2hHWTh5dVpZSGc0cC9MOTZBTE5MVGYxd1VqUnhxVW5iYXBwUlJyeFY4?=
 =?utf-8?B?TEYyVVFBbXJPSDNzelVPQm5kaVNBMjJKWWlDbFNja1RuZmtXZFRpK2gxcUdR?=
 =?utf-8?B?cnNLS3dXTyswbVpGcEhicVR4Qm0zNUZ6VHpVRkpVOTJQODZOTXk3VEdRUHVo?=
 =?utf-8?B?VWpVRzh6SzFsNUUwVlBjVnhLRXdEZ0hrMXkwdDV5ZXpFVE5nSmhXVHNCL2Rl?=
 =?utf-8?B?K0hWS3hQYzFieXd2SjBiakduYWlEU0RUNGxZQ1dKdm5UVU80R0h4R3B6ZFo0?=
 =?utf-8?B?WENKUWtQRDMvYjUwT0lNTisxUzFOVVg1SkFqL0dRTm5wQVQzdXNZU3MxYjk5?=
 =?utf-8?B?SkQ0dTdmejk0VDVnSEsrRzA4c0ZSenlLdG1pN3NVbDRGek5EK0J5bEJNUWw4?=
 =?utf-8?B?SVVSazZtMXFTR1V1R2kxN1ZQcGdsQkdkRTZjbC9aWXN1emNCZGZ6L2hKdFEy?=
 =?utf-8?B?MGFDaUc0L3cvTTdJS0s3NVB0RjlCT2hvRnBoUjZ6ZTZKeXN2Y3lQYzA2QklL?=
 =?utf-8?B?N2FCbmRuenQ3M1F6T0gvU3JvRWVxTTlFSjllMWJpbmkyZWlYRGdJSGoxWEhS?=
 =?utf-8?B?UFYzelF3NjNXUnRUVTFScHprR1JqM0kyeEhhMklCT3RNQi94ZEN5Q3UyWkVN?=
 =?utf-8?B?M1Mrc3hDUFQvckF0Q09GMklOL2RzQnZybmxzNXNZa2FoR09GYzRieE9GcU1x?=
 =?utf-8?B?aVhNdW5NbFRmNmE0cDFLeTd6Y3J6c2lJRi9kRmJNMUt4NHR3QjRGSnVtT3pD?=
 =?utf-8?B?ZjJpQ2JjZTRRSFBHOENWWnVSQVRiclR0d3Z0VzdkckpwaHpleEhzakJDY1RV?=
 =?utf-8?B?c2g3Y2FkcStBRnIza3dzRSt5dUhsYUVId1ZjeFR3VkFITWR2K2xINVlLUGJO?=
 =?utf-8?B?b0plTkRhNnd6YUUzNjVwb2ZlQ1h3R3BFcVVCZU03K0ptak9wV0FhSzhFZER1?=
 =?utf-8?B?QXNLdW1Fdlo5ZDJzSm9qK1NscFY4a2VCejhBLzFBU1dqSTFpOWU4NFRXaG9C?=
 =?utf-8?B?cFdIYTNwdHZ0T3BwTWtqSGZuS0ZDcXN5QjYzWnhBcDBBQWZXNVNFR3Q5VDhO?=
 =?utf-8?B?blZEbFVkMUJkbkR4eWc4eGdYdkxYdTNyQ2hoelJZUXdoOVAvV2p4TDU2Z1dR?=
 =?utf-8?B?a1V1S2QxR1hyTU1NUDRvcDl3RDdlRkZCNnJiYUpqUG00NW43K0VZMGxNV2p1?=
 =?utf-8?B?OXNhTE5ndWk2SVRDb1ZCaEpKUldlVzRtMC9wZU0wWlQxRGd6OVBabjJCRXRo?=
 =?utf-8?B?YjhDczI0c3VORlZROXlhbEU2K2xOem0xNHZJOUJUNDkyMzZkU2diRlNrcFcy?=
 =?utf-8?B?aXhIZE83SHlWZWpzNVEvOUpseDFrTkFHY3l5OEU1OXVLS05MWUZGQk9hS0Nq?=
 =?utf-8?B?ZkdCMVJpMEVaNFVOaUxIZ2tYT0w2THZSR09ESWY1dWlVWU1FdnlhUTVZU0pk?=
 =?utf-8?B?cG5wY0JtaC9SRVF5dlk2NkxUN1BscXNRcHpLSUJURWxMRlU0aFNnWTlWdTA4?=
 =?utf-8?B?NHMwclRuNWI4U1dmMzJqNHJzZFdPeUdsUXcrVlIzb3g5UGRzUWlyRWlZdm9t?=
 =?utf-8?B?YTZOb2dJWkRJYjZ6anY5SzlNOERDT0U4aXNHUnJ5eWhyK3U1Mmp4V2dxd3Ex?=
 =?utf-8?B?L3pvTElneWZ6UU1RTGhNNkplS2d2L3MwUk5ueXdsbXo0OHp5MGYvVXUyYm50?=
 =?utf-8?B?eUkxK3FldkI4R1FRL1VnbVFVaUx4bTZXV09FTDlIa1BmZUlJTGVUOFJBbTdO?=
 =?utf-8?B?Smw0WGp6VjVtUUFTYXRITHlndTExWCtzWnVCa1dZOWJwOGNWVlpPSDNCajNp?=
 =?utf-8?B?clA1UEVhRVBpbUdDTTFBME1SNEVuL0U2YktpMGkzWXIyQlpibU12dFczK0Rx?=
 =?utf-8?B?OWdVd2NFMkhNT1RwNUk2UlNCZSsyNVZCR29LNCt5b0VUM2hPNmlwTnhFYWpS?=
 =?utf-8?B?OTR1QVI5U2lXbGFsYklGNEJrN2Fpb3NlM2NDQ3hHdXlYVFlFSjdqbVNRelF6?=
 =?utf-8?Q?g5kwnCJB47Y/TKv0IkHmpjO5u?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	waFGmuTky6otuI07R1CFd4K00ckdLP5htMmlLfX2QKAL8//lpqN0QHHUDQiKQUZB7WDfyjk5UNFljzkJoZzryjYrJRBAtWodoCDEVyI9QLOg25kd+d4AnsQL2TSrgWLhUNEzfD0boAmWXXh3jHedCG4eL3k3KZsvjEnwrOv1rntDyzttJDMUwoipizNhZc/LjR/5LlRLRTo17DMYIwKDieE4Xw6E++ZZX2wRZUWqjGXj64IE2WAYMSJKRYJy3mMKtJJ4fexiDxpQfWURx9wBGpoYvfuesKsuYzGAddAUZDOuFbp/nrsFOA+edp0CC/qFVfALzYheNSbolOnlMZO4Ly5JWZpjepIHBK8Iz4sZ/syU+03YbxmAEkC857AhmcIC5PRNf7HXP00F215IVdfDCLg4SY+KGrOW/ONw0BU2jCFHRbPu1Hz2Hk4MBZQkG5dj7B+8jQxgG8aa/TZc7Kgi5AV5ff0wIRg9eSta/W2Tt3fPX6x8K125pL3jAydPUu3nMH557d9CBBN6coWT4kqMvITuJZsqrvrxmIbtaQI0JqkLhYWj49h3STAMc3VDCR2MRiIm1W0uPhZIw/N5HRYBF7z8FLYMZnouT5cWcISXYZ4=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1068bbd7-581a-449e-dd05-08dcd674fdab
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2024 17:28:34.2319
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fC0JK0hw9Rvg+v5drxKGJNhtsQgwkcfZA5ajloKWg20C4FzP2UpPSkCCRBHITnv7SI+cnLvjP/gpR5tPZXYP4A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB7336
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-16_13,2024-09-13_02,2024-09-02_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 mlxlogscore=999
 malwarescore=0 suspectscore=0 mlxscore=0 phishscore=0 bulkscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2408220000 definitions=main-2409160116
X-Proofpoint-GUID: 1B4g-tdVzjkLLbcsXsIwIJhgS1ihp0-I
X-Proofpoint-ORIG-GUID: 1B4g-tdVzjkLLbcsXsIwIJhgS1ihp0-I

On 9/13/24 22:53, Kris Van Hees wrote:
> I don't thibk this is the right solution.  There are other values that are
> resolved as a relocation in dt_link_construct() and that could be found in
> an ERROR clause and thus get resolved before the correct value is known.
>
> Instead, I think we need to simply move the construction of the dt_error
> program into dt_bpf_load_progs().  I should have done that when I split
> up program construction and loading into two distinct phases.
>
> I'll post an alternative patch in a moment...

Thanks.  I confess I posted this patch impatiently, with the uneasy 
suspicion that the relocation was simply being performed at the wrong time.

> On Fri, Sep 13, 2024 at 07:36:04PM -0400, eugene.loh--- via DTrace-devel wrote:
>> From: Eugene Loh <eugene.loh@oracle.com>
>>
>> When we call dtrace_go(), we do something like this:
>>
>>      dt_bpf_make_progs()
>>          dt_program_construct()        // just for ERROR
>>              dt_link()
>>                  dt_link_construct()
>>      dt_bpf_gmap_create()
>>      dt_bpf_load_progs()               // other
>>              dt_link()
>>                  dt_link_construct()
>>
>> In dt_link_construct() we dive down and find dt_get_bvar().  One of the
>> relocations is to supply the value of STBSZ.  The first dt_link() is for
>> ERROR, while the subsequent calls in dt_bpf_load_progs() are for other
>> clauses -- that is, two separate versions of dt_get_bvar() are used.
>> Meanwhile, the value of STBSZ is not set until dt_bpf_gmap_create().
>> This means that the ERROR copy of dt_get_bvar() does not have STBSZ set
>> properly. This means that if ERROR accesses probeprov or probename,
>> dt_get_bvar() returns the beginning of the string table, which is a NUL
>> terminator.
>>
>> Change dt_bpf_reloc_prog() -- which performs relocation processing for
>> BPF maps, necessarily after dt_bpf_gmap_create()! -- to check STBSZ
>> and set its value if necessary.
