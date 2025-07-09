Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F39F1801
	for <dtrace@lists.linux.dev>; Wed,  9 Jul 2025 22:39:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752100780; cv=fail; b=LZ6ecPQszAjYnhPAfC8VJey1W94BPHTZMlM1rv5Azxenf9QNTIp4iFjbHObI0a7k6oyJmk1TqVzfm/5mqFY31WK2V4a1I6qrdx60KDZdCzfVvmv8YOXnVLCaLg7Q1BEvGAO7xqEG+LqOVvdLD2Drl06ZYNAGf9Vqbzlh5M+lU/A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752100780; c=relaxed/simple;
	bh=42Fj4JX2SUFlp88sfneHnIgYA564GaZELbRY4Rby/Z4=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=IrXlUhGDcoVY5ukD094OdTPdkTnJ1o+lz04wsWNSHUOKRzGDWF3GhJuJ8nJ6zPEf6ISbkesZkSZ8TsC4isExp/diSNH5gV0zaRUM1GgXyCugXB+rG7fLy9ouXAa1cF8mFEIfzrwZoq1+H4oV6XGPodrlGQv5dJi/JgiMI8kgJFo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=QImqD/qY; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=jBrKh/rL; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="QImqD/qY";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="jBrKh/rL"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 569MKCSN025694
	for <dtrace@lists.linux.dev>; Wed, 9 Jul 2025 22:39:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=AiP9yr+ptoU0GeSxs/BMK3NjyugFgydUxx1WZnsXG2I=; b=
	QImqD/qY5gHAgyxIUxCjuDsSNY4GCk5uqcMG1bzyxzPjOHqy9j9CRyjUoaWtMWPX
	U6t/ie4b0iLptuSqPZxYGL2euevuQ8R7Q/y4DrSk2nnypZr5fCJfTq1sbdZk1zsR
	S2tqIrrwwSQp+EkgLGmqnA6gYZbu3PdXSnBIwDXsFjNSGoi4CEqv1yE+XK5MhCTK
	85+nt0VN6WdpDXwEY/+OHK5p/Ou4uXQPn/RMKFi35kpjKZADOXJL7oInyK7eWKfO
	XjCFuAEz2xL/k0P/J8aWqg35Lx4oToCG04JDABfhNhCx+JgP2nK4V7MxbfhOwqlc
	P5olnWqPXpTpp0+1Ewo8hg==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47t13xg0jk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 09 Jul 2025 22:39:37 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 569LjgZj027491
	for <dtrace@lists.linux.dev>; Wed, 9 Jul 2025 22:39:36 GMT
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazon11012034.outbound.protection.outlook.com [52.101.43.34])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 47ptgbhrr1-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 09 Jul 2025 22:39:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vsG0c7Q8vxYvKZGs2fs1pPZ8hooHCzlGa1AJlZDpy7H3mcw82H4jEHYk/4BV3tEHkw+4DTXMlR4pQsq5hpqQZfPfXxSbEvfEzAmiHCskEp6SpeZULQQzDDj3775FyoAN66UefZ/tAV/LcIjG8HM7xxBtDm5a4es+CWMxNCRLhh/GcEHH9BaHJ6IHtDoBgBac5ZGP/zmNtJvqt8an3qyh9GRvvVSVzoKmABI7RPBoK6d9A2IIo7clNiycPaQVWZlIUYfeneu8CtAYjZjC1n1V5TX/ZtVLT6lfs3ueONLjOVU8KUX13EHAyJiDNgUIUQFgHXtIwOZ1hSCPF8A/GIFiOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AiP9yr+ptoU0GeSxs/BMK3NjyugFgydUxx1WZnsXG2I=;
 b=BdYUYxcfCYQ3MFcoVazLXnlyc163ErOz40QTtAtE0AV6KRq3c5674wWjG+X1b7ldKYRkJIH9ig7Nz1bTGC19+4L3c2aBdDm2Mw98FkArVDqWQgpIEGzf96PU8lpGsadnxcL2jdM1pOaJP0OJKyRYgY3PaFVhOJDBsW4CZR2VydjSzJV6FMKIjhvXgEL4DbyW+W7SeWJUG7Jf9+8GgcVp7RIkqSBQfdQtHi1Rs8F1RqirQlxT5zIYNnVg9iOb3wSxQqmjZOinYXuEaIWVkWEbehgib0KnmSMgImnDVDl/XhSlCcWYjqWfOAeEiVxP0uhX0JqYQxIEnAd9wHZTq7HwsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AiP9yr+ptoU0GeSxs/BMK3NjyugFgydUxx1WZnsXG2I=;
 b=jBrKh/rL9KCTK9yFUnaOr4Kc+qjZ3oLY9wmU4k/ha2uefac1tqeImOD8vKl8X59qfwB5IWBf+jcN066hij4ld3g8I1bDP9i1mFBARXeMhS87E2cUUliglsWyHVMojCmxm8WfqjGPQKZme+7AUD0DH/m3cVOLMjSKxG9CG/Yg2ZU=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by DM6PR10MB4218.namprd10.prod.outlook.com (2603:10b6:5:222::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.25; Wed, 9 Jul
 2025 22:39:33 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%6]) with mapi id 15.20.8901.024; Wed, 9 Jul 2025
 22:39:33 +0000
Message-ID: <4677a328-8622-794b-5273-f0aaa6d12032@oracle.com>
Date: Wed, 9 Jul 2025 18:39:31 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH] test: Skip err.Z_no-w for now
Content-Language: en-US
To: Nick Alcock <nick.alcock@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
References: <20250708045257.13808-1-eugene.loh@oracle.com>
 <87ldoyev5f.fsf@esperi.org.uk>
From: Eugene Loh <eugene.loh@oracle.com>
In-Reply-To: <87ldoyev5f.fsf@esperi.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PH7PR13CA0007.namprd13.prod.outlook.com
 (2603:10b6:510:174::17) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|DM6PR10MB4218:EE_
X-MS-Office365-Filtering-Correlation-Id: 1f820e36-a741-4148-7cdd-08ddbf3979ab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RXhGOEphOEtMNDg1K1dCaHIzdWtZTnZJSXFlKzNDY21ndU9ZaVplb25hSHVC?=
 =?utf-8?B?eit4TTNmYTU2cmhhbGlaaHFBc2pzaWxFU011RFFpUTJFTjliaHlHVCtER3dn?=
 =?utf-8?B?ZmpHSVZzNUxkUytkNG83VG4ySmtJemU5eHhOYXNiOVJiNHBhTFBhcitLVGVl?=
 =?utf-8?B?NnlWVit2N3ZtSmFHU1lpdy9GTHNnR0Exb21yNG5KTC9WaitiOTRhOE5tRW5O?=
 =?utf-8?B?NkdtYzR3T2ZxTDNXVS9qVGhOOFlGcW5qNDhvTEt6WjZ5Z1l0ZDJuN0NWbWJa?=
 =?utf-8?B?U2wxU2REVTlKNGJyRzhNN3JTcUQ4UWNQakRGZWpuTGViMG41MlV1UnFWNVE4?=
 =?utf-8?B?Z0RuQXFUbkJmTEpaRS96MkptRXpVS2pUR2hhK0FCVXBwV0t0MkdEdi9GbWZQ?=
 =?utf-8?B?UXVSSzdEZ09lcHZWZWRCckRqbkpEanordU5PbWNnNlFwZ1cwUnVQYkNQd0xr?=
 =?utf-8?B?MExJY0ZnUWo1eW5lY2Frdm9jejArZW96MHErWEtJcEtEeWNueTNZb0JKZDNz?=
 =?utf-8?B?TFV4dTlQeXpiMmwvL1FkLzk2bjBEWjltYXNDVGJZK3JuR20zaGY0Qmlwdk1U?=
 =?utf-8?B?VjJLMWlCYitDdXplZlhlWFFnY2poZzBmaDdtblRjb0J1L0M5bytMQmhqOXVF?=
 =?utf-8?B?WUx4Y2syRkRJeGU2QnJ3eVo0UDlobGhkYWNKUHByM05wbndrNmVFeGFXNTZD?=
 =?utf-8?B?L2Rxc1JBRC9ILzZ4WDFtME5qNGQ1QVIwVk4xYUdkb1hzYUl6dEROTGFFM0Yz?=
 =?utf-8?B?c2dFQzJoWjVFQW40SlFSY2dsczNDTFNwcTZwQkNsTHRxM0FRRFQ1R0M1UVh5?=
 =?utf-8?B?Mktxbk84V2cxNC91M0RqVEVRWW4xbXRzenpsdm9TUkR5Y01rZ3NFU0hwWk5N?=
 =?utf-8?B?VVcvdzVTYmNXdk1YbEpWS1U3Y3dyMFRKcGNKZFZxN0JHSEE4SWgvNWJFUUxF?=
 =?utf-8?B?Mklzb3N2b0NJN0tibHFLcmczcU83d0k5dWxtZ2hMNThaWHV1ZUVsTkNvcStU?=
 =?utf-8?B?bXgrSTZ5SXFPVExxZEdRMWlSaksrbC8rYWRZQUlWTEpZTmVYb054OWw5RFA1?=
 =?utf-8?B?aldHYU11OHUxMzlCRlhaVEN2czN0VmZvc0ViMFpKUWlUN1dsNUgxSHFjS29t?=
 =?utf-8?B?T01mWDlBb1BRZm8reW5iNU04cVZPTzFkM2MyMGVwdGtLdUdiTTZMUmZPZHF4?=
 =?utf-8?B?aTIxK0RLLzI0OE4zN3FMSGFPbnJHOXNBQXVJZ2s1d1hpcnVJbTFHcjk3R3JX?=
 =?utf-8?B?Q0ZoSkcxU2hFdmtLemRUOU5FNW1BOE93YU50Qlg1T1ZZU1pZM0tDYjdlUVdT?=
 =?utf-8?B?eGFlaHdESVlTOUo1U2N6MEFrTHJPMWVoUUlIeTMxSzhGUzJVdkZiM3VyRkpN?=
 =?utf-8?B?TmxVTWxlWFpYbWJEVUNDNVBRUFVLUWtodEQvWVhyOW00K21uTTFhd281Mzl5?=
 =?utf-8?B?dFVTNDUyRmN6ZVlwR3plcDhjYWU2eXlpUm53c1E3UVplUHU2MTVHQUUycDcy?=
 =?utf-8?B?cUFKSmN6OTVQeFNGQjhFUUF5OE1YOWluU1hRaXBCSm9JRnhINHpGV2ZBbFlv?=
 =?utf-8?B?eVptWU5OeHlEcExmbjRjdWtTNEdXYVdyWVJ5Q2g5bThmeFBDbUt1Y25xRWRK?=
 =?utf-8?B?cVJwWjk2MXh5YWtXTlhKdEFFM0UrSVNyTEYxTmwwblJCT1ZZTHByM1YzRllZ?=
 =?utf-8?B?SmM5dm1PTVV0dzJScGIxdHcwRmZRakRHOHRjVUwwQWFoN2VwL2ZHdmRZQkNt?=
 =?utf-8?B?TUQ5bUM5SmRxNERQbk85VFMwSGRYcWRxOW10L2FTYjF0U09CRHFZUHltZjZR?=
 =?utf-8?B?SnQycjFQeUpxRnhHYktTVWtTeG1qK1A0WUxBLy9pWDlReFFMRTJrbEZudjhv?=
 =?utf-8?B?K3V5MUE1VTVKK3p3cFR5NDFHa1Bvb2lxSnEzZzR6TFBRdTlPOXQxdG1iVjN4?=
 =?utf-8?Q?anQsiuiWIUA=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ak4wQW0vQitJMDBGMFdCR0ZCVXR5QlEyMS9CTTY2a0crREtPSDVLZkpsU1U3?=
 =?utf-8?B?dmVPT2xXM1d1aWQvaTNndHBNZFpwMjZwZm5aY1lyNmg0R1c1bWFJa1UyUFJR?=
 =?utf-8?B?bit6cWlpampaNE1VWEJNUTNIS2RvWlppeGdHQWFkM2ZVTGxKYmVGdzBpU0Vh?=
 =?utf-8?B?Mmh6RGx4RTI3ZlZLaVRhUTFvYlRvaWhZeFVIMnNwQUUvdFZ4RGlOWHB0RmFV?=
 =?utf-8?B?SVY3UjJubkgzN1Jrc2RwN2kvZ0phZnUyZ21FeURMdkUxVnJZS2Fzc2NwWkZs?=
 =?utf-8?B?VUg3RHNFeDF3WWFrK3k4U011QXFBL0Z3ZDdURkFRMFlKdENLV2FUelhyVEdr?=
 =?utf-8?B?TnpKNlQvZGpqRnJGcG8rSzdZcUpraGxKcE9ESXB6ZnkvOVdSSUFGK3B1UTll?=
 =?utf-8?B?M3k5SDNNS1RNYVhDMml2MHZPS1Z6Q3VpN0pJODhqaWY3U3plZWFlMW1PcHJZ?=
 =?utf-8?B?OEZRVHRuZGRpZUs5MFo2eXZFWXREc2p5L2M3Z2taVlc0MXBCTXZ3dmNRdG80?=
 =?utf-8?B?WlRoZllzQ1UvbXhkdWdIc2xKZTl5aWhzbVloeTE4Y2NvQm9MQ1NSNEU1MzdS?=
 =?utf-8?B?VkM4NXlSc0hkMTRlK0NsSHFOd1NiUXE2b3ZSZWplT2ZhR1VaTkhSV21TZEVQ?=
 =?utf-8?B?TEl0YTNTMFh0Tkd5bjd1M2d3b0cvaW9tUCtXbnZ4b2hwMzg1dWEwTHRGd3hr?=
 =?utf-8?B?cjEwNFk2c1FiUVZNL2d1QzJYWW44SGZsWXd4enR4YnlRTEUyK0IxTlcvaFdv?=
 =?utf-8?B?NGVDN21wVUgxRUV0MlFaa1Y2ZXVrazUzZ0FzcEozd3NJR2piVjlkREtPVjRj?=
 =?utf-8?B?bWhCa2tWNFhvOGtWRGxZOVlyQWJRSTN1TFZtbTM3VW9JcmdhemlEY3ptVmo3?=
 =?utf-8?B?Z21GbVJsTXV6WlNNbzNHMUVnN3lNelVlR2Nua1YxSlYreVp0RGVWSEhaQlBk?=
 =?utf-8?B?MXVrWDRZdi9Jd1JYSzN1bFdrUXB1azNab3VkZVhaallMSFZzMWVUdFpuRGlv?=
 =?utf-8?B?RGd0OU1EK090OUdhaEp6K3JRYmUzNXRqZTlOSlFBeEJOSDRla01nV1E3dGNk?=
 =?utf-8?B?cFJ2SXB5UkxNRDRJMHF1Slh6Qy8zdGwvOHk2aGlKN3oxVG92WUFPZ3BJcHVG?=
 =?utf-8?B?TnZUN3cxK1NKOGxiZVlQRzZySzBnYUdpTlBSN2VBSlJqWWswOE96NmRvVTNs?=
 =?utf-8?B?bzRqK1cwcm1Gbi9STU1mTzBQVk5NaVFhdkFaZHFPK0VtSmZPaVA2bFp0Rk9L?=
 =?utf-8?B?QkhBNVlzNGpuazB6YTZYL3RpRlNZdzZsY0VyYmgxVHllbnZXa1FUS0tLajM5?=
 =?utf-8?B?SjhKbmtuTmUyaGFIMlNSVVJ2QmltN3BqVzZPd1o3S1RRbTFMNUUwTTJUbFdT?=
 =?utf-8?B?U0h4NWgyU2EvUkN5TnNITmswWFErYUpzODlZT2FIK255bTlTQlE1QkhMclJU?=
 =?utf-8?B?Z2l6cExJSHFZcERFTWEzRGc2QVR4UVZMdVdwb3JyYW9JVHcxcElRUXpMUzly?=
 =?utf-8?B?TEhzTko3S1JibEpVQ0FsM2ZZNGVqQlZhdlVMRnJyVlBHbmI5Nm5hOTZza3ll?=
 =?utf-8?B?NDYySnFGNWpWeG9kNTRlNFBVTUNHRVVqT3JqUnFDNWJaRzY3bVpuVlk3bFRq?=
 =?utf-8?B?QzBPMG5Ebm1VTnlvbW85R3FzRFhTdDhOL3JkMVNLSGszcnJlRFhQSUllalF1?=
 =?utf-8?B?cFRHdUt6MzRBOHFWVEFNUWhGSDU5ZXVoMHZ6S1lhR3pQTmNXN2ZwQjlqcmVn?=
 =?utf-8?B?bjc5SHdwRE0ySWZCMkpzMXdjSjFqaUxnZUVTTVl3M3NaemNuM2Y4ZW5oY1gw?=
 =?utf-8?B?YXpKVDV4V2ZEVG15cElGVzNveU9pKzd1TG1mSkdvS2pCcEpnRThzbTJobzVZ?=
 =?utf-8?B?VUtZdW5YUmNSNDY0K1gwV3RqQXRXcGQ3WlNESUZvaFFFTndqbUhZNkM2SHJ1?=
 =?utf-8?B?bkpTZnpmNWNlVWtvY29rakdPZGNnbTliK2hGeHAwL3hUNm5ORXkvajJOOHdI?=
 =?utf-8?B?Z25URDBBQzZVYnJadWt6S1BRVnBUS3FRbjNsTlFPeHU5ZnQ5N1NWS0R2MnJZ?=
 =?utf-8?B?L1h1N01RM29GYnUxZVJVOXZ5TjdyT0lTU3VTN1U0eDRLaXJkTXc0OEhrcXFI?=
 =?utf-8?Q?QMUVI6zA8qDa7en4EimukrxxG?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	IR5Xp4L/poFdqH0bAosGUo/u3IUvbZ09CCuFcVeHXRM3oxuTDs/c7Dt49/OVrFpjEcg+Iziq1FIY3Tk5W8Sh/AxwQ731HKjyeeTvakgWH1+sGVZnqa+XdFTFlX4MwMiWNlcQdAZp95h1oLcVGVp2ifxFPBr1msSm/ClBkML2aI+UgnWrUJY+0wJ70fMH42XMTiO4wS5ikMHDxSaVn8nU3U8pr9CdUd6lSPjp4ZNlbzPHsHn8EQIMpNZtpkKNopyaUyDOiuzG3PtSK3omRCp7ryk05xLhLpAvcIC4NP3YmdvG7dOBDiHClByi9I2ivNQGOxLVAL6cmpnkVYgTYEM0f7crTIM2SvzyaLs+SJtkd2S5WTSbGL+FWVAWApUarwxzMs1KMVU9FfRBUHi22PLhEckZJ1+U/i+b1us9Jv+fpOPH5sBsK+Uxb63f17WtoSCW/CnjSSIof3tUdbdY5FQ8wmmHzl7aiWApS0F/zCsmKvePbmLL8Bx37G/iaT+zEEhqbMOfDRYU1pwRicMO1c/akeOa5NiUTtX8+s8xlO3FnSRojtHurjx0fe15yvXtkvTX5cOC5b12rnEyPMrR8zc2PGzdGMOnvIWjjqb9AAWonn8=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f820e36-a741-4148-7cdd-08ddbf3979ab
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2025 22:39:33.3664
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3SHyu9SLJrmz5PWxmFkGooyozzQyHW/N3YRzpzjtNXYKjHFRuN+2eJFuC+bVIX3Ppx5VxOiDvqTZsY1VEICsbQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR10MB4218
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-09_05,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 malwarescore=0 adultscore=0
 suspectscore=0 phishscore=0 mlxlogscore=999 bulkscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2507090203
X-Authority-Analysis: v=2.4 cv=AcqxH2XG c=1 sm=1 tr=0 ts=686eefa9 b=1 cx=c_pps a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=WD5oWmX675oP6VEN3D0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 cc=ntf awl=host:12057
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA5MDIwMyBTYWx0ZWRfX5r8S7FMFp+1G pDE+63Fs8XOfA/IFoHPWIThivrTmW07LHO+9SXGdJXaX8j5/6b/6Xv8TIY4slRL9ThpiqLv3jNs BzJ95zL9rzJEtwYQ27ZdrBpjUhtxQ+i/1J62T8EwJB7iZIPvl84yhCaKYYMQAoFBmxPCUXMjMaJ
 Xg5Bn4NRoXmZ8ytPhv589mDuPGRhbmzlSoBeALuSWU7HVO1Y8pIoYuUUnvOX7uc3LNzQqfypV36 8Rc306eIKgots3puXogk1SyX8QXrgWS7n1tXzW9DI/7XVNydbid6A0Yk/wxlmdkidfuj74RD35V s28AAVKpIJ3t1oQMPFJDDKyc8MSvUtV6K4Wcub0pu/5WReqEaR2xgpkGKePb0FbTwWM0cQqeoWk
 Vwyp8wVQ1q6jX5Mgy8sABXRXGf1Dj9x4WAWfXUwxs425Z9dpTYGPFmPqXDZw22s6m/RbfuDR
X-Proofpoint-GUID: z48XIbMqZ8t40pLO96Gyhdqb3lHFkZ9o
X-Proofpoint-ORIG-GUID: z48XIbMqZ8t40pLO96Gyhdqb3lHFkZ9o

On 7/8/25 08:15, Nick Alcock wrote:

> From: Eugene Loh <eugene.loh@oracle.com>
>> It is unclear what behavior is desired.  For example, consider:
>>
>>       dtrace -Z -n 'BEGIN { exit(0) } foo:bar:baz:bop { raise(SIGUSR1) }'
> ... isn't the lack of semicolons here a syntax error? (Or have I been
> inserting them pointlessly all these years just because awk needs them?)

I routinely omit semicolons.  Okay since even Solaris.  E.g.,

# uname -s
SunOS
# /usr/sbin/dtrace -n 'BEGIN { printf("hello") } BEGIN { printf("world") 
} BEGIN { exit(0) }'
dtrace: description 'BEGIN ' matched 3 probes
  CPU     ID                    FUNCTION:NAME
   51      1                           :BEGIN hello
   51      1                           :BEGIN world
   51      1                           :BEGIN

>> The first probe exists.  The second one will be ignored.  Solaris will
>> reject the script with:
>>
>>       dtrace: description 'BEGIN ' matched 1 probe
>>       dtrace: could not enable tracing: Destructive actions not allowed
>>
>> On Linux, we have:
>>
>>       dtrace: description 'BEGIN ' matched 1 probe
>>       CPU     ID                    FUNCTION:NAME
>>         0      1                           :BEGIN
>>
>> Perhaps both behaviors have merit.  For now, just skip the test to
>> avoid test failures we are not ready to arbitrate.
> Does execution fail if the probe exists but there's a BEGIN that exits?
> I guess so.

Right.

> So the interesting question is: if you start with -Z and
> specify a destructive action in a nonexistent probe, and then a
> USDT-containing program starts up that provides that probe, what do we
> do? If we don't terminate, that would be surprising. If we terminate in
> the middle of execution, would that be more surprising than checking all
> bodies at startup and failing early?

I think I finally understand what's going on.  The point of this patch 
was to move on to more urgent matters, but there is maybe a bug here I 
should fix.

Solaris rejects a clause even if it's not going to be used.  E.g.,

     # dtrace -Z -n 'BEGIN { exit(0) }
         bogus:bogus:bogus:bogus { raise(SIGUSR1) }'

Solaris says:

     dtrace: description 'BEGIN ' matched 1 probe
     dtrace: could not enable tracing: Destructive actions not allowed

Nevermind we do not use the second probe description.  It's a baddie.  
Our Linux port has no such complaint.

What about the case you propose (which is, after all, the question being 
addressed by this test)?  Well, "it depends."  Put another way, we won't 
run a destructive clause without -w.  The problem is that during 
discovery, we might first encounter an is-enabled probe (which we 
"enable" since it's safe), then later encounter a real probe and reject 
it due to its destructive clause.  If you squint just right, you could 
see this as being not incorrect, but it's kind of goofy.

Ideally, enabling probes and their is-enabled probes atomically would be 
the right thing to do.  That's a tall order.

But falling back to the Solaris behavior of rejecting destructive 
clauses without -w is the right thing to do, even if we are not using 
them (yet).
