Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85A2C1DC721
	for <dtrace@lists.linux.dev>; Tue,  3 Sep 2024 19:54:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725393257; cv=fail; b=foYJqqzSSxBcN+o1GyH1SmKjAj6+t0bIppEAeGsTSfm5PrwLj7sOsdqlNGk9fPf1eugu2sb++l37IsuUSGa4SvRe4g3oUyg+lD1NWGwanMqyJDxWj7r8feuMkIqkP4oANjwNRsoQFGDjDfF4fSwqPhVoY5qGoH1/uzAKO0WcucE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725393257; c=relaxed/simple;
	bh=VT0wZkzQJZv98dYMmMRa76FFFdRiOAqYzScv0lbV9nI=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=aP4/kZoVq5GTjOOSostMZ1oJmKSyjSQZP2yEilNarb1C02pUNgXBdLUJ3KtPnV8fBcBkGRjxysPKYR/lBugx4bPY4iZ2eZOatXgHQnC6JtlGhFOOhwlpdf4Qua8uRADDlkAhCRvTqAfGC1wCYrW7K2ZzNRGZaeTAYprDzPzQSqg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=T+Je6N2V; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=kihq4/zj; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="T+Je6N2V";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="kihq4/zj"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 483JXVJm026185;
	Tue, 3 Sep 2024 19:54:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	message-id:date:subject:to:cc:references:from:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=
	corp-2023-11-20; bh=9n5EJFc49e6TA2QvBPV9QAkhZeWvQdOJzKOdWP5mbiM=; b=
	T+Je6N2V226eyWNqxnKoUpBrgaGio4svb2ietzGqRuML+Zbypl5hq8LipXYGxSCZ
	sYmuGnKUYYEqzcBMzidQRtvvFbHhyF+1dcyuz+aa7gJiHqrb10J0prRdD6p37EmC
	L01OwHXyVHm+uz4oJxiVuwOotvtvcUYZGsfHDNGO1gLPe7D19QZo/0WM6uIFOFQT
	UmmPdkHovfSdwfCyZagHb2d8pbOousrdgnT5CmxLbruFSylujfgh1Gd7J5hVVPOF
	x8unIOkTbltKRfNo98ZPQ6//7TT/HBoL714svOjTUa7hfizmiF8aFKeZP5UnUDIS
	xxO7ZE+i43IWaB/eSBGkNg==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 41dr0jt5br-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 03 Sep 2024 19:54:08 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 483JMG1x023683;
	Tue, 3 Sep 2024 19:54:07 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2046.outbound.protection.outlook.com [104.47.66.46])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 41bsm8nqcj-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 03 Sep 2024 19:54:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RnDDKtkycGVltKBYRCIaC93FoKEce2ApHKmRKz4MH2st1cjurbvQAf1Az0fMStQpiL6C/i2Ej3NYAgDHgT2aAVwUlZOUqKTu/ueIKFD05yoYauv1cI1VDJNVn4uD4gQn+LagFFJpGHEwkvwvkxgAnkRPi+PwP6FiDNQRrEt90L079yPe0N6222yba+UwnCaDCWpJm2wBU1mrMGfieOwHAmZ/7w9w+VcSURmUakWmuWDWod2lmvQoF4axBYI+soCOndh1Vu/OwbB3TGtufqiUDH9/jdlul+tQDT2J0I58d/c5T2ytrwXTRTXQsRleaGValId5p1GTnkCYifMchuxdLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9n5EJFc49e6TA2QvBPV9QAkhZeWvQdOJzKOdWP5mbiM=;
 b=gnQLtQWPOw6rwBhHqK6UTyG87zNll5RT8UNzHqQxq23YZMe5X23Y+AVSUackL9VOmomSPZd9V9u+mvIgqe72f8UdWeg4hQuLLmMKNopKKvWjBWjlRPQb2vCxBP9iDIz5AjQagM5KkBOvCufp0//cK4TYpxwfzX61eI53t7ADIgBO2Zh9CbNQJu5iBMYf6JN35t+E76rL0NkYSzQnS5g04UPRRJmJe1wHTjO4C51xc2rr9K9TdKgOREIMZrWP27nusT+rAp1uzyq3X+x8EmmUfgXUezjIzJF7VDtYio8uly2I9k7t2EkOBlvuLOGvgKNiuqK+tRPhkOHmL/FPvj7hug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9n5EJFc49e6TA2QvBPV9QAkhZeWvQdOJzKOdWP5mbiM=;
 b=kihq4/zjU4HSBErTKgAJ2GJR7KRdear1QJtBfnGA/6lQMGVsPoeWgMP1CJoQUCtz+Pyan/ZeFMDICdsIDqd/TxR9rCGhpaOtc5+Pf/5czqbzG8eH9Iu1jfGVjaPrC9rPr8jTFH/7vtOCbkZDm8nJWWkp9JnwCwkm52HFqp/a2VI=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by DS7PR10MB7345.namprd10.prod.outlook.com (2603:10b6:8:ef::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.10; Tue, 3 Sep
 2024 19:54:04 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%3]) with mapi id 15.20.7939.010; Tue, 3 Sep 2024
 19:54:04 +0000
Message-ID: <624d5187-cc30-e5dd-d7d0-e7e6aba2a3e8@oracle.com>
Date: Tue, 3 Sep 2024 15:54:00 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [DTrace-devel] [PATCH 15/19] Ignore clauses: some clauses are
 impossible regardless of uprp
Content-Language: en-US
To: Sam James <sam@gentoo.org>,
        "eugene.loh--- via DTrace-devel" <dtrace-devel@oss.oracle.com>
Cc: dtrace@lists.linux.dev
References: <20240829052558.3525-1-eugene.loh@oracle.com>
 <20240829052558.3525-15-eugene.loh@oracle.com> <87ikvjf4ua.fsf@gentoo.org>
From: Eugene Loh <eugene.loh@oracle.com>
In-Reply-To: <87ikvjf4ua.fsf@gentoo.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MN2PR08CA0009.namprd08.prod.outlook.com
 (2603:10b6:208:239::14) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|DS7PR10MB7345:EE_
X-MS-Office365-Filtering-Correlation-Id: 91c05ed5-9ff2-47a2-ca29-08dccc522a1a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UCs3eGRWNXRMZW5xYjRUZVZXcjFsTVc2OTU4V2E1aTIrbmVzWHpnWHdQZ0ww?=
 =?utf-8?B?SjVtdnpwWjZyKzBTQmR6NklmeThjQkdNOHR6VnoxclRSTHF1aUpjNHJFUkkz?=
 =?utf-8?B?TXI2SjUvb0thVFV2TDBwUFYzTHBvZXdmdEVtL25mWHhMUkxvRUozZC9LaWVt?=
 =?utf-8?B?NDB2RG1oN0J6RWszL3hKWWVqU1ArQy9SWjNEMXZZVFJ0MGdTY1pJbHh2b0lo?=
 =?utf-8?B?MENXSCtXUnhDa21BK1djQ3g5azdxSDViU0JzU3l6SitmQmZjMHdVaENZdmh5?=
 =?utf-8?B?VGxSaDh5eVY3VnhoeVRobEhuSHUrVHptM2JwRDFrSW15TlN0cmNOWXEyR3VF?=
 =?utf-8?B?dmo2MFlPQzdrdE9wM1duRFlDREVKRGY0Rjd6UktJWUt1RVMrdGNsL29MZHYy?=
 =?utf-8?B?bHRkZklDQ3J5RFVUU05yK1M0bzcwbHBwZTZWTSs2eEFrMjdEV1I5UEVJT1o3?=
 =?utf-8?B?azdzWWZDM09xcXlnNWhUa3QyenZocDVIVGpYT2YwMFdjaWljUXJBTzlPNXRw?=
 =?utf-8?B?My8rQ1dYN3N1NTA3NEhUSVpac2d5WGxER2EyM1UvcmJPYVd3SjdQeHJJc25q?=
 =?utf-8?B?aGRJSWc2QUN0dWo5TkpNcGM3SnBBc3IzbTd2K3ZiYlZlNXVqbmc4ZEVBVXlJ?=
 =?utf-8?B?MXJPRVN2QXNGMTFzdk15OWtCTHEwNkRqL3VEM0VWbHlObDZTTE85V2JYQm9q?=
 =?utf-8?B?MWlSZi9IcVYxa2p5a1M5TnhRWFFLRWIzTE4zTC9NOFE1dTVtSTZFWlVjRzJB?=
 =?utf-8?B?R3NpK0RkTERHSURrWmN5S01vbmV6NDBWclBnQXdtTWl3LzBJclhrZWNCb2RJ?=
 =?utf-8?B?MzY4QUp4ZEl0Vk9wUzczcllYcE16VG01dGVXMGFJZ25qaUVlMkN5RVk4RGlp?=
 =?utf-8?B?YlpYQ3JiYlc1Z2kzdUh0RFRsdGhHN0taRzNBNTBCc1czVTlGYm1PcUs5OTB0?=
 =?utf-8?B?RXJaR2dMMzlrRkVXcFkwOXl4d054Y3RCRUVYVzZoTEtac3VTR1dwQjBNNzgy?=
 =?utf-8?B?NEZuUmtGenFvWDcwR25LVnFWUmdnSVA1dXRaQ0FwaCtEdDkzeWlzVFI5RXNy?=
 =?utf-8?B?WmVUdWs0eXYwQjV3a3FxbHNiUWV6bVg3N1RTalExaStydXZmQjVVN0dYUmdU?=
 =?utf-8?B?MzFzdktqakluSnJxWnpiSHNaTkFPUGJrV1F1cGt5bHhJa01MdnhVU0NwdUlU?=
 =?utf-8?B?OHd2blpSYmRhVHBtUFZxTU9FWHo5ZTVKS0daUkJCV2owb3QyTi9vUitVWEpv?=
 =?utf-8?B?UjdadnNsMnY4L2VyQ2tFWEZadEI3NTROcDZLdGpkSlFVNzJsRkxRZy9EcndB?=
 =?utf-8?B?Kzh5L3JBZmFCTHNieTBOcEZqai8ybks1ajk0YTNXUDRqeUcyMmYxc0ZYeS81?=
 =?utf-8?B?NUZod1FjZHE2VXlSS3lwRFZRWFdMQnQ1b3pPdzNwWmVVNU9CRGJqQWZsNVdr?=
 =?utf-8?B?NWdDOWFocmhtSzVJckM3akwrMG5KZC92MEIrSlZaZlNKOGJRY1F2bzZDa1hC?=
 =?utf-8?B?ZVJuVnlnRkhpMHFSdlZhVDZEc01KUi9xcVYrTGduTXRJMlVOcUI4VWdHaElr?=
 =?utf-8?B?N0FFdnc4WDc3bExYVGdMVjhSdFFwWE8ranJVcEtsdS9KTEdxdHdoQ3ZTTVZp?=
 =?utf-8?B?MEdoM0tqNEF1VGRlOVlRa04rTC9JWEc3UDNZWEFKL0dJMUFKejF5NWtDTWQy?=
 =?utf-8?B?eDJPNkdCdjVRdWxVbEJyODR5RHNHeHQraXY5YlR6UlBDa0srRmVwTGdtOUsy?=
 =?utf-8?B?QWNldHlKV2w3R2F1dzJpellxTkdaUFpRdlRpVDlxTFdwVGZ0eHo3aG5kdEJS?=
 =?utf-8?B?S0E1dlVYMUg5K251V2U1QT09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TmhJeW4xZUJQSC9UbTVpWE1kbkJDN3JZaGdYays2cUFtbUQwdDg5N2hZSVJO?=
 =?utf-8?B?b25ZRTFiaytPYlo3d05tQWlCT29iWisyZDkrRHdJemZIUXBDM3hpT1YwZkNB?=
 =?utf-8?B?cWZKSTVldDRaOGZ6WHBMMjYwSG80OXhSTXh3TTNQc0xNVUZreVhyMjdTRnpy?=
 =?utf-8?B?QStwdllDVXpWUXpOaTEyYUo5TWg1SDNVRFlRVUlYNzBOWmg5bE1WRGxidGRY?=
 =?utf-8?B?dkJ1TjAyeDIrSUVqU2JSK3RWMWhnQmtTZElUb21jMnU0ODZYMTZYMEhyT3hE?=
 =?utf-8?B?N0pyM1VmZWNlc0JRN2ErZitFNFJnWDdqY1dIOXVsUkd0YlJOSllkL3pOVUoz?=
 =?utf-8?B?bXVuMlNsYlBTTDlUa3RKMUU5eVpqV2ZBWm14cktBZ3phRG11Um1GNUdCTkFC?=
 =?utf-8?B?UThCR3hyenRBVHV4NHdibktTZVV1SC8vcGpDUHBzTEVsbFZUSGp2dDRxYWl4?=
 =?utf-8?B?QitBUFJYMExhN0hlSDJmZldSOWIrckY4RCtmd2MrMEJWbUU4dCtRYVlzN0Vh?=
 =?utf-8?B?ckJjZE9yOHZYd1FROTlKak43NVVWKzdSd0lsSG9kSGtHcnh5S2xNd29jSnVz?=
 =?utf-8?B?NXhvNXVDYSthcDRiV05QMStIQXIzbkZlcW9vMnBHWjl1QlY5Q0JUbGVtZnFs?=
 =?utf-8?B?MVlpS2NkSDJ6WlVSeUVXdjZmR1JnaHlrcWNHYTVPbVRUU0tHV0JtN2U3QkZJ?=
 =?utf-8?B?RTBoZXdZMjBPcWlCY2lRa3FuVkpaTS9WWVh5ZGxGcW5RUGFMeVJ0d2JMWVU0?=
 =?utf-8?B?dGtRVTJPVi9zU3p2R3B4MnZ1b1dhM1hrZzVMaG82Q01RcFVzekp3NHBnUllX?=
 =?utf-8?B?SE8zSUdPbHpybEVIMVNXNXE4dzNZSjd2MlFsSDV6cE1jTlFDZ1B5U2RpeXZT?=
 =?utf-8?B?L3pUK240aVNxVnpCYndWQ2hkQzVtRTZ6WGVOeTZTYm5kblV3Z0cyOEtWT3Ja?=
 =?utf-8?B?UXNoRGxtbXc1bjUrVW16a0Z0QTlhdXE3WDJPZHNLa1pZMHROTFNWaWZQYjVl?=
 =?utf-8?B?YzFrNDZPWGFqQjd4Y21sc2tWTW1KM0xUT3ZYR25QWWRyaFQ3TCtsQlFRZ2lS?=
 =?utf-8?B?SlZNdmdoZk1yYk0rYTJtclpiMGJydmpOZTBKUlhmK3BEcjRPdlBSQk96Vmhs?=
 =?utf-8?B?bzZsTFVxWFVpNUtyZ0RXY1NvYmg3QVE1TjgvM2dBcDlHM2czS0o5YUdCcmpi?=
 =?utf-8?B?VWVJdnkvRDVvaHNZYUw0bEVVRzJ2Rit1cWQyMG5QMmdGeGNEcDFUeFVTOHR6?=
 =?utf-8?B?TEN4V0loQVljRTlzMTJ5MjhoUTVwM05qbG9Lc2tlcFJidHA4ZDhTcWRRRVJP?=
 =?utf-8?B?cXJRVXdNSlJqRkxXbXhMTXZYMEhGSlNweUlaRzgwVHJuQ3RudGJVbi9xcVRF?=
 =?utf-8?B?RmFQZnh6QUNTWW84VDBvSGl3TVNvdDllL1RDNjZjdDd0MkZqMDhEbnhJZDNw?=
 =?utf-8?B?K3M1QlNwSTBWUWd4VEMydG8xRlkxOTRpKy9jRnppRGNseFJlVzQrOW9ieUR2?=
 =?utf-8?B?WWJac1Z4V3BMS1Zab2R0a25GQTlrN3ZnRm82cmFxMG0wVitmY2lFR3NnM0Iy?=
 =?utf-8?B?R25xLytnMFNTNThXUW9IUDdOQlhsdG52Z1lEVEhkSCsxTjUrTkYwbnpkaHJz?=
 =?utf-8?B?SUpHWGVxQXBEaUd5MXRuSkE4S3JRZkl0WFNTM01EQnlybXRKUHhGRURIVFlK?=
 =?utf-8?B?dHhoc1RFa0M5RzNMWkNwTFV1cVBNeWpVOEJYcUMzVTgxbHo0Q2IzMVI5aEhL?=
 =?utf-8?B?ZGZvR0x5U2M0R3p1OU5aWVk2VmJ6WHU2OGdYeE9qcDZoUjhDdS8wbGVWZDFP?=
 =?utf-8?B?ejRDbWdhV3FCM3FDR1R2NlpxZktJUGt5Q3lKckxwTnlZZmF6UEVEUXZaYitW?=
 =?utf-8?B?S01wMEc0THI2MVZuV3hQa21NR2pUWTNqZloycGhpK0VZaWlmcEV0MTNqRFps?=
 =?utf-8?B?SHhMQ1VJMXpZaHZKWmh6TTgwQzNyZ0hoRk5jV0xPbmdGVzhYb2QweVNocFlL?=
 =?utf-8?B?YUlhYWVxSjEvK0ZyRTcyS3RWa3RVUExuUEhVSVM3dGdlUVEvNXBjaGZvd2F2?=
 =?utf-8?B?OHFVMzNzZ3hqTEdackxmUHU1TC9SZkE5SjR3WW9EcGRFRDZSMUFuN2o5MXZQ?=
 =?utf-8?Q?GJ83pQQfbSB9+FSD5OVl/f72V?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	BoOuukOkvJ9AZnF8vggx2U560ce4Vs7ZxxJwmMO7CZ7qkMp9Rx6NE1KG2I2Ph7GpfWGwdEefrQ/TpFzgKn2PtyLAHLzehipgjVaSWRZtuyuLGZM9GU5RN9o1LtX6UF/1SUx7JuBSHMwstyGAvdr9ofYB06+FcYpOp/865zhf0uo+ly+gSo0CsFEBAXCcbePcGCogtWSlLuAX6oRg3CU+yyrcn+WJIVpUDaEmVO571eQnShwpzKlArH6BYwr6kvnrma11qQnDZdlf0EYMk/0Avp5Gc0/VBZf0ySh7VjIxNbABgt6N0sC+p1y/jimYJK2zQT+91I9fi6RddXJdo6bxe4jucL4l9jOJMhtt87vXPxKPFn4CX0Dtm11fdXWRxmBVtzkuE20mdcWpSH4ur7MK8ipSEUGrCXDeCCU43wsx9UQb3wSCrodbYPl8nH9xh/s+hruISEAiBXbMoHmdwwDJs0oJ59aCu4sk2URQGlTtR65sX/zXK3sz4hEpjDEJOJVnPrlxlqG1dOZuvoyPKYQJW4MilCHKREc8huPfnl9/3quJyZuWAPbEd50Ngv//xgF4Az8y3kWngqTkI6WYVtF513wG/j/P0nXzl47trQiakko=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 91c05ed5-9ff2-47a2-ca29-08dccc522a1a
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2024 19:54:04.7131
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dLlowza4OuCRVH5caC3AQQHrjC3jL89WG5GJrSu7S8PYyXeQreh1ihvBW6R1H4brcvqT4dhO4rg5i7tWX7RGLQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB7345
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-03_07,2024-09-03_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 suspectscore=0
 mlxscore=0 spamscore=0 adultscore=0 phishscore=0 bulkscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2407110000 definitions=main-2409030160
X-Proofpoint-GUID: fCETVu5bze6GTcr1mKCJbVH12rZ4yqL_
X-Proofpoint-ORIG-GUID: fCETVu5bze6GTcr1mKCJbVH12rZ4yqL_

On 8/29/24 16:31, Sam James wrote:

> "eugene.loh--- via DTrace-devel" <dtrace-devel@oss.oracle.com> writes:
>
>> From: Eugene Loh <eugene.loh@oracle.com>
> Not that it really matters here, but I wonder why not an enum?

Yeah, good question.  No particular good answer, I suppose.  If someone 
wants it, I suppose I can revise the patch.  I would say that this would 
not be the most striking use of #define for enumerating values.  E.g., 
DIF_SUBR_*, DOF_SECT_*, DTRACEFLT_*, DTRACEOPT_*, DTRACE_STABILITY_*, 
DTRACE_CLASS_*, DTRACE_CONST_*, DT_IDENT_*, DT_LINK_*, DT_PRAGMA_*, 
DTRACE_CONSUME_*, DTRACE_STATUS_*, DTRACE_TRACEMEM_*, DTRACE_AGGWALK_*, 
and DTRACE_OBJ_*.  All give symbolic names to sequences of integers 
using #define.  There is strong precedence for the practice.

>> diff --git a/libdtrace/dt_prov_uprobe.c b/libdtrace/dt_prov_uprobe.c
>> @@ -232,6 +233,10 @@ grow_strtab(dtrace_hdl_t *dtp)
>> +#define USDT_FLAG_UNINITIALIZED	0
>> +#define USDT_FLAG_POSSIBLE	1
>> +#define USDT_FLAG_IGNORE	2
