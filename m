Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBB621CD15
	for <dtrace@lists.linux.dev>; Thu, 19 Sep 2024 20:39:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726778374; cv=fail; b=iqXipPQj2kHkAx1sU03scAMNI+paLnD6qHvU4N5caTs9rxXiAPzi2tGoF0euJZdrRxM0Hm0Mo0Gmm/5rvYEKnmPkTvj0lNQp6MnGQKDEhy9pz7BzQrzwg9m/DV56cAo+8An04ibjx2HNUWy0D+9YNW1gaaEmM5UGMRhUOEZ4vAg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726778374; c=relaxed/simple;
	bh=ORbpy8b5xhmE5o7kq1nzwthZdm5M+w0OOo8T+p5B2Pk=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=b5yhqXniJsUNOmuL+fjRMRqBY3fEQjNoBzLLESLnvuessHRPxBd0mXMOuSicfMGricwOAk0QhqBAvLF4VLYDyz91Gv+GfBVy1TopS7Of4ymxA2jNVSpqtBYVfC9LxjrEzua6dJvCTwuApNF2s1g/5sJfUs3PGXAxolgHVmeza8g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=i3w4JFb3; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=O8tOxCkh; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="i3w4JFb3";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="O8tOxCkh"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48JJfopk022666
	for <dtrace@lists.linux.dev>; Thu, 19 Sep 2024 20:39:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	message-id:date:subject:to:references:from:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=
	corp-2023-11-20; bh=q6UCzWH9d1RF5tOJevEf8ZMAuDFRkkO4Wfoi8alNJ0k=; b=
	i3w4JFb3kZpZXLf0ekPo88SXkyXz3bXyU46gzoLPH2Ve2OYuvLD/m/ETGZV/1UGR
	XoXu9SN7bcetOxK5VtNJr3CjlqltHM91iKsE2ClGURaD5F15T/IuzzaRDDt+7khd
	ofWwpXSqdpHNoLHOffaz6jFyccIEYWkxW+vc73InfSeHITRXXysxJ3UYmBTUoKaV
	4Bz88sdEG6R5awb+VU9RAp91SXBvEWgsUBIX4ZkjUWuXzWuZqPzQwt35BDpfEzJe
	9v7gqKMW8+jP28kNdlZGPBRHwArvlS1JkNDv4NCFODou4NpzRnUsGfd7cZBT7QSy
	L3ioM6NKVRXr98dTlsKpKw==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 41n3rk4xje-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 19 Sep 2024 20:39:31 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 48JIp3os008353
	for <dtrace@lists.linux.dev>; Thu, 19 Sep 2024 20:39:30 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2177.outbound.protection.outlook.com [104.47.58.177])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 41nyffcqxr-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 19 Sep 2024 20:39:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a2i1dYPqt8PG11yoeYlMQM67UyGBSabtt6J5GR4OxU9TBoKFSe5fQyYEC818OjP6f/UCFa8EieLEJujnIs2MdrEvi2YsN//KKlSfipsrNB6fMB9++ARdA+3ca4pmhjPbzG2fYQholQ4fhVbtv5W+w4B44LcJb2E2tt+8wzPwZHxleFedJxa51mg6aTHvz1RokxpjNyAlZYx5Eq1JV/KtR85HzJuQtJ/nSeJjpixcou9HzY1nr2N/zaz5gc6bWGjKXcMIfjW11zHe3PR6dk6M1ps9K6gkYcTg5A23/OCNympouwrNylI0p38fQxbxgRo5sZgGpQtHvxFH/OcXR0PYfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q6UCzWH9d1RF5tOJevEf8ZMAuDFRkkO4Wfoi8alNJ0k=;
 b=xD7vjB4DqFF358U4JnQrcMktYISs4CiS6pRtRPTrxfheu3ayt8SZACF3QEQcBefsl0XLxY0TFjYJkOG8rXEqPCyZshmerjGQ44n4lpIsxEdo2fUHTueUO33xtcB4hwqSfr77qtrmqA31mDgFRAVMWelFgolEnmsba6F8ZJSwXcrpkDJACFxcBN9Q2dDpj5m/XLpHO8TcHIIDoh2dJFUj/LXsI9DRHS9pM1HcLidlqF0glmdG/YGxyWm7XlQta6a6YuodyqSBVqeQS12i+zKMUWkKKi2FmyR/LgAn7tlG1L5JtfaF18eVlM9CAaLLldS/bVm2+MuXJPilCrl5/jwjQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q6UCzWH9d1RF5tOJevEf8ZMAuDFRkkO4Wfoi8alNJ0k=;
 b=O8tOxCkh0jLxTPVEHj2plKb51tPLh7bYFrC02TMx0XIRn4eeSDD3StocdDt3Sr+z2DEP2W9tumTL3C3qSsg7P1iXzdJDBqKab5jo1p6I93hU6krswgWjD2u06nWkwlTKe47DBNkh/aF08BBQp1Ur3elln9ZjZwFm7O8rKBheJaQ=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by MW6PR10MB7615.namprd10.prod.outlook.com (2603:10b6:303:23f::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.16; Thu, 19 Sep
 2024 20:39:28 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%3]) with mapi id 15.20.7982.012; Thu, 19 Sep 2024
 20:39:28 +0000
Message-ID: <f40cc706-20bd-e0ae-9e08-ba3a450e4b54@oracle.com>
Date: Thu, 19 Sep 2024 16:39:26 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH] options, test: correct bufsize calculations and tests
Content-Language: en-US
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
References: <ZuwfFjKdHQvlxuSU@kvh-deb-bpf.us.oracle.com>
From: Eugene Loh <eugene.loh@oracle.com>
In-Reply-To: <ZuwfFjKdHQvlxuSU@kvh-deb-bpf.us.oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR13CA0141.namprd13.prod.outlook.com
 (2603:10b6:a03:2c6::26) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|MW6PR10MB7615:EE_
X-MS-Office365-Filtering-Correlation-Id: c82ddd61-0e6e-470b-4947-08dcd8eb27f8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YndDYmx2OWpUb2FndDcvdU5HeW1xWnVyNmZFak5MemYyR01OT2pnQVVOVGxU?=
 =?utf-8?B?QkNlVGdXSGl4eWEzYlBNQnVMd3AvWjNTeGpwNDNkbTdFdWlSVkFJazIrS0NQ?=
 =?utf-8?B?V2xhSDkveG5ZRitBTDFTbE1hMldIZVcwWVp5WG53SXVPcUNPbE1FNXdib3JS?=
 =?utf-8?B?a1hYNVpVMVgxVkJRQ0k1aWVQbVNsSnRQeWtiMERHOVdMUm1HYUhTYUo3bDhR?=
 =?utf-8?B?czQwaTM4OXpSZFB1OUN2YVhhNjBGTDVWdnM0Q2JkejM5dTZpdjFYL1pYcTJO?=
 =?utf-8?B?aDRmRjZwcjNtVGljK2hHU3VON3pvOXpaWWlGZUgwa1VMTTlGcjNLN0ZMaFFI?=
 =?utf-8?B?eVRpYnh6d0FqYUxGWlNXbVZCTDlwSSttaFZGSDNnYkFSRVM2ci96bDA2YTFT?=
 =?utf-8?B?ZmFDLzFpd0xhZnV0MGtHY3Z2b0sxRUdldlh2OHYvZm1BS2hkV0JXOTlsZnhV?=
 =?utf-8?B?YTV3dGxlR3NNdFBlTDRWR2RkZGw0QnpjU3ZiR0pRSDYweDMvKzhhdENndjVs?=
 =?utf-8?B?clV1bjl6ZXNyd3VHeVEvVW5EVGorUGt5bVNFUk1pdFlMcllYM3RFWXZ3aVdp?=
 =?utf-8?B?aTZ4TVNmaGlISlk2Rm9BRTJsVERBY1YwOWJmMW0xZnVsWmt3cGptUFVIOGNq?=
 =?utf-8?B?T3hVMW42L2dCVjFTUmFON2Uxd1NYL0d4TndDN3RHS2c2NzhxcE80UmFCS0Fv?=
 =?utf-8?B?eis1dUExYU5EM3RyY1NDQnBNQnVPNG1wa2FSemhZSnhnaElQZ25sVVk0L2Qy?=
 =?utf-8?B?V2VpZ292MDVDTjVkWDQ2WUZYU3VKWFRKUFJkT2xzTmNPMjhiSFIySVIrVEN3?=
 =?utf-8?B?M28xVjkrNyszWCtTVzd0dCsyUDJZWVFTN29TWUo1RDl3c3FEdU93enFiVlc3?=
 =?utf-8?B?aFB6eDJTY3NTUGhKTDl5NXRGd3hJN25kQ05yNWdyV2t3Z0Znblg0WUlTd1Nr?=
 =?utf-8?B?MFdOT3htQWkvU081bDUzZGF4S2VhWFRraWQzU3JjSWFOTEZBV25tYTZJOG1z?=
 =?utf-8?B?eFJQeFFtNDFSK1g5aEF3SGp6emJMUW82QllMTk05V0J2TzhnN0JkRyttQlBI?=
 =?utf-8?B?NzN4TUxUc2JVM2lBQVFwcDJJN0s4WXFpOFN5aGtKQWorYm5UN2pheVVoZGJV?=
 =?utf-8?B?S0pCY1hiYlQyVjMyejBROFNDazlFR3pISjVNR0x2ZTZSaEdUWi9ZdjhTUnpt?=
 =?utf-8?B?NTZzY3gxVTMxZFh3bEw2eWZIeEdGQ3F2THQrbXNacmlLMFU4N0ZyQU82Z2s0?=
 =?utf-8?B?NUdEY20zRXhGMGEzSm9pUmhuaCtkYmpvcW05ZkdVVlU5cCt5RnhYRWlycUVj?=
 =?utf-8?B?bU9WT2E0bmdNK1VUWFBGOU9nbnNxWGdzcmJuVW9BRGdhYVdkeXpUdGFyZkVn?=
 =?utf-8?B?YkYwNlhsOXh2bE9Jd3JKSFFxZGNpTkQvbXF1SGpIUEVPdW15SDZTTUhRWkpJ?=
 =?utf-8?B?RVZHemVGWEFPT09JaVdyeXdsZlk5amxzZmdvQWlFcy83MGNCblFJNkQwN04v?=
 =?utf-8?B?dmhDazgwQXJaU0FKM1BRQnpvb2UzNkgyMXc2SVNBODR3eFZrV2RONXRQMWV4?=
 =?utf-8?B?cnlnRFNib1IvTjhIRTJnRElUakNFZkljUE9TOS9BUDF0SmtlRThBNzNHcHlj?=
 =?utf-8?B?b2Z1M1BzdUpZdVRvbmhrUTI3YUs3ZERMK0hqRG1aS210czNEYVFIL0s0R3pp?=
 =?utf-8?B?VWdxVSsxbjRZYi9aTCtGaWRUMitLdzFjMCtZTFFWYUZOVnJhQnZiTUxxVTYw?=
 =?utf-8?B?RVFGS0tKaW5lZG1ITlYxSVBwQ1AyZ213bmhHTU93NFZSaXVpQXlIUDc4bjFl?=
 =?utf-8?B?V2MrL1lKNnVyRkJZSjVaZz09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Ukt3dnkrUlJRQ0xzL0Q1aTk1djRBaG9Gak1wclRjS1ZQTGtBcENMOHNyNFQ0?=
 =?utf-8?B?b2ZvbXcvbyt3N0xLNjJVT0lBNnNRaUJjQ1lzY2pmOUQrelNzeWtFR1hMTGdH?=
 =?utf-8?B?VElGaENaV1I2eExNSFBOb1dkZ2hQa3h6Y2M0c2NUYjAyZ3RsRWgwbnhmbUQ4?=
 =?utf-8?B?TmhsRS9tUlJsZ1ZrcU5MNFo5VTFncVhvOVJHSTdDN3pFUmVqQVltVHdENDNw?=
 =?utf-8?B?WG03b2IvMk41VVY5WTVBSmFQdU5yRDB1dTRFcjBjcGE1dGc2cytvUk1acTNI?=
 =?utf-8?B?SHZQbDZQQVBNTU95UmMyODJKZ0dhTnJ0T0NJWE1FL3k2eTBOSlJycUNXb0JX?=
 =?utf-8?B?U0p3cUdhL2gySzU4bXdOYklKejBEeU5ZdUE1Y2lkK1FpVG55N3RvWmVGelcx?=
 =?utf-8?B?R3RqMFM2QTFHcVkzQ203ZmoxbFVrN1Z6RklWNDlTZHBzQk9DVGQ0V0MzVzRj?=
 =?utf-8?B?bjVZVFFKR25Lbk5CNGhrN2VodW95dThWSnRqNTRHQTZoWlZnd3Z3c2k1dG1j?=
 =?utf-8?B?WDk4aTJRRUtVU1pubHdKVXhKeGFnbFZsbnNjSENpVkpjQUtPcFlXZUN4Zi9x?=
 =?utf-8?B?Ty83OFoyWk1rbHRRbUgzcWdvUUZCYW5mbGhEYTJsZEFndVQzZGNtemVXTHJu?=
 =?utf-8?B?UTlnbmlmc1lGZjVlNGVLWW50N0tYbGVUdXVvTStNWmo1ZmUyWGJkYXUzYUJp?=
 =?utf-8?B?Q2JVdDhwS21FcjQ4M3l5bXV2dnVnQ3Y4MUlhcVliZUliYlRuR29pOWRJemVB?=
 =?utf-8?B?K2dSNGppZWVNc0ttOWJBRlBoKytFd3RxRGdiVFRIWXJHSms4ZmV1eDZrQ253?=
 =?utf-8?B?am1vOW9hWjQ1MmZtMnIzaG8xaFlLSWpIY25DVjVqRkZNU0VLL1VGZzQwQTVK?=
 =?utf-8?B?dWs1L1g1TmdBNVdoa294eHhXYXdvc2dDa2xabFNncy8xdEZGWmxDd1N0SVRx?=
 =?utf-8?B?bllhcnYzVzVhckRoOFVCUFRRMnBsYXJoWE9qaUFRbS8wVStvZVJhRWhnYUJw?=
 =?utf-8?B?Rlo4aXhTVGtUUkVWZFpVL2paT0o5b1FhcEc4d0xhSlZiTTU3dklPRjV6WlpS?=
 =?utf-8?B?SVlqcmYzdmN1ZDc2b3NwWXBJWTFOK292ZDkzaU5yRWw0VlRZWXlYem1tbUs3?=
 =?utf-8?B?bEdCTWhoZTlyMFFVUzlwOEhXNkVNRUYxaDFLTjJCdmVNbFJTcTZadCtvcmxl?=
 =?utf-8?B?WnJVZEpJM2NHUFBGMFZaOVJEUWI4dWdsK25qZ2hPM0xoUkJSeENvVFFXNG9G?=
 =?utf-8?B?NUMzYmgyRDlFYmNXVkpRNE83MWh4dkdPcStUblF0Y2I5b0RKclRTdEFnMnFw?=
 =?utf-8?B?MlVUd21YMVRiWUlXYUdlejYxbXJVb0crWmtEZ2dBZjJ2L0FHKzlXTGpZTGxj?=
 =?utf-8?B?RElFeXMrZlJLTkgzejhBMFlBNFRTai9jVXIrNVRhcjJ3UzkrWWR2TW1CY1pr?=
 =?utf-8?B?VWJWUVJVZlhCQkJXc284VDRTL2dOQTJxNmNWNzdQOHN3WHZhdktyM0x5WHFL?=
 =?utf-8?B?ekpheklhM2N5aE50YUxhN0lJT2I0a2V6THFzTUpIVGh1M2Z4UEwxeVVrVjd4?=
 =?utf-8?B?a3Nra05vYmRUL3phWmJncGtkUGFZNVJZNGp1d05Ld1hNT0VaK1dJS09ONE1D?=
 =?utf-8?B?ZTlEZkZtb2ZoY0N6QXNZa1JSbnNHcE5NZExla3QyS2ExQXB2TEYzaXlyTEhV?=
 =?utf-8?B?dWtobmo2MkhrRjJ6eVI2MGdCdUdFSTlvVmlLd1VuZGRjN0hTTGhVVm1TcjNt?=
 =?utf-8?B?NDV6cXlmTS9hM1lZS1Azb0tmV1hPekh1NkFrTWFMVUxYOTB3ZFM3aUZDUXVV?=
 =?utf-8?B?L1dPYVpLR2xldHJHYmNLZ0tLc3UxNDJOMjJuNGk1Um8xUUlKWDM1VHUwOHZa?=
 =?utf-8?B?TzdscVRSSHN1M091M1lPZWd3ZHJCT3JqUTNjZUh2LytNa1B4WjBJb1ZiNy9W?=
 =?utf-8?B?K3VGRURFQlhaR05pQmJ6ejlXQVB3WXVSTjNpMVczSExXMVQrdGgwQVc1NWI1?=
 =?utf-8?B?ZzZLcXBLNnpzdnlZQ2VpQnR2NytDWFdwOW8vL1IvdzlNQ3p6ellEdzgvakJJ?=
 =?utf-8?B?Sy9LK0h0MzBXWHI0N2JuVTRsblFjbUd3YVJEeEFTWVJUanBCOXFUdmtBbTJU?=
 =?utf-8?Q?JQ7UvADCkiqxpt/saXpBZ8g89?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	3ejF47PFuvI3t9EUw8XEYLgrobjUTPBkxfFVi9Zdsgnouh7w/BI83C3r0bxc9fKAzQvidVYS8Xk3Rs0gdeujkeL4NzdzaK/Y1hPyJNSsJTavkPKx6N0YTiUvsOGxnDQPXtsgmh82YZOlbnhuJE0SwvFRIxorJvAkXoEByRPmqOYjlZf2p3AE1cJUVxke7EN0vRrPqG2K1PfIRqmZTT43TdhOMl+gwS1upUsmhKd/5Q+7s3bjGG4XZbr17HYxhAnpP1AMIse/NRzXpVOxbPHl8K3RNAeloEhNBlTLPmELPUUXV00p0Cd9f5hjP+G8tuOcYJKVP8/ytviENtlQfhpXH+kFH3UggxSA47U7/A1vY0eKwCvTTKTGaO0R3U7S/ctgpyM7KphhsaPIpDioojRJ1Qu6/hQuMgN+qpJD9zVlMKrqKicL0FiMZFMvyb3L0llRlfgKzQbgCC0hkvZZzCSSFSvqLRTlMwMF4GYbZg0MTW9BXw708B12O7LYkAZr88kFeahG3vB82h8iXVzpmhQT9Gfrhp5vc+YLtsDTDwX34k3Gv5IgB5ZVVgPXZUtxsT76lHwHGhb6QEbo7K7RUkp9nShIVsZw7jX5hSEC4vrmU7U=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c82ddd61-0e6e-470b-4947-08dcd8eb27f8
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2024 20:39:28.0663
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NGx0fAslesLr/UJzOM77u4uNggX9WjE1lumMPqPIpUBMxrLxSp492eNOB1UVRiyC8DWs2b3fDnZDhrwXURmU3g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR10MB7615
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-19_19,2024-09-19_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 mlxlogscore=999
 malwarescore=0 suspectscore=0 mlxscore=0 phishscore=0 bulkscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2408220000 definitions=main-2409190138
X-Proofpoint-ORIG-GUID: eyUfWgOuUiZrfRvnf-I2fgkNaRir-HS_
X-Proofpoint-GUID: eyUfWgOuUiZrfRvnf-I2fgkNaRir-HS_

As we have discussed, I do not see the point of such a check.  We change 
the user-supplied value anyhow;  so why should we check it?  How about 
we come to a decision about what to do about this auto resizing stuff 
(which we've changed since legacy DTrace) before fine-tuning what we're 
checking.  (FWIW, I vote for no resizing.  The user typically has no 
need to specify a size.  If they do, we cannot guess if they want their 
size to be a min, max, or what.)

Also...

On 9/19/24 08:54, Kris Van Hees wrote:
> Reported-by: Eugene Loh <eugene.loh@oracle.com>
> Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
> ---
>   libdtrace/dt_work.c                 |  9 +++------
>   test/unittest/options/tst.b.d       | 19 ++++++++++---------
>   test/unittest/options/tst.bufsize.d | 19 ++++++++++---------
>   3 files changed, 23 insertions(+), 24 deletions(-)

What about the "too low" tests?

> diff --git a/libdtrace/dt_work.c b/libdtrace/dt_work.c
> @@ -268,15 +268,12 @@ dtrace_go(dtrace_hdl_t *dtp, uint_t cflags)
>   	dtrace_getopt(dtp, "bufsize", &size);
>   	if (size == 0 ||
> -	    size < sizeof(struct perf_event_header) + sizeof(uint32_t) +
> -		   dtp->dt_maxreclen)
> +	    size < sizeof(struct perf_event_header) + dtp->dt_maxreclen)
>   		return dt_set_errno(dtp, EDT_BUFTOOSMALL);
>   	if (dt_pebs_init(dtp, size) == -1)
>   		return dt_set_errno(dtp, EDT_NOMEM);

Why does the code special-case "size == 0"?
