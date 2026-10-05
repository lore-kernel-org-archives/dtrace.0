Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E89417BCA
	for <dtrace@lists.linux.dev>; Mon,  5 Oct 2026 16:25:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791217513; cv=fail; b=EVeC/v4PT6IWHFVn6I7uAS+4XdcAefu3OjigjWsmo+xgfsPfrUw+GH9A6ebCQZYj6rL70sYQYmSYXOAMq/1pTFC8RGj1Ny1mxq+SgIihEwvJeeOPmYFW8kH5VG3OiOrJfVVdyavVG/bfBLaTPtG9ruBHGbHc9zgSI6YJqfd49Yk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791217513; c=relaxed/simple;
	bh=/ulznufup7GhtJT0VO8kwHsZi4Q6umwCVbGNf85yCtU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=iORh+tdP7vrWZWmDq9tjXQI8CgEloNBe5+UPx7fXDQZdFnZhwpkCt6mQqBccPHiDLTQPuxV2iwOovdQzkRUOJCm/FSlNnORduZHKUWf+CvCEX6b3qTa8SM/5wEY6yec0NVhJhBPtrrczfhyx3ozETIdd5vC1S1MNAkjshsLAdcA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=CvnEFyeF; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=Fg/kI8u+; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="CvnEFyeF";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="Fg/kI8u+"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 695DUXsg1856014
	for <dtrace@lists.linux.dev>; Mon, 5 Oct 2026 16:25:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=IBgNCy+9Pe/Avf+Wzf2wASB+xnOoeYywgm3+KzyrC6M=; b=
	CvnEFyeFzPpI9CR2QskLhYIwpeszFIa3VemC3fHt1KjyoJ+ltkBLi5JQlxhOa+f3
	csUXA2ahGpBgx7cgr710IJksWeUUcc7sDSsuJFHhnx6ySZXp/vF4U0u0TrIZvM2h
	g0SBEnKWGQjhlwZ6Dz8SlNmIYtM1BWV9bLnVAzbaasXbAreN2aNy5F57efYPn2ET
	XPUp/rw8uN6Qk6V2bVYNVfakGQ2ChAzZ0Ta09NDLfhxh347u7C8TJocjrE3Dh321
	/EjEngoR0ii/l1FUTBiz+We6Ba5PtPHM8KVMnsKi1b2uAaFM7tCrQNrhT2Mf8jnV
	oV7gpttR60O4zLbIgklp6A==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4h2sas2cm3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 05 Oct 2026 16:25:07 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.7/8.18.1.7) with ESMTP id 695GLfBK029988
	for <dtrace@lists.linux.dev>; Mon, 5 Oct 2026 16:25:07 GMT
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazon11010018.outbound.protection.outlook.com [52.101.85.18])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4h4d4ungb6-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <dtrace@lists.linux.dev>; Mon, 05 Oct 2026 16:25:07 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wPzqKrpIZgUo95j35Fm+VJ8On/jKMljaQBFA0r4itW65K5gGTC+j6p0Ul1G6TJa6tVRfglXCwtezekhvpcQFLAuV1VT/X0xJmYEIBtEWlqE41uvX3ObXT3BFQm1z0KzEagesaLaW8mxz7Ar1NZkHhwvgVefMx6gy/S0gg48CdjQL2d6gcX6hzLZAVEC/eSxMQ2XEjR0pMTtvYHPAp9r+OUNLFrkyH0xmy9xgmYymN5AhVjDXpJk2pg1H8SqE8nedLtJKFIp2gs9j1iCnPLKTlYaC/Nj+jR6ea4zPmVypgIpTCKmWJIv4Z1/2FXs6jByiUIQMtCjHONSagZACS+UEZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IBgNCy+9Pe/Avf+Wzf2wASB+xnOoeYywgm3+KzyrC6M=;
 b=wS+mqanjneoDP9tOJFmQhcusdW0S94Km1mYm6ZlRxTxJFyiNThdo7xXj1gWWBXFxIVFHl5DQ4/+k6HOIjv/3g4sH0cjZt8ox5JBAgTMNyCvoUq9Ga7+GUzoPIXY/p2QmkcLWCMmd+UMC5+YSJnvGcqoNeLGI5OKscO2SY4Owcb3GBv6IjXA57bW0j5DTIK7prsF0oteD1wqIMmbGnpBkV1UIxrzxnBogedjocO7ZuMJZOcazlnMF2rH3oAbNVW/dMrQtt8fUhUnEKLefjC+Noem1XkzjRM6dIjxz5zVv8AB7LFsT+RfnfjI9B+JfUuGvKTDRao2cJxQRm8Fyn2Uhfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IBgNCy+9Pe/Avf+Wzf2wASB+xnOoeYywgm3+KzyrC6M=;
 b=Fg/kI8u+zCE4GfQAuUcMYHw/ptVwZpsEtlM3Xtnu/I983xrVIYMbcsIyNyK1VC+od6I1XAQUfdbdyqG5yXnX1Y6VfSoFjDApshtgODvbhqyPNCrLd6JxJFqC4BdMAcxTk0QN/YIHip/BAehBJEoYItbbCU2yz4z4AkgCJ89XPFU=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oracle.com;
Received: from CO1PR10MB4769.namprd10.prod.outlook.com (2603:10b6:303:98::16)
 by LV3PR10MB8036.namprd10.prod.outlook.com (2603:10b6:408:28c::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.14; Mon, 5 Oct
 2026 16:25:01 +0000
Received: from CO1PR10MB4769.namprd10.prod.outlook.com
 ([fe80::ada4:9b51:3a74:3649]) by CO1PR10MB4769.namprd10.prod.outlook.com
 ([fe80::ada4:9b51:3a74:3649%5]) with mapi id 15.21.0496.008; Mon, 5 Oct 2026
 16:25:01 +0000
Date: Mon, 5 Oct 2026 16:23:40 +0000
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Alan Maguire <alan.maguire@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH v5 05/11] python: Add cpython bindings for libdtrace
Message-ID: <asPPDJIOze_EMmXT@kvh-deb-bpf>
References: <20260821161100.41710-1-alan.maguire@oracle.com>
 <20260821161100.41710-6-alan.maguire@oracle.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260821161100.41710-6-alan.maguire@oracle.com>
X-ClientProxiedBy: PH7P220CA0097.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:32d::15) To CO1PR10MB4769.namprd10.prod.outlook.com
 (2603:10b6:303:98::16)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR10MB4769:EE_|LV3PR10MB8036:EE_
X-MS-Office365-Filtering-Correlation-Id: 52222a79-7980-40da-fadc-08df22fd3447
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|18002099003|22082099003|6133799003|4143699003|3023799007|10067099003|56012099006|5023799004|10063799003;
X-Microsoft-Antispam-Message-Info:
	LcbQpmLV8NgCG3CspYC38+R/+NWkWUTQltPm7piNPvA5EMdnrIjLFaMY9BCyC0a6OJI60lRGrEsC8JMj3HQLtyLlnutfhGD8eniG19B3cBJ8FfE3OaYQXG7YYLciwRjqBitaghfEjfl/GgjEcF5X+2gKIj1mtRkU2RMPLPMPuOxB7mGp4Vlq6qoYwou6Msh7Of6gwKBl9aY4UBrsh3J1FNc9XfGN7zfC4SSB57igFAkBI4FOiJ51T4wTtI5c2zECJqlQL2wpFOg6+Ord2EvdcbaW47YDVl1AWmKk7fLaTmZ7FBW0LxXZP2NGTy1Ll9ZZc8LSJtC1QR7wY2CbGTZTkGh6VYGf6GTQrhg7jQgfCobLOHH9mcOr3kmM01eINYsYl/h1MkjgW9Bo0bDu8LlqVWlq9R89lv7avjXm2gosQBncJ8YwdKK/bHyO1HFIQpJO1FIoMIUA11H7aeEEXYGBPegBZAsiazjlSV79xsmJQb/CfsJUFw9zH7SwjpRfJjs3fNgiZjgt4TZN3+gSgu5XNOo6be2kQVzmZvzGlFiA4S94iR47TBxoDw/t6/eG9oTPwjTvSnGO+oRKP2Eqn4OW9tlVs7eFgONZrmHXB4JsabLZA3Cy4tCcQchZ4ZTm/PB3kT7K3rfw6eY67+hk9MhKpIBOrO3ZYLr1IADP5KG4P14=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR10MB4769.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(18002099003)(22082099003)(6133799003)(4143699003)(3023799007)(10067099003)(56012099006)(5023799004)(10063799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eXpxVDRhT0hQSWxJWnEvdW53RVc3Q2hXY3lleDZZOHBEZ09nN3llbDY0dmxC?=
 =?utf-8?B?Q3JPd2ZpRTRmR0lsYlFCaytaOXFyaFk4bVlOS2w0MU43TnNEVVd1aWt6cHFh?=
 =?utf-8?B?R0RhQXdJaVdwd2xTdHduR0FUb1V5WWwxazBOMTNQRFMxdXhUc3J6RDBZTDBM?=
 =?utf-8?B?ZHVzNHhQZU5lS2FmZ3ExTUlxUmlkMWRqMWY0OTVZZUkyekFpUUJsMW12Q25F?=
 =?utf-8?B?YVpZS2hjNE5KWGFwZk1xK1pnRko1eUN0SU1jajJNeUFrUnoxSmlBbjRKZDIv?=
 =?utf-8?B?eHF0am1JSVZzNzExTW5IR2hHOGNsT2pmb29RSmVEcHB5T2ZlVVQ0MFlVQUpC?=
 =?utf-8?B?OStFa0JrWkVFN3ZYellkTUpWRCszSFovRnhGY1VNOHRWbDBPVytiY0YzS0hE?=
 =?utf-8?B?UEx4cWVTZUlYQi9ROXNqdm5oODI1NkwveGRmcmZOQnJxNXFIZXM5clcrWGNl?=
 =?utf-8?B?cERLbVVmUUl2aEtvZEptSmN5bWs3eWtYK1pnTnZlWjZrbFRycHlBUnRUNUY3?=
 =?utf-8?B?anRnSGZWTkltQ2hoNmRYa3RFQ1lBc0YzdFIwSXNvZFVYbnhUYXVVOFMzcFJD?=
 =?utf-8?B?TDBaTlpabzM4YnZKMEhsMHhhL3BWdWFMTnp0QW03QnNYK3pNOU5Dd3RBTURl?=
 =?utf-8?B?bjVNREh1d3h6QWpGTlJFbmM0dEIzR0liR2JUUUJRUjlxcEM0bnNsRGhPVjd0?=
 =?utf-8?B?eVJ0YVBSSTNla3BueVRCNEM3VEpIMTk3L1o5QWN6UXFqaitXQ0JqdHpOcjlm?=
 =?utf-8?B?MzhyTWV4cFVlY0pkZjdONGZrakNRSkhVRU1sTFBsMGgzK05YMk5HTXhBb2Zl?=
 =?utf-8?B?OVlkU1djNUxXOGJzNXJEdWJ6cDE5Ymlud1NGWHRiZWFzR3JQSHVQVUx6STNy?=
 =?utf-8?B?ZUpkKzE4UFFRcUdYVnRtWlJLay9ZaWRiM01EVnNBK01mRkdXZ1ZPN2kyclJX?=
 =?utf-8?B?emNOVzlqMWNiT3RYKzJWdVlGVXJrUzhlTlVmeUNDSFVSaXAya2FVTVlVaE5T?=
 =?utf-8?B?UVVLUDVJd0E2azVWU3hlM3FwcDg4Q1ljdVRBTGZ0WE5SSjdweFZHK0lidURh?=
 =?utf-8?B?YlpaZU9yMFl0MTlQdFErbHBvVXJUMzNLSUIvYjRtdFQ2NXlmd3UrQWFpV3U2?=
 =?utf-8?B?SW5ZOGU1TXFUSkp1TVJuaU5NZWI0TnZ0MUpYWlYvL0FaUzB1OGlmRHlTTHVs?=
 =?utf-8?B?cXdtdHhaZUs0Z211UzdNY0kwVGJQajBlUmNTamZnSXpYc2htd1lmT3BVaStp?=
 =?utf-8?B?bmxNVEIwNy9DZkdNbzNRMC9GalZCSFFWNTIzNDdGK3VzUmhQOG1CVHNEWGJo?=
 =?utf-8?B?eWF1RHpROSs5VjQxYWwvb1QwTVVJUllxNXk0T3BHZEFPVkhzb2RLY1c1WDdU?=
 =?utf-8?B?dTJaOU41Z0RyREtXblhuSy9sOHlvbzNQOE9ZKzVwVkRMNVRaMjVqOWZoRFNO?=
 =?utf-8?B?bXFjaUVUd2xrVVpENGx5Umg4S2pOdm5BQ1dXM3kwS2xqcmlQUExjd1crUll3?=
 =?utf-8?B?VmE3czNjbWdsaHlXRmVRMXZjVFdXUThBSTBLTzFlYzQ1MUZJNW5Zck1VdmlZ?=
 =?utf-8?B?UDRMNFZHOG0xa1RiODlxOHRzL3EvZmVMVTl0OUNNckovd0dDaGk1ZjV6eVNl?=
 =?utf-8?B?eC8wWlUwQkxQRzlqY01lNDE3V3BpSUw5MHR0N0Q1OTlwRkFzcUF0UDZnYUVp?=
 =?utf-8?B?aG0vOTRCa0RqMWxWalNBLzNsS1JEVHZtdWU3aStTNEVrSTdwa09idGNIRjdT?=
 =?utf-8?B?b1BFdStISjJXcGpkaFJQQStoaCt0VkNLWlR5ZHY1cFZxNytlZDZ3bURQUmNC?=
 =?utf-8?B?N1psUnY1Ry8rSzM3QVkwTUZYZzhqR1ZNRDBCYmNNREVGS1BOQUdxdVJFNnBO?=
 =?utf-8?B?TW9ncUxpUjRuWFFTa2JvMDlvbHJsQWk0MHEzQk54SDhzTEFqeFphaFppNUJ2?=
 =?utf-8?B?b05kVGtibDg3WnFPbTNQaXpuZzFxbStDVzZTTDRjRHpSN3hWNjRiZ3lNcjZo?=
 =?utf-8?B?eXBMZWFPSHJZZ0pSdFNWQUt6RUEzOUx0YmVSZFYzb1RIcXp1VDZ0dytPaGgr?=
 =?utf-8?B?VXRzNGx5UlpZNHRLQ1RVTitHRGJleTkveER0RVVWdGZQdFFzelV6cXFuM0Rn?=
 =?utf-8?B?S2dnN0dQWEY5b0szcU1ocmxMZFMzbVBqRXc4T2VCZm5ja0VBTVhrRW83WUMw?=
 =?utf-8?B?MFg4dkJVRDRtZWlJRmpJa1lCWTlkdE42T1NOT0x1T1NjT09mNEh6VjhobFNF?=
 =?utf-8?B?aFNCakowbldrZmxFQm5SL2tVaEJubllqeVBrS2wxZWM5TWxjMVdhakV0b2tu?=
 =?utf-8?B?QzhTMDVLTGhiSXNqYVlSOFpZQVlYaitYSjdtU21icGlKYWVXdkFabkNxbldQ?=
 =?utf-8?Q?FdYuoFAIgp0A655c=3D?=
X-Exchange-RoutingPolicyChecked:
	pQ/ULGCn02UeFtHvJzFX3WXq3alCswwYZk3Q0YM9k0i3qvT7rqAN5UlPdXJoFSFqZ1BdQ7I7+sFY+zF5dNcEIqs7wo8kzPSTOyMwZxW1xtuEAz0GQbCwrFo/dphurdy+9iN5BNMRP4ltHe+CiQaWXb2iN0GNl2Wqs92n1KO5/3tmBGkZfQ87h4X1oKUUGjLbEFaS5TBOOyl3c0a7/HHfDARLYvp+uYKo5FQQGxEEK+DeYnYqjegqzAav3AiRCCcG4Tnd8zoogT6aLhl3Xq4oUb2Et76UV4DLjWVjHkdfuifeFPytpOHt4lkKZIX2DLLuq3Ypy8EXsg9NDG180lACbw==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	HT/DIgJvttT4/espzfc/t4V0PygOgtLqSczEQrOf6hMbgxRj0NOsScSlWn8fU9S4s9ZGlZO7PL4RiMgcCe8v+2fP/xBRovhdIU12lmMhopbzOlJS4ZH21XGoEX03BGNvcgDgVBwi1cR86Zc6lFc1jK13ivsveNxADrbHDRzHiJx2jrNnBSoclTolXbd0GefMThjzK3CYUpYHHzVocbMDI7zlbtz4cS7xzA897kkQKegnV+pJAs31Rwue3jbPsgtdiUmVDIn+bRm6soFWbEFT8LoX+FMm/ljmuZKiYBD3c3U02p7Jm7e9y6wNUKs2Q2ur/hZKwnxRqf+xQnowG8yjx4Ka6uSkQQsjGxWBB8aetL3e0zbaB5DSJhR2aWjFGcWWmv2tTJh+LIYZ8nngfN3lGE2yXKenW1wDYL2d7Ss748rMelFiN1E5B+2a325SAC+yqIWzYdl0R9mcr8btPHFlmyRfrddTABlYKg4filfK7v+plXBqhtqC0C8cI/ZlF1/iS/jgNygemuZ8xiNSfQSkPmn17VswtdQq2U0itnuq6cLwA1iYZzFCPGHEF2zjcJMbJtF+6KH8Z0ki2w32SCKGTmFXmwhlRMdZPEj0zbk+J4I=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 52222a79-7980-40da-fadc-08df22fd3447
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4769.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Oct 2026 16:25:01.3565
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JT0MxA/nWm1ORzGSA4ZxKJV3GcQxjFATyRgHTKzDoYt9Uwy/jJHM+Fd5gDzuvcbryovF/G5xA8Wj/CwA+2FwHSeXw1IiHkdrmy0LIRu7NEk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR10MB8036
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-05_04,2026-10-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 suspectscore=0 adultscore=0 spamscore=0 lowpriorityscore=0 phishscore=0
 mlxscore=0 mlxlogscore=999 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2609040000 definitions=main-2610050064
X-Proofpoint-ORIG-GUID: XiZCo5OOjMth-NnBMZXKsTeFX9Q1Lg1Y
X-Authority-Analysis: v=2.4 cv=RIMmjIi+ c=1 sm=1 tr=0 ts=6ac3cf64 b=1 cx=c_pps
 a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=jiCTI4zE5U7BLdzWsZGv:22 a=3I1J8UUJPc9JN9BFgKH3:22 a=yPCof4ZbAAAA:8
 a=z2X1kLtFHZl4ldFEXI4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=O8hF6Hzn-FEA:10 a=5yU3S35YU4bGjq-dph-N:22 a=Bho9c0fBagfJEIQBS7DQ:22 cc=ntf
 awl=host:12107
X-Proofpoint-GUID: XiZCo5OOjMth-NnBMZXKsTeFX9Q1Lg1Y
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA1MDA2NCBTYWx0ZWRfX8eD0zp1Ql9go
 UApgusVipR0KRihOg0UnTVqqWA6WsEsVZT8wE+xrjnEqJxOjr2BTsDKzZJVbsKu1NOokQUzuucg
 I/0ehlmSBrxEql+z5nGOBKrZ5ATQwD97EftsV01N60WDBdU+0JF8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA1MDA2NCBTYWx0ZWRfX/Xncoc2ip6kD
 wwN3qPvMm1oMujcEX+SGPga0QhI4eBPvAmtYcbkz+iYeCpKZC48DDxJ3xXCfR4JYMV0DPsZMvbQ
 JeiIXiHjudYqlu0MNNAsRVTM1QSyy8jFguKkg8XqVbKnyFeZqpK0z76ekdYMWI/2i3XZqhnmUii
 mO5jrWjgxbKNyMypWFYDjKCzYoT6MPmHjOX34GTeghBHtdgO9vkKtW5tDjvchJtFV8J49ZN4nnW
 cjBVaXFv1Mr4s3lmgfc5QH2Ea5zOCvOhVctasjWZx9MX+5ZMkeT0Z9BnSUvUBFxUzFrEoUB81bW
 Vv29g/3MHQyJRusDzHKl+F91xLRM29931dT7uzD9VyhF1pWH6P2OkOdjxBSGHpVhT+yfUCm2CJ6
 7YJmwz8pawyWgdSv3KZM8MDNMqCNR36FhlkXmerlaIxSHwNlSyeCDWUKnE+7AdGXsvtS9pLHVNz
 uDsWbthcLfl6a+gYv8g3Ppao2VWUizi1RZVfoci0=

This is great work!

A few initial comments below as a result of trying to merge the code
to do a thorough review.  I am addressing the blocking ones as I merge
the code to a temp tree, but wanted to make you aware.

On Fri, Aug 21, 2026 at 05:10:53PM +0100, Alan Maguire wrote:
> This set of bindings allows interaction with DTrace programs
> from python using libdtrace interfaces under the hood.
> 
> The process is to
> 
> 1. Instantiate a PyDTraceSession
> 2. Compile a program string via session.compile()
> 3. Enable probes via session.enable(program)
> 4. Control execution via session.go(), session.work(), session.stop()
> 5. Consume data: use session.work() to retrieve probe data
> 
> For example to run DTrace for 5 seconds, collecting systemcalls
> aggregated by executable name and system call:
> 
> from dtrace import DTraceSession
> import time
> 
> DURATION=5
> 
> PROGRAM = r"""
>  syscall:::entry
>  {
>   @counts[execname, probefunc] = count();
>  }
> """
> 
> with DTraceSession() as dt:
>     prog = dt.compile(PROGRAM)
>     info = dt.enable(prog)
>     dt.go()
>     end = time.monotonic() + DURATION
>     print(f"Enabled program; matched {info['matches']} probes.")
>     try:
>         while time.monotonic() < end:
>             time.sleep(0.1)       # reduce CPU burn when idle
>     except KeyboardInterrupt:
>         print(f"Exiting...\n")
>     finally:
>         dt.work()
>         dt.stop()
>         # Snapshot aggregations and display results
>         dt.agg_snap()
>         for record in dt.agg_walk("valrev"):
>             execname = record["keys"][0][0]
>             probefunc = record["keys"][1][0]
>             print(f"{execname:<40} {probefunc:<40} {record['value']:<10}")
> 
> $ sudo python3 syscall.py
> Enabled program; matched 367 probes.
> python3                        pselect6                       50
> ruby                           futex                          34
> 
> Python bindings are built by default, but specifying --without-python
> to ./configure avoids building them.
> 
> Aggregation keys are represented as a list; each key is itself
> a list so a multi-key aggregation is a list of a list.
> If a key is a stack() or ustack() it is represented as an
> ordered list of symbols from leaf to root; if the key is null
> it is an empty list as in @foo = count();
> 
> Aggregation values are represented as integers/double for the most part;
> quantized aggregation values are represented as a dict keyed by bucket.
> 
> See bindings/python/README.md for more details.
> 
> Signed-off-by: Alan Maguire <alan.maguire@oracle.com>
> Assisted-by: OpenAI Codex CLI
> ---
>  GNUmakefile                           |    3 +
>  bindings/Build                        |   39 +
>  bindings/python/README.md             |  205 +++
>  bindings/python/pyproject.toml        |    3 +
>  bindings/python/setup.py              |   67 +
>  bindings/python/src/pydtrace_module.c | 2057 +++++++++++++++++++++++++
>  configure                             |    4 +-
>  7 files changed, 2377 insertions(+), 1 deletion(-)
>  create mode 100644 bindings/Build
>  create mode 100644 bindings/python/README.md
>  create mode 100644 bindings/python/pyproject.toml
>  create mode 100644 bindings/python/setup.py
>  create mode 100644 bindings/python/src/pydtrace_module.c
> 
> diff --git a/GNUmakefile b/GNUmakefile
> index 10530f3c..e26a1d84 100644
> --- a/GNUmakefile
> +++ b/GNUmakefile
> @@ -106,6 +106,9 @@ INSTPKGCONFIGDIR = $(DESTDIR)$(PKGCONFIGDIR)
>  TESTDIR = $(LIBDIR)/dtrace/testsuite
>  INSTTESTDIR = $(DESTDIR)$(TESTDIR)
>  WITH_SYSTEMD = y
> +PYTHON ?= python3
> +PYTHON_BINDINGS_AVAILABLE := $(shell $(PYTHON) -c 'import os, sysconfig, setuptools; assert os.path.isfile(os.path.join(sysconfig.get_path("include"), "Python.h"))' >/dev/null 2>&1 && echo y)
> +WITH_PYTHON ?= $(PYTHON_BINDINGS_AVAILABLE)

I think we should do this availability-checking in Makeconfig, since
that is where we do it for other cases.  The configure script then
should also get a --with/without-python option to let the user specify
whether they want it.

>  TARGETS =
>  
>  DTRACE ?= $(objdir)/dtrace
> diff --git a/bindings/Build b/bindings/Build
> new file mode 100644
> index 00000000..d02ead05
> --- /dev/null
> +++ b/bindings/Build

This Build file should be in bindings/python, and bindings/Build should
just be a simple driver for building its subdirectories.

> @@ -0,0 +1,39 @@
> +# Python bindings integration
> +
> +PYTHON_SRC_DIR := bindings/python
> +PYTHON_BINDINGS_OUT := $(objdir)/bindings/python
> +PYTHON_BINDINGS_STAMP := $(PYTHON_BINDINGS_OUT)/.built
> +PYTHON_SITEARCH ?= $(shell $(PYTHON) -c 'import sysconfig; print(sysconfig.get_path("platlib"))')
> +
> +ifeq ($(WITH_PYTHON),y)
> +ifeq ($(PYTHON_BINDINGS_AVAILABLE),)
> +$(error Python bindings requested, but $(PYTHON) development headers or setuptools are unavailable; install them or use --without-python)
> +endif
> +
> +TARGETS += bindings-python
> +PHONIES += bindings-python install-python
> +
> +bindings-python: $(PYTHON_BINDINGS_STAMP)
> +
> +$(PYTHON_BINDINGS_STAMP): $(objdir)/libdtrace.so \
> +	$(wildcard $(PYTHON_SRC_DIR)/src/*.c) \
> +	$(PYTHON_SRC_DIR)/setup.py \
> +	$(PYTHON_SRC_DIR)/pyproject.toml
> +	$(call describe-target,PYTHON,$(PYTHON_BINDINGS_OUT))
> +	mkdir -p $(PYTHON_BINDINGS_OUT)
> +	cd $(PYTHON_SRC_DIR) && \
> +		DTRACE_OBJDIR="$(abspath $(objdir))" $(PYTHON) setup.py build_ext \
> +	    --build-lib $(abspath $(PYTHON_BINDINGS_OUT)) \
> +	    --build-temp $(abspath $(PYTHON_BINDINGS_OUT))/temp

For consistency, we should specify -q on the build command wben
verbose=no.

> +	touch $@
> +
> +install:: install-python
> +
> +install-python: $(PYTHON_BINDINGS_STAMP)
> +	$(call describe-install-target,$(PYTHON_SITEARCH),$(notdir $(wildcard $(PYTHON_BINDINGS_OUT)/dtrace*.so)))
> +	mkdir -p $(DESTDIR)$(PYTHON_SITEARCH)
> +	install -m 755 $(PYTHON_BINDINGS_OUT)/dtrace*.so $(DESTDIR)$(PYTHON_SITEARCH)
> +endif
> +
> +clean::
> +	rm -rf $(PYTHON_BINDINGS_OUT)
> diff --git a/bindings/python/README.md b/bindings/python/README.md
> new file mode 100644
> index 00000000..a39d9176
> --- /dev/null
> +++ b/bindings/python/README.md
> @@ -0,0 +1,205 @@
> +# Python bindings for libdtrace
> +
> +This directory contains Python bindings for the `libdtrace` consumer API. The
> +extension allows Python applications to compile D programs, enable and control
> +tracing, and inspect aggregation results (including associative arrays) without
> +shelling out to the `dtrace` CLI.
> +
> +## Requirements
> +
> +- Python 3.6 or newer
> +- libdtrace
> +- A working C compiler toolchain and Python development headers
> +
> +## Building and installing
> +
> +```bash
> +# Build dtrace first (from repository root)
> +$ make
> +$ sudo make install
> +```
> +
> +Alternatively you can install using pip:
> +
> +```
> +# Install the bindings into your current Python environment
> +$ cd bindings/python
> +$ python3 -m pip install --upgrade build
> +$ python3 -m pip install -e .
> +```
> +
> +## Quick start
> +
> +```python
> +from dtrace import DTraceSession
> +
> +program = """
> +#pragma D option quiet
> +syscall::open*:entry
> +{
> +    @counts[execname] = count();
> +}
> +"""
> +
> +with DTraceSession() as dt:
> +    compiled = dt.compile(program)
> +    dt.enable(compiled)
> +    dt.go()
> +    # ... run workload here ...
> +    dt.work()
> +    dt.agg_snap()
> +    for entry in dt.agg_walk():
> +        print(entry["keys"], entry["samples"], entry["value"])
> +```
> +
> +## API Guide
> +
> +### Sessions and lifecycle
> +
> +`dtrace.DTraceSession` is the entry point. Sessions implement the context
> +manager protocol so the recommended pattern is:
> +
> +```python
> +from dtrace import DTraceSession
> +
> +with DTraceSession() as dt:
> +    ...
> +```
> +
> +Upon construction the binding calls `dtrace_open()`/`dtrace_init()` and installs
> +its default buffer sizing (`aggsize`/`bufsize`). The session must remain open
> +for the lifetime of any compiled programs or grabbed processes. If you create a
> +session without a context manager, remember to call `close()` when finished.
> +
> +Use `setopt(option, value=None)` to tune libdtrace options before enabling a
> +program. Any value is converted to a string; passing `None` clears an option.
> +
> +### Compiling and enabling programs
> +
> +`compile(program, cflags=0, argv=None, spec=DTRACE_PROBESPEC_NAME,
> +defines=None)` returns a `DTraceProgram` object bound to the session. The
> +optional `argv` sequence is encoded to UTF-8 and supplied as the D-script
> +argument vector (for positional `$1`, `$2`, and so on); it is not a C
> +preprocessor argument list.
> +
> +`defines` accepts a sequence of macro definitions such as
> +`["FEATURE=1", "DEBUG"]`. Supplying it enables C preprocessing and passes
> +each definition to cpp. Compile-time flags such as `DTRACE_C_ZDEFS` can be
> +combined with it:
> +
> +```python
> +from dtrace import DTRACE_C_ZDEFS, DTraceSession
> +
> +program = """
> +missing-provider:::probe { trace(1); }
> +BEGIN { @value = sum(FEATURE); }
> +"""
> +
> +with DTraceSession() as dt:
> +    compiled = dt.compile(
> +        program,
> +        cflags=DTRACE_C_ZDEFS,
> +        defines=["FEATURE=42"],
> +    )
> +    dt.enable(compiled)
> +```
> +
> +For preprocessing without macro definitions, pass `DTRACE_C_CPP` explicitly.
> +This is required for C preprocessor directives such as `#include`:
> +
> +```python
> +from dtrace import DTRACE_C_CPP, DTraceSession
> +
> +program = '#include "my_dtrace_defs.h"\nBEGIN { trace(MY_CONSTANT); }'
> +
> +with DTraceSession() as dt:
> +    compiled = dt.compile(program, cflags=DTRACE_C_CPP)
> +    dt.enable(compiled)
> +```
> +
> +Each compiled program must be passed into
> +`enable(program)` which returns a dictionary summarising the probe attributes
> +(`aggregations`, `recgens`, `matches`, `speculations`, `descattr`, `stmtattr`).
> +
> +### Running the tracing loop
> +
> +Invoke `go(cflags=0)` to transition the session into a running state. Typical
> +loops alternate between driving the consumer and handling results:
> +
> +```python
> +dt.go()
> +while dt.status() == dtrace.DTRACE_STATUS_OKAY:
> +    status, probes = dt.work(return_records=True)
> +    # inspect `probes`, drive workload, or break once done
> +
> +dt.stop()
> +```
> +
> +`status()` wraps `dtrace_status()` but also reports synthetic values tracked by
> +the binding when the traced processes exit or when an `exit()` action fires.
> +`go()` may be followed by `update()` to re-scan loaded kernel modules if probes
> +are added dynamically, and `stop()` can be called manually to halt collection.
> +
> +`work(return_records=False)` executes `dtrace_work()`. Its return value is a
> +`(status, probes)` tuple where `status` is one of the exported
> +`DTRACE_STATUS_*` constants and `probes` is a list of dictionaries describing
> +each consumed probe firing. With `return_records=False`, `probes` is empty;
> +passing `return_records=True` captures full probe metadata plus a list of
> +record descriptors (size, action, alignment, raw bytes, and any libdtrace
> +metadata).
> +If you are just dealing with aggregations, there is no need to return records;
> +aggregation snapshot walk is all you will need.
> +
> +### Aggregations and snapshots
> +
> +`agg_snap()` issues `dtrace_aggregate_snap()` to freeze the aggregation buffer;
> +`agg_walk(mode="values")` walks that snapshot using the selected ordering mode
> +(`"default"`, `"values"`, `"valrev"`, `"keys"`, etc.) and returns a list of
> +entries. Each entry is a dictionary with:
> +
> +- `keys`: ordered list of aggregation keys.
> +- `samples`: raw sample count collected for the entry.
> +- `normal`: the normalisation factor applied to the aggregate (1 if unused).
> +- `value`: the converted aggregate value.
> +- `raw`: the raw byte payload backing `value`.
> +
> +Stacks produced by `stack()`, `ustack()`, or `jstack()` actions are converted to
> +Python lists ordered from root to leaf (the binding inserts the deepest frame at
> +the end of the list). Quantization actions (`quantize`, `lquantize`,
> +`llquantize`) are represented as dictionaries mapping bucket identifiers to
> +counts, already divided by any aggregation normaliser. Buckets use the same
> +numeric semantics as libdtrace (e.g., powers-of-two for `quantize` or explicit
> +boundaries for `lquantize`).
> +
> +The raw data remains available in `entry["raw"]` when you need the original
> +binary layout, for example to re-run libdtrace helpers.
> +
> +### Process control helpers
> +
> +The binding exposes libdtrace process control for coordinated tracing:
> +
> +- `proc_create(args)` forks a new traced process, using the provided argument
> +  list. It returns a `DTraceProc` wrapper that keeps the underlying handle.
> +- `proc_grab_pid(pid)` attaches to an existing process by pid.
> +- `proc_continue(proc)` resumes a previously created or grabbed process and
> +  marks it as live so the session can detect when all traced processes exit.
> +- `proc_release(proc)` releases libdtrace’s hold on the process once finished.
> +
> +`DTraceProc` currently exposes `getpid()` to query the grabbed pid. The session
> +tracks how many processes are created or grabbed so that when the last one
> +exits the consumer loop observes `DTRACE_STATUS_EXITED` and stops automatically.
> +
> +### Detecting completion or stop conditions
> +
> +The binding raises `DTraceError` when libdtrace reports failures. To detect a
> +graceful stop, inspect either `status()` or the first element of the tuple
> +returned by `work()`. When libdtrace reports `DTRACE_STATUS_STOPPED` or
> +`DTRACE_STATUS_FILLED`, you can drain remaining data, call `agg_snap()`/
> +`agg_walk()` if needed, and then `close()` the session. A session observing a
> +`DTRACEACT_EXIT` record records the exit status internally, and a stopped state
> +is reported even if `dtrace_status()` still returns `DTRACE_STATUS_OKAY`, so
> +applications can rely on `status()` reflecting exits from traced processes.
> +
> +When running under a context manager, exiting the `with` block closes the
> +session automatically, regardless of whether tracing finished normally or due
> +to `stop()`.
> diff --git a/bindings/python/pyproject.toml b/bindings/python/pyproject.toml
> new file mode 100644
> index 00000000..7b959378
> --- /dev/null
> +++ b/bindings/python/pyproject.toml
> @@ -0,0 +1,3 @@
> +[build-system]
> +requires = ["setuptools>=64", "wheel"]
> +build-backend = "setuptools.build_meta"
> diff --git a/bindings/python/setup.py b/bindings/python/setup.py
> new file mode 100644
> index 00000000..331e67df
> --- /dev/null
> +++ b/bindings/python/setup.py
> @@ -0,0 +1,67 @@
> +import os
> +import subprocess
> +from pathlib import Path
> +from typing import List
> +
> +from setuptools import Extension, setup
> +
> +ROOT = Path(__file__).resolve().parents[2]
> +OBJDIR = Path(os.environ.get("DTRACE_OBJDIR", ROOT / "build"))
> +
> +def project_version() -> str:
> +    """Return the DTrace version used by the top-level build."""
> +    version = os.environ.get("DTRACE_VERSION")
> +    if version:
> +        return version
> +
> +    return subprocess.check_output(
> +        [str(ROOT / "libdtrace" / "mkvers"), "-vcurrent=t",
> +         str(ROOT / "libdtrace" / "versions.list")],
> +        universal_newlines=True,
> +    ).strip()
> +
> +# Default include directories assume an in-tree build of libdtrace.
> +default_include_dirs = [
> +    str(ROOT / "include"),
> +    str(ROOT / "libdtrace"),
> +    str(ROOT / "uts" / "common"),
> +    str(ROOT / "include" / "dtrace"),
> +    str(OBJDIR),
> +]
> +
> +default_library_dirs: List[str] = []
> +if OBJDIR.exists():
> +    default_library_dirs.append(str(OBJDIR))
> +
> +extra_include = os.environ.get("DTRACE_INCLUDE_DIRS")
> +if extra_include:
> +    default_include_dirs.extend(p for p in extra_include.split(os.pathsep) if p)
> +
> +extra_library = os.environ.get("DTRACE_LIBRARY_DIRS")
> +if extra_library:
> +    default_library_dirs.extend(p for p in extra_library.split(os.pathsep) if p)
> +
> +extra_link_args = os.environ.get("DTRACE_EXTRA_LINK_ARGS", "").split()
> +extra_compile_args = os.environ.get("DTRACE_EXTRA_COMPILE_ARGS", "").split()
> +
> +ext_modules = [
> +    Extension(
> +        "dtrace",
> +        sources=["src/pydtrace_module.c"],
> +        include_dirs=default_include_dirs,
> +        libraries=["dtrace"],
> +        library_dirs=default_library_dirs,
> +        extra_compile_args=extra_compile_args,
> +        extra_link_args=extra_link_args,
> +    )
> +]
> +
> +setup(
> +    name="dtrace",
> +    version=project_version(),
> +    description="Python bindings for libdtrace",
> +    author="Oracle Linux DTrace maintainers",
> +    license="UPL",
> +    python_requires=">=3.6",
> +    ext_modules=ext_modules,
> +)
> diff --git a/bindings/python/src/pydtrace_module.c b/bindings/python/src/pydtrace_module.c
> new file mode 100644
> index 00000000..917c4604
> --- /dev/null
> +++ b/bindings/python/src/pydtrace_module.c
> @@ -0,0 +1,2057 @@
> +/*
> + * Python bindings for libdtrace.
> + *
> + * This module exposes a thin object oriented wrapper around libdtrace so that
> + * Python applications can compile, enable, and control tracing programs while
> + * also consuming aggregation results as native Python objects.
> + *
> + * Oracle Linux DTrace is licensed under the Universal Permissive License v 1.0.
> + */
> +
> +#define PY_SSIZE_T_CLEAN
> +#include <Python.h>
> +
> +#include <stdio.h>
> +#include <stdint.h>
> +#include <stdlib.h>
> +#include <string.h>
> +#include <errno.h>
> +#include <math.h>
> +#include <sys/param.h>
> +#include <sys/types.h>
> +#include <pthread.h>
> +
> +#include <dtrace.h>
> +#include "dt_aggregate.h"
> +
> +#ifndef UNUSED
> +#define UNUSED(x) ((void)(x))
> +#endif
> +
> +/*
> + * libdtrace handles are serialized by a per-session lock.  It protects a
> + * handle across all libdtrace operations, including calls that release the
> + * GIL while they may block.  The GIL is dropped only where the libdtrace call
> + * and its callbacks do not access Python objects.
> + *
> + * Compilation additionally uses a process-wide lock because libdtrace's
> + * compiler has global state shared by all sessions.
> + */
> +typedef struct {
> +	PyObject_HEAD
> +	dtrace_hdl_t *dtp;
> +	FILE *fp;
> +	int pids;      /* pid()s _create()ed or grab()bed */
> +	int pids_live; /* _continue()d active processes */
> +	int status;    /* EXITed or STOPPED */
> +	int exit_status;
> +	int closed;
> +	pthread_mutex_t dt_lock; /* Serialize access to this libdtrace handle. */
> +} PyDTraceSession;
> +
> +typedef struct {
> +	PyObject_HEAD
> +	PyDTraceSession *session;
> +	dtrace_prog_t *prog;
> +} PyDTraceProgram;
> +
> +typedef struct {
> +	PyObject_HEAD
> +	PyDTraceSession *session;
> +	struct dtrace_proc *proc;
> +} PyDTraceProc;
> +
> +static PyObject *PyExc_DTraceError = NULL;
> +
> +/* ------------------------------------------------------------------------- */
> +/* Utility helpers                                                           */
> +/* ------------------------------------------------------------------------- */
> +
> +static int
> +ensure_open(PyDTraceSession *self)
> +{
> +	if (self->closed || self->dtp == NULL) {
> +		PyErr_SetString(PyExc_DTraceError, "DTrace session is closed");
> +		return -1;
> +	}
> +
> +	return 0;
> +}
> +
> +/*
> + * Do not hold the GIL while waiting for a libdtrace operation in another
> + * thread.  In particular, work() drops the GIL while it waits for data but
> + * retains this lock to keep its handle alive.
> + */
> +static void
> +session_dtrace_lock(PyDTraceSession *self)
> +{
> +	Py_BEGIN_ALLOW_THREADS
> +	pthread_mutex_lock(&self->dt_lock);
> +	Py_END_ALLOW_THREADS
> +}
> +
> +static void
> +session_dtrace_unlock(PyDTraceSession *self)
> +{
> +	pthread_mutex_unlock(&self->dt_lock);
> +}
> +
> +static int
> +session_dtrace_lock_open(PyDTraceSession *self)
> +{
> +	session_dtrace_lock(self);
> +	if (self->closed || self->dtp == NULL) {
> +		session_dtrace_unlock(self);
> +		PyErr_SetString(PyExc_DTraceError, "DTrace session is closed");
> +		return -1;
> +	}
> +	return 0;
> +}
> +
> +static PyObject *
> +raise_dtrace_error_with_code(dtrace_hdl_t *dtp, int error, const char *ctx)
> +{
> +	const char *msg =
> +		dtp != NULL ? dtrace_errmsg(dtp, error) : "unknown error";
> +
> +	if (ctx != NULL)
> +		PyErr_Format(PyExc_DTraceError, "%s: %s", ctx, msg);
> +	else
> +		PyErr_SetString(PyExc_DTraceError, msg);
> +
> +	return NULL;
> +}
> +
> +static PyObject *
> +raise_dtrace_error(PyDTraceSession *self, const char *ctx)
> +{
> +	int error = dtrace_errno(self->dtp);
> +	return raise_dtrace_error_with_code(self->dtp, error, ctx);
> +}
> +
> +static int
> +dict_set_ulong(PyObject *dict, const char *key, unsigned long value)
> +{
> +	PyObject *obj = PyLong_FromUnsignedLong(value);
> +	int rc;
> +
> +	if (obj == NULL)
> +		return -1;
> +
> +	rc = PyDict_SetItemString(dict, key, obj);
> +	Py_DECREF(obj);
> +	return rc;
> +}
> +
> +/* ------------------------------------------------------------------------- */
> +/* Aggregation walk context                                                  */
> +/* ------------------------------------------------------------------------- */
> +
> +typedef struct {
> +	PyObject *list;
> +	PyDTraceSession *session;
> +} agg_walk_ctx_t;
> +
> +typedef struct {
> +	PyObject *probes;
> +	PyObject *current_probe;
> +	PyObject *records;
> +	PyDTraceSession *session;
> +	int capture;
> +	int aborted;
> +} work_ctx_t;
> +
> +static inline uint64_t
> +read_uint(const void *addr, size_t size)
> +{
> +	uint8_t v8;
> +	uint16_t v16;
> +	uint32_t v32;
> +	uint64_t v64;
> +
> +	switch (size) {
> +	case 1:
> +		memcpy(&v8, addr, sizeof(v8));
> +		return v8;
> +	case 2:
> +		memcpy(&v16, addr, sizeof(v16));
> +		return v16;
> +	case 4:
> +		memcpy(&v32, addr, sizeof(v32));
> +		return v32;
> +	case 8:
> +		memcpy(&v64, addr, sizeof(v64));
> +		return v64;
> +	default:
> +		return 0;
> +	}
> +}
> +
> +static const char *
> +agg_action_label(uint16_t action)
> +{
> +	switch (action) {
> +	case DT_AGG_AVG:
> +		return "avg";
> +	case DT_AGG_COUNT:
> +		return "count";
> +	case DT_AGG_LLQUANTIZE:
> +		return "llquantize";
> +	case DT_AGG_LQUANTIZE:
> +		return "lquantize";
> +	case DT_AGG_MAX:
> +		return "max";
> +	case DT_AGG_MIN:
> +		return "min";
> +	case DT_AGG_QUANTIZE:
> +		return "quantize";
> +	case DT_AGG_STDDEV:
> +		return "stddev";
> +	case DT_AGG_SUM:
> +		return "sum";
> +	default:
> +		return "unknown";
> +	}
> +}
> +
> +static inline PyObject *
> +quant_dict_add(PyObject *dict, int64_t bucket, uint64_t count)
> +{
> +	PyObject *key = PyLong_FromLongLong(bucket);
> +	PyObject *val;
> +
> +	if (key == NULL)
> +		return NULL;
> +
> +	val = PyLong_FromUnsignedLongLong(count);
> +	if (val == NULL) {
> +		Py_DECREF(key);
> +		return NULL;
> +	}
> +
> +	if (PyDict_SetItem(dict, key, val) < 0) {
> +		Py_DECREF(key);
> +		Py_DECREF(val);
> +		return NULL;
> +	}
> +
> +	Py_DECREF(key);
> +	Py_DECREF(val);
> +	return dict;
> +}
> +
> +static PyObject *
> +convert_aggregate_value(PyDTraceSession *session,
> +			const dtrace_aggdata_t *aggdata,
> +			const dtrace_recdesc_t *rec)
> +{
> +	dtrace_aggvalue_bucket_t *buckets;
> +	dtrace_aggvalue_t value = { 0 };
> +	PyObject *result = NULL;
> +
> +	buckets = calloc(rec->dtrd_size / sizeof(int64_t) + 2,
> +			 sizeof(*buckets));
> +	if (buckets == NULL)
> +		return PyErr_NoMemory();
> +	value.dtagv_buckets = buckets;
> +	value.dtagv_bucket_capacity = rec->dtrd_size / sizeof(int64_t) + 2;
> +	if (dtrace_aggregate_value(aggdata, &value) < 0) {
> +		free(buckets);
> +		return raise_dtrace_error(session, "dtrace_aggregate_value");
> +	}
> +	if (value.dtagv_kind == DTRACE_AGGVALUE_QUANTIZED) {
> +		result = PyDict_New();
> +		for (size_t i = 0; result != NULL && i < value.dtagv_bucket_count; i++)
> +			if (quant_dict_add(result, value.dtagv_buckets[i].bucket,
> +					   value.dtagv_buckets[i].count) == NULL) {
> +				Py_DECREF(result);
> +				result = NULL;
> +			}
> +	} else if (value.dtagv_kind == DTRACE_AGGVALUE_FLOAT) {
> +		result = PyFloat_FromDouble(value.dtagv_value.real);
> +	} else if (value.dtagv_kind == DTRACE_AGGVALUE_INTEGER) {
> +		result = PyLong_FromLongLong(value.dtagv_value.integer);
> +	} else if (value.dtagv_kind == DTRACE_AGGVALUE_UNSIGNED) {
> +		result = PyLong_FromUnsignedLongLong(
> +			value.dtagv_value.unsigned_integer);
> +	} else {
> +		result = PyBytes_FromStringAndSize(value.dtagv_value.raw.data,
> +						   value.dtagv_value.raw.size);
> +	}
> +	free(buckets);
> +	return result;
> +}
> +
> +static PyObject *
> +quantization_metadata(const dtrace_aggdesc_t *agg, uint16_t action)
> +{
> +	uint64_t sig = agg->dtagd_sig;
> +
> +	switch (action) {
> +	case DT_AGG_LQUANTIZE:
> +		return Py_BuildValue("{s:s,s:i,s:I,s:I}",
> +		    "action", "lquantize",
> +		    "base", DTRACE_LQUANTIZE_BASE(sig),
> +		    "step", (unsigned int)DTRACE_LQUANTIZE_STEP(sig),
> +		    "levels", (unsigned int)DTRACE_LQUANTIZE_LEVELS(sig));
> +	case DT_AGG_LLQUANTIZE:
> +		return Py_BuildValue("{s:s,s:I,s:I,s:I,s:I}",
> +		    "action", "llquantize",
> +		    "factor", (unsigned int)DTRACE_LLQUANTIZE_FACTOR(sig),
> +		    "lmag", (unsigned int)DTRACE_LLQUANTIZE_LMAG(sig),
> +		    "hmag", (unsigned int)DTRACE_LLQUANTIZE_HMAG(sig),
> +		    "steps", (unsigned int)DTRACE_LLQUANTIZE_STEPS(sig));
> +	default:
> +		return NULL;
> +	}
> +}
> +
> +static inline int
> +key_requires_format(dtrace_actkind_t action)
> +{
> +	switch (action) {
> +	case DTRACEACT_STACK:
> +	case DTRACEACT_USTACK:
> +	case DTRACEACT_JSTACK:
> +	case DTRACEACT_SYM:
> +	case DTRACEACT_USYM:
> +	case DTRACEACT_MOD:
> +	case DTRACEACT_UMOD:
> +	case DTRACEACT_UADDR:
> +		return 1;
> +	default:
> +		return 0;
> +	}
> +}
> +
> +static PyObject *
> +convert_aggregate_key_descriptor(const dtrace_aggkey_t *key)
> +{
> +	if (key->dtagk_kind == DTRACE_AGGKEY_INTEGER)
> +		return PyLong_FromLongLong(key->dtagk_value.integer);
> +	if (key->dtagk_kind == DTRACE_AGGKEY_BYTES)
> +		return PyBytes_FromStringAndSize(key->dtagk_value.bytes.data,
> +				(Py_ssize_t)key->dtagk_value.bytes.size);
> +	if (key->dtagk_kind == DTRACE_AGGKEY_STRING ||
> +	    key->dtagk_kind == DTRACE_AGGKEY_SYMBOL ||
> +	    key->dtagk_kind == DTRACE_AGGKEY_MODULE)
> +		return PyUnicode_FromString(key->dtagk_value.name);
> +	if (key->dtagk_kind == DTRACE_AGGKEY_ADDRESS) {
> +		PyObject *address = PyLong_FromUnsignedLongLong(
> +			key->dtagk_value.user_address.address);
> +		PyObject *pid = PyLong_FromUnsignedLong(
> +			(unsigned long)key->dtagk_value.user_address.pid);
> +		PyObject *result;
> +		if (!address || !pid) {
> +			Py_XDECREF(address);
> +			Py_XDECREF(pid);
> +			return NULL;
> +		}
> +		result = PyTuple_Pack(2, pid, address);
> +		Py_DECREF(pid);
> +		Py_DECREF(address);
> +		return result;
> +	}
> +	if (key->dtagk_kind == DTRACE_AGGKEY_STACK) {
> +		PyObject *list = PyList_New((Py_ssize_t)key->dtagk_value.stack.depth);
> +		if (!list)
> +			return NULL;
> +		for (size_t i = 0; i < key->dtagk_value.stack.depth; i++) {
> +			PyObject *frame = PyUnicode_FromString(
> +				key->dtagk_value.stack.frames[i]);
> +			if (!frame) {
> +				Py_DECREF(list);
> +				return NULL;
> +			}
> +			PyList_SET_ITEM(list, (Py_ssize_t)i, frame);
> +		}
> +		return list;
> +	}
> +	PyErr_SetString(PyExc_ValueError, "unknown aggregation key kind");
> +	return NULL;
> +}
> +
> +static PyObject *
> +convert_aggdata(PyDTraceSession *session, agg_walk_ctx_t *ctx,
> +		const dtrace_aggdata_t *aggdata)
> +{
> +	const dtrace_aggdesc_t *agg = aggdata->dtada_desc;
> +	const dtrace_recdesc_t *counter_rec =
> +		&agg->dtagd_drecs[DT_AGGDATA_COUNTER];
> +	const dtrace_recdesc_t *value_rec =
> +		&agg->dtagd_drecs[DT_AGGDATA_RECORD];
> +	PyObject *entry = PyDict_New();
> +
> +	if (entry == NULL)
> +		return NULL;
> +
> +	PyObject *name = agg->dtagd_name != NULL
> +				 ? PyUnicode_FromString(agg->dtagd_name)
> +				 : Py_None;
> +	if (name == NULL)
> +		goto error;
> +	if (name == Py_None)
> +		Py_INCREF(Py_None);
> +	if (PyDict_SetItemString(entry, "name", name) < 0) {
> +		Py_DECREF(name);
> +		goto error;
> +	}
> +	Py_DECREF(name);
> +
> +	PyObject *aggid = PyLong_FromLong(agg->dtagd_varid);
> +	if (aggid == NULL)
> +		goto error;
> +	if (PyDict_SetItemString(entry, "id", aggid) < 0) {
> +		Py_DECREF(aggid);
> +		goto error;
> +	}
> +	Py_DECREF(aggid);
> +
> +	PyObject *action =
> +		PyUnicode_FromString(agg_action_label(value_rec->dtrd_action));
> +	if (action == NULL)
> +		goto error;
> +	if (PyDict_SetItemString(entry, "action", action) < 0) {
> +		Py_DECREF(action);
> +		goto error;
> +	}
> +	Py_DECREF(action);
> +
> +	PyObject *keys = PyList_New(0);
> +	if (keys == NULL)
> +		goto error;
> +	/* Keep a uniform list representation: [] for zero keys, one element
> +	 * for scalar keys, and a nested list for stack keys. */
> +
> +	uint_t nkeys = agg->dtagd_nkrecs ? agg->dtagd_nkrecs - 1 : 0;
> +	dtrace_aggkey_t *keydesc = nkeys ? calloc(nkeys, sizeof(*keydesc)) : NULL;
> +	if (nkeys && !keydesc)
> +		goto error;
> +	if (dtrace_aggregate_keys(aggdata, keydesc, nkeys) < 0) {
> +		free(keydesc);
> +		Py_DECREF(keys);
> +		goto error;
> +	}
> +	for (uint_t i = 0; i < nkeys; i++) {
> +		PyObject *item = convert_aggregate_key_descriptor(&keydesc[i]);
> +		PyObject *key_list;
> +
> +		if (item == NULL) {
> +			for (uint_t j = 0; j < nkeys; j++)
> +				dtrace_aggregate_key_free(&keydesc[j]);
> +			free(keydesc);
> +			Py_DECREF(keys);
> +			goto error;
> +		}
> +		/* Every key is represented as a list.  Stack keys therefore become
> +		 * a nested list of frame strings. */
> +		key_list = PyList_New(1);
> +		if (key_list == NULL) {
> +			Py_DECREF(item);
> +			for (uint_t j = 0; j < nkeys; j++)
> +				dtrace_aggregate_key_free(&keydesc[j]);
> +			free(keydesc);
> +			Py_DECREF(keys);
> +			goto error;
> +		}
> +		PyList_SET_ITEM(key_list, 0, item);
> +		if (PyList_Append(keys, key_list) < 0) {
> +			Py_DECREF(key_list);
> +			for (uint_t j = 0; j < nkeys; j++)
> +				dtrace_aggregate_key_free(&keydesc[j]);
> +			free(keydesc);
> +			Py_DECREF(keys);
> +			goto error;
> +		}
> +		Py_DECREF(key_list);
> +	}
> +	for (uint_t i = 0; i < nkeys; i++)
> +		dtrace_aggregate_key_free(&keydesc[i]);
> +	free(keydesc);
> +
> +	if (PyDict_SetItemString(entry, "keys", keys) < 0) {
> +		Py_DECREF(keys);
> +		goto error;
> +	}
> +	Py_DECREF(keys);
> +
> +	uint64_t samples =
> +		read_uint(aggdata->dtada_data + counter_rec->dtrd_offset,
> +			  counter_rec->dtrd_size);
> +	PyObject *samples_obj = PyLong_FromUnsignedLongLong(samples);
> +	if (samples_obj == NULL)
> +		goto error;
> +	if (PyDict_SetItemString(entry, "samples", samples_obj) < 0) {
> +		Py_DECREF(samples_obj);
> +		goto error;
> +	}
> +	Py_DECREF(samples_obj);
> +
> +	uint64_t normal = agg->dtagd_normal ? agg->dtagd_normal : 1;
> +	PyObject *normal_obj = PyLong_FromUnsignedLongLong(normal);
> +	if (normal_obj == NULL)
> +		goto error;
> +	if (PyDict_SetItemString(entry, "normal", normal_obj) < 0) {
> +		Py_DECREF(normal_obj);
> +		goto error;
> +	}
> +	Py_DECREF(normal_obj);
> +
> +	PyObject *value = convert_aggregate_value(session, aggdata, value_rec);
> +	if (value == NULL)
> +		goto error;
> +	if (PyDict_SetItemString(entry, "value", value) < 0) {
> +		Py_DECREF(value);
> +		goto error;
> +	}
> +	Py_DECREF(value);
> +
> +	PyObject *quantization = quantization_metadata(agg, value_rec->dtrd_action);
> +	if (quantization != NULL) {
> +		if (PyDict_SetItemString(entry, "quantization", quantization) < 0) {
> +			Py_DECREF(quantization);
> +			goto error;
> +		}
> +		Py_DECREF(quantization);
> +	}
> +
> +	PyObject *raw = PyBytes_FromStringAndSize(
> +		(const char *)(aggdata->dtada_data + value_rec->dtrd_offset),
> +		(Py_ssize_t)value_rec->dtrd_size);
> +	if (raw == NULL)
> +		goto error;
> +	if (PyDict_SetItemString(entry, "raw", raw) < 0) {
> +		Py_DECREF(raw);
> +		goto error;
> +	}
> +	Py_DECREF(raw);
> +
> +	return entry;
> +
> +error:
> +	Py_DECREF(entry);
> +	return NULL;
> +}
> +
> +static int
> +agg_walk_callback(const dtrace_aggdata_t *aggdata, void *arg)
> +{
> +	agg_walk_ctx_t *ctx = (agg_walk_ctx_t *)arg;
> +	PyObject *entry = convert_aggdata(ctx->session, ctx, aggdata);
> +
> +	if (entry == NULL)
> +		return DTRACE_AGGWALK_ERROR;
> +
> +	if (PyList_Append(ctx->list, entry) < 0) {
> +		Py_DECREF(entry);
> +		return DTRACE_AGGWALK_ERROR;
> +	}
> +
> +	Py_DECREF(entry);
> +	return DTRACE_AGGWALK_NEXT;
> +}
> +
> +/* ------------------------------------------------------------------------- */
> +/* PyDTraceProgram                                                           */
> +/* ------------------------------------------------------------------------- */
> +
> +static void
> +PyDTraceProgram_dealloc(PyDTraceProgram *self)
> +{
> +	if (self->session)
> +		Py_XDECREF(self->session);
> +	PyObject_Del(self);
> +}
> +
> +static PyTypeObject PyDTraceProgramType;
> +
> +static PyObject *
> +PyDTraceProgram_new(PyTypeObject *type, PyObject *args, PyObject *kwds)
> +{
> +	UNUSED(args);
> +	UNUSED(kwds);
> +	PyDTraceProgram *self = (PyDTraceProgram *)type->tp_alloc(type, 0);
> +	if (self != NULL) {
> +		self->session = NULL;
> +		self->prog = NULL;
> +	}
> +	return (PyObject *)self;
> +}
> +
> +static PyMethodDef PyDTraceProgram_methods[] = {{NULL, NULL, 0, NULL}};
> +
> +static PyTypeObject PyDTraceProgramType = {
> +	PyVarObject_HEAD_INIT(NULL, 0).tp_name = "dtrace.DTraceProgram",
> +	.tp_basicsize = sizeof(PyDTraceProgram),
> +	.tp_flags = Py_TPFLAGS_DEFAULT,
> +	.tp_new = PyDTraceProgram_new,
> +	.tp_dealloc = (destructor)PyDTraceProgram_dealloc,
> +	.tp_methods = PyDTraceProgram_methods,
> +};
> +
> +/* ------------------------------------------------------------------------- */
> +/* PyDTraceSession                                                           */
> +/* ------------------------------------------------------------------------- */
> +
> +static void
> +PyDTraceSession_dealloc(PyDTraceSession *self)
> +{
> +	session_dtrace_lock(self);
> +	if (self->dtp != NULL && !self->closed) {
> +		Py_BEGIN_ALLOW_THREADS dtrace_close(self->dtp);
> +		Py_END_ALLOW_THREADS
> +	}
> +	self->dtp = NULL;
> +	session_dtrace_unlock(self);
> +	pthread_mutex_destroy(&self->dt_lock);
> +	if (self->fp)
> +		fclose(self->fp);
> +	self->closed = 1;
> +	PyObject_Del(self);
> +}
> +
> +static PyObject *
> +PyDTraceSession_new(PyTypeObject *type, PyObject *args, PyObject *kwds)
> +{
> +	UNUSED(args);
> +	UNUSED(kwds);
> +	PyDTraceSession *self = (PyDTraceSession *)type->tp_alloc(type, 0);
> +	if (self != NULL) {
> +		self->dtp = NULL;
> +		self->closed = 1;
> +		if (pthread_mutex_init(&self->dt_lock, NULL) != 0) {
> +			PyObject_Del(self);
> +			PyErr_SetString(PyExc_RuntimeError,
> +					"unable to initialize DTrace session lock");
> +			return NULL;
> +		}
> +	}
> +	return (PyObject *)self;
> +}
> +
> +static void
> +prochandler(pid_t pid, const char *msg, void *arg)
> +{
> +	PyDTraceSession *self = arg;
> +
> +	if (pid < 0 && self->pids_live) {
> +		self->pids_live--;
> +		if (self->pids_live == 0)
> +			dtrace_stop(self->dtp);
> +	}
> +}
> +
> +static int
> +PyDTraceSession_init(PyDTraceSession *self, PyObject *args, PyObject *kwds)
> +{
> +	static char *kwlist[] = {"version", "flags", NULL};
> +	int version = DTRACE_VERSION;
> +	unsigned int flags = 0;
> +	int err = 0;
> +	int rc;
> +
> +	if (!PyArg_ParseTupleAndKeywords(args, kwds, "|iI", kwlist, &version,
> +					 &flags))
> +		return -1;
> +
> +	Py_BEGIN_ALLOW_THREADS
> +	self->dtp = dtrace_open(version, flags, &err);
> +	Py_END_ALLOW_THREADS
> +	if (self->dtp == NULL)
> +		return raise_dtrace_error_with_code(NULL, err, "dtrace_open") ==
> +				       NULL
> +			       ? -1
> +			       : -1;
> +
> +	self->fp = fopen("/dev/null", "a");
> +	if (self->fp == NULL) {
> +		PyErr_SetFromErrno(PyExc_OSError);
> +		dtrace_close(self->dtp);
> +		self->dtp = NULL;
> +		return -1;
> +	}
> +	Py_BEGIN_ALLOW_THREADS
> +	rc = dtrace_init(self->dtp);
> +	Py_END_ALLOW_THREADS
> +	if (rc != 0) {
> +		raise_dtrace_error(self, "dtrace_init");
> +		dtrace_close(self->dtp);
> +		if (self->fp)
> +			fclose(self->fp);
> +		self->dtp = NULL;
> +		self->fp = NULL;
> +		return -1;
> +	}
> +	if (dtrace_handle_proc(self->dtp, &prochandler, self) != 0 ||
> +	    dtrace_setopt(self->dtp, "aggsize", "4m") != 0 ||
> +	    dtrace_setopt(self->dtp, "bufsize", "4m") != 0) {

The dtrace_setopt() calls should be done before dtrace_init().  I would do
it right after the dtrace_open() call, to be consistent with cmd/dtrace.

You should also call dtrace_setoptenv(self->dtp, "DTRACE_OPT_") right
after the dtrace_setopt() calls.  That is important for ensuring that we
can set DTRACE_OPT_SYSLIBDIR to specify the location of the DTrace BPF
libs (which is needed when testing DTrace on a system where dtrace is
not yet installed).

The dtrace_handle_proc() call can stay here.

> +		raise_dtrace_error(self, "dtrace_setopt");
> +		dtrace_close(self->dtp);
> +		if (self->fp)
> +			fclose(self->fp);
> +		self->dtp = NULL;
> +		self->fp = NULL;
> +		return -1;
> +	}
> +	self->closed = 0;
> +	return 0;
> +}
> +
> +static PyObject *
> +PyDTraceSession_close(PyDTraceSession *self, PyObject *Py_UNUSED(args))
> +{
> +	session_dtrace_lock(self);
> +	if (!self->closed && self->dtp != NULL) {
> +		Py_BEGIN_ALLOW_THREADS dtrace_close(self->dtp);
> +		Py_END_ALLOW_THREADS
> +		if (self->fp)
> +			fclose(self->fp);
> +		self->dtp = NULL;
> +		self->fp = NULL;
> +		self->closed = 1;
> +	}
> +	session_dtrace_unlock(self);
> +
> +	Py_RETURN_NONE;
> +}
> +
> +static PyObject *
> +PyDTraceSession_enter(PyDTraceSession *self, PyObject *Py_UNUSED(args))
> +{
> +	if (ensure_open(self) < 0)
> +		return NULL;
> +
> +	Py_INCREF(self);
> +	return (PyObject *)self;
> +}
> +
> +static PyObject *
> +PyDTraceSession_exit(PyDTraceSession *self, PyObject *args)
> +{
> +	UNUSED(args);
> +
> +	session_dtrace_lock(self);
> +	if (!self->closed && self->dtp != NULL) {
> +		Py_BEGIN_ALLOW_THREADS dtrace_close(self->dtp);
> +		Py_END_ALLOW_THREADS
> +		if (self->fp)
> +			fclose(self->fp);
> +		self->dtp = NULL;
> +		self->fp = NULL;
> +		self->closed = 1;
> +	}
> +	session_dtrace_unlock(self);
> +
> +	Py_RETURN_FALSE;
> +}
> +
> +static PyObject *
> +PyDTraceSession_setopt(PyDTraceSession *self, PyObject *args, PyObject *kwds)
> +{
> +	static char *kwlist[] = {"option", "value", NULL};
> +	const char *opt = NULL;
> +	PyObject *value_obj = Py_None;
> +	PyObject *value_str = NULL;
> +	const char *cvalue = NULL;
> +
> +	if (ensure_open(self) < 0)
> +		return NULL;
> +
> +	if (!PyArg_ParseTupleAndKeywords(args, kwds, "s|O", kwlist, &opt,
> +					 &value_obj))
> +		return NULL;
> +
> +	if (value_obj == Py_None) {
> +		cvalue = NULL;
> +	} else {
> +		PyObject *string_obj = PyObject_Str(value_obj);
> +		if (string_obj == NULL)
> +			return NULL;
> +		value_str = PyUnicode_AsEncodedString(string_obj, "utf-8",
> +						      "replace");
> +		Py_DECREF(string_obj);
> +		if (value_str == NULL)
> +			return NULL;
> +		cvalue = PyBytes_AS_STRING(value_str);
> +	}
> +
> +	if (session_dtrace_lock_open(self) < 0) {
> +		Py_XDECREF(value_str);
> +		return NULL;
> +	}
> +	if (dtrace_setopt(self->dtp, opt, cvalue) != 0) {
> +		session_dtrace_unlock(self);
> +		Py_XDECREF(value_str);
> +		return raise_dtrace_error(self, "dtrace_setopt");
> +	}
> +	session_dtrace_unlock(self);
> +
> +	Py_XDECREF(value_str);
> +	Py_RETURN_NONE;
> +}
> +
> +/*
> + * Need a lock because compilation uses global state; we would like to remove
> + * this eventually.
> + */
> +pthread_mutex_t compile_lock = PTHREAD_MUTEX_INITIALIZER;
> +
> +static PyObject *
> +PyDTraceSession_compile(PyDTraceSession *self, PyObject *args, PyObject *kwds)
> +{
> +	static char *kwlist[] = {"program", "cflags", "argv", "spec",
> +					 "defines", NULL};
> +	const char *source = NULL;
> +	unsigned int cflags = 0;
> +	PyObject *argv_obj = NULL;
> +	PyObject *defines_obj = NULL;
> +	int spec = DTRACE_PROBESPEC_NAME;
> +	PyObject *argv_seq = NULL;
> +	char **argv = NULL;
> +	PyObject **encoded = NULL;
> +	Py_ssize_t argc = 0;
> +	dtrace_prog_t *prog = NULL;
> +	PyDTraceProgram *wrapper = NULL;
> +
> +	if (ensure_open(self) < 0)
> +		return NULL;
> +
> +	if (!PyArg_ParseTupleAndKeywords(args, kwds, "s|IOiO", kwlist, &source,
> +					 &cflags, &argv_obj, &spec, &defines_obj))
> +		return NULL;
> +	if (session_dtrace_lock_open(self) < 0)
> +		return NULL;
> +	pthread_mutex_lock(&compile_lock);
> +
> +	if (defines_obj != NULL && defines_obj != Py_None) {
> +		PyObject *defines_seq = PySequence_Fast(
> +			defines_obj, "defines must be a sequence of strings");
> +		Py_ssize_t i, n;
> +
> +		if (defines_seq == NULL) {
> +			pthread_mutex_unlock(&compile_lock);
> +			session_dtrace_unlock(self);
> +			return NULL;
> +		}
> +		n = PySequence_Fast_GET_SIZE(defines_seq);
> +		for (i = 0; i < n; i++) {
> +			PyObject *item = PySequence_Fast_GET_ITEM(defines_seq, i);
> +			PyObject *string_obj = PyObject_Str(item);
> +			PyObject *encoded_obj;
> +			int rc;
> +
> +			if (string_obj == NULL) {
> +				Py_DECREF(defines_seq);
> +				pthread_mutex_unlock(&compile_lock);
> +				session_dtrace_unlock(self);
> +				return NULL;
> +			}
> +			encoded_obj = PyUnicode_AsEncodedString(string_obj, "utf-8",
> +								       "replace");
> +			Py_DECREF(string_obj);
> +			if (encoded_obj == NULL) {
> +				Py_DECREF(defines_seq);
> +				pthread_mutex_unlock(&compile_lock);
> +				session_dtrace_unlock(self);
> +				return NULL;
> +			}
> +			rc = dtrace_setopt(self->dtp, "define",
> +					   PyBytes_AS_STRING(encoded_obj));
> +			Py_DECREF(encoded_obj);
> +			if (rc != 0) {
> +				Py_DECREF(defines_seq);
> +				pthread_mutex_unlock(&compile_lock);
> +				session_dtrace_unlock(self);
> +				return raise_dtrace_error(self, "dtrace_setopt");
> +			}
> +		}
> +		Py_DECREF(defines_seq);
> +		cflags |= DTRACE_C_CPP;
> +	}
> +	if ((cflags & DTRACE_C_CPP) && spec != DTRACE_PROBESPEC_NAME) {
> +		pthread_mutex_unlock(&compile_lock);
> +		session_dtrace_unlock(self);
> +		PyErr_SetString(PyExc_ValueError,
> +				"non-default spec is unsupported with preprocessing");
> +		return NULL;
> +	}
> +
> +	if (argv_obj != NULL && argv_obj != Py_None) {
> +		argv_seq = PySequence_Fast(
> +			argv_obj, "argv must be a sequence of strings");
> +		if (argv_seq == NULL) {
> +			pthread_mutex_unlock(&compile_lock);
> +			session_dtrace_unlock(self);
> +			return NULL;
> +		}
> +
> +		argc = PySequence_Fast_GET_SIZE(argv_seq);
> +		if (argc > 0) {
> +			Py_ssize_t i;
> +
> +			argv = PyMem_Calloc((size_t)argc + 1, sizeof(char *));
> +			encoded =
> +				PyMem_Calloc((size_t)argc, sizeof(PyObject *));
> +			if (argv == NULL || encoded == NULL) {
> +				PyMem_Free(argv);
> +				PyMem_Free(encoded);
> +				Py_DECREF(argv_seq);
> +				pthread_mutex_unlock(&compile_lock);
> +				session_dtrace_unlock(self);
> +				return PyErr_NoMemory();
> +			}
> +
> +			for (i = 0; i < argc; i++) {
> +				PyObject *item =
> +					PySequence_Fast_GET_ITEM(argv_seq, i);
> +				PyObject *string_obj = PyObject_Str(item);
> +				if (string_obj == NULL) {
> +					Py_DECREF(argv_seq);
> +					goto compile_error;
> +				}
> +				encoded[i] = PyUnicode_AsEncodedString(
> +					string_obj, "utf-8", "replace");
> +				Py_DECREF(string_obj);
> +				if (encoded[i] == NULL) {
> +					Py_DECREF(argv_seq);
> +					goto compile_error;
> +				}
> +				argv[i] = PyBytes_AS_STRING(encoded[i]);
> +			}
> +			argv[i] = NULL;
> +		}
> +	}
> +
> +	if (cflags & DTRACE_C_CPP) {
> +		FILE *fp = tmpfile();
> +
> +		if (fp == NULL) {
> +			PyErr_SetFromErrno(PyExc_OSError);
> +			goto compile_error;
> +		}
> +		if (fputs(source, fp) == EOF || fflush(fp) != 0 ||
> +		    fseek(fp, 0, SEEK_SET) != 0) {
> +			fclose(fp);
> +			PyErr_SetFromErrno(PyExc_IOError);
> +			goto compile_error;
> +		}
> +		prog = dtrace_program_fcompile(self->dtp, fp, cflags,
> +					       (int)argc, argv);
> +		fclose(fp);
> +	} else {
> +		prog = dtrace_program_strcompile(self->dtp, source,
> +					 (dtrace_probespec_t)spec, cflags,
> +					 (int)argc, argv);
> +	}
> +	pthread_mutex_unlock(&compile_lock);
> +	session_dtrace_unlock(self);
> +
> +	Py_XDECREF(argv_seq);
> +
> +	if (prog == NULL) {
> +		for (Py_ssize_t i = 0; i < argc; i++)
> +			Py_XDECREF(encoded[i]);
> +		PyMem_Free(encoded);
> +		PyMem_Free(argv);
> +		return raise_dtrace_error(self, "dtrace_program_strcompile");
> +	}
> +
> +	wrapper = (PyDTraceProgram *)PyObject_CallObject(
> +		(PyObject *)&PyDTraceProgramType, NULL);
> +	if (wrapper == NULL) {
> +		for (Py_ssize_t i = 0; i < argc; i++)
> +			Py_XDECREF(encoded[i]);
> +		PyMem_Free(encoded);
> +		PyMem_Free(argv);
> +		return NULL;
> +	}
> +
> +	Py_INCREF(self);
> +	wrapper->session = self;
> +	wrapper->prog = prog;
> +
> +	for (Py_ssize_t i = 0; i < argc; i++)
> +		Py_XDECREF(encoded[i]);
> +	PyMem_Free(encoded);
> +	PyMem_Free(argv);
> +
> +	return (PyObject *)wrapper;
> +
> +compile_error:
> +	pthread_mutex_unlock(&compile_lock);
> +	session_dtrace_unlock(self);
> +	for (Py_ssize_t i = 0; i < argc; i++)
> +		Py_XDECREF(encoded[i]);
> +	PyMem_Free(encoded);
> +	PyMem_Free(argv);
> +	return NULL;
> +}
> +
> +static PyObject *
> +PyDTraceSession_enable(PyDTraceSession *self, PyObject *args, PyObject *kwds)
> +{
> +	static char *kwlist[] = {"program", NULL};
> +	PyDTraceProgram *program = NULL;
> +	dtrace_proginfo_t info;
> +	PyObject *result = NULL;
> +	PyObject *attr = NULL;
> +	int rc;
> +
> +	if (ensure_open(self) < 0)
> +		return NULL;
> +
> +	if (!PyArg_ParseTupleAndKeywords(args, kwds, "O!", kwlist,
> +					 &PyDTraceProgramType, &program))
> +		return NULL;
> +
> +	if (program->session != self) {
> +		PyErr_SetString(PyExc_ValueError,
> +				"program was created by a different session");
> +		return NULL;
> +	}
> +
> +	memset(&info, 0, sizeof(info));
> +
> +	if (session_dtrace_lock_open(self) < 0)
> +		return NULL;
> +	Py_BEGIN_ALLOW_THREADS
> +	rc = dtrace_program_exec(self->dtp, program->prog, &info);
> +	Py_END_ALLOW_THREADS
> +	if (rc != 0) {
> +		session_dtrace_unlock(self);
> +		return raise_dtrace_error(self, "dtrace_program_exec");
> +	}
> +	session_dtrace_unlock(self);
> +
> +	result = PyDict_New();
> +	if (result == NULL)
> +		return NULL;
> +
> +	if (dict_set_ulong(result, "aggregations", info.dpi_aggregates) < 0)
> +		goto enable_error;
> +
> +	if (dict_set_ulong(result, "recgens", info.dpi_recgens) < 0)
> +		goto enable_error;
> +
> +	if (dict_set_ulong(result, "matches", info.dpi_matches) < 0)
> +		goto enable_error;
> +
> +	if (dict_set_ulong(result, "speculations", info.dpi_speculations) < 0)
> +		goto enable_error;
> +
> +	attr = PyDict_New();
> +	if (attr == NULL)
> +		goto enable_error;
> +
> +	if (dict_set_ulong(attr, "name", info.dpi_descattr.dtat_name) < 0)
> +		goto enable_error;
> +
> +	if (dict_set_ulong(attr, "data", info.dpi_descattr.dtat_data) < 0)
> +		goto enable_error;
> +
> +	if (dict_set_ulong(attr, "class", info.dpi_descattr.dtat_class) < 0)
> +		goto enable_error;
> +
> +	if (PyDict_SetItemString(result, "descattr", attr) < 0)
> +		goto enable_error;
> +	Py_DECREF(attr);
> +	attr = NULL;
> +
> +	attr = PyDict_New();
> +	if (attr == NULL)
> +		goto enable_error;
> +
> +	if (dict_set_ulong(attr, "name", info.dpi_stmtattr.dtat_name) < 0)
> +		goto enable_error;
> +
> +	if (dict_set_ulong(attr, "data", info.dpi_stmtattr.dtat_data) < 0)
> +		goto enable_error;
> +
> +	if (dict_set_ulong(attr, "class", info.dpi_stmtattr.dtat_class) < 0)
> +		goto enable_error;
> +
> +	if (PyDict_SetItemString(result, "stmtattr", attr) < 0)
> +		goto enable_error;
> +	Py_DECREF(attr);
> +	attr = NULL;
> +
> +	return result;
> +
> +enable_error:
> +	Py_XDECREF(attr);
> +	Py_DECREF(result);
> +	return NULL;
> +}
> +
> +static PyObject *
> +PyDTraceSession_go(PyDTraceSession *self, PyObject *args, PyObject *kwds)
> +{
> +	static char *kwlist[] = {"cflags", NULL};
> +	unsigned int cflags = 0;
> +	int rc;
> +
> +	if (ensure_open(self) < 0)
> +		return NULL;
> +
> +	if (!PyArg_ParseTupleAndKeywords(args, kwds, "|I", kwlist, &cflags))
> +		return NULL;
> +
> +	if (session_dtrace_lock_open(self) < 0)
> +		return NULL;
> +	Py_BEGIN_ALLOW_THREADS rc = dtrace_go(self->dtp, cflags);
> +	Py_END_ALLOW_THREADS
> +	session_dtrace_unlock(self);
> +
> +	if (rc != 0)
> +		return raise_dtrace_error(self, "dtrace_go");
> +
> +	Py_RETURN_NONE;
> +}
> +
> +static PyObject *
> +PyDTraceSession_stop(PyDTraceSession *self, PyObject *Py_UNUSED(args))
> +{
> +	if (ensure_open(self) < 0)
> +		return NULL;
> +
> +	if (session_dtrace_lock_open(self) < 0)
> +		return NULL;
> +	if (dtrace_stop(self->dtp) != 0) {
> +		session_dtrace_unlock(self);
> +		return raise_dtrace_error(self, "dtrace_stop");
> +	}
> +	session_dtrace_unlock(self);
> +
> +	Py_RETURN_NONE;
> +}
> +
> +static PyObject *
> +PyDTraceSession_update(PyDTraceSession *self, PyObject *Py_UNUSED(args))
> +{
> +	int rc;
> +
> +	if (ensure_open(self) < 0)
> +		return NULL;
> +
> +	if (session_dtrace_lock_open(self) < 0)
> +		return NULL;
> +	Py_BEGIN_ALLOW_THREADS
> +	rc = dtrace_update(self->dtp);
> +	Py_END_ALLOW_THREADS
> +	if (rc != 0) {
> +		session_dtrace_unlock(self);
> +		return raise_dtrace_error(self, "dtrace_update");
> +	}
> +	session_dtrace_unlock(self);
> +
> +	Py_RETURN_NONE;
> +}
> +
> +static PyObject *
> +PyDTraceSession_status(PyDTraceSession *self, PyObject *Py_UNUSED(args))
> +{
> +	int status;
> +
> +	if (ensure_open(self) < 0)
> +		return NULL;
> +
> +	if (session_dtrace_lock_open(self) < 0)
> +		return NULL;
> +	status = dtrace_status(self->dtp);
> +	if (status == DTRACE_STATUS_ERROR) {
> +		session_dtrace_unlock(self);
> +		return raise_dtrace_error(self, "dtrace_status");
> +	}
> +	/*
> +	 * We maintain some local status too for forced exit (see consume_rec()
> +	 * below)
> +	 */
> +	if (status == DTRACE_STATUS_OKAY && self->status)
> +		status = self->status;
> +	session_dtrace_unlock(self);
> +	return PyLong_FromLong(status);
> +}
> +
> +static int
> +consume_rec(const dtrace_probedata_t *data, const dtrace_recdesc_t *rec,
> +	    void *arg)
> +{
> +	work_ctx_t *ctx = arg;
> +	PyDTraceSession *self = ctx->session;
> +	dtrace_actkind_t act;
> +	uintptr_t addr;
> +
> +	if (!rec)
> +		return DTRACE_CONSUME_NEXT;
> +
> +	act = rec->dtrd_action;
> +	addr = (uintptr_t)data->dtpda_data;
> +
> +	switch (act) {
> +	case DTRACEACT_EXIT:
> +		memcpy(&self->exit_status, (const void *)addr,
> +		       sizeof(self->exit_status));
> +		self->status = DTRACE_STATUS_EXITED;
> +		return DTRACE_CONSUME_NEXT;
> +	default:
> +		if (!ctx->capture || ctx->current_probe == NULL)
> +			return DTRACE_CONSUME_THIS;
> +
> +		PyObject *record = PyDict_New();
> +		PyObject *records = ctx->records;
> +
> +		if (record == NULL || records == NULL)
> +			goto error;
> +
> +		PyObject *action = PyLong_FromUnsignedLong(act);
> +		PyObject *size = PyLong_FromUnsignedLong(rec->dtrd_size);
> +		PyObject *offset = PyLong_FromUnsignedLong(rec->dtrd_offset);
> +		PyObject *alignment =
> +			PyLong_FromUnsignedLong(rec->dtrd_alignment);
> +		PyObject *arg_obj = PyLong_FromUnsignedLongLong(rec->dtrd_arg);
> +		/* dtrace_work() has already advanced dtpda_data to this record. */
> +		PyObject *raw = PyBytes_FromStringAndSize(
> +			(const char *)data->dtpda_data,
> +			rec->dtrd_size);
> +
> +		if (action == NULL || size == NULL || offset == NULL ||
> +		    alignment == NULL || arg_obj == NULL || raw == NULL)
> +			goto error_record;
> +
> +		if (PyDict_SetItemString(record, "action", action) < 0)
> +			goto error_record;
> +		if (PyDict_SetItemString(record, "size", size) < 0)
> +			goto error_record;
> +		if (PyDict_SetItemString(record, "offset", offset) < 0)
> +			goto error_record;
> +		if (PyDict_SetItemString(record, "alignment", alignment) < 0)
> +			goto error_record;
> +		if (PyDict_SetItemString(record, "arg", arg_obj) < 0)
> +			goto error_record;
> +		if (PyDict_SetItemString(record, "data", raw) < 0)
> +			goto error_record;
> +
> +		Py_DECREF(action);
> +		Py_DECREF(size);
> +		Py_DECREF(offset);
> +		Py_DECREF(alignment);
> +		Py_DECREF(arg_obj);
> +		Py_DECREF(raw);
> +
> +		if (PyList_Append(records, record) < 0)
> +			goto error_record;
> +		Py_DECREF(record);
> +
> +		return DTRACE_CONSUME_THIS;
> +
> +	error_record:
> +		Py_XDECREF(action);
> +		Py_XDECREF(size);
> +		Py_XDECREF(offset);
> +		Py_XDECREF(alignment);
> +		Py_XDECREF(arg_obj);
> +		Py_XDECREF(raw);
> +		Py_XDECREF(record);
> +
> +	error:
> +		ctx->aborted = 1;
> +		return DTRACE_CONSUME_ABORT;
> +	}
> +}
> +
> +static int
> +consume_probe(const dtrace_probedata_t *data, void *arg)
> +{
> +	work_ctx_t *ctx = arg;
> +
> +	if (!ctx->capture)
> +		return DTRACE_CONSUME_THIS;
> +
> +	PyObject *probe = PyDict_New();
> +	PyObject *records = PyList_New(0);
> +	PyObject *stid =
> +		PyLong_FromUnsignedLong((unsigned long)data->dtpda_stid);
> +	PyObject *cpu = PyLong_FromUnsignedLong(data->dtpda_cpu);
> +	PyObject *flow = PyLong_FromLong(data->dtpda_flow);
> +	PyObject *indent = PyLong_FromLong(data->dtpda_indent);
> +	PyObject *prefix = NULL;
> +
> +	if (probe == NULL || records == NULL || stid == NULL || cpu == NULL ||
> +	    flow == NULL || indent == NULL)
> +		goto error;
> +
> +	if (PyDict_SetItemString(probe, "stid", stid) < 0)
> +		goto error;
> +	if (PyDict_SetItemString(probe, "cpu", cpu) < 0)
> +		goto error;
> +	if (PyDict_SetItemString(probe, "flow", flow) < 0)
> +		goto error;
> +	if (PyDict_SetItemString(probe, "indent", indent) < 0)
> +		goto error;
> +	if (PyDict_SetItemString(probe, "records", records) < 0)
> +		goto error;
> +
> +	if (data->dtpda_prefix != NULL) {
> +		prefix = PyUnicode_FromString(data->dtpda_prefix);
> +		if (prefix == NULL)
> +			goto error;
> +		if (PyDict_SetItemString(probe, "prefix", prefix) < 0)
> +			goto error;
> +	}
> +
> +	if (data->dtpda_ddesc != NULL) {
> +		PyObject *argc = PyLong_FromLong(data->dtpda_ddesc->dtdd_nrecs);
> +		PyObject *user_data = PyLong_FromUnsignedLongLong(
> +			data->dtpda_ddesc->dtdd_uarg);
> +
> +		if (argc == NULL || user_data == NULL)
> +			goto error;
> +		if (PyDict_SetItemString(probe, "argc", argc) < 0) {
> +			Py_DECREF(argc);
> +			Py_DECREF(user_data);
> +			goto error;
> +		}
> +		Py_DECREF(argc);
> +		if (PyDict_SetItemString(probe, "user_data", user_data) < 0) {
> +			Py_DECREF(user_data);
> +			goto error;
> +		}
> +		Py_DECREF(user_data);
> +	}
> +
> +	if (data->dtpda_pdesc != NULL) {
> +		const dtrace_probedesc_t *pdesc = data->dtpda_pdesc;
> +		PyObject *info = PyDict_New();
> +		PyObject *id = PyLong_FromUnsignedLong(pdesc->id);
> +
> +		if (info == NULL || id == NULL)
> +			goto error;
> +		if (PyDict_SetItemString(info, "id", id) < 0) {
> +			Py_DECREF(id);
> +			Py_DECREF(info);
> +			goto error;
> +		}
> +		Py_DECREF(id);
> +
> +		if (pdesc->prv != NULL) {
> +			PyObject *prv = PyUnicode_FromString(pdesc->prv);
> +			if (prv == NULL) {
> +				Py_DECREF(info);
> +				goto error;
> +			}
> +			if (PyDict_SetItemString(info, "provider", prv) < 0) {
> +				Py_DECREF(prv);
> +				Py_DECREF(info);
> +				goto error;
> +			}
> +			Py_DECREF(prv);
> +		}
> +
> +		if (pdesc->mod != NULL) {
> +			PyObject *mod = PyUnicode_FromString(pdesc->mod);
> +			if (mod == NULL) {
> +				Py_DECREF(info);
> +				goto error;
> +			}
> +			if (PyDict_SetItemString(info, "module", mod) < 0) {
> +				Py_DECREF(mod);
> +				Py_DECREF(info);
> +				goto error;
> +			}
> +			Py_DECREF(mod);
> +		}
> +
> +		if (pdesc->fun != NULL) {
> +			PyObject *fun = PyUnicode_FromString(pdesc->fun);
> +			if (fun == NULL) {
> +				Py_DECREF(info);
> +				goto error;
> +			}
> +			if (PyDict_SetItemString(info, "function", fun) < 0) {
> +				Py_DECREF(fun);
> +				Py_DECREF(info);
> +				goto error;
> +			}
> +			Py_DECREF(fun);
> +		}
> +
> +		if (pdesc->prb != NULL) {
> +			PyObject *prb = PyUnicode_FromString(pdesc->prb);
> +			if (prb == NULL) {
> +				Py_DECREF(info);
> +				goto error;
> +			}
> +			if (PyDict_SetItemString(info, "name", prb) < 0) {
> +				Py_DECREF(prb);
> +				Py_DECREF(info);
> +				goto error;
> +			}
> +			Py_DECREF(prb);
> +		}
> +
> +		if (PyDict_SetItemString(probe, "probe", info) < 0) {
> +			Py_DECREF(info);
> +			goto error;
> +		}
> +		Py_DECREF(info);
> +	}
> +
> +	if (PyList_Append(ctx->probes, probe) < 0)
> +		goto error;
> +
> +	ctx->current_probe = probe;
> +	ctx->records = records;
> +
> +	Py_DECREF(stid);
> +	Py_DECREF(cpu);
> +	Py_DECREF(flow);
> +	Py_DECREF(indent);
> +	Py_DECREF(records);
> +	Py_XDECREF(prefix);
> +	Py_DECREF(probe);
> +
> +	return DTRACE_CONSUME_THIS;
> +
> +error:
> +	ctx->aborted = 1;
> +	Py_XDECREF(probe);
> +	Py_XDECREF(records);
> +	Py_XDECREF(stid);
> +	Py_XDECREF(cpu);
> +	Py_XDECREF(flow);
> +	Py_XDECREF(indent);
> +	Py_XDECREF(prefix);
> +	return DTRACE_CONSUME_ABORT;
> +}
> +
> +static PyObject *
> +PyDTraceSession_work(PyDTraceSession *self, PyObject *args, PyObject *kwds)
> +{
> +	static char *kwlist[] = {"return_records", NULL};
> +	PyObject *captures = Py_False;
> +	work_ctx_t ctx = {0};
> +	PyObject *status_obj = NULL;
> +	PyObject *result = NULL;
> +	int workstatus;
> +	int status;
> +
> +	if (ensure_open(self) < 0)
> +		return NULL;
> +
> +	if (!PyArg_ParseTupleAndKeywords(args, kwds, "|O", kwlist, &captures))
> +		return NULL;
> +
> +	ctx.capture = PyObject_IsTrue(captures);
> +	if (ctx.capture < 0)
> +		return NULL;
> +
> +	ctx.session = self;
> +
> +	if (ctx.capture) {
> +		ctx.probes = PyList_New(0);
> +		if (ctx.probes == NULL)
> +			return NULL;
> +	}
> +
> +	if (session_dtrace_lock_open(self) < 0) {
> +		Py_XDECREF(ctx.probes);
> +		return NULL;
> +	}
> +	if (ctx.capture) {
> +		workstatus = dtrace_work(self->dtp, self->fp, consume_probe,
> +					 consume_rec, &ctx);
> +	} else {
> +		/* The no-capture callbacks do not access Python objects. */
> +		Py_BEGIN_ALLOW_THREADS
> +		workstatus = dtrace_work(self->dtp, self->fp, consume_probe,
> +					 consume_rec, &ctx);
> +		Py_END_ALLOW_THREADS
> +	}
> +
> +	/* An interrupted polling wait does not invalidate the DTrace session. */
> +	if (workstatus == DTRACE_WORKSTATUS_ERROR &&
> +	    dtrace_errno(self->dtp) == EINTR)
> +		workstatus = DTRACE_WORKSTATUS_OKAY;
> +
> +	if (workstatus == DTRACE_WORKSTATUS_ERROR ||
> +	    (ctx.capture && ctx.aborted)) {
> +		result = raise_dtrace_error(self, "dtrace_work");
> +		session_dtrace_unlock(self);
> +		Py_XDECREF(ctx.probes);
> +		return result;
> +	}
> +
> +	status = dtrace_status(self->dtp);
> +	if (status == DTRACE_STATUS_ERROR) {
> +		result = raise_dtrace_error(self, "dtrace_status");
> +		session_dtrace_unlock(self);
> +		Py_XDECREF(ctx.probes);
> +		return result;
> +	}
> +	if (status == DTRACE_STATUS_OKAY && self->status)
> +		status = self->status;
> +	if (status == DTRACE_STATUS_OKAY && self->pids > 0 &&
> +	    self->pids_live == 0) {
> +		status = DTRACE_STATUS_EXITED;
> +		self->status = status;
> +	}
> +	session_dtrace_unlock(self);
> +
> +	status_obj = PyLong_FromLong(status);
> +	if (status_obj == NULL) {
> +		Py_XDECREF(ctx.probes);
> +		return NULL;
> +	}
> +
> +	if (ctx.probes == NULL) {
> +		ctx.probes = PyList_New(0);
> +		if (ctx.probes == NULL) {
> +			Py_DECREF(status_obj);
> +			return NULL;
> +		}
> +	}
> +
> +	result = PyTuple_Pack(2, status_obj, ctx.probes);
> +	Py_DECREF(status_obj);
> +	Py_DECREF(ctx.probes);
> +	return result;
> +}
> +
> +static PyObject *
> +PyDTraceSession_agg_snap(PyDTraceSession *self, PyObject *Py_UNUSED(args))
> +{
> +	int rc;
> +
> +	if (ensure_open(self) < 0)
> +		return NULL;
> +
> +	if (session_dtrace_lock_open(self) < 0)
> +		return NULL;
> +	Py_BEGIN_ALLOW_THREADS
> +	rc = dtrace_aggregate_snap(self->dtp);
> +	Py_END_ALLOW_THREADS
> +	if (rc != 0) {
> +		session_dtrace_unlock(self);
> +		return raise_dtrace_error(self, "dtrace_aggregate_snap");
> +	}
> +	session_dtrace_unlock(self);
> +
> +	Py_RETURN_NONE;
> +}
> +
> +static PyObject *
> +PyDTraceSession_agg_clear(PyDTraceSession *self, PyObject *Py_UNUSED(args))
> +{
> +	if (ensure_open(self) < 0)
> +		return NULL;
> +
> +	if (session_dtrace_lock_open(self) < 0)
> +		return NULL;
> +	dtrace_aggregate_clear(self->dtp);
> +	session_dtrace_unlock(self);
> +	Py_RETURN_NONE;
> +}
> +
> +static dtrace_aggregate_walk_f *
> +resolve_agg_walk(const char *mode)
> +{
> +	if (mode == NULL || strcmp(mode, "default") == 0)
> +		return dtrace_aggregate_walk;
> +	if (strcmp(mode, "keys") == 0)
> +		return dtrace_aggregate_walk_keysorted;
> +	if (strcmp(mode, "values") == 0)
> +		return dtrace_aggregate_walk_valsorted;
> +	if (strcmp(mode, "keyrev") == 0)
> +		return dtrace_aggregate_walk_keyrevsorted;
> +	if (strcmp(mode, "valrev") == 0)
> +		return dtrace_aggregate_walk_valrevsorted;
> +	if (strcmp(mode, "keyvar") == 0)
> +		return dtrace_aggregate_walk_keyvarsorted;
> +	if (strcmp(mode, "valvar") == 0)
> +		return dtrace_aggregate_walk_valvarsorted;
> +	if (strcmp(mode, "keyvarrev") == 0)
> +		return dtrace_aggregate_walk_keyvarrevsorted;
> +	if (strcmp(mode, "valvarrev") == 0)
> +		return dtrace_aggregate_walk_valvarrevsorted;
> +	return NULL;
> +}
> +
> +static PyObject *
> +PyDTraceSession_agg_walk(PyDTraceSession *self, PyObject *args, PyObject *kwds)
> +{
> +	static char *kwlist[] = {"mode", NULL};
> +	const char *mode = "values";
> +	dtrace_aggregate_walk_f *walker = NULL;
> +	agg_walk_ctx_t ctx;
> +	int rc;
> +
> +	if (ensure_open(self) < 0)
> +		return NULL;
> +
> +	if (!PyArg_ParseTupleAndKeywords(args, kwds, "|s", kwlist, &mode))
> +		return NULL;
> +
> +	walker = resolve_agg_walk(mode);
> +	if (walker == NULL) {
> +		PyErr_SetString(PyExc_ValueError,
> +				"unknown aggregation walk mode");
> +		return NULL;
> +	}
> +
> +	ctx.list = PyList_New(0);
> +	if (ctx.list == NULL)
> +		return NULL;
> +	ctx.session = self;
> +
> +	if (session_dtrace_lock_open(self) < 0) {
> +		Py_DECREF(ctx.list);
> +		return NULL;
> +	}
> +	rc = walker(self->dtp, agg_walk_callback, &ctx);
> +	if (rc != 0) {
> +		PyObject *error = raise_dtrace_error(self, "dtrace_aggregate_walk");
> +
> +		session_dtrace_unlock(self);
> +		Py_DECREF(ctx.list);
> +		return error;
> +	}
> +	session_dtrace_unlock(self);
> +
> +	return ctx.list;
> +}
> +
> +/* ------------------------------------------------------------------------- */
> +/* PyDTraceProc                                                              */
> +/* ------------------------------------------------------------------------- */
> +
> +static PyObject *
> +PyDTraceProc_new(PyTypeObject *type, PyObject *args, PyObject *kwds)
> +{
> +	UNUSED(args);
> +	UNUSED(kwds);
> +	PyDTraceProc *self = (PyDTraceProc *)type->tp_alloc(type, 0);
> +	if (self != NULL) {
> +		self->session = NULL;
> +		self->proc = NULL;
> +	}
> +	return (PyObject *)self;
> +}
> +
> +static void
> +PyDTraceProc_dealloc(PyDTraceProc *self)
> +{
> +	if (self->session) {
> +		if (self->proc) {
> +			session_dtrace_lock(self->session);
> +			if (self->session->dtp != NULL)
> +				dtrace_proc_release(self->session->dtp, self->proc);
> +			session_dtrace_unlock(self->session);
> +		}
> +
> +		Py_XDECREF(self->session);
> +	}
> +	PyObject_Del(self);
> +}
> +
> +static PyObject *
> +PyDTraceProc_getpid(PyDTraceProc *self, PyObject *Py_UNUSED(args))
> +{
> +	int pid;
> +
> +	if (self->session == NULL || self->session->closed ||
> +	    self->session->dtp == NULL || self->proc == NULL) {
> +		PyErr_SetString(PyExc_DTraceError,
> +				"DTrace process handle is released");
> +		return NULL;
> +	}
> +
> +	if (session_dtrace_lock_open(self->session) < 0)
> +		return NULL;
> +	if (self->proc == NULL) {
> +		session_dtrace_unlock(self->session);
> +		PyErr_SetString(PyExc_DTraceError,
> +				"DTrace process handle is released");
> +		return NULL;
> +	}
> +	pid = dtrace_proc_getpid(self->session->dtp, self->proc);
> +	session_dtrace_unlock(self->session);
> +
> +	return PyLong_FromLong(pid);
> +}
> +
> +static PyMethodDef PyDTraceProc_methods[] = {
> +	{"getpid", (PyCFunction)PyDTraceProc_getpid, METH_NOARGS, "Get pid."},
> +	{NULL, NULL, 0, NULL}};
> +
> +static PyTypeObject PyDTraceProcType = {
> +	PyVarObject_HEAD_INIT(NULL, 0).tp_name = "dtrace.DTraceProc",
> +	.tp_basicsize = sizeof(PyDTraceProc),
> +	.tp_flags = Py_TPFLAGS_DEFAULT,
> +	.tp_new = PyDTraceProc_new,
> +	.tp_dealloc = (destructor)PyDTraceProc_dealloc,
> +	.tp_methods = PyDTraceProc_methods,
> +};
> +
> +#define PROC_CREATE_ARGC_MAX 32
> +
> +static PyObject *
> +PyDTraceSession_proc_create(PyDTraceSession *self, PyObject *args,
> +			    PyObject *kwds)
> +{
> +	static char *kwlist[] = {"args", NULL};
> +	PyObject *arglist = NULL;
> +	PyObject *encoded[PROC_CREATE_ARGC_MAX] = {};
> +	char *argvlist[PROC_CREATE_ARGC_MAX + 1];
> +	struct dtrace_proc *proc = NULL;
> +	PyDTraceProc *retproc;
> +	PyObject *ret = NULL;
> +	Py_ssize_t i, size;
> +
> +	if (ensure_open(self) < 0)
> +		return NULL;
> +
> +	if (!PyArg_ParseTupleAndKeywords(args, kwds, "O!", kwlist, &PyList_Type,
> +					 &arglist))
> +		return NULL;
> +	size = PyList_Size(arglist);
> +	if (size < 1) {
> +		PyErr_SetString(PyExc_ValueError,
> +				"empty arglist for proc_create");
> +		return NULL;
> +	}
> +	if (size >= PROC_CREATE_ARGC_MAX) {
> +		PyErr_SetString(PyExc_ValueError,
> +				"too many arguments for proc_create");
> +		return NULL;
> +	}
> +	for (i = 0; i < size; i++) {
> +		PyObject *item = PyList_GetItem(arglist, i);
> +
> +		if (!PyUnicode_Check(item)) {
> +			PyErr_SetString(PyExc_ValueError,
> +					"non-string in argument list");
> +			goto error;
> +		}
> +		encoded[i] = PyUnicode_AsUTF8String(item);
> +		if (encoded[i] == NULL)
> +			goto error;
> +		argvlist[i] = PyBytes_AS_STRING(encoded[i]);
> +	}
> +	argvlist[i] = NULL;
> +	if (session_dtrace_lock_open(self) < 0)
> +		goto error;
> +	proc = dtrace_proc_create(self->dtp, argvlist[0], argvlist, 0);
> +	if (proc == NULL) {
> +		ret = raise_dtrace_error(self, "dtrace_proc_create");
> +		session_dtrace_unlock(self);
> +		goto error;
> +	}
> +
> +	ret = PyDTraceProcType.tp_alloc(&PyDTraceProcType, 0);
> +	if (ret == NULL) {
> +		dtrace_proc_release(self->dtp, proc);
> +		session_dtrace_unlock(self);
> +		goto error;
> +	}
> +	self->pids++;
> +	session_dtrace_unlock(self);
> +	retproc = (PyDTraceProc *)ret;
> +	retproc->session = self;
> +	Py_INCREF(self);
> +	retproc->proc = proc;
> +	for (i = 0; i < size; i++)
> +		Py_DECREF(encoded[i]);
> +
> +	return ret;
> +
> +error:
> +	while (i-- > 0)
> +		Py_XDECREF(encoded[i]);
> +	return ret;
> +}
> +
> +static PyObject *
> +PyDTraceSession_proc_grab_pid(PyDTraceSession *self, PyObject *args,
> +			      PyObject *kwds)
> +{
> +	static char *kwlist[] = {"pid", NULL};
> +	struct dtrace_proc *proc = NULL;
> +	PyDTraceProc *retproc;
> +	PyObject *ret;
> +	int pid;
> +
> +	if (ensure_open(self) < 0)
> +		return NULL;
> +
> +	if (!PyArg_ParseTupleAndKeywords(args, kwds, "i", kwlist, &pid))
> +		return NULL;
> +
> +	if (session_dtrace_lock_open(self) < 0)
> +		return NULL;
> +	proc = dtrace_proc_grab_pid(self->dtp, pid, 0);
> +	if (!proc) {
> +		ret = raise_dtrace_error(self, "dtrace_proc_grab_pid");
> +		session_dtrace_unlock(self);
> +		return ret;
> +	}
> +	ret = PyDTraceProcType.tp_alloc(&PyDTraceProcType, 0);
> +	if (ret == NULL) {
> +		dtrace_proc_release(self->dtp, proc);
> +		session_dtrace_unlock(self);
> +		return ret;
> +	}
> +	self->pids++;
> +	session_dtrace_unlock(self);
> +	retproc = (PyDTraceProc *)ret;
> +	retproc->session = self;
> +	Py_INCREF(self);
> +	retproc->proc = proc;
> +
> +	return ret;
> +}
> +
> +static PyObject *
> +PyDTraceSession_proc_continue(PyDTraceSession *self, PyObject *args,
> +			      PyObject *kwds)
> +{
> +	static char *kwlist[] = {"proc", NULL};
> +	PyDTraceProc *proc = NULL;
> +
> +	if (ensure_open(self) < 0)
> +		return NULL;
> +
> +	if (!PyArg_ParseTupleAndKeywords(args, kwds, "O!", kwlist,
> +					 &PyDTraceProcType, &proc))
> +		return NULL;
> +	if (proc->session != self) {
> +		PyErr_SetString(PyExc_ValueError,
> +				"proc was created by a different session");
> +		return NULL;
> +	}
> +
> +	if (proc->proc == NULL) {
> +		PyErr_SetString(PyExc_DTraceError,
> +				"DTrace process handle is released");
> +		return NULL;
> +	}
> +
> +	if (session_dtrace_lock_open(self) < 0)
> +		return NULL;
> +	if (proc->proc == NULL) {
> +		session_dtrace_unlock(self);
> +		PyErr_SetString(PyExc_DTraceError,
> +				"DTrace process handle is released");
> +		return NULL;
> +	}
> +	dtrace_proc_continue(self->dtp, proc->proc);
> +	self->pids_live++;
> +	session_dtrace_unlock(self);
> +
> +	Py_RETURN_NONE;
> +}
> +
> +static PyObject *
> +PyDTraceSession_proc_release(PyDTraceSession *self, PyObject *args,
> +			     PyObject *kwds)
> +{
> +	static char *kwlist[] = {"proc", NULL};
> +	PyDTraceProc *proc;
> +
> +	if (ensure_open(self) < 0)
> +		return NULL;
> +
> +	if (!PyArg_ParseTupleAndKeywords(args, kwds, "O!", kwlist,
> +					 &PyDTraceProcType, &proc))
> +		return NULL;
> +
> +	if (proc->session != self) {
> +		PyErr_SetString(PyExc_ValueError,
> +				"proc was created by a different session");
> +		return NULL;
> +	}
> +
> +	if (proc->proc == NULL) {
> +		PyErr_SetString(PyExc_DTraceError,
> +				"DTrace process handle is already released");
> +		return NULL;
> +	}
> +
> +	if (session_dtrace_lock_open(self) < 0)
> +		return NULL;
> +	if (proc->proc == NULL) {
> +		session_dtrace_unlock(self);
> +		PyErr_SetString(PyExc_DTraceError,
> +				"DTrace process handle is already released");
> +		return NULL;
> +	}
> +	dtrace_proc_release(self->dtp, proc->proc);
> +	session_dtrace_unlock(self);
> +	proc->proc = NULL;
> +
> +	Py_RETURN_NONE;
> +}
> +
> +static PyMethodDef PyDTraceSession_methods[] = {
> +	{"close", (PyCFunction)PyDTraceSession_close, METH_NOARGS,
> +	 "Close the session."},
> +	{"__enter__", (PyCFunction)PyDTraceSession_enter, METH_NOARGS,
> +	 "Context manager entry."},
> +	{"__exit__", (PyCFunction)PyDTraceSession_exit, METH_VARARGS,
> +	 "Context manager exit."},
> +	{"setopt", (PyCFunction)PyDTraceSession_setopt,
> +	 METH_VARARGS | METH_KEYWORDS, "Set a DTrace option."},
> +	{"compile", (PyCFunction)PyDTraceSession_compile,
> +	 METH_VARARGS | METH_KEYWORDS, "Compile a program from a string."},
> +	{"enable", (PyCFunction)PyDTraceSession_enable,
> +	 METH_VARARGS | METH_KEYWORDS, "Enable a compiled program."},
> +	{"go", (PyCFunction)PyDTraceSession_go, METH_VARARGS | METH_KEYWORDS,
> +	 "Start tracing."},
> +	{"stop", (PyCFunction)PyDTraceSession_stop, METH_NOARGS,
> +	 "Stop tracing."},
> +	{"update", (PyCFunction)PyDTraceSession_update, METH_NOARGS,
> +	 "Update module cache."},
> +	{"status", (PyCFunction)PyDTraceSession_status, METH_NOARGS,
> +	 "Retrieve tracing status."},
> +	{"work", (PyCFunction)PyDTraceSession_work,
> +	 METH_VARARGS | METH_KEYWORDS, "Do consumer loop work."},
> +	{"agg_snap", (PyCFunction)PyDTraceSession_agg_snap, METH_NOARGS,
> +	 "Snapshot aggregation buffers."},
> +	{"agg_clear", (PyCFunction)PyDTraceSession_agg_clear, METH_NOARGS,
> +	 "Clear aggregation buffers."},
> +	{"agg_walk", (PyCFunction)PyDTraceSession_agg_walk,
> +	 METH_VARARGS | METH_KEYWORDS, "Return aggregation results."},
> +	{"proc_create", (PyCFunction)PyDTraceSession_proc_create,
> +	 METH_VARARGS | METH_KEYWORDS, "Create process with args for tracing."},
> +	{"proc_grab_pid", (PyCFunction)PyDTraceSession_proc_grab_pid,
> +	 METH_VARARGS | METH_KEYWORDS, "Grab pid."},
> +	{"proc_continue", (PyCFunction)PyDTraceSession_proc_continue,
> +	 METH_VARARGS | METH_KEYWORDS, "Continue proc execution."},
> +	{"proc_release", (PyCFunction)PyDTraceSession_proc_release,
> +	 METH_VARARGS | METH_KEYWORDS, "Relase proc."},
> +	{NULL, NULL, 0, NULL}};
> +
> +static PyTypeObject PyDTraceSessionType = {
> +	PyVarObject_HEAD_INIT(NULL, 0).tp_name = "dtrace.DTraceSession",
> +	.tp_basicsize = sizeof(PyDTraceSession),
> +	.tp_flags = Py_TPFLAGS_DEFAULT,
> +	.tp_new = PyDTraceSession_new,
> +	.tp_init = (initproc)PyDTraceSession_init,
> +	.tp_dealloc = (destructor)PyDTraceSession_dealloc,
> +	.tp_methods = PyDTraceSession_methods,
> +};
> +
> +/* ------------------------------------------------------------------------- */
> +/* Module definition                                                         */
> +/* ------------------------------------------------------------------------- */
> +
> +static struct PyModuleDef pydtrace_module = {
> +	PyModuleDef_HEAD_INIT,
> +	.m_name = "dtrace",
> +	.m_doc = "Python bindings for libdtrace.",
> +	.m_size = -1,
> +};
> +
> +PyMODINIT_FUNC
> +PyInit_dtrace(void)
> +{
> +	PyObject *m;
> +
> +	if (PyType_Ready(&PyDTraceSessionType) < 0)
> +		return NULL;
> +	if (PyType_Ready(&PyDTraceProgramType) < 0)
> +		return NULL;
> +	if (PyType_Ready(&PyDTraceProcType) < 0)
> +		return NULL;
> +
> +	m = PyModule_Create(&pydtrace_module);
> +	if (m == NULL)
> +		return NULL;
> +
> +	PyExc_DTraceError = PyErr_NewException("dtrace.DTraceError",
> +					       PyExc_RuntimeError, NULL);
> +	if (PyExc_DTraceError == NULL) {
> +		Py_DECREF(m);
> +		return NULL;
> +	}
> +
> +	Py_INCREF(&PyDTraceSessionType);
> +	if (PyModule_AddObject(m, "DTraceSession",
> +			       (PyObject *)&PyDTraceSessionType) < 0) {
> +		Py_DECREF(&PyDTraceSessionType);
> +		Py_DECREF(m);
> +		return NULL;
> +	}
> +
> +	Py_INCREF(&PyDTraceProgramType);
> +	if (PyModule_AddObject(m, "DTraceProgram",
> +			       (PyObject *)&PyDTraceProgramType) < 0) {
> +		Py_DECREF(&PyDTraceProgramType);
> +		Py_DECREF(m);
> +		return NULL;
> +	}
> +
> +	Py_INCREF(&PyDTraceProcType);
> +	if (PyModule_AddObject(m, "DTraceProc", (PyObject *)&PyDTraceProcType) <
> +	    0) {
> +		Py_DECREF(&PyDTraceProcType);
> +		Py_DECREF(m);
> +		return NULL;
> +	}
> +
> +	Py_INCREF(PyExc_DTraceError);
> +	if (PyModule_AddObject(m, "DTraceError", PyExc_DTraceError) < 0) {
> +		Py_DECREF(PyExc_DTraceError);
> +		Py_DECREF(m);
> +		return NULL;
> +	}
> +
> +	if (PyModule_AddIntConstant(m, "DTRACE_VERSION", DTRACE_VERSION) < 0) {
> +		Py_DECREF(m);
> +		return NULL;
> +	}
> +
> +	if (PyModule_AddIntConstant(m, "DTRACE_C_CPP", DTRACE_C_CPP) < 0 ||
> +	    PyModule_AddIntConstant(m, "DTRACE_C_ZDEFS", DTRACE_C_ZDEFS) < 0) {
> +		Py_DECREF(m);
> +		return NULL;
> +	}
> +
> +	if (PyModule_AddIntConstant(m, "DTRACE_STATUS_NONE",
> +				    DTRACE_STATUS_NONE) < 0) {
> +		Py_DECREF(m);
> +		return NULL;
> +	}
> +	if (PyModule_AddIntConstant(m, "DTRACE_STATUS_OKAY",
> +				    DTRACE_STATUS_OKAY) < 0) {
> +		Py_DECREF(m);
> +		return NULL;
> +	}
> +	if (PyModule_AddIntConstant(m, "DTRACE_STATUS_EXITED",
> +				    DTRACE_STATUS_EXITED) < 0) {
> +		Py_DECREF(m);
> +		return NULL;
> +	}
> +	if (PyModule_AddIntConstant(m, "DTRACE_STATUS_FILLED",
> +				    DTRACE_STATUS_FILLED) < 0) {
> +		Py_DECREF(m);
> +		return NULL;
> +	}
> +	if (PyModule_AddIntConstant(m, "DTRACE_STATUS_STOPPED",
> +				    DTRACE_STATUS_STOPPED) < 0) {
> +		Py_DECREF(m);
> +		return NULL;
> +	}
> +	if (PyModule_AddIntConstant(m, "DTRACE_WORKSTATUS_DONE",
> +				    DTRACE_WORKSTATUS_DONE) < 0) {
> +		Py_DECREF(m);
> +		return NULL;
> +	}
> +	if (PyModule_AddIntConstant(m, "DTRACE_WORKSTATUS_OKAY",
> +				    DTRACE_WORKSTATUS_OKAY) < 0) {
> +		Py_DECREF(m);
> +		return NULL;
> +	}
> +
> +	return m;
> +}
> diff --git a/configure b/configure
> index 403b1a09..fce22e9f 100755
> --- a/configure
> +++ b/configure
> @@ -112,6 +112,7 @@ EOF
>          make help-overrides-header help-overrides-option
>          cat >&2 <<'EOF'
>  --with-systemd=[yes/no]		Install the systemd unit files (default: yes)
> +--with-python=[yes/no]		Build the Python bindings (default: enabled when prerequisites are present)
>  EOF
>          echo >&2
>          make help-overrides
> @@ -199,6 +200,8 @@ for option in "$@"; do
>          --kernel-obj-suffix=*) write_make_var KERNELBLDNAME "$option";;
>          --with-systemd|--with-systemd=y*) write_make_var WITH_SYSTEMD "y";;
>          --with-systemd=n*|--without-systemd) write_make_var WITH_SYSTEMD "";;
> +        --with-python|--with-python=y*) write_make_var WITH_PYTHON "y";;
> +        --with-python=n*|--without-python) write_make_var WITH_PYTHON "";;
>          HAVE_ELF_GETSHDRSTRNDX=*) write_config_var ELF_GETSHDRSTRNDX "$option";;
>          --with-libctf=*) write_config_var LIBCTF "$option";;
>          HAVE_LIBCTF=*) write_config_var LIBCTF "$option";;
> @@ -245,4 +248,3 @@ cat build/.config/*.h > build/config.h
>  cat build/.config/*.mk > build/config.mk
>  
>  exit 0
> -
> -- 
> 2.43.5
> 
