Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE1DA625
	for <dtrace@lists.linux.dev>; Thu, 28 Aug 2025 18:06:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756404406; cv=fail; b=ltkWp8ktIQAiU7A//bHbrZHAPo+I48WqYt2Qk2xleusTn1yhZ0HwtHV7rAbmSmp3wZfG5D7oARoFzWg/qpeFuS0cAi4B7QnCfk8dnHBPsWniOSbsyY8n0kz8yK7kbm8pnI1RYaYHgCtmLbYTwylDlio1WjAhQXjy0z/HmcIbmY8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756404406; c=relaxed/simple;
	bh=rEsTgk2MxzzYAM5677w46DDsZDC8cm2YmlBkxyYvXM8=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=t6JEN+FHOrWXhqQi3eah1uWtpRVM9MJt1NWmjPsLjpq93BaorgEKWMJ6u/zylbZPIFf+bxUIvVald5peXw7IcozQfS4V7o3SK9rm7fJOtVEymw+uzKuY+mxr+FL3x1vmUbEO1VgXpF03Is3grVh2J69im9Sf1yeyHyUraq3NHlQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=V3c+eO3d; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=fAF3IQTO; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="V3c+eO3d";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="fAF3IQTO"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57SHNUso006156
	for <dtrace@lists.linux.dev>; Thu, 28 Aug 2025 18:06:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=VX6avXMZMz2GkkrD8eMjQ2LlukcKBMpzjlyBOUK3vBg=; b=
	V3c+eO3dz8xCbzNUZCIA5SM6xJqhXLevRSFr+Q1IFmR0rKGe5Rgt4q0aTM+m2DrJ
	UAqBMACoXXXHI5trteekVJUE4+R89ZodVB5CzVmf6Xr7e0Ybj/UrjKvU74/6jxKN
	7AqKXBOEevTs6YJCv4Rg8C3Urtel7uY0BwJaGCerCZRDMq/hWlyrHotVFiQNPiIu
	9aV4fYUyKleRsvJj/As0SjuoaIFteYYSLBgOxa9zidlvxZJ7OazlJn5wYL6SCr7s
	zlP2PGSL8/c1wyC0cnRl2ob67FmHOBvTdx7FuoxXWp0xsqqbb/wf1w7a5RiWAVh+
	uw0EbmB+lh69E00opDIl3A==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 48q67913y3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 28 Aug 2025 18:06:43 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 57SHHdW0014629
	for <dtrace@lists.linux.dev>; Thu, 28 Aug 2025 18:06:42 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10on2071.outbound.protection.outlook.com [40.107.93.71])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 48q43c7dqc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 28 Aug 2025 18:06:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ma79IrCv/WHCxXUyH7sXcq2FGlxrJxczFPdYEkjz0G5/dqmRvFPndyUo7hzAkveAmrTD1/3cSJgUOtTPn2aY1UMlxwPWlXA1bpcf71LxYcQiamgYDPMsV350b5FefzMCZsFb/3r1o0huzNP91pcWw12lcG6C06uLlmb1hhwxueOlP3qGy1fMcQ3R6iXVMcKYxOmanon4tnF0zWb5a6ZKDnOJOQkwGuMtM75ODXAIzsXcP4XPL6hJBfC9aVeKVHsOWizH66a+yQACxSlmuyMfCfYpHyhql0sv2m+JRSlZ5I04DrcpXirc+KtAHfDUdExtYEa6Fw1OdafHluXazHWX6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VX6avXMZMz2GkkrD8eMjQ2LlukcKBMpzjlyBOUK3vBg=;
 b=AQ33xCLY7WdXdtFqlGODg8P7GN4Mw6p4bvtwXG/QujtKngWSVCn0+vPfug16a+9OkkR0UC7hkS0f+C+5tacgY5Ta8h4tgLnLxY1kSRpGmJoNH+OCTQbD6DaflbrBzfflSlkfmrszsOVO7StYi/LXzg8f7Bp0Qjaa6u6PsnpEURR+VsSkAzGbNnBFIKvJ+VhcPI1/JOVO5UCwLJ84A9rogtRh97Xkpj3rgkQ8C+2O4sK7q0blc8KMDKTJe/prnm20ZAvf+M6q0Ugzbc6t++IbUPTFEHkz3BQ/YJZaCel+hWbr83I3bIKTY7SWIdAL209mej0va6omEVERjy8BNTZCcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VX6avXMZMz2GkkrD8eMjQ2LlukcKBMpzjlyBOUK3vBg=;
 b=fAF3IQTOfQuJF1Ih08SR+uo/12MelIcjdNF6oPtF3L5GuuRXJWyHHnMZn2nQwr04vif0zqevY+Xru4zOV5sYrehMvy+4M9Ci1iHdpkq1WQUOt+Z2buQM9aa4Xb1bNEk7t6aHOOtiAOg/D7c0PGU9WXgIk6FIU0vWvPEVYarqCWc=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by IA3PR10MB8067.namprd10.prod.outlook.com (2603:10b6:208:50a::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.20; Thu, 28 Aug
 2025 18:06:37 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%6]) with mapi id 15.20.9073.010; Thu, 28 Aug 2025
 18:06:37 +0000
Message-ID: <8ac5a6c0-22b3-7a80-5df5-0cc824dc7236@oracle.com>
Date: Thu, 28 Aug 2025 14:06:35 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 3/5] unittest/udp: update test.x now that udp provider is
 present
Content-Language: en-US
To: Alan Maguire <alan.maguire@oracle.com>, dtrace@lists.linux.dev
Cc: dtrace-devel@oss.oracle.com
References: <20250822181629.30972-1-alan.maguire@oracle.com>
 <20250822181629.30972-4-alan.maguire@oracle.com>
From: Eugene Loh <eugene.loh@oracle.com>
In-Reply-To: <20250822181629.30972-4-alan.maguire@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BY5PR13CA0012.namprd13.prod.outlook.com
 (2603:10b6:a03:180::25) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|IA3PR10MB8067:EE_
X-MS-Office365-Filtering-Correlation-Id: 144f26b6-219d-44c9-94e6-08dde65da118
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?eVVnTUMzU0lxR0lQYThYaXF1WGxndXBjU2V6bzhrWGU0cXdsc1N3ckVjZGxo?=
 =?utf-8?B?K2NGYUVsWUlCdUlFWEtmUVdCYWsvRFFqZFdVZUpNZllhMXdXaWczNGZGZStS?=
 =?utf-8?B?eUdoWnZwWHB0eTFWbmlROTN5ck1ybWtiQUhJSjN2WGVsZExGTEJMazdIUnpJ?=
 =?utf-8?B?U3ljTUU1U0lQNW5UVFc2M2pzWnRiYXRLckxMYWhDQUtHTkwxdDIydnI1UW1L?=
 =?utf-8?B?eTZIUXVJUkZPQ0lFOFdQTERTSVFIdGJ4aWhhUjNWOGZZZW5xeFJ2eEd4eTNt?=
 =?utf-8?B?VHBvT0prM1hLVWVnWUJjZzdUNDdGbmFEemJrRjluRzdUWmlkOWMwZ2h0cEZz?=
 =?utf-8?B?Yll0QU9TWHZTM3dXamJwSmpVbEhaNHB5Nmt4VVVUT1BDYWViNmRXNlIyVlgv?=
 =?utf-8?B?c1o5eTRnWXllRC9FTWo0SmlRTUpYelJTc3NQNVcwenlNZDB6S2xSdTl4Ykdz?=
 =?utf-8?B?OVBTSytFcnJUSzhHL3ZObGc0bFFnci9vaDZ0R0hBK3FldXpDMnNJZU15V2Rr?=
 =?utf-8?B?N0JoYU54SzY1ZzNhQjhvOUJMZ2RrOTVCME5nMmZMZWtLeldtQXpEVUcxdGxD?=
 =?utf-8?B?RlE5WVd2MHVubkQ1SWo4QjZFeHhIYmZ3cGFLOTJIMzJWYWhjT05iQXRvTlZl?=
 =?utf-8?B?QlNHZjNNR0ZBcWJnUzIxcUZPVlVpc09XeVJuUnRPRk5BdzZGRVhpdkhaSG9J?=
 =?utf-8?B?U3k3Wlg0L3hRVjhZaFdnY1FPTnBOZmR0L2xDdHREMHdiZWovdXFzelV4RVVk?=
 =?utf-8?B?U3lQa2E0ekRXMUM1S0grNk15dVFaU2VQNjJVWGl5WUZVSWcyK2FyUTYwRC9r?=
 =?utf-8?B?eWV2KzNCWWV5THl6ZFc3MlNVeWF2Ym9FZmJEWTJNSWdYSWE1RGVOV1hMY0JZ?=
 =?utf-8?B?dUs1QUNVYVZUUE1IRE96bUZDSGN0NXpWeTJVNjVNQWRrUmNIdWt1YWo1bVRT?=
 =?utf-8?B?Rlc5cVA4ZEZJaFFpR1ozWU1lQlRTSTBmUFdPQTc3OE9oRlRhaEpYMGM0TllH?=
 =?utf-8?B?OVhuSjBKTm1yNjJqSWMrWXAxK0xhV25VV3NDZklDdjcreWYrTU92QkZnNFdv?=
 =?utf-8?B?NS9nV0lveVd4dU5lNHVVOGJyM2FjMGpRbmd5N2g1cEFmeXQ1NDZrN04yM204?=
 =?utf-8?B?Vy9IajlpaEZ3WU9pb0kyN00rMnZ6RnMrdmh0WlhZMElZc05jWGtld3A2dnp1?=
 =?utf-8?B?cFZFU3FmSE8va3MvMlROWUZFdEpOTWk5L1hXUGFzZjYwRzNXRnhvcHA2amZr?=
 =?utf-8?B?QU4zYTByRHUwOEdLK2V2bTRqck5KQkgwWlJuQkdqYmgxRGpoYVdYSGlIMG5s?=
 =?utf-8?B?Z0hDZG9jMCtHa3VkQTl6ZlJpVms0dzJSNzFvd21Jc3Fwa1Zrc1R4MkVwdXBo?=
 =?utf-8?B?ZzJacEQrbHZYNVd6Qy9US0lXc0FCYjg2SmczNkNDblN5cDRUZXRTajc0SStx?=
 =?utf-8?B?V1ZYbkppOHJSY2gvV2NpdmxRKzBnZnJXdFFRRHRzM3B2Q2I1MUJZYUxsbitW?=
 =?utf-8?B?QWd1c2YxalFuU2QxT3E4L0NjMU9qNnRlWmlJa3dUb1R4Q1pueno5QlMrV0pl?=
 =?utf-8?B?TkJmNlJsQUx1b0RBQkgwU2FxbTUyL0NWWjhneFExM3JOV2MxYWRubnZhck5s?=
 =?utf-8?B?c0F6NlkxS3JVUkNsNkJhdUdMN1hRZ0FROXdlK002dUdDRnV3d1dtZW5sbk5Q?=
 =?utf-8?B?NlpqYU1mSXEzaFJtdjNLQm8veHJzc2o2ejRWS2k5ZlBNbTZ1TTJVOUtVM25E?=
 =?utf-8?B?M2MxZ1lHRkxjWEFHdGd3OGNlOTJFNFN2cTdKUTByNnJHR1IwaGNuZ0p4T052?=
 =?utf-8?B?SzJNZ0J6MTcxR3l5WjNFTXA1WGYvLzVwcFdSekZGOXFxbENuTEVlcWhBQlNi?=
 =?utf-8?B?U3NvSDE3cUJ3S3grcWp5V1BKYXcvdkxGZzR0K2RteVJZUmdKc0xGTXlMc0tj?=
 =?utf-8?Q?2dIeCN3B2g0=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UmxVVGxOYkV5eXhyMDM3a2ZCK3NFUEM0QURPSHNPN24zYkQ2WGMyQ3FEVjZ2?=
 =?utf-8?B?TE83RjYvckdWNEhXMThKRzZsRFYvOFB5N1RoTXY0UmVFS3A3OVhhUkJrWnR0?=
 =?utf-8?B?WU9ONUNPdU13TGZlWmU1ZStlWGpvekkxY01DSFF0dkNOZmRtSXZmemlUdlhN?=
 =?utf-8?B?RXZGMWVPRmxLMk5EdUJDUlAxT2w3enFRWWQrL2thVWh4SjU4VzdFWVFka2cy?=
 =?utf-8?B?b1NLQmNpS0xKc3Z3bEJZNjRFTi9FTWZZNERibkxOSzJaUm5qbHVxaFRuRjVk?=
 =?utf-8?B?N0xlbUEvd2NTTnAvOFhxTjRwdGpXRFRVTG5SbWgvSldnRUV0TVA4RkpxaGF1?=
 =?utf-8?B?dUJ0MXJqYmdYTGRNaFY5RFRBd1pJYW1rbHBpRXZnSWx2djRMNG14QnNGb3lP?=
 =?utf-8?B?WjhRbmFLMDlhaTFGeDVPMkJqNnNTMmtmMC9laW90SkdrSGVsbDZBVlVuUkpo?=
 =?utf-8?B?UEhseDNuYXkyS2RzVENLbUtodU0vME1PRTlhbFB4Wmx5ODhCQThsS3BCb2Ra?=
 =?utf-8?B?MUhEbEx4YVRDWmpudVRoeEo1aDFOYmNEekxROU1qT2g1OVJlZVMxa25sUVo3?=
 =?utf-8?B?YXZaQUlIS1ZDd3dkK1BkdHlYZzFWMW5HTytOdTF6ZmI1V3pETXpXakt0bTJG?=
 =?utf-8?B?SnRybmVVQzR3Vyt5c3JYSVVPZk1McEREWHF0RUZEdHRWdVFwMmdRalVXRlps?=
 =?utf-8?B?RTN5endSTTdIT2YxaDJEdTdwamR4WnZQeU9IUHdkZmV1bGtuV1FlUVh3YlpF?=
 =?utf-8?B?aU8rV1ZqdTF4K1lrVll6bzdNcy85REN1VnUvaUZTMTVLNmJWaDJKUVFnemxK?=
 =?utf-8?B?NVJoNStGdUNJR1labkFTRFhqNHNaS04xclBua1JlVzM3MmlBZmZpS2dwa2pN?=
 =?utf-8?B?OVBZR0x3aXpYMlRWVjdNcG5wUTRNN1lSa0RCMmVzT2tOck9pOHg0NHora01B?=
 =?utf-8?B?aGlRMkI2dUVYQVpPbjI0c0x2cHJXaHlYRjhiZHB2ZGdmZ1NFVml0MlRQZWhE?=
 =?utf-8?B?TWpvMVl4NWVaUmFrT253VE5PVUdoS252MDdETFVwT1ZZSVJYaWhVdGRpZE42?=
 =?utf-8?B?N2JidWhQTHRCUGdPajNuTjBBanM4MWxqTWhDaFB3cnQrU1JZWE00c2M0NDdG?=
 =?utf-8?B?QldpQW4raTkzREdocEVGSG9sZjVoZ2dROTZjVzg5VjB6WlVZNjdDaVMvMmp0?=
 =?utf-8?B?QXdsSk1YS0ZaWEY4ck1DMmR6WWt4YjFYaXc2aXdmZVlTbmU0OEZxbFF6NWg1?=
 =?utf-8?B?TituWlA1U2ppS2JGUGNiMEhTcEFOWktrNG9aekI3Vm1KblpEWXRWVlYrZnlF?=
 =?utf-8?B?SEYzcjIwWTRySEZ2K1lMcVE0RHJ0aFBhcU5iY1YxSDBESDhTZ2QvNFNTTXFr?=
 =?utf-8?B?Ny9WZXpJZ24wcGVreHdicTZ0cmsrTWlPWUhjei9kcEVwdTlmQjhsVm9rY1N4?=
 =?utf-8?B?dEVIWURhTC8zbkxvbnlmRXd4V0VSSm9IS0ZhMWE4akJXNHk0dmJnMDFvMDcy?=
 =?utf-8?B?bTA1OVljZHQ1aStjcDU0SWdXQ3d2QjBHNFYzT2d2QjZOT2Nyc2F0L1NQSmV4?=
 =?utf-8?B?RmdvL2g0RG85Y3I4eE5NMW0zWVpBc09HejlESVdDaG1obTZGNjJhS3RVM0Z6?=
 =?utf-8?B?Q1JNUUZqU3FJWExHZ2JVaGtyRmREMngxVDVhNk5kVC8vMXY4cmFMSEw0Mm0z?=
 =?utf-8?B?WHU5MmFGaGVSamdTTTEwc2pMd2lNdytPcWRZdUx2ci9td1FzMHh5MEpIVHlY?=
 =?utf-8?B?ZGNna2F6NkVmMWxhY1BkTUhXejBLSFBHRVcxc1R1cGprM2IrNURKY0M2VTZO?=
 =?utf-8?B?cndYUEZrYUdyQkFwL05tb0lpOTduOTZJUktGSDZDSTRRK1FCcnJiS3M3MGtp?=
 =?utf-8?B?YWdlM3U0TjQxWElPRHcyeVJxSE4vMDV4dVlHV3d0ak1ycG15S25NSlBvaWRH?=
 =?utf-8?B?cjFWTXp4endVeWZJdDFna0pXT0xiam8rbkdnZEJUWGJOVEhNcnZJeHNZZ1BM?=
 =?utf-8?B?ZExDNUM0dElTMFNta29jMUludXRaVU81Z2tzRkhHaHJyQ3QwNkJtdGU3NTd1?=
 =?utf-8?B?Mk01ajNFN1lqbVRqSFJydTA0b1FaTlFyK2s4eDE0YTlCV0RNT0c0bkpHdG5S?=
 =?utf-8?Q?7i/iyEErdfX3OBV0l1sUTaxUQ?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	HJs5ynwKCJRHgb+qs4a03X+3Boc/EBY9FsB5jbfE0/xi6UjfeFPDg+tSTFP+tVCeyifT4kVcIqE6fKOIUCWWC5r4QlTc7E8lhfAr0d2FHq2Hwv2IUij3uCcS2w3mSKqcoJ3zOcv5YlIY9vz6Gff3pHfj/Nno4p/hhiOKcyjw26iIDt6OeEqZN2MDSx/iYolXzdQe376t39FOI12wNnnRxl1KmO+QSdDibpxh5SYepUXb1S0GyD6TiTVKUGvsLSWymnFd1M0cBi4Kvy4pgsKIOxPmdXMRao1xz6QY3HOMLHoESzgQybo+OdxGGYulWPuwQKSicwAtHF8YYwkT/X64Cw37N8i91z+sxUBTUPiDEmECT3GDXb++VJ9rGlA7qHjlm3ILK3FXMtqTwdtwbfce3b3yfV5Xl4O4GaMKPV9s4I4pGxHTzoEcb1JScq1shdw7NrWLbkO5FkcLL4kGmro7xpnN2V326kZ2JAsaV8A5Z9/AYZvea6TgEGsoPtSnP7zQDKLKu9fXKxpxeiOo7y5NXJHl0wjN8qHK+uKHwom/Cr43+umMHyS20w9s55lSreGygwAVG0HJI3G2VITuFNBmHlEUY38KumpM4ky9sNi8/BY=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 144f26b6-219d-44c9-94e6-08dde65da118
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2025 18:06:37.0570
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: E+Sqt5I5LU26gUghlixOP860FT6d/nFVafAmfqsWsTppwNWopABy5dGEDlwHhloEJG7D+4gN9/DLoN8wrwGAww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR10MB8067
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-28_04,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 mlxlogscore=999
 mlxscore=0 bulkscore=0 phishscore=0 adultscore=0 spamscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2508110000 definitions=main-2508280151
X-Proofpoint-GUID: pacqjH2gYa4F72Q6SG0S99qz6nP4wFNh
X-Proofpoint-ORIG-GUID: pacqjH2gYa4F72Q6SG0S99qz6nP4wFNh
X-Authority-Analysis: v=2.4 cv=NrLRc9dJ c=1 sm=1 tr=0 ts=68b09ab3 b=1 cx=c_pps
 a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=DKf3fegrGwlM2slrtqkA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 cc=ntf awl=host:13602
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzNSBTYWx0ZWRfX/smnher8pgSZ
 +ckrVZKbZ13xSIhbOdAt4xDZX1LecOVKCTN+L2n+9iVXRvGmbslM5q3R83qF8qIr+fBLBrCpdu1
 yLrBCi740wap65IKYXhtA0ayAnScNtlAbHPl3vSZNYcTjRXr8i5PbqIJYWOpU3foFnuVdi8ENFo
 /gVmlOvDg1qpqHxW7nOvUR0OpqtNUZu/DAbXBtdiv1MZm5ThBjVdcsH057ByoHUG2JWvkPHseoO
 7/8lVYS0tTjhFBzgMZrDFnRMjw3YYgjvgPdNAGKkzH/Up4QqUIyNxL4Ox6qxhbHIbvJOyndNnmi
 kYi0CX8IP1g0Mz3EWNpPtsNRCwFwWw1D6PkKkvAUxCmN2Ir+v73cRpM2NbFbm9MA3FEOO54eO1K
 xImWzAVC+zR2TUrvBNXCoA9n8+tXdg==

This really feels like it should be squashed into the 1/5 patch. How can 
one add a new provider (patch 1/5) without tests?  I understand that the 
philosophy here is to consider the entire patch series at once -- and 
splitting patches can make review easier -- but this really feels like 
part of the 1/5 patch.  To me, at least.

On 8/22/25 14:16, Alan Maguire wrote:
> Signed-off-by: Alan Maguire <alan.maguire@oracle.com>
> ---
>   test/unittest/udp/test.x | 6 +-----
>   1 file changed, 1 insertion(+), 5 deletions(-)
>
> diff --git a/test/unittest/udp/test.x b/test/unittest/udp/test.x
> index d3d7a598..2ff8d675 100755
> --- a/test/unittest/udp/test.x
> +++ b/test/unittest/udp/test.x
> @@ -1,14 +1,10 @@
>   #!/bin/bash
>   #
>   # Oracle Linux DTrace.
> -# Copyright (c) 2017, Oracle and/or its affiliates. All rights reserved.
> +# Copyright (c) 2017, 2025 Oracle and/or its affiliates. All rights reserved.
>   # Licensed under the Universal Permissive License v 1.0 as shown at
>   # http://oss.oracle.com/licenses/upl.
>   
> -if ! check_provider udp; then
> -        echo "Could not load udp provider"
> -        exit 1
> -fi
>   if ! perl -MIO::Socket::IP -e 'exit(0);' 2>/dev/null; then
>   	exit 1
>   fi
