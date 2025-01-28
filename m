Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E0D5EAF6
	for <dtrace@lists.linux.dev>; Tue, 28 Jan 2025 23:32:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738107138; cv=fail; b=NP2ma0QETRYJzVDwFEfjX8eBrcEGevlpq7mPzPm6Je/VYvNT9G8myXiPRo/tyBNCPKg6RnFXq8nHd02KmozWzPTk1NicDrzerMiwKcQtroXPCB7tx9UGH/O/XRgLFiCkO7rbjol694S6PQLmQ45VnoCNJSBppW5r/mh/5cS9ijc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738107138; c=relaxed/simple;
	bh=T/3wBbFulj9bNuNoR+EGgBEsQrCz5NqrnwGq5XeieGI=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=OlmL9nieDAHst6w2UcRSIPYfFJnVtBsP4hMrsfxu3WL66lYS/TQ1sCFYPenuDeqikhigH5vz+9uaY2XckwDDIn3fgf0MuaOSmCfcWu9anyyNi1bgFungURgoXSmiSjptxq4lmVE0W0v5Xx31ZD6fDkqzByI3+O7ysT8L2tNLj40=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=MuHsIYW3; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=ZEyhyDCG; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="MuHsIYW3";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="ZEyhyDCG"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50SMgWsH022881
	for <dtrace@lists.linux.dev>; Tue, 28 Jan 2025 23:32:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=O0if7Nt4CPLfbKPITgtubMAyfU0ZvVVF0Lmcnj4bwSI=; b=
	MuHsIYW3ITObUOhhsREvQ/azK68meVk9sp1pG4mJOUcR0lud2dnU4j2wnewH2XaS
	Uqy+rhrSxeaDHOnkCsuvid1X04/4zTMF4AKzh7OgrJoKmsPq0Gt1+No48mwhRsSo
	GuDeZjl0i6u1+Dp7OFuGMmWfWwSNIi/uPpIW6h3y9UAasjBzvdSDjFlZWCgq3l/x
	EmHD7ArJEXJe7LX4oof9Vbz4EZnNKUlpNPGgTl14q1RpFXkCadx+EOFkMEpMMgai
	9VGeiCR7KGp6BhHBANcgu+ZRg1s5SyyAzQkjWCfTHEDJi4VZq0/WxUTR+Kma9Brf
	+nHYZcu83Vkd1xrzkTsymw==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 44f88rg208-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 28 Jan 2025 23:32:15 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 50SM46WD005528
	for <dtrace@lists.linux.dev>; Tue, 28 Jan 2025 23:32:14 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2173.outbound.protection.outlook.com [104.47.57.173])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 44cpd93qba-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 28 Jan 2025 23:32:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NNG4Fa0tjk/+UVFKXG3sd8dEgdwzKUC3MXU3ikcN+11QFLtrlklv63FXFzgUITEGQ3EmIlixbNbCDX+rxkOPZ9Lfs8LGhp7JD91AhNQuuLnIdLHkID+GW46JV0fnyrca6AMm4tuK9PFLrv7HC8bFCjf0tJFsMAzx8sM5Ps4z8XaX9ANWCUxqaEoYS0Z8q+TfWuRsrlsxC811FoCkGQR3R0bKcd1lEjh1BB1Oohqhofoa/mqr4ps06gTOklxTARdeYBgf0IxceZuxuXJnQqzRR3D/hnFmCGnfwWc/RMG84314qtfSzN4BZ7zjOJQvSWljD4sPeb4lvLm6IOBxo0qhkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O0if7Nt4CPLfbKPITgtubMAyfU0ZvVVF0Lmcnj4bwSI=;
 b=S8T5okUdavIl1wxqHkYqe67t4nu/cPC3UIOd8M8IRaKp4nCMRrZFyd6leIjAIOH6DJQWm7F5xGcI4dDL315h6+9bF5BN32x6CqPV42IDwmbebeZkyVhX/rS8+1wWKLEVQceA5wzn9t/0KYjwXHF1c8HYC3Kh9Bq33srLC1eJIqAGW73lX0IBtNL7748yiv4YOfXp87XWag+qIc/ZEC8oW2huntzZHySE+c26OR9GxQ7gMvZg5UEm530C7xQs+3Ak00lFGBhCkIPZaDkcBQlMEzXHwmZVnVemM7QbqkXr6/vIi3P4HUAbsu8Xnb/h07zcu1W1GaZxDh68CdGxwSjr5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O0if7Nt4CPLfbKPITgtubMAyfU0ZvVVF0Lmcnj4bwSI=;
 b=ZEyhyDCG3zYXb1mGrDbbDAgowq2DGN3Nwr/bIFwzIGyGck4228d9eaK8/I03gL/UWJ8xPkyQ/PtfJ4Px50z+bVvwWIrxBMESjTdX6yr6e3OGubOl6Y+dDzQSkQWtxwuUfL31kfoUfbFa5XFB7hGRZheQoPwy+YI+TthAPZ8nV1c=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by LV3PR10MB7796.namprd10.prod.outlook.com (2603:10b6:408:1ae::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.22; Tue, 28 Jan
 2025 23:32:12 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%7]) with mapi id 15.20.8377.021; Tue, 28 Jan 2025
 23:32:12 +0000
Message-ID: <7fb5c8f0-ec5d-4350-6516-341c995c2683@oracle.com>
Date: Tue, 28 Jan 2025 18:32:11 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 2/6] include: remove unnecessary include of universal.h
Content-Language: en-US
To: Kris Van Hees <kris.van.hees@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
References: <PH8PR10MB633743494EB68A4F22CD0473C2EF2@PH8PR10MB6337.namprd10.prod.outlook.com>
From: Eugene Loh <eugene.loh@oracle.com>
In-Reply-To: <PH8PR10MB633743494EB68A4F22CD0473C2EF2@PH8PR10MB6337.namprd10.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0339.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::14) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|LV3PR10MB7796:EE_
X-MS-Office365-Filtering-Correlation-Id: 76b46d9e-14ee-4481-09b9-08dd3ff3fdad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?S0RDRDc1YUNzWk53T2tJa2xhWEFaVS9VbWU5YUZoMFl2eTZiOTZOdWtJM1Iw?=
 =?utf-8?B?WmUzNWEvNzdSTDJCdFNxeGFqemc2aStYVXpmc29IcmZFU3ZUNXVQWTdTVXRi?=
 =?utf-8?B?RDdXb0dMbUxNSEdoSXIzeWVrQmlYNGhKT0VjaHArK1JMZmJuT3hSZGZEejl4?=
 =?utf-8?B?dHhsemJIeUN0dEp5ZzFqb2JqeTYxWGNNU2pwejBKb0lpVnBrZUhadldmLzRu?=
 =?utf-8?B?MzNrZ25pUW1QSUlaeG5WNHhLemp3Uk1vY3kwNCtOZjlsdHc1aXhVWmhjajhZ?=
 =?utf-8?B?T0s4UHdYT1NlWXc5YUFybXJUSkhySFJPd3EwcUlscExvd3RzQjhpT2Y1bkJQ?=
 =?utf-8?B?UXZnQXFjcTdkaWdqMkVwUEJoQWNrK3ZDRHVhaUtJZGJYTkRhRVFPYWV6STB1?=
 =?utf-8?B?OTRJU2theTBtc2s3TDVudi9iUGFRbTB2QjFIQ3EzVmRxbS8xT2p6TGhmbHJ4?=
 =?utf-8?B?bG1YeTFxT1loMEVnWHN5MVJxLzZyVjludjhFTk9FQjlVMGJKeTdLZWlCRjg2?=
 =?utf-8?B?L0tuMCtheXpUcUUxc0kzOWp6Uk45ODlGN3VuSWY1Y09tKzlHYnRuMGtESk9N?=
 =?utf-8?B?NnFkU25CWThHa0k3YVY3MXcxZFAzRkNuL0VVZCtyaXdOQTk3VytEUzZ5T0V6?=
 =?utf-8?B?dzRRRVB6allaam96Uy9JUElMMkM5WjlqcElwZVVPK3JjUjVJcXV2SnRUQjhY?=
 =?utf-8?B?dmZmMFFsZ2hDZUFXNzFQZHVzQUErdGE0Y1k1anFLY0ticDZyRzA0U1pZY3Fq?=
 =?utf-8?B?WGVDQlVSdklhRjFxUTE0anIwVmRjOVJ2RHl1VnIzclJTWjFFWkVxeUs3Y292?=
 =?utf-8?B?YTZ6NXdjQXRzaFB5ZXhaNkw2Yk00a21MNCtOZUtyd0pIOE5GenFYSjV2Tlpn?=
 =?utf-8?B?c01CZytTNG9PMEkxazljWWpLdnBHUm12TWMwSGgwMHVvRXZuaGlPT1laVk5V?=
 =?utf-8?B?ZEFDRTRPL2QwRHZkUkE4L25GK3A4MzlMRklKL3NERlo2Z0UrVFZTUGhQaWhE?=
 =?utf-8?B?aDFITUJKdStOT2E2M0k5VzhuSDZVSjNtQ0g5aVlvdWF0bXZCVUE1akVLVll0?=
 =?utf-8?B?VllYazczK1FwWWxYSUhpNE5KL1BKK1NoNXVWMzJuODdoOVRQS0c3V3NETU5V?=
 =?utf-8?B?OG8vZVJaTWpJSktQaWRMdjM0SmZzQnlwMFBRdXBDWEU1WWo2dmNNZnBIVkZ1?=
 =?utf-8?B?VzduV0pwZXl4Uit1eEpNb3NScmxxaEZFTkU2K0xDRkVyamltRUVNZGNFWTMx?=
 =?utf-8?B?L3l6ZDE4Q25HL0phcjhOSEtaSFZZUUdpbnljNjNLOTVwTUNiVTExZ3ZRQms1?=
 =?utf-8?B?dmZwMnZaaDVtdkpXVERsYWV4ZkFZaXh3by9YZ0RGdXQ0M1doellqUWhpRitz?=
 =?utf-8?B?UGhtV1QzRS85U2hxaThBc2xpY0hSckVNOEx1c2FtTlBMaTVMY3NlTm9FaTVS?=
 =?utf-8?B?aU5xQ2NSZWNnTU03eVlSZndtTEcxdUN2Yk9UbmdzbDV1T2F6Q1ZTSi9LVkJF?=
 =?utf-8?B?QTVaQUtGRXRkKytGSFZKQVFYVU5Lbnc2dDZ2YTVvUkVjSzh4L2I0UHN1UzQx?=
 =?utf-8?B?RjltVU9ZR3VMUzJwQzcxRklBL1MrdGdNSHByZzhCeFUzbGQxajlhS2cwbzdl?=
 =?utf-8?B?RjVSWXE3T3RDY3FaTzFBcDMxRHNIc0ZOQWQrL3VUWjQxZXZFbVhQUDF6RDMz?=
 =?utf-8?B?OHBXeCsybkxzakEwKytJdkJIS1Q2eVZ4THpPV1FxcE1pbFBWUVNUWTh3YUF1?=
 =?utf-8?B?MVZQQUplYm1xN1I1cUxmblV2ODZ1Nm9mbWNVYU4xa0s4MXdOQjlrZ2tpNlhm?=
 =?utf-8?B?Z3RuZStQMHQ3R2Rtc0t0NFd3Nk0vc0RlV0VSbVZ2M1BvMnRqN3VSYWhMNERj?=
 =?utf-8?Q?GzPu6UqkG+2tq?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?a25GUkJHbzZFdWF4dE4yWTdsbW9FM1dVNnRZVTNOVlYwcitrRmJUWnJ3M3Bn?=
 =?utf-8?B?Z3dhUlNnWmdoVzZnaFA3VWxUMjFTeGRKMUJGMTBEUytUa3pjTWRsZUd5TUI3?=
 =?utf-8?B?RnFSTURtZ3kyb1hvc3EydXY2VVZCR3g3emlCTFZhaHVkS2FqNnZxeW53aUJh?=
 =?utf-8?B?MDU0eUo5MWg4amYraGtKYUswb2pMN1lqZGttS0xKNXhWWG9Td3ZXSys1NHRx?=
 =?utf-8?B?MkJ1RGZKREFQbHZWZUZkNzJHcERxZzVrd2x6bkJuU3hNSHpFM3BITXo3VmV3?=
 =?utf-8?B?dzhQamVhSHo1UGltOCt5c0FhUmxJazFJUlNDczdHRm41cGRJS05ENjZDRkVD?=
 =?utf-8?B?bzh1K2E0allxR2tiYU54VXdTWGFCNk1FTXAyT1lYdURmR0hNeENZdy94Unc2?=
 =?utf-8?B?NWNsOE14c3lNc09YQXM4T3V1dEp4UGFVOGNDdFVrWXVMQm05UHBwRUUyczJk?=
 =?utf-8?B?aS90aVRrRW82TG43U3ZqZjMzcmRBMmR2Y3ZCL09tM3BRSU4zby96NEVRdzln?=
 =?utf-8?B?MDNVelB2eUJDWkVKRmF2Z0pxRlNDY2YwbWcvYVczM3RqM0pjSVRZdGs5L3FB?=
 =?utf-8?B?NmZTQ1REbHNncGNNK1hHQUgrcWI0VmpSVWhnZXN0YnlhODZBbngvMDRLTGdt?=
 =?utf-8?B?RnpFME96MjVDR2xLRTh6b214OXBTOFhqeTEzT2N5N0diYWFYRkNGYzB4cVJM?=
 =?utf-8?B?Wk53bzliWVJsZEZWNEw5eFpHU0ZEM0d2TTY4ZUxObndEMERaNXBOU0VhMnhl?=
 =?utf-8?B?YXFKVlFNd0lvaDhVZlAyQ0ZlWk0vWFFZQkVyQWdxOFVtRjhyb2pTeHI3YWp0?=
 =?utf-8?B?ZldQdTV1K2xqY25xTS9uMm1TSEplekpBTXRHV2RkVm90THhrcUtXRllja0to?=
 =?utf-8?B?WXArNWliNFNodFNwSVNZdGxWbm1BdUtVbjVuRHJuY3lkemtVdE5DbjcvRUgw?=
 =?utf-8?B?eHlYVEI2cldGWGxnNXFSNGxVM1JhZWo0cy80Mytwd0NpTlV1Yk93Y2gvMXVB?=
 =?utf-8?B?dlU1K0ZXZEdOYWEzQ1AvODlQNFBDSEsvcGZXekRYaHh2ZEIzb3MvbWFCYTR0?=
 =?utf-8?B?QXovOEF5RUlPTGljei9EWHpZZkVBTjd6Szl5dENwT0pyRTRPY1FNUGFlS3ZO?=
 =?utf-8?B?WkREcTVNOW5iMWFoamRTYkF2c1c3VFFjWDVTT1h0M0pQOURzOEVMNFlpWUw3?=
 =?utf-8?B?RnVSR2tkZ3JiRzZNWDlvaUY1RTlCWEttb3F1U1l6SUU3ZkpaL3pVcWN6b1Ji?=
 =?utf-8?B?QVhzNjErbTNKdnpOS0FLN3ZaUjdyUzJGdzA5UW5jcU5GeFozdjF2cFdRTFRs?=
 =?utf-8?B?cU5qc09Bdm1vSFhyZHRlNG8vU09mM3dBcmlYNDcwZEdQQzFnUFdmQzVIMHFl?=
 =?utf-8?B?TlljWnBKeTFNM1VFWGx2RHhTM3FzZTYvR2xpWXd3SkRxZTdOQkVZaGpQdUZu?=
 =?utf-8?B?UU1rKzVoTmErWVhpTXJVNVpqeXhNalIxaUM3TGE0K2pYZUd5VGoybDYzN1Js?=
 =?utf-8?B?Qi9Ya3MvYTBwMnlHUXcyQkFDZkFJQTVmTWJBc2VZdWlTNG94SVR1REIvb2lW?=
 =?utf-8?B?dGpnUnhBd0R2NXdic2V6cG5wWjU0K3BXNVVuRmJSVXlpTk16TUtyWDN1RFgz?=
 =?utf-8?B?N3hqYWYrUUdlam1uQ3JmVUp3aXdnTmJFNHdXdGtUYUpVek5EeVF4R09GYTRl?=
 =?utf-8?B?MzRBcEpOajVlWlZWckVLVEhwTUFTcXEvQVRPYnlrSk1qUUk0bitBY2lxdDVm?=
 =?utf-8?B?c0dOMEtFc1F5Rm9CUklqdHNjSnl0aWxrRlNQWGJWemVWU0xEQkJjMzQxeFRj?=
 =?utf-8?B?cmcvWkVWQU1OdFc1czg4UDl0TEl2UzJRMmhnZHVzUlplNHdwSUZuQUNQbmZX?=
 =?utf-8?B?K3hEblZPYzJsM3dvMHdFT0x6Um04d2J6eXJINnAvNnJheDFrT00zS2tKbjZZ?=
 =?utf-8?B?V3pSYnBFdWNGTDFxMjVNenBPVDQ0eVdkYWJFam04azRGQU9hc09ndHVWRFYv?=
 =?utf-8?B?RDdtdkJRSS9XWU5WRm9JWU0xdzA0ZXJINE81eTZYVEVXVUxzSVlrVG5YWHVO?=
 =?utf-8?B?VkRvcU1MOTErOEttQ3IyL1h0aHNMTEpVTEhlTmdUbHZSeU51a3NlaGxHY3l1?=
 =?utf-8?Q?l+vnq3zkWGq3RWLZSiQYkhtk/?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	ZLnCmMlcsDhxi72ycXZSwCB7JjZgGvuJJefzMcvJ5A4EX/h/OneqlTvwHcWXajGQ5FaCdkcTACmc/sVJGGVb7O06Y9ZL9e4FsUwSW4xB0C+QD2OphX1QszJOGUmQff8koEa/4pHQFP5+rQrEKD555gNQ8aV4Vi8QsWWeqbow+f3K2nEO5gBF/Ls26tN+CjOTtyHe+ntgaH/+SUtNBrUpG9etpHAkDZWiamsejHuR04WYCv5qP+w5Y5H7Tx5o3VoZMwvdseiO1Q0AXgzCVnR7NLHbEdJIA+S+Y2s84rUzxYQ4iJ/NJMd9MUVL1KDpBmaFPMXZ5s2+wh4wqs0k0SIFUabvZYuDP0WnlfA+dDFZBuG6nMnrZJItgH1zhVbKuBpyK1VLSWNeSJ7pXFwonRNR6xiVwUV4Z/RekhzV1ihfT6FyNs85r0Qf2DLln+MBKsgc4xTu9sAG8rhsiqVDc4rz80NRjIGpbA7LqALoongwtLjKznXll7ZZtoLAScZ2wt/rgDU9OF3OGIYVDIQzI7VXU8I1gsWIxH/1tYaxMvvfjqbC3YfKPkNqR5WDyxkZVqVyo9UDQEuzlzRYHhRYjIk25B89EZcWYk7oYCAfb+Tht2A=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 76b46d9e-14ee-4481-09b9-08dd3ff3fdad
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2025 23:32:12.3388
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oLyErVg+ykQ2dYMHvMSOdy8ADAunFTl7hbsQf0EZQZs0joNUMWYaxWVDBm0d0iUyM6oj6o44mC6u2o4sWBH2cA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR10MB7796
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-28_04,2025-01-27_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 mlxscore=0 adultscore=0
 malwarescore=0 spamscore=0 bulkscore=0 mlxlogscore=999 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2411120000
 definitions=main-2501280171
X-Proofpoint-GUID: 3lxWG06x0IdFGEAxONq9b3aFxWClBS6C
X-Proofpoint-ORIG-GUID: 3lxWG06x0IdFGEAxONq9b3aFxWClBS6C

Reviewed-by: Eugene Loh <eugene.loh@oracle.com>

On 1/28/25 01:31, Kris Van Hees wrote:
> Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
> ---
>   include/dtrace/faults_defines.h | 2 --
>   1 file changed, 2 deletions(-)
>
> diff --git a/include/dtrace/faults_defines.h b/include/dtrace/faults_defines.h
> index d50477c7..73aee543 100644
> --- a/include/dtrace/faults_defines.h
> +++ b/include/dtrace/faults_defines.h
> @@ -13,8 +13,6 @@
>   #ifndef _DTRACE_FAULTS_DEFINES_H
>   #define _DTRACE_FAULTS_DEFINES_H
>   
> -#include <dtrace/universal.h>
> -
>   /*
>    * The constants below DTRACEFLT_LIBRARY indicate probe processing faults;
>    * constants at or above DTRACEFLT_LIBRARY indicate faults in probe
