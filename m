Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1DD0213E6D
	for <dtrace@lists.linux.dev>; Tue, 22 Jul 2025 21:53:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753221209; cv=fail; b=NEmKlCbKO+0nn256wtj340gdFFI63BDg60lj5/KMG0hFoSBOT9RvQd3L1MKPqSWXy2tGgP9lzbhAA5hq5baNr7LsB1rwJL4yYTIcDFR04U+9SIQQFc4Z+388V6rn8u2PlRekECvAmoxLUsX08SqBQMPj/NvBIxNpoUlBef1MDbM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753221209; c=relaxed/simple;
	bh=x3ETu68dUmpeJxp4H1bM4AM2Br4sQJDHtvcPcpGdkKA=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=ONseNnILdDceXLrtB8GE9LMt0ARNTTrCn7DYBxcM2vi2fI407nC4lbcCPdQq7F5bpqEtni8WJMGoElMMdezTZr3i09wrv2x2VSRypuaO0E2gktKMCOPF5f4ZjNbixpiqkyKXVKR7xbJRMeekN0b4bJMQftKZJGqPs4R8wzNcspA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=AXQqVG40; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=OSLX5lA0; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="AXQqVG40";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="OSLX5lA0"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56MLDorR012020
	for <dtrace@lists.linux.dev>; Tue, 22 Jul 2025 21:53:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=md0kSwnDtT4BhNWgnlUMaZV0QHTOxKXs0vgX0NkXmS8=; b=
	AXQqVG40GmPHl/NXXho09hHUpTgEhNYk5Q/0+CPV/Q3mFzBHNm+0dH8JIRpmBwic
	dAvrO5RL4RQQzyopln4k1rNYubu8PK3cHV/KVWRUfi/ubJ8b/ktQP0/2byJNKN/a
	NHuHIyAUpV6TmsJmUNPrFVT5OA0+fHy/tpjfVLL5wAR0xx0Uyss+RZr7mty6sake
	xJqzqelUE7uXP4+OW9BWsbZHUMiQqDukTeK7+oUIXwniBsrQI7TSCCcK1i1fD1wG
	p9mI6gtYitYZpp4zv322C3xugdfoSq1awm+JoVh3UE9W14xIMZekaTof+G1zchyS
	iwTlele4NGQ9njLTXo8ZdA==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4805e9pd4a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 22 Jul 2025 21:53:26 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 56MKVoh8005774
	for <dtrace@lists.linux.dev>; Tue, 22 Jul 2025 21:53:26 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10on2076.outbound.protection.outlook.com [40.107.92.76])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4801t9v0p1-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 22 Jul 2025 21:53:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GHRAxxJ8lTawdze/WvnGpMlAJnlSkYSq6M6SDyBJ8n1Ne4y8wQW49PJNWMLYdWRqP872BGGU1kEpbvCeD769s0LkORQQLdl9W1UrTG3Pq1fYuzsMOI5HDglOFP4u2QnVxzkjVQzrfZ/IIDAf+dHGN8Ll4fSgSVyKzor5gWCFhhQZknY7WZjWT2tSZEbBvlLTFxd8pLlxi6Y9KVtsLuS2hued8GE+Q7YWaVGuE1+gnYRenUL1+pZsyCjC6FFu8t05LN4dwsD1u3DI+74VVdfbx2fa6GvHlDGwWxeR6aVerPPrGs32/KqryxVDdXruCFgl3dNTNCJZtRwVhC1fW+8VBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=md0kSwnDtT4BhNWgnlUMaZV0QHTOxKXs0vgX0NkXmS8=;
 b=AR09exHOmHWBdR9d/ZjXSs8jA4j4FMzDgshvH2ulZ5OARc2/E3nkw7ASe6xwyysgJKAhrcqsnmE4jwk5X3EbQpplpm4OqOZJmvXTBxYeKSCKmSvFp8gPgU0GauONtfKmIQQdno5u5cFEDpzlqW2IlHL4f7OzQDFX8yqPSo6mdWGnwChERxca6G9wM/EM2ZRkzwvpGO7xtCIEK3mVKm0MwoMqVXbpRpsUWJxKH7MGL4MrKUMKnkMt/3IwE4+T4hIC+eC3EA18ARObkv7jdkOeKVAU00ypGfM3hDn60iKOqnXMrCs+G6ZZaGIt1LKL2riM/OitPp0bqHJJS7yIfWZDxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=md0kSwnDtT4BhNWgnlUMaZV0QHTOxKXs0vgX0NkXmS8=;
 b=OSLX5lA081enp6p8aCmQCBoO9XdcH13QwjtWCMyByLeLe7cIlqKxi6VtVfQLCl+ssAi0gZOBW5y4U0XOfbYPiRRhkkWoXO8Aqm/zCxu60r/Q0oQx6cQJbzgoWWw3UmYPioKncC/Qg3qWXwbcV7qn5vA2lYzFZ2T+LCsN/x8E4mU=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by PH7PR10MB7765.namprd10.prod.outlook.com (2603:10b6:510:308::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.28; Tue, 22 Jul
 2025 21:53:23 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%6]) with mapi id 15.20.8964.019; Tue, 22 Jul 2025
 21:53:23 +0000
Message-ID: <bef5e27a-f885-4a76-d430-a3421448f435@oracle.com>
Date: Tue, 22 Jul 2025 17:53:20 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 3/4] test: Update some char-array results files
Content-Language: en-US
To: Nick Alcock <nick.alcock@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
References: <20250325222521.15224-1-eugene.loh@oracle.com>
 <20250325222521.15224-3-eugene.loh@oracle.com> <87wm8072q6.fsf@esperi.org.uk>
From: Eugene Loh <eugene.loh@oracle.com>
In-Reply-To: <87wm8072q6.fsf@esperi.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PH5P222CA0005.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:510:34b::16) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|PH7PR10MB7765:EE_
X-MS-Office365-Filtering-Correlation-Id: 6d1e6332-51f9-4ede-e39a-08ddc96a2dd1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?d3YzMU52bVAweGg4ZGNreGtyUUxaTUV6NEEvbVdhbXdGS1ZWd3RWdjZMZ1FB?=
 =?utf-8?B?UmhBVVdYSDRRdTFrUitieWdMRGh0aWlaTGZ2TXVTdFRZazh1K2NzbnR6Rjdj?=
 =?utf-8?B?akl1OEg5R3hiSnpTU3pVOE9ZTHBTaW92SmhtUGZpeGdEVGQwd1RXZkxUYWxC?=
 =?utf-8?B?d1dZT0QyK2kwVFY4aUFVczVFTlVyS0NhYnNnTmxRRVVGcmhZenNOV1NuTlR0?=
 =?utf-8?B?SkJZR3JDdjZNRldjU2lUOS9xTVR2Vy9xdXozMmhOTlFDVHZIcXhJR0xOYjVO?=
 =?utf-8?B?QitYM1lVMVRoS1hKMkloaGQ3bEZEbENXMXpndFJrempaWVlRMnRqSXN6UCta?=
 =?utf-8?B?Wjh5TWo1c3FiSUdUdEUxdjc2cjJFQXZLVUUwMXVXaUFLNFBUa1RWMXZyVjY5?=
 =?utf-8?B?MEZlczRqMG9DYU10bWx6R1ErcjBxS3MvRFVtSHNJTHNtOXFSdHIveGZSWWlL?=
 =?utf-8?B?bWFjdkhCeGFGYUFsUFp5YW1lQ0tMOW12UFBMSXZyWGkzYTdIb3dGS2gxdmxH?=
 =?utf-8?B?NUlsN0lJVWJ4WTFPanhyRU91ODZNQ3JRVGpPemsySFhFUzNuTDRPeWFFcjdv?=
 =?utf-8?B?dU1qWllHdTNaV2VYdkdTV25MVklFUXcwT3FlemV5Tzk2Yyt3Z0VxQTBJdWkr?=
 =?utf-8?B?eC9lTlRZcmhnSEJ6N0dvWFlNUzdiYzZyT2k2RXZnS0N4VG9vcUsyY1d1Nm4x?=
 =?utf-8?B?ODRESlhVdnlnUmJFenFKOW1VZzhMOVBYOWkrZmpJSFF1M05nb3B5WlRoUFIx?=
 =?utf-8?B?U2lsYldaYzNwNlpOWmRRWWQxQnllaldUL2xhWk5zMGdQdnF5T2VzbVhRWThU?=
 =?utf-8?B?UlFMeVZmR25KTmdkVG5uY2VnZURZTE1hV0luYWs5bnEyN2hBZ0hYU0FPOCsw?=
 =?utf-8?B?NjQrUmdPblUyUVhINUZpbWpSbjBiSXRjWC8vZFhoVG16cVJTZzdPcXRSMnF0?=
 =?utf-8?B?eWJWdEQwcFVMMVpRVk9uWEQ5WktGZWFqMGRBVDBYUzRKRWRjeHFJS1hySTRQ?=
 =?utf-8?B?cnlhckZ5RjYrOHJOZGRZaWVpUmRJMmZKK1JZeExXUEdXU3JIRWpjNkxEb1NR?=
 =?utf-8?B?c0R1WWJIRVZqK0VHaWRZSkpLU0MxcUVZcG81OUJVMm1OUDZHd1FlaTZZY3lo?=
 =?utf-8?B?ckFGdUxha2hXT0lIaXRxb2l1bGFlZThTc210bm1hbEFrU0ZQUGd0MmJtUUkx?=
 =?utf-8?B?cTRhNVdoaE1SQ2lpbndleUdmc3pKdVZoODMvRlNmSmtYWUQweFhjZmVkL2w4?=
 =?utf-8?B?Q1cxcWs1ekdYdlIxemJSbVJSNldwUTVORHNDWFJIcGdpUCtjKzFMRjlzd1Fa?=
 =?utf-8?B?UXp1OUxEaDFhaUZGNVdhZUFUWVROUGJOS0NXaDJUWldkaXZMd09KVTFvRklh?=
 =?utf-8?B?TER2WWR6S08xUUhNTGZXTUdpcnNSTU5BbmFtN0RjUGc4UUdxYktleFFTa1RN?=
 =?utf-8?B?SmNlbUxFeGR2T1JzSkZIYU1KRWl3dFRaRDl2andPaGdEa3RBeUg3NDVtdndF?=
 =?utf-8?B?V0FUUVRWWTBsVHVOWVdSL0dySHRDaTZjOUN3M2g5R3c5OVVNNUtXV2k1bGNX?=
 =?utf-8?B?MnZyd01ubnBGS2k4NDhVTUtxcmRXb05FUVFBakRaOEZ1ajZCVVBnTjFoTmdC?=
 =?utf-8?B?WTJNaGxxNjIxV1M1clRka2NOK3dpakY3dmVxQTgrUW5vWklTZU1PUGhDeWlC?=
 =?utf-8?B?VkZCeWEzdEVyZWNxWGZIK29wOWtjYzlzVklBM1dMUXJFcEgwQ0pLNHpJcGo3?=
 =?utf-8?B?MFlwMmtIbmpIMGllbHcwQmNtWGhzaFdYSzF3eHhlNzFvMElzYzU3SnhGWGVB?=
 =?utf-8?B?Z0VRM0V5YVdhbEQ1WDVVWDdKcVhPZGVpa1JDNmNFNFNpQ3lwRlN0NXdXZnFx?=
 =?utf-8?B?SHBRYlR6RFZ4SVRVUExvbld3VStXWmZVNFJ0Qlk2ZUVxSFVGRjU1STQ1aHBJ?=
 =?utf-8?Q?afq4xQ6qW3M=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NndKcm9GSmkzWCtJNU90ZWV5QWsrWnQ0UHAwNUJQaGttT1J3UnVaMitmN0M1?=
 =?utf-8?B?NnE0WGZJaFNBTGJkUTBXdG1ZelNHUENvNncxUHI2NHhqeVdsZGhROEkzYXV5?=
 =?utf-8?B?Vy9YZGJ0bWVtNzR2SDJESGprMEJQK1NxbytMRTNxN1ZCRG5VajM4dmF0UDI4?=
 =?utf-8?B?T242cE92Ui9RaWFkbUFrOVBEaWVIcDlKRlo5WkN1ZERHUUlUZTdUaS9MNlF6?=
 =?utf-8?B?Z3NjRy9pa2RiWVRvU0M3bHIwVTRPaUJMMTdOKzNIbjVPcVhnSW1OUEpORjBj?=
 =?utf-8?B?bWQzR2haLy81bmdtb0tLRkd6WlRRM1pFRjVkZHNUaHBwR1pKOVNFeldac0Qz?=
 =?utf-8?B?VUtqRXhkQmc5Nit2Q2pZbjFobStHWmFiY1VlMFA4UVFrNWlWd0tKOG9DRGVh?=
 =?utf-8?B?azJuUXhMWmZnOE5sSzFuYXZMSnNSbTcyMVgrc1RzMStSb3lFT05tYjlBeFdq?=
 =?utf-8?B?MXNSSzh6UGU1S01aZFRUTkpWb1NRcWo4dERaYit5ZXgrOUdVaXB1YzRuV1Q5?=
 =?utf-8?B?ajdZN3l1Ni8xaFovZlhQU2hnSWlhN3poNTJRbzQ4SGdXdUN6NTNLZFU2M09N?=
 =?utf-8?B?SnY2OVpuSmZLdzYvTWVjQVFvT2J3MjRIdzI3L3o0OU5NaDdyeTJtVkx0MFA2?=
 =?utf-8?B?bnBwaGcyeVhCMVRzSmkrUTcwejZ2ci9ZWW1JY3Z6cktMU09VVGordWVNdWlB?=
 =?utf-8?B?VnVJMkRnSUlvUFpZd25Qelc3VHBva1VUTlUxYjBydW1zOTdFSHFtWnJLZ0p5?=
 =?utf-8?B?QW5HdlVkeitzSTRPTWtsclV6dk1TdFZXSlE1RDJhb3dEeXNIK241amZpcUpT?=
 =?utf-8?B?Q3FUZUZ5ckxXa0oxcHVyQkZQVEFTRXZWQXhGU3VoYnZ2M0tMRkhwd2ZzcDhY?=
 =?utf-8?B?TmRDUUFOZWE3bEpHK1hGczEwQ21DUmJTUVRsaVdCZ0dyb29vZ25aN0ovVFEy?=
 =?utf-8?B?RFJ6VlJzYWhaTkkwdTJ1SzdGaTR5aW5uQ2I0SjhGS21QeG5sNEZ3QlFvQlNn?=
 =?utf-8?B?QTE1bXQwZ0tuVTZIRGN3YlJaMmhwdU5GTzBKOUxrdG1XSkl0bUlQWmpBTmJW?=
 =?utf-8?B?RGxiZzI3RmpPZW5mN0lvYnJUWU1zSjA3cVE3b2FDMldMaXBBeVd0QWVlRUMz?=
 =?utf-8?B?Yk5GQk9kTmRDV1JKa0ZkZ2JKa0huRVBCSVlsWHE0OU41UlQvZEZwTkxtWVBu?=
 =?utf-8?B?bmd1MGZNbFZsSndacy92UjRZY2tlNWtSeno1aS9zRjdiM1B4bU9ERFZFWm94?=
 =?utf-8?B?anpoMzNXSU9DbkdyMGd1d1VwWVJwNGY1VGFSam42eHVDMmxyTW1rNHpvVVl3?=
 =?utf-8?B?anFMYUJ2RE5qOXJJTmNKUU81NVFlb1pqdjZyZzNUc1lpZzg0L3lZTGJkOW1X?=
 =?utf-8?B?dkIyL2NKTjZtUXRIUVNsVHhGSDZUdmlQMnp1TjF2MnQ2ZmJUeU1zOGtJcTcx?=
 =?utf-8?B?N3VvWGU1Znpja0w4enhCNncrZWRScnhDdlpzTVdCMXFRSTIzVnk0NHc0WHA1?=
 =?utf-8?B?Ym1YQnFpeDF3QkZJL2MvK05tMm9RMDRLdW80MWdCS3ExK1grcU55cmdmdk1K?=
 =?utf-8?B?Nk1pc3NrT0xqRTdER0QyYmZaOWxUdTVPYW53Smg4VGFGMWtQWkVNWTdEaEpn?=
 =?utf-8?B?ZExhNCtXNkxQTDB5ZlpxVUVnUTBXeXNzMis5MExvSXFKallaWkpFTmY4Umk2?=
 =?utf-8?B?OUlOY3plbHBOQy9xMkNGdU9HcUt4VTlhd1dBQ0djZ3htempNdU5nYW9HdlY3?=
 =?utf-8?B?NFNuT1A4QWxzVkpjNlNyd21LUngrclF6d3ZFZjBvYzRoekFWdTR3a2x0QUVZ?=
 =?utf-8?B?U1k3M01kREo0RHFiSVhFQUxJK1pNL2NLNlltd0o2elU2eHZVSHFxZFRCTTZS?=
 =?utf-8?B?Z2MxSGlnRWUrelRQNWhiMkZYMUw3TWRLOWliZmNxbFVtUkFMYVAvUFFUbFY2?=
 =?utf-8?B?c0F0dTM0YUhhUFVJSU90Wm9LZGFxMTlYT0FjOVRqVGJLb0tOUU1ncmxNOHV3?=
 =?utf-8?B?bjE2TWl6K0dEUys5Vlo3dmQrZE5uS2pmOUhEditvNjdVRDU4d1FGTUV4T1NQ?=
 =?utf-8?B?K2hVdXlIWkx6R0pQa3kvNFArU3FFUitReXJLWmlscHFXWFRmS2FmWFp4eDYx?=
 =?utf-8?Q?Yj1wTuVZMSHWKfZ4dr2x4i9lf?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	3NxmWznZ8arIQkXngA34cQUfqzUeQgW0qeV3B+IGdiWtx1qd37ySbTg6jeVCUkrPrN2Juk1XnTv2WwMKhQIQhnO8ZAGNHEHbXjUezmyCvzgEeve/FHQtZXaKgjqjLvCfR8d2FKmRLemQXU4ZCwku5nmBaKqSTCLDnMr4uILDrVYGDvXvL5cQD1ix2nfC/el7uO2hhM6/CrjHZUVPQNK/BNIedx4vyF41cqC6hlFoFs7UDeeUYMwebYAM3GVB/ufrb6v5W+U+4Hs35PeYjq3qxTfbcyJ1RV+T200P1RBOQwCupdWWwL5gRZVMmu82w5sMw5MK/2kYs3iinnyNirnyE7nArq5v9Ys7Y1HhePn+Ms+Emnlufxx0GpVKoQZ0bBiTVIkqKJ8cg04xU4dzm1xPdsKOfOmBOQkTmzvR/jBtB+xhk6FxiSWmBjG48rqq6110A+d77x7JY006LEtM782+xrL3cRg+8EGNuv5jgXYRtD4qT/+7LzrNiFWcC38b5t8vH30wJ2Mqn0LOcYKCEc+UOz8gtll/SY97GLxjxuq0zXTIDVeHmuIyQNqRjrd1LT2nrhAqaGq533iCGqlhuwHb0It7W4vxidHwYCDityxx2kc=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d1e6332-51f9-4ede-e39a-08ddc96a2dd1
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2025 21:53:23.0480
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 41JKVxCzKDDj4APEzl84NzJ4t6sVH1wPtmlzHJ+r8T82SGa8658U1XJCdNXRw13qWH7KAlqlgD2K4j2wG5todw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB7765
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-22_03,2025-07-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 mlxlogscore=999
 bulkscore=0 phishscore=0 adultscore=0 suspectscore=0 spamscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2507220190
X-Authority-Analysis: v=2.4 cv=eqbfzppX c=1 sm=1 tr=0 ts=68800856 cx=c_pps
 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=GoEa3M9JfhUA:10
 a=yPCof4ZbAAAA:8 a=e_oJ14wzlCpmeugc4J0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: SypAoiTQXVZx0Haa_ZGx_M3SrnGT2fn-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIyMDE4OSBTYWx0ZWRfX+sYBzYiUWotu
 B/YdnSP3g02oo841JZE4dIuR668RQRZuzwzaDqE7YxJN3LNPrH/a9hxBiKEhk6VaeBr7knqNDOU
 mLr5lOfRYWUg6xSHv2jN732uVUmR0yLJfjB9O47egI6mS8BBgAmpC6EBWeVVAmqaCR9wUyoho2c
 qdDY9ydB7OQT+J8aVlWckQE/m5Fnb+w6oolSlmiY/xqVLK0aAJA/YOvnjIo+B2FL7qlDeGvgzpP
 /QOKslxlfIszvPbxFw3S4+Nz4jEBM96TW3fS4kXYvsldKAGritc9PO5LdDgywSjOsj66riudQFx
 j+Ep4KlFtAlHShr4uovbIwInx9b+naMRs/LzEvpwNX6evsQ+h4ZyVkFpZ/mtBzIxK+g20FMCkJ8
 ChQdsSsUQ/wM+19vbgC/zCfcmmrxqPeMjJ3VBrvcsGRaMgwarJIzo4ayMAfibez67jXRrdHb
X-Proofpoint-ORIG-GUID: SypAoiTQXVZx0Haa_ZGx_M3SrnGT2fn-

On 7/22/25 09:51, Nick Alcock wrote:

> On 25 Mar 2025, eugene loh said:
>> From: Eugene Loh <eugene.loh@oracle.com>
>>
>> A few tests started failing with commit 3a551bfd
>> ("trace: fix char-array handling").  Update the results files to
>> reflect older behavior, whether on Solaris or with the legacy
>> Linux DTrace implementation.
> I think this commit didn't get reviewed because nobody understood what
> this meant.

There might be other issues.  There may be broader issues here about how 
we should handle strings.  But, I guess here we can focus on this patch.

> If tests started failing, why adjust the results to reflect
> *older* behaviour (presumably "before that change"?)
>
> Or do you mean that commit 3a551bfd adjusted trace() to work like it
> historically did, but one test was missed and needs correspondingly
> adjusting?

The 3a551bf patch made this test fail, but changing the .r file as 
indicated works both for historical behavior and for this new patch 
(modulo the 256/257 issue).  So, "yes" to your "Or do you mean?" 
question.  Would a change of commit message wording get your R-b? I'm 
not sure what to change since I thought it was evident from the patch 
what was going on.

>> Notice that test/unittest/funcs/substr/tst.substr-large-idx.d
>> specifies strsize=256.  The older behavior would result in 256
>> chars being shown.  We add a results file that includes a 257th
>> char.
> (the trailing NUL, presumably.)
