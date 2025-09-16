Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CB7F276022
	for <dtrace@lists.linux.dev>; Tue, 16 Sep 2025 18:57:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758049026; cv=fail; b=DR5UgKeNQmU1M5tcbGhFAMXPd5T2Titv5KClAvk0LIJNfrEsJe1+w0PA2IXrjxB3/q95l3LBN0rYb2veAmDoaBGcFmqMLzWmHE73AiV1M2+UUF1ZT65VykRJp9r1Gl458lecsu4uVdLQTz8GATib08Rx88PCL9tegIB+hjTrs5w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758049026; c=relaxed/simple;
	bh=4MtxN0o09kmCEAGUntOXEVr3mjUreGtIz5MndWOHQ0g=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Sgay/whnzYNN142T08QFWHjc+ydXFlBHPMMmv9qzyP+t4gjrHb6Gv+PNjmXziVnp+HNaaU8m1c3Zj5sm9KrhVV3JIDEXuYPUYjRVn2bg8cpH2fPBBMIUQz9/x436zMrLGiFgXhNQ3UqJ+k/dGHenhqvDom9G8KOTElN5wCGiLQk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=HF3iQn+M; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=uSy7VmKc; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="HF3iQn+M";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="uSy7VmKc"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58GIMpwm029359
	for <dtrace@lists.linux.dev>; Tue, 16 Sep 2025 18:57:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=782IEn0WS7ykiBUY603020K7RcGZ7++XUHMhfLve1WA=; b=
	HF3iQn+MPfXPu4mxK/G9pBKQgdxZfFj2ai4A+6pE7bT62EIW9Mv0isa8bJ96A2Mn
	+vHxJXzdXoA3MiWFGnkrrwnVEXqIVpa5CFEmMrVgR5wgn9srREqUq4wVYbcJaGUB
	v8HzfmB2YEExMzfn09Jd1JV428kcoxlzBLuDnCf8pTKgsnKDmLsC2uTiWKDrQM9L
	mmBk9pKYqEy3PfvtiA8vzAea2Fuoxg44p9udw8VPmpAaeaHdWI8ThkjAF9QqTxv+
	VYYLU+aMOQ9LkaScG/Z8fPVcDRHXIBHhZNM23wCs12G3form3Zqb/wA6fduU5okY
	ZBFfSXyNKpRtK4F8pfTHQw==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4950gbna24-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 16 Sep 2025 18:57:04 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 58GIaArC035313
	for <dtrace@lists.linux.dev>; Tue, 16 Sep 2025 18:57:02 GMT
Received: from bn8pr05cu002.outbound.protection.outlook.com (mail-eastus2azon11011026.outbound.protection.outlook.com [52.101.57.26])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 494y2k3jq2-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 16 Sep 2025 18:57:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fllajQDaNJflVrNjfWfPqzZ1isn0M6dN3vVpFKJ4pw5TNbkFwSUTdvMYm/tu94Va/8zmiPmkPJVmu9lMs9XsCiBxaUexlTK/kBubJR8ULdfRzI3ZX8jvVqErisggB7myPAtPkPya2o868hEerYHaP3yZizm2BLk+ar9VTQAljwyobEqRUhFtx5mgQAHujWGvziM0PgId+laU1CmOGLRrYGoOnWtANyFJvH3lILZqWDNvCq7XA4OTcFhDvHnLaFOk762/yR0QVPAMUsBo+CAaCBikCpucEw+F+pZvSlA569Ckbggc8fRZVYxKW9JG58vrN5qggzAKlAGLHAdZL1c1EA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=782IEn0WS7ykiBUY603020K7RcGZ7++XUHMhfLve1WA=;
 b=P4QFruRN3Ur3jI/qd8aeCXonSbFu8mywFdXTI3kBA7IXa10NNSSPePAOxcmBE2KTzDMd7vVvcDuDcl9q6M8wqV56qmlXPbYOY/GSjrZXLk36C8pb2ccCiHVjWuBs7/dweBmIFXo32DaneTjTugg1IJ4gnXv2kUBQyNbOMZaMd08WD8tX3oMGE7BTwkQLnp7z1DnnnHHgqzvgaVHcI0xQEEDbSr9wFdYNhElJNKhpywtDhCQjSQNNta+A0D85kFqJbCwThoFAoEI4mIUdS3rEkOiaI4UQf1pf7ZQUmpFmb6jlEYq1qLPVzm/CWlDXxqmu9quXDlQ8qQYLfbSEX4zfVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=782IEn0WS7ykiBUY603020K7RcGZ7++XUHMhfLve1WA=;
 b=uSy7VmKcV86RiPc7kehmeXiKNqHoQoyekmmlDAUTNGhAoCCcdFbel9IfZMvrXTc+bbOxqpRSsNM3q+SiK16aOe9Uld6EaqOgUfCudnJv9t8MYZXVrlB71Eg4meq++Ul4/bzyhr2pJg7M/l+O9Sxr0vjYwjXRCcBRyL/Cxlv0qgQ=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by CH4PR10MB8145.namprd10.prod.outlook.com (2603:10b6:610:235::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.22; Tue, 16 Sep
 2025 18:57:00 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b%6]) with mapi id 15.20.9115.020; Tue, 16 Sep 2025
 18:57:00 +0000
Message-ID: <3ba2dc91-ecb4-ab5a-e715-774e849ba50b@oracle.com>
Date: Tue, 16 Sep 2025 14:56:56 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [DTrace-devel] [PATCH v3] trace: print alloca pointers as actual
 pointer values
Content-Language: en-US
To: Kris Van Hees <kris.van.hees@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
References: <SJ0PR10MB5672162D698C139186ACCDACC215A@SJ0PR10MB5672.namprd10.prod.outlook.com>
 <487cd783-80c1-e037-0c28-c2ff94364a9d@oracle.com>
 <aMjA7o55OLI9cATN@oracle.com> <aMjXfFOSefOzjlQc@oracle.com>
 <aMljZhoquVQGtvRB@oracle.com> <aMmKIR8E5rdokSAr@oracle.com>
 <c6466eba-5bdf-c3fc-4ba2-6509bb4787cc@oracle.com>
 <aMmloLhzYupYUm1y@oracle.com>
From: Eugene Loh <eugene.loh@oracle.com>
In-Reply-To: <aMmloLhzYupYUm1y@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MN2PR06CA0014.namprd06.prod.outlook.com
 (2603:10b6:208:23d::19) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|CH4PR10MB8145:EE_
X-MS-Office365-Filtering-Correlation-Id: 8bbf0772-822d-494d-8a20-08ddf552d0bd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SjluZHZmdjlaQk05aGhtYlhNWkZUQjhNNjYxck8xYVFCdlFvTDdsckRVZnoz?=
 =?utf-8?B?OXdjVUx5WmhkOElxODNrc08yNExJbFRXQ1pQUm5oUWRadzVDK0dHK0NjN3Za?=
 =?utf-8?B?YkdQUkhKdXdVT25tSEppOWV3Nmc1WHhMSjY3ZmZBOVg1dUMrWmJNZWtVVlNT?=
 =?utf-8?B?WnVnQlVLYnJPcTJ0Qjc2eXljRWJtd0VIQ2huUzRBQk9jM3I5c1dFMnNzS2F0?=
 =?utf-8?B?UTJ6cHk5ZjRSNmN2QUp3Z2dOMThzUDNrcHR5VlBJRGM4QVdpZXZ3UDF1Zmdt?=
 =?utf-8?B?QUFRaGpaa2lzMy85YzE0eGN0WDY4UEZ3TXpDVWdtb0dKeCs4cHNiRm8xbG1n?=
 =?utf-8?B?ZmJYK2RTajcxaUt2bkRxek9qdm1JWEFtd01hWHg3bnRyVnpuTlkrZ2Z3MUlz?=
 =?utf-8?B?WkVCK1VJUW00TWZuMzZGb2I0ZXUrcWJFYXc0bjR0MEJDWC8vWmdOQ3dHOWQx?=
 =?utf-8?B?amNQQWxOVmYwVGJuVnAzaDVVNnBwWWtWY2F3R1YwVXZrRGpJYUpjUmVCanJU?=
 =?utf-8?B?VkVrZUJlUUFMZWZqUnF2OTg4YnRoVS8rekVGZGNEeVphaUdoTzlNZFlXcG81?=
 =?utf-8?B?eERIZnZvSGM1RTdMdk1vTTZNazc4OXo1Q2tLdFJlMUpTTlptZksycnRSc1k2?=
 =?utf-8?B?WHJ6V0FVZ0gvcDR2N1pFMG9oaE1JanQ0K0pyTzBZNmx3WFZEdWpoOUFJMHlJ?=
 =?utf-8?B?MFRKN0l5NDVQT0laaGFpTW1oQkgxd0JlSEoxZ0NqSXFTMkZTK095bmxmUnM3?=
 =?utf-8?B?WDNQZ1JQaVJ6MmZONU83dFZmWW9EVVVOd2UzU1dqQVcyYVBxQzcvd1dBNmxO?=
 =?utf-8?B?NjZaazUxU1VFL3RnTU91ZFhPM0lFTTlvYUV4M050VXJBd2R2OUJKU3NMRlRs?=
 =?utf-8?B?UFllTlBPak1YVXhmZk85QnkyTVkrYTZiRHhvemFLajRiK1Y1RmZzTXpIeWJs?=
 =?utf-8?B?Y3FjNUZwdkU4ZzJDd2tSMkRGcThiTHRTSTZteWx4YUMweDZXQUVHdHNzaTRW?=
 =?utf-8?B?cnZXN0xOUGlhMURUQWlWbHpORWhhZkYyWG9Fa2tLRjh3QW1xYmxlRnQ0eXdh?=
 =?utf-8?B?ZmdBM3UyeXd0cmNnMkVEaThPZkhGeVFkc01SOWFGbW5YMG1mREJtaEJybFZF?=
 =?utf-8?B?YWd5Z3FEV2dvZEpqS05xVE5vK1AwSnVmdXFEcm5tOE41YkNIc2VucjdtSXRC?=
 =?utf-8?B?NUxFeHJJWE4rYzFDRjNYQmJRYis4MWhlbVZGSjUrTzRsNjRZenIwQ1dITCsr?=
 =?utf-8?B?VXF6SFBRcFpzS2hzTG5qd0JtVmpCOHhWbFJBQUxzeGxUMklTNm9jRlRSd0Rt?=
 =?utf-8?B?c2dWY3V5aDBZRUIzcmFHeEx4OUc2NENpUXQwVFlSVDZuQWdsa1BsK1hCenZr?=
 =?utf-8?B?Z0RzMlV5KzdXamprb1Fxc2U0bzZLVE9HYVkzYUE2Y1F4d0FldTErVUdjUDh0?=
 =?utf-8?B?bitGNVBUOFJhK3MydE4wenVVT05ETUNORDd2R0h3S1UzcUROaTJkalR0RWFX?=
 =?utf-8?B?dkg3dy9TRDV3dnBSMWhpMmZXd1NWbFJRK0djOG40QVgreUZNNWRhTjZjejR3?=
 =?utf-8?B?NlNhR2FCU2tEVUJkRS9Tc0tCZGRRQ1hLeVduUlZrSWFCeFNoZ2dCLzFKMktU?=
 =?utf-8?B?UUpSVDVqQ1c0NHFCdURZaDQ3SVpLY1JwWmNtOUdXdWd3Y3gwMGJuLzgwOEpX?=
 =?utf-8?B?dGpaTWRncHhqZzZ4V2htWUdRaURPLzhwa1daM1N5RGc2UWdJVGxvbGs0Mjln?=
 =?utf-8?B?Z2lSVXVPMkt5aVFxdWNGMDYvN2h3Wk5MSmlGWnRMOVA3c3pWbFQrUmFIT25C?=
 =?utf-8?B?UE53QkdkaEhUcTcvOGxIL1MvS0NGSElZMVMzS2VKMHovY3VVVlEyZ3hZVzdE?=
 =?utf-8?B?REp0M2V6M1IwdjBpbFByZDFyVTcxaUxCQUdQZHJxRUxsdW9XSTFKM1RtRnA4?=
 =?utf-8?Q?aRh8HWaeI4I=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OG1pMnJpK1p0ME5lY0d3OEd0VFgwbHpZN1k5bTFrcTZwbHVKQWg3bjlnSXdM?=
 =?utf-8?B?VGNjRnNaN2I5TExDVFhPME9DdDBUbEJ1eEVIWW0zNGVaYVRFakFNRU9OMG9S?=
 =?utf-8?B?T1RvVmhqNktGc1JRa3QzOHFBQ0ZCTXZhSDZTNUtRNU1CL295L2hOVTdqOXVX?=
 =?utf-8?B?RWdXekptVlpKVFJCK2pPME1NNUxBSDhEa0pNN3FOYXNUNkpRUTE3V1dmRndw?=
 =?utf-8?B?Y04vQ3RhbEhob3ZqVTJGSmJrbU16TUF2WlVxeUlIT1ZvSFlOYlpxNEhlM2V0?=
 =?utf-8?B?Ukt3eG96VFBJTm0zcWNBVHQyNWlNenRmaFRBYm1FbzFGcDNGenRqbHpqM2JX?=
 =?utf-8?B?bUsyVVFrZFJWNVJqUm5CejI5OHdjYk05VWs1Q0RDVEVWSW1ZTGhjMHd5M0NR?=
 =?utf-8?B?ajZJbnJRMkQ4Z1FRYVBDazZxUHFqenF6aDBpc0kzcFhGbmJneXJjUUp0cWo1?=
 =?utf-8?B?anJ0SGs0a1dvc2ppcmwyTWdPdG5qaGdnQ0RsaVF5TG9pQUJWcTB3eFY3b0pl?=
 =?utf-8?B?ZFJUTHExRXNkT1ljQTZIZDhEdTl3TTFLZzVhRGNZa2ZGWE5YQ3BVMWw0TTZH?=
 =?utf-8?B?V1IrMnVtYkVia0oxbzF5aG1SQ2VpVHBWNmZERzRnY1VWdmg0QUtSWkNnM0Qr?=
 =?utf-8?B?N3cwV0Q3V1BScmRjbWVBSFdNRHQyalIrS3ZmbGdvWnIxVUlJMVN1RUxqV01t?=
 =?utf-8?B?OG13U29qa0hnQ1krMStmelFsc1plMUc0Ym9LMlZad3hCNzVvdkNnZkVSdUpX?=
 =?utf-8?B?bXBUQ0tlWTlRK1h1ejJ3dU4zaFhFM1JiSEorbkM0MTg3SWd1NWZCdnpQaGpK?=
 =?utf-8?B?bTBQcG1NbzB6YllXaG9YRmxVM05zUXhXVmFtUEorRksvTXVlVEMxdEtET2xu?=
 =?utf-8?B?ZXplalRxZFdDUVk2VGZJOWhZYU44UUI2L29BVjdvVE4zSzhTaVVmdWV1VDF1?=
 =?utf-8?B?SHVOZHp6MzdNQlUvR2c4YXdPUnlWRjYyZU5hZDZGOHdmRHJzaHg5L2V5aXlS?=
 =?utf-8?B?aHhiaExxWkFTWEZzaVp5MEZ6SkRxZUY0VVFUZG1XTEdBTFpPUFlhZGtGK3B2?=
 =?utf-8?B?NXdEV3R1blUwbHloditMdW13YUhkenk2dGgvdGRKalkxaUpCZ2tOWURzNlo1?=
 =?utf-8?B?QUVXbDNQTlREbjFoY25wVyt0dkRDbytGTzJuNW0zL1piNk94TnFQbXVWM2U2?=
 =?utf-8?B?RXI0MjYrbUFBVHJkbE1KOFJwditJWlpLZG85UWV1bFNNSURZbEJnN0FJSEZ4?=
 =?utf-8?B?ZlBMWUZ0c1NiZEIwamtMSW44a0I4MWMyb3FFaXdkUm5RRm1KdG1Ya0lTb0d1?=
 =?utf-8?B?c3RzemVwSjE0bmpPOTl2NEt3VlBGL2JWUUMrZCtTZHgvWUc5QmhNN1FhckFL?=
 =?utf-8?B?ZEZVUmZyL05jSDBTOXk5L01VN0ZnK0NSZ1NITC92MTdXenRXZXJCNlQyZVdB?=
 =?utf-8?B?UElIbmhuWUhpbkVzK1ArZXhIeXBXUk9YZGFEY0hMdS9pKzFwSUp5YXVhUm5H?=
 =?utf-8?B?RS9BbUtMSFFVMitCK2l3ZDF6aDFNNjRKQ0tRR3dwWFdhV0xrUmRKTytqSHVr?=
 =?utf-8?B?VC9JMzJHOXNKWWIwZm5Pd3J4VVhXTzZvcEp1TUdtdGRheER6YlJOVnlqR3RK?=
 =?utf-8?B?MkVDS3dzblA1R2ZlTWhzcldwUnFNeGJxcnZqUXRqV3Bzb2EwbXRmdTRmYncr?=
 =?utf-8?B?NUw4RGNYaGRiQXN0aHVDOGFYWWFYTS8rWlAvVFdxVzROLzVkTWRmbXBQQXht?=
 =?utf-8?B?cWl2NUpGNFdhbHlTbkVUQk53enpUcHNoVXdydllGUDd5Q2NxS0lXczRZeVVQ?=
 =?utf-8?B?S2o5alI4bzJhRFVEaGhYMzBoYnhtdE50aDlKR3JLQ1Mwbm5XN0dpQ3h0bVo3?=
 =?utf-8?B?MURualRwTHhxdm1oRDhLaG1tblAyMmxIUllUQ2JBS1NxMTR2RVhHQSt1cTRC?=
 =?utf-8?B?RitiOXRJcndveHpNcms1UzBVa0pXM1dpcnVjQkgrWFNUTDJVNDBlbVNzYzhT?=
 =?utf-8?B?SkpjT1QzcXRyaU9GVi9CSTlKZ0xERDkzc3lTODRQUEVUQ0FpL3JWSDNPNklw?=
 =?utf-8?B?K3hyQ0R0RGRWVlZBNzFHZWRxVUwwb1NNckoxbEIyanRkSCtCallWRW9TeFVw?=
 =?utf-8?Q?7bXF/FdGuiSanjGy2GGYma0yI?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	id5mG0s6tbFcOoboksgEShGq/x/IrhSg7hfU8a3zPFQptAlCxBgmCFqjZeVIxDvwh7mNthoOm0PhRI074PGPdkztIfw2dtlQHDAtvDmJxtoiR50X19o/KqfppHjaUpQWcup+h6xSbIrSSNhBDtK9146O0G7HDY/RFqibXngtgG2rzJj+eOH1gjosHrO4aZ3lbBXEMzApXi+8baeQdpdS3PGozoGGAr6uH87JtQ48Revb4ftAf8GFyzugBFHDCwGgh2f/gFc75NHqs0imvLyFLRnr1HIB8akd5kNYgOenJg1yxN775RE7wPiX1eh4F12fPTGhVX9Dpo24+3/voyLJ+3HrSX1a7/I15V1keJJ/W01y1ylQRQzu4nMIAF4qxbvJfcjlbobEON7sRHSt1eh8aGL0MV1pZB0MbDm2MKwIbRK/JLVW2JxDBmGVdGNuR/z4/Gn2+aJVblw11aVuPX4pLBgPzSWvHV9oL4qqnsvxKyyc0GEYIvMsBqcy+KEgNAFvP2Qe44AYyKXK4dNZu16wuyxnkPN38FEAnNgf9xBK+hEYfW402IYTW91dt6tLWiJ6FdsZrmHym/2VRyLI8io9ep3xybRshbp6Q3mB+Oqez9w=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8bbf0772-822d-494d-8a20-08ddf552d0bd
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2025 18:56:59.6957
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kqUmCJiQxDfoJ5vfYvsVOsqj7o+GUxhf0gwcZkeyXbPvHUICVEg4rGoNQD3kqdH1CT820HSdPrwWu+G7LPl3zg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH4PR10MB8145
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-16_02,2025-09-16_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 malwarescore=0 mlxscore=0
 adultscore=0 bulkscore=0 suspectscore=0 mlxlogscore=999 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2508110000
 definitions=main-2509160176
X-Proofpoint-GUID: AMeF4uQ0a__w7f_FDCdI_SslFp6sM55v
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTEzMDAyNyBTYWx0ZWRfXwlOQwFGUSzbb
 1Y6wmi8r9HluGxQB2iuF7Z+mPtUbodRV4AfW5wuksavXfu6KT9UnMzTEOIiNI6J6FNEcosZiOgQ
 duRFIgCFRr0ANUm9ckEwsvsQAu3QNHXQ2X+nC0ntGxSY9ld04bqPghy3qom2tYRdVSM/oz19JpV
 N/2lcrdfFeFp8jZHWNU5t6fVENBEuije4UW1HVUsJyT3efZUi/G28G0039ToWqGCL/DciZNeH3Z
 JFDTYGbNjP1FwA1+Y33dZzm20jN5wK03nSP9UMoZsbBzPjaArOjTOOj1G+Dk67Bs0j58Z0FIAS1
 0yy7pcUV/nqmzgdrRRf3rmh9bE8LV7npex7MMyX0KZqqwLMjOQ5yH9O+0nNRc8XMTEZq2iEciv8
 M1MUZvoa3bxoVRz6YsEbpxcTcMP7fQ==
X-Authority-Analysis: v=2.4 cv=QIloRhLL c=1 sm=1 tr=0 ts=68c9b300 b=1 cx=c_pps
 a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=XUUI_PBGN9trJC6ODYcA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=EbzY0lYlwcIA:10 cc=ntf awl=host:13614
X-Proofpoint-ORIG-GUID: AMeF4uQ0a__w7f_FDCdI_SslFp6sM55v

On 9/16/25 14:00, Kris Van Hees wrote:

> On Tue, Sep 16, 2025 at 01:07:50PM -0400, Eugene Loh wrote:
>> Just cleaning up my inbox...
>>
>> On 9/16/25 12:02, Kris Van Hees wrote:
>>
>>> On Tue, Sep 16, 2025 at 09:17:26AM -0400, Kris Van Hees wrote:
>>>> Eugene: Can you test with my kvh/2.0-branch-dev branch from ca-tools4?
>> Yeah.  I get the same issues.
>>> Ah, I just took my tree, and merged dev-queue into it, and now I am seeing the
>>> issue pop up with tst.tid_pid.sh at least so will look at that right now.
>> Cool.  Let me know if you need something else.
>>>> On Mon, Sep 15, 2025 at 11:20:28PM -0400, Kris Van Hees wrote:
>>>>> Do you have the pointer subtraction patch applied before this one?
>> Yes.
> These are the failures I see:
>
> test/unittest/aggs/tst.aggmod_full2.sh: FAIL: erroneous exitcode (1).
> test/unittest/builtinvar/tst.tid_pid.sh: FAIL: erroneous exitcode (1).
> test/unittest/consumer/tst.merge_ranges_bug25767469.c: FAIL: erroneous exitcode (1).
> test/unittest/consumer/tst.symbols.c: FAIL: erroneous exitcode (1).
> test/unittest/version/err.1.1.d: FAIL: core dumped.
>
> Only the tid_pid one seems to be related to the alloca handling code in
> store_val().

Agreed.

> Do you see other failures in addition to this?

Yes.  See 
https://oss.oracle.com/pipermail/dtrace-devel/2025-September/006645.html 
.  But I tried your fresh 2.0-branch-dev and it looked fine.  So I 
suspect things are good now, but I'll try the full test suite and check.
