Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B300525484B
	for <dtrace@lists.linux.dev>; Mon, 22 Sep 2025 13:49:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758548947; cv=fail; b=kxuP8p4hbGZbgC/jf8MTOl4I6Z9O74JGjeZ0RKRmmIBt0tmYK32Smw9Wgh5GnxQYS0elaBMCu457mJB3S+nwyPCizdK7LBf8/G9qyFGZEutMuc0GDwnsbNA2IyR3p1WMggP6kODSv7W0c6X79wCbDSS8zBZ4TPm9TWvSSPz5K2k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758548947; c=relaxed/simple;
	bh=bPO9s2arEO2IKHmRriwwxM3VdWOgfn4H2/E9nWHjeo8=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=hWyCk0xP5V9NVgFKVA5Bo3/vlRLbuprv+B6efnomCO7tm0mKGQ6nVqQKi5PRWZDgJ1jb5oPh/RRxEnBZfWoY4S0KdeM6K3CtPrqjof3lvM11nNvFvf2Lw5cApISk8+HieA5/w190mZBTQ47bsMIHw+atYc0l8HBJoo9zfjw+8TU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=pnbeSuQ3; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=c4GRvv7U; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="pnbeSuQ3";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="c4GRvv7U"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58M7Nb0K011409
	for <dtrace@lists.linux.dev>; Mon, 22 Sep 2025 13:49:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=NXQ+oi+8otfH5NFb9kNmoeW2761prsi20LjGy9KPidg=; b=
	pnbeSuQ3466YOid9Ap0cV/BbGzQzJojPg3dYNuSDStwLiTp+bLo3NG3I56nsyQLd
	KTpZyqIn2I2KhxG503aKgN8xv5oLOypQPF9O/DNIY5DiAQYZ8dgGaCMAI+XaAcft
	HFOBVC/HYNxXa+O9bxz/paAjxeihCp+REIEJVGQZDLvEkKFWbNrbBU/vhHrojnNx
	u9s8AnliWgwlzOEeBWI9ZE93PMqHctZ8k1qIp4fLxgo91zFmZlycCnlA7wc0BQPG
	qBI/0F0u3lIemuvlp1LwrBwRFJ9DC1Ud1IhQU7xuO5ARhZQ89s0c30i9POwTCxPf
	CgrOtq5ER8or+90JBFxfDA==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 499k6atgbq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 22 Sep 2025 13:49:03 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 58MDlAQ5002045
	for <dtrace@lists.linux.dev>; Mon, 22 Sep 2025 13:48:53 GMT
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11011001.outbound.protection.outlook.com [52.101.62.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 499jq6vhxn-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 22 Sep 2025 13:48:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UjjRIN/UOgWK/p9uRZU/+6xTQoJaGvV59a3SjNwzljwGUbDwPiC5inIr3y+ALLotw3Emu0BgkNOQqyjp8ulH6LjQeCjnHzv1F3Y/O07AtMCtdk1LO9G0fmbShP+3lb7R4qMbOReDTwbxFw4bRUzNctgnxJBsxWpOPL4c69uCIJWbyx4maUkudimk9sK7SZZwiSg/jmTMGcYpXZmi5De8YNmidLwcc2P4jep0tT0DNprUMp6OrD3Ek8OEfezLci1SlZf3PFzqbZ6gHlZNTdTNF4nROheQsKVDjlnuKmqniAeZR7/CECOgkcGaB6+jmKVq/jIjQvrANwl/IZw4T04j+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NXQ+oi+8otfH5NFb9kNmoeW2761prsi20LjGy9KPidg=;
 b=sYQx4F8xmQHKlaElLG3cdcDhEK6h4D0of3h+4w/B3bq7qJV6aCgzE4xP3UXnk9vXeexqB8Qi7oxau+YZJ6qJtPB6SJcCPppiIonne/WvBMDIZQoAHmggf4GDwsc+bP/BOfI6/oZmcSRGjbRosUnH0NSgwPkjAYJCMGqSPJadLLH3BcjbudZeaZJdheYmyu+nvXMfEkDhGy46jwk/JI8puBHHLb3Rkm/18KRpyR29gAIb2wcCFz+rPUWfmPs5V/P7xIPoqCVOojjN+NUg6Rr1pl5U7PgwfP7dU7TGNmKF4BJb4Ekq+5fcMDSoXkGxhJKuemsI6H3PPUqJ3vbrK/bj3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NXQ+oi+8otfH5NFb9kNmoeW2761prsi20LjGy9KPidg=;
 b=c4GRvv7UDvM5yD40lnK86/0ZhN7NlLYJP3ofrAclfr8Ri7VKVdu+gBt62QVvqhF4C2ynGtt8WBpYr1rFhnkUr78WgYSHWxAul7r6Y/9hpiezPaSEGDiEnDpn8zFgj+tJtaYuzscq5fZBLfRP6pWY2N8Jq/l9tcFbRfZP35JicqQ=
Received: from DS0PR10MB6271.namprd10.prod.outlook.com (2603:10b6:8:d1::15) by
 PH3PPF262994532.namprd10.prod.outlook.com (2603:10b6:518:1::78f) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Mon, 22 Sep
 2025 13:48:49 +0000
Received: from DS0PR10MB6271.namprd10.prod.outlook.com
 ([fe80::940b:88ca:dd2d:6b0c]) by DS0PR10MB6271.namprd10.prod.outlook.com
 ([fe80::940b:88ca:dd2d:6b0c%7]) with mapi id 15.20.9137.018; Mon, 22 Sep 2025
 13:48:49 +0000
Message-ID: <a24c2629-173c-4357-b643-342ecc21a212@oracle.com>
Date: Mon, 22 Sep 2025 14:48:44 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] WIP doc: Add IP provider documentation
To: eugene.loh@oracle.com, dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
References: <20250918195922.2155-1-eugene.loh@oracle.com>
Content-Language: en-GB
From: Alan Maguire <alan.maguire@oracle.com>
In-Reply-To: <20250918195922.2155-1-eugene.loh@oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0147.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b8::7) To DS0PR10MB6271.namprd10.prod.outlook.com
 (2603:10b6:8:d1::15)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR10MB6271:EE_|PH3PPF262994532:EE_
X-MS-Office365-Filtering-Correlation-Id: c3f1d086-35fa-4a61-e4f2-08ddf9dec1c8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?c3Uya2ZEUng4YWFHK3IrdjgxTjlpbFJlQmFOSW1Fa0F5eS9SMUl2VkxZclor?=
 =?utf-8?B?Q0VDZkhqcGpGMFBXOFdlM1dyQTEyd0FkejdzQkpOMkNzQ0VwWVFKVVpIQWM3?=
 =?utf-8?B?WWhtT3hWaGcvQjVQY2t4TEFlWmRza0NMbGhKMHZZS3RETEwwcXRFdXEzbFhS?=
 =?utf-8?B?VGt5d2szNXVFOXEwSkY4RmtYVFVxVk9JRk5vUW5OSkNTV3dyQ1JHZEMzUDcz?=
 =?utf-8?B?MmJDZlpqdjduQ0xFcm53cWdTQSs0d2lzUkV6RmN0dEZvRE9CMFZrcWE4ZUlM?=
 =?utf-8?B?OE9nRjNwZlorUmNJV2d3OGVLWHRzd1M2WWRHdkNvUkc3eHNFNEg0dDgwWDBm?=
 =?utf-8?B?MU1QMEw2MUdsSWh1L3NGdDNHTEcvbklMc1FzeFVlMzErZStyOUJ0cUc1bUNL?=
 =?utf-8?B?YUlxaG9QQ0JTeU5yQ2ZOUjBkSFZJMHRnY3Z5VTFIOFY0bzlvRHNJRlRPMjBW?=
 =?utf-8?B?Y2FsWjBlRnF1ZVozdEUyVlArMFJjdFd1R28xVUlVemxhdmVpeUFjcFhVWVgv?=
 =?utf-8?B?KzRLTXVjUWNQYzk3bi9MamlmYkJzNktZbmZ4aWJCemFRRGhnWGRFbzFsQjd6?=
 =?utf-8?B?ejgwVCsxaXRJSW96M2dKVzNhdTJZWGpVT240UkpZVjRIM0lLQ0ZKaTlMeFhF?=
 =?utf-8?B?YUxGaytzOGxkNUx2dE54L2F3R3RMUjhsOTcvbzlYQktlMStpTHE2bVNxZGla?=
 =?utf-8?B?Zm5FOUtJMmREMGdhbFl1RHFZbENwLzJLOWd4ODJIN0loNEZFcU5JcmdXd1g3?=
 =?utf-8?B?K1VuUW1tRjlCVWd1eHVoTjAwdDl6S2YraFVHQWdSTkYwTGZCWWRJYjVhRmpj?=
 =?utf-8?B?WHV3NlRUV3V4NExsSUVmbjBneWZ4MkV6VUJQcnkrTGlZUlQ1aVJNay9jeXR6?=
 =?utf-8?B?TUt6c09yVk5YZDlSbnNZVit5RlUwU0J3OXNjR1Q5TUN5dldpcEVaY3g1WVZ6?=
 =?utf-8?B?VkpFUzc2aHM5K3NZYkxPMkJmcjcxUzM1RWI5SHZ3NVlOTWJwMWpGL0lIQ3Uv?=
 =?utf-8?B?MnRRdFZ3TVRXVVE4YmVFRzlnamRyY09OSXIweFBVeVBjVy9qeHlqT3M1U1hj?=
 =?utf-8?B?SXZHNW1GUXRzVFQ3SDloaXdQbktaYmR0ajFvczhhRTlQOVFQdlJrNWR1N1F2?=
 =?utf-8?B?R2NjZ0hYVjExeU05MG95Ym1UeGNycDNQU2UyeWVpL3dHbGorazNXU20wUk13?=
 =?utf-8?B?NkNmMEdyeVYzVFk3eEdVUlNCbkFEVGd4NG1GNkpyU1RYSWxqMmF2OEpnMFpV?=
 =?utf-8?B?YnZ0VXNtb0NNWnFJTE5iUzRQMTRhaUpWVWk1a3F4ZVJJU1JBSWozbXpNZmJO?=
 =?utf-8?B?c01Mdk80cEZ2UWZpQWZHOHZaWm9LdllWVWVjN1V2ZEZGZGZCRWtVSnV0UlhW?=
 =?utf-8?B?YVAzeENMSjVZWWVCZXBrMGJrRHN3eTluMUJ6Y1ZQeHpad1NRcVg5cTkrTjhk?=
 =?utf-8?B?ZHY2SWJURmJvOWZOK0NLVFgvU3RSSC80TXZWTlhwR096VWdocjY1MlhjUjRZ?=
 =?utf-8?B?UUlQanpBR3JuWVZxeWxpSU9BaGVQT2xjdzYvbjZNVzRac1VWUDRaR29UME5J?=
 =?utf-8?B?a2svcDVkbG9IZDFxSUlnZnozTnM0RjEzKzJPeFJpRHdHeVNsUWNiWm5ISXNX?=
 =?utf-8?B?Z09HUnNoTDdtd05WQ3A0TEFRdnE2VGFOWWxxMnNoblk4dHkrTVpUeUhmUUlp?=
 =?utf-8?B?Q1JEbmxVbTNCMDBITHIvN3krQ2VkOCt3UER0WXlGQ28zdDNaZXd4T09BZlFk?=
 =?utf-8?B?aTc2dTRPbkYyQzVjU1JtSWRqa2gwNC9IQUtJOHVoRXJSdWZRZFFQQkZLSnha?=
 =?utf-8?B?S29XR3paOCs1TTNpeE5IQ3lyd1gwMTYzS1NBeFBkNDJ2RHZPaURkYllUajg4?=
 =?utf-8?B?TXVWdnJWbzdkS3dJZU5xVURDNnJLcHQzT21jSTU2N1B4MExWTlI1UmNlRWlM?=
 =?utf-8?Q?g5waVruH7mI=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR10MB6271.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UDMxYnJQSVI5MVRBN1oycFV2QmRLZFBtZW4vOVVTSmVOek1XTk4zMCtiTVRW?=
 =?utf-8?B?QWk3NTRSZFMvUTBsWnNsakk0dTRsZFlwK0gvdi92SHFXejU1Mis4Q25rK0xQ?=
 =?utf-8?B?TUZXWXlTS09HMmZmVzRYY2NJTG5GWFlrMjZnbmJxUFZmajFta0s4UzcreVNz?=
 =?utf-8?B?ZXZmZ3Y2cCtrOFFWVFlMTWhzcUpGeHRHbTh4eUpFZDI2TEdTblhyMjU2VFRY?=
 =?utf-8?B?d1Jjc2FNNHhxdlpseCt5dFc5YmU3YTZOdTNJcmpXMTZJaVBzczhzQTIyejBU?=
 =?utf-8?B?TWVqUnc0SmpPRENDOGVTR1ZONi9oTXRlc1duaWtEY3grZDlwc0diZVB2N3FI?=
 =?utf-8?B?TUsyTG1vbTZ2Qjh0OEpTREdId1Vud2FFKzNNbnBpeFAyandxQ2l2SkNJeCtm?=
 =?utf-8?B?eTZ1a083N2NNVWtqVThlLzRqdU5DR0s5MVNoUmR5dnVhRGl2Qnc1VWdWemIw?=
 =?utf-8?B?MVdsLzZ5YkF1THNLZnhBM0dOemtrZENwN1AzTDR5aitsWC9iaWdSOVJaeE1j?=
 =?utf-8?B?RE9CV2IwblZaV0xZNDNVZlRWcFpabzArS3N0VGswdStoeWNLTmZ3NHRDTno4?=
 =?utf-8?B?MWdTMnFsZmJmWjRxdkJaayttLzUzRUhxYWk5UTVxcDZCSUQzMVM5cm5qNXpZ?=
 =?utf-8?B?QVBET09JVmlyWVorVGZIUXhBVCtmcVAvMStzeEUrNXJYdHN3alRFZ0IzanUv?=
 =?utf-8?B?Rjl5MHVaRXE4Ti9RS0x0OHNjbyt6aEN3SFpyZk5PdW9GblQ3YjdkVmRzNG5Q?=
 =?utf-8?B?dkxwQTl2VzJJeTJVaHlGaWtMWVgyeSsxbHVHaHJ1Q2RjTUFVVXFlbnJ0cjFQ?=
 =?utf-8?B?ait3aEZiNkJKQnN3dTZBU3YrUFdHZXRuTDdMMHU3MkJaaDllVDNKQzNOWG10?=
 =?utf-8?B?dHRyWWRmdExHckVhS0IrQmVMY2FtQ3J4b1lTbDBicmVZdnI3NHFCTm1TN0dR?=
 =?utf-8?B?MFNQV1ZOUEtjU0d2c20yUURLOWNCWjdvcTArNVEwWHhNWVdvdGRsR25Oc2Jj?=
 =?utf-8?B?Vm9nc3dmOExkMVRnckhNQWsrQlJ6OEhhTHY1ODJzcENlT2Rwd1dXOGZyZzB6?=
 =?utf-8?B?cDhweVRPZ2VZVnk0WDVnY0xxSGxDN2RTalJsR2h0ZWs4dUN1UkQ5ZW9lZklp?=
 =?utf-8?B?ZStWczB4MjdxUzFMRnlJQWZYaDI2V256eTVaMzFKYmg3VThYcjRJdFozYVRy?=
 =?utf-8?B?Zjk4MTZoazEvaXFYVlVFMVFTSHZUTFIzYWEzcFFXbjVEdXJxUjNnMjl3ZHZl?=
 =?utf-8?B?R2tJNTNtbkFXMTJDNVRERHlscmgxZ1ZrZGlrSGZ2RW5TV0lMamFTRTRxckR6?=
 =?utf-8?B?bXdGdys5c1JmRnBKWmVreFBRTWdOUXBvZG5GeHVvNU9jWkJaYWNBQmt2UG5u?=
 =?utf-8?B?d3llZGhXSjlPSkZVM0liY3RDMVg1cERWZWI5L3NxWFZTQ0lQdG1ad3hDSmo0?=
 =?utf-8?B?eml0Q0E5SDF2cjI3djF3ODg2bDBpbjJ6a1hIZHR4LzFjWldiRzUxUGk0SjVI?=
 =?utf-8?B?dmNSKytKY013U3pHalM0dDQ3NkhxT1h6RzZMb3VjVWRtcGJybFBYaHpwTFRm?=
 =?utf-8?B?cG0vQThCS0JGT3pudVBydjJzUFhVZlRxN2t5SGluK0FBR0ZuU1UxL1kwTUpK?=
 =?utf-8?B?WUZzcmFsTENhc3JWMzdQUmpHdkltWTcxUlBBZFZnRVhjM3lxb2RzRzlpazgx?=
 =?utf-8?B?T3Jxdy9MTSsvRjVZUTNpRnhsRGI5TjV4cTliQUxOZFRLMnMyVjJmSEF5Lzh1?=
 =?utf-8?B?R28xaEpiVS9ieHllUENOemlUaEN3cmdQZm9qN3haSU1scTlaeGZrVGthVVVq?=
 =?utf-8?B?RmlEeHYyNTg3dWw4MlB3eVVDWkswSktpaHQwRm55R0dBMklXQzA2ajlZblRG?=
 =?utf-8?B?cHRGdktaTVo0R01QNXptWFdwQzVhUVZ2M0Ryb0VCV25vTkV3QW1oYWFVZElx?=
 =?utf-8?B?bytZQkZnQk4wM3BSbHJxOXp3c3h4YUVRc3I4U0UzLzM2VEU5NERDdnNZWFBC?=
 =?utf-8?B?cDlrZVI5azhVTnI2TE0yZHhNNlN1WlRhMG1QRnJOSWlKMlNPeXhqYzJPR1Fz?=
 =?utf-8?B?QjkyVkN5RlZXNE5HeEpxMittNkEzeTJjS1J0bUVqdTZkU2ZGUGtZZDcwRUpU?=
 =?utf-8?B?bGQyZ3NScXFrdTRIMzFTbzBzMVpuY3BucXNoQkdoZzZZbUhEMlFWNlJhR0tk?=
 =?utf-8?B?T1E9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	YqHjsJHoo07Yz21B6Ga2mGR8j+HyoyGsw3L/PkJ0ftpFjK6ZGI26o0F++L7JHMM3XU0yKnIk33wDulLHCTbao6BwL0piKWj4kSr/lKqfdZwJ3c4/qkjFRYlk7ZCZdj8JgRTEVJLdW1le1SGafz56x+HbqalsVB+2JzgwgW1uA/pQUry+3K1yFb03/z+dCUFuSKd0zr7r64ZwvdkRDJ0nYBmiRvMiYKD5GciStQxLj2Hfopu83aeK0ujVpi40wV1U0UdK10NDz+z49nNG/4rcU7jrk7K+ZfTJD23gZgV14Ar6H8e1tpcBTSdNTkQlILbBoP1MHrM3KC2M8yO3QifQZ+7L5sN7BtgoR/zAMSX54/3FNrnhVHYpR135a+Bwmk6Vp2E5UDdMEISq10cLtC6avZCIvRwRcKhMVfOa4SjtO/QYAOvWdq6aDF/HhM1vT2n17FMkD53SIVGjc4hpP0u+1ytd3tnP+HgXad8yeKQ02RzC7psDpimNtbV8TJvlq0kDoUHESqGpL0Hm6cGNGUT8oTJOFJp2LvHb5Q0uH9U22Gh33ON+grfXEdbn3CFwaCD7P+LNwkctgMEL+NPNkplqEbItzWxDIxtNe0u5ebZwDu0=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c3f1d086-35fa-4a61-e4f2-08ddf9dec1c8
X-MS-Exchange-CrossTenant-AuthSource: DS0PR10MB6271.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2025 13:48:48.8493
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: erfnFzdclUPMznB/tobzP9Y9B2pQDqKdfH6s14iWaw4nZQ1Vai0FgGtJ3uIJFSPZSHPH6ITE3VzzafxnUikAdg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF262994532
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-22_01,2025-09-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 phishscore=0 bulkscore=0
 spamscore=0 mlxlogscore=999 mlxscore=0 suspectscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2508110000
 definitions=main-2509220135
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAxNyBTYWx0ZWRfX+7GBQHloDSNS
 Nl4ZevBghMMnF9IbC5h78pyycz/eyWQXRD31S41iDl7TKlb/urCTU3x2Rlw00ewnSOJNeU6rPGf
 6r2ImqfuNDObpbJNkGES8gdfx2APW5dNLA5Ve2vIwTHouTVgGmnlgC8Rwo7Ovvd195rcxooO1bI
 czQziJ/SoRBC9GnWLBaLhFFtKZJoxozBIctegTgx5+cZ9J8q29brxq7sjHNwZGo3v8smLtwTqf6
 vNos8QhE1qjp59z4tC7V/jNCmJLulbXM8MIRm1Br/PgiZkwz34WFMrxP0roqMhvzFCFIL+lAQv4
 FDdoux1fgtcam2krT6Egq6O1kWcwNN/iKM+NAc0vawuEqnin1OU+eA7J5dwvUnetm9jdXpcdNlv
 RebdxAnP
X-Proofpoint-GUID: 0IRNaBcwx7IVUxPP9b8Jox7Pxfpsi5eP
X-Authority-Analysis: v=2.4 cv=E47Npbdl c=1 sm=1 tr=0 ts=68d153cf cx=c_pps
 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=y31dbwRTJzXeLX0ABrsA:9
 a=MABqqF4FgsRPr8lW:21 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: 0IRNaBcwx7IVUxPP9b8Jox7Pxfpsi5eP

On 18/09/2025 20:59, eugene.loh@oracle.com wrote:
> From: Eugene Loh <eugene.loh@oracle.com>
> 
> I'm starting to add some provider documentation to the MD user guide:
> ip, tcp, udp, and rawfbt.  This is my first cut at editing the MD UG
> and I'm pretty unfamiliar with the ip provider (and tcp and udp).
> So if you want to offer preliminary feedback, feel free.  Otherwise,
> I'll do those providers and then go back and look the whole thing over
> more carefully before posting for review.
> 
> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>

looks great! (one comment below about csinfo_t)

Reviewed-by: Alan Maguire <alan.maguire@oracle.com>

> ---
>  doc/userguide/index.md                        |  10 +
>  doc/userguide/reference/dtrace_providers.md   |   2 +
>  .../reference/dtrace_providers_ip.md          | 177 ++++++++++++++++++
>  3 files changed, 189 insertions(+)
>  create mode 100644 doc/userguide/reference/dtrace_providers_ip.md
> 
> diff --git a/doc/userguide/index.md b/doc/userguide/index.md
> index abd1096db..760867eee 100644
> --- a/doc/userguide/index.md
> +++ b/doc/userguide/index.md
> @@ -208,6 +208,16 @@
>              -   [fileinfo\_t](reference/dtrace_providers_io.md#dt_ref_iofile_prov)
>          -   [io Examples](reference/dtrace_providers_io.md#dt_ref_ioexamples_prov)
>          -   [io Stability](reference/dtrace_providers_io.md#dt_ref_iostab_prov)
> +    -   [IP Provider](reference/dtrace_providers_ip.md#dt_ref_ip_prov)
> +        -   [ip Probes](reference/dtrace_providers_ip.md#dt_ref_ipprobes_prov)
> +        -   [ip Probe Arguments](reference/dtrace_providers_ip.md#dt_ref_ipargs_prov)
> +            -   [pktinfo\_t](reference/dtrace_providers_ip.md#dt_ref_ippkt_prov)
> +            -   [csinfo\_t](reference/dtrace_providers_ip.md#dt_ref_ipcs_prov)
> +            -   [ipinfo\_t](reference/dtrace_providers_ip.md#dt_ref_ipip_prov)
> +            -   [ifinfo\_t](reference/dtrace_providers_ip.md#dt_ref_ipif_prov)
> +            -   [ipv4info\_t](reference/dtrace_providers_ip.md#dt_ref_ipipv4_prov)
> +            -   [ipv6info\_t](reference/dtrace_providers_ip.md#dt_ref_ipipv6_prov)
> +        -   [ip Stability](reference/dtrace_providers_ip.md#dt_ref_ipstab_prov)
>      -   [Lockstat Provider](reference/dtrace_providers_lockstat.md#dt_ref_lockstat_prov)
>          -   [lockstat Probes](reference/dtrace_providers_lockstat.md#dt_ref_lockstatprobes_prov)
>          -   [lockstat Probe Arguments](reference/dtrace_providers_lockstat.md#dt_ref_lockstatargs_prov)
> diff --git a/doc/userguide/reference/dtrace_providers.md b/doc/userguide/reference/dtrace_providers.md
> index 6fd0fec6e..f8e8026db 100644
> --- a/doc/userguide/reference/dtrace_providers.md
> +++ b/doc/userguide/reference/dtrace_providers.md
> @@ -11,6 +11,8 @@ The `dtrace` provider includes several probes that are specific to DTrace itself
>  The `fbt` \(Function Boundary Tracing\) provider includes probes that are associated with the entry to and return from most functions in the Linux kernel. Therefore, there could be tens of thousands of `fbt` probes.
>  -   **[IO Provider](../reference/dtrace_providers_io.md#)**
>   The `io` provider makes available probes that relate to data input and output.
> +-   **[IP Provider](../reference/dtrace_providers_ip.md#)**
> +The `ip` provider provides probes that can be used to study IP traffic.
>  -   **[Lockstat Provider](../reference/dtrace_providers_lockstat.md#)**
>  The `lockstat` provider provides probes that can be used to study lock usage and contention.
>  -   **[Pid Provider](../reference/dtrace_providers_pid.md#)**
> diff --git a/doc/userguide/reference/dtrace_providers_ip.md b/doc/userguide/reference/dtrace_providers_ip.md
> new file mode 100644
> index 000000000..67acd52cd
> --- /dev/null
> +++ b/doc/userguide/reference/dtrace_providers_ip.md
> @@ -0,0 +1,177 @@
> +
> +# IP Provider {#dt_ref_ip_prov}
> +
> +The `ip` provider makes available a probe at IP send operations in the system and a probe at receive.
> +
> +**Parent topic:**[DTrace Provider Reference](../reference/dtrace_providers.md)
> +
> +## ip Probes {#dt_ref_ipprobes_prov}
> +
> +`ip` provides a probe for IP sends and one for IP receives.
> +The module name is always `vmlinux` and the function name is empty.
> +
> +## ip Probe Arguments {#dt_ref_ipargs_prov}
> +
> +The following table lists the argument types for both the `send` and `receive` probes.
> +
> +|`args[0]`|`pktinfo_t *`|
> +|`args[1]`|`csinfo_t *`|
> +|`args[2]`|`ipinfo_t *`|
> +|`args[3]`|`ifinfo_t *`|
> +|`args[4]`|`ipv4info_t *`|
> +|`args[5]`|`ipv6sinfo_t *`|
> +
> +### pktinfo\_t {#dt_ref_ippkt_prov}
> +
> +The `pktinfo_t` structure is an abstraction that describes a packet.
> +Detailed information about this data structure can be found in
> +`/usr/lib64/dtrace/*version*/ip.d` or
> +`/usr/lib64/dtrace/*version*/net.d`, depending on `dtrace` version.
> +The definition of `pktinfo_t` is as follows:
> +
> +```nocopybutton
> +typedef struct pktinfo {
> +        uintptr_t pkt_addr;
> +} pktinfo_t;
> +```
> +
> +**Note:**
> +
> +DTrace translates the members of `pktinfo_t` from the `struct sk_buff *`.
> +
> +### csinfo\_t {#dt_ref_ipcs_prov}
> +
> +The `csinfo_t` structure is an abstraction that describes connection state.
> +Detailed information about this data structure can be found in
> +`/usr/lib64/dtrace/*version*/ip.d` or
> +`/usr/lib64/dtrace/*version*/net.d`, depending on `dtrace` version.
> +The definition of `csinfo_t` is as follows:
> +
> +```nocopybutton
> +typedef struct csinfo {
> +	uintptr_t	cs_addr;
> +	uint64_t	cs_cid;                    IS THIS SET?

IIRC on Solaris it was basically just the pointer to the socket, which
isn't really a great idea as a unique identifier as the socket pointers
get recycled via slab allocation. We don't seem to have the field in the
Linux csinfo judging by the content of ip.d.



> +} csinfo_t;
> +```
> +
> +**Note:**
> +
> +DTrace translates the members of `csinfo_t` from the `struct sock *`.
> +
> +### ipinfo\_t {#dt_ref_ipip_prov}
> +
> +The `ipinfo_t` structure contains common IP info for both IPv4 and IPv6.
> +Detailed information about this data structure can be found in `/usr/lib64/dtrace/*version*/ip.d`.
> +The definition of `ipinfo_t` is as follows:
> +
> +```nocopybutton
> +typedef struct ipinfo {
> +        uint8_t ip_ver;         /* IP version (4, 6) */
> +        uint32_t ip_plength;    /* payload length */
> +        string ip_saddr;        /* source address */
> +        string ip_daddr;        /* destination address */
> +} ipinfo_t;
> +```
> +
> +**Note:**
> +
> +DTrace translates the members of `ipinfo_t` from, variously,
> +`struct iphdr *`, `struct ipv6hdr *`, or `void_ip_t *`.
> +
> +### ifinfo\_t {#dt_ref_ipif_prov}
> +
> +The `ifinfo_t` structure contains network interface info.
> +Detailed information about this data structure can be found in `/usr/lib64/dtrace/*version*/ip.d`.
> +The definition of `ifinfo_t` is as follows:
> +
> +```nocopybutton
> +typedef struct ifinfo {
> +	string if_name;			/* interface name */
> +	int8_t if_local;		/* is delivered locally */
> +	netstackid_t if_ipstack;	/* netns pointer on Linux */
> +	uintptr_t if_addr;		/* pointer to raw struct net_device */
> +} ifinfo_t;
> +```
> +
> +**Note:**
> +
> +DTrace translates the members of `ifinfo_t` from a `struct net_device *`.
> +
> +### ipv4info\_t {#dt_ref_ipipv4_prov}
> +
> +The `ipv4info_t` structure is translated version of the IPv4 header
> +(with raw pointer).
> +These values are NULL if the packet is not IPv4.
> +Detailed information about this data structure can be found in `/usr/lib64/dtrace/*version*/ip.d`.
> +The definition of `ipv4info_t` is as follows:
> +
> +```nocopybutton
> +typedef struct ipv4info {
> +        uint8_t ipv4_ver;               /* IP version (4) */
> +        uint8_t ipv4_ihl;               /* header length, bytes */
> +        uint8_t ipv4_tos;               /* type of service field */
> +        uint16_t ipv4_length;           /* length (header + payload) */
> +        uint16_t ipv4_ident;            /* identification */
> +        uint8_t ipv4_flags;             /* IP flags */
> +        uint16_t ipv4_offset;           /* fragment offset */
> +        uint8_t ipv4_ttl;               /* time to live */
> +        uint8_t ipv4_protocol;          /* next level protocol */
> +        string ipv4_protostr;           /* next level protocol, as string */
> +        uint16_t ipv4_checksum;         /* header checksum */
> +        ipaddr_t ipv4_src;              /* source address */
> +        ipaddr_t ipv4_dst;              /* destination address */
> +        string ipv4_saddr;              /* source address, string */
> +        string ipv4_daddr;              /* destination address, string */
> +        struct iphdr *ipv4_hdr;         /* pointer to raw header */
> +} ipv4info_t;
> +```
> +
> +**Note:**
> +
> +DTrace translates the members of `ipv4info_t` from a `struct iphdr *`.
> +
> +### ipv6info\_t {#dt_ref_ipipv6_prov}
> +
> +The `ipv6info_t` structure is translated version of the IPv6 header
> +(with raw pointer).
> +These values are NULL if the packet is not IPv6.
> +Detailed information about this data structure can be found in `/usr/lib64/dtrace/*version*/ip.d`.
> +The definition of `ipv6info_t` is as follows:
> +
> +```nocopybutton
> +typedef struct ipv6info {
> +        uint8_t ipv6_ver;               /* IP version (6) */
> +        uint8_t ipv6_tclass;            /* traffic class */
> +        uint32_t ipv6_flow;             /* flow label */
> +        uint16_t ipv6_plen;             /* payload length */
> +        uint8_t ipv6_nexthdr;           /* next header protocol */
> +        string ipv6_nextstr;            /* next header protocol, as string */
> +        uint8_t ipv6_hlim;              /* hop limit */
> +        in6_addr_t *ipv6_src;           /* source address */
> +        in6_addr_t *ipv6_dst;           /* destination address */
> +        string ipv6_saddr;              /* source address, string */
> +        string ipv6_daddr;              /* destination address, string */
> +        struct ipv6hdr *ipv6_hdr;       /* pointer to raw header */
> +} ipv6info_t;
> +```
> +
> +**Note:**
> +
> +DTrace translates the members of `ipv6info_t` from a `struct ipv6hdr *`.
> +
> +## ip Stability {#dt_ref_ipstab_prov}
> +
> +The `ip` provider uses DTrace's stability mechanism to describe its stabilities. These stability values are listed in the following table.
> +
> +<table>
> +  <thead>
> +    <tr><th>Element  </th><th>Name Stability</th><th>Data Stability</th><th>Dependency Class</th></tr>
> +  </thead>
> +  <tbody>
> +    <tr><td>Provider </td><td>Evolving      </td><td>Evolving      </td><td>ISA             </td></tr>
> +    <tr><td>Module   </td><td>Private       </td><td>Private       </td><td>Unknown         </td></tr>
> +    <tr><td>Function </td><td>Private       </td><td>Private       </td><td>Unknown         </td></tr>
> +    <tr><td>Name     </td><td>Evolving      </td><td>Evolving      </td><td>ISA             </td></tr>
> +    <tr><td>Arguments</td><td>Evolving      </td><td>Evolving      </td><td>ISA             </td></tr>
> +  <tbody>
> +</table>

