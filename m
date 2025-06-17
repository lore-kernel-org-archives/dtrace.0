Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54EEB8F54
	for <dtrace@lists.linux.dev>; Tue, 17 Jun 2025 03:38:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750131495; cv=fail; b=Gqgfbnsk2GYSg5DhVurmtgdZbeCh35+aLShHhdprws0NI6OP7C4FflsY7sur4gstlB757wy1I+1fRXKFOwi8CL38qbog+8UbaFhx+9/0MWmAKOgmNwcMlMFNmifETMkt7fuEfBF5y19zrfLrZCZGF1lgqbe7sXEobjqSPOyApcc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750131495; c=relaxed/simple;
	bh=JDGvlSr0pW1qkLqQ6lXwq4kqwpSbODkJHyLXkh1bbts=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=u4Ns6MuhIrZU8FvxEc/llmZc76kt/zpjd8Lqb0B2R2SulqW50jj/bMBO50sszAS5Ja/q7IhUeNKh3+uS94VA/VlL1680UBzOM3hQDg95SVET0TokRKXCLfZcQxPdQ3i8u/p+3BCeHLTIMNsqikUG13CcMajXEXr4fjpOgWk1izE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=TD0Vy3tk; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=vQipoH0Y; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="TD0Vy3tk";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="vQipoH0Y"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55H11hP8027737
	for <dtrace@lists.linux.dev>; Tue, 17 Jun 2025 03:38:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=JDGvlSr0pW1qkLqQ6lXwq4kqwpSbODkJHyLXkh1bbts=; b=
	TD0Vy3tk3pJgdebKRWnvDgz3/o/8D5RLP+yGOYaPLGPQp1SBLP1xuymY1ItoNTwl
	Xg9PJZJ5T7JB83QEzTMsm9GKNX/0SDOC+2ylbT10y1e+YCp9YHZxhFjh+LlUg7bO
	IFKCJzmni2/CxCgnQLC+xZwpVHmWwN79aA014KvV2HdRgdTqQlXBRY+DUBUMKMmu
	YXveak6eqE9zX6WR/Av8B/R68v7aGwPQjwDom7O9n5BmXYR4nXtr9Scr7wbZWYN+
	a/9GFEhnNIVZcFCDjOoK8xLgFn1GTKiu+krTQ01N/b9ALoivcCAcTEqIFevFX99A
	VJIU95U/AuSI6BE8iMA1UA==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4791mxmf2f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 17 Jun 2025 03:38:12 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55H04ARg025916
	for <dtrace@lists.linux.dev>; Tue, 17 Jun 2025 03:38:10 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10on2060.outbound.protection.outlook.com [40.107.93.60])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 478yhey0yh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 17 Jun 2025 03:38:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OFtpl6P2HA7chVUoW00RyiW3jOX6OkS7Jayp/JvwW7WrSDMaXSnOTIbxtJ8fSgmTK+0r/qLRUotSxeOZaNAaidv+n9+gLfQ5QInqAFCfK6fwXBZZERF2f6c+JdIPwRh3cbHB6yIYvea3T/fas4KpbNXgUleyMN17kPqfEs85fogA0wT5qa53TC4GOy7uYOtdQoMABaQ7WSDs6+IWLZ1JZKl2F3LvzdHUhnc3rWtlfe8gCrYYk9G/3iq16ArO7IAcgZx6M1hjd/8bpSHIHyfeifWRJEdN24H88BeFNliqXl5vRb3ffsWdMeq2iXKL0Z67nf7nYm30+qLD3a0ggKBMnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JDGvlSr0pW1qkLqQ6lXwq4kqwpSbODkJHyLXkh1bbts=;
 b=enler92/ZiUsdsFaPkUH2g+Q5hWtR1ojwi6mIBrofwqzVRmuBDwlipeUR5bS1WdDv7BA7FVpIV7lR8aPxI9sL0EM7OJybj04Y2XhtNaGfD+LcQBeCK69l2ORE3Yqa76CmUfo69Z+gfyVfoQ8i4iwkhlnHnNHtnrSHlvnj+egJR+g2KjYY1hc+uxirPMK1n/jaKPGER5Eo9rYuEmilYdJVZAOpOeg4ijQbnYSu2II/PBE6oR9QNHEFr8xd49RtP9ibOBxJ1gfc54YXcnkxuX1qQeWNG5HX3amcu6otMiSMofaCv7yCvgizoi7ZaevYsUEqnzrzpfmNNxHt/5iZZZA2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JDGvlSr0pW1qkLqQ6lXwq4kqwpSbODkJHyLXkh1bbts=;
 b=vQipoH0YN14zJi7HQfYg1txJIinvUIavZ95ml74MPsPqXU9UbihthKVsH1d/sRYR1/Bi3yGevbPp7vo7rOBzUXITXC5gsDWVNjWrOrBNEX+MDtjvkM9Xwhza9/iXZa0O7ab7avfeo1x0MKE24FX0kGwsM6unr1kpifKjB2uAB4Y=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by SJ5PPFACCDEE1A8.namprd10.prod.outlook.com (2603:10b6:a0f:fc02::7c3) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.25; Tue, 17 Jun
 2025 03:38:08 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%2]) with mapi id 15.20.8792.033; Tue, 17 Jun 2025
 03:38:08 +0000
Message-ID: <fd0c08ee-8efd-4728-fb5f-06e354b2ee1e@oracle.com>
Date: Mon, 16 Jun 2025 23:38:05 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [DTrace-devel] [PATCH 08/14] Test: caller and stackdepth tests
 for ip provider
Content-Language: en-US
To: Nick Alcock <nick.alcock@oracle.com>
Cc: dtrace@lists.linux.dev
References: <20250522180118.27343-1-eugene.loh@oracle.com>
 <20250522180118.27343-8-eugene.loh@oracle.com> <87v7ozbspl.fsf@esperi.org.uk>
From: Eugene Loh <eugene.loh@oracle.com>
In-Reply-To: <87v7ozbspl.fsf@esperi.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR05CA0155.namprd05.prod.outlook.com
 (2603:10b6:a03:339::10) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|SJ5PPFACCDEE1A8:EE_
X-MS-Office365-Filtering-Correlation-Id: c69043ca-03bb-46d1-1c8c-08ddad50604b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VjFiRmhaaVdhUU5Jc0ZkZUszK2J2T1ZSNFVaMXR6dmVaUTBvNnFaejVLeXoy?=
 =?utf-8?B?NHd2YzVnL0lmSXl1Qm1MU0hWSUh0VUwvMzg0YkRwNzB1TS9Bekxya0FHM2Y0?=
 =?utf-8?B?Sm1RaG5xbnF0RzlRU1hiYnZ0TWhBdFZCaVM4MXBrek1TblpIcktvVXJwNVVm?=
 =?utf-8?B?NzYvSWpVRmhiOXU2K1lma0IzRGhLMWJsTFVsUVQ3VGpqU1k1TXVCL1hSSk40?=
 =?utf-8?B?SHFMQXA1WVh2RU5vb2tIVUZRcVRiMm1nYURQOTZXSk55OXV2NGJmTXROeklq?=
 =?utf-8?B?RTRCWXhyODhPdUFRNk9TQlErNGV6UkpxN0cyNnNyVFpvVHVnZEVUbUllTFNJ?=
 =?utf-8?B?UlpTY1NURjl5bmFWSzJ5dmNSREZrQnptV1J3cWlmV1pqODYzOVVpeXd0bGtt?=
 =?utf-8?B?YzQ4SlBqNjBQUUNzZHo3NkhHaGpjV0hVTDh3K096aUJ6R1F2S2xzR2ZxcTVq?=
 =?utf-8?B?OWlxM0dzc1MyZFlBV3Z3Z1hCWmhkdS8rSmNnUU1ybW9OZWtHNDhkWFRpKzBl?=
 =?utf-8?B?ZWtpVGJOYXBtb1hRbGh6Z0lDRWF4Rm9sL1R4YTdkOXgyNEVYOW9WSC9hUHI2?=
 =?utf-8?B?c2xVUU53cU1sbHVDK1h0N3JoU2pQVGMwZnlhaWNpck93WnUyYXZBQ2pTSi92?=
 =?utf-8?B?V1VNb2VsSUk0YUgxem1jdFNUZ25IcDFpQnRzZ0dQVFo4YThocjlJRjF1YzBq?=
 =?utf-8?B?bVNjTVZXZDlUWkNVQzU2ZWhJK3hyVTY2REdWeVZ0RUtNMit2U3NHNTNiUFhO?=
 =?utf-8?B?YkFPaXZ6ek80cFBzMCs0M1N2YVVteGlucyt3MURGUTZSZU5LWHRRTHY5MExx?=
 =?utf-8?B?WVdZUFp0OElEemUyZEw3NTRwK0t4MEFIRVpNRjBNeTJuUHp0NjFJVnZnVnNk?=
 =?utf-8?B?cHlDaTJ3UFZPSVFMT3VrQ0dqazJpREhBdnYyN3VxOTJFR3VGTWd4ZVZ3UkU1?=
 =?utf-8?B?bVBmRktUZjNHc0NDSllJVmlkL0tkMG9XeUIxM0NMMlVTdWdUYUE1RlFibHZG?=
 =?utf-8?B?Wk1kL1B4eEtwTDdWRURndHEwRTB2SWdhUm5QSFJkVUZ5U0dyTlpqWHJzQ1FH?=
 =?utf-8?B?Q05WcmR5cFZMM0paZExRQU92VmtqTlhDeHUyODZZZUlFV2p0a05pKzVaeTc2?=
 =?utf-8?B?UWFYL1d6WHBRVFJLVjV6RWQvZVY2WUI0bUc0ckUzVFh2MUdRV1BFbWpXczBu?=
 =?utf-8?B?K3duclMwM1Q4Vy9jRkh2V0xwTzMrOW5aSGQ1a0FLSExwSFlHMzdjZDkxM2RM?=
 =?utf-8?B?bGtzZ2dnWXNuNDZ5akIvV3kvK04zSHJmQUJTdnRrYjRpTlBqUVFGTXJ2LzFM?=
 =?utf-8?B?bTJSdlRtUlphbXdkOUlna0xIMm9EZmszWGhkYmFSZGRGTnRwSVBqT2ZWZHRm?=
 =?utf-8?B?RkthbjduSkVRYmNkNnhMYTZNc2R3NVlyV1llVEN0Yks1R0hpUEJqV3UzRVBp?=
 =?utf-8?B?bVFSK2pqaHlxSVVacFQ2Rk8rSHFtYUpHSy94eE9VNzFBYzFTMVNOd1hEZWhw?=
 =?utf-8?B?TGJUWThTcm52b09JSVRHbHBaMXpsV3VIQ1FaWWhsYXBtN0JDZmVCOHoyVGFK?=
 =?utf-8?B?TGZwMnkzTFMrNnJJMG16bUF6ZjJmNlhoL3IraXlYaFA1aWlsTVYveE14VGlr?=
 =?utf-8?B?ZEoxNnN0SlI4RDNIRXFKek1qTG1qaVpFRDJzMnNOWU5jTDBjMElSRG9JSkVG?=
 =?utf-8?B?SmpseGF1ZERFK1BqT2JLNnRRQUFLU1MrU2tBUmJUSjJZSFdjODRqME5hNGpS?=
 =?utf-8?B?VlptMG9tZU9nZ1kxbW83SzN2K2VZVUQ1Y25CRjVRZDgwNFU1N1VSQnc2THJp?=
 =?utf-8?B?V0xzQ0JtM0R0VDhPOE9Ud2phSkRvODEvMS80WVM2RGl4Tjl4alpnWHJDWFhl?=
 =?utf-8?B?RW5TbHR2ejNYaCtQOG5mK0xBUjd1dDQrd21BWFVNWHdWKzBMZTh4VkRNUTg4?=
 =?utf-8?Q?RMvJgGyYLqg=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?am1NSXBWV1pXUmVja29qOGQxbk0xQTc3dXhrNm45djNBT0FqWlBUaDVTYkZV?=
 =?utf-8?B?WFFWR0srd2xkUDdlcnV5Wkd0N2lRaEtEYU95Q3VvNk04dnF5SzJ5ZFhSTGdT?=
 =?utf-8?B?a0phcnpDZWRLNzRUYzh4cWJjV3R0UFpPNWNzNzBVZS93c3pwMFFHWllGN08v?=
 =?utf-8?B?WElvaXpHREwvSGVXV0paYll2T2RDK01zajJMc0ZaNlJDQ2UyWndpZGZaRXZP?=
 =?utf-8?B?SlJBWWQ3eTJ2bDgxekp2bWw2UjJubUJnbC9aZ0JrNDJnOFhhdkFtYWZJT2x2?=
 =?utf-8?B?NndoU2MvZXJFbXByS2gyU2pKdlVCVWFYY2lyN294VVJNMHNxNU1LbHc4bGh0?=
 =?utf-8?B?ZWF6MGJoY0ZBUW9NYlNsODRPdXk3RlNPNTZoeUtBZnNmQWFVdFdwSk9IRldB?=
 =?utf-8?B?bUtSQmJuWElhc2sza2ZUOFgyTFpMdXBSRUF0bS9henFzeUdMMkp0VEdETkZL?=
 =?utf-8?B?bzM4TWpweXIzcG5rUExrRVhybTE2WHhjdEdkM1VpV1JkdWdwZzJQNCtqS2xt?=
 =?utf-8?B?SzhLNUhLZGNtc0NHVE5pOU41YWxxQ0xFQ3FYOGhnRUFMUTRNZm1xUUdwQ0gv?=
 =?utf-8?B?dmxhNFpzbWttZmx1ck5jUXBoRkNYVGloOCtWbHgwRkVqVE5HVW1pUWtsY2FJ?=
 =?utf-8?B?N3JJNnU2cFp0aSt2MkgvRFpVWjNEbHJJUjl0VE1QZkxjcWNweHhlWldYcjdQ?=
 =?utf-8?B?MWhyNzU1NWR4T09aZ0x6TlJHU3lBblMxLzJCSHI0RjFnd0ExYmJ0Rk5TZzdh?=
 =?utf-8?B?MUEzVmhKVWxjOEJsbEpIaWlOSnRxNjJ2Q0JpdGpGZytvZkpyYkRuaWI3amhk?=
 =?utf-8?B?NnBjNVZidDdTNUJxUzVRNnF1dnlIUklsNS9vaWRBd2dONUM2bjVKR1dnelBH?=
 =?utf-8?B?SjllUzlzS2tZZGtpVEIwOURvb1FJQjRRRGZPeWZlbnNBRlI4OEF6Y1NqaHBs?=
 =?utf-8?B?eFk4OTY1SUpZa3hGTFEyaWhUWG8zemZaTGdsQkRHMkQxUDVUWDNyTVNkMS9V?=
 =?utf-8?B?N0N5clBsbVNISDBYRXNPa3NrMERmZFJCcndjVTY0ZHFJcjZ4dmZJays0TVlL?=
 =?utf-8?B?dUNqRUg3WU5JYUM3bnJFMXFqTkl2bnFmd3JwMXYzRVU3L3lkTkhOTENpUkJz?=
 =?utf-8?B?NU5QWEdtbWMwTTB6TTBXM085WVdGVFBPMnoxTXhsVEl4OXNaNFhyMzVCMW1s?=
 =?utf-8?B?Z0ZSY2EzOGdlSzZvMWNtcFJXa0sxZnhxYjlxZ1RRSkI3RW5JbHFXSHAyV0Yy?=
 =?utf-8?B?eE5EUHlvMXJVNnU3eUFVcFphd1U2ZUdVVHFSTTBkOWlJemVXWlpZbFR4eHNL?=
 =?utf-8?B?VnUxMUtVVWoxTVlvT3NNcDViSE5sTEh4K2RRZXN5T0xwMExDcm5Ca21WTzJs?=
 =?utf-8?B?K0JlL1QzT2h4ZjVKRWZhL3lEcHdMa0J2dlY4aXd5VTJxQ3NBemNDMjdUYm03?=
 =?utf-8?B?UUZ6enB4b0Z5cHBERWdsYXg0cTdKRzlDa1NZeHhleXhPVDlISyszRlZId2tV?=
 =?utf-8?B?YllKZ2hNRUZKbmt5cmJZK2NpTEIvdjdPeDV5all3Y2JKcXlDTDFWYzBkTUhs?=
 =?utf-8?B?RmZEWWJ6bEU4citNRUVmZEVOeS8xcmNEUzBnMkM2UlI0RXYrOWJQTFE5emlR?=
 =?utf-8?B?QmNtUXZ1eTlqbFU0MFdMbHcrZzRneG56L0dNL0RkREpaVm42bXRHV0ZaRmFt?=
 =?utf-8?B?SC9qK0N3Q0Jza2tlYWNOMjYxM3V5QUYvanY1bE82RWZnblR6RVdKMVFoQ0M0?=
 =?utf-8?B?aEF4NmZZVjRwM3dNWFQxMWRwMDdLbkswNTZGaVNwVXFhbExHY092WHBZdzhW?=
 =?utf-8?B?QllJNEtvOCt3Q3ZpRWN1djgrRHNpRUZuMW03ZmRlZ0hCMW1LMGorV0gwc3Y4?=
 =?utf-8?B?RkgzWkRycnFleGVLcmhNLzYrTFNtUGFBY3ZIZlVaRlhtTEFOTkFpWTZFbGw3?=
 =?utf-8?B?WWxVZFI5QVNlUG5yQktWK1pSV3BxN2QrdXd1Um9nendKcjVITVFLYkxCWWYx?=
 =?utf-8?B?QmFMLzFpSkthZjhDZzJJZTRLeVk0WWIrUHR2Zm9MRWQ2UEw3RCtqek5nZUw4?=
 =?utf-8?B?Ukt4WDRnK0o1WnUwNWh0MmxzTjhNQTJkcWQxaCszeGFQYTlYbXJmQUt2M1hO?=
 =?utf-8?Q?6e7ZUcQZ9ZrBEKaDy7ZR6Yp0X?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	WWE6PqgSn2D228TwhC/b8SA5XtNkBm83Zm3o/1oH+WNk6XvJROAssGwkffBpyl0Tc6PMTf4DMCgad4370fpr7N449y+YHZPyTPQ2YL5agUpfsktR5pLdvpZOYkf9rEXRkrChAqF5FmXNk9PjPO/YVSTdJCt/gs97fKHhlV+afbd1iLRWTzwFdKa9ljElFChNFTUC9nHHF6OBjnebUYoTfnqxvoGEvdwn377Wo1zmnGLcBpwpA5EjaWGth5wDDKeunc1YJOSfTeuc2UrENI66vJptZmisnaBgfIUxMFV4WB5PPmwpAkZsyT59XmQNaoBcpBoWJ8L3iuU0XvMp0gCAy+PpmrLGA6dU6KHWD2+XEp00K8xJepyW/t2bik03WgtrkYJaJKsaAO90IuNS2y2bhON0EUAIimIz5VzyOkPLZkGcsI+71YYTGUzeWaBqIMD3WI7PiOG2okWOD0rTtuLIFswNkIgy8DyRMkDiDFzhpOOx0hNDcfbkOb6a0eWRQUhNKk9S/8eDqO4q1HW3sOfbG0Fx85Kj8luyOpvP/EZP7Qg7xMvJWgYM97YeyDbkuMhgRvT2EXOEtYkzjWNs6aFi55iY/y2M4n2CyUT8t5LuD+M=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c69043ca-03bb-46d1-1c8c-08ddad50604b
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2025 03:38:08.3445
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tV3dIDe0NXDkg4jf0WgPBM7dRQCPg6/sJ1DHfP+jSKvXfhNeYFehGtFqIi4byqzwlNxBL2MWU83VlXyHZs3VAg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPFACCDEE1A8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-17_01,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 spamscore=0 phishscore=0
 adultscore=0 suspectscore=0 mlxscore=0 mlxlogscore=999 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2506170029
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE3MDAyOSBTYWx0ZWRfX5fLRVHP4NDbi C+8Avlfm4H+BaUbPn+XUz/X8xy2hwMRB2E7CjZ5sVUb3BHMHDGopoLpWkd3JyizegjbGVspnA9j oeK9zTSxBCrMEgSjMhKbAIMl/BmqZ2TA92JPu+zp3etNmGPveJ9gP7nSDl/EF9coLun8uMcEd7X
 Gcew28HPk5souxqJL6zq3vD8OtjCnrXlVx1dNm35OfofEJGHlncdpiLp8EZH9sYahz4JABmeU4T N5wceCLibbqWdjVGdwLUUBHnaoJDvUESx7YscFSM3O5z4CIEloT/l/n8Mc4Kd7HPi3UueAjW9e6 V3ZNRyBfBxERg/aOpBmFR7+ULUZDhO8/Qc+BtMXt1b9iUTgVa14AF7tJ/a4Mo1jFdqH3gDp1e33
 omlOr+Pz/2C5X+f5+9TRlJqKh4dZHLZDqT6KQhvX1gCnEQPEXuflpaf+bfukz4iemaDOutSU
X-Authority-Analysis: v=2.4 cv=HvR2G1TS c=1 sm=1 tr=0 ts=6850e324 b=1 cx=c_pps a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=NM-EPSpPAVC4efC36l0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10 cc=ntf awl=host:13207
X-Proofpoint-GUID: NJPk_nJYR69oaxtSk3wkkIRTZWoUZ-aK
X-Proofpoint-ORIG-GUID: NJPk_nJYR69oaxtSk3wkkIRTZWoUZ-aK

On 6/13/25 10:51, Nick Alcock wrote:

> On 22 May 2025, eugene loh spake thusly:
>
>> From: Eugene Loh <eugene.loh@oracle.com>
>>
>> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
> Reviewed-by: Nick Alcock <nick.alcock@oracle.com>
>
> with the microscopic caveat below.
>
>> diff --git a/test/unittest/variables/bvar/perlping.pl b/test/unittest/variables/bvar/perlping.pl
>> new file mode 100755
>> index 000000000..97c9b09e9
>> --- /dev/null
>> +++ b/test/unittest/variables/bvar/perlping.pl
>> @@ -0,0 +1,8 @@
>> +#!/usr/bin/perl -w
>> +# Oracle Linux DTrace.
>> +# Copyright (c) 2016, Oracle and/or its affiliates. All rights reserved.
>> +# Licensed under the Universal Permissive License v 1.0 as shown at
>> +# http://oss.oracle.com/licenses/upl.
>> +use Net::Ping;
>> +my $p = Net::Ping->new(${ARGV[0]}, 5, 56);
>> +$p->ping(${ARGV[1]});
> Is there some reason we can't just use $testdir/../../ip/perlping.pl and
> avoid duplicating this?


Thanks.  Okay, I did this.

