Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D85541BF37
	for <dtrace@lists.linux.dev>; Thu,  1 May 2025 15:48:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746114501; cv=fail; b=semvBTD4YqG/yEPhqSBJeKjq8KK6kR/kGg5ZWhIMWhb8KVj3+5wWApf6iwFn7jKinacNLGVSJberu1sddmeyuoiT1hjnqP/rVD25d3mvAOq/n8l2aMxoaDUojByXGDi00CdDGFF/XVEcvTK73prScrJKnvhVzp00nY8yXyRek8Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746114501; c=relaxed/simple;
	bh=GnswYPaoh/K+Zo8zZD2xkC/f/2SSAPcq482zZvxtvJk=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=YqYn7Z2J6V50O6Wi2t92ye52dQq69mB3bgJvvhf35e30kpDHxBzdDs4Y/C+dJjO2gA/5NLCwPfIViMfs+YUpwqJx24gv5f22rg+WfyDhCGvZwEYZn5OAdG8UvuuejKpA2gOp1Ub9QqYEWnzIzX4tbTY8Kzw9AxC8LPGgR+UjS34=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=XdyIyEZ/; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=wmAPct3E; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="XdyIyEZ/";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="wmAPct3E"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 541Ffhr2015183
	for <dtrace@lists.linux.dev>; Thu, 1 May 2025 15:48:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=NglcBouBonpC6V5/w0a9VJXqibcAQ+0l1K5+lY9javY=; b=
	XdyIyEZ/eM1KSYCedfx31UmIWNZoNueFejpgaCV93D28EELMmUcB3fo2wvfomlq2
	wKvfIx4EavcV1jn4/JwBqSO/UUyCZlYnmA8J4G8Ba3oex0NFgA6uFysi+mdVhbxp
	OQ8TeY+4PQvyhe07njtUYIveypMCCmizsceYBpexFNFHZHQnab/EqsjnrLUswnF/
	ydZ/7U9bOeEko7c8jWOEDyEawK5ogFrOWhSXrHrs8Q3kk6Ye1Dt+sO/bWlDF2/xB
	qs1n7MCEPyftjpkFnXggduY6mf06FKxd2mM14kX9Ouo8lVJwFLSFDGozj69/QFtM
	rw0T03FSrKZiUWeKn9T96Q==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46b6uck8sc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 01 May 2025 15:48:17 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 541F4QKQ011315
	for <dtrace@lists.linux.dev>; Thu, 1 May 2025 15:48:16 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2177.outbound.protection.outlook.com [104.47.57.177])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 468nxd6mar-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 01 May 2025 15:48:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XPiuki08H6uoQqE7zJCQEGG8SMKsizTQNy/syUcpPVq3UU0Vrf1hixiDkrRR8FbTEK7NzZMZuC8Qfm22gDxS6q6kJQ6ycmtXnhBfiQ1CCa94eI4ISAMc3eUr4tEmrzc4ex12Ru+FwwhmqjHzRPp0uMThsj7U+K21jSjkF+tTQ89L8i5V997JYisXQFJzsSJ04RYBDvKkxRN49h9J1yzS+r2HlIK15CaOSvTYZ92pVs00nEpSqMgTBX7PTuSeQRMEKllaR/6H+wnDgPEAUuiMy7RdCSgBcDn3Z4bS3M0d6acchhtJ+FYF244ik+ZQg6bovO/wNQQmg517sukbMqxF9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NglcBouBonpC6V5/w0a9VJXqibcAQ+0l1K5+lY9javY=;
 b=GGdI6oTbB9M10ehoqCYu6XLEEf1CA2UJm9GJPmOlXIjrYz5WoKQZm5lKZD8KsZHhMiMuVs4s0i2H7LNnJtix4FYMwfkdH6qHU7Uabe5qk3KmHShSjGzhNf53Up3J0JQWCNryt//mizSpId+RzxJrHk3Er1lC8UlsuUtIOPFtsypXh8aT8jmPwHdAdTY23Jp7no4j7A6dPEocs4bCJ7fT5bokQyXGX1aaIiTDHZs5c7y22gv4ElqjlWwj61c/Lx33bbsXbD+NcIq4Xfw8C4BRl4H1kav8s1805Lk23HY9wfmCP6j6HLdx68O3z11qDfWm0mwngq1kSUFMDKQpb3t3Iw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NglcBouBonpC6V5/w0a9VJXqibcAQ+0l1K5+lY9javY=;
 b=wmAPct3E8PPYWttlFAwp5njcEmOW6cDtd79pS/A/+RsZAKHY2xAXrk+vZJcRnUNAQBfAvGWiZszY4fNEZfWQjTsGAp71A/9UmNw0/Jj0qp7wSCVPH8JQesbGHvsifQiF7GRUTvMPqOEOcs2P2ijZ9AXOnjrOhnjoSwdwPe1tEXQ=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by MN2PR10MB4255.namprd10.prod.outlook.com (2603:10b6:208:1d2::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.20; Thu, 1 May
 2025 15:48:13 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%2]) with mapi id 15.20.8678.028; Thu, 1 May 2025
 15:48:13 +0000
Message-ID: <2e8dc2b8-6b06-c341-282c-d643b06e2b21@oracle.com>
Date: Thu, 1 May 2025 11:48:12 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [DTrace-devel] [PATCH 4/4] dof_parser: remove pointless comment
Content-Language: en-US
To: Kris Van Hees <kris.van.hees@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
References: <SJ5PPF7F7BBD994D8436184B5792303EB77C2822@SJ5PPF7F7BBD994.namprd10.prod.outlook.com>
From: Eugene Loh <eugene.loh@oracle.com>
In-Reply-To: <SJ5PPF7F7BBD994D8436184B5792303EB77C2822@SJ5PPF7F7BBD994.namprd10.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0087.namprd03.prod.outlook.com
 (2603:10b6:a03:331::32) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|MN2PR10MB4255:EE_
X-MS-Office365-Filtering-Correlation-Id: e5ff29a7-8334-478f-cff2-08dd88c794fe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cVlXYVM3eUxVTnBpWFF3cVdPTnBiM2loazh4SmkwdFpKRlpIQllKcFJEcHpv?=
 =?utf-8?B?ekIxREZKeGI0WUhPYyt4aUtPQ3h3dFZWRWxuS0RxUWFJdWNaMDhuam91QVdr?=
 =?utf-8?B?ZmU4QWYyTmI3RnVmVkRlK29WeHl5M21vSlcvWldiRTRPSUVTRmExSnhDcDBw?=
 =?utf-8?B?VEJ5VGY1VmFZNVhvQTZ1Y0dqQWNpR0drOWtqSlpZQnF2RnlRNWhUN2ZmL0VQ?=
 =?utf-8?B?L1BKandQeUdGT1hLbktuWHg2M2xHUGtzZXA5Q1FmdFNGY2VOR0xSMFdDTzhh?=
 =?utf-8?B?aUdiN1FJMmI5OXY2VzU2enpWOCtoVVo4VCtRTEVnWjJJOVdjWUV2SERrdHN5?=
 =?utf-8?B?Z1d3Z09GdlhLSmF0Nzd1RFl6UFlmWXFORjcwVjJrSzlya0c0dlprckZ5MzRP?=
 =?utf-8?B?K1YrWDE5dGRTVkZ3SWpUSm42MG9TbWd6aWRHdzh0U0tVYjk5bWJTTUc1dzNY?=
 =?utf-8?B?VWJ2OEdjRTIzc0NUcWphTk1Ud21YdkFqUzRRcTFHWWtOZWYrU0dOa1NmMHBu?=
 =?utf-8?B?UEZoUFVwNDF0Y3AycERQcmg4bERxSjZ3RUJEZXVDOTljZ1QwVEw0Z1NoblFx?=
 =?utf-8?B?SzRhOGFqWTRld2wzOCtrK2lJaENZMFZCVjY4dG5nbUJvWjl4NjUxczZ0cXov?=
 =?utf-8?B?Z1pBQlY2ci9neGxCQnFqR2E4S2ptT0lCOEpQVWtrbGFDRnpUcGN0SjlMejU5?=
 =?utf-8?B?dkdGNFNsampyQzFaQ0NBVjJaVGc1bTlsT283Wi8wRFpkUDJKcDV2eitWbzdP?=
 =?utf-8?B?K2xMWlFVdk1PWTZKb1dNWlJma25jano5VlNsU2lLN1k3RWhORWtJamNxQzFa?=
 =?utf-8?B?ck9CVDNUdVM2RWpMbDZ3NlRDM2cvMzZDL09tYnpKdXNXM0Nub08zbnprR1dC?=
 =?utf-8?B?MU1sUVZ2aDZ6UmM3Sy9nQnMrbWF3dm50YnZscHRKR21zOGw0a1B5VUxoNnRp?=
 =?utf-8?B?dkYxYlZZbXAwVEZWUkZUS1BtNW1WdlVEc2UyWnZ5OFlZUmNoSTRHMjFudVhM?=
 =?utf-8?B?TzhqV3g2OUFOMEdMbnNaVHRHTE9YL2hOMDMxYWZrc1RPNnoweDVWMjhvTFZU?=
 =?utf-8?B?RVFLcHlXRnYxOWtwbSsxTHNqNHp4YTRvMHJkVENpdFg2bXZXOXl1REMxZE00?=
 =?utf-8?B?S3FjVE9ZU053ckFnekx3dkJFSzMxdU1pcnFlN3JSbXBZSTlaY29FZUlrQ3Jy?=
 =?utf-8?B?WW9xMXFnZUZDL3FsRkNqcDlzbmFET2tHcUIrTWRFTFZGVHI5UjExSXBuOGll?=
 =?utf-8?B?OG9ORHpGbk56QlIxWE1NWXhLQkt3R2NzQ0dsUUNValJWYU5NTWtEbmdpUVJY?=
 =?utf-8?B?NmsycXBkUFRkR1BaeWpZWU53RE41bkhsRFNudnNEYnN4SXJ3c21IRzV0QUFv?=
 =?utf-8?B?UENuOTBOcDl4V2JMa0VITXZ2SGRMVUJSSkltUVc2cVl4eDlyN0VpUnltK2cy?=
 =?utf-8?B?WkRWK2ppOTN6eGVXNTlpMnhiT2d1a0I2emM3ZC9JWWNPVERSWkgwVXhRMWNM?=
 =?utf-8?B?RzF5NENlQW9DVmh6MWFMREJsdlNaQ1JaWkhlM0xlQmZ4OUI2T1hFcE8rV2tn?=
 =?utf-8?B?eEtEelFRVzdTLzA1VjhRN0lSN214UzMySTVTSzQ1RFJUM1FHLzNnQzl3ZlpW?=
 =?utf-8?B?a2FZL1o3OENCL0oyaHFLMUFUV0doSlk1azUzdFNaOHZaSUFDcHA4cWQrdFhH?=
 =?utf-8?B?akZXTDI0TVJlcUtsNUM1RFBUdlFxQ1owMGZGVmZkQzZoSjJ2dGxDMElNbWNl?=
 =?utf-8?B?N01LamZsc3laWHZUcy9HYWRPNkhCOU5lMEJUd3F5V3hXUlZtdE1qYXN5Wllo?=
 =?utf-8?B?eXNFZlVvSEZ5TmhuUXFSNWo3aVZMbnhlc0dZRWx2UlhXT2xrOGYyYUJ5SXR5?=
 =?utf-8?B?a0ZoTTYzNCs4dlV4Rjk4ZUVKdW9Ibmh2K2QxdWpIb3M5cmlvdmJwZjZwSklO?=
 =?utf-8?Q?tJoTlM2ej58=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eFFpa0VtZmpzK0VCUEtIcS9aTGIwS21OQXZVQm5tRi8rRkpqaVNMOUlHdHBT?=
 =?utf-8?B?Y25COGVlWCsyaitXcnFNcFJYNU9iaFZ2ZEtIbUVpbW5VZ3VSL3ZERGk2NFh3?=
 =?utf-8?B?RnhIcXlGckRiQ2ZSTVNVbEJ4ZFZJMis0RDZLQ3ZjTTUycHJkME5aN3I5aDE4?=
 =?utf-8?B?NXpNS0pwMW9LY3ZkZXNiZktnMmFvcW5TZlViTnR0TFArSnR4Z2tkeWpuWFJn?=
 =?utf-8?B?S2dkczZ0dklYWk9lMkhwQjMxUEl6QmlnS2daU0cyNjJEWDg3WXRBVWNrSFh6?=
 =?utf-8?B?ZmdBVzZCZ0ZwdTNqRXNiTTZkb0tsaGMvbW82VFoxUGJOWWxCS0R1S3FkdWEz?=
 =?utf-8?B?Q1hKK1BXTWpVNjdiQndyaVNGbVJMNExBZm1iSmFjb2V1VmxCTHhoQ3Jwb0hj?=
 =?utf-8?B?QnpDNVlxaksvUUpCQTBneHoyaXBxZnB1dnFOUDEzSXdmUkI1MWJmL20xSmVQ?=
 =?utf-8?B?NHlSTEZBSXFPM2kyK3FuUWNZcWVQdWRjd3NwYUI2NFVRYm1BQVo5d1hqcjJi?=
 =?utf-8?B?c2I1VkcyeXVyM09hNG5xeUdXNE1RaW5ua3FheUd4UjFkVk42K3dFSTU2N1Z4?=
 =?utf-8?B?Y2VWK0FRNllJWFdCOCsxWGpzN3V3clM3U3VpUHc5WHJpcEhUZkdPOFVvOGVQ?=
 =?utf-8?B?TGNvN3A4STIxVjhDdVMzeEdPZjBBVWFMVVRHQmFxSWlGTFNxZTIwZzRXWG03?=
 =?utf-8?B?RE1URVM1WllSbnVJWG5TaU02TjJiTUNvdm04dmdYY3NuM09EYitObEgvS08x?=
 =?utf-8?B?ZEYwdFMzSGZzODIzM1NvV0JxK25xalBjeGtjcnozd2lWZ0U4YkdHWlVVemFX?=
 =?utf-8?B?UEVFNWZxMHF6aGFNL08wcFo3dXR3eitNN25ZMXFYSktFVTY0MjBvbmZIQlNZ?=
 =?utf-8?B?bkZhZWFmN2YyRUlFbUJJNGRiR3pvK3lVZWxxSllqTUhIUGpZRFVCS3NKYjBE?=
 =?utf-8?B?YnFqOW9HZmdZekoyZDR1WUFxTUJRMHVJU2xnLy9OUStTb3ByK2RhRFhmRmpo?=
 =?utf-8?B?ZlFWZE45MkIrSk1sTnVFczRKWStmOXpWZVRLcHlONjBKTGJEc0VlK1VGODM0?=
 =?utf-8?B?NlhjaTRNenN1VUZyRFp3c0dYaUpEa1FoZUxJYzRCRk5MeXRZU0hISGRjZnBM?=
 =?utf-8?B?L0p5d093SUM1YWlNc3dTZ2pkb09jcEErV2VuYnFQN2UyQmFnR1VRcDhQOGhI?=
 =?utf-8?B?V1VzcGhMNWtpei95d21HVXNxV3A4V0hOZ2lrWlJucXRJZDZkMkVTd1VBV1I0?=
 =?utf-8?B?cXVpenZBOFZMbVBvM29zQ0pNSFdwV1JVa3BKZW1RU1E1RFN1RFBjV3pOTUwx?=
 =?utf-8?B?ZVVwZFdyVy9Ra1MyRmtTYm5ZUi9xWlI4d2liMFdyMERML2haZjM3SFJndWRR?=
 =?utf-8?B?a0kwTmQ5UE9UMTR5TjAyMlNsa0syZTY0ZkcvcFlUbUQzM2JzSXRkQlRGQjdN?=
 =?utf-8?B?ZEVNSWFGYWVEQjhwZzUzbXFMSnlrMlRQVnRvQmZJU3VqbzVUVlhuTTFURTl3?=
 =?utf-8?B?aTh3MDA0cGx5V3JURTVzcnVxT21FcnJBVjBDM3BxU1lXS3NPNHVoOFRyeG5H?=
 =?utf-8?B?dUloMFhtSnlvUXFHKytDSFlIR2JYdVRiTHNXMkFQNnpVb2NCcWMvRTh4TWNh?=
 =?utf-8?B?dkxTeWJVMlBjS0ZBa2FjalNNR1ZmRkZxNU1mRTNCdzBFMlJPVXNtNm00OXhk?=
 =?utf-8?B?QWVBZ3BlV1hOSzQvYnBZTXdkemU3VkQ0RGdoQ25uUFZQTUkwMTdqTVNSVUlW?=
 =?utf-8?B?MU5WMDVETDBUbFIxQ1EwRWpMd0RaZ0pLek5iZ1YvRC9scUFRNzg2LzRBVGU0?=
 =?utf-8?B?VytnTngyczhpMXk1MXd6dlpSa1FyZnpyNHdHblk1K25BTGNlcEtFRVN0Z2d0?=
 =?utf-8?B?S0g2a3FsWis3eU5Cb3k4NGJpU1VNejZCSncrYzdFZFhlbDlSVUxnZ1lTVTlD?=
 =?utf-8?B?bmY3UmZyN2Z6U0c2TEtQbjIvN3NmM2hoa29US2svRE5QWURmSnpNdFFxZEly?=
 =?utf-8?B?Ynk3dXdYSEphWmV3Y0pMbnF1SnJLVlNVY2E4d2N1cEg5bUhJNGZRQ2xGdlhC?=
 =?utf-8?B?QzlVOXROenFMNDQ3SDlnRzRRYy9TaHVBV2E2ZUhsQThoZ01FMXlrVHZsdXVB?=
 =?utf-8?Q?NsZgTwPGtm4KAb0Tw3V7QXAh/?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	alJL/DeXrJZ2xh75orbwXu3wRX1tSMWnmKRmgfsBx0oJDJKC9hygzTcVhgsFzRAffz1JiOfpSdvFdc2iu4qGZiciMVrjfYKWU/fqJbsmJ8aslJFgQNOsfGhW7ebCL2qCuj+9H315snhNgE/chcEjgumBOGm7LH/+jOyZdW/6QbNCgS549f7ZInNf1raxhf9h22VVvqJE4dPPTwEvGOHi98PxDe2b7XInKp6ogfBTQHs7rqBz1BWl77rRuDS+wTCtxDvcqEx7HMbxCVxFeuGpDDjAbI004A+nIDh5sEuWVToRYIC/5f3jMxZgsQ2AkF3QMkO8CxMECFvqv9BCgd8fz+VHONQVeG0jkMpwD7MnUo7QV0jOBZg0qhzrp7DkrD0nEKoavdga9TktFJUbk7tiOtaOc74B9haW9t/39b1J3wf3Ru7u1Ys57W6PcbIoHbox6CiTWpKhHANM/sXxnW+YMRcMAAUz66+EbgEsItKZRr7Y/vLv6qSeFHaA8pZTDG4yIgKbuPgCRkXxMF+HRorroW9XqrqjWCjR3bLxA8bev6QFpjnQLX0+SLehuqj3HgQZvyfqyvrAOocRK3q7YRzTdK4aQwDLWN5rK8ZWXuvodTg=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e5ff29a7-8334-478f-cff2-08dd88c794fe
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 May 2025 15:48:13.7580
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZOWgDa0tSCJV9v+BLEpYEIQA7hg5fTah6wq8sRKqDpullg2BBdG0QgdyT40vKtHCsiFyJ7dwojkvekdZYZC45A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR10MB4255
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-01_05,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 malwarescore=0
 suspectscore=0 adultscore=0 phishscore=0 mlxscore=0 bulkscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2504070000 definitions=main-2505010119
X-Authority-Analysis: v=2.4 cv=ZsHtK87G c=1 sm=1 tr=0 ts=681397c1 cx=c_pps a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=fgKHOmpBLfM5eVU91YQA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: ibaFPQHlYj8Sl0VpSp3jOXV5YD0vKp5t
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTAxMDExOSBTYWx0ZWRfX3UGJNnW2ByK4 B3AZIcgPlzojs+J5zd3BtDdnOamtY6U1oCmUzg3zFbrO2uBewwC/wZoTZ4lvTxBDijgaIFjEmsu g9C6fOCwq1AOygImr8t9Qhn/Wh1jjdcYCySheLpLlksNftP9MBSNRDUL7Q9U7yrsnrPfaiRqxyu
 u+lflfdvXfO3Bf7DOZDofGFFpqGRjDKcUh4Yy3UGFtENT3/Sx9s4zYQl9fJwg/Eg0hnsdf/Nvl2 TIpapjGgcJlPOFWRTHQCCSYISMkpcNhEN/q9LFV+U8jsNUpOjwNGe3BpyTI3E5LQdmKwVz+UtQA YqFlMxEpzBOJYMBDdk8diCvf4qIK4rZvUiTMZMqLRM0y+q5wVt+iiEkmPSx1nvPm8CPeb7wYmiM
 5I903hUV7uCbmpITljyLJN3twK3sDP9EkGAF8K+ah/MOpuiAadLTdU4gqJ6hK6qqeI+F8Hco
X-Proofpoint-GUID: ibaFPQHlYj8Sl0VpSp3jOXV5YD0vKp5t

Reviewed-by: Eugene Loh <eugene.loh@oracle.com>

On 5/1/25 11:08, Kris Van Hees via DTrace-devel wrote:
> Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
> ---
>   libcommon/dof_parser.c | 3 ---
>   1 file changed, 3 deletions(-)
>
> diff --git a/libcommon/dof_parser.c b/libcommon/dof_parser.c
> index 5b3dde36..58bbd604 100644
> --- a/libcommon/dof_parser.c
> +++ b/libcommon/dof_parser.c
> @@ -89,9 +89,6 @@ dof_copyin_helper(int in, int out, int *ok)
>   	dof_helper_t *dh;
>   	size_t i;
>   
> -	/*
> -	 * First get the header, which gives the size of everything else.
> -	 */
>   	dh = malloc(sizeof(dof_helper_t));
>   	if (!dh)
>   		abort();
