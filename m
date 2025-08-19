Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5567113FEE
	for <dtrace@lists.linux.dev>; Tue, 19 Aug 2025 02:58:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755572314; cv=fail; b=aLS81N1ZFcPOdrkbMZ3k7m1eCeRZs58+IceLyNjElT7l2ijr6uZbiGK5NFErfthT6xl6zffXM5oYVThYeOjsDS91dNrbyHzA0Kk7JLod+EELI1xAhrgX/coXwQ+kKfZxzfWvxf2he54LnuWS/RgI6Gh8aD4wNKkKh9ac2KILG1M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755572314; c=relaxed/simple;
	bh=cDW+vdmldcCJpVoMiYNxATOVMLH26ZznbJTT49W4eZA=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=O+5srg0Us5nBZUdFjYKosSQA2eSF5Qy1eZRjZLzq5HFkZSfj6F7U6Gl1sCEfMagCE2va131D81SmlG4rNlJQd6G12OsB/IQPHOSl/8luut8fPKDO6hVwVtpKMJgOIs6xbx+1B249rEqkvKGJF9pjscqsoAXRy9vy+FnWmFZHrV0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=N5g4Ws4Q; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=UFG5XeNR; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="N5g4Ws4Q";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="UFG5XeNR"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57IJgMka004393
	for <dtrace@lists.linux.dev>; Tue, 19 Aug 2025 02:58:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=NnBDbO3c7mSSEQui2waEZ7cLAzyNE9N52Qok+hpLdyo=; b=
	N5g4Ws4Qf+h+8Z9XAKB2+d52BSwbrri2830rcJwsmxZg9QEgCVwrpPoaFRGfLN5K
	sFa4tlg23p49k+ocoWbSKbnJ8x9BP7LafK0c5H/Dbj4SsprggXKfpKrml1oW6LEM
	AhBjk+bihphDoTiVY/YvWS6IOMoXc8QXRY2NUaziTw2PF08HuGoEExBureYdq3aJ
	TcVhfUcrAApl2BApAdAHvTepzaOR7FUpwkEsYg0ZtfVW1O1mGMq9vDgQZ+6Sb2cR
	0LLfIa9nclKVBCjbDRKvdOA2kWTLSCDW3/AKS5kr2mdE3xYaGuHDSg0N5ph2fcYS
	yhk1ESGda0ujYCcIt7Vg2w==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 48jgk4mdb6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 19 Aug 2025 02:58:31 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 57J2jCQk003450
	for <dtrace@lists.linux.dev>; Tue, 19 Aug 2025 02:58:30 GMT
Received: from nam02-dm3-obe.outbound.protection.outlook.com (mail-dm3nam02on2072.outbound.protection.outlook.com [40.107.95.72])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 48jge9th1s-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 19 Aug 2025 02:58:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lBVK7EKSHdLwBJmKsytUuDVTIryXOCZQ9iAKvQ90Dalu51yRnZJHWOuQh0WFJ7rwLj6rLxKb1juh1Mzuq278T8JeqReUwW4j9zzoZvGBg74z8THUIm5e9YEfpCu1gVuqTtDffJ2GVavtDM4PuyBIZGaTVBrj8xP5OfbcB8+L0ZNXIpTrVdEWC3Y4bUkr3Hl8Y8mxqCvcaKhjL37e/Dz04cLMa1ajwOWC7Hu7XNYmmq1u/BGejNFuHFHKdgcWG7hYTh8LWAGgxvjLau3jD28Kg5OqrEwE7tAELr45aWvYrBSVlVXzUhsXoQE0m1ivwDvPS40Dq8dM+3B4MVDtlW5qLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NnBDbO3c7mSSEQui2waEZ7cLAzyNE9N52Qok+hpLdyo=;
 b=Q03yqWTbygA62qztmA/rYQwghgT2VvpoXNHKjI5R55ui5E8eefAv9lIObKGMYK6NrOMS+QzJMDP/k+DVt1TAeBl5m9tewGVr4RMmSgWeyuCJkiYo2U7kCcL11LywxKVjvGtnuLqVNeLVQ2fVSC4zaEY2oVyUScjQhs0bsudDzDP0ZKAUjprO9Fw5V0o2mpcbul4CLRLqvFLK6m345IdWJNwRPrvccZ/610SNJg/H2uaoaKLmtpM73HlEzL1pkqGksbXXCctJn/DfK/Wgrb8EBfRCZD/HTimsPgD1rEBAc8wy/Pk+J6Cl1AkVItWe/3mNVM6ltW69isfiHYkJpp+Bxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NnBDbO3c7mSSEQui2waEZ7cLAzyNE9N52Qok+hpLdyo=;
 b=UFG5XeNRYa3UO04+8EAz6/3NMxNTPDUzf/qTRyriFaOriksF4iH5wA+HcP5ICDPPVqC5vkYb5u2Xj16Mg5hbZtWKBjRcoCJrpQjIZrbc1tBekn67LHEpKrbgBns89/jfZgYNrC9F1IZtLdBlfmBkwf+HaAKa5DHIYVYdzF6K22U=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by PH0PR10MB5817.namprd10.prod.outlook.com (2603:10b6:510:12a::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.23; Tue, 19 Aug
 2025 02:58:21 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%6]) with mapi id 15.20.9031.023; Tue, 19 Aug 2025
 02:58:21 +0000
Message-ID: <59a44b5a-75cb-d6bb-096e-5cea529b61ac@oracle.com>
Date: Mon, 18 Aug 2025 22:58:19 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [DTrace-devel] [PATCH v3] Refactor the versioning handling system
 (consolidate data)
Content-Language: en-US
To: Kris Van Hees <kris.van.hees@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
References: <SJ0PR10MB56724CACC51FD1E9D4D7D84CC231A@SJ0PR10MB5672.namprd10.prod.outlook.com>
From: Eugene Loh <eugene.loh@oracle.com>
In-Reply-To: <SJ0PR10MB56724CACC51FD1E9D4D7D84CC231A@SJ0PR10MB5672.namprd10.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0357.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::32) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|PH0PR10MB5817:EE_
X-MS-Office365-Filtering-Correlation-Id: 4ff5fd72-b681-42ba-e1b6-08dddecc4167
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Q3cyNEMyU092ZGhHNUREVXJFU2NqVXdwQks0WGJ5N215SyswYi9oSDJCUi9U?=
 =?utf-8?B?NEVGV0EyR2x0V1lsYng2NUhreXIrZTF0dy9JcjNpM3BYUGYxdUQ4azNhTzBT?=
 =?utf-8?B?TGpxaW5iMlZkcFh1YnZ4OVhsQllMdWJXM3BGTEVFL1RSbGpxZVBMcVpzOTNl?=
 =?utf-8?B?ZlU3OWJ2T3VYYWVDRVp5aGxQem5RRFZTSGVGK25BV3hRRURha24vanJvanZS?=
 =?utf-8?B?QTA4clU0VmNqaERrZ0VZeWcwSnRCQThPVWtnQmlGUHh3dVgrZ0RYRUUrOGFl?=
 =?utf-8?B?b0h3Y1kvSUU0c2JrSU9MUlNNa252cSs4WXpDcHZxYlpnajF2ZGUzYnRVL3BJ?=
 =?utf-8?B?MWlnMnlicmZuMmFRU1JqeEowM2I1YlJVUEJlZDFpTEovV2FJcDMrR3VTMXVs?=
 =?utf-8?B?azlTaUNLYnN1U3Q1cXhtMmhGS1NrK3BiaHRCQ2ZIYng4dG5tbmhHT05oVWtv?=
 =?utf-8?B?a2laSE1yaG8rak9FVFhiN1hLYjBIeGdzVW9SZmxiV0hZM0YrYkhpNjF4OEVk?=
 =?utf-8?B?RTNQUEo0MDN1UnRmSDhTNWtCSTNxa0F3Y0txM3FLWi8vcGRiS0VWYzJyT3Zv?=
 =?utf-8?B?N1ZZckV0UnNIOGJrM0I2VXlyUHByL2RNQWt2blIvSXQxMVh3VGdGQkdtbUhB?=
 =?utf-8?B?QVo3cTJKRG1IRkw1d3FsMFJmQjNHdEUrVUtNaTFKN2hpMzUyRk1QYUw2TWxs?=
 =?utf-8?B?Sm5nOXpyNVJ1ais1SnFPTEpnd2d1ZjY2Mjg1eWpDRVFlbzU1Rm5kc2VFRGRh?=
 =?utf-8?B?WVF4ejNBdFpyVjZFQjh2Q3VmSHJRVDNhd2lMcWg3ZWZWd2tOSzYwN1hhYUpX?=
 =?utf-8?B?MkRpWUpnM1FRbkdZQTZkanMyRVdaYWJWc3ZLb1pGeHhHZUtOUENPQm1OcmxD?=
 =?utf-8?B?eU5OTW03eE1kaFhkaFRCTjNJMGpOZ3E5NHB3VlJVVkJvUWpBZng3T1hJNXNm?=
 =?utf-8?B?RFhvWTZpZk1hcmtNRnR4RTB0UXk0OStxaUIzQjZON0dzRGFxdGNwTzZyNTRl?=
 =?utf-8?B?NXY3eU52c2c0dzg1SnU0OWZvbjNRWjhNU0lsWDRVU2RqRmIwQ1dTb3JKRGRB?=
 =?utf-8?B?aVE0QytJbzU4QnA3Q0NPSmtzRkJlcEhnTDZhNlo4czlFYlJwcGMrQmhEaTVt?=
 =?utf-8?B?OGtNNTNqZkZmTndBM3RCbDNiQ21FTTUwdzNUU3N4UU1rTkN5ZURob0wvRGlG?=
 =?utf-8?B?Uy8rQXdIbWM5NlJSUWgzeld5c3ZNWURsVUpKa3kycFdBdkgzRndRRjI2aWZJ?=
 =?utf-8?B?REVpUWJJdjZVS1FiTXdQMXdCUXYrMU02TFdXeVVxZVdJU0NrRnk5NUZCQ1VB?=
 =?utf-8?B?VUZKQ05GQ0NDM2twRmsxdnlwV2Z5L3ZFZVpkMUo4WTZZc1RWeU92Y0U5Vlpp?=
 =?utf-8?B?RG44YjhwY2EwSW1ac3VoMlhYSUI1TmxmeWdxeXlxcWpOT2FIZSt3Q1JiL1lt?=
 =?utf-8?B?ZitsZklkeThwY1B2SUZ4cHRuRUh2M0FLTm9LdE9FQWRWWGM3NWNTNDhqM0Zz?=
 =?utf-8?B?VHp4Z3RScTl2VkZYQkZvSWRlTE1nWnlPZE13dVcrMk50L05OeUxsUkphQ0ll?=
 =?utf-8?B?aUR6MlRMYWRDUW56VUJnaERpS09aU0FzNStaRHNQY3JONXJRbFlvQW5BeEN0?=
 =?utf-8?B?clRlVitEVkxsNlRza1N0MXJKbUsrZElCR3lmV2JKdHlLUFF6Zkh2cWgwRUZ5?=
 =?utf-8?B?aGZaOElFUXZBKytDOFlJMVhvL1AreUFHRytUZVBUcUpJQzRZNWdXb0xWNGlV?=
 =?utf-8?B?dVpjb3k1VnM4MmFyS1lmNmNYbVFTMTJPTFIzL0tKNVNaOFowVi9HYXBqVDZB?=
 =?utf-8?B?YlUwMWlTODF2UWNtNjFpTVlwZTRCZmhRLzczc04rblpjQ2FLVWNXclp3K3c0?=
 =?utf-8?Q?d9e2phldnuqMo?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?U1BycS9BbzNyYVM2UEZMT1hVWURjcE9iekdGNDRiUGNVbjd0VUNDZnM2UHZH?=
 =?utf-8?B?djIzMzZTMmdpeitrdXl0cjRHWkUxQ3huUGpiUzl1dTBONCtRckxsYjVFTWpJ?=
 =?utf-8?B?RVgyYlZqUW1BcnBPYkVuR0tXSHdpUTZ5V3pMMVpiaGQveFFrRmJiVHJ0YWQ3?=
 =?utf-8?B?djEwTGphNmVaK2ZNRFpDbmx6Q29ITlV5VGpWOGlJeS9ocTZUajdaNVlOWTd0?=
 =?utf-8?B?OTFOU0c4UWs5enhVUTlKMzNFNVk4QzVzMTZ2cDNmWklQZXE2SHBZWjdwdlB4?=
 =?utf-8?B?bVUvYVFBLy9wZFc4S1FUb2RFdU9mSDZTcVVFNWJJTzQzZFRmblZyVEF2bUkx?=
 =?utf-8?B?d1craHZCYklQcVdJNkd2eW90YkVkaUNXUSs1VVIzWkgwNXgySkNrSTNaQVVC?=
 =?utf-8?B?S2tPUHE0bGxDWXdPbmtPRUhnK0JzZnJLaTBJNFhndzdMcy80K3F0UldhYmtq?=
 =?utf-8?B?eVdvZHVGZ1hRRjJFL0kyNzhlSnF6TWo2WlM4RXN5SS9NWThWRE83TjBhRlFH?=
 =?utf-8?B?SVZTWHdibmhxUFdNYnhhTjJFWVFkMG9rSlhQWUFCajcyU0lvOVpEbnBZeEs3?=
 =?utf-8?B?NHo0NWZ1c3JJQWFhUzVBZzA3cDRnOWd5cGhmVHdrSTVhRDA4SnJLcm9YUEpG?=
 =?utf-8?B?M2FlSlcyQXV2c1BYU0cwMFBNUXFLY1Z3dmxGbnR6NU9SMFQyd290OHNEUWNy?=
 =?utf-8?B?RUp2NFozL25SRy9nZHl4aktXY2lTbzdsMXNxa3JMUSszdUkzRWo3UEM2T2d1?=
 =?utf-8?B?dVlFSHVicS9nQTBBTWRwMHdKSVA2N3dVcFFoWktETWthSkVVWHpNVkFDQjFO?=
 =?utf-8?B?SGV4ekt2VnhFR3NJeDNBK0tzSFVnVUM2aEgwNm1SVFh6TTNuUHE4cXkvK1hO?=
 =?utf-8?B?dEdtOHcvVjJ4aXVtM0llUUpBRUJJUFRyUXgyTElxTCtsQzZUNTVwbG84Szdx?=
 =?utf-8?B?dlMzMFkwMnJ5NGVYSjFxL0FWdGcwdlVBVGtHRGdCcEhMbWIxT2RhbGxlWlBx?=
 =?utf-8?B?K1NBUjJ1dXFJOXYrZWNYV2pJYzFXbVg3OEs4STY5NzVZZFEvRzZwNXV5YmtP?=
 =?utf-8?B?Mi9Oc0ZqTFBPY2RxSjdzM3IvREp6cjZTMWZMS3g2a3Q1WVVYcTlqQktFWkdz?=
 =?utf-8?B?emhvVkl5dFBVM29EL1Z1YnFVVEJBTmlENmZqdURXb0hHZFdKUUxmYnRxVWxD?=
 =?utf-8?B?MTBLd0tUeUlVa1VKbWZqRXJEUU1aSGxoY1IxT1kvcElFOG5IR1ZCb3FpVEZt?=
 =?utf-8?B?UU1SWUpONWhyMVE0clNYaDduNW9Ea0lONHlFODBZUENHYllHVVNKKzRXQ3J3?=
 =?utf-8?B?TWVNOC9yT0RyYlpnUU4xY1B1cVZlRDJ1TmpjRWFld3FDNHRmWVFJRXh3WUhw?=
 =?utf-8?B?SUtSOXI2aXFzYmJVdVVrQkR1ejA1aXF5cEs5M2ZTdVZXZyt0M08rRHVkaThC?=
 =?utf-8?B?eVpSVlVlZjdaekJQM0JoSXExQXprMUNwREZRY0lFMjB2SkowWG03RkdnSHBQ?=
 =?utf-8?B?bWZGQ0VGeElyV04xbzFBWkpvamQ4UTJwdHBPbDBxaHR1OU9Wejl5MVBuUVpK?=
 =?utf-8?B?TTZiM1dpdlR1UFpVNXVaWHdVQWRQMEZPMkVkdTlEeTlsTDlua2hxaEMwOUMz?=
 =?utf-8?B?aXBiVjFsR0ttOWhvZSsyejUrc2VhOHg3NzJQSi83czRLQmhQdmRaNExkUy9w?=
 =?utf-8?B?ZzE4cE4rQWV6WW1nUEJyMTJ2R0VidTdqOU5DQlh2SU5odTVWMllhVEdSUHN5?=
 =?utf-8?B?U01kRXRXczN2dVQ4MW54N2ExbTQyZzdvOVdwMGIrZkRpa0pEaEpLWmFCVUxG?=
 =?utf-8?B?dDFNRjVILzB4b1paemZ6VGs2UWFFUWJaeW15eTRmMEh3a1NFNVk5d0FrbnR3?=
 =?utf-8?B?WG5IQUdxd0duaWNRY3lmQWdzVlZHdFJZSjZIeGJuR3AzWUdTNTc1V1ZCZTQr?=
 =?utf-8?B?aDNYMWFQWkllQ1Nzd1FuK3dZT3VyUHkrMnN3R0xJNXFuZmo5alRYdmNxaDlQ?=
 =?utf-8?B?cFZaMnBubUg2QURwZmtQdGhGSUNVc0Q2VFFnMlNHSlBEZUJtWVcySW5VK2ha?=
 =?utf-8?B?emZESDMvamVuL1h1NDFRWHJ4M1FHcnNuNTVpZHRqT0MySW5qRW1ZczlDRkZZ?=
 =?utf-8?Q?jtmSWPV0184NWuZ+X7yQNCBsP?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	LcxAIcysnwUwXDafc7V3k8xBPdd4TLYZom6lAe16DhNSdjh72sx6tpVBTYAIwpyY84/nGOctdH9LsT2edXxdaHIUXqEOQjjRGvK19UET7JickCRgWbaGetuw6UefX3Ed0qxo0PKyKcOM9Ank3Q0F6Q5U/SSeP28qINopQ/tSVTxQ4CrYJkPuX7f3izVb019St8cE+sv6ySqTYjspPlqLHlF7ybLNfKAU6v3iXiJ4goFEnzaqi2y3JppKyu96UKzvnW3gp4j9b7kRvJX5RI0XvQfww+L0KSrO3nAE/jYOiq2OsKkGZSaV0mSzHyc4KJ/obocTF3xOUCNOKhlYlvazuzp4j9DqzByg60XCvWUfUfdZzjPFuA5F/k/H+PNeDMXwUZG8kWorLSvAvYChsAKGguN3LlK2SzR5C1C5Ch5sLgMza/Jp3ztnOXOCA95gqKNhB2HFIWUaPn+hLEeuYAw5WkqiJ8an1JAO6rSRlIszRCRM88KVrqwlItt6NZQne15n+B8XS2p4ruDA6+UDV1deQWRtyHzMgtFlHUoxFV7b2s+eI8bu4D4UIK3wDvhOxMI3JXPceoZI5lmvReDJn3iMkZnilt/I2WLp1q7iE0lBMyo=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ff5fd72-b681-42ba-e1b6-08dddecc4167
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2025 02:58:21.0476
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oZQHEy4FmglShjxPZSV4RqMa1/NFjMdlNQphnUVyJx0Zr1U1psLh3uyDLDT6XTunj+SC68z53KkRUIFF/nTkWg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB5817
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-19_01,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 malwarescore=0 spamscore=0
 bulkscore=0 mlxlogscore=999 adultscore=0 suspectscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2507300000
 definitions=main-2508190027
X-Authority-Analysis: v=2.4 cv=FdI3xI+6 c=1 sm=1 tr=0 ts=68a3e857 cx=c_pps
 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=8PuX8ULV8DuV1I2NRNMA:9
 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: 2A7hI2cmjUj6aDajVLSY8pw3r6HMxOMq
X-Proofpoint-ORIG-GUID: 2A7hI2cmjUj6aDajVLSY8pw3r6HMxOMq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE5MDAyNyBTYWx0ZWRfX+Pr4rtLI2ggg
 E7jqnjwwpRTH4szZ5fVzwEvgRzCgA88SlGqyCEg3hqyRfkA7bOYlM7eNgOBpdsf2hGzwGJjOcYk
 D7JVUmzXdCa7OxflUaSjIByTSlQe4Kp+TRlS+yDaX0jo/K6DDvU/p6Wg/d4fHCEtZClUnhc7oud
 WyKbLTXaNddf4MnGugmgI5bZQ6DSB8b/WMGWlxSDjxRJdX0HE2Occ9kFld5avXXMFD6es+Y4XGE
 nOKkiPc0CPbygvSY3uHIhYRXGjzso7Q19jqiv1khitu0PiE/WLG3CY1WMsl4qNhKfdmiJNZVmiJ
 6m42UFgUnviKJ/vuoMBp/aU5ZXWWuoaHDtW6TtSJUjuiPka7Z6LF+8Boc3c3o2TQU6TVmjm6daL
 GWcQ1n3Lt4yiTTSoX+BQJT5sey5rvJSue2puG8OhrPmj82hAWfMMaSkGqjhVXWf+TUim0b00

Reviewed-by: Eugene Loh <eugene.loh@oracle.com>

On 8/18/25 18:19, Kris Van Hees via DTrace-devel wrote:
> Rather than having multiple data items that need to be updated whenever
> a new version is released, a single entry in versions.list will now be
> all that is needed.  The mkvers script generates the necessary defines,
> and is also used to return the most recent release version to be used
> in GNUmakefile.
>
> Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
> ---
>   GNUmakefile                                  |  2 +-
>   libdtrace/.gitignore                         |  1 +
>   libdtrace/Build                              |  8 +-
>   libdtrace/dt_version.h                       | 82 +-------------------
>   libdtrace/mkvers                             | 67 ++++++++++++++++
>   libdtrace/versions.list                      | 67 ++++++++++++++++
>   test/unittest/dtrace-util/tst.APIVersion.d   | 11 +--
>   test/unittest/dtrace-util/tst.APIVersion.r   |  2 +-
>   test/unittest/dtrace-util/tst.APIVersion.r.p | 12 +++
>   test/unittest/options/tst.version.r          |  1 -
>   test/unittest/options/tst.version.sh         |  3 +-
>   11 files changed, 163 insertions(+), 93 deletions(-)
>   create mode 100755 libdtrace/mkvers
>   create mode 100644 libdtrace/versions.list
>   create mode 100755 test/unittest/dtrace-util/tst.APIVersion.r.p
>
> diff --git a/GNUmakefile b/GNUmakefile
> index 7ad857f88..38ae54236 100644
> --- a/GNUmakefile
> +++ b/GNUmakefile
> @@ -14,7 +14,7 @@
>   SHELL = /bin/bash
>   
>   PROJECT := dtrace
> -VERSION := 2.0.3
> +VERSION := $(shell ./libdtrace/mkvers -vcurrent=t libdtrace/versions.list)
>   
>   # Verify supported hardware.
>   
> diff --git a/libdtrace/.gitignore b/libdtrace/.gitignore
> index cf124ba1d..ebf6ac9b2 100644
> --- a/libdtrace/.gitignore
> +++ b/libdtrace/.gitignore
> @@ -3,6 +3,7 @@ dt_errtags.c
>   dt_grammar.[ch]
>   dt_lex.c
>   dt_names.c
> +dt_versions_defs.h
>   errno.d
>   regs.d
>   signal.d
> diff --git a/libdtrace/Build b/libdtrace/Build
> index 164023bbc..3540d1c12 100644
> --- a/libdtrace/Build
> +++ b/libdtrace/Build
> @@ -73,7 +73,8 @@ libdtrace-build_SOURCES = dt_aggregate.c \
>   			  dt_work.c \
>   			  dt_xlator.c
>   
> -libdtrace-build_SRCDEPS := dt_grammar.h $(objdir)/dt_git_version.h
> +libdtrace-build_SRCDEPS := dt_grammar.h dt_versions_defs.h \
> +			   $(objdir)/dt_git_version.h
>   
>   SHLIBS += libdtrace
>   
> @@ -129,6 +130,10 @@ SHORTKERNELS := $(foreach kernel,$(KERNELS),$(shell printf %s $(kernel) | sed -e
>   $(libdtrace-build_DIR)dt_errtags.c: $(libdtrace-build_DIR)dt_errtags.h $(libdtrace-build_DIR)/mkerrtags.sh
>   	sh $(libdtrace-build_DIR)mkerrtags.sh < $(libdtrace-build_DIR)dt_errtags.h | sed -e 's/\\n/\n/g' > $@
>   
> +$(libdtrace-build_DIR)dt_versions_defs.h: $(libdtrace-build_DIR)versions.list
> +	$(call describe-target,MKVERS,$@)
> +	$(libdtrace-build_DIR)mkvers $< > $@
> +
>   $(libdtrace-build_DIR)%.h $(libdtrace-build_DIR)%.c: $(libdtrace-build_DIR)%.y
>   	$(call describe-target,YACC,$(libdtrace-build_DIR)$*.c)
>   	bison -o $(libdtrace-build_DIR)$*.c -d $(libdtrace-build_DIR)$*.y
> @@ -279,6 +284,7 @@ clean::
>   	rm -f $(libdtrace-build_DIR)dt_errtags.c
>   	rm -f $(libdtrace-build_DIR)dt_grammar.h $(libdtrace-build_DIR)dt_grammar.c
>   	rm -f $(libdtrace-build_DIR)dt_lex.c
> +	rm -f $(libdtrace-build_DIR)dt_versions_defs.h
>   	rm -f $(addprefix $(libdtrace-build_DIR),$(BUILD_DLIBS))
>   
>   install::
> diff --git a/libdtrace/dt_version.h b/libdtrace/dt_version.h
> index 8dd252b08..527087db3 100644
> --- a/libdtrace/dt_version.h
> +++ b/libdtrace/dt_version.h
> @@ -13,83 +13,7 @@ extern "C" {
>   #endif
>   
>   #include <dt_ident.h>
> -
> -/*
> - * Versioning definitions
> - *
> - * These #defines are used in identifier tables to fill in the version fields
> - * associated with each identifier.  The DT_VERS_* macros declare the encoded
> - * integer values of all versions used so far.  DT_VERS_LATEST must correspond
> - * to the latest version value among all versions exported by the D compiler.
> - * DT_VERS_STRING must be an ASCII string that contains DT_VERS_LATEST within
> - * it along with any suffixes (e.g. Beta).
> - *
> - * Refer to the Solaris Dynamic Tracing Guide Versioning chapter for an
> - * explanation of these DTrace features and their values.
> - *
> - * When adding a new version:
> - *  - Add a new DT_VERS_* macro
> - *  - Add the new DT_VERS_* macro at the end of the DTRACE_VERSIONS macro
> - *  - Set DT_VERS_LATEST to the new DT_VERS_*
> - *  - Update DT_VERS_STRING to reflect the new version
> - *
> - * NOTE: Although the DTrace versioning scheme supports the labeling and
> - *       introduction of incompatible changes (e.g. dropping an interface in a
> - *       major release), the libdtrace code does not currently support this.
> - *       All versions are assumed to strictly inherit from one another.  If
> - *       we ever need to provide divergent interfaces, this will need work.
> - *
> - * The version number should be increased for every customer visible release
> - * of DTrace.
> - *  - The major number should be incremented when a fundamental change has been
> - *    made that would affect all consumers, and would reflect sweeping changes
> - *    to DTrace or the D language.
> - *  - The minor number should be incremented when a change is introduced that
> - *    could break scripts that had previously worked; for example, adding a new
> - *    built-in variable could break a script which was already using that
> - *    identifier.
> - *  - The micro number should be changed when introducing functionality changes
> - *    or major bug fixes that do not affect backward compatibility -- this is
> - *    merely to make capabilities easily determined from the version number.
> - *    Minor bugs do not require any modification to the version number.
> - */
> -#define	DT_VERS_1_0	DT_VERSION_NUMBER(1, 0, 0)
> -#define	DT_VERS_1_1	DT_VERSION_NUMBER(1, 1, 0)
> -#define	DT_VERS_1_2	DT_VERSION_NUMBER(1, 2, 0)
> -#define	DT_VERS_1_2_1	DT_VERSION_NUMBER(1, 2, 1)
> -#define	DT_VERS_1_2_2	DT_VERSION_NUMBER(1, 2, 2)
> -#define	DT_VERS_1_3	DT_VERSION_NUMBER(1, 3, 0)
> -#define	DT_VERS_1_4	DT_VERSION_NUMBER(1, 4, 0)
> -#define	DT_VERS_1_4_1	DT_VERSION_NUMBER(1, 4, 1)
> -#define	DT_VERS_1_5	DT_VERSION_NUMBER(1, 5, 0)
> -#define	DT_VERS_1_6	DT_VERSION_NUMBER(1, 6, 0)
> -#define	DT_VERS_1_6_1	DT_VERSION_NUMBER(1, 6, 1)
> -#define	DT_VERS_1_6_2	DT_VERSION_NUMBER(1, 6, 2)
> -#define	DT_VERS_1_6_3	DT_VERSION_NUMBER(1, 6, 3)
> -#define	DT_VERS_1_6_4	DT_VERSION_NUMBER(1, 6, 4)
> -#define	DT_VERS_2_0	DT_VERSION_NUMBER(2, 0, 0)
> -#define	DT_VERS_2_0_1	DT_VERSION_NUMBER(2, 0, 1)
> -
> -#define DTRACE_VERSIONS	{ \
> -	DT_VERS_1_0,	/* D API 1.0.0 (PSARC 2001/466) Solaris 10 FCS */ \
> -	DT_VERS_1_1,	/* D API 1.1.0 Solaris Express 6/05 */ \
> -	DT_VERS_1_2,	/* D API 1.2.0 Solaris 10 Update 1 */ \
> -	DT_VERS_1_2_1,	/* D API 1.2.1 Solaris Express 4/06 */ \
> -	DT_VERS_1_2_2,	/* D API 1.2.2 Solaris Express 6/06 */ \
> -	DT_VERS_1_3,	/* D API 1.3 Solaris Express 10/06 */ \
> -	DT_VERS_1_4,	/* D API 1.4 Solaris Express 2/07 */ \
> -	DT_VERS_1_4_1,	/* D API 1.4.1 Solaris Express 4/07 */ \
> -	DT_VERS_1_5,	/* D API 1.5 Solaris Express 7/07 */ \
> -	DT_VERS_1_6,	/* D API 1.6 */ \
> -	DT_VERS_1_6_1,	/* D API 1.6.1 */ \
> -	DT_VERS_1_6_2,	/* D API 1.6.2 */ \
> -	DT_VERS_1_6_3,	/* D API 1.6.3 */ \
> -	DT_VERS_1_6_4,	/* D API 1.6.4 */ \
> -	DT_VERS_2_0,	/* D API 2.0 */ \
> -}
> -
> -#define	DT_VERS_LATEST	DT_VERS_2_0_1
> -#define	DT_VERS_STRING	"Oracle D 2.0"
> +#include "dt_versions_defs.h"
>   
>   /*
>    * Interfaces for parsing and handling DTrace version strings.  Version binding
> @@ -112,8 +36,8 @@ extern "C" {
>   
>   typedef uint32_t dt_version_t;
>   
> -extern const dt_version_t _dtrace_versions[];
> -extern const char *const _dtrace_version;
> +extern const dt_version_t	_dtrace_versions[];
> +extern const char *const	_dtrace_version;
>   
>   extern char *dt_version_num2str(dt_version_t, char *, size_t);
>   extern int dt_version_str2num(const char *, dt_version_t *);
> diff --git a/libdtrace/mkvers b/libdtrace/mkvers
> new file mode 100755
> index 000000000..82295b152
> --- /dev/null
> +++ b/libdtrace/mkvers
> @@ -0,0 +1,67 @@
> +#!/usr/bin/gawk -f
> +#
> +# Oracle Linux DTrace.
> +# Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
> +# Licensed under the Universal Permissive License v 1.0 as shown at
> +# http://oss.oracle.com/licenses/upl.
> +#
> +
> +/^\s*#/ { next; }
> +NF == 0 { next; }
> +
> +{
> +	if (match($1, /^[1-9][0-9]*(\.[0-9]*){1,2}$/) == 0) {
> +		print "E: Invalid version string: " $1 >"/dev/stderr";
> +		exit 1
> +	}
> +
> +	n = split($1, arr, /\./);
> +	if (n == 2)
> +		arr[3] = 0;
> +
> +	code = arr[1] * 0x1000000 + arr[2] * 0x1000 + arr[3];
> +	versions[code] = arr[1] " " arr[2] " " arr[3];
> +	next;
> +}
> +
> +END {
> +	n = asorti(versions, idx);
> +
> +	if (current) {
> +		$0 = versions[idx[n]];
> +		if ($3 == 0)
> +			printf "%s.%s", $1, $2;
> +		else
> +			printf "%s.%s.%s", $1, $2, $3;
> +
> +		exit(0);
> +	}
> +
> +	for (i = 1; i <= n; i++) {
> +		$0 = versions[idx[i]];
> +		if ($3 == 0)
> +			printf "#define DT_VERS_%d_%d\tDT_VERSION_NUMBER(%d, %d, 0)\n",\
> +			       $1, $2, $1, $2;
> +		else
> +			printf "#define DT_VERS_%d_%d_%d\tDT_VERSION_NUMBER(%d, %d, %d)\n",\
> +			       $1, $2, $3, $1, $2, $3;
> +	}
> +
> +	print "\n#define DTRACE_VERSIONS { \\";
> +	for (i = 1; i <= n; i++) {
> +		$0 = versions[idx[i]];
> +		if ($3 == 0)
> +			printf "\t\tDT_VERS_%d_%d, \\\n", $1, $2, $1, $2;
> +		else
> +			printf "\t\tDT_VERS_%d_%d_%d, \\\n", $1, $2, $3, $1, $2, $3;
> +	}
> +	print "}";
> +
> +	if ($3 == 0) {
> +		printf "\n#define DT_VERS_LATEST\tDT_VERS_%d_%d\n", $1, $2;
> +		printf "#define DT_VERS_STRING\t\"Oracle D %d.%d\"\n", $1, $2;
> +	} else {
> +		printf "\n#define DT_VERS_LATEST\tDT_VERS_%d_%d_%d\n", $1, $2, $3;
> +		printf "#define DT_VERS_STRING\t\"Oracle D %d.%d.%d\"\n", $1, $2, $3;
> +	}
> +}
> diff --git a/libdtrace/versions.list b/libdtrace/versions.list
> new file mode 100644
> index 000000000..8986d2007
> --- /dev/null
> +++ b/libdtrace/versions.list
> @@ -0,0 +1,67 @@
> +#
> +# Oracle Linux DTrace.
> +# Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
> +# Licensed under the Universal Permissive License v 1.0 as shown at
> +# http://oss.oracle.com/licenses/upl.
> +#
> +
> +#
> +# Version definitions
> +#
> +# These definitions are used to generate dt_versions_defs.h.
> +#
> +# The generated file contains:
> +#  - DT_VERS_* defines that are used in identifier tables to fill in the
> +#    version fields associated with each identifier.
> +#
> +#  - DTRACE_VERSIONS which is used in dt_versions.c to populate the array of
> +#    valid DTrace versions
> +#
> +#  - DT_VERS_LATEST which has the value of the most recent DT_VERS_* define
> +#
> +#  - DT_VERS_STRING which provides a string representation of the most recent
> +#    DTrace version
> +#
> +# Refer to the Solaris Dynamic Tracing Guide Versioning chapter for an
> +# explanation of these DTrace features and their values.
> +#
> +# NOTE: Although the DTrace versioning scheme supports the labeling and
> +#       introduction of incompatible changes (e.g. dropping an interface in a
> +#       major release), the libdtrace code does not currently support this.
> +#       All versions are assumed to strictly inherit from one another.  If
> +#       we ever need to provide divergent interfaces, this will need work.
> +#
> +# The version number should be increased for every customer visible release
> +# of DTrace.
> +#  - The major number should be incremented when a fundamental change has been
> +#    made that would affect all consumers, and would reflect sweeping changes
> +#    to DTrace or the D language.
> +#  - The minor number should be incremented when a change is introduced that
> +#    could break scripts that had previously worked; for example, adding a new
> +#    built-in variable could break a script which was already using that
> +#    identifier.
> +#  - The micro number should be changed when introducing functionality changes
> +#    or major bug fixes that do not affect backward compatibility -- this is
> +#    merely to make capabilities easily determined from the version number.
> +#    Minor bugs do not require any modification to the version number.
> +#
> +
> +# Ver	Description
> +1.0	D API 1.0.0 (PSARC 2001/466) Solaris 10 FCS
> +1.1	D API 1.1.0 Solaris Express 6/05
> +1.2	D API 1.2.0 Solaris 10 Update 1
> +1.2.1	D API 1.2.1 Solaris Express 4/06
> +1.2.2	D API 1.2.2 Solaris Express 6/06
> +1.3	D API 1.3 Solaris Express 10/06
> +1.4	D API 1.4 Solaris Express 2/07
> +1.4.1	D API 1.4.1 Solaris Express 4/07
> +1.5	D API 1.5 Solaris Express 7/07
> +1.6	D API 1.6
> +1.6.1	D API 1.6.1
> +1.6.2	D API 1.6.2
> +1.6.3	D API 1.6.3
> +1.6.4	D API 1.6.4
> +2.0	D API 2.0 Linux (BPF)
> +2.0.1	D API 2.0.1 Linux (BPF)
> +2.0.2	D API 2.0.2 Linux (BPF)
> +2.0.3	D API 2.0.3 Linux (BPF)
> diff --git a/test/unittest/dtrace-util/tst.APIVersion.d b/test/unittest/dtrace-util/tst.APIVersion.d
> index 85108c027..3b2baaa60 100644
> --- a/test/unittest/dtrace-util/tst.APIVersion.d
> +++ b/test/unittest/dtrace-util/tst.APIVersion.d
> @@ -1,18 +1,13 @@
>   /*
>    * Oracle Linux DTrace.
> - * Copyright (c) 2006, 2021, Oracle and/or its affiliates. All rights reserved.
> + * Copyright (c) 2006, 2025, Oracle and/or its affiliates. All rights reserved.
>    * Licensed under the Universal Permissive License v 1.0 as shown at
>    * http://oss.oracle.com/licenses/upl.
>    */
>   
> -/* Assertion:
> - * Use the -V option to printout API version.
> +/* ASSERTION: Use the -V option to printout API version.
>    *
> - * SECTION:
> - *	dtrace Utility/-V Option
> - *
> - * NOTES:
> - * Use /usr/sbin/dtrace -V on command line.
> + * SECTION: dtrace Utility/-V Option
>    */
>   
>   /* @@runtest-opts: -V */
> diff --git a/test/unittest/dtrace-util/tst.APIVersion.r b/test/unittest/dtrace-util/tst.APIVersion.r
> index 6bc7b9d72..0d88b694e 100644
> --- a/test/unittest/dtrace-util/tst.APIVersion.r
> +++ b/test/unittest/dtrace-util/tst.APIVersion.r
> @@ -1 +1 @@
> -dtrace: Oracle D 2.0
> +dtrace: Oracle D x.y.z
> diff --git a/test/unittest/dtrace-util/tst.APIVersion.r.p b/test/unittest/dtrace-util/tst.APIVersion.r.p
> new file mode 100755
> index 000000000..8da4f22c1
> --- /dev/null
> +++ b/test/unittest/dtrace-util/tst.APIVersion.r.p
> @@ -0,0 +1,12 @@
> +#!/usr/bin/gawk -f
> +
> +# We do not care about the actual version number - we just want to ensure that
> +# a version using the correct format is reported.
> +/dtrace:/ {
> +	sub(/[1-9][0-9]*\.[0-9]+\.[0-9]+/, "x.y.z");
> +	sub(/[1-9][0-9]*\.[0-9]+/, "x.y.z");
> +}
> +
> +{
> +	print;
> +}
> diff --git a/test/unittest/options/tst.version.r b/test/unittest/options/tst.version.r
> index 15010b3db..8b1378917 100644
> --- a/test/unittest/options/tst.version.r
> +++ b/test/unittest/options/tst.version.r
> @@ -1,2 +1 @@
> -version is 2.0
>   
> diff --git a/test/unittest/options/tst.version.sh b/test/unittest/options/tst.version.sh
> index ffffcdd8b..37fb6f752 100755
> --- a/test/unittest/options/tst.version.sh
> +++ b/test/unittest/options/tst.version.sh
> @@ -1,7 +1,7 @@
>   #!/bin/bash
>   #
>   # Oracle Linux DTrace.
> -# Copyright (c) 2023, Oracle and/or its affiliates. All rights reserved.
> +# Copyright (c) 2023, 2025,Oracle and/or its affiliates. All rights reserved.
>   # Licensed under the Universal Permissive License v 1.0 as shown at
>   # http://oss.oracle.com/licenses/upl.
>   #
> @@ -9,7 +9,6 @@
>   dtrace=$1
>   
>   myversion=`$dtrace $dt_flags -V | gawk '{ print $NF }'`
> -echo version is $myversion
>   
>   $dtrace $dt_flags -xversion=$myversion -qn 'BEGIN { exit(0) }'
>   exit $?
