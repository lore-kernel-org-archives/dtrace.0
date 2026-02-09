Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FCD840FD84
	for <dtrace@lists.linux.dev>; Mon,  9 Feb 2026 19:13:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770664430; cv=fail; b=TwZdfVN3PsN8YkJe3adAqvE0v4O6FS0x3Y8RNWlqruFl9Nagfst3cxEWb9Ftf0yxdFAfj27ClC3zEVUvOo9kuIQzY+GeOMwcfRi4zKJxlLEVux8qt8OBmmxLscIaA0191+l189J0zSTiJz9gsx84hOH1vQvK9VXVn7ThTrOOHkE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770664430; c=relaxed/simple;
	bh=mxq1Eh28iuhE/gYDPjaAJgO0S+2HATxE4j6tgKEEqcg=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=lBDbqP4ZFqbS8hioBB8gnhi45UvyDUk3QWZWN4zJcfqO2XHZBRxmvHw43IfOOZyG93a5MBPgOQVDzqMALI9F087w5o4/73uesMbg9bpDRSKwpRjp4ajl/npXfYFzWtq0pkLoUhXkI4sB1ql4YU0mf3l0RtBU6ZV4W4tKQwE0iSM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=gNLx6Puz; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=lvluIwd6; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="gNLx6Puz";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="lvluIwd6"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 619ECXbC1228995
	for <dtrace@lists.linux.dev>; Mon, 9 Feb 2026 19:13:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=Tu0tf0edZ4yN0FxmFbIkXxhQb8JFXCxIWjDCrHaQSVU=; b=
	gNLx6PuzmcnXHrIenmeYjG74X/td9ytgmUI68kFurv29qHryFMr4Snlmsyk0e3HX
	f1XiEHYKG1bn8+ah2eLDEQgDCzzXzovzfc1ldYYdDeZoXj3SmCtWYPy0XXvBLE5o
	ASIJpcqYBuRHmeJBnCXrwJDvJ/bfKozJ3BQUY44ksjp1PseB2H7z5EHJ0lBtJzyL
	cIshKBg1EQ8vqSbJcjGUwtM3STCoqPZjLgkXhIAtn876wZIZivlr9ktKH/M9fySJ
	c46zl52IQNyn1NksewnrQ62YyN+5bVtDTvi/8zHvfecWfRXEG0h1kpJ+MJqdx+G7
	TlnW6ueW2Ub5wsD8/3KyuA==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4c5xes2kk9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 09 Feb 2026 19:13:49 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 619HVK5l004707
	for <dtrace@lists.linux.dev>; Mon, 9 Feb 2026 19:13:48 GMT
Received: from sn4pr0501cu005.outbound.protection.outlook.com (mail-southcentralusazon11011048.outbound.protection.outlook.com [40.93.194.48])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4c7jnq7d9u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 09 Feb 2026 19:13:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xMt7hudJ9FrhoFI7xEYoJGTYZZ3M8E3O3bXzk0CDPeVirqhjczjF+6tejHAkMwCGsbN3flFodoaV0jeHgqt9PHWX0KjrSWn8uN053kJMbHfOcJWtd392Ep1cp03izagl0Ct6wojacWZq5xF615dn7Pll3EUi8mgAnoXOoWQu8NCMzew/iLp5Ccobm+IStx5/r51rD7rZHbSHuxF7yhNNwi0q4gVNgr6GhSbRlFVQcdjFUYPjSQi2dPZC+zBxXblZfsBpj6dzd5QXiTRCYqn2oNjhdAzDCQp8DnpzkUUUsxcJ6A7MpkZ9UTq5T/42lPG+TZUY0TyVdyvf/Amsq/bvlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Tu0tf0edZ4yN0FxmFbIkXxhQb8JFXCxIWjDCrHaQSVU=;
 b=Vax0nrYXrGs+SaChlG8fXQe2DjizA4EMEOHqdEdYMgYHA1jFYScR+DX66tvieNE0AfhoPbwcuIuYQ05XBIJ7beMcM3VLgogKnZXL0flsIt2ZNkaLEGnJh5CH8jpBkpDht3nCvlcgIh5gITvJncugxaTsH6Ann28ooyZjN/H1VZpmhKoOlfxZy6kX9gD7nah6nZw0+CJtCsNoF544uSbuoWyCDEYQTPqxVZeiAqguqWKzNOm1rmUa2VOIxJFkG7NFGRpcefBsmD2aonDnGAGdQsEzsFEB0lUODe0Hmibfwn7gJXJEgngqIogAXsKXgSYZ8e2CfEXPXcZCq1RvtaHCcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Tu0tf0edZ4yN0FxmFbIkXxhQb8JFXCxIWjDCrHaQSVU=;
 b=lvluIwd6ABeFneSlqO8lrLpyM1RWoqzdsi6rDgCkYKa88M7ifNj/lSaqlN17T7JmOQC5wyf5NdOM5QN8dS4pHpTYGUAz1HBrfH01pIfTsQtphcXy50QnpLXudUX3JvFUD5E5z/CxVeAiCm1WOBjbK2+NKVNa9PZidBzTzs5zkpY=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by PH0PR10MB4598.namprd10.prod.outlook.com (2603:10b6:510:34::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.19; Mon, 9 Feb
 2026 19:13:13 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b%6]) with mapi id 15.20.9587.017; Mon, 9 Feb 2026
 19:13:13 +0000
Message-ID: <624e66aa-1710-34a7-692f-b4bc6de9f72e@oracle.com>
Date: Mon, 9 Feb 2026 14:13:12 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH] test: skip when /proc/kallmodsyms is not present
Content-Language: en-US
To: Kris Van Hees <kris.van.hees@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
References: <DS0PR10MB75223D0A585D1EFA33B7C033C265A@DS0PR10MB7522.namprd10.prod.outlook.com>
 <9eec5a13-12b6-8866-a563-022bb94f40d5@oracle.com>
 <aYov1BfhUaIuEAg6@oracle.com>
From: Eugene Loh <eugene.loh@oracle.com>
In-Reply-To: <aYov1BfhUaIuEAg6@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR13CA0226.namprd13.prod.outlook.com
 (2603:10b6:a03:2c1::21) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|PH0PR10MB4598:EE_
X-MS-Office365-Filtering-Correlation-Id: 0cee51dd-b2ef-42f5-3227-08de680f458e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UnB3WWVYcHY5bEFJN1h4UStweFRyZXo1a0lDaEpTVFlLTGY5R0JaNWptVWw5?=
 =?utf-8?B?RmdRQTl1MXhMSzZyaDNuOXFGcEdiU2R2RklzSmtCSjEwMVJVdUlkY0EyM05C?=
 =?utf-8?B?b2lBYXRmcyt2UFNWVjkyRlBobEtuVkFFcnYyVnlXRGwvQmFaVWdaVWxuMGRt?=
 =?utf-8?B?emtUNXlXS1V4a3Q5OExoc1BVVklSS3N6cmRkbGNUWGVMay83a0g0STJ1Z2pS?=
 =?utf-8?B?cWZXa1VHYW5UYlcydWM4bmtaSXZjejNpWkdTN2ZOZHJ1Vmk4SU9UanJNOG1a?=
 =?utf-8?B?Y0ZiZ05QRklBMXlIZS9KUlNvMktzODNqRFo4U0YxVVhHb1JTOFQ4L3hTZVRh?=
 =?utf-8?B?OTBHcWxwaFIrTmJhOERFWXJ5QTc2TXpkSGg3c1o0YnR1a3JhempqaFpRQ1lZ?=
 =?utf-8?B?cW1rTGpqeXdBRDhXK0RtZ1lJREJkN0tLd1d0Yk5RdFNFV3ZpZUpYM0szdFR5?=
 =?utf-8?B?NjRhOVZNNjBId1RlN0o0SGg5S3ZtdXZBT2R2MmFucm1tUE10eEgyTHcyK2Zm?=
 =?utf-8?B?aXBqajNTWXZKOFVsZjZNQ3JUSW5nT2J2VmFQSzhlU1ZubnZuUXRRQUVLMEJj?=
 =?utf-8?B?cWpMaUFXMjk5NkI3V3JmODZnekdzOGtvTStkQk8vd0xVS2orZ2Nmb3BYSUFr?=
 =?utf-8?B?bDNEalJXTWw5QmJSWmFoNTJkUFFZdHVwMjJKV2pDbkhqdDU3T1NwT294Y2l5?=
 =?utf-8?B?Z3k1dVgzWCtSUEE1SmwyRHVXZ1ZtcXExbFZJMjY1NGdWYURIZ0s3eS9KQS9R?=
 =?utf-8?B?N3hab2J0U2tCL1pBR1BtRjE3VVFqemF2anJnK0dyM1F4Y20vMGxZUENNT08r?=
 =?utf-8?B?eDNwcFU2U2IvWTh1ekpvclA4blNlN2djdkltSTY2MlYvcnQ1QWlXVUZHNTgr?=
 =?utf-8?B?c1lSRTZkSjhmUHhEY2VQd1BzRm5keUdncFVkK05BOVh2YWJsblgxV0VEeGc4?=
 =?utf-8?B?WjZvODRQU2E4cnRHaU9tSDl3OUorY1p2OERHWjNRdHd4UHNaRjdoL2VDblVX?=
 =?utf-8?B?U1lBU2hna2pibjYwVkhZNU1OeHg4TlZuYVFYNityNzhrbkRwUDcwYnVDM3F4?=
 =?utf-8?B?ZGg0RGc5alppdEJhN2xzc0Q0MTJOUzRKT0lUKzhGK3FIcS9SQ2lkWTB2c3Ax?=
 =?utf-8?B?NGlRMUNzN2RkcFQ4R0hoa2hvOXB1OGtYMlNWYmp4cVhLdjRNNytvTzR1dzZK?=
 =?utf-8?B?SWd6STNKYmJXS3FINVNEMXdWNFA1c0JWd2piWlNDUXVaUStPOHdBVktJTlpq?=
 =?utf-8?B?NWwwWlovQVY1WFNKTndRZE1nckc1L3pTN081Szc0b3lZSkNwOWovTHhSU3hm?=
 =?utf-8?B?d0tkNU5BSkIySFVrNmJpbmx4SmloREdLK05rbXNzTWRpbXRORnFBd0UvTUdx?=
 =?utf-8?B?dDJVZ1BKNFpNM1J6Vjg5UGxzSlZxbGE5OUVTM1BhMURObjN6UVdITmdicytz?=
 =?utf-8?B?NWdGWnJHOUVOd0ZNY3RaN2RuS1NIcGlKVEtHZjdJMkFaK1N4Z2ZBREpNcU5B?=
 =?utf-8?B?aG5EeG1qeXFWbWROTTk1ZFBLZXQ5blIyWlZYMzNPaG9FWWdIL3RaNG41dFZO?=
 =?utf-8?B?enBKZnRucEh3MjVCSWRWMlArK2pHbDFKVmJJVXZKQTlSQnlkR1N2U2hrVHBh?=
 =?utf-8?B?RUh4azZnY3dmUVlURUhaMW1zcFpyOVU0d0ZENTExUzJqOEdwOUFtaUFFc2Rp?=
 =?utf-8?B?b2VJYVZsMmRVQ2tORkxkUGhvdTFEc3VoSkRyM0xWQ3FxZEtuNXFLTjVxTm1R?=
 =?utf-8?B?NnRzMTluVWgwOVMvUmdia0NwUm83R2FaWmR2anNMcEt2K0lkV2Jpdjdwd0xS?=
 =?utf-8?B?eUplTjBKZC8xZnJUSm5yRkRHd2JVV2svRlp5aUU3YWtJNktoZDl3NlJHOXdt?=
 =?utf-8?B?VEx1Q1ZSUTBuRUpNOGhLL0tBWnUvQkZBamkrM3diekZNbTB3MmUwMEl1MDJG?=
 =?utf-8?B?WGM4WkdXTkpDaFhWWHN6ajRwNFMzZUIrKzREZDVocG82bU5DL0Q5Y1Q5ZWY0?=
 =?utf-8?B?WXpjMFFQZTBjVmRZaGxMQVE1dy9teW8wRG8rY3hhTGc1eDZGT0thM1FmYmxK?=
 =?utf-8?B?bUI3MndTRnMzdzlCSE4rQ2pTNXFNN2lKdGhJYTVhSVJpb09HTzlxaEhUbThP?=
 =?utf-8?Q?nD8YoM3LaEVxBCJ+33/JEz+HM?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aTdGVFAwUU9QdkxCZXBVcnZYZXNNUnFEU2MvbU9kcXYyR0JpeGdGQ3dlRmtC?=
 =?utf-8?B?bVBMaUliaHdCWDhQRWdqVVJTck9ZQXlSQTJQNFYvV3ViU2hGaEJlWUozZkJW?=
 =?utf-8?B?L3lJVlMvamVYTzVSSUZua3RjUlpWLy91WjFGeGNxdDJjZ2ZxM1FxRDVSRGRz?=
 =?utf-8?B?Zzh6MUQ3aG5FZ2tLaUlGbys5K0hoakg5U3N3eG1XMkRWZldsc2hPU0hNdksw?=
 =?utf-8?B?S1VKeEhPL3ZBc0l4Y0JyNERWemVpZHJ1WEpSTkNMYnV6ejgrT2YxdDB4RVha?=
 =?utf-8?B?ZUo1K1BpRFhidktaNm9oRG0vMXZaUjNXVHFiRS9oY1pmL3hPNXZHellwZzRo?=
 =?utf-8?B?NmVDcG96NDV3OURlV3dPclNEbnNHNFFtZkVxRklTN0ZRQVNneG9oUU0rUlZF?=
 =?utf-8?B?SVFoNUhzMWdmV1NTV3ZiRFgwZUIrdDNxMXgxT0FYL2U1SmpoMDA0enA5WDJC?=
 =?utf-8?B?Ymc2bDZxTlpGNE9UVWVacHpQcFc2QkVXYnUycDYrSUZVcE5qSDEzVWFrdjBL?=
 =?utf-8?B?Z3VLNG9VZjByRHNvSTRneUo3Nm9JVllNQUEvc3g2b3U0ZXZINWlOYjhza21h?=
 =?utf-8?B?Q2pnRm1LaTNNRC9NaWdmYVZTdkwwQUp5T3lFYTZuK1lBdmNaa280TEQxMjh1?=
 =?utf-8?B?K1ZYOFYzQTNlNGhTKzM1c3AwRW0zbXVjbkpXdE1sRWhxVUZkcFZEUjZwNFZL?=
 =?utf-8?B?RkpKdDBidU0rVlpHZVF1ZjFGczA5cHNTU2ZxU29Oa3VJLzVvN09YbSt4cURm?=
 =?utf-8?B?Y0xPTHd1UkMrcWF0bkR1QWZhQXNIOGR0MThENVFwK2d4N3BHTE03ZFRlSnRj?=
 =?utf-8?B?YjYxTFhGQnAxRm1scWxEMVNDQURYZGtUSGMrR2Y3WVpSTi9ESnFEVEJlTFZV?=
 =?utf-8?B?a1NqbzA5Um9USTJ3emV0dURJZVlWUklvRGNDOStmZ3BidGc3RU9WYTVmbWhY?=
 =?utf-8?B?WTR6TENVejdldHRuNElxMmdGOTA2cHZhYmgxbWxxTWVhNCsyRElCM0Z0RDhl?=
 =?utf-8?B?TDJDcWYzQzcrTnd4Y2V0dmI2ejd4ZjdqSDQ4eXZ4OUpqZ0l2Nnd2cGUvakFh?=
 =?utf-8?B?Z2RTRGVnMndJWWNnZDB2OXI0TmRtdzBKNzZXT3VBajE2NEFldU5XNnJZOHcr?=
 =?utf-8?B?L2JyV2JJNSsva1VKZEZ2cGl1bWlIeUZGWCtOQVg4Y2NzZmo4VUcybFR1N3ZY?=
 =?utf-8?B?Y0h2WXo3WHB4V3p4bUhxSlROcFMwV0xHY0gydStuTWl4cEtZMFBoZWNzbVdo?=
 =?utf-8?B?cEdjcThlbzRFQ1V3SWxQVDV3bzVpdFpSamUzYlRXMUlTRmdqY2xXSXQ0ZEZY?=
 =?utf-8?B?QTRxTDlqaDVSRW5NZGdaR3hhZWxxVXJadDFNVzFyR2Z4RE5nekdkbnVqY2kx?=
 =?utf-8?B?UE5JaklQVWMxVEwrTGlFNW54bzc3d0FNdHFnT2RKNjhkbU9SWVZBOHZrcHIx?=
 =?utf-8?B?WjN3RjFLZzUrUm5jZTV3WTZWUHB3cklNVXZyOURzVzhiRzNYbzV1cnRhWFdJ?=
 =?utf-8?B?am5tYTlUREpUV3ZBNWtlcUliMnBUWWlkekdueDVKMlE4TUpQTlRzbU13QWx0?=
 =?utf-8?B?ZFpGZlFZTXNQY1NYZzJNTGVUQ285NExuYm5wUEtHK0dGZUsxejFrV3d0U2Fq?=
 =?utf-8?B?eHpMSi9YMTVTUGRYOWdpMk5vY3JXdDlScS85Q1RWZmt1VENJa0Z1UkNnU1pM?=
 =?utf-8?B?a0N3OHU2TXkzb2tseE41MjMvWGViVHFGTVQrZVRldys3YnFaY0NVYU9QSjlT?=
 =?utf-8?B?UmI3MWlkL0NnRlovakV6Zm56RU1VMWtwNW56UC9QcG02OHlxWWw1L0xYMnpQ?=
 =?utf-8?B?NkRaNForOUtVUy9rOGZtNy96YmhSMmNzV3BmWUlBRmhQelF6SFNHQUtOQkVL?=
 =?utf-8?B?TTdWejdldzRLckY1RFVoeU1QRW0wcFp5UDlmbmJqa1FNakhvelR3ZEhGWk14?=
 =?utf-8?B?YnpPQ0NnQjgvZVJkN21CRHU4Y0d1WCtwMXZoZWFaUll1ZXFDTW03SzNwYkND?=
 =?utf-8?B?cjY5Y1VVeC85ZXlPdEN0Y1luSjBLK1hRK0F1Z0M5U2VESHkraUorOHVmTER2?=
 =?utf-8?B?NWpDbHVEbnF6dys0WU50OEpnK2lBQW8ya3U4c1Rmc1FqRjlDRy8vRkxVdzV2?=
 =?utf-8?B?bk9Ba2FPcmcwcjcwcmhTUW9XeGFyZUo3akNsb3FaMmpoUXNnbWg5cDFUMlhH?=
 =?utf-8?B?L21WWldxbTZmMW56WmRUR2pLWXp3T0o4SzNVcFJFdE5vL2IvMGVoaWthL3dt?=
 =?utf-8?B?RnlnNVp4akR3VEZxaDI5eXpVMTlKa3VlVHJGbVE2QVBJSm1KdEhNUVRGUFly?=
 =?utf-8?B?aVVYQytwVTFrMFRjamE5cHRJdXUwT3ZBRHQ3NHpNNVFqMmlpbWRkQT09?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	pxFajcKcnahwKebZFkIHzaZpN/9rQhI2y//+DFi1mKL+Xgz4OsYgszWlIDDfew6YfGHCJckBCJozj77KpXyimgTjnD/mlwTftItHGCcT2dDzDrqsrRxohSqjE/byEJxsH0knBQm1bmp1eJEJ8m/g9z0ljIEXHxE+k8DjdfqToUOEOUZrutB3rpiz1uVghcyw/k+7kPvZKppqNTBiQmHrp8kAwv6d8YDjML8q1KThJUypi3rqwpIDF8wCu51KBLxGelLMrBXlOJCy7i+POWNscae+Rs9BPYCrCsev/DRXuT0f5PnBnBVmGFYeurfYef3PUpG9E158OdVEk23Gk4Wc9NSWxj4BRkAbI3tfdZKaw9VuaSwsEx6nxu8T0gAM50Qf1zAYyVMSIcqB8p1azYDa1F4IJg+0qnDnKtn12UVetx5DLbMyCrsi7MXAW0w7XIx20aPF4qf/kdfyy4XiE3Hm07howtBQtewUcGW3nICXv1Zzpslb8duyB1221gD5eL+QEgogON+u23oW18o5xhfvL2twFr/O94mIj9oRlyZK5877mASAwYDbvYEk9QTCLSk/rRkNKgCzcjpj0seNyM9cD/uDRRAnPg/jJ6+vDP8IgaI=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0cee51dd-b2ef-42f5-3227-08de680f458e
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2026 19:13:13.5399
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: It5DDA9cLKdA66JqZ8k7zDDLikE9RyKunQNsKGo1VSc1JRoomVV/LcesArMFm7xZ62/BQYtPfkgny/YJjjctFw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB4598
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-09_01,2026-02-09_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 mlxlogscore=999 adultscore=0
 spamscore=0 bulkscore=0 suspectscore=0 phishscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2601150000
 definitions=main-2602090162
X-Authority-Analysis: v=2.4 cv=KaTfcAYD c=1 sm=1 tr=0 ts=698a31ed cx=c_pps
 a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=yPCof4ZbAAAA:8
 a=LbH3BcwEbpssHAVGocUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: H3S92OSImpjpP1GERD7hhV4K_UXP33VX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA5MDE2MiBTYWx0ZWRfX+GNix/RUz/s8
 n8ouzD48SZJgRDNVErvUTCqz2pvp4j45Z+vqaY94yiBRrfAWQIvJsDs7Y2nCCdJnmaJflXSqgd6
 xe2ZBT56FKNDWnshmUugTfsLWeDI+eM+pv8spKDaFH2DzufoodoHDdwcEFjNPc1MPSIA7YR4f6Q
 7m+hEXsQUfot977EYEtf/t267XnrY9pDAdwtVIW/89/g8aqJv0uYsQk7v53+I2av7vHRq8x1UcQ
 pEkW1V3PzcrEdC5ICIfEuc+BMHoxq0JbDY6gExVS6ph8LPrvEXHmLNbJx/Rk72QO6XM9NP+2ExD
 t4hBXv7yCB9Z3KxyEwVeBBrWeLuFE3RTBuRtpS4g/CbOdzUgl90LOXC4Kn0fVutOPUh1j6TJDpl
 54BjCSnK9+pcMMf1GZTeACDxbeJcqh1AaFUskUnROVehz21xKpkkZbPew9eJ1CxUejdRdPxW7we
 OZtojDFsTFHCfab3REA==
X-Proofpoint-ORIG-GUID: H3S92OSImpjpP1GERD7hhV4K_UXP33VX

Reviewed-by: Eugene Loh <eugene.loh@oracle.com>

On 2/9/26 14:04, Kris Van Hees wrote:
> On Mon, Feb 09, 2026 at 01:55:03PM -0500, Eugene Loh wrote:
>> I'm rusty on this stuff, but maybe you can help me out.  What happens with
>> the test if kallmodsyms is not there?  The test does not directly rely on
>> that file.  The test simply makes libdtrace calls, and dt_modsym_update()
>> can fail over to kallsyms if kallmodsyms is not present.
> The .x file depends on being able to read kallmodsyms to determine whether
> the kernel fix that the test depends on is in the running kernel, which
> cannot be when kallmodsyms isn't even in the kernel.
>
> Without kallmodsyms, this test becomes a verifier for the kallsyms data that
> the kernel provides, and then only in terms of loaded modules, which is pretty
> much guaranteed to be correct or the kernel modules would be conflicting and
> cause horrible crashes of the kernel.
>
> With modules.builtin.ranges, the association of an address with a builtin
> module is done by performing a lookup of the symbol address in the data that
> modules.builtin.ranges provides.  If that has overlapping ranges, then this
> is a kernel bug, and this test wouldn't be able to detect it anyway.
>
> So, if kallmodsyms is not present, the test is useless.
>
>> On 2/9/26 13:34, Kris Van Hees wrote:
>>> Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
>>> ---
>>>    test/unittest/consumer/tst.merge_ranges_bug25767469.x | 6 +++++-
>>>    1 file changed, 5 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/test/unittest/consumer/tst.merge_ranges_bug25767469.x b/test/unittest/consumer/tst.merge_ranges_bug25767469.x
>>> index 7e265f2f..a92690ad 100755
>>> --- a/test/unittest/consumer/tst.merge_ranges_bug25767469.x
>>> +++ b/test/unittest/consumer/tst.merge_ranges_bug25767469.x
>>> @@ -1,10 +1,14 @@
>>>    #!/bin/bash
>>>    #
>>>    # Oracle Linux DTrace.
>>> -# Copyright (c) 2018, Oracle and/or its affiliates. All rights reserved.
>>> +# Copyright (c) 2018, 2026, Oracle and/or its affiliates. All rights reserved.
>>>    # Licensed under the Universal Permissive License v 1.0 as shown at
>>>    # http://oss.oracle.com/licenses/upl.
>>> +# If /proc/kallmodsyms does not exist, there is nothing to test.
>>> +
>>> +[[ -r /proc/kallmodsyms ]] || exit 2
>>> +
>>>    # The test depends on a kernel fix to report kernel (and built-in-module)
>>>    # symbol sizes correctly in /proc/kallmodsyms.  An easy check is to count
>>>    # how many kernel and built-in-module symbols (that is, symbols that appear
