Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68FB91AF0B5
	for <dtrace@lists.linux.dev>; Thu, 30 Jan 2025 11:03:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738235026; cv=fail; b=Klur+Mmb+Qv0jIkeqZKcAqlEjKsBXMOHP8/eLqplzIcXyRSJRbvc1GDfRTimM5xWJmTr4rVoZlwVhG47ATI3PU2Ee2EH/L7NYmpvC4+QQAIasLvb/Womu2hlsLMrwQ2xB3amm+VDNpbAVMTAGUAUcij+Z+4w7ABjDbno9xyvjnQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738235026; c=relaxed/simple;
	bh=piV/tmrsI63hkr2OllnqCkaMZ3zYGuDYNNFc6PTwweo=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=IoNoZeAc1hKEeUshDmHiJYV+4PEVmtVANirR7SnAWEoTXnhtadh00bF1/+pGRIfw/ggOsK898/bigdxo3jK+lL3lAUWpaBkRodOPKLgxBnYGXY5bUr4vw66PxkUPJJQZpJhs0+0bhgFE1Gp6lTT2pwOPoh1AN/DvdFloyW6lm74=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=b14pdf0b; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=UFVDC0PF; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="b14pdf0b";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="UFVDC0PF"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50UAloSI002748
	for <dtrace@lists.linux.dev>; Thu, 30 Jan 2025 11:03:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=czBhzKC67KCfslbtK6fJglba9wZ9yklxqJ2sb8dqorw=; b=
	b14pdf0b3V2eUZFjthsNJ8aEQC96iLmFoPJJAaS3xDCUeZseGOsJURpqBwb700nc
	+2uysOCL65ZfnNoq9IdY00nyQbLOfC7QpbGkmCQLzeIY3qRvQZYSpl4wg3kTdGAr
	cgmcoMSXLwbg2hBLTbqN2kCIIP95+ln6iVfsfNTdTu4dC9GCRb1jCfuFH6IAxbZk
	HXeuRZrJmHGL5nfxUAF5TDPW668IRGSlpo29tKuIKyo0ODb5sz7kmxKHu4ILZ86S
	9NYEVGc43emRZBCM3m4JPySunbARHglyiMj7a0A6qBOQ688dnKb4AZiiS7QcfOmj
	Ol+QuARU90V8kdMQjcrRMQ==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 44g7yh80tc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 30 Jan 2025 11:03:41 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 50U8hpok034289
	for <dtrace@lists.linux.dev>; Thu, 30 Jan 2025 11:03:41 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2049.outbound.protection.outlook.com [104.47.55.49])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 44cpdax50c-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 30 Jan 2025 11:03:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w2pChT6DsJOksd7G7UJJNgMhG0mOw7bX7moN87udf239gmi+Mc5N796r5CLlBcAzs4tK+DgRQb6qQJFWn7w0TkZPDFqAAhqSaKaiotFdJuimbNoYhWVhLoniAhAoBRDnMjhdktzLcgyPKKnofiXXZR6Zhbc8p8AgU+Ama5QsvZoDlxqt8DByMl4p7DtGj/fFw51n40QIjBD9/x3UII7+JxXRxBSimwUYzPTPi4XzIrvhejpvucEwrL0GdDiLPWe00BFpfUuqJr5bWAvxdSyD/sXWNk3nFdH7HP9BxquKoRkk3PaUmRCaBNCFWiXEhHi7Cb/+pARGYuw/9lQ+RQ2jpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=czBhzKC67KCfslbtK6fJglba9wZ9yklxqJ2sb8dqorw=;
 b=PMVQGVykP/vCiBfXAFllrjeDnwTRp9tMWsd5mHS96BkmsXCBvujv9njjEFq632cur/P+dS9u/ewnKRLdMQRFMDto/9j/HWqRf0GLo308pGPwXJq8EuV0rLkXJ+ykXT5IbOrxOgOitMQiHbFted0P1NnLXVsBRLAMp1ZNb8/op50tWk0taApZzEEWs+5/ExkA/H5hci9vQyH90F1bv2T0XdJBvjcJUnZyuFtis/InLgLDUOHJ9lcFzfIJkp0fZbMTuT+K1cQlXbdfm7cFefsSCBfB1Wtsr8R39R9Y33FlvKrFeGganUgGDaubY9Vpavjv+aEAPE4Hov65uGUZoYGykg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=czBhzKC67KCfslbtK6fJglba9wZ9yklxqJ2sb8dqorw=;
 b=UFVDC0PFlT11pOkwETR1QAFU53u1UfqwGSvSty+oq7SJrVaVPUDocftZkPBXJtucIiUw3pDGEHrjBnqgIJn3l4d2oGmUpjuCCMeaWQxMAoYcLOPzjnVMBWFNw8gdeuIy3VqB2cZy89/aSsJqlaYX6MpXzdhoJVf9/N91UtaBnjc=
Received: from BLAPR10MB5267.namprd10.prod.outlook.com (2603:10b6:208:30e::22)
 by CY8PR10MB6827.namprd10.prod.outlook.com (2603:10b6:930:9e::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.18; Thu, 30 Jan
 2025 11:03:38 +0000
Received: from BLAPR10MB5267.namprd10.prod.outlook.com
 ([fe80::682b:c879:9f97:a34f]) by BLAPR10MB5267.namprd10.prod.outlook.com
 ([fe80::682b:c879:9f97:a34f%4]) with mapi id 15.20.8398.018; Thu, 30 Jan 2025
 11:03:38 +0000
Message-ID: <2187872c-744b-4b1b-bee9-f504ef6376b6@oracle.com>
Date: Thu, 30 Jan 2025 11:03:29 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/6] procfs: implement d_execargs() for pr_psargs
 translator support
To: Kris Van Hees <kris.van.hees@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
References: <PH8PR10MB6337029F91AD9127B9013409C2EE2@PH8PR10MB6337.namprd10.prod.outlook.com>
Content-Language: en-GB
From: Alan Maguire <alan.maguire@oracle.com>
In-Reply-To: <PH8PR10MB6337029F91AD9127B9013409C2EE2@PH8PR10MB6337.namprd10.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR01CA0154.apcprd01.prod.exchangelabs.com
 (2603:1096:4:8f::34) To BLAPR10MB5267.namprd10.prod.outlook.com
 (2603:10b6:208:30e::22)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BLAPR10MB5267:EE_|CY8PR10MB6827:EE_
X-MS-Office365-Filtering-Correlation-Id: 74764229-40a0-429c-9f17-08dd411dbf60
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|10070799003|366016|376014|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?REY5d21nWlk2VFRUcTJwcHFyQzFKWjlqWS9pYnRpbmlHRzJ3Z2tzZ0s5WnpQ?=
 =?utf-8?B?eEo1Mm9PUnR1Q0t1dndHVlhhbVdiTlRia21sK014dkphUHFKVXBLa0g5RFZp?=
 =?utf-8?B?M29JQ2ltbm51WWdXZkUvcFNCcDBHOG0xZm5xRzlrcCsvMkRkakkvYlprUHFi?=
 =?utf-8?B?S3NMMW0rQWxHb1dXTy9ib04xc3ZpWHJhcCtJVmlFODRFV0VMY2ZBeWZVWUtO?=
 =?utf-8?B?bTB1YU5rRnUvWTNJSlNMK25YS0hXTTBLNURjNGxpWEFjR0M5Q1BHN2c0U1FM?=
 =?utf-8?B?RzN5YW9NY3djRHBaY3dpS0xsanlERktNWnRTTlo0Z1FKWnZ3ZHM0T0w0YXEy?=
 =?utf-8?B?V2hPMk5kamxIVU9OR0haeFQ0RHpBWnFXbW93cE9QSHNObkFuclFuK3IxcUZC?=
 =?utf-8?B?TUtqTFpWNVBZRlBPdkZsOUxPRjJveHIrMFFjSENFRFdKTlVwT20xSHhWTmtz?=
 =?utf-8?B?Qkx0bEIzTjF2R2kzYVJqNUZyenRsc21PdU8rbDlBVURzN0RuTmFUR3pRR3Uw?=
 =?utf-8?B?ZE9mL3Y4ZXZGYjNncGJpMU1wWjNMd2swSjhWbmk1S04yK2w1c3cvaVJxZkxG?=
 =?utf-8?B?Rnl3L3hvWjlUcVY4T3RBZkhQaDZwMFJaQXhCWUd3TDlNdEdpRzBhOFZEN3Aw?=
 =?utf-8?B?WUcrNElQSlRoYUlmZDdyL0s0MSs2RW1pTXJJMkFiblZOaE5pZzlqRm5kdDF1?=
 =?utf-8?B?L1NuS0wzNGlGeGs1Ym9rSXRwVlJ5WFVIeEZGd20yT2tFd0Z5N2FVaTNUdGZW?=
 =?utf-8?B?VDIvTjcrditZZzZtc0poSDlFUDZxVExjU3BPZEVDS0tMa29xQlRNZ1lTNjU1?=
 =?utf-8?B?cW1rbDkwT2RXZHZxNURBNEdzVkhqM05SS3E5ckFxZFJSczlIQlJvUzcxRW1T?=
 =?utf-8?B?UXlkWUdvVG9lZ3hSaWF3Vk1pd2NFY1ptR0pQWjZlTFg1MXBEbFJRdHN5N1ZC?=
 =?utf-8?B?RjRkQ0FUa2NYbFZBQkJtZEUxNTdHZk1rNzZSMnVDY1Nvd3BKNjh1b0QvSDFR?=
 =?utf-8?B?NitxYngxREd5bFp4aS9sM0FwT2haMWVJOU5xNThDOC9tYWFBMkVPZE1TUlQ0?=
 =?utf-8?B?TnVEWXZ4WEZlMjYyTlg1VUxJMzlqdmZkOUJvQmYzS1dWUi9wZWtIMWpVUnRC?=
 =?utf-8?B?SkZ2Y2Y5UlpWVm9vM3VKUmlqeU14bEtkcEpXNUpyci90K2p5NU43MXU4MXdy?=
 =?utf-8?B?ZDJTRDMwNG5LWHBFRUlybkdQL2FpaDhISjlRYlY5QXNleDdYdWhhVnN1b01R?=
 =?utf-8?B?bU94cjh2ZTYvcmVmSkJXRmhZR3hyT1V2Zmw5aEtORGI0czBwVnVpMXdZYjFG?=
 =?utf-8?B?TDdkbitLV0dkektJZjkwekNYRjhpNjEwOFV0M0g3RllMaG5UZEhhd09tb3VG?=
 =?utf-8?B?U2l6U3hxV1Z3NDJMZGh3Y0RDdEtwemFJblB3QnRRdnJaTXBkZ1NTdExsZERG?=
 =?utf-8?B?c05rdi91MDJvM3ZudG5ITGhjYVBGY1htNFE5ZnZRRVZ0T01EYUttdXg4bkFW?=
 =?utf-8?B?UnlzbWhNM2xSMGthbWZiTXpJTktINVkyaWRBbE0yNjg3RHdRSnV3MWMrT3p3?=
 =?utf-8?B?TGwySHROWTM1UllRUEt2cFlQSDNLMXJUQ25BOCtkbGlpK0VUWHFFUmlXMWIw?=
 =?utf-8?B?ZmZldkVpV0RpUVlhSDU5TUVrVmhsbERSNlV1bUV3aGY2NTk0NjlSWDNweUVD?=
 =?utf-8?B?MmVzZWkzdEh3SkpBT096WEFQNDZXZDN2Y0hmcFc4QjI3OURtMlV1V3JGcUxQ?=
 =?utf-8?B?YjZyOTJvZEYxbkEreEdOQ2tIc1FaV3NnWEtxazZFenBGTjBmNmtteUJObklM?=
 =?utf-8?B?RUs0UGxQRVhXRm4zU0dCZz09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BLAPR10MB5267.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(10070799003)(366016)(376014)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RkkwVnNhcE9mMGNzMHllNnMwRDJHZXJGOEd3dDZlc2M1bVJFV2U1WDhpZEt5?=
 =?utf-8?B?VVhySUNBT1Bpb0pOMnRnbTIzVDJPWlpjdWlONU9udDRnYkFaaUl5Wm1aTUVU?=
 =?utf-8?B?eVZ2T0trbi9QcGtIakVSWWY3eitLWVY1NFhrM1hQNEx2d2I1TEU2bXVUVWZN?=
 =?utf-8?B?MmFDOWJ1VDZTS3ptZWliUDdnRjVLYmxJNjZDVWxZMEhkY1ZBM0VrZWlwRThm?=
 =?utf-8?B?ejE2NVFJTVluUG1WMmRuajg2em91QWVESVNEdUJ6eTI3QWlkSjlXQXpxT0RS?=
 =?utf-8?B?NWh3QmtBQVZMcFprOS9KcUV0Vk1FV0dqQlQ3dHdrUXJOVU1RQm5XR2lEbTlo?=
 =?utf-8?B?cEdqVmUycENVRmNSNG5WRlN3azkrUWh5ZDNEVmxiTEQ0bXlrbVNONy94enJt?=
 =?utf-8?B?MUFEMTFjREltQXk1L0J5YmpwT1dmQ1FEbjRCc2ZRQUVOU1ZiemdreWhtL2g2?=
 =?utf-8?B?bHZJbVpsa241U1dzdFZkcnF3Znl2Y0lMNEtuNEJJQ2taQURkejZRK293d01M?=
 =?utf-8?B?MHZIYXB0YXJvdjRUelQzeVhEU2c3QnB4ZjNBbmlVN2hjQ3N4UC9seUF2WnVY?=
 =?utf-8?B?V3VaaGpnemZ1WkVBMW1zSjY5MldpRGJaSnFHYkhqZWc0V1VNbXY5MnA3WVVF?=
 =?utf-8?B?UkpqQlo1dnhIaGtYb25UYk5nVnNtaGhlZVQ1L2h3cHRVVUpiYTh2NHJSQ1hO?=
 =?utf-8?B?VUF4SjA2WDE5em8yMnVLV0ZhTXY1T1FCQUwwNnN0RUd4bEhsVWF4RWdqbzNj?=
 =?utf-8?B?Ni92S1Zkand3cS9NY0l0S2UzNzcvdmRZdFNuaU1vQ01MallubjFiUUFIOW9L?=
 =?utf-8?B?dU9ROWo3dkhmV0ZUTG1aeElUeTNFZFlEenNzOUlGLytvRnZiaVlpN0NYVzZ4?=
 =?utf-8?B?ZmhvWFd6OCsyQW1SMHcxNndEdlB6VVY0YVNSaWtvNHNVeWhTbWhmek9oYldw?=
 =?utf-8?B?NWR5TjNZMENnR3Z6MmdTQ2RHSHFEbkg1VnpZcXZBWHBoTjk5aVZDWHV4RThM?=
 =?utf-8?B?ZFBzc0pKcmtjczN6aEMwZGYxL2o3Z3pkWGJsZ0Z6Zm1nbUs0c0o3TThqczc0?=
 =?utf-8?B?cTZBQUh3RGZuc3N6U2R0dUxjNkZ2aTdqVmVpNTI0MWVHM0JEemFSeU9VcEVI?=
 =?utf-8?B?cVFBeG1OWHlIUEQzUHUwVHFmdy9RYUlRNTNCQzhYeFdoMFlpMzgyNXZ5ekcw?=
 =?utf-8?B?dkdQakJwSlFyYlpLeXlzVW9rT0ZVajlnTlU0eThXZTNMdHExODNTendUMzF4?=
 =?utf-8?B?MEl4cU5tMi9wbzNIR2RoV3E5YUNiVU1GTUxuZHRtYXFZQ1JNM0ViVnF4cUY3?=
 =?utf-8?B?NVpNK3ZUT3RMMGxJNnBld3dMUVUvS2xqMm0ybjAwck1PY0F1WW1IZ2I4WUtr?=
 =?utf-8?B?V0ZONmdka043RDVhaVlkMVc5TWplK0NLdWdUZWI0UW50WXpYRTZJTWk2U2s0?=
 =?utf-8?B?RXVMendoLysvYUYrN2hMZUF3WGVTQmFnNm5WaCtrbDBHR1VLdGxJR05adGFI?=
 =?utf-8?B?ZmptcHh3RnJEUDhPQ3RXeUt3bENTNTVJVzlaOS9xdTJZTmpiLzJIcW1iNWVY?=
 =?utf-8?B?YW5vaStPWTlhYTl6b2YyOW9jdmR5WUZWUGkzSldVVUlwTEkzUlJmdEN1cXRM?=
 =?utf-8?B?WHZVWHB5QTUwTzNDWUN4TGtENlFzcWYwUkxMd3pNdk1uVjdSKzhRbmh2TEpM?=
 =?utf-8?B?RVVCR2NOTFkzUHI3dXBnMkVDMmQ3ckpEVDg2b0d3Y1l1dURpdlJIckhtZG5s?=
 =?utf-8?B?VzFQNDBPekZJaktOQTczZ0pzNWNkODh5M0k1UDRYNkQzRW1yK3V0ZUNKU2VC?=
 =?utf-8?B?S1RxbnJ1QkowMDUrL04wRjBSZG1QSUVsRC9wekJDaUZKYUNrQld5Mi9IQjcx?=
 =?utf-8?B?L0FDcHNEeVRwbHN1aFhnN0VoYnZ0cDh2UlN2aERDTFdVTDIyQ3o0NmM1NDQr?=
 =?utf-8?B?RUpYSHJ2MFdETiszd3JRMmsyR0Era2ZlaUR1YytnZGcyeTZtVUEzekIyOFdN?=
 =?utf-8?B?Nm10YkI3Vnl3VGxMVitrWkFqWjdFbEx3RmxDMVBCb3ZUbWRBaEdRcjN1cWZN?=
 =?utf-8?B?anY5Vm0zUVo5YkM2cDE1Q0ZjN0k0NXdyVGtJWTdMTXcwb24xa1NuN2VOQmxW?=
 =?utf-8?B?WE1yNXJZbFFldUlFT044Q2Q2V1hPcHhqLzJPVnIvcUlRNVFsRVpkVWJ4bVpq?=
 =?utf-8?Q?o+1kHpc/tTbz6csS7RLF0DQ=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	NPrqeE9hsUBZuqpLav/RDKzlqbDauVYCXX+GgYFHYCRly7rjEjzRx3QG6Y4v/+zABuGwPl2U0ctNwe+vMy0AseiOfuSyPd0MN4lhJoyuRbd+yCEPuUWLj1jy2CLcInlrC5DYGSmRWSvseitSm6XulEsSZIXBdQuJGAiAdLuUK1nhEgunV+cPoCmXxbo8IG4iv/uyp2VzJtWRGmR8AZF5y/pZsSGWqg9n/WvifoEiQYbUhZMVPDqzNCKS7folTTVzYeRvLnnXXoKojy0I6tU3MO7tPwlAlWGHGgycYaM3Sf80Vj9K/6VNGqEg5UPj0kEcozgh6ZX9qr53+asywKoC0cE15JjdBBFi5uMo9bzzbLIX4nV2EsX3hVrXkzdo2+CjVPGOV9sxSr5sGf4zcDG57ihOsTVx8h/6Q+d9Zam3gdWZhwGM6nf12WQm6zYAejSqQY2I60/6edytz5zxV1qDSf14bujGIcH3BWjpyrvJoiMLC3jPHymRyVRgGIy9460ue5bxqsKgrgkqfoPg7e+eW/MdpH+KeN+SPWxzJvpiU8Gxz2QJpwrC/YRw4rpWpxrQKsUzB7noYFj9/OZoo99WlTUmcx/eARa4NIpEcYA+Oo0=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 74764229-40a0-429c-9f17-08dd411dbf60
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB5267.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2025 11:03:38.0705
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xkBWKQsYqturgYBjr2mSIMCgxlw4QEkXiCJ2L3BK/J15GWnPKVRljEqS98X0Oje02XqdWpipufDqC57npkLiVA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR10MB6827
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-30_06,2025-01-30_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 bulkscore=0 malwarescore=0
 mlxlogscore=999 suspectscore=0 spamscore=0 mlxscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2411120000
 definitions=main-2501300085
X-Proofpoint-GUID: Xl8T2jH4aLwrwQ5poIlgTY1JtVT9nK8K
X-Proofpoint-ORIG-GUID: Xl8T2jH4aLwrwQ5poIlgTY1JtVT9nK8K

On 29/01/2025 07:00, Kris Van Hees wrote:
> Implement d_execargs() to provide task argument string (pr_psargs)
> for the psinfo translator.  It takes a task (struct task_struct) as
> argument and returns a string.
> 
> psinfo->pr_psargs now simply calls d_execargs(T).
> 

thanks for doing this! I was wondering; would there be a case for
generalizing the d_execargs() to also capture environment variables
(which can be retrieved from the task struct mm struct in a similar
null-separated var=value list)?

In other words, we pass in the start/end pointers (arg_start, arg_end
for task args, env_start, env_end for env var=value strings). Then the
function would be a more generic, taking a set of strings between these
two start/end addresses and putting them into a single, space-seperated
string (d_coalesce_strings() or something might make sense as a name).

> Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
> ---
>  bpf/Build                                     |  1 +
>  bpf/d_execargs.S                              | 91 +++++++++++++++++++
>  dlibs/aarch64/5.11/procfs.d                   |  4 +-
>  dlibs/aarch64/5.12/procfs.d                   |  4 +-
>  dlibs/aarch64/5.14/procfs.d                   |  4 +-
>  dlibs/aarch64/5.16/procfs.d                   |  4 +-
>  dlibs/aarch64/5.2/procfs.d                    |  4 +-
>  dlibs/aarch64/5.6/procfs.d                    |  4 +-
>  dlibs/aarch64/6.1/procfs.d                    |  4 +-
>  dlibs/aarch64/6.10/procfs.d                   |  4 +-
>  dlibs/x86_64/5.11/procfs.d                    |  4 +-
>  dlibs/x86_64/5.12/procfs.d                    |  4 +-
>  dlibs/x86_64/5.14/procfs.d                    |  4 +-
>  dlibs/x86_64/5.16/procfs.d                    |  4 +-
>  dlibs/x86_64/5.2/procfs.d                     |  4 +-
>  dlibs/x86_64/5.6/procfs.d                     |  4 +-
>  dlibs/x86_64/6.1/procfs.d                     |  4 +-
>  dlibs/x86_64/6.10/procfs.d                    |  4 +-
>  include/dtrace/dif_defines.h                  |  7 +-
>  libdtrace/dt_bpf.h                            | 21 +++--
>  libdtrace/dt_cc.c                             | 33 ++++++-
>  libdtrace/dt_cg.c                             |  9 +-
>  libdtrace/dt_dlibs.c                          |  3 +
>  libdtrace/dt_open.c                           |  2 +
>  libdtrace/procfs.d.in                         |  4 +-
>  .../d_execargs/err.D_PROTO_ARG.scalar_arg.d   | 16 ++++
>  .../d_execargs/err.D_PROTO_ARG.scalar_arg.r   |  4 +
>  .../d_execargs/err.D_PROTO_ARG.string_arg.d   | 16 ++++
>  .../d_execargs/err.D_PROTO_ARG.string_arg.r   |  4 +
>  .../d_execargs/err.D_PROTO_ARG.wrong_ptr.d    | 16 ++++
>  .../d_execargs/err.D_PROTO_ARG.wrong_ptr.r    |  4 +
>  .../d_execargs/err.D_PROTO_LEN.missing_arg.d  | 16 ++++
>  .../d_execargs/err.D_PROTO_LEN.missing_arg.r  |  2 +
>  .../err.D_PROTO_LEN.too_many_args.d           | 16 ++++
>  .../err.D_PROTO_LEN.too_many_args.r           |  2 +
>  .../funcs/d_execargs/tst.d_execargs.d         | 31 +++++++
>  .../funcs/d_execargs/tst.d_execargs.r         |  2 +
>  test/unittest/proc/tst.pr_psargs.d            | 31 +++++++
>  test/unittest/proc/tst.pr_psargs.r            |  9 ++
>  39 files changed, 339 insertions(+), 65 deletions(-)
>  create mode 100644 bpf/d_execargs.S
>  create mode 100644 test/unittest/funcs/d_execargs/err.D_PROTO_ARG.scalar_arg.d
>  create mode 100644 test/unittest/funcs/d_execargs/err.D_PROTO_ARG.scalar_arg.r
>  create mode 100644 test/unittest/funcs/d_execargs/err.D_PROTO_ARG.string_arg.d
>  create mode 100644 test/unittest/funcs/d_execargs/err.D_PROTO_ARG.string_arg.r
>  create mode 100644 test/unittest/funcs/d_execargs/err.D_PROTO_ARG.wrong_ptr.d
>  create mode 100644 test/unittest/funcs/d_execargs/err.D_PROTO_ARG.wrong_ptr.r
>  create mode 100644 test/unittest/funcs/d_execargs/err.D_PROTO_LEN.missing_arg.d
>  create mode 100644 test/unittest/funcs/d_execargs/err.D_PROTO_LEN.missing_arg.r
>  create mode 100644 test/unittest/funcs/d_execargs/err.D_PROTO_LEN.too_many_args.d
>  create mode 100644 test/unittest/funcs/d_execargs/err.D_PROTO_LEN.too_many_args.r
>  create mode 100644 test/unittest/funcs/d_execargs/tst.d_execargs.d
>  create mode 100644 test/unittest/funcs/d_execargs/tst.d_execargs.r
>  create mode 100644 test/unittest/proc/tst.pr_psargs.d
>  create mode 100644 test/unittest/proc/tst.pr_psargs.r
> 
> diff --git a/bpf/Build b/bpf/Build
> index 3e43f4b6..9355326c 100644
> --- a/bpf/Build
> +++ b/bpf/Build
> @@ -24,6 +24,7 @@ bpf_dlib_SOURCES = \
>  	agg_lqbin.c agg_qbin.c \
>  	basename.S \
>  	cleanpath.S \
> +	d_execargs.S \
>  	dirname.S \
>  	get_agg.c \
>  	get_bvar.c \
> diff --git a/bpf/d_execargs.S b/bpf/d_execargs.S
> new file mode 100644
> index 00000000..3a5b1270
> --- /dev/null
> +++ b/bpf/d_execargs.S
> @@ -0,0 +1,91 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (c) 2025, Oracle and/or its affiliates.
> + */
> +
> +#include <bpf_asm_helpers.h>
> +#include <dtrace/faults_defines.h>
> +
> +	.text
> +	.align	4
> +	.global	dt_d_execargs
> +dt_d_execargs:
> +	stxdw	[%fp+-8], %r1			/* save dctx to stack */
> +	mov	%r9, %r3			/* %r9 = args */
> +
> +	mov	%r6, %r2			/* set %r6 in case of error */
> +	jeq	%r6, 0, .Lerror
> +
> +	add	%r6, TASK_MM			/* ptr = &(T->mm) */
> +
> +	mov	%r1, %r9
> +	mov	%r2, 8
> +	mov	%r3, %r6
> +	call	BPF_FUNC_probe_read
> +	jne	%r0, 0, .Lerror
> +
> +	ldxdw	%r8, [%r9+0]			/* %r8 = T->mm */
> +	jeq	%r8, 0, .Lempty
> +	mov	%r6, %r8
> +	add	%r6, TASK_MM_ARG_START		/* ptr = &(T->mm->arg_start) */
> +
> +	mov	%r1, %r9
> +	mov	%r2, 8
> +	mov	%r3, %r6
> +	call	BPF_FUNC_probe_read
> +	jne	%r0, 0, .Lerror
> +
> +	ldxdw	%r7, [%r9+0]			/* %r7 = T->mm->arg_start */
> +	mov	%r6, %r8
> +	add	%r6, TASK_MM_ARG_END		/* ptr = &(T->mm->arg_end) */
> +
> +	mov	%r1, %r9
> +	mov	%r2, 8
> +	mov	%r3, %r6
> +	call	BPF_FUNC_probe_read
> +	jne	%r0, 0, .Lerror
> +
> +	ldxdw	%r6, [%r9+0]			/* %r6 = T->mm->arg_end */
> +
> +	mov	%r8, %r6
> +	sub	%r8, %r7			/* %r8 = len = arg_end - arg_start */
> +	jslt	%r8, 2, .Lempty
> +	mov	%r0, STRSZ
> +	jslt	%r8, %r0, .Llen_ok
> +	mov	%r8, %r0
> +.Llen_ok:
> +
> +	/* read data from arg_start to arg_end */
> +	mov	%r1, %r9
> +	mov	%r2, %r8
> +	mov	%r3, %r7
> +	call	BPF_FUNC_probe_read		/* bpf_probe_read(&args, len + 1, arg_start) */
> +	jne	%r0, 0, .Lerror
> +
> +	/* loop over args and replace '\0' with ' ' */
> +	mov	%r1, %r8
> +	sub	%r1, 2
> +.Lloop:
> +	mov	%r2, %r9
> +	add	%r2, %r1
> +	ldxb	%r0, [%r2+0]
> +	jne	%r0, 0, .Lnot_nil
> +	stb	[%r2+0], 32
> +.Lnot_nil:
> +	sub	%r1, 1
> +	jsge	%r1, 0, .Lloop
> +
> +.Ldone:
> +	mov	%r0, %r9
> +	exit					/* return args */
> +.Lerror:
> +	ldxdw	%r1, [%fp+-8]
> +	mov	%r2, PC
> +	mov	%r3, DTRACEFLT_BADADDR
> +	mov	%r4, %r6
> +	call	dt_probe_error
> +.Lempty:
> +	mov	%r0, %r9
> +	stb	[%r9+0], 0			/* args[0] = 0 */
> +	exit					/* return args */
> +	.size	dt_d_execargs, .-dt_d_execargs
> diff --git a/dlibs/aarch64/5.11/procfs.d b/dlibs/aarch64/5.11/procfs.d
> index 44ec4280..70a43ddf 100644
> --- a/dlibs/aarch64/5.11/procfs.d
> +++ b/dlibs/aarch64/5.11/procfs.d
> @@ -141,9 +141,7 @@ translator psinfo_t < struct task_struct *T > {
>  				   : (struct tty_struct *)-1;
>  
>  	pr_fname = T->comm;
> -/*
> -	pr_psargs = stringof(get_psinfo(T)->__psinfo(psargs));
> - */
> +	pr_psargs = d_execargs(T);
>  	pr_wstat = 0;
>  /*
>  	pr_argc = get_psinfo(T)->__psinfo(argc);
> diff --git a/dlibs/aarch64/5.12/procfs.d b/dlibs/aarch64/5.12/procfs.d
> index 44ec4280..70a43ddf 100644
> --- a/dlibs/aarch64/5.12/procfs.d
> +++ b/dlibs/aarch64/5.12/procfs.d
> @@ -141,9 +141,7 @@ translator psinfo_t < struct task_struct *T > {
>  				   : (struct tty_struct *)-1;
>  
>  	pr_fname = T->comm;
> -/*
> -	pr_psargs = stringof(get_psinfo(T)->__psinfo(psargs));
> - */
> +	pr_psargs = d_execargs(T);
>  	pr_wstat = 0;
>  /*
>  	pr_argc = get_psinfo(T)->__psinfo(argc);
> diff --git a/dlibs/aarch64/5.14/procfs.d b/dlibs/aarch64/5.14/procfs.d
> index 584ac325..ef27bb70 100644
> --- a/dlibs/aarch64/5.14/procfs.d
> +++ b/dlibs/aarch64/5.14/procfs.d
> @@ -141,9 +141,7 @@ translator psinfo_t < struct task_struct *T > {
>  				   : (struct tty_struct *)-1;
>  
>  	pr_fname = T->comm;
> -/*
> -	pr_psargs = stringof(get_psinfo(T)->__psinfo(psargs));
> - */
> +	pr_psargs = d_execargs(T);
>  	pr_wstat = 0;
>  /*
>  	pr_argc = get_psinfo(T)->__psinfo(argc);
> diff --git a/dlibs/aarch64/5.16/procfs.d b/dlibs/aarch64/5.16/procfs.d
> index 5aabc6f1..cad2d2c5 100644
> --- a/dlibs/aarch64/5.16/procfs.d
> +++ b/dlibs/aarch64/5.16/procfs.d
> @@ -141,9 +141,7 @@ translator psinfo_t < struct task_struct *T > {
>  				   : (struct tty_struct *)-1;
>  
>  	pr_fname = T->comm;
> -/*
> -	pr_psargs = stringof(get_psinfo(T)->__psinfo(psargs));
> - */
> +	pr_psargs = d_execargs(T);
>  	pr_wstat = 0;
>  /*
>  	pr_argc = get_psinfo(T)->__psinfo(argc);
> diff --git a/dlibs/aarch64/5.2/procfs.d b/dlibs/aarch64/5.2/procfs.d
> index 683ff5a8..6b1b1b9c 100644
> --- a/dlibs/aarch64/5.2/procfs.d
> +++ b/dlibs/aarch64/5.2/procfs.d
> @@ -141,9 +141,7 @@ translator psinfo_t < struct task_struct *T > {
>  				   : (struct tty_struct *)-1;
>  
>  	pr_fname = T->comm;
> -/*
> -	pr_psargs = stringof(get_psinfo(T)->__psinfo(psargs));
> - */
> +	pr_psargs = d_execargs(T);
>  	pr_wstat = 0;
>  /*
>  	pr_argc = get_psinfo(T)->__psinfo(argc);
> diff --git a/dlibs/aarch64/5.6/procfs.d b/dlibs/aarch64/5.6/procfs.d
> index 44ec4280..70a43ddf 100644
> --- a/dlibs/aarch64/5.6/procfs.d
> +++ b/dlibs/aarch64/5.6/procfs.d
> @@ -141,9 +141,7 @@ translator psinfo_t < struct task_struct *T > {
>  				   : (struct tty_struct *)-1;
>  
>  	pr_fname = T->comm;
> -/*
> -	pr_psargs = stringof(get_psinfo(T)->__psinfo(psargs));
> - */
> +	pr_psargs = d_execargs(T);
>  	pr_wstat = 0;
>  /*
>  	pr_argc = get_psinfo(T)->__psinfo(argc);
> diff --git a/dlibs/aarch64/6.1/procfs.d b/dlibs/aarch64/6.1/procfs.d
> index 5d7873b5..4cb7b77c 100644
> --- a/dlibs/aarch64/6.1/procfs.d
> +++ b/dlibs/aarch64/6.1/procfs.d
> @@ -141,9 +141,7 @@ translator psinfo_t < struct task_struct *T > {
>  				   : (struct tty_struct *)-1;
>  
>  	pr_fname = T->comm;
> -/*
> -	pr_psargs = stringof(get_psinfo(T)->__psinfo(psargs));
> - */
> +	pr_psargs = d_execargs(T);
>  	pr_wstat = 0;
>  /*
>  	pr_argc = get_psinfo(T)->__psinfo(argc);
> diff --git a/dlibs/aarch64/6.10/procfs.d b/dlibs/aarch64/6.10/procfs.d
> index 5d7873b5..4cb7b77c 100644
> --- a/dlibs/aarch64/6.10/procfs.d
> +++ b/dlibs/aarch64/6.10/procfs.d
> @@ -141,9 +141,7 @@ translator psinfo_t < struct task_struct *T > {
>  				   : (struct tty_struct *)-1;
>  
>  	pr_fname = T->comm;
> -/*
> -	pr_psargs = stringof(get_psinfo(T)->__psinfo(psargs));
> - */
> +	pr_psargs = d_execargs(T);
>  	pr_wstat = 0;
>  /*
>  	pr_argc = get_psinfo(T)->__psinfo(argc);
> diff --git a/dlibs/x86_64/5.11/procfs.d b/dlibs/x86_64/5.11/procfs.d
> index 7274554e..c2be76d8 100644
> --- a/dlibs/x86_64/5.11/procfs.d
> +++ b/dlibs/x86_64/5.11/procfs.d
> @@ -141,9 +141,7 @@ translator psinfo_t < struct task_struct *T > {
>  				   : (struct tty_struct *)-1;
>  
>  	pr_fname = T->comm;
> -/*
> -	pr_psargs = stringof(get_psinfo(T)->__psinfo(psargs));
> - */
> +	pr_psargs = d_execargs(T);
>  	pr_wstat = 0;
>  /*
>  	pr_argc = get_psinfo(T)->__psinfo(argc);
> diff --git a/dlibs/x86_64/5.12/procfs.d b/dlibs/x86_64/5.12/procfs.d
> index 7274554e..c2be76d8 100644
> --- a/dlibs/x86_64/5.12/procfs.d
> +++ b/dlibs/x86_64/5.12/procfs.d
> @@ -141,9 +141,7 @@ translator psinfo_t < struct task_struct *T > {
>  				   : (struct tty_struct *)-1;
>  
>  	pr_fname = T->comm;
> -/*
> -	pr_psargs = stringof(get_psinfo(T)->__psinfo(psargs));
> - */
> +	pr_psargs = d_execargs(T);
>  	pr_wstat = 0;
>  /*
>  	pr_argc = get_psinfo(T)->__psinfo(argc);
> diff --git a/dlibs/x86_64/5.14/procfs.d b/dlibs/x86_64/5.14/procfs.d
> index d1cf90d3..28fada6d 100644
> --- a/dlibs/x86_64/5.14/procfs.d
> +++ b/dlibs/x86_64/5.14/procfs.d
> @@ -141,9 +141,7 @@ translator psinfo_t < struct task_struct *T > {
>  				   : (struct tty_struct *)-1;
>  
>  	pr_fname = T->comm;
> -/*
> -	pr_psargs = stringof(get_psinfo(T)->__psinfo(psargs));
> - */
> +	pr_psargs = d_execargs(T);
>  	pr_wstat = 0;
>  /*
>  	pr_argc = get_psinfo(T)->__psinfo(argc);
> diff --git a/dlibs/x86_64/5.16/procfs.d b/dlibs/x86_64/5.16/procfs.d
> index 5aabc6f1..cad2d2c5 100644
> --- a/dlibs/x86_64/5.16/procfs.d
> +++ b/dlibs/x86_64/5.16/procfs.d
> @@ -141,9 +141,7 @@ translator psinfo_t < struct task_struct *T > {
>  				   : (struct tty_struct *)-1;
>  
>  	pr_fname = T->comm;
> -/*
> -	pr_psargs = stringof(get_psinfo(T)->__psinfo(psargs));
> - */
> +	pr_psargs = d_execargs(T);
>  	pr_wstat = 0;
>  /*
>  	pr_argc = get_psinfo(T)->__psinfo(argc);
> diff --git a/dlibs/x86_64/5.2/procfs.d b/dlibs/x86_64/5.2/procfs.d
> index 35538862..08696cf7 100644
> --- a/dlibs/x86_64/5.2/procfs.d
> +++ b/dlibs/x86_64/5.2/procfs.d
> @@ -141,9 +141,7 @@ translator psinfo_t < struct task_struct *T > {
>  				   : (struct tty_struct *)-1;
>  
>  	pr_fname = T->comm;
> -/*
> -	pr_psargs = stringof(get_psinfo(T)->__psinfo(psargs));
> - */
> +	pr_psargs = d_execargs(T);
>  	pr_wstat = 0;
>  /*
>  	pr_argc = get_psinfo(T)->__psinfo(argc);
> diff --git a/dlibs/x86_64/5.6/procfs.d b/dlibs/x86_64/5.6/procfs.d
> index 7274554e..c2be76d8 100644
> --- a/dlibs/x86_64/5.6/procfs.d
> +++ b/dlibs/x86_64/5.6/procfs.d
> @@ -141,9 +141,7 @@ translator psinfo_t < struct task_struct *T > {
>  				   : (struct tty_struct *)-1;
>  
>  	pr_fname = T->comm;
> -/*
> -	pr_psargs = stringof(get_psinfo(T)->__psinfo(psargs));
> - */
> +	pr_psargs = d_execargs(T);
>  	pr_wstat = 0;
>  /*
>  	pr_argc = get_psinfo(T)->__psinfo(argc);
> diff --git a/dlibs/x86_64/6.1/procfs.d b/dlibs/x86_64/6.1/procfs.d
> index 5d7873b5..4cb7b77c 100644
> --- a/dlibs/x86_64/6.1/procfs.d
> +++ b/dlibs/x86_64/6.1/procfs.d
> @@ -141,9 +141,7 @@ translator psinfo_t < struct task_struct *T > {
>  				   : (struct tty_struct *)-1;
>  
>  	pr_fname = T->comm;
> -/*
> -	pr_psargs = stringof(get_psinfo(T)->__psinfo(psargs));
> - */
> +	pr_psargs = d_execargs(T);
>  	pr_wstat = 0;
>  /*
>  	pr_argc = get_psinfo(T)->__psinfo(argc);
> diff --git a/dlibs/x86_64/6.10/procfs.d b/dlibs/x86_64/6.10/procfs.d
> index 5d7873b5..4cb7b77c 100644
> --- a/dlibs/x86_64/6.10/procfs.d
> +++ b/dlibs/x86_64/6.10/procfs.d
> @@ -141,9 +141,7 @@ translator psinfo_t < struct task_struct *T > {
>  				   : (struct tty_struct *)-1;
>  
>  	pr_fname = T->comm;
> -/*
> -	pr_psargs = stringof(get_psinfo(T)->__psinfo(psargs));
> - */
> +	pr_psargs = d_execargs(T);
>  	pr_wstat = 0;
>  /*
>  	pr_argc = get_psinfo(T)->__psinfo(argc);
> diff --git a/include/dtrace/dif_defines.h b/include/dtrace/dif_defines.h
> index c8c1d961..cd785723 100644
> --- a/include/dtrace/dif_defines.h
> +++ b/include/dtrace/dif_defines.h
> @@ -207,10 +207,11 @@
>  #define DIF_SUBR_INET_NTOP		41
>  #define DIF_SUBR_INET_NTOA		42
>  #define DIF_SUBR_INET_NTOA6		43
> -#define DIF_SUBR_D_PATH			44
> -#define DIF_SUBR_LINK_NTOP		45
> +#define DIF_SUBR_LINK_NTOP		44
> +#define DIF_SUBR_D_PATH			45
> +#define DIF_SUBR_D_EXECARGS		46
>  
> -#define DIF_SUBR_MAX			45
> +#define DIF_SUBR_MAX			46
>  
>  typedef uint32_t	dif_instr_t;
>  
> diff --git a/libdtrace/dt_bpf.h b/libdtrace/dt_bpf.h
> index 6518de66..85934d2d 100644
> --- a/libdtrace/dt_bpf.h
> +++ b/libdtrace/dt_bpf.h
> @@ -47,15 +47,18 @@ extern "C" {
>  #define DT_CONST_TASK_TGID		12
>  #define DT_CONST_TASK_REAL_PARENT	13
>  #define DT_CONST_TASK_COMM		14
> -#define DT_CONST_MUTEX_OWNER		15
> -#define DT_CONST_RWLOCK_CNTS		16
> -#define DT_CONST_DCTX_RODATA		17
> -#define DT_CONST_RODATA_OFF		18
> -#define DT_CONST_RODATA_SIZE		19
> -#define DT_CONST_ZERO_OFF		20
> -#define DT_CONST_STACK_OFF		21
> -#define DT_CONST_STACK_SKIP		22
> -#define DT_CONST_NPROBES		23
> +#define DT_CONST_TASK_MM		15
> +#define DT_CONST_TASK_MM_ARG_START	16
> +#define DT_CONST_TASK_MM_ARG_END	17
> +#define DT_CONST_MUTEX_OWNER		18
> +#define DT_CONST_RWLOCK_CNTS		19
> +#define DT_CONST_DCTX_RODATA		20
> +#define DT_CONST_RODATA_OFF		21
> +#define DT_CONST_RODATA_SIZE		22
> +#define DT_CONST_ZERO_OFF		23
> +#define DT_CONST_STACK_OFF		24
> +#define DT_CONST_STACK_SKIP		25
> +#define DT_CONST_NPROBES		26
>  
>  #define DT_BPF_LOG_SIZE_DEFAULT	(UINT32_MAX >> 8)
>  #define DT_BPF_LOG_SIZE_SMALL	4096
> diff --git a/libdtrace/dt_cc.c b/libdtrace/dt_cc.c
> index 29cfbd84..1dc119ea 100644
> --- a/libdtrace/dt_cc.c
> +++ b/libdtrace/dt_cc.c
> @@ -1082,7 +1082,8 @@ dt_link_construct(dtrace_hdl_t *dtp, const dt_probe_t *prp, dtrace_difo_t *dp,
>  			case DT_CONST_TASK_PID:
>  			case DT_CONST_TASK_TGID:
>  			case DT_CONST_TASK_REAL_PARENT:
> -			case DT_CONST_TASK_COMM: {
> +			case DT_CONST_TASK_COMM:
> +			case DT_CONST_TASK_MM: {
>  				ctf_file_t *cfp = dtp->dt_shared_ctf;
>  				ctf_id_t type;
>  				ctf_membinfo_t ctm;
> @@ -1108,6 +1109,36 @@ dt_link_construct(dtrace_hdl_t *dtp, const dt_probe_t *prp, dtrace_difo_t *dp,
>  				case DT_CONST_TASK_COMM:
>  					rc = ctf_member_info(cfp, type, "comm", &ctm);
>  					break;
> +				case DT_CONST_TASK_MM:
> +					rc = ctf_member_info(cfp, type, "mm", &ctm);
> +					break;
> +				}
> +				if (rc == CTF_ERR)
> +					goto err_ctf;
> +				nrp->dofr_data = ctm.ctm_offset / NBBY;
> +				continue;
> +			}
> +			case DT_CONST_TASK_MM_ARG_START:
> +			case DT_CONST_TASK_MM_ARG_END: {
> +				ctf_file_t *cfp = dtp->dt_shared_ctf;
> +				ctf_id_t type;
> +				ctf_membinfo_t ctm;
> +				int rc = 0;
> +
> +				if (!cfp)
> +					return dt_set_errno(dtp, EDT_NOCTF);
> +
> +				type = ctf_lookup_by_name(cfp, "struct mm_struct");
> +				if (type == CTF_ERR)
> +					goto err_ctf;
> +
> +				switch (idp->di_id) {
> +				case DT_CONST_TASK_MM_ARG_START:
> +					rc = ctf_member_info(cfp, type, "arg_start", &ctm);
> +					break;
> +				case DT_CONST_TASK_MM_ARG_END:
> +					rc = ctf_member_info(cfp, type, "arg_end", &ctm);
> +					break;
>  				}
>  				if (rc == CTF_ERR)
>  					goto err_ctf;
> diff --git a/libdtrace/dt_cg.c b/libdtrace/dt_cg.c
> index 6e74b4b0..a1a39f3f 100644
> --- a/libdtrace/dt_cg.c
> +++ b/libdtrace/dt_cg.c
> @@ -3300,7 +3300,6 @@ dt_cg_load_var(dt_node_t *dnp, dt_irlist_t *dlp, dt_regset_t *drp)
>  	}
>  
>  	/* built-in variables (note: args[] is handled in dt_cg_array_op) */
> -	/* Special case for arg0 through arg9; encode as args[n] */
>  	if (idp->di_id >= DIF_VAR_ARG0 && idp->di_id <= DIF_VAR_ARG9) {
>  		fnp = dt_dlib_get_func(yypcb->pcb_hdl, "dt_bvar_args");
>  		idx = idp->di_id - DIF_VAR_ARG0;
> @@ -6661,6 +6660,13 @@ dt_cg_subr_inet_ntop(dt_node_t *dnp, dt_irlist_t *dlp, dt_regset_t *drp)
>  	tnp->dn_tstring = NULL;
>  }
>  
> +static void
> +dt_cg_subr_d_execargs(dt_node_t *dnp, dt_irlist_t *dlp, dt_regset_t *drp)
> +{
> +	dt_cg_subr_arg_to_tstring(dnp, dlp, drp, "dt_d_execargs", 0,
> +				  DT_IGNOR, 0, DT_IGNOR, 0);
> +}
> +
>  static void
>  dt_cg_subr_d_path(dt_node_t *dnp, dt_irlist_t *dlp, dt_regset_t *drp)
>  {
> @@ -6758,6 +6764,7 @@ static dt_cg_subr_f *_dt_cg_subr[DIF_SUBR_MAX + 1] = {
>  	[DIF_SUBR_INET_NTOP]		= &dt_cg_subr_inet_ntop,
>  	[DIF_SUBR_INET_NTOA]		= &dt_cg_subr_inet_ntoa,
>  	[DIF_SUBR_INET_NTOA6]		= &dt_cg_subr_inet_ntoa6,
> +	[DIF_SUBR_D_EXECARGS]		= &dt_cg_subr_d_execargs,
>  	[DIF_SUBR_D_PATH]		= &dt_cg_subr_d_path,
>  	[DIF_SUBR_LINK_NTOP]		= &dt_cg_subr_link_ntop,
>  };
> diff --git a/libdtrace/dt_dlibs.c b/libdtrace/dt_dlibs.c
> index 07d22afd..9ad4f5e7 100644
> --- a/libdtrace/dt_dlibs.c
> +++ b/libdtrace/dt_dlibs.c
> @@ -89,6 +89,9 @@ static const dt_ident_t		dt_bpf_symbols[] = {
>  	DT_BPF_SYMBOL_ID(TASK_TGID, DT_IDENT_SCALAR, DT_CONST_TASK_TGID),
>  	DT_BPF_SYMBOL_ID(TASK_REAL_PARENT, DT_IDENT_SCALAR, DT_CONST_TASK_REAL_PARENT),
>  	DT_BPF_SYMBOL_ID(TASK_COMM, DT_IDENT_SCALAR, DT_CONST_TASK_COMM),
> +	DT_BPF_SYMBOL_ID(TASK_MM, DT_IDENT_SCALAR, DT_CONST_TASK_MM),
> +	DT_BPF_SYMBOL_ID(TASK_MM_ARG_START, DT_IDENT_SCALAR, DT_CONST_TASK_MM_ARG_START),
> +	DT_BPF_SYMBOL_ID(TASK_MM_ARG_END, DT_IDENT_SCALAR, DT_CONST_TASK_MM_ARG_END),
>  	DT_BPF_SYMBOL_ID(MUTEX_OWNER, DT_IDENT_SCALAR, DT_CONST_MUTEX_OWNER),
>  	DT_BPF_SYMBOL_ID(RWLOCK_CNTS, DT_IDENT_SCALAR, DT_CONST_RWLOCK_CNTS),
>  	DT_BPF_SYMBOL_ID(DCTX_RODATA, DT_IDENT_SCALAR, DT_CONST_DCTX_RODATA),
> diff --git a/libdtrace/dt_open.c b/libdtrace/dt_open.c
> index a0205887..c8208de6 100644
> --- a/libdtrace/dt_open.c
> +++ b/libdtrace/dt_open.c
> @@ -138,6 +138,8 @@ static const dt_ident_t _dtrace_globals[] = {
>  	{ DTRACE_STABILITY_STABLE, DTRACE_STABILITY_PRIVATE,
>  	DTRACE_CLASS_COMMON }, DT_VERS_1_0,
>  	&dt_idops_type, "vmlinux`struct task_struct *" },
> +{ "d_execargs", DT_IDENT_FUNC, 0, DIF_SUBR_D_EXECARGS, DT_ATTR_EVOLCMN,
> +	DT_VERS_2_0, &dt_idops_func, "string(vmlinux`struct task_struct *)" },
>  { "d_path", DT_IDENT_FUNC, DT_IDFLG_DPTR, DIF_SUBR_D_PATH, DT_ATTR_EVOLCMN,
>  	DT_VERS_1_0, &dt_idops_func, "string(struct path *)" },
>  { "ddi_pathname", DT_IDENT_FUNC, 0, DIF_SUBR_DDI_PATHNAME,
> diff --git a/libdtrace/procfs.d.in b/libdtrace/procfs.d.in
> index 038cf69b..e9d50349 100644
> --- a/libdtrace/procfs.d.in
> +++ b/libdtrace/procfs.d.in
> @@ -179,9 +179,7 @@ translator psinfo_t < struct task_struct *T > {
>  				   : (struct tty_struct *)-1;
>  
>  	pr_fname = T->comm;
> -/*
> -	pr_psargs = stringof(get_psinfo(T)->__psinfo(psargs));
> - */
> +	pr_psargs = d_execargs(T);
>  	pr_wstat = 0;
>  /*
>  	pr_argc = get_psinfo(T)->__psinfo(argc);
> diff --git a/test/unittest/funcs/d_execargs/err.D_PROTO_ARG.scalar_arg.d b/test/unittest/funcs/d_execargs/err.D_PROTO_ARG.scalar_arg.d
> new file mode 100644
> index 00000000..c707184d
> --- /dev/null
> +++ b/test/unittest/funcs/d_execargs/err.D_PROTO_ARG.scalar_arg.d
> @@ -0,0 +1,16 @@
> +/*
> + * Oracle Linux DTrace.
> + * Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
> + * Licensed under the Universal Permissive License v 1.0 as shown at
> + * http://oss.oracle.com/licenses/upl.
> + */
> +
> +/*
> + * ASSERTION: The argument to d_execargs() should be a (struct task_struct *).
> + */
> +
> +BEGIN
> +{
> +	trace(d_execargs(1));
> +	exit(0);
> +}
> diff --git a/test/unittest/funcs/d_execargs/err.D_PROTO_ARG.scalar_arg.r b/test/unittest/funcs/d_execargs/err.D_PROTO_ARG.scalar_arg.r
> new file mode 100644
> index 00000000..0e9cda07
> --- /dev/null
> +++ b/test/unittest/funcs/d_execargs/err.D_PROTO_ARG.scalar_arg.r
> @@ -0,0 +1,4 @@
> +-- @@stderr --
> +dtrace: failed to compile script test/unittest/funcs/d_execargs/err.D_PROTO_ARG.scalar_arg.d: [D_PROTO_ARG] line 14: d_execargs( ) argument #1 is incompatible with prototype:
> +	prototype: struct task_struct *
> +	 argument: int
> diff --git a/test/unittest/funcs/d_execargs/err.D_PROTO_ARG.string_arg.d b/test/unittest/funcs/d_execargs/err.D_PROTO_ARG.string_arg.d
> new file mode 100644
> index 00000000..ba419689
> --- /dev/null
> +++ b/test/unittest/funcs/d_execargs/err.D_PROTO_ARG.string_arg.d
> @@ -0,0 +1,16 @@
> +/*
> + * Oracle Linux DTrace.
> + * Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
> + * Licensed under the Universal Permissive License v 1.0 as shown at
> + * http://oss.oracle.com/licenses/upl.
> + */
> +
> +/*
> + * ASSERTION: The argument to d_execargs() should be (struct task_struct *).
> + */
> +
> +BEGIN
> +{
> +	trace(d_execargs("a"));
> +	exit(0);
> +}
> diff --git a/test/unittest/funcs/d_execargs/err.D_PROTO_ARG.string_arg.r b/test/unittest/funcs/d_execargs/err.D_PROTO_ARG.string_arg.r
> new file mode 100644
> index 00000000..ac1c1401
> --- /dev/null
> +++ b/test/unittest/funcs/d_execargs/err.D_PROTO_ARG.string_arg.r
> @@ -0,0 +1,4 @@
> +-- @@stderr --
> +dtrace: failed to compile script test/unittest/funcs/d_execargs/err.D_PROTO_ARG.string_arg.d: [D_PROTO_ARG] line 14: d_execargs( ) argument #1 is incompatible with prototype:
> +	prototype: struct task_struct *
> +	 argument: string
> diff --git a/test/unittest/funcs/d_execargs/err.D_PROTO_ARG.wrong_ptr.d b/test/unittest/funcs/d_execargs/err.D_PROTO_ARG.wrong_ptr.d
> new file mode 100644
> index 00000000..473e35e4
> --- /dev/null
> +++ b/test/unittest/funcs/d_execargs/err.D_PROTO_ARG.wrong_ptr.d
> @@ -0,0 +1,16 @@
> +/*
> + * Oracle Linux DTrace.
> + * Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
> + * Licensed under the Universal Permissive License v 1.0 as shown at
> + * http://oss.oracle.com/licenses/upl.
> + */
> +
> +/*
> + * ASSERTION: The argument to d_execargs() should be (struct task_struct *).
> + */
> +
> +BEGIN
> +{
> +	trace(d_execargs(curthread->mm));
> +	exit(0);
> +}
> diff --git a/test/unittest/funcs/d_execargs/err.D_PROTO_ARG.wrong_ptr.r b/test/unittest/funcs/d_execargs/err.D_PROTO_ARG.wrong_ptr.r
> new file mode 100644
> index 00000000..842371a3
> --- /dev/null
> +++ b/test/unittest/funcs/d_execargs/err.D_PROTO_ARG.wrong_ptr.r
> @@ -0,0 +1,4 @@
> +-- @@stderr --
> +dtrace: failed to compile script test/unittest/funcs/d_execargs/err.D_PROTO_ARG.wrong_ptr.d: [D_PROTO_ARG] line 14: d_execargs( ) argument #1 is incompatible with prototype:
> +	prototype: struct task_struct *
> +	 argument: struct mm_struct *
> diff --git a/test/unittest/funcs/d_execargs/err.D_PROTO_LEN.missing_arg.d b/test/unittest/funcs/d_execargs/err.D_PROTO_LEN.missing_arg.d
> new file mode 100644
> index 00000000..86b1b237
> --- /dev/null
> +++ b/test/unittest/funcs/d_execargs/err.D_PROTO_LEN.missing_arg.d
> @@ -0,0 +1,16 @@
> +/*
> + * Oracle Linux DTrace.
> + * Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
> + * Licensed under the Universal Permissive License v 1.0 as shown at
> + * http://oss.oracle.com/licenses/upl.
> + */
> +
> +/*
> + * ASSERTION: d_execargs() requires an argument
> + */
> +
> +BEGIN
> +{
> +	trace(d_execargs());
> +	exit(0);
> +}
> diff --git a/test/unittest/funcs/d_execargs/err.D_PROTO_LEN.missing_arg.r b/test/unittest/funcs/d_execargs/err.D_PROTO_LEN.missing_arg.r
> new file mode 100644
> index 00000000..a4fcd162
> --- /dev/null
> +++ b/test/unittest/funcs/d_execargs/err.D_PROTO_LEN.missing_arg.r
> @@ -0,0 +1,2 @@
> +-- @@stderr --
> +dtrace: failed to compile script test/unittest/funcs/d_execargs/err.D_PROTO_LEN.missing_arg.d: [D_PROTO_LEN] line 14: d_execargs( ) prototype mismatch: 0 args passed, 1 expected
> diff --git a/test/unittest/funcs/d_execargs/err.D_PROTO_LEN.too_many_args.d b/test/unittest/funcs/d_execargs/err.D_PROTO_LEN.too_many_args.d
> new file mode 100644
> index 00000000..3add63f6
> --- /dev/null
> +++ b/test/unittest/funcs/d_execargs/err.D_PROTO_LEN.too_many_args.d
> @@ -0,0 +1,16 @@
> +/*
> + * Oracle Linux DTrace.
> + * Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
> + * Licensed under the Universal Permissive License v 1.0 as shown at
> + * http://oss.oracle.com/licenses/upl.
> + */
> +
> +/*
> + * ASSERTION: The d_execargs() subroutine accepts no more than one argument.
> + */
> +
> +BEGIN
> +{
> +	trace(d_execargs(curthread, 1));
> +	exit(0);
> +}
> diff --git a/test/unittest/funcs/d_execargs/err.D_PROTO_LEN.too_many_args.r b/test/unittest/funcs/d_execargs/err.D_PROTO_LEN.too_many_args.r
> new file mode 100644
> index 00000000..f5a982ff
> --- /dev/null
> +++ b/test/unittest/funcs/d_execargs/err.D_PROTO_LEN.too_many_args.r
> @@ -0,0 +1,2 @@
> +-- @@stderr --
> +dtrace: failed to compile script test/unittest/funcs/d_execargs/err.D_PROTO_LEN.too_many_args.d: [D_PROTO_LEN] line 14: d_execargs( ) prototype mismatch: 2 args passed, 1 expected
> diff --git a/test/unittest/funcs/d_execargs/tst.d_execargs.d b/test/unittest/funcs/d_execargs/tst.d_execargs.d
> new file mode 100644
> index 00000000..b8b141aa
> --- /dev/null
> +++ b/test/unittest/funcs/d_execargs/tst.d_execargs.d
> @@ -0,0 +1,31 @@
> +/*
> + * Oracle Linux DTrace.
> + * Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
> + * Licensed under the Universal Permissive License v 1.0 as shown at
> + * http://oss.oracle.com/licenses/upl.
> + */
> +
> +/*
> + * ASSERTION: d_execargs() provides correct results.
> + */
> +
> +#pragma D option destructive
> +#pragma D option quiet
> +
> +BEGIN
> +{
> +	mypid = pid;
> +	system("/bin/echo TEST");
> +}
> +
> +proc:::exec-success
> +/progenyof(mypid) && d_execargs(curthread) == "/bin/echo TEST"/
> +{
> +	trace(d_execargs(curthread));
> +	exit(0);
> +}
> +
> +tick-1s
> +{
> +	exit(1);
> +}
> diff --git a/test/unittest/funcs/d_execargs/tst.d_execargs.r b/test/unittest/funcs/d_execargs/tst.d_execargs.r
> new file mode 100644
> index 00000000..d8ff6689
> --- /dev/null
> +++ b/test/unittest/funcs/d_execargs/tst.d_execargs.r
> @@ -0,0 +1,2 @@
> +TEST
> +/bin/echo TEST
> diff --git a/test/unittest/proc/tst.pr_psargs.d b/test/unittest/proc/tst.pr_psargs.d
> new file mode 100644
> index 00000000..902ac1a3
> --- /dev/null
> +++ b/test/unittest/proc/tst.pr_psargs.d
> @@ -0,0 +1,31 @@
> +/*
> + * Oracle Linux DTrace.
> + * Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
> + * Licensed under the Universal Permissive License v 1.0 as shown at
> + * http://oss.oracle.com/licenses/upl.
> + */
> +
> +/*
> + * ASSERTION: psinfo->pr_psargs provides correct results.
> + */
> +
> +#pragma D option destructive
> +#pragma D option quiet
> +
> +BEGIN
> +{
> +	mypid = pid;
> +	system("/bin/echo TEST");
> +}
> +
> +proc:::exec-success
> +/progenyof(mypid) && curpsinfo->pr_psargs == "/bin/echo TEST"/
> +{
> +	trace(curpsinfo->pr_psargs);
> +	exit(0);
> +}
> +
> +tick-1s
> +{
> +	exit(1);
> +}
> diff --git a/test/unittest/proc/tst.pr_psargs.r b/test/unittest/proc/tst.pr_psargs.r
> new file mode 100644
> index 00000000..397c8717
> --- /dev/null
> +++ b/test/unittest/proc/tst.pr_psargs.r
> @@ -0,0 +1,9 @@
> +TEST
> +
> +             0  1  2  3  4  5  6  7  8  9  a  b  c  d  e  f  0123456789abcdef
> +         0: 2f 62 69 6e 2f 65 63 68 6f 20 54 45 53 54 00 00  /bin/echo TEST..
> +        10: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
> +        20: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
> +        30: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
> +        40: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
> +

