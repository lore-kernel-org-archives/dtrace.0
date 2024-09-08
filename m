Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AAD33FF1
	for <dtrace@lists.linux.dev>; Sun,  8 Sep 2024 16:46:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725813989; cv=fail; b=oNIVgWDMT+UlH0gbZ20NpTmMXmbHrTqbW4S/rkerwqwQlkraryKZ6WIxm6NRG/X8/wKNCWIDRFbihnaVN5Jf9Ajih7D4gFM4oUA0mCAss5SQIVQSq5FR1cnAviKUXyCpUpdZl9z6KZcZsIkUu9ssMxWVqp4DgsBaBoNOS21QA/Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725813989; c=relaxed/simple;
	bh=Shl66UEH1NVhTl3F4Cn6j73knO1Ui51yyBbWcqWn4SU=;
	h=Message-ID:Date:Subject:From:To:References:In-Reply-To:
	 Content-Type:MIME-Version; b=i+vFKUMEb8cQlcmj42NZaVv+sqFTbRnajmYRYUzl64nXIpc7HB29AI854x24NQM6YydehGKzSE9ejuUpdRtqjMPM3doZ1Dy3p58SEdYQEs44idPNm3H5QcxQyKhVMuc3YVamzyPElCYDs4ipttZ9Mc25mmMmlUpo741Rv5bBNkU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=kGJpraC8; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=CLQvMAJX; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="kGJpraC8";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="CLQvMAJX"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4884EwKk003715
	for <dtrace@lists.linux.dev>; Sun, 8 Sep 2024 16:46:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	message-id:date:subject:from:to:references:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=
	corp-2023-11-20; bh=1D0IS/i+DgsXeWYyh/ODRQ/sl9VLCymw+Gakwenh1Fg=; b=
	kGJpraC8t9kQUbhwWTLgScfTcxboOJJHT5Re1h8SU7h1MQm8urTQ0+aB4I9GPSRN
	DvmABJNiu9JTvvu8KXWoKQFZsnYqVgm0sc6fW+4oVx9k41pe0NPQrr8fOphlmQii
	nX0bqJFNf2uj0wubAO5wqeFLDDf7AMj/9tJRXQQ4DBpy56SoRg70z+UTIlVoRlAj
	UDXbJphZB2gVMcAbss7cKrOtctpn57DTLv1DgEPJutHeJNKPZeTPnWHJjVCbcFGK
	G6n0XWq7fwCGaNhujSDa4WawhyuSWL6H2LRIB5jqmHXFBgyA9wSiN3qWI636+5iC
	+1pZGlQuSE0nymXnwIj0Ww==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 41gfct9d1n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Sun, 08 Sep 2024 16:46:26 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 488D1JiD019824
	for <dtrace@lists.linux.dev>; Sun, 8 Sep 2024 16:46:25 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2049.outbound.protection.outlook.com [104.47.70.49])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 41gd9cwhfj-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Sun, 08 Sep 2024 16:46:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ai8ibpEj393mVR4H25b1ObkkSXW2R6rOzjcev+CqxwNkZfJ31gO9kC5t4h63L+q6Z/A3AELLkYnidPq4b+kKu7hxv8GW9pQiy2eep1GRsnKwnuDTH5b4F/7gKZ9DNzirbj2PdZ4IIf0eqn3iKsv2zNYeVtwXlIw/54ZN/4QLRa5mfghzpl+7GcKZFFPsKJMHm3pkGd1GdTJwuigZznxJkd0M79v8JcnBlQu59RSpq4oP901Jxtek28+lyOAAanNGBxZhTEIattYvlhVF36RabGyJujciPFClyGczw2IHljqFyrjzWz8KyufH+sIwhMx1ZYKvjyCPZcW92NfD/FzoJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1D0IS/i+DgsXeWYyh/ODRQ/sl9VLCymw+Gakwenh1Fg=;
 b=fxxFobuxQQ15gub0FMwVwHzZnmCpGb+B/vt0OFq02VCXTzIUrZj3LEIEiyt5j90xIsWhJu/HzNuqMNccIpZKdlluWXuEFIatL6Jphjvcput0GFyEYYDxpgkEvS0yxLOkV1CJw87PFqfnhtWwbxy9+IpCNgvRYLUg+orMEG2t5IeD+ZOmIU02zUakcZj6uB+OqLS8ULHks9j9AU4GrfXl4knTnlzf6NgHtKsgSMeqtqd+2s6qYluRFWqMWzmAZKwpTOClIorGo9X3i3UsWFyGP6uECKI742M3HgNLZn8JPKqzDUdhWhAW+xX6SVqDqq3F8p5QKZDCKGFNJcSUnHLfdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1D0IS/i+DgsXeWYyh/ODRQ/sl9VLCymw+Gakwenh1Fg=;
 b=CLQvMAJX0uzwGzr5vbjH4QZaUjBiBI0oyxCYQBs++b3P8p2CQfeoohv8Lq4ukLs+pzCsnJLkPxMJGBVisVhdAoGKfajAqMD7UWcEJuj0hKTvruEwfo4O96V3Nw8Q+Y232ITNAL/4FZOEYRUCwqlOrSln6zsfTC36kpCRE2kvLlc=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by SA2PR10MB4652.namprd10.prod.outlook.com (2603:10b6:806:110::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.9; Sun, 8 Sep
 2024 16:46:23 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%3]) with mapi id 15.20.7939.010; Sun, 8 Sep 2024
 16:46:23 +0000
Message-ID: <77a3a8ec-8d1d-64a0-330b-f761006ec09a@oracle.com>
Date: Sun, 8 Sep 2024 12:46:20 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v2 03/19] Deprecate enabled probe ID (epid)
Content-Language: en-US
From: Eugene Loh <eugene.loh@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
References: <20240903051643.17203-1-eugene.loh@oracle.com>
 <Ztp3paXrmBIuigSb@oracle.com>
 <536b6eb4-cde5-709d-d93f-1a442a0aa9d1@oracle.com>
In-Reply-To: <536b6eb4-cde5-709d-d93f-1a442a0aa9d1@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BL1PR13CA0390.namprd13.prod.outlook.com
 (2603:10b6:208:2c0::35) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|SA2PR10MB4652:EE_
X-MS-Office365-Filtering-Correlation-Id: 35d4fbdd-3062-4089-c064-08dcd025c5ce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Tmp2cVpWL3FvSW1hSzE5VW4vbm5uVk8vWFo3WWppSFhvNmVIblhsd3hBNTFJ?=
 =?utf-8?B?ZnZMRlVPczZpeURPVEg0d3ZPcTYxa295RVdRWW82Z0NTbXBQa2wwdGkvNEs5?=
 =?utf-8?B?SDRUT29nTUxKN3F6ZURrVHAxU3BTTVhCOTNqa1JCam9WN21ET1VIRHBUdzFL?=
 =?utf-8?B?a3d1OGdqckhKLzZnZmg4U2xpbjkrKzRCUE1ySk9xNGR6VHZYYmpjaUpHcCsw?=
 =?utf-8?B?REw4S1UzTWxlL25UMXNoUEZrZUV0dTRDSVpITkpLdTRNRVRqUGtpVEd1ZEh3?=
 =?utf-8?B?MmwxU0wzVllMenVxeHdYNEZVT3cxek8zTTFtRWVsc25FbDVhRDZzc3pLMUky?=
 =?utf-8?B?bEFQQWp6c3IyclJvQjZGdzB2R2FHa3p2YzlIM2lRUjV0ZnYxTUFwUU9IajR1?=
 =?utf-8?B?L2E4QlFhUFl6RkVZbG40cSs1TGpvUW4xOHI5T0pkeHVDZHMxQTJYVThDT2R5?=
 =?utf-8?B?S0JpWkh3ejdEakpBOWJYeFR2R0ljMVpVYUlxaFN6VGpJVVFZWFZoZktCRnNn?=
 =?utf-8?B?ZXoyV0U4VVlyK1BMclhGTlNHRjJIN2JYR0dvWFM3TVJ6WGR0SHJaU3UxTzRn?=
 =?utf-8?B?S2dCR1hKMXFsTE0xM2pzSVl0ZzZOSGZkazlRQkNrcFpwaEhuTkxoQVpOZk9J?=
 =?utf-8?B?RmxWV0M1KzV3UlR5bWZiMW9YMkZlYStxSWZ6TDkzYkN5ZHh0b3RPQWpuQ25u?=
 =?utf-8?B?K1ZMbHF5M1ZXYXNSZTY4WmtwcHp2TkNSdG5Qa3krYk8wQXdjdWhqeXRNeEJO?=
 =?utf-8?B?QXpHdENDMVZTMC9ER2kzN1MrSEZUcFR1Qk9pYkRmQW1GYk9jVTNvU3hjZlNV?=
 =?utf-8?B?OU9aWGpSQVpCUmUxOUYzSThKZnI3TUVHSTMvRjFxbXdHYzlZem0veWdPTHpC?=
 =?utf-8?B?czljclVpeE9EQ3k4MkJaT3VjelpJZFA5OUFlT0xxOGxjVjVaTlFqUXNmdWdP?=
 =?utf-8?B?M05vc0tVeDhNamw4Z2Z5OENDdnNWd2xFcGYvd2hzKzJZekdKWldoNUlXUU9N?=
 =?utf-8?B?OWFyYjd3MXd5dUcxQ2Zac2VGeE5GVm5qYWorWExpN2xaUFJhSFcwNm14SFlo?=
 =?utf-8?B?Q2UyOFFSWEpDSHVISjhEY0s5aExob3lxRzVGSU05LzdjamxwS05HSUtIc1Bh?=
 =?utf-8?B?MnBtVWtZOStyNDlpQkVTMXpydHBQOFpKNExSbDF4ek90ZXVYd1ZjN0YwbzRH?=
 =?utf-8?B?SU8yV1VSai9qVjFBNnFnaW9sbjVFRTluQjRvUXdGVXBTV1RMVlJGNDBMQldP?=
 =?utf-8?B?Qnprcy9QaU9tUnMxdXJvWHpqY2t5azY0c04rQjU1UGVqRXY2Q1lNL3hIK3hW?=
 =?utf-8?B?U3M2ZExISkRWdElvcGdsSW9ocGU1NHNLdGNVa1lWTFlPSmltNkYyWTJwTFEy?=
 =?utf-8?B?ZVdxWDhKajZ1ZjRVMXZxejd2L3NRMmNiTWEyQUVQSk44QlZhbWY0cCtWc2g0?=
 =?utf-8?B?UGZFMjhmUnlEa0FwQlJKcE04S1hmeFl0V3pnSlMzOUtEeUwwVnFtSUdzL3Ro?=
 =?utf-8?B?eDUwYW0vV001U3FERlBZWDRKQmI5TURyVzJ1K1RMUXNFeVJHcmN1bHJLVmd0?=
 =?utf-8?B?Qm9pMXZRV09NbnJqS0plMUhDVTIzanBQQ3NEUzVNV2NJZktudlhNZnlsZ1Js?=
 =?utf-8?B?eGpYd2FrNUhVVndZY0pNaWhSbC81WXhrbmRlOTZGUnlqcEpiYnIwKzRacE9h?=
 =?utf-8?B?NzlmMG9lSnlOVWU5RE0zS1VMclMrRmtwOTZ5UFhsS3NQRHYxeVQxU2JjL1Yr?=
 =?utf-8?B?Y0ZIRHFJRmNuZm5MSGFqVStKUm9pMUJjRnlTT2tpbWw4OW56dWVDaFYzSnlQ?=
 =?utf-8?B?d0Z3N0t5VHJXZTRZVjA0UT09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?azFJN3ZjZVBPU0wzSHRUTm15Nk5weERKMjcwa3huZ3FCVFZhN0NqWHRDc2cr?=
 =?utf-8?B?NjFtTVNrYTFCSHZ5eGxwZzVuTU85ZGNjY29lSTIwZkVNMVB6S00xcVphK01v?=
 =?utf-8?B?T3prZkJ5WlhZbDY2OCtuZ2hjS2tld0F5c0lmM1laam9qRjNBWDFkdnBteFZH?=
 =?utf-8?B?aC9Ja1Z6eUhiL0UxS0lUeDR4ZDFjR0crOFc3QUJENHRUYkRnYmRoSERVWlRG?=
 =?utf-8?B?UDlOYWJkRG9UZjJST3VQQjdjUm5PMjV3MnpJd25laE8zdzBtSVlJZFpJTTNI?=
 =?utf-8?B?NEsyM1JvVjlJRFlMVW1yYlFibU56TlRWQTBHUW9RWFBDWnJGUkhYZ1NUbzUx?=
 =?utf-8?B?U0ZrZFhaSTM5RFZFdEtnSVdDWUFmNEFIUFdqK1B0dXhsemtXSVQ4Yk1WdVZ1?=
 =?utf-8?B?LzcwdGEwOWhSWWpPVzl1eEs1UWVCc2xWMmdUMDFZaDF0b0tzSjR4UDlVL091?=
 =?utf-8?B?SW9jckRzbytwcWdvQ0crQ091UFdzVGtTcnpONWtxemRnckFCYW9mR09kMUxO?=
 =?utf-8?B?ZnRYU0M4MlE2czUyNENrYUQ5ZnlEQmRkaThKVkNuNVFLWjdjZHVET0ZwaGVT?=
 =?utf-8?B?eDBFcEMyQjBpSVdPQ3g2bS9HdW4wMkFnVHk1ZGNrMDVkK3FJbjQvaDBOYXVI?=
 =?utf-8?B?Rk9tdUQwQ0RHWFBBT3dRZ2dFdVowRzJ1UFZ2M0JNbE1oUlZQajJNOWhwM0Uw?=
 =?utf-8?B?N0dDcjAvRisvYmM3bVpOYzlLN29GRW41dGUwR1VUUGQydDQzOS9HVmI1RWVp?=
 =?utf-8?B?bExBUVVwTm1zbnBNNFV3bUZoNUhHdlV6ODhqSFdHY01uNHA2dFhRcFpWemRD?=
 =?utf-8?B?ZFExQ1dxNlZiN29CNEhWUVJSOVBLKy9BWGNFSnk4a3NxTDhmV1pkRFdxVXJE?=
 =?utf-8?B?LzB2RGh0bDFlUllHRUdjQ1JzRVl5a0RQZGlHODcwTUdFMGdGU0ZzbGdlbDJn?=
 =?utf-8?B?K1lVQVVZRXJYSDNNc3p1MDNvSk16QisvN3VWZEJqNUhCa3ZITFRGbEZIUDho?=
 =?utf-8?B?SXkzNzhBZEIralI5MGF3SDJBaDg4TVN2SE1rQU9uNXdPRmQzSnN2bHdwb2ZZ?=
 =?utf-8?B?WEJPVjMwVzlTNWdOWGEvdVppK0NvdDVXb1plVzVZalB1YWZ5Qnh0YmpWMnNG?=
 =?utf-8?B?d1QwcTZWeEgzQm1HT3BLTCtob2UyemVZRTJFdG5DeWg5S2hOTEVpN05uMWZG?=
 =?utf-8?B?M1kvWTRLQWJmM1RHUENvMnFsKzN6eEl6RkYrN2EyYXJNcmk4a2V5RU1hU3Iz?=
 =?utf-8?B?TXNhd21YK2kwMVhtMzE1Lzc2NDlHMkpITFEvMUw2Z2xJQ1c4bGtVVlRveEN5?=
 =?utf-8?B?eGFna3IySko2eWt3NUlaNjR1NktEeVJzZHJuWm9MZ2NkSFBHSEUwS25WU1FD?=
 =?utf-8?B?V1cybnpIZ2xDUjl5Z3I1aXRuM3FGcElsTVplejZnR2xPelVsa1B4OGlsL0hn?=
 =?utf-8?B?dXpXMDAzK0JLVmMzRVF1c3EvKzlSV2J2bUJmYTY4akw1N0lXSTJoNWF3V3R2?=
 =?utf-8?B?bzJUS0hKNjBCZ0lPTk12ZVRiaVhNUnc0TURHbEVzSUczTWdPYTZFVHN4elFm?=
 =?utf-8?B?TENqTzFwTVpGSUNlZVFLa2RaSWEzMkdYUGwyUmM1bGd1Z3lYa0dOTVQ3VWtr?=
 =?utf-8?B?dTc2ekFIU055S2t5MFk3aVVzeUd6cG9lRVg2Vi90VnBUVUtKL0pWZ3lUT29I?=
 =?utf-8?B?aVdCS3IzVWJqMzl5L2VLZFZQbldOVmZEclMzLzd0VEh1QlF6bGhXVExBdjlW?=
 =?utf-8?B?aUNwWHViYVNRbzNmUGI2bTc1WkdQTncrREh2K2pXQmNVRXRmTWcrSnd5elVj?=
 =?utf-8?B?T2FlZCtwSktzRWErSnRwSGc5VWtaMDJKRmRnYVI3SHY4TVR4aEo5TFdEMFZC?=
 =?utf-8?B?c05yMmVzWVA2Zms0MzNkaGtSamo2OGZYMkdFTDhiVlZlZkJhQXFIbWN3eXdS?=
 =?utf-8?B?ZXBSVGNpaHFmd011bk0rNGV2Z05za3IrZHpxaG5IS0lJTzlGM2NpRkFwcEdG?=
 =?utf-8?B?cDJNdEZIWk1mNTQyNVRhTHRGZ2FSdTgxM2w4bVdYdktZakIzNncyY0dxNmVU?=
 =?utf-8?B?K3dvbkpWNGE3UGo4Q2RmZ3dlS3ZxakIzQlZnRm0rTTljN1lmUmJmaHdhamJm?=
 =?utf-8?Q?h2IKyGcZCqSuqB7hXWKbPFZg7?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	3J4cujxGgT3x6stk3hxpFzsZRnV2sDp0qdIxGsLmKHxuvWoIP1n6bIVp98P8v1SPacCDbBEVUVaq/BK548fsDx5gfT5Dq8mvaWrTbqdCW5wZYAIIszyO0zGd29BFnoN+QkIgkBOycgNQudO6Rmp7TjS5r0KoBotOqDxRAuEscLkT328zCyJp65y87Bqo5tzsozk0xsFfjWDoAir40oXZk836b44xnmdUv/r7yT6dP5EagrR7o/Q4ivonkTs4I+I+wHcDCGwniD2zMTiUa/62CpOEYqVt5Ufa1gCzwjs7csX2RLmdX/Op2NxGvNBySCblaBc6UzPphfDgMxRCQ7dxbn9/LZw2v6lPzsIuxRiB7YKxOAco1LDyxJs+2V1qNdCHfjFNSUlvPuulXVItufxb1ZJaq6sf6J2Amegt5MFEBXY0K4xwO8qxi+9MdCMx4uHjwKhO2CrKeqOUTyz/tb5YghIm+LvCg7hYds6mc9MVawjzz7ZIMX8N9mGHHQdiKwKfEN4mHK0n88w2PTTeLd5JIK/C6A7pO+v8xlI3tymjzneHdHmbF5nBI+qzkwtlYXFPtTkB1+bP9nP1g8XEG4vbWSrWQ+zem2RAa42KBgAAD1s=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 35d4fbdd-3062-4089-c064-08dcd025c5ce
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2024 16:46:23.1370
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XIx7e/8OcYgggiZv39oN3L0ycQVtwMda672jL0tBXSLg6P5+YpNtyVweq4zzg3UajZFcMWCSKXH0d2MiXJnCpw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR10MB4652
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-08_06,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=955 suspectscore=0
 bulkscore=0 mlxscore=0 phishscore=0 malwarescore=0 adultscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2408220000 definitions=main-2409080142
X-Proofpoint-GUID: z_MQBi5GSr9HI5ToVSTd12AvY95HNaWN
X-Proofpoint-ORIG-GUID: z_MQBi5GSr9HI5ToVSTd12AvY95HNaWN

On 9/8/24 12:31, Eugene Loh wrote:

> I'll post a revised patch (and small revisions of two other patches 
> due to the index/id naming change).

Er, I mean, the other two patches had small revisions due to the 
dt_clause_nextid / dt_stmt_nextid naming change.
