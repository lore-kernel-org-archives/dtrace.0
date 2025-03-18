Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A14C7BE4F
	for <dtrace@lists.linux.dev>; Tue, 18 Mar 2025 01:37:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742261834; cv=fail; b=Lx6Eu9rw4geRXW/q5LfsEbj+PeQxKec6sk+bqcwT/DJB1nvEDKbA3KLLL6iubDzhDe2ZDiZZZHNVr5qggR9yf2cML773hIVHevpyFbmFYOg+JATcNqpmxHi3zM2QrCEXbO2eF72g+otlfzG4p9Klkb6SGLkLBDeMzT/4mEnnNak=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742261834; c=relaxed/simple;
	bh=mof9hNUSCTd8tq6yUaKY7aqZMUuuzd88BtIPpcMjpQs=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=g02SWzNfEefloIXy29agk4IjwdNaocqihLzqDcnbOJP1QBroYmlFJwJo6gN2qppt/3u8BuxFB1P8clVb1nD9uKewKVUjiFaC/1aUVg3coOWb/bBLqUtStJl2nDPKwOiuIpJKhFdfqao3C5Pk8w0+GbhskFxjGUoXekuL+WSwy4s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=i3m/rtZ+; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=rgsxh/Zl; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="i3m/rtZ+";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="rgsxh/Zl"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52HLtvm6026662
	for <dtrace@lists.linux.dev>; Tue, 18 Mar 2025 01:37:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=/IRPfpnZW8pD6UGv83/L3vCom8k4QSh1iEds+EKXONs=; b=
	i3m/rtZ+rzv2W13L7eAaWuNkzRxVGiA16sWt2j/nAtPjrWjDevCEBlKr7eKVxXEQ
	Itqawj1mWRuanuSAcKhLzTX18M308mv8ayNz5KjAq86JFCwR2G+CXoaIbOwBPloh
	5CO7QQ15VQ1ZO49xK7a/uYOvLWrcPVUoyITu1UDAB8ObeS3uSWxnv78EvFyk/WmS
	HYXv5a6BZ2MwxcK1Jov1a0xrHlyiBui5OKEuiSqx93Am107RnklQqE99dn5KLlMB
	NIRlMOkr2cUgh2h7JdwP5H/LirgOIwlOlaHdZHn8B0bkFo4VPKDU+jlWH0lE7Yuu
	virIsl6g+NK/vS2KLRf7nQ==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 45d1m0v5ch-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 18 Mar 2025 01:37:11 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 52HNp2oE008882
	for <dtrace@lists.linux.dev>; Tue, 18 Mar 2025 01:37:10 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2176.outbound.protection.outlook.com [104.47.59.176])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 45dxkxxktu-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 18 Mar 2025 01:37:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P4c266sLKH2jysRfpSakroZGF2RUlkIyWPCS7oxglySQYP7OPPNgnl7YlMiXg36BkT6BkyYnz/G1I9mZYYbyxakdxAVSEb0bCwiXWN8EScVpJTyIChGCeWB77bu6pICX57YCX0edAX0ZyYZfP/M7BadBtyoB1cTyhHqDa/tgBNFBvoX+PHnlovuLw834Ms19catuGIE2uQ3dQBYyNqvI7hxnCZ4UocX+Qcxx4UA9UzkKpQR04NuHci8VEuT/z8QGIlq3I71Xw1vB/xs5focL7KiWr0hVbaRGbFz0iZ/lCK2SRueNLAUCEuBpppdXS6IkVf2NOqhNI/PRYh67Fx5hzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/IRPfpnZW8pD6UGv83/L3vCom8k4QSh1iEds+EKXONs=;
 b=pAKEIZCpC4356mkZVWExlpP1X9eU/oI3mLPP3Pgf6mmPfVo+Z+S+bHc3ylvzxg7kdtttfdR4o4ODWxIP/0rsqCrTM/bH1l/W9dgaH/lcm7XYzBkZHoLfLMPCT6T/0d6vEWNsyJSZgDAPv0narpdnALNN/rNGQM8Tu+q1sza+p9BkFaCQGals4RWcQrFqOyvL7ef3GZ6wc9Z8DMPtSAqJQiIZmqA2fHeVzgctn8T3pl6UlBQDpbJRl17eEQfgiUTM9LV5EiNoK9rHAzL1F/UTzR4X6vW31e25q5S5EFMCvZBHPx18tH/pMTsIDX6H/TsslgfbQho0OIBlb+v8CgBqBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/IRPfpnZW8pD6UGv83/L3vCom8k4QSh1iEds+EKXONs=;
 b=rgsxh/ZlX5D8R2TvcRq/Xbo3W+ixilfQnB6l5Ra6m/yh9cyuGEud4t/TIbGM59Oh29FftmlqssmlEa6bqJIqQ/HN4JZPhpbpW866BopvY/uBlSDp8gj9/KxBm8lter1Q/B+lGpjUz4fFctBM/myX1nMjcd7GIwSg05iqyPBaMgM=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by PH7PR10MB6356.namprd10.prod.outlook.com (2603:10b6:510:1b7::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.33; Tue, 18 Mar
 2025 01:37:02 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%5]) with mapi id 15.20.8534.031; Tue, 18 Mar 2025
 01:37:02 +0000
Message-ID: <8ec65b3f-4b6e-f6ef-fc3b-3a3117f581ab@oracle.com>
Date: Mon, 17 Mar 2025 21:36:56 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 2/2] bpf: fix have_attach_type() detection
Content-Language: en-US
To: Kris Van Hees <kris.van.hees@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
References: <34f1beb7ed7b330dcc9031f23483f546.kris.van.hees@oracle.com>
 <e0f0aafb-d76a-56ee-2e12-36f19da409d1@oracle.com>
 <Z9iEGTtQ5UwxFkKm@oracle.com>
From: Eugene Loh <eugene.loh@oracle.com>
In-Reply-To: <Z9iEGTtQ5UwxFkKm@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BN9PR03CA0487.namprd03.prod.outlook.com
 (2603:10b6:408:130::12) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|PH7PR10MB6356:EE_
X-MS-Office365-Filtering-Correlation-Id: 5e8f9f75-fa3a-4459-ac74-08dd65bd61ce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MTBJZHcyajdUZ09zbVIzM2J5RmsvNzF1NG1vMi9pUUFlUUorVW0xQ3FuYTZL?=
 =?utf-8?B?NmQ1ZTZyN09UMnhzUDljajNhRU9VeWJKOURUdGJsNDRrcU1aNFdrQ09CMkN4?=
 =?utf-8?B?cE93ME5TU3hwR3MxdFB2eXYyYlU0R1VnbERmYmhaTEtObnNrdktvRTlIMFh6?=
 =?utf-8?B?LzhtNnpsZG5kOS9BcThnaGQrZ2tSQytxME1BUEt0SWVyVjZ0NkdmRE9tcjkx?=
 =?utf-8?B?emN2RmFMZVhJdmkxYk1YZEpPaTROUUxRZ2ZJY3lrVTkzTW5QelZtUGdWWGhZ?=
 =?utf-8?B?aGRTWkpMWHVoOUxKa29uaVpiODM2dXAyNHVkWlBucExibjl6eHRrRXF1TnI2?=
 =?utf-8?B?dERlSDFuZ0dRU2dIRENKMTVzU2lkOGRrTFhWUXQ3UjZXSDJUTVpVODRubXZK?=
 =?utf-8?B?QjJqT2RwSzNKbDl6SGxQckpHdWFwZDdSY0VoeklldmNJZ3h0NkJwQ21LRXhE?=
 =?utf-8?B?SlBLS0xtOVJ1YXl5U2tvRjhsOFNtQmlTa2NOakx0Z0JOeWZNalcwT0tDQ05r?=
 =?utf-8?B?bzUyT1BpUDlEa25aZWhyMTFIRmFic3VTS2RPVHBZc0F1bWJyVnZJTVNlWHpo?=
 =?utf-8?B?eEtONGJxZjMvdWRJbHdxVjVZSUFsTFdPQW80amIyNU1qU3FBODljL2xzQ1ow?=
 =?utf-8?B?QTRxdHVOZVpLUXZWRWlFSGNhYmhyQVhkUnlZSFA3bzRDU3lVdDV4UVhRbFE3?=
 =?utf-8?B?czhjc1NEMnp2RjE5NFNseEc1cERTTjdOQVAxcXZWb2dtSzVhQjlVUHNlL3NE?=
 =?utf-8?B?Z3ZyOVN2YUVFcFZYSk5wek1IQkJUejFVYUtGOGhjR2tCWm9ycW1UU25nNDJj?=
 =?utf-8?B?QzNiUzlyemt2aE9qeVZUTkpiL2hkTmgyQ1I2UGk2VUh6RTUvZ0swTTZiNVZD?=
 =?utf-8?B?ZHhYK3BqWVEyd05XTzFCTjdqejVTanV0VWdzNVpYa0I1R2FuVHlpUzhUS3lB?=
 =?utf-8?B?NzhyRElaQUw1Ty9TRDNyUUtHc0Uvc3ZCQW1PMFlEOVV2cS9JSzNxQy9iWExi?=
 =?utf-8?B?U2k1MXZBVjc5STkrSXB5ejVsU2RVTDk4SG0rK3MyNGZSZGV6NHc3V0phSFRa?=
 =?utf-8?B?YTI1RW9EdjgzL2lVSTNGYTVUbjQ3b0ZBL28rNUxjb01UZ1RWTHlrM1diNkFH?=
 =?utf-8?B?M1FodzgrZnZsTlIwK2E4d2tGM1lwclp5SlQxY3RFWEdmTXdzenlJRGoweHdh?=
 =?utf-8?B?N0xkM2Z3UjNPekVaMmpkQTRUMGhWbTlIZGtqdWk4WjJMbER6OUFSUCtkdkVi?=
 =?utf-8?B?U1ZZUnBTVGNVWkxnRmw4eU9BMEcwU3dSKzFOMTFOUGUzRWpRZmlWK2M0ZFE0?=
 =?utf-8?B?VXkwelZERHlFbWcxWEM3RmtIVmVtQlFaOC8wY2loc2FiQ0dOVVpIYVpOaERs?=
 =?utf-8?B?azVxTXprbmJONE0rMktLOWdkUHgrdHdscTVtb0w1MGpFWktJeXljbnRFU1Nu?=
 =?utf-8?B?N0haRnJWVys0cVVKb0FqOXpDZHlmM2N5Z2paQjBDalQrTHJxS0pDeitiQUhm?=
 =?utf-8?B?YlkzYWY2ekxDK1N4UHJLSndhcVliOG5VNEFBSHhQcmxvT1RMVXo5TTNBNmVv?=
 =?utf-8?B?MnJCeDFxbStjR2JjUFFsdEZIUTc0NjlLeFFNSXh3dmlRV0g0OG9aUUVQQWFF?=
 =?utf-8?B?bnBWOWU3aHUzc0ZNY1kwdEZvTlFLN0gyYll0ejF6dHR2aWx5MHFvUlRVOVc5?=
 =?utf-8?B?aG5laDI0NDgyVTUwZ0tIUmxlamxzSGZCL3l3aFk0aXhZNFd3OEE0OUlacmtP?=
 =?utf-8?B?WnUzdlorby9FbUcyTTZGU2Z0ejlCVUpzdWQ5REpLd0VhTk8rTHF2UHFJblN4?=
 =?utf-8?B?cE5YQmdiUXAyY1VkZG1PTGVYU1pTUUk5dkVKdDlzQytJMWhWWHNNZVdzS3Nj?=
 =?utf-8?Q?d7zutshQw1qKN?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bVVlUG9WVTAxaUZkdTlSN3ZOOG5LZmFsNEl3TE5DeUdJWE1DSU13QmpRcGli?=
 =?utf-8?B?bzhaUmJwSnNheUh0VDVpTll6czNIUytXdUgzdTV3MWFNTFFYUE1PK3hqY2JG?=
 =?utf-8?B?MmhaODliODFZdG1mUEJwSW5TK1dSUEs4aktRaDlsMmpqMUQwdEMxRVpvRjgv?=
 =?utf-8?B?czluYkUrTFZ0UUNFdUJnN2ZFOWxpMXBQckpKd3hNSDZnc3YreEhsT3hrdy9z?=
 =?utf-8?B?OGhVTGNmMVcyRlVpdDUrbVBFeWxJNkdiemJQNmJncDFabEtreXh3NmxHNm9X?=
 =?utf-8?B?dkZHanV5aHdEMXdzVWl1N0ZLdkhjd0svOEdtV1VtdjFQN0RaTTRNK2lFbTJE?=
 =?utf-8?B?UVRITCt4QWxhQmo0ZTZTa1BzeitlVDNaS2tDNkJoejJJS2JERVJEY0U3TlVs?=
 =?utf-8?B?ZkUzcTBDKzQ1Vm5adjNydXhielpXYzc0ZXJYR3ZCU2NHMTFOQnVycklldytR?=
 =?utf-8?B?eTZPNUJ4bC9MMExnZWtkZXYrUngrZDJDMG1FL2hja1FaN25Jb0ZMb1NRTUlW?=
 =?utf-8?B?ZG41RTZpMGRKNjdxUDQ3S2kvQmZreFpMZGkrUE5LdVc2QXBvK0YvTkFVcmdI?=
 =?utf-8?B?T0lpb3I1UTdrckYzSVoxSGNBSVdHcS8rc3lkSEgzYlRJV2VNN0dWYTRROW5p?=
 =?utf-8?B?eDh4aHJicTNQSUwxT0J3dk5RbmY3SUY2dTQ5WXRuL3ZGTjlqYWM4MmE5cTg0?=
 =?utf-8?B?MHJLVHo0VkVXNS8vdnQwTUs2OXhuNWFacVVRVVRmNGEvdHlZNUVvVFdxbms0?=
 =?utf-8?B?elZOTVdUb2w1NXN4SEFNY09WVnQ2akROaGQxN3dKMUZ2VWZwN1YwMmZLNjU4?=
 =?utf-8?B?Ym1yYmlqRmFmRnU5Tk1MQm9jVVhVYnA4bzIzazdZRThsUWcxeWhQcnRIRy93?=
 =?utf-8?B?WHZPMHNxQlVsNEQxOEZaUllaYmJLbDFHV1hXQmpzM1lmY3prOU9majB0UkNu?=
 =?utf-8?B?aHY2NTZmVGNLa3NPV0RndWVHSkxNSmluc2JTZ3NsZTZ5dTFraUt0N3RqTyt5?=
 =?utf-8?B?U0JlNGYvTlJTWG9Tak03M3F4UnRMNlZiM1cvenNka2NKZ1FxaW5OcHRFR1FS?=
 =?utf-8?B?QVlnTG1icXFEUWFoTTZmejU4ZEZETGUxMnp1MlRMT0lOUWpJOVFjUXoyZ01S?=
 =?utf-8?B?Wm5HN1hTeHhKNE53aUk4UUlibmlNbU1keVIxMGZkSWEwK1NRQ2RqdEpSWjBq?=
 =?utf-8?B?aUcyOTk2dFpWSFhRb3NqcFJRY1RkRVhaUGl5S1kyTjRXMFo1TkwvMGZVbWVC?=
 =?utf-8?B?YkhYY1E1QWp2OTFpaFRETTFpcDdmYmZiaGRCbmxkTGcyN2x3a0V1N3VMUldw?=
 =?utf-8?B?MTZPWGhSYXlTLzdKYWVKZlRnVWIxSXJLbXF1bVlxSlFvK3FKUWcrSHJLSU42?=
 =?utf-8?B?SVRNalFZNEE4U1NXUWNHN3BoQ2pxNnY1cUhEcXhYb3V4V3A2TytnMEYrMXM4?=
 =?utf-8?B?bnJaUlR0OTFpMEhNRWFzbjVvNW9ZZkZDZjhGWEU1OFBjQ3ZJbHM5eEhvL1Fx?=
 =?utf-8?B?ZWhyT24wS0IxOHhDc0I5OGIwYkZWNEZTTHB4VVdHS2s5UU9zMUV1dTk0TzVN?=
 =?utf-8?B?ZzhpaFBiS1dRbXozT2NlMlpTY0lMU3E3cGVIb0ZCcVdEQWFHZW1zdFJ5OFF2?=
 =?utf-8?B?TkRiTXVDQVVIcWdjZlhkNHFjY3pGNXh5bUFkbWF5VlNUbEdaQU5UL25Bemwz?=
 =?utf-8?B?RDRBVWJSZEYza0ZkczQraC9PNXcrN0czSUMzS1FuTWVZb2tYR1FUTUJGdEpF?=
 =?utf-8?B?QkRFcUdSVzJ1dkM1YUVBVk1vNEVrazNhWHB1MUdYcWlzRGhvQWlmZk8rRUEr?=
 =?utf-8?B?SjA4NlRpRUE3TGdkZk5ydU1JcWsveG1seVRqbTZXeFoycnAxMDQrbXZFZy9M?=
 =?utf-8?B?ZHYwN090SFlFYUNoeHVvM1BsNkNqMk5yS1J3YzlQWmMzN2hRVlJ5NFEvQmU5?=
 =?utf-8?B?ajN3NDNRdzc5UmxOaENoVXlZSldtNzMwd3hQZys4a3FSMnJwRDRDWHV4eWJq?=
 =?utf-8?B?SC9ydlpEaVZoSzh5U2tlaVB1QWluZ3pnSjVnZzgrTlE2MU5Tem9xeUlnVjFO?=
 =?utf-8?B?eEEwekZycUliODVNWi9yaklaWGsrUGlSb2orRHkrMGVCeTZ4KzhIVnBtN2dS?=
 =?utf-8?Q?MHnyLWRI7lDT1QMyZjz10kjo/?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	RhMuYx/fbt/sFqQ5t0CYAZsWUq4sD840NaGyGY1gtITmSscJjB/TNgmh8tVt4F9mozuagDCAuTV4T428pzr6rA8Z+c4lXAhuGgyv6aztAFWNhAKstSpFWlMoXl5TbgDt/5cxnMTGRcCvAv53MRD3zK8muQ2BlZe7/Fyuyn5lWtMPg1JtUVnIq9EFNt8OglIphu7AaK35s6vRzs/jraT19M2k69bHBURJtLjXCu2Y+/K+Nk8OJ/QK6yTOxYYpYLyykCXD7BVGnFG6rbz65rPW8jbSz9bJOzQSpvD3kg7EVceScZ58svjIsdjxm917zIyjER1O5BAR6VT6Ysml5KncK5DMZiS32mHVerWq862+hvjz2F0veGhGK/aVCfSHVPXTlEmPxpdVf8Jsp577noZa3b6KXaVtiTYz7azZGlanlSPuuEmmvWjGEaxAPmujCRwfQfnNeEgmTks7SzpYP3EdrEEwY8RQXq0ZLHuq6FbtIOd5JoGcXDKp0FumvJjCYNdxMuk7MjYFgd5RwEd2Nw07LFpjG/Z0VvLK3xVclXo0hUlkE9ObBmfgERK/NadO84idh2+hRULSWul6xF5zOOX83e0UMSbQprZgDpCREwaYqgc=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e8f9f75-fa3a-4459-ac74-08dd65bd61ce
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2025 01:37:02.3019
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9CkndJbQXsPkb+2Xp8oi2XdAIdixi9Wxwz1nh9oS83zQxpQvvVf4vV5B8C3/LVomG3XmucJ0aoPB4nNoVvLmFg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB6356
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-18_01,2025-03-17_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 suspectscore=0
 malwarescore=0 bulkscore=0 mlxscore=0 spamscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2502280000 definitions=main-2503180009
X-Proofpoint-GUID: DfqzwppeBdKZeNCpHEwSpiD6kmPEeMeW
X-Proofpoint-ORIG-GUID: DfqzwppeBdKZeNCpHEwSpiD6kmPEeMeW

On 3/17/25 16:20, Kris Van Hees wrote:

> On Mon, Mar 17, 2025 at 04:16:01PM -0400, Eugene Loh wrote:
>
>> In what order will patches be applied?  I vote for these two ahead of the
>> 8-patch perf series.
> I really prefer the opposite order, mainly because the performance improvements
> really help with speeding up the testsuite runs.

Maybe it won't matter, but the question is what one is looking for when 
one patch set is in and the other is not.  One choice is that one gets 
bad tests results... but at least they'll be faster.  The other choice 
is that the test results will still be as slow as before, but at least 
they'll be meaningful.  I vote for the latter.  (I guess the other 
question is what platform one is talking about...)  Anyhow, I vote for 
correctness before speed, but maybe we'll only test all patches at once.

