Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B68F81F12FA
	for <dtrace@lists.linux.dev>; Fri,  8 Nov 2024 14:12:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731075163; cv=fail; b=TlqyaXfXXmn3rc4NbVCsUrcC1aD80yy28p9C2pmkXkmrdhB+ukf6ZsS+MRSNeH5pXWg6GbZ8XpA1XvazQY5daFnAxlI0YC8+jboYy1Z94t9dEr/cUvULUIxStkbHZ7ISFiX4PiVZAEFQ0h8nflT62GzAoRWlvYFbxBI8teSatNc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731075163; c=relaxed/simple;
	bh=pllolploFg2M28BFOCZmOKGSqEGyWoUSrmNe73e91DM=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:Message-ID:
	 Content-Type:MIME-Version; b=P6OJ5w3DtpfzSJX/OeIZsbRmF0eDhOtDP1G1X0ghh6fgZd6WMAk6PVRqAV3mFV8KS8nSniExZ/5Bf+Ou0RIhTLsMyv71FktNCOtfDH17tXnc2gPNLDZ8yATSLP49o8OHFHeayPLM+p72Lg7l1jm8V9gWLRD2aU9sT1GqywKSOq8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=S9RMgbMF; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=0AXLL4lQ; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="S9RMgbMF";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="0AXLL4lQ"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A8EBZ8f012245
	for <dtrace@lists.linux.dev>; Fri, 8 Nov 2024 14:12:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=V+lM3R6XJcFn5F1/x9L4EUoh/qX26xn7+sJJHojjzPw=; b=
	S9RMgbMFp9oL1cUVysmBIib90hfTb9g1oMpvtSpAyhgRn97laYeowsWWBr/d9fRx
	qD0dA/PARp/0gls0Ln/rJAX/aMdqxkRGpKr4aiFjdieVIhP1mFW3ETY+IBQMzgAo
	oVNToyFdQkFPSquM9rU3j8RJP9o+1Kic7nsLoV0AkR3cbjHNeF7iwRS0B8bvMDDq
	ni6erJNgOouOeAj5SwzUy6/w2nHZUzrNU7Ljz6BXUcXpk5A8PSPUeQNqQidBWYDl
	QhgeNAnupr0sQOmzUELCqD8Kw4lYvuoF/unZ07vSQUaY0TDliDPX/e0/eJ2twpg0
	vHhzrdXE+uSKCQz+2zUh1A==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 42s6gc1ksn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 08 Nov 2024 14:12:40 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 4A8Cft3l005267
	for <dtrace@lists.linux.dev>; Fri, 8 Nov 2024 14:12:39 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2048.outbound.protection.outlook.com [104.47.58.48])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 42p87ev2cp-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 08 Nov 2024 14:12:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wzA03MrxEG1X/JHre+mnbj+hpCAKk+jYJndhEkXFi2ZTJAe5xMZFI9z/0VEFGWI+kMjUtPHNK+HqVVyc0d/hPQBF2ft0Hwo4Jdoig0IkKhGihTMLziwZuNYTzsqgqvu+45acN2BjsYCQI+K47QsHfG1q6201hJJvO7P4Vx0V5h5gDu2gzd9Yfhu6vqyxSmERvCBF/OHHCxqQTpHhmwn7rsk/d59K5GAb5qygxivCoEZCk6IyumO2EiKzWlHxJvZHea5QQ722fRzBGFRgY0tssXkACr785gSdZBMLcYXoAK25DVqxs92JkGyes+WIbP2tlfq6EeOXy6cDDCF8kV/eDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V+lM3R6XJcFn5F1/x9L4EUoh/qX26xn7+sJJHojjzPw=;
 b=LD6X+qMKcobDsOAuazkWMz0P+rJFuezTz8p+001QyHeTw0b84MIsN3oftg7yuxqXy6kxRC2FHT/BEZs64EqNOHPqMeu/rIXaScL6cGol2m8kysmdInHZROcO3gGYywNpnz2aFVPczjyVEsjiTL1dpiQGWxLN4D0g9IJO+E1lluXrmFcan/DVHm9TCGpHP/FM/720WjWwUL2aoDVOZ9h6H5LSAC1dqUOyLCCdVJPfFAY4RoZFB4adGGdRtfc6q7XjJxvWJvLGBwrYSWDpLVCVytGeHfSj6zdsuPNtJc32SEr0isJzans8rOufo6lljz5Oh8eWQ4DqBZput24x+wTHzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V+lM3R6XJcFn5F1/x9L4EUoh/qX26xn7+sJJHojjzPw=;
 b=0AXLL4lQfZoO2IxUQrQrMGQPXB92hNiGE+nc8wxTYfKhSxDOT7v5sDTkj7v60c9OYBdw71fiAVwkBYs63a1OSm8l4lCcCu2gPLGt6mhH0Ro6HpPOwFknt8qGLKibki1ZAp7F9NURWVLaVHZMQsnbrQue6ltma9rg4covqK30RnI=
Received: from MN2PR10MB4093.namprd10.prod.outlook.com (2603:10b6:208:114::25)
 by PH0PR10MB7008.namprd10.prod.outlook.com (2603:10b6:510:287::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.20; Fri, 8 Nov
 2024 14:12:35 +0000
Received: from MN2PR10MB4093.namprd10.prod.outlook.com
 ([fe80::d72e:fa5c:c426:b4b]) by MN2PR10MB4093.namprd10.prod.outlook.com
 ([fe80::d72e:fa5c:c426:b4b%5]) with mapi id 15.20.8114.015; Fri, 8 Nov 2024
 14:12:35 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: Eugene Loh <eugene.loh@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH] Allow arbitrary tracefs mount points
References: <20241106164656.421931-1-nick.alcock@oracle.com>
	<09b50c9d-f2b5-8284-53e1-2050afe4421a@oracle.com>
Emacs: the answer to the world surplus of CPU cycles.
Date: Fri, 08 Nov 2024 14:12:28 +0000
In-Reply-To: <09b50c9d-f2b5-8284-53e1-2050afe4421a@oracle.com> (Eugene Loh's
	message of "Wed, 6 Nov 2024 20:14:16 -0500")
Message-ID: <87ed3l7r1v.fsf@esperi.org.uk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.3 (gnu/linux)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: LO4P265CA0106.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2c3::9) To BN8PR10MB4084.namprd10.prod.outlook.com
 (2603:10b6:408:b0::22)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR10MB4093:EE_|PH0PR10MB7008:EE_
X-MS-Office365-Filtering-Correlation-Id: a629ad8d-4cd2-469d-a602-08dcffff64a2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|10070799003|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZUdqK3NZUVN2Tk4yZk5MRWh4aURFdGRQQjdSSGpMcldhakhsUHlBbW5kU0gr?=
 =?utf-8?B?a0UrZDhWdzZBZHFxVkdYQVBrcStXejNTSUlrSzRvR1VRb0hGMTMwWkMvOVkr?=
 =?utf-8?B?d3F1cXBPWDF5L3hDM1lsR1A1OG5iaEhnSVNRWkIyQUxEMkNKTWZydC9obGZm?=
 =?utf-8?B?MGRoeEFLdlY2UWM2NEFlb0xiMEJPUXJ6TTl0aUtrYmVObm14Zk1xTXU0di9a?=
 =?utf-8?B?TnAwakRQQnAxWnZ1aVUxTW5sRVluSVhqZUVZMkhKMm1HRHFvNjJzMmN0dFFP?=
 =?utf-8?B?T3pmWUxCYUNJNGNUVWhWMFloSUw4NmQ0bENpN0dtb1dXMWxlOXgwQnNqb2ZY?=
 =?utf-8?B?eklxb0NMcnh5OUs0TU15SGxHaldPbW5hQy9ORm1tUWt2ZzFlTm9nM25yTk5z?=
 =?utf-8?B?Z3J4ajFFZUtWdzh1MTZCd3hDSGJQb21UZ1pFOHJFRlF4N0J2NGNmb1hrMzYw?=
 =?utf-8?B?dWwzRng3RzE0NTg4akxzSVNXdmNQR1JHanExZjRhY256VmNDcnZTbFgydGl6?=
 =?utf-8?B?VVk5ZzQzN1FHSFNMcGoyWTVYYnVYZnpuN3RLNGVEQ2kvR2tCeU5XTEtCUi9C?=
 =?utf-8?B?UDQ3M2xBY0J0bVVJUVBUSS9IRU9hZVh5RE1kZzRHMmNTcHQ0SFZ3bzRkSEU4?=
 =?utf-8?B?ZXgrSHNBVkVaY2JWZmNTQnk2NUxtNHRGMWZFMi8vQkJrZHJ0dGpiMFdBMmdL?=
 =?utf-8?B?MzZWNnBFckpJNnc2WWN2Z2I0aXJXRGwyQ2pWbXNqYStJbnVJenNteXlDNE1G?=
 =?utf-8?B?V3F3YklZZUJ1ZUNIbjBzYVliMkJWMXpmTkVYazZ5WXZFZ3oxdE1zWjNBOXE5?=
 =?utf-8?B?RlFjWFhtMGc0K1N1NDFvV3gzWlBLUmd3SmRkclBlWUk0UlV0Q1NEQno3UzdL?=
 =?utf-8?B?dXRQbDZWVmgzaWd2R09pUnpvbFhiWUNTRzc5dUdqNE9PSWZ0clB6OXRab0NU?=
 =?utf-8?B?RExSZUVIMitJUkZ0VXhwNGNmS3U4RzBCZzVPZVRjT1VxUWJvU1Y3L21QOUtB?=
 =?utf-8?B?TFFBZW9qajhZNFpVRm85VlJkZVkyb3Y1WGRlWFdqbktDM2hIR0t1dzJBaW1L?=
 =?utf-8?B?eHRET1N6NHdGc055Z0NyKzk1a3J6M1dSODlVU2Y0bTYrNk9KajltWmFBUXNE?=
 =?utf-8?B?MXNLTlVvanZodUZPWlo1c3dkd2FyS0FxWXR2RURiZ3lpTEsxKzUzb1p3Mmow?=
 =?utf-8?B?eDUybDFtd3FHSFRjV04zNElLNDcrMXVNbG1PeVQzRkQ3U2NZSUJ1ZmphQ2o5?=
 =?utf-8?B?WFprQXdhaC9rQkRKTXFjZTdkekttajVOS0QvcUswQ1c3Y0YxWDdaQzk3L0JT?=
 =?utf-8?B?TzhFTTE2WWVac0w5TTdpYkFzZ0U0Z0pScklIc3E4VFcya0taRU00eFIva2Ev?=
 =?utf-8?B?VmFOdk1yUWozNk5yVmNNRlphSDZhdzRoMzNjYWxScjBEVFp4cUFKbjF3a1hp?=
 =?utf-8?B?VS9GTkhRRXJDckI5STFJVzhuQ0NSekxTUDl6Q1BxOTRTbjlDSC9qMGIzSHEy?=
 =?utf-8?B?MHRZZU1EbmJ3Qm9VU01OVkExRms0em56WWZ1N2hPWi9jNUtJZjBDRFhmbmxi?=
 =?utf-8?B?N3NKc0M0WVY2cWlBMm1HaExzNDZrb1BPdzZ6Nld2VmhNU3FiUTI1UFl2Z2wr?=
 =?utf-8?B?ckNxWStXNHpiYThFenh5SXdVT3oybGJuUVRiK1p3Q0NnYm4zc1JkY1hDSmxx?=
 =?utf-8?B?Zm1vMDlxR25nYTdGQlBEaDFDSXBjcEJiaGVCMnRXaERINVRpRWpoUHkvR0Js?=
 =?utf-8?Q?pMPIUFV1Tc7MeKffjGyJdbLyDvBkQ2AbXmqmM9B?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR10MB4093.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WmJzd0ZaTVFIVGUwM3hSS2F5bkpaSVFZMEYyWXNYMGQyR0NtaVB0R0ZZcWg0?=
 =?utf-8?B?RW5QTXJQZTIwSEtLR0IzMnkwblJwNjlydnBpbVk0Yko1bzBlYWIyc254OUYr?=
 =?utf-8?B?RzNYa2ZQc3h3QnpneGpJcHlhS0lTbjVRSW1Hc0cxa2hNcFZHTDNlSTcyN3dW?=
 =?utf-8?B?Y0hmbDNXdDB0c0doa0Y3b1M4MVhGL20xUmRmblp4TzJZOVZUOVhVc0hqekc3?=
 =?utf-8?B?aDl0TjBlMHFDQnB6YlBOOGJSd1lXaVdTZGZhaUxhSTRkVlJLYjl6UFlVSXdH?=
 =?utf-8?B?QzVzeEVhUDFYOEdJTmtiZVZnaDlkL21xVGRDamliT2hmRFNrRUV6cXl5aW9Q?=
 =?utf-8?B?YXVQVEF0OUxpbnlXSU5VeTZqT2hzUGVLRms1eDQ0aUh4OGxXS0tXeXVzR3I1?=
 =?utf-8?B?UTRPUFBqUjNSOHYzem9sK1BOaytFbnoyVEhndDBVQTU1c0JoNjFTaVFMSTFC?=
 =?utf-8?B?d2RTdG4vWHdkdWNEQ0M0VzYvSk5pSjVRMXhSNGJNdDE2cmRKQTRuTlRwTS9V?=
 =?utf-8?B?b092cG53ZVF2Tm45S2l2VGp5TDJTSTNoUGRCWXN6VkxOOElHTkVqNUVTYmxC?=
 =?utf-8?B?T0gvOTJhR0pJU2RSR1l1eThVVWNVaVZ1d3cvdTh4UkpjSE1LUm1EMmhLbHd5?=
 =?utf-8?B?QXR4WHVML0gyckhWQm81M2g3U3dJaFFET2xQL1hlNFBtdC9YZzFYeXg4T0hG?=
 =?utf-8?B?bi9KSk1UL1RhQTFIV2tBa2pKTHZaNFIxK0xvL1RNeGcydUJ5cG43MEVPaGo0?=
 =?utf-8?B?cG92SmhZKzdxSU5hNGpHUXpqZlExaUovNUk5MENWOXo3cmhsOC9TN3l3TDVw?=
 =?utf-8?B?cWk5T3ZUYXhWZjJxNGN3MUQ0dlkxWlU5ZGMzZW9EWlJrcjNvM2NOekV3Wjk2?=
 =?utf-8?B?cUlPWkw4RmQxVUlTclBhUnRzRlQvS0JxakRWWlBob0E1ZndXQk1BZ2xoV09y?=
 =?utf-8?B?cHZ6L0ZGWGlDWGNNa2ZKUndtZTdpRlVQTkZnRnVXelg5cFVLZExjc012T2Rx?=
 =?utf-8?B?NEhMWXR5bFBHZGRPU1FBemFyc3d2dDd4WmszMFZYSDdJeTBCMGZGQ3lKeDhX?=
 =?utf-8?B?YjI0WlZVSEl5Q0pzNVByMlB4UWtwNUJXQWNqYlhPYUtnMTd0ZXJsQkY0N0RE?=
 =?utf-8?B?ak1qTFQ5YVdvT3daTWhXSzIrR3JVaE5yYktLelAyQlFWbm90VXlZQnhNYTJW?=
 =?utf-8?B?a1RXNnJ4ejYxaHBHbHl3WlFJNDFWTG56Yms1SFliM0IvQXExZzRFNktHS2Np?=
 =?utf-8?B?WVYyenhNWHJkOW1ZUE5KdWxGeDRSbDJ1VjRQS3ZrRVN4RFhQNERIV2hpZEk0?=
 =?utf-8?B?TlBDL3RXZ3RWQ25tZ1o2RlcxY1JDSVRlZmNvWnVkQTgxSzczVk44R3R4ZjRY?=
 =?utf-8?B?NFdrZ3RJUms3UUphMTJEYzk2eFlieHhEaDNZcXRmOVJGNWgwaCtTRHEwUW4y?=
 =?utf-8?B?bWRMaHdKelZNaG9KQXBwdlBYMUgvdVN6R2k4d3Q3Y0c4M2ExVUQxczN1MmJZ?=
 =?utf-8?B?Mk56YVFUUGdyM0tWWnErQkNhVFdJaVFlMkphUDdFdXpGR3BpTkEwWjcwUHA3?=
 =?utf-8?B?aXMyd2NIRXBLZmwvYXZyOWladTNwaVRWYXFBZGg4L1hGVUMwWXpRZ015c3Ba?=
 =?utf-8?B?cXJkYmMvUFViT0dZaUVUNFlLYzE4Q0ZXRS8zZkkrSWRiei8yeGpQZUNIdGhO?=
 =?utf-8?B?MUs2WWZlV1AzYXRsOXFnTFRGditqSFBVc00yZDVPV2lIUHljaG5HNk9xUE9S?=
 =?utf-8?B?THU5NkFWYll5NjlRcDN6b292a2RZcWdLL014bk52TXNWbmVzR25pM0tyUkty?=
 =?utf-8?B?dEJDbkJDcEk3a2ZvdStmNXJYcE1DeXBSMnErZElwR3J5RWtNL29QcTZWTFBk?=
 =?utf-8?B?M09iMHVZcTJvVWtJdDRmZjkranROTE0zYmRVdk1qa1VXVHZwWHJiK2l2OE1E?=
 =?utf-8?B?ejk2NldyZUJZL0E0ZElwV3RtN0ZIT3NiMXNERldORVpmbWRvbWFHTDBBR3Rw?=
 =?utf-8?B?dHVxYUIzR2pocDI2eTFNSi9Qd1hCWENqbk5zV004NXlscFd0Nmg4SEM2akNp?=
 =?utf-8?B?Rlo3SmUzc1FzRHFPK25HSGN1UlYxTEY2ak1PZXZVeWpReXJ2QWwydkUvV2ZP?=
 =?utf-8?B?K2QyV1lKMEpJbTJ1Z3VER00wQWRkZFFidFI0SDFONWFhTDhOQmNSNFlaMnFB?=
 =?utf-8?B?aWc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	/ESi2n3mr06GG5xba5wHOS9xJjGXMQUYKNw/JKGb3V55axiyELH6epj2OUbqgnpJ69ebdmGIAYfJY11qR85Q0bKT/qytdqwB58GEz7fOJzqRSsyIM19jr2rBwty4Ldb2o2cFCLTn9K49ax/s0NRuaEn2pHkCOC8TW02vXmQ/V3YbMURoPNUhsWRpdgG5Ovooube30Ci2UMKwj7eu4MoFRefH6V3qomEVOCx2gwdxPPp84j8i8tH9JIcWiRXz6H3wF0l2cRYdogQHDyiUeBP6haeNGyiVqpSta8JRBto5kLIx67KoPTgTIPbcgkljVNFOhU4jPZ6xm7/CrnTwphr0D12VTTcY2Tlcto6TTuB05BN4L/yvEtj12c4svbtOgqEg+BUvq943Fmb3+DJLxNRG/c2l46RwlOk+M9GcMTrQ3iaaz1OW48pKKf8XICJLLp0/Jdn/GJMzXbDp/TQaWm9C3b9A3u6ofShIUmq1nkca9n4JuSp/hoqP3OJ75THpbCgdAtUvLLwGoh5tKFdzQItlx7lpt+fsxjxr6WddkQWKHTYGQIdQeZEq2e7+k+j3jaaWUvc277k+zp6btAb5WHA8C5Kk36qYRMJBddaJfyXZpnM=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a629ad8d-4cd2-469d-a602-08dcffff64a2
X-MS-Exchange-CrossTenant-AuthSource: BN8PR10MB4084.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2024 14:12:35.8396
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: szWJAwlpLopdVXBMqlQMPTupALDnf6d2MdsK+dsrAtxnIotyczEYmNctA+Z2E6ew19KDIhj5ta5EjRdV4Y1wWQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB7008
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-11-08_11,2024-11-08_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 adultscore=0 spamscore=0
 mlxlogscore=999 phishscore=0 malwarescore=0 bulkscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2409260000
 definitions=main-2411080118
X-Proofpoint-ORIG-GUID: gZRelk4_GgNCqhGawP9mzjv9Gq_NCIX5
X-Proofpoint-GUID: gZRelk4_GgNCqhGawP9mzjv9Gq_NCIX5

On 7 Nov 2024, Eugene Loh stated:

> The whole thing with dtp->dt_tracefs_file is...=C2=A0 interesting. We sto=
re a temporary string in dtp-> just (if I understand correctly)
> to simplify its free.=C2=A0 It's kind of a cool trick but also kind of ug=
ly.=C2=A0 We'll see what Kris says.

Yep! To massively reduce the amount of noise this patch produces. (This
is what torpedoed every previous attempt of mine to do this.)

I stole the idea from libctf, which does something similar (and did even
in the Solaris days) in ctf_lookup_by_name()...

It works until you think you can call tracefs_file() twice in the same
function call, but honestly if that happens the flames will be immediate
and you'll spot it in no time (and so will the valgrind runs we
sometimes do).

> In dt_prov_dtrace.c attach():
>
> *)=C2=A0 We should convert "len=3Dsnprintf(NULL, 0, ...); snprintf(fn, le=
n, ...)" into asprintf() for the format file name.=C2=A0 I realize that
>  in some sense that is "beyond the scope of this patch," but it seems lik=
e we've used a couple of patches recently an an opportunity
>  to fix this sort of thing.

Yeah, that niggled at me but I left it explicitly because I thought
people might think it was a bridge too far. Will change.

There was one other place with a [256] static array which I flipped to a
PATH_MAX in lieu of doing something more dynamic.

> *)=C2=A0 Using the variable uprobe_events first for "uprobe_events" and l=
ater for "events" seems confusing.=C2=A0 At the very least, how about
>  naming uprobe_events to be something more generic.

Agreed. Renamed to "tmp_path" which at least makes it clear that all
that's really consistent about this variable is that it's a path and
it's temporary.

> On 11/6/24 11:46, Nick Alcock wrote:
>> So as of kernel 6.3 (upstream commit 2455f0e124d317dd08d337a75), the
>> canonical tracefs location has moved to /sys/kernel/tracing.  Unfortunat=
ely
>> this requires an explicit mount, and a great many installations have not
>> done this and perhaps never will.  So if the debugfs is mounted on
>> /sys/kernel/debug, it automatically makes /sys/kernel/debug/tracing appe=
ar
>> as it used to, as another tracefs mount. And of course there's nothing
>> special about the "canonical location": it's up to the admin, who might
>> choose to remount the thing anywhere at all.
>
> Anywhere at all?=C2=A0 But the scripts in test/ only look in two places.

Yeah, I didn't fix the tests the same way.

> Speaking of which, could runtest.sh look for TRACEFS and then make that a=
vailable to any test script that needs it?

... in /proc/mounts? I suppose so! I'll have a go.

--=20
NULL && (void)
