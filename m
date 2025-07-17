Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AF162030A
	for <dtrace@lists.linux.dev>; Thu, 17 Jul 2025 00:45:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752713128; cv=fail; b=F6VURDFTL0iRxQbly3sr7VlEELpsBhkuKtoyZVmpw1Q3SYmAqoqvNqwpCYdc6OUQSV8xYSAjdZ2I5jIO/MJI+SRDqKVS4z3mD77rKRI7KYvvukeSqmt/CTl5Jl9jufZKTkxI74AuH697Y1nux5SawUFJUpmcBLg0S1vGbRu9ICw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752713128; c=relaxed/simple;
	bh=26za81QUQyp8P+dV1L1UKnaoPHCjkM2ibJjPNA+p7yk=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=ubuVQC9KGHOBe6USN2pYxXInDSxJIV8qrf0+3rCYGhQ8cF76QqNwGEzzzvlhsgrTYLDySPTepDSEuiQ+KWOPILppm9spd0SCUztVUiDFGMYpY4dQvnXUnJCFqG4gz2U83Qtm4dLo3tVv33jfkSrYcQXZcbO5x2nnZkuiuYw3in4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=XTyZ+Lok; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=TEjFOqHK; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="XTyZ+Lok";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="TEjFOqHK"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56GLg6ek011627
	for <dtrace@lists.linux.dev>; Thu, 17 Jul 2025 00:45:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=lklWg35p6xCThgnw3mSgacUjqZo+KDezz26r7lvuRZg=; b=
	XTyZ+Lokdh/YIBCuFCaDIBYcDI94trBUzgeoxu78ewTv88hSV2Ag8QsOOdRDUrhg
	BbD+bW+fB/vw+ODJKgVkr3VqXZIabGKP3p2oYQYFr34nBW1OJLIcKMflfD9YmUUS
	yRWn+x/On2OYBqJjXoP4vNLgr2GAXwS50pd75iDC8DEe5T3uM7XolVCeu3ruGXAl
	h/Dt3U93i3NC6EA7HWSZDRUMoQPTmxzxlitzWDYuQbJULbTTZ3lCAkJiCsrH8I+1
	AQNMMNcS3ImjNpqDi+9aS+pMpN8VwXDVTNDE2f3YNoKVVE+Y41n9i5Jp0Mv830+n
	UvrQiOhdZ8z5vXjH4AG4vg==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47uk671rba-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 17 Jul 2025 00:45:25 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 56GM7e8p040507
	for <dtrace@lists.linux.dev>; Thu, 17 Jul 2025 00:45:24 GMT
Received: from nam02-sn1-obe.outbound.protection.outlook.com (mail-sn1nam02on2081.outbound.protection.outlook.com [40.107.96.81])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 47ue5c32xq-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 17 Jul 2025 00:45:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oYIxeRvCEGIEzZwh90lcBi+C/hotmNCKLtC7XUvBu2zAnk9TdgNhqN3u5nzkgDMq1A9uIIgGbet9iVBz0xVvWq5HkbCqaCOoWKYvs8Aps1YwWohTGOGl9IRWWApdwKr/xzfvbxHLDdIbsoOfmHPV8zCibFOekqLKMW5oSOFGpC3N95rB7nBfjnMF/d7NZrdwezbZ9opEo2E6WDTjPx/v9+AAsbuhtG1t07hMYafnZEkIqu6sJvZKWiJFlAV682DVbfnc9M2E2WTTDFv85a1x7RziQZHFIYE7K3BiX46aKLCe+80VHzacQzttk1choufcva2OikcOPPEHyrrTFTztCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lklWg35p6xCThgnw3mSgacUjqZo+KDezz26r7lvuRZg=;
 b=Bgvu1S2+tk/nSyZxr6LkTpilU3M0fptctts6w7Pb+Qsl4TNSIkd08WJ/a5z7RhENTuVt08SKIbnrXHBaQg7yGhl52tjy+7a/WHnPDOQ3cX5AuT9zTbOT4jNIO0ObLs8/0I3K2C5IQF0Ljks8Gh83zXizxBk1JtYlNe+OxxBuq6mnMX6aF5kSlYCFUfeajwK77AcnaWexi6kNwfgQboo1oRm6f1AlT0YfYM1L8kkiI4HylZ84AFCBfp4sw9yjfGD6ZGt1HRGp8J0fEhibdwyTM5CezlEA9NHUklDK5ktBeUfkGscpAu11QHfobunaPj9cdr4Nn2TV04qMEhGU0VkbMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lklWg35p6xCThgnw3mSgacUjqZo+KDezz26r7lvuRZg=;
 b=TEjFOqHKmoelVFC66uauRH0u9kD+rl2trKHxyGLVGzPimKUNBv9n6lcXHOBkyTr6fCE5QQ+wc/iCBDlRWQU+tOdTlB1BipmQToxc3JISnYfmBOG6wwqi9aAm/uiC4P84WtM/LsRjurk4gmPwcPPy/vsipEVqeNB2j0YYqJnSBFs=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by DS0PR10MB7902.namprd10.prod.outlook.com (2603:10b6:8:1aa::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.39; Thu, 17 Jul
 2025 00:45:21 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%6]) with mapi id 15.20.8922.035; Thu, 17 Jul 2025
 00:45:21 +0000
Message-ID: <9fe85ab0-3a7d-626c-b382-0392c55e7502@oracle.com>
Date: Wed, 16 Jul 2025 20:45:19 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 2/3] cg: validate tstring alloc/free
Content-Language: en-US
To: Kris Van Hees <kris.van.hees@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
References: <SJ0PR10MB567277E28590C437C8E1955FC257A@SJ0PR10MB5672.namprd10.prod.outlook.com>
 <2032c9f8-aaa5-91ad-64ef-53ba665613b6@oracle.com>
 <529c8de5-2eaa-6bbd-1dfb-392ab4d4a4d0@oracle.com>
 <aHhCUiaKDLU9CHEk@oracle.com>
From: Eugene Loh <eugene.loh@oracle.com>
In-Reply-To: <aHhCUiaKDLU9CHEk@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PH7P221CA0033.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:510:33c::25) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|DS0PR10MB7902:EE_
X-MS-Office365-Filtering-Correlation-Id: ce16336d-98d2-4b23-da09-08ddc4cb358a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Zno0Q0VSeDJLNUxrTzI4eG52NENWOG9wSDlrYThncVJXRlhGSkR0MFRndHFu?=
 =?utf-8?B?dE9Cb3JvOFBlbUorZWU1SzVDM1dGcW51NUw4MmdEa0lKa3VEL0RaYUlxTURj?=
 =?utf-8?B?NGpDV0pBckNwKzUydHhXNFdvdXlQcDA2bExSZ3hOMWxJYWhPbUhPNXpMZTJ5?=
 =?utf-8?B?TTlvOEFYQnJUQmNCTDM0WHFoWjlUOVVaazU4ck0vSjFXYUx4TWs0TnJ3b1BS?=
 =?utf-8?B?VnZyQnhTOXdVM29pVjkvMG5ZMzR5V1ovSk1RQlF0ekE5Q0tqMVRJS29Oejcx?=
 =?utf-8?B?azVkeHllUnpZby9ocDdnV1lqdVFtcVZ5RTNOclovbklXa29xTHhuOUJlVmRr?=
 =?utf-8?B?OHFoakpZZHd2Z1d1eEpTQkZSaERGeFlYNi8zbEZ3bGVtK1BSZG9ZaS8xWEcx?=
 =?utf-8?B?ckczcFRqNktqcTFYTXQ3MlZNZjZ4QWg1YmNyV1Y4ZEtGSjNMOGhJZjl2U1RI?=
 =?utf-8?B?b3FnaEZCU2tsQ1N0ZXFhekN4Z3FjTHVlYzJOODhqWmMrcE5QSkJ4YnU2d3ZG?=
 =?utf-8?B?S0FQTVJuMGp2eGhHeVkwN1FTQmdSZjBaUnlmMW9Rd0F4bDE4NWZGb1NJWDMx?=
 =?utf-8?B?VU1JTjM3bWhRZ29CNFN0bVl0SEtnZDlKZXUxdjIwN0tudWVxVnFhanJlRE5x?=
 =?utf-8?B?eU1tMHlWQXg3Q3Z6RHZTM2taWDJ4aTcvcGhySnF4dEQzc1NoSW9rQUJYOHFu?=
 =?utf-8?B?VE1xQTM5bXM0TVNSUGlIdlROODJqRGJqb1NPcktZVklIQURrUHpZTkJmaHdq?=
 =?utf-8?B?NDFMeU80TGxSeWNPSGVJcDM4dStPTEljUTNhVTdjQ0Q5MDhzTHhuOGdRLzBh?=
 =?utf-8?B?bjNiZ1ZzNG9BM2FmcGVmaDF6eXFZZ2hBUUFQWnYrQi9qZ0RYRVhpc0dDdmVm?=
 =?utf-8?B?RmtsczZpSUpZWE1MUjZ1TGY2NThvc3F3dENTR3VzWFV5aEt0ejVQQVM4M3hn?=
 =?utf-8?B?eXBpRHpFdUw3TmZ3alVoeEc1a3J4QStkMzd4ekJIVmowY1ArSzE4UGdWKzcr?=
 =?utf-8?B?SkhSenY0eGM2ZThnZFVVUlh4bmhsUkpmYmU2ZnZ6ODYzZkZsd0NLTmNhVFdh?=
 =?utf-8?B?eUU1OCtHeDNPKzdNTncxYkgycmUzRzRoMjBaTnJIMFlHemRSV1JpUXl5ejgv?=
 =?utf-8?B?emhYdkVtTTIwLzBtZnZQVU1YbGFEaUZqKzljQ1U5Y3dvcXIzc2FyUmFDK0FR?=
 =?utf-8?B?SVFmUkE3bm9NeENLekZsdVYvb2kwRHV0bnd6TzNKSHlYN1huNFZuNXFreW8w?=
 =?utf-8?B?cllHbWdEZjk1T2wxVDNIYmpKSTllaXh2SXNhdzhnZFJUcXVFaVAxS01oTHVU?=
 =?utf-8?B?VEZVZTRTd0NtRUhSNTUzNHhyZFR5bWxkU1pERnhSK2ZQMDRudWJtVDhGUXJv?=
 =?utf-8?B?ZUtBQ2t0M2dWNnJzSlFva0NiWGtOUm01dXhqSUV4WlRkT2g4Yjd6RXdxMFh5?=
 =?utf-8?B?TnpmNFhuQ3RCM2E2cnNDM211amlMMFFxNmtrMDhRNWhxc1BMbGp0OUZtSUxR?=
 =?utf-8?B?a0sxNnB4RmRBT0hNcXVkS0NtT3NuMUZKaFBFK01sN2h1U3Q2RlJWSTczbEto?=
 =?utf-8?B?bG1FblJPdVNDOUxlWkFYbkJDRzhENXZUWk5BQ2xDSUpQN1RkTDh4eC90NFJI?=
 =?utf-8?B?dnFqaDZBQ0R4dHJuU1p1NHAxSVFLU0d3WFVkUXdaN2tRcE5PQzNIOVAwQUNa?=
 =?utf-8?B?aC8vNEFoRzM4WHVPYTNmQWorSDFPbEc0NjRYWk5xZTN3UEliTFEweHYwVjZ0?=
 =?utf-8?B?Y2VXTXQzQUZQbXVxYjdqRitoa0hiRUR0SU90cG1UQXZSeW95NUJ1THh1Z0Zt?=
 =?utf-8?B?M2Y0OEhtNzdpYVJHMHZFNWM2ZlkzWHhUNzMydzRCVEFSNFpWQWp2cWFpT28v?=
 =?utf-8?B?dzkzR29OaDFnN0NibExQUFZzRGF3b1dqUElMMUk4amRKL2k3eUdMY1hhb0tp?=
 =?utf-8?Q?BXyl3V7Y6QY=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Z2NNUjBYYUoza2U4S1l1cDFBSGxqdllrbjhScnlNZEc1YVcrQXhQWmxmb0xG?=
 =?utf-8?B?aUVKaS9zajAxY3pIVW9QemJRclJrVEtoSGRHeFpXRTB2RER4dEFYdUZ0d282?=
 =?utf-8?B?c0UvM2JLaFlVc3hFTDV1TVQ4VVFEcCtMRzdNYnRWTVRtMnFXSWkxQ0phQXdY?=
 =?utf-8?B?L3lFZ3pmWXlTOXgyNG9uSC9wZkxyUmxseHd4bk9iRktULzdnS2QxQ0VSYjRP?=
 =?utf-8?B?YUhGUlN1djdwY1pPeFJ5ZkRzbkZlR0RmTmtQS2MxK3dUZHd4SjRTUStUMllU?=
 =?utf-8?B?Kys1bEk2Ylh3VXdwakdQMW0xME5iSloxZ21LRDJDa0g5VHJvQWU5bGhkNGtF?=
 =?utf-8?B?UUpmYjdoUDB3ajNzUE9sY1BDK0FwdDYraFVJWUJKWDAxUGIvaUFlK0J4Mjg3?=
 =?utf-8?B?N3h1a3gxcHkrdGFpY3BkODM5L2J0dFczRktzRnlpbnB3UTIwNkFHTlM3TTU2?=
 =?utf-8?B?cUU1V2E1cUxDeXFhc0Z6czgwak9RVDdtd2JpcVFGQlBaTUZHODI2cWVYZ3g4?=
 =?utf-8?B?SnVFQm8xVjNubVlkMEtzSTRHM3dJR2drMVd1bmQ2Y3hvYU1zOUtXMkYzSmlU?=
 =?utf-8?B?V1dsNDJ1R0NCM09yTWxOVWF6RDNHRWN6UmpGeTZRUFR1WXZjcUxSTUtOTmta?=
 =?utf-8?B?WnFpajJCanR5UTUzZ3N5aDdNcWx6TG95VmlBa244ZWFhb1ptWXlGN0NKS1FI?=
 =?utf-8?B?K3FTSzhFMVM0Z01QdEFKN0crMkFWVit1MENYM1VPMWJGNHRpZFRzZzgrSWwr?=
 =?utf-8?B?TmRsYVhjdWEzSmJLL2FyaHI5S1dCZk9uTTd0ZnBySmhOVXpzVHpnOFFlYnh0?=
 =?utf-8?B?MUVzaEVmdVdQQjJDS2cwTE9SL1o1V29WeTFhWFFDb251bGFIK1JncTA5Rm51?=
 =?utf-8?B?eWdSSUlhUjBkV0l4ODFWQUwvNFFBaCtJV1Azci9lVVBzYWlRN0VkeHp0VVZ2?=
 =?utf-8?B?WEFsMlNucEovQnhJWGRDc3QrUnM1b2l6bkxuTXBOZHpVNENyQ1pYWExWNnI1?=
 =?utf-8?B?bExKQWh1ODJ4TkxUcGp6ek8wMGtpbkRmNWZuQUw0M1hQa3Q2OFhiZnp2MExZ?=
 =?utf-8?B?Z0s2ekp1czNtS1VLWVIyT2t1V2Exb2k3UXhvazFuNHFvaTQ0S0VFdHNGMkdV?=
 =?utf-8?B?TnArRTRqT0lmL0p2R3ZDNGo4cExxblZ1YS82Mk1NaUZCUkZwZmd1eGVJN0xK?=
 =?utf-8?B?b0swang4QVVtRDh1NjB5NnFIK1FONEY3Y2RXOTM1UllFRE1uMy9IaVhjZW8v?=
 =?utf-8?B?T0Z2Rno3SmJ5b1hLT1NpNmdqVTNqenhRRmZ1dnZlZ0dHeUhZV2NKY09qenJ5?=
 =?utf-8?B?VWlXOWtwRFdSVlBva0tXOVR0RlFBYUNIb3Z4ZkdzejljUWY2cW4zaTRhTUpG?=
 =?utf-8?B?aCtjUndOZU9iRFZtd3ZRaWc4OXpOSWcxcm1naUcvd1lCTjZpakgrS2ZqVDRU?=
 =?utf-8?B?YjB5YzhjOU93eU41aC93TzBsSnJMQ0xrNkYrUDZEdWxra3pPSUdiT1BzVGh4?=
 =?utf-8?B?MWZtWGM5MDBXSUpxTFovMXVpc0VEa2JoME1MRTFKN3FGYzdoQWpFd2YrYURO?=
 =?utf-8?B?UWFONjVncTVHOVRabGNHakZabXo0V1k1R0ZsVnAyT3g5NmlVTis5UllRUmUv?=
 =?utf-8?B?MURHRVhacE1zSm0vMHRaaXo5RzZTMDFwcWo5Q2MwNnZML2dWMEMrZk8rQWVk?=
 =?utf-8?B?ZlJ6cDE0R3Bjb0tJTnVLYzN1ZHBFWm5WQ2hWK0J5MyswMGpySkRZUjFwNysv?=
 =?utf-8?B?c2VZZlJ5NWJrYTVyeXJEZVptWXlJVGdmMW9sUjQ0aFJZQTM4cmE5VW1HZjJC?=
 =?utf-8?B?Nm1Dc2ozeVFHb045SjZiM0VHYkxCZ2QzUjE3d25MN0E4MDBVQytVWFl4MURs?=
 =?utf-8?B?enFKV3JRS1E4d2o2WWNrdXB5QzNBT1NnQ2VrV1I1eUFMQk5tMmVqbmNoam9O?=
 =?utf-8?B?M1JWeXVpT0UxeHVpVTRtajhyS0hRM2VqWHN2MlVGQk1ObTBnbG9VZ3NsSERX?=
 =?utf-8?B?L1JNTmp6aTJxWFVjbkZZZFVZOWs4MVJNSTJ3dStZNWFoSVdWMUJlT0dVY2RE?=
 =?utf-8?B?N0x3N0hKTFhGRHdVdUtkTWpzZTJ2OUh6RkcxOFhiWGFJTUZoa1U0WDJ1eFIz?=
 =?utf-8?Q?kJDD/GltxEA7Z9TFt71hoTVqt?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	XkY7h9PSxti5y9CzNhtxYtGZ2G9UMp+oqGxjnExzwms/RoJXft7W/3uVx4v7nZdDI7MlA1C7yFyXqB/8PD3fZnDRT7yZq+bg6tuvUpzunDSLr6QVdp9xEFJzPmm2tndMI6HMCbPJLkyHZ0OjBI0q9FCPwmaTWbhiZAN/JUE+QDPN51oZdNgvL6EA1ie1ZLBlYgqjooBZtYrNZ6B31feTkAcUWxrz7vfoGpE3hbPoHp3wp4pqvAzdzcCwgRvEDsKeZtZKRBcEAaYSSOkSH+sMAEXDDjYOzYeWLBpUOy0UqJAJsJQQ4xK8z27dznPlB04DsVga7LR32S5ydeUlwCChSxnqFNOIzsfnp1oaV+rELI40jnYSHfc11gfZ/nBS40CGETmMXEJJURNAnpKX6oygx6WlA66k5xc6BXoggIisWsb2zbpKwMrUmUigcg0Rk8Qq5gemQazXA0nkYfmj5BvMjpaVqMKM+Y+KcpGcje7TNQ0Bt7E0kM9GqzCzh8YMNlBtLUhdTNAp7UywIYGhKA7NnTKCIUOInHk3VpRly31XR9slpLNL6p/obj/frNaMUXgK1U4nIRfbsxWGLMz5gC+9rBqUJU9dr4T3mdwd7B800CQ=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ce16336d-98d2-4b23-da09-08ddc4cb358a
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2025 00:45:21.3927
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qnqLTHFvqf9y57sb1KoAOEg57nPcurmzs4F/4QhuPnNSMOZfTjqV/3sBROxzVgx4IEn6nKM5o/PqnknP0JTzMQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB7902
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-16_05,2025-07-16_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 mlxscore=0 adultscore=0
 spamscore=0 suspectscore=0 phishscore=0 mlxlogscore=999 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2507170004
X-Proofpoint-ORIG-GUID: A51OGyO_5volb1AVvBLikv2U7PWvfYnY
X-Authority-Analysis: v=2.4 cv=AZGxH2XG c=1 sm=1 tr=0 ts=687847a6 b=1 cx=c_pps a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=GoEa3M9JfhUA:10 a=-prYbv86RDzHWQkpi44A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 cc=ntf awl=host:13600
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE3MDAwNCBTYWx0ZWRfXyz7TTBV+EZoS s55ZvDeziugCSh6X6peWLmF7NCWBDn2EJoREYlYjiJcHN+fgrDncB9teRlPfg1zoRHkmSOrIaCA r5Ai6+sycT1obOaHFGri/sJQSb+JvWZp/AIBR5f8+fZF440gbVD+d0U0L7dv4TX8K4a4+gVYVAz
 mmu/ciyfioEyOHYEhcGP4c3nXjwTbw9P8055gx5Z/h0ZNdxfu4BDhkJioUqnw3Qa3cGFW/wPxbJ bXDFu1XcRwux/0aDRNrmiOCDxn3xc+jujmUJ4+1s6yNJT1dWtFTChmzYWghxTL2wjQ9fFxyLvoX Zesn37lByjTf1YDI561xStxygTi19Q36AlMHrc0LDoZCz4mSf/qg6Ds65FKXvi+6F6yDx3lAj/g
 4nBMImimUY2eKZZ9Mte3wNXH0z/4cQKaOaZ2/cTy2swWzLFLztuMmsRgkDGhI5hclPqgrZex
X-Proofpoint-GUID: A51OGyO_5volb1AVvBLikv2U7PWvfYnY

On 7/16/25 20:22, Kris Van Hees wrote:

> On Wed, Jul 16, 2025 at 07:07:59PM -0400, Eugene Loh wrote:
>> I was a little concerned about this patch, but also wanted to expedite
>> review.  FWIW, testing shows
>>
>> test/unittest/builtinvar/tst.psinfo-bug21974606.d:
>> test/unittest/builtinvar/tst.psinfo-bug22561297.d:
>> test/unittest/builtinvar/tst.psinfo.d:
>> test/unittest/builtinvar/tst.psinfo1.d:
>> test/unittest/fbtprovider/tst.entryargs2.sh:
>> test/unittest/funcs/copyinstr/tst.copyinstr-high-maxsize.d:
>> test/unittest/funcs/copyinstr/tst.copyinstr-low-maxsize.d:
>> test/unittest/funcs/copyinstr/tst.copyinstr-no-maxsize.d:
>> test/unittest/funcs/copyinstr/tst.copyinstr.d:
>> test/unittest/proc/tst.exec.sh:
>> test/unittest/proc/tst.execfail.ENOENT.sh:
>> test/unittest/proc/tst.execfail.sh:
>> test/unittest/proc/tst.pr_psargs.d:
>> test/unittest/proc/tst.pr_psargs_other_task.d:
>> test/unittest/usdt/tst.argmap-typed-partial.d:
>> test/unittest/usdt/tst.argmap-typed.d:
>> test/unittest/variables/bvar/tst.execargs.d:
>> test/demo/spec/specopen.d:
>>
>> test/unittest/dif/bcopy.d:
>>
>> failing on every VM.  (Well, bcopy is listed separately since we skip it on
>> ARM.)  I'll try to put together a patch, but let me know if you already knew
>> about this and have a fix.
> I am looking into it as well.  Clearly, this patch is catching issues as
> expected.

I guess, but those issues should be fixed before the patch is applied?  
I'll move onto something else unless you think it's a good idea for two 
of us to be looking at this at once.  I do not understand, though, why 
we check if dnp->dn_kind is DT_NODE_FUNC or DT_NODE_OP1 or DT_NODE_OP2 
or DT_NODE_OP3 or DT_NODE_DEXPR.

