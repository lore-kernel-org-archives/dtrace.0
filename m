Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C9673D62
	for <dtrace@lists.linux.dev>; Thu, 15 Aug 2024 17:14:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723742080; cv=fail; b=OGZxUGT5VmpkVy9xONk0lzV5RW3sMaqdtFG9JhKKwju1i6XyAzo9MrZvlDcdwDPfLBL4YWErSFIqmD5DJ/KFWTIMxZD5qv49Wd8kTVU7ws0FrshlTx2qQ+dhqsURdjBWqnmNtqp25zSTZgZ/2cLhCZzWbVVe0cM0VJdbzlav5hU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723742080; c=relaxed/simple;
	bh=8os+3nn9uLwum/bhfU5z5cwwe5Kx55rCzOqPqmZPe90=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=gMOgLeSiAMe8Qb1PBih2ctRifqRObccii21d+pqKTOZQW5tMrCE0JQHAC/HdJUOZnzhwwB3CAIqo429FhHVopuwGNsMY3iT51UQwH5h1TplUzF2LtYEcFVM93HzNParUH3ZibzSVAXwyGIx+czbA1lBUCmlSORhDFRfB/BYtfNY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=FCpsocPw; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=kLCuZwd1; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="FCpsocPw";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="kLCuZwd1"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47FEtamO007723
	for <dtrace@lists.linux.dev>; Thu, 15 Aug 2024 17:14:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	message-id:date:subject:to:references:from:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=
	corp-2023-11-20; bh=2PjpzQs2tdHXYu5sK+i/7D+LagSHIsavnHuvu4qhtKo=; b=
	FCpsocPw0pOUCL0h/ryT6CEY1jClInUZfyWimST90c2W4v2SvfnM3kVWX1vBYGUY
	qcRms+C7R3GulNGOl1OlG1kldHYpqE41QXKjJWo3r5p/Idj+fUh8ZUf1PVsgjTMo
	s0BoWt91KL8yYP3tE5Cxfn2hTVcgW5eGowMJtJdZ6F4jWp9YMp6VSd2ApGeMw/RO
	q1eaqnLon9bA5ZxeIMn3SlTivoVeGpc0XYoJKYZ6AYhq3+cOUK/VUX+set6Pwoa4
	7Bj7Wtv2ktfwfrapcGKEZl1Lj+FXj8rlwCmeBCeFsUxsuVpQOj3JS2t9t8F4XkPr
	BD4nl+867Yb1s6oLVjJdNQ==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 40x039asfh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 15 Aug 2024 17:14:36 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 47FG1Gj4020763
	for <dtrace@lists.linux.dev>; Thu, 15 Aug 2024 17:14:35 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2045.outbound.protection.outlook.com [104.47.55.45])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 40wxnhw9wp-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 15 Aug 2024 17:14:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bN/efYBk9uGf2oZN92PFTIO0yUbRjYmSyEAYuO4J0nEtd5x+Nh+ChBZhVfNfCehBDunFFuqB9/00jolq3DThy+t/SRyhz0fDtlBol4GLRVuIPvC4RiuJzPIjhsyl955p/KZXeYVWG2nQKjs+d57E6tDXohYe/LCN7nmvOZlC5pdqTMbza1Cn31DQxwobFw8NcDUW77hrgV5Z0jOEv273Jl4ZzmYKhMB6z5VCIDkJT/G5ZHkpWZt6OLq123V2fszPtTr1ZVmB/9rsGJWWdSDtfutoGHNlI7Gg3iH5lK67Gt79ol7+aT++JTo9npyx0flFCZX7x6Mfmzx53UoIz2OFcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2PjpzQs2tdHXYu5sK+i/7D+LagSHIsavnHuvu4qhtKo=;
 b=OpkRGN9gbv7pyHfZP7zhDkK/6hs0bZxyS/lNjaG0fif89AnsofGbKaOXk8fcRG7hUcKfmdeKnJ+NgwnH8DKvmBd6Tp8oi0mAvjU94EpqSHZlzyIkF8/TJRCI/mYA5fVaX5BSshVN4KARjnVh9B+Fq4MFsfqRvgJ10muFQqHRtrUAz7tuNUKM4W9g5yLVtzGNJN6NKo43sizrencMBbJsNDglctBmkpCn7JQa2zUiSKccWzydjZGrZ0Or2k/yZ12qGQ7FYXcdJCv6pQit/WWAimKcjR/onjxo5dCdfUI/V0mtE5unLKmjhEzsN/LXVhGYZuWN1OAzgHN5mEe307TlLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2PjpzQs2tdHXYu5sK+i/7D+LagSHIsavnHuvu4qhtKo=;
 b=kLCuZwd1bZR2gfnyR73vWXS3j5zd7OLaoMvP61cmeaUvoeF5v9xEZBQSvq0jFhegq7PjuOpzVfkIk+hr759viJk9pCTUqVeAZnlYKAsnVE2Gsx0V6AegXJJ0Cq6NxWRTyKmYKoq3thsfm4hETnDVA2hwN13lXvCCIyph/MB3G0E=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by PH0PR10MB4807.namprd10.prod.outlook.com (2603:10b6:510:3f::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.10; Thu, 15 Aug
 2024 17:14:29 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%3]) with mapi id 15.20.7875.016; Thu, 15 Aug 2024
 17:14:29 +0000
Message-ID: <ed483f7b-8300-326a-bd11-f719aa5f10e2@oracle.com>
Date: Thu, 15 Aug 2024 13:14:27 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH] Action clear() should clear only one aggregation
Content-Language: en-US
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
References: <20240814025925.25408-1-eugene.loh@oracle.com>
 <ZrzT9mvBboADVnsE@oracle.com>
 <f4c37d36-5a0f-17a7-19d3-37afb41a331e@oracle.com>
 <Zr0vcu6DN8ucMO95@oracle.com>
 <86e50ca0-e881-9fdf-e098-027d5da2d1a5@oracle.com>
 <Zr1UfNh6dvi7V4XU@oracle.com>
From: Eugene Loh <eugene.loh@oracle.com>
In-Reply-To: <Zr1UfNh6dvi7V4XU@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR03CA0028.namprd03.prod.outlook.com
 (2603:10b6:a03:33a::33) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|PH0PR10MB4807:EE_
X-MS-Office365-Filtering-Correlation-Id: 7a445fa0-1aa5-4189-d337-08dcbd4db8e9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?V1FGRnMvNjl6eVNVRnlIMmhmZ0psNCtseEhpU3IzTmt6SUdwWHdMVk5icmlr?=
 =?utf-8?B?akV4bDJadzdBMU9uMVF6QzhvbjdBQkY5ZWNVeU9BVmUxd01LcitmTVdDWGpx?=
 =?utf-8?B?RmxaWkY5RHI3ZzFIVnBvREd6SEtQRlByU0pqdkNlVXNKY0VHSzZZT3g2UFRH?=
 =?utf-8?B?RSt2czFDMnlGRjFCMlBJcGt1VHR4dVlQS3ZYMzg1R1RJdS84bzZBRDc1S3F1?=
 =?utf-8?B?aktFRHNLcTd5SU9veVliZVZ0MHd1UFJucmgyMUNDdkQwY0VNT2o3UzhPaU5W?=
 =?utf-8?B?VW5LeHBHQkl3RDcyR21TS3d2eXRVMkJSQjZqMmpSejlRUlNsaWs2SW5WQnFo?=
 =?utf-8?B?SzladTBmMFFCUDFGai9BeFdJVml4L0FmUWJuM2kwVExsaktrQ0lIZFJaek0y?=
 =?utf-8?B?RWNaZTNUbkgvbGg0RG5MUjFhTDY5WGNLbzlkS0k0WFZrbUpqYU1HTHFmMXIw?=
 =?utf-8?B?VmJqVlBMZHBQOFN4Qnl5SHh5L2c2ZHprTlhIaW55VFV4a3Q1ZFNNUGFkM2pN?=
 =?utf-8?B?OTJTNmJUU0JCaWdsT0lIZ1RUSDhsMDFIU2lNY2Uyd2lYRVdiaTI0TkRKZVl0?=
 =?utf-8?B?KzYxNGV6NWtDcUcwQkZBak40VWtnWFh1QmZKaUwzcHVOSVZUZ09EOGl3M21X?=
 =?utf-8?B?dHk2bnlJYmtFdzNrSUxBTGE1RFNnL2M5anJwNFhCbUo3aG1tTUE1K0QxWWJy?=
 =?utf-8?B?UmVVZE9MeDllRnRjWXo4eWpMWTBPZVNCVFlyYWdEZEY2MUFqZU1pSXczckZp?=
 =?utf-8?B?Z053dDkxRG5ZVjFubS80S09UT1VMZHlUbFZzb0lBSm4zamZtYlUwNnhmMVFJ?=
 =?utf-8?B?VHFNRkxydjdrRlZXMXUxU2gyekVyWU1aWm9zeDNoWkVrK3F6Ti9abGtmU2th?=
 =?utf-8?B?Wi9DWlFlanVxTVZ2cVNvVldqNWZVOHkwVjRmMHdQUlNrdFdCa0VqYkNvVE56?=
 =?utf-8?B?Y1MwZlpMbC9Waml4MWVyTXphRHQydXkwbERNY2puZHJ5UHZZZjhmbk1waFdD?=
 =?utf-8?B?M2N5Q0NCNEFIVlBXWFZheE5XYk13SmFVb2JoMmZ6b3B0MVZ1aFlmSlJRaWU4?=
 =?utf-8?B?TXRDWWpCeEVabTBFczlCdjcvcElGb1hlMXlTL2ZVcTRKV01iNWZ1enA3UGVB?=
 =?utf-8?B?UXcrYU1QTzllNXVlU1czOC9lMU5sWFBqaVExOTFMWXlxY3NOR0E2aXoyemRk?=
 =?utf-8?B?eTZ3WGZodE9qZHdHTGhHMWdCUGNWREVRNlJJSUhQSFlYY2ZlcUFLRk5DaWhw?=
 =?utf-8?B?N2dUUlBkUWFMMXNHWlVzaDR2TFdhWWlLMU1Wa1FTNUpCdjJQdU1XWUk2SFk3?=
 =?utf-8?B?b3k2ZWVXZXROZ21rN1ZoRlhwQVZvRitNMXRsb3NrNDVaZHIxQzNJVEVDa1lZ?=
 =?utf-8?B?NzJ2N3drdERUc2Fuc0JtcXVxcklvMm4zK282MXB6VEdVbUZTYTZJN1dDdU1Y?=
 =?utf-8?B?MUNvZUd2amxUQlBWdXkzbmkyak9lcTNHY2ZnZkxMb1gvQ2hFWnN4SktZQS9S?=
 =?utf-8?B?cG1pSlJxRzVWaTN3STV3QThKNnJnV2hqWWpYaUM2a0lDZTFHbHlwdDBYNkUz?=
 =?utf-8?B?VldHUmpqdnJ2d3FIc295NjNNYzBxSmFZUFRIWnlTdzZJNlg5OXpDVGRYNGlC?=
 =?utf-8?B?VHhzdisvVHlQaHlqR2piK2d0cUpaWlhCNDdDQ1FUbzlIMDlHQU1kSHZGbWU5?=
 =?utf-8?B?bDJqVW1SaVhHZm0wdGREOFVyVmFldVRCUTBldGVMZk0waXRIT0NWbi9PbnVZ?=
 =?utf-8?B?Y0tPVXk2MitmYVFSblRwY1dxRVJONko2SEk0OGUxd1RwQzg0V0dXaUYva1c1?=
 =?utf-8?B?RmFZcldQTG5QZzJsbnhZUT09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QVZVckFuLzZpakt0dVJGSEloUlFTb0xLYi9ZYkl0aCtEL0VrdGFiMzlNVTFV?=
 =?utf-8?B?bXpGTHRRTzRQZnI3eHRBZjFjdk9kYWFTOHV2N0xReUpOVFA5ME9BMzhsUjF4?=
 =?utf-8?B?NzlXczhkWW1Dd1ExdXQxYk01cGFQUkhGNUhjVzhVZWMwdVRmNlppOWdwdVhM?=
 =?utf-8?B?QkFLdGxmTWNDSWhXV1dNK1ZOa1l5ZW4ycm1aMHhGSk9qMEllTE0zVXRwUnJt?=
 =?utf-8?B?MTJkZW1pcDVrUHZ1Q2dJMEJEWVVlQXM5a0lYT25NNmtJUFNJRVRIMlBZRzk5?=
 =?utf-8?B?ZlJMYml1VWlWdndqaFlaTitzbGM5MmJHNEthMlQzclN1bnhvYmIwdTJodTBD?=
 =?utf-8?B?eGpZMlMrbFhDeUx3UGpRVXR6ME5vc1ZNSzdKRDcrN0hZN09FRFVlZUxQbVZV?=
 =?utf-8?B?U1VpWmRhazlJazhKQklLK3lsaGNKNUY4anAyWGpFYjRZNk9VMUIzTmxhdXZK?=
 =?utf-8?B?RkY1Qi9rdjIvWEd0eEFneE50TTQ1MlBYUkZMRWpNNktNaVZPbnUyQ0p0WE5y?=
 =?utf-8?B?ZGIzVitpV3FKRm5LcFRLQ3Y2MG5sRjMvdEtZNjR6M3FtVWMvc004SjR2bEcz?=
 =?utf-8?B?cG1TT3piMWlJY1lXdG04Yk9EWlJLM29RYzF3aDhPdHN2U2ZhREFrOEVVT3U4?=
 =?utf-8?B?WkdXNkxnKzFzVjRnMGFWWEgrM1hBaGFjMy9aQ09DTTJ0MmNEQ1hVL214eWQw?=
 =?utf-8?B?UFdEczB5bG9XSGlrV1NRQTRYVjN5Rm5jYmVnTE84cnpQTGdwU2Nxd2NVUE5S?=
 =?utf-8?B?NU8yZU0xODgwMldwV1M0WEFHMFVjNkVkUXFxOUxZcmF5dkNEdlBkRXhCaFU5?=
 =?utf-8?B?Z3hyNkgyTHk3SUxTdkJpaFhTaC8rRU1IRXZFbXF1YUhqdEUyWEtUOXFJZkNr?=
 =?utf-8?B?cHJNRW9GcWNKQjNBQW1XdWJGR0plcTJaa1ZpMWM5UE1xVFRCQzdoc2JiNUNu?=
 =?utf-8?B?QVFtdW5KVmdFMEZEZnZxdWtyU1ZhRmpUQTQ4NmRnRGRxbHJGNjdnWFpEbUkx?=
 =?utf-8?B?cHNVTkZ6T1RWdlJnekhMZkV3NDRQb1NOd0VlVjVqbHp0S1NJSmc1SnZTL0NK?=
 =?utf-8?B?citSeDduTlFuY2E3UElwNkliNnRUeXFrNnBKelE3QTZSYkR3R0UvREYxVFNh?=
 =?utf-8?B?Y3Z5aWpxMFA0TzNIdkxVb3F6bU91OWVKNnZJQnpaSzM0MVF5dnRMcXN1aG5I?=
 =?utf-8?B?ZGYxU2p2MlJxSnNaMVZlQ2xOeUU1WnVXZkROc0dFV3JSTVA2MDNnTDE0MnMw?=
 =?utf-8?B?UjNXd1IxRkowT2o4bHY4N21vTXkrWmJFZTVyY1pQSFc3eUhESnFlK2tmdjhO?=
 =?utf-8?B?WkxXbFkzY3c2TjlZaXM4V3FuaVRiMjhtOGxJZEFRUCsyZTc0K1VEYkZyQVRK?=
 =?utf-8?B?UEZKM2lUMCsxZWlxSmQxVCtZNGdiemNtV1EzMzN3OEJnLzJaeUVhbkRZeC9L?=
 =?utf-8?B?VmRud2VNakl1VnNTYm8zZjF1Nm4yRVUxN3dLWi9rZnk5YWhVUWV1dXVQanZM?=
 =?utf-8?B?Tmc2NElkc09ObjNXTmU1emlaU0M3cXlQK3FXR3pMNS94TVhXRi95T2FSMmZM?=
 =?utf-8?B?cE1BaDJ6bytYRzlDT0V5enpqT0hBbHc2K2dJSmpqaDE2dGJvd21SejZTeFhs?=
 =?utf-8?B?ME9xVmpRSzBjajMzdk8yeFdWMVZ0MnBiRXJZWFBzVnd3ZXFobVlvMDhGUHRE?=
 =?utf-8?B?WlRBc3RzaGoyRExrN3JLLzJtcmppRDNIdnB1NU9mQng1bWpINWJrb3FNclN6?=
 =?utf-8?B?aG5TMHo5Wm1tbGVwTXpJQW1IL1ZNYk5KbXVPQkk0L0tjMkVJV0M2bFNuY1BK?=
 =?utf-8?B?VHhlTDZIQ2dza1V4WE0raDBZWE1vam9ydlp2QUdUS1JlMGJtcGZXcVBtSDkw?=
 =?utf-8?B?NW9hWEUvUi8rcXYwczR2Y0xobXNVbXU2RERVT0xBT2NodlNIZ2FVMDkxd1dR?=
 =?utf-8?B?T2NLK0FUODViTGxXcXR2VXR6bFZXdUFMREViQzhSWC9pQWo5Sm9tU1dZclox?=
 =?utf-8?B?QXpNZjljUUNBdHRaeFgvTlhSbEFOVFpITTdoNCtqNm9IV2tadHF6eS95ejE1?=
 =?utf-8?B?Rjg4cHRsU2VwTmhyVFNFcHJINzA5T09vVlRpMm83NmVSMlZQZ0lJTnh1Qkls?=
 =?utf-8?Q?hniD2GstlQ8fJlG6jOqpSt66R?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	Od1TAEBaM/mPkGXa7b5FvpY78YLraoXpVtp2oTS5YDknFC+0FQ2Ltp2q1lqybfpUeTbLohKfvjQG/tHm6wx41eJm7Nq5pzK4FNxOdZHV9eshz/iioDjy2JnPxZQeMBJI4yXSNvuY9Voap5kJVcCfWIfnZ7eWpMMath1kbOlo+t/y2zA8fjuKaXrZuZA7QCtbSiiehLk8RhoK5nlYUyPzWaeFkDm9TTmDJRXfZvGwWPDUh5D21+DRsJvhTNN8brhYPiM7SOu6gV+0lGzwL/1o9ScuIdojmDZp7bx5sXstOMg2rSxDLe3LP5tX84Mjs5/hHWCxr4SNiZlQcNF1HCKImi5RYPf1SBUqQ0yFCNfXIlmrNwAfLr40eOMw2C1/UBdZrIWGej6CULF2Xz6OWL/ncRt9w8uR1fbe/ovw6IXy58oo+u5nShOxuRx4aLzo2inH419L6IKQxufi3hBQBjsYpLNJyORtPNsJuZSksmZJQT5O7rVeZq5cu1oeuiyfNLwc94Uj4Tc6bYHFnajblQph+cacDk67ROMdmPzuT/kZnLsVeiBxpa7S5oM0UshyxGWKZAmS9WsfPfiKVrgRsosAyaFr206+qLkKs++L67RkXhE=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a445fa0-1aa5-4189-d337-08dcbd4db8e9
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2024 17:14:29.3698
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w7wNgqTkv2j2xdnsBj3HRJpfLyJ01iIhtQ0Ucs9iqlV+mz1GpoCp+8VboPqCB57mloaRhXvAnRzlJWOMHGLq2A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB4807
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-15_10,2024-08-15_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 mlxscore=0 bulkscore=0
 phishscore=0 malwarescore=0 suspectscore=0 spamscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2407110000
 definitions=main-2408150125
X-Proofpoint-ORIG-GUID: DPN9fUSnN2D2BTSw9TPwjaKmRigV0nEg
X-Proofpoint-GUID: DPN9fUSnN2D2BTSw9TPwjaKmRigV0nEg

On 8/14/24 21:06, Kris Van Hees wrote:

> On Wed, Aug 14, 2024 at 07:05:44PM -0400, Eugene Loh wrote:
>> On 8/14/24 18:28, Kris Van Hees wrote:
>>> given that dtrace_aggregate_walk() is an API function that is exported
>>> by libdtrace, we should not change it.
>>>
>>> So, I'd propose that instead of introducing a new function, we can make use
>>> of the existing dtrace_aggregate_walk() by passing both dtp and the aid as an
>>> arg struct.  E.g.
>>>
>>> typedef struct dt_clear_arg {
>>> 	dtrace_hdl_t	*dtp;
>>> 	dtrace_aggid_t	aid;
>>> } dt_clear_arg_t;
>> Hmm.  Then both dt_consume.c and dt_aggregate.c need to know about this new
>> struct.  So, copy it to both files?  Introduce a new dt_aggregate.h?  Ick.
> It would be appropriate to add it to dt_aggregate.h because it is a struct that
> defines the callback argument.  There is enough precedent for that - in fact,
> it is the way this is typically done.
>
>> Maybe the thing to do is use dtrace_aggregate_walk() with a callback in
>> dt_consume.c.  The callback can filter on the agg id and call
>> dt_aggregate_clear_one() accordingly... I *think* that works.  Let me know
>> if you're on board with this approach.
> I think I'd rather see the dt_clear_arg_t thing.  I don't think a callback in
> dt_consume.c would work without this struct argument because you still would
> not be able to get both dtp and aid passed to that callback.

My point was not to avoid the struct arg, but only that by putting the 
callback in dt_consume.c the struct declaration could be in dt_consume.c 
instead of introducing a new file dt_aggregate.h. Anyhow, v2 of the 
patch coming up with a new dt_aggregate.h file.
