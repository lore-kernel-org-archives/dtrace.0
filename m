Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7B8AF513
	for <dtrace@lists.linux.dev>; Tue,  3 Feb 2026 20:41:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770151320; cv=fail; b=q4Te4ybjDjTsE2HCZ4H24+JSe3b7piPitq+Mpxw5C7rKfT2wIkErMpRZpcEky8+hhYinb58hFh55qwSLvZm09n1aEGWkvZJY8lgwib3OdfdBOr+zWX/ApE7AxMP+jj8a9wuYfJlT48rKTfjk6acTMq0+B6tRTjw+SYrYm/p6Ju0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770151320; c=relaxed/simple;
	bh=ixTvxgyM7SNmto2nFLU8nmuE/eT/OOJ5zTj5Uef3O7M=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=LsVSUbInbFXwGO+TtuUqy9vfap0MXHk/pSRDCZstwVxT3D9iWf8U3hz1X6mGNeNBvfiECwTJts7pLaMqL2ox6twX3wP9BY3JQzeMXskdu+ZLC7e8Df4x1StNTCgo9R2KAMopAPQmTMVfD+sLf25JujW9YIwun/9AjLJcJX2qYzQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=LwVnIDvB; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=dIQxvS99; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="LwVnIDvB";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="dIQxvS99"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 613IuE27633223
	for <dtrace@lists.linux.dev>; Tue, 3 Feb 2026 20:41:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=f52rArxie6sgDkP5yxOUINWtTbCJz60hzwuXdofw9KQ=; b=
	LwVnIDvB40DRQwcUe1SQtYLil7+DvxCFpzyJlBIFJQyCfxG47Iv/Cmb/Iup8TA8c
	bGhePsKkrpxd906zqmrBHFe7cl0S5Q6TyxzUWp5xyr+w35N0L1HdI0Cdzp/ZSS0g
	nbzMymkd2O6FheB4Vb/RivUXXQ57p/msgDUZ4RU20BNjnjLetZFEYxmAXK3DtVjZ
	cQrQc81PKeWvO3juT4uKRxX8em10lHjGinSYA1v/EOZGKffTMHh6hYpOfiHEyxJJ
	eofJ8m3V7W8vasVH88BIla5hsnD45baKPXzFSjLi2kqUs/Od1FQGz6ZFQOBb3CfU
	BtischcM2+Miltk0PCkotQ==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4c1au64uc2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 03 Feb 2026 20:41:57 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 613Iem0T034786
	for <dtrace@lists.linux.dev>; Tue, 3 Feb 2026 20:41:56 GMT
Received: from ch5pr02cu005.outbound.protection.outlook.com (mail-northcentralusazon11012052.outbound.protection.outlook.com [40.107.200.52])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4c186ackc6-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 03 Feb 2026 20:41:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Rc/dslS5rOmhKI/bG3tysfOUjEaK/1K+Rmo1+dCjJsN6Yj5GTz33iJO3drgOsBcSY8RosICmVH/vlq5xMX+AmQA+yBZsCI2KCa/2Xngna2qO8rldw+kRQyzjy79sJMT+iJpYp63Yjr0rilV57Ytv265B4pPZnb4Th5gB/2IZjJOZVECO2r/1r+FVRaK+TI4zI17yqBN1o/4vxM90NoDmhQ+Ry4u/EyAfxWNeEaj6AfcOXink8dbYEzTTPsTzjhlyQ4aAmNMK1YV4pfPTsFepUbzCLA3maOmGEOWTx2oF+2Vb9hCrlr9O0An/iRs9ASbH469xnYoBC/azDvvWhSIDyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f52rArxie6sgDkP5yxOUINWtTbCJz60hzwuXdofw9KQ=;
 b=EgGzTrD7lGnbmYbVaXEtOx2p/dLjsD94kdg75t+ENAGeQRH2wa1YsbtxISrRTW14SP0aV3rUcERjQ6TmFwRtVJ61eTo2NzcePK6MFc0hNSd9/2cUGww4n3PLWkBNbHx4Fnqu/Q0fSsMePzo2sSJ/YXz+p71hdrGWG7y6VUpwAJfyGNgWZ8Nrxv29rtUg41BqmiNbp2RwSXtoruloXhFG3rQH35UxcLnktXqzor84yTQI3fMaosQ8/Mp+Vr30VV427mtM9EuK55sjBhTPHCMvCJAucPCBqRk8ztOrX4TtfdMx5o0BgMr0tpkLp3VcsdGvHrvs7R12p8xskrGnh92y2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f52rArxie6sgDkP5yxOUINWtTbCJz60hzwuXdofw9KQ=;
 b=dIQxvS99gvEkg1DZ7ompeKtpnyxCs0Vh7HX0UB3CewOopSBK6ABP04ESl6t5xCp5g1vMvo7RMjSMph4YbAxi2qvw6X8mXjlM3e3tOC+i8Rma14MomVh02D1MfG33veEczllyAqMrLOT0GpQfqnYb0K+J4mP1ersmPt8jvdeyq3A=
Received: from SJ0PR10MB5647.namprd10.prod.outlook.com (2603:10b6:a03:3da::17)
 by LV0PR10MB997660.namprd10.prod.outlook.com (2603:10b6:408:33c::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.12; Tue, 3 Feb
 2026 20:41:54 +0000
Received: from SJ0PR10MB5647.namprd10.prod.outlook.com
 ([fe80::62bc:4b80:54ab:ff97]) by SJ0PR10MB5647.namprd10.prod.outlook.com
 ([fe80::62bc:4b80:54ab:ff97%5]) with mapi id 15.20.9587.010; Tue, 3 Feb 2026
 20:41:53 +0000
Message-ID: <08203c21-d9fa-99a1-1b4c-b0f1bf794c99@oracle.com>
Date: Tue, 3 Feb 2026 15:41:52 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [DTrace-devel] [PATCH] test: account for member name change in
 mm_struct
Content-Language: en-US
To: Kris Van Hees <kris.van.hees@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
References: <DS0PR10MB7522C34E1C6FA098104E192CC29BA@DS0PR10MB7522.namprd10.prod.outlook.com>
From: Eugene Loh <eugene.loh@oracle.com>
In-Reply-To: <DS0PR10MB7522C34E1C6FA098104E192CC29BA@DS0PR10MB7522.namprd10.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PH7PR13CA0006.namprd13.prod.outlook.com
 (2603:10b6:510:174::19) To SJ0PR10MB5647.namprd10.prod.outlook.com
 (2603:10b6:a03:3da::17)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5647:EE_|LV0PR10MB997660:EE_
X-MS-Office365-Filtering-Correlation-Id: 2bb8a79f-ab50-457b-1c04-08de6364aa26
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MmxDWjVyZ0JGVlNNcVNPdVNmanprRDU0cXd4V0JyR2lNWmF6YkM4UzZQcDRP?=
 =?utf-8?B?MHNEdElrVEJlTWZKUFhLaWVyMWl5SjZ1ckxQb1NXQ3lQRDFld24wMjRXR3Fp?=
 =?utf-8?B?dm52RjBxemlzMUFoK2tNcVpab3FvODVGbzIvZXgvQVdvWjByeWwxZ01WTjNu?=
 =?utf-8?B?ay9TbENEWFFGUDRsa0JRcVFmSTJqc2I5VCt3S0lFbmoyVTNkKzlnelIyY3pu?=
 =?utf-8?B?RmdzakJlT0JBbkhnM3phWXN2Y3BwM2RtWjUyclhRNkdRU1lqNUQxOVpSS1lS?=
 =?utf-8?B?WHcrMWQ4T1c1RnZmSWpkYTRmU0RkVzBYQXJJb1BhcUttU3EwN3NkYWhsMjI4?=
 =?utf-8?B?S0ZxN0tVVWlSSkN3YVpDT1hVc0J4bVdyMmpaSlR5Ni9JdFYxUkwxU0R1NDNp?=
 =?utf-8?B?c2VJcGRyMDljNVVTcmxEc1F3aTdBUU1EMXZ2VjFtWkdSUEhRUWNYVWZETkJt?=
 =?utf-8?B?bVJRNUgrMmhFa2ovWVllVnhBSWo0SUsrWWExVlB6aDBqWjJnY21zTldMRnhC?=
 =?utf-8?B?Qk0vczdJUDVrbWZoVCsrSThDYm1kVzVKdWpxNUMzWGd5NWFpTmRBVkNjbEM0?=
 =?utf-8?B?OEZQM015K0Jha2N1bHd6R01Mdk0xcFlUUW9nVFJFQUlQWm5PNWhOdzBlZ3Nw?=
 =?utf-8?B?RnJIRVgyY0ZSQ0ZGYmZ0aVJSUi9EZ1FhSzZwQnZhOElmakhLNVkvUEppdHpZ?=
 =?utf-8?B?YVlkYUJBSFRzcnJXdHlrcEc4RzlRUUw0Mlovcm01YXFtN2E0Z3I0dkhhY1pX?=
 =?utf-8?B?b1BDajZzY1JIemFTczlpUi9qYmFJRGhyNVhqVTdacGtiemNvTEg3RWVPTzh0?=
 =?utf-8?B?N0lVcm94SnZZbXQ2ak1WbCs5NTAwa3RtS3VYdWtCdTdpalVuVGxLdTdLMEFC?=
 =?utf-8?B?dG9NelJkb1BYRzB4MWlOU0hrWEluM1ZqSlh0VkJKWm1MS2IvSSthTXdGbmZM?=
 =?utf-8?B?WXFCVWtEek5ldEFOSnQzOTJKWnVpVlB1YmpHRUN4azZHMVNITml6aGZxYjR6?=
 =?utf-8?B?VnIrVUQ1bFFGeXJ1RVQ4M2dMRXNicStMeU9vb0ErYnFCVHVqL0Z5TU9BOUM2?=
 =?utf-8?B?WnN3aUdrSXBhWHVXQVl6bFBla01XMnc5aUJ3WUc4L2FjNFl5TUtjMGJhb1Er?=
 =?utf-8?B?N2psK0FlOWNRNktzSVhwdUZEZG44eGpBbVJLYm85QVpnaFhrWU5mRzNGK1ZV?=
 =?utf-8?B?SUYya3NJRjc4eUxoTS9qM3ZIZGVOTTU2VWZFbUNSSkhWQlNWcUM2TitQZUJ4?=
 =?utf-8?B?cmd2cEJneHNSaWZUYWV6UWVMcGNwTlB2dDZjRVhkc094amFIN1BDSU1yUm9q?=
 =?utf-8?B?MmVBbDZpb09RdEkxUUR3WnNuVkU2ekk3aDczd01LMTNmUlhvL1ZvaFl6OGxi?=
 =?utf-8?B?SlcrcDg0VTNxMnFSZlFOc3RMWml4Y04wcXN5T0hrU1BpeS9YTkRxVkVpQnAx?=
 =?utf-8?B?eThoVUl0SnkwWXRlanZRNFJ1MmkzaEM3T205ZVlIU3dtZi9ScDNCeDhwOVJZ?=
 =?utf-8?B?d2xXMFVhNFhrNFdobTZhMEpucWlFZUxCaytZOHhIZURqY0o5MUt5NFFrK0Fn?=
 =?utf-8?B?Q1l4QTJLZ0piQnhSVXJnZjlTRzhrOG9LeGYvM05XRnBZZWszcFVyemVMa0ZX?=
 =?utf-8?B?NDd3ZkZ2MUx6MGxRZHpNYzh3cnVzeVd4U3p0dUxFRFRsQ3lvczZ6a2tqZTEw?=
 =?utf-8?B?US9aSllNQVZoZkpiUTE2MHBwbzQzUzExRWQ0Vm54SHEyS2dhRXJGM3ZFUFpP?=
 =?utf-8?B?QmNON1lOblVNbzh6cXR3TVdwTW1UNVpqbk5ES2FmUmEwZHhBZm5LMWJ0bktQ?=
 =?utf-8?B?NnExSE9zTDBLR0I4a3pIVTZRRFp2WkZmZ3NKQ2RkQmV3UWJpYTZoYjJUbjN0?=
 =?utf-8?B?ajdlMzVTY0xBcGx6NEN2eHdpZStCWG44blhtcUVPc29aZjFUUlV3c2Nna29t?=
 =?utf-8?B?a3dkREhNZ3JNd1Z1L3BJUkVLdUhzcEVKaHlWdXZkQ1Zxa244UkloSzFLUi85?=
 =?utf-8?B?Tmxjd3Y3OXdrV2VJa3ppanByZkFMeit2L1JnSnpuY0QvUGd1TWIvbEJwakxr?=
 =?utf-8?B?V2tYYmtZenBOeXZDWWVHaVpjMUs4b1JpQURNM2lVejVDeGFFSXZEYkU3Nk45?=
 =?utf-8?Q?weXDdYoho2kbjMrAkDo0sfAh+?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB5647.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?T1poYUQrMzVZbGh6K0tRNzBES3ZrRzZETmpoRE84d3RGMlNIVDRFbXJsTFdx?=
 =?utf-8?B?SUM5U0VuQlVkSzdsczFXdlIwSFJINXJrN3QyYVYyTkMzZUdpREhPMjUweTRz?=
 =?utf-8?B?enEzWGdnNWMxSDRxSGVtNVFYMWRFWTdwcDRjUS93ZGc3SjVPYTJ6UE5VZ3dr?=
 =?utf-8?B?dXJERytPdEFwcnNmU1gxTUZrZmVMeS9VbXIraU1RM2VYL2IzemhJTGY0dGI3?=
 =?utf-8?B?RUtPV2F0SlZkdk1GeTh4eVM3Uk0rbG9RcXJDSzZidlI0UUwzZ0h0VmMzWllD?=
 =?utf-8?B?UkhWUlpxQWQ5SkNxcDQrWHBBQk93SGl3WENUaGRWR3ZWeVZzUDVCWWhyY1hJ?=
 =?utf-8?B?aFJTc2k3Q1NKbDgxMVY3NW1mb0d6ZWtoZE9JR3hSb3JTeFY5M09ubnhiV3ZR?=
 =?utf-8?B?OGQ0TjJISC8vUkovMEZyaVB4NDBQUWJyZG1UZE11NXh3c2NrVmpvSWdTNFNx?=
 =?utf-8?B?SFA1WE5WaXVYNWxGOEFweWNzOWdLSVduRHNGWGFGMkdqbi8yRzdldVlnRW5R?=
 =?utf-8?B?dnhCWmthbnFVR0tBdEltSlRCTjd6azc5KzFCZ3VqTnRiMXFJMzJEMTJvWk5T?=
 =?utf-8?B?eDMyaWdSbG0weE9nam1MSEd4UUpvWlV2YUlhU21pSGpYNlR5SkhGZ1VZdmZR?=
 =?utf-8?B?aE05QXloOHdteXVxUWZQVW9iUHhzcUpNZUJjYjVhbEloeTYyMWI1OU5uT0hC?=
 =?utf-8?B?YzFYR2xzSnczUFhlVHVjME5IMW82cGxCOEVab2tnNlZNcDJUMnYrTjdSeThL?=
 =?utf-8?B?SFhwRk51S24zZjFmVm9sckdNZXgrcGYvbHpIdW1KWGhlUDhSeDFlYjV3MlBm?=
 =?utf-8?B?N05UQndGR1dGUWtxTTdJeWVWNkxBYmVqREV6YjhtQS9EelZaTE1PdnpwVG5K?=
 =?utf-8?B?M2VUYTdXZW03dU83bWNZQ1dZUlpIWDNKTjlKRlhxSk1UMHBTaFVJdm1LczNa?=
 =?utf-8?B?Rlo4d0g0V1d4V3UzcmR1aHVBN0tRQXpzdkgwNWhoS0hPemJwdEd3akF1bkc4?=
 =?utf-8?B?RlcvNjFyQThnU2NqMUJ1SkEvVWYxcDBXRTdQZms0dFp3citIYkxadnR1K3gy?=
 =?utf-8?B?dm5ENmRYOUQ3UVhIVWZvL3E3TFFIazBjY1ZwQ2pFcUswZVlJYTFnZXJ1Z3dJ?=
 =?utf-8?B?Q2M5bWZnUTVjd0NoMVN3TDBrK25BWGlzeXFxRGlLYVZNcjJaVnVSbEZyL0Z6?=
 =?utf-8?B?eUNycnJ4NEtWMjJzcVJraXdISzVYYktFRVd1ZFh2czhiYmViSEEyTG9YQ1M1?=
 =?utf-8?B?MGltZk8yZzhJZDFaNllEUmhLazI0U1dTL2VXVS9EZVNBd3kxcFVmczlqSnRz?=
 =?utf-8?B?VjVBQ1IrYVFqZk1EZnN0dTg1ZU9ZTTFURFJKT1Q5dnRudzZsdlo2aW5uY2sy?=
 =?utf-8?B?OWQ1UlNEUWMzcXBlM0wvS2t5OWhWankrNnBTT0M0eW1sRVhVb3UweFhJMzBj?=
 =?utf-8?B?QzM1dnhmVFBaT05XZGJkODZPTkc4WlZtMEthWlIrWUxnajF0WktFOU0zQyty?=
 =?utf-8?B?V2lGdCtKekJFTWdMeldpVlM4aHhBQ3AwN081bXpDN0I2VHlVc1JSNGtBZHpk?=
 =?utf-8?B?UlpCc2tOVFltK3JpWDBLcHQ1Z2JVMTZxR3pDU0l1V2R5VDdhaG41WWVnUG1T?=
 =?utf-8?B?T0VBcnMwRld3bDV0aDNycVducWR5eU9lQkRRMUdmYmFyRG15M1ZvcW41NnZr?=
 =?utf-8?B?dndhblJBTi8zcW5pV2V1Z0U1cEhUOTdaUStBeklxeGpJMDhGMUhRVW5pblE5?=
 =?utf-8?B?TktmZjBWVnBuekhhNmZscnlJWExRT0duLzAxZ0tUNzV3c3BtN2tEUVd5aHFV?=
 =?utf-8?B?TWkyYjBZUWlWaXd3QWpaWFI1WUd4WXMzSHBJaWhEUGE1Z051cXFjbUkxTHFa?=
 =?utf-8?B?Z2lSVysvRTVrWS9ITW90MWtVQmY4TDRBNmxMd3hHOEdwQlYvTVArVGpLYVpJ?=
 =?utf-8?B?RkwrZW9lNzQrYWhjN2JVd3ZJMmJZaC9NOTFoTFpET2ErZXFqYVl3ZWVJbEF3?=
 =?utf-8?B?QjlITWRoVkI2elRFMXRNTEUwdlpnR3h4N1Ivd052TU5sTTB5ZGY2SjVwcDdZ?=
 =?utf-8?B?ai9RM3I1aFBqYVlBOGlhVGcvWXRiWnA4b1VNN3FZT0RaZkR5bll3OWltZlh5?=
 =?utf-8?B?d2VqUHBEc083aUNqRUFsVVNmQzJ5UVc4WURRRVplRkxoYXplY1prcTlORHZT?=
 =?utf-8?B?K2Nabm8rYXpJNHMxaVpVNktzWnA5cEhYV2tvUURRcExQMVQ0WU9iL2hicWs5?=
 =?utf-8?B?cmdvVzlJM1FxL1k4YThtdjFFNDdYbTFKVlBjdHkwZzlIaTlnL1ZEMFVWdzg5?=
 =?utf-8?B?Sk1ubGp6eVFlVXlwRlVBd3QrZmk1S3pQR1dEMTBIWDRXMkNZZGFCdz09?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	LKGFqu7DtbLB0HbnLrTNOw4WvjQ0nsrQraEC/XGg2ZyKwESeJlbtlWZtH27sUZVlw/5r0x7oVZ37XIIHJmkR9ckiY+qrpdne7OdKBIBWQH/SvxeG5FAEbv4FWd9M5cc45dLeiO1/vqEFnWuU8h5kNTNBsLHdkYa7g5sqb3Lagq6CrmeqieKlhpgdRwqEouKGu2aYeWMPPQZvcZIKXd8ft0fj4hhRk110TQbNq+Zy5vpgpESkK8MDuDuXOODMyeiBMoh5+9wQQ1U7PVgTQd8VmQiXBCCdOUZD67pQoHm0KxUW8wTYOhEEdeQ7Iyzrzfr/g1OuabPEfxW7gejsA+j28gJu7VKt4ICOe1m0nou96tNy9OEZTcZo1WuerHH+CEc/ULLrvZqsrbLYUlkkBnGdYCVXPnmj0e/q8g2blrm/wWhrWRWFyxAPyf+if8RI8Nn+8DZQeu+sdspfYTMzCEB/l8T/2tHj82KXcSxKJbYo/ldDHkiz+ICYGFW4wPiLBR+GK9CC3+MgHVr55GenGsXooHPvDTUmbIAx91QNUmNnIlQ0jK4PzkMVfVIW1+gAA0ZtTCRoQ/Tjq/HZQfiRY99bcjHxLxKzXyUA9/HePz789v4=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2bb8a79f-ab50-457b-1c04-08de6364aa26
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB5647.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2026 20:41:53.8455
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XBnfdSO+sjAmenICURcJp1T/kfmsTiHg/E0TbcWCxaLHnhGSag7v1+ddg8orHDSR7AKb3VJyfAuRKtj1CgGmBQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV0PR10MB997660
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-03_06,2026-02-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 mlxlogscore=999
 malwarescore=0 spamscore=0 bulkscore=0 adultscore=0 phishscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2601150000 definitions=main-2602030164
X-Proofpoint-GUID: 5ou3CJ23zP1LiUTPjPu0I383OCBulfgb
X-Proofpoint-ORIG-GUID: 5ou3CJ23zP1LiUTPjPu0I383OCBulfgb
X-Authority-Analysis: v=2.4 cv=Nf7rFmD4 c=1 sm=1 tr=0 ts=69825d95 b=1 cx=c_pps
 a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=yPCof4ZbAAAA:8 a=OlUXjQvf9jk1fPXb3Z8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAzMDE2NCBTYWx0ZWRfX7oQhrrc78RXS
 Q+WnwvitjTP66+mD3XrHH9vzomIMbVEYxHaCyKx+AGLSQpKxh2O6h/PQj1riTg9hasurSUaAVLr
 cchAOudu1XpHSUiSVYxrzW39nv6aaiSrKVmid4j99XhEFPR1qlFdM7vXUQT+D8QHOELjRXRgQIz
 lD00VaqgLbHiF4Vno/R0+BY8CVkUqooJDcLNkskuJqKStKQ0df3h+eDiu2GLsOD3rkidYz0ugQd
 Ma63fR2E54Q4vBdxAn4uSj9xKWvfSvHEMlU8BxkgF2wkg+ITV9dmxjQTb8Zk7xf9S3/j5zdZu1m
 AZj/5sPWn8u9ZGKl+m1rul8y68oDWBYxzepgwYq6ZGhHglaRhBjC42+C06HJapqb7VFQf3sNsXH
 KxTW+vtfmLNQonD1HxJGeFTj3lUHBENFUPBDs/sJTHUkUCMzwQ2aPNQW73Sc+1zOV/v3QW/Z3nh
 p2Oi7gC2gpa+g4AKlHA==

I'm curious, does this introduce a new dependency on bpftool that should 
be reflected in the .spec file, or can we take it for granted that 
bpftool will be there?

The "new" .d file needs an updated copyright year.

Is it possible that both .x files "fail"?  For some bad reason, I don't 
know what.  I guess I would have imagined turning the .d test into a .sh 
test that checks for a member name, then chooses it or else the 
alternative, then runs the script.  So the test would have to run, one 
way or the other.

On 2/3/26 11:23, Kris Van Hees via DTrace-devel wrote:
> mm_struct->cpu_bitmap has been renamed mm_struct->flexible_array
>
> Add support for both variants.
>
> Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
> ---
>   ....d => tst.ctf-dynsized-bounds-runtime-1.d} |  0
>   .../tst.ctf-dynsized-bounds-runtime-1.x       | 17 +++++++++++++
>   .../tst.ctf-dynsized-bounds-runtime-2.d       | 25 +++++++++++++++++++
>   .../tst.ctf-dynsized-bounds-runtime-2.x       | 17 +++++++++++++
>   4 files changed, 59 insertions(+)
>   rename test/unittest/arrays/{tst.ctf-dynsized-bounds-runtime.d => tst.ctf-dynsized-bounds-runtime-1.d} (100%)
>   create mode 100755 test/unittest/arrays/tst.ctf-dynsized-bounds-runtime-1.x
>   create mode 100644 test/unittest/arrays/tst.ctf-dynsized-bounds-runtime-2.d
>   create mode 100755 test/unittest/arrays/tst.ctf-dynsized-bounds-runtime-2.x
>
> diff --git a/test/unittest/arrays/tst.ctf-dynsized-bounds-runtime.d b/test/unittest/arrays/tst.ctf-dynsized-bounds-runtime-1.d
> similarity index 100%
> rename from test/unittest/arrays/tst.ctf-dynsized-bounds-runtime.d
> rename to test/unittest/arrays/tst.ctf-dynsized-bounds-runtime-1.d
> diff --git a/test/unittest/arrays/tst.ctf-dynsized-bounds-runtime-1.x b/test/unittest/arrays/tst.ctf-dynsized-bounds-runtime-1.x
> new file mode 100755
> index 00000000..264fa150
> --- /dev/null
> +++ b/test/unittest/arrays/tst.ctf-dynsized-bounds-runtime-1.x
> @@ -0,0 +1,17 @@
> +#!/bin/bash
> +#
> +# Oracle Linux DTrace.
> +# Copyright (c) 2026, Oracle and/or its affiliates. All rights reserved.
> +# Licensed under the Universal Permissive License v 1.0 as shown at
> +# http://oss.oracle.com/licenses/upl.
> +
> +# Skip this test if mm_struct does not have a cpu_bitmap member.
> +
> +type_id=`bpftool btf dump id 1 | \
> +		awk '/\047mm_struct\047/ { print int(substr($1, 2)); }'`
> +
> +if bpftool btf dump id 1 root_id ${type_id} | grep "'cpu_bitmap'" &>/dev/null; then
> +	exit 0
> +fi
> +
> +exit 2
> diff --git a/test/unittest/arrays/tst.ctf-dynsized-bounds-runtime-2.d b/test/unittest/arrays/tst.ctf-dynsized-bounds-runtime-2.d
> new file mode 100644
> index 00000000..5e296d60
> --- /dev/null
> +++ b/test/unittest/arrays/tst.ctf-dynsized-bounds-runtime-2.d
> @@ -0,0 +1,25 @@
> +/*
> + * Oracle Linux DTrace.
> + * Copyright (c) 2023, 2024, Oracle and/or its affiliates. All rights reserved.
> + * Licensed under the Universal Permissive License v 1.0 as shown at
> + * http://oss.oracle.com/licenses/upl.
> + */
> +
> +/*
> + * ASSERTION: Array accesses work for CTF-declared arrays of dynamic size
> + *	      (ensuring the bounds checking is also bypassed at runtime).
> + *
> + * SECTION: Pointers and Arrays/Array Declarations and Storage
> + */
> +
> +BEGIN
> +{
> +	i = pid - pid;			/* Non-constant 0 value. */
> +	trace(curthread->mm->flexible_array[i]);
> +	exit(0);
> +}
> +
> +ERROR
> +{
> +	exit(1);
> +}
> diff --git a/test/unittest/arrays/tst.ctf-dynsized-bounds-runtime-2.x b/test/unittest/arrays/tst.ctf-dynsized-bounds-runtime-2.x
> new file mode 100755
> index 00000000..17aa06df
> --- /dev/null
> +++ b/test/unittest/arrays/tst.ctf-dynsized-bounds-runtime-2.x
> @@ -0,0 +1,17 @@
> +#!/bin/bash
> +#
> +# Oracle Linux DTrace.
> +# Copyright (c) 2026, Oracle and/or its affiliates. All rights reserved.
> +# Licensed under the Universal Permissive License v 1.0 as shown at
> +# http://oss.oracle.com/licenses/upl.
> +
> +# Skip this test if mm_struct does not have a flexible_array member.
> +
> +type_id=`bpftool btf dump id 1 | \
> +		awk '/\047mm_struct\047/ { print int(substr($1, 2)); }'`
> +
> +if bpftool btf dump id 1 root_id ${type_id} | grep "'flexible_array'" &>/dev/null; then
> +	exit 0
> +fi
> +
> +exit 2
