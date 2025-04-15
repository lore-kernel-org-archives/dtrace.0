Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 865F61FDE0E
	for <dtrace@lists.linux.dev>; Tue, 15 Apr 2025 17:12:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744737127; cv=fail; b=b2VlZDLYerUqYhH/M1BFiG8xdUWkFFJHy/u5OnyUgV3NlZP4ro8VMuXnQRMfIszwo5m7ZNIQ8C8tujM03EN49vWzIq/1P04nCo3Oo6xkeOiesxUpVc0EfFYhhOzjl36gsqgfU0z7M9mjEKowpvzn+VqSozAa5ktwJVBmaQ2RKzE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744737127; c=relaxed/simple;
	bh=u9QGz+MW0wYS2Z0U4t/UMRadlxGH2agRwsKLTldez+U=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=IikZDqh59VD+59k1J6AJ+02OFgj2ytWz/FaHb2s4/AIE/dZzQjIwo8dgBj4upPcdm4C/m14FGDcDkfoEmYShYxklxgkfdy7fT0pOZO3coVWIQv4JYx9XOOv86rB2pog9b+WtQAJ+GDTkD4Aa3wEjKSuufw2qdy7kHOUbYw2nRqE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=eSDBZDp+; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=JfE6HuiR; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="eSDBZDp+";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="JfE6HuiR"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53FHC2L0020270
	for <dtrace@lists.linux.dev>; Tue, 15 Apr 2025 17:12:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=jVf6POsSBPBYdbSJDoD4cjMs8wgomW9xCTcTMlQGniQ=; b=
	eSDBZDp+Yvt3mEbgzihbvQ8ESxgmrknixedp8wZT71bD7IvvpRw7jgap+8PBpc/I
	e/bp8m1lo4ffoWJZnwuzJ1nVZg7Npwb+DKPTREufTIzYtio7gJLLW1/eMiZszIsD
	Cc60hD9xJx6TI89FubfFcsig5JNiPyQ1vJ/gLTQf711gjdl/vij4GeZ1ZcU2/lPH
	Ns/665dGsSzsRuqNLuWGV4h6UyxH9iKgNehHq4nGyP59aDdm70l7e1Q+IeeMV+7g
	Bu6zI8VFLEcdj4ugOE3Q0+Gh9Ri6ESZ0Hz24cb30s5DhYKnxAGnS++NP1f3zQRnP
	PFtUfdVfP6qSKu5bNzDUCQ==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4619442298-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 15 Apr 2025 17:12:04 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 53FGkhp0031334
	for <dtrace@lists.linux.dev>; Tue, 15 Apr 2025 17:12:03 GMT
Received: from ch1pr05cu001.outbound.protection.outlook.com (mail-northcentralusazlp17010002.outbound.protection.outlook.com [40.93.20.2])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 460dbawxw0-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 15 Apr 2025 17:12:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZDSXzSw5CWytwxd7jtPAT2NaE76p78zrIngsga7FX10eVAM3/R3bImT9amYPhlBnLryUsqjKA4IJLLtqh4WxvMwQ/OcIVVBUoZNHccSjPEdIYy5uF5qH9e50cM4P+o/wP3h8jZ4sMWY7xlE/mPMZDWXa6LeiBrq1zm0RBTJO6JNnQ7g6gdY7Nvue536rbNg/SpP2i5gosqRiKobfiRjdMmbnQpNnzxx0YZbrLaskKIxKsKNMU/mzxcyL6RJLCl/P9DRr/TmQ/WI+D+Jq/Hz6UrDaWJnQioNARrtucou3j+G5lC63yWJKw4lJHYp7cWyPV4YWld2rIT/AUUQVa16pag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jVf6POsSBPBYdbSJDoD4cjMs8wgomW9xCTcTMlQGniQ=;
 b=Ix+P/XMMLxGimpGKVjsjsLTXp8XI/CaCAvKLbc7aWrdGHx6Zi8QTJQtvVQB6a5MQYB8RxXRqoN6gPbt++DGHL572/pjRPwBe9pgOCEh7e7m29TGNmyvYcHdr1F8jpHBylOBPumgKWBP6Eo6NIWkSq8VCaOQ5WMDnN5yWEfeZ3dcy7eIJ2nMlD0qfi9V2pWJZjeyXont9JN0sua6cwHAPr5i/uQ90eLFepiw0mUKwg1oLQLHqULewp1P2VW+Vv/ARI/CFEOR+rzzznLmJbixlEzyvBejbM8wICQSydnCoB3J9uuspH7e2GYvdqFYQuDySQBQhK08YkiwY+k4ZPVZgDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jVf6POsSBPBYdbSJDoD4cjMs8wgomW9xCTcTMlQGniQ=;
 b=JfE6HuiRFDxUdslFr0c+kef3Rjtun5b0OR1nMQD0mE9tafeuv3krPDjMV+ZF3Hi0K2pt9YkXdEcsc7elTkfGTd6ULHqQBh2bQ8UtWtkP3ZAdJ1QlnVSBSHWGFqdvQAqPpnHEcLtuizzZ5yR/9OcwhGf9PPi5ugdJWAm8U5aPSC4=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by DS0PR10MB8077.namprd10.prod.outlook.com (2603:10b6:8:1f9::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.32; Tue, 15 Apr
 2025 17:12:00 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%5]) with mapi id 15.20.8606.029; Tue, 15 Apr 2025
 17:12:00 +0000
Message-ID: <c0bed1b0-b403-6de5-0b04-981daf2bc37c@oracle.com>
Date: Tue, 15 Apr 2025 13:11:57 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v3 2/2] Clean up sched provider trampoline FIXMEs
Content-Language: en-US
To: Kris Van Hees <kris.van.hees@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
References: <20250403050252.15239-1-eugene.loh@oracle.com>
 <Z/mAC5DG2gl0W8Sn@oracle.com>
 <f9f7221d-ee7c-b10c-b677-de3b38d86181@oracle.com>
 <Z/5KChRZYc4M1eIp@oracle.com>
From: Eugene Loh <eugene.loh@oracle.com>
In-Reply-To: <Z/5KChRZYc4M1eIp@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BN9PR03CA0282.namprd03.prod.outlook.com
 (2603:10b6:408:f5::17) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|DS0PR10MB8077:EE_
X-MS-Office365-Filtering-Correlation-Id: d03a24b1-10e1-4431-cc4d-08dd7c40a28c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YVQ0V0ExSmVqazdQSzQrUjNwZkhVZlQzVDJZS3FOY0EvMU14Rk0zcmQzcDYx?=
 =?utf-8?B?RTlhOTNrOGZycXdOQTVSQm1PQnVubktHNmFIUW1hUzRGZi9BeU9iR0JjLy9n?=
 =?utf-8?B?aitkZE5iRlF5T3hodDc2ZFEwN2hMVDgxZHdyTmM4K0dQSDJUZ3V0YXdOSVRS?=
 =?utf-8?B?c3k3SzVjSW9iY3NiRDZ4VXBjVW8yZWNLWWdxTWFycE1oWnVSVmgvejd2VXYr?=
 =?utf-8?B?TGZhNGIrZXVYWGUxeU9KeHBVQUZRbXk1bTdiZEZodjdja25iek9pWlRYb2ha?=
 =?utf-8?B?YTRhUi9teUtpMVRwaWdVT2pFQXhJUnEvVzlrWkFlNlhNVlFUZnZ4aTc4dllB?=
 =?utf-8?B?WEVycVRXQy9ZS1BIVVZ5MjVXb2VvUnRSek1yWFZOOUl5ekdTMHcxYzhiSmtF?=
 =?utf-8?B?b01DT0xGSTBwMXFIT3pIcFVRMzlUQ0FDb3ZFUjB4YnVKdnY1VlYwcDFQL3Vy?=
 =?utf-8?B?dU84UGdMZms3MHJwSWxIM3YxUmVYcCtUYjlQWW1JRSszRDJTVXBMaWNWMzRW?=
 =?utf-8?B?aUg0T25QN0l4OVdxOCs1aHRRUU1wNnNKSHUwNGx2T0MrdEdBL2locU9WbXJV?=
 =?utf-8?B?UkI0aGNxUno2VkhkOGlCSHFFN2hYR2gvL0NNWjdnOFBKSm9ra1JROWFKUkFW?=
 =?utf-8?B?dkw1TGtLeUhLdjhGS0tuZkR4QjBGamJZbU9ZdEgxbUpNRDhScmpVcnJwQ3hS?=
 =?utf-8?B?MlVmTkZuWVRLYzB0Sm5UeXkrb3lLY3JDTDYxYmZVakkvME82WlpaR1NDTUdD?=
 =?utf-8?B?Q2JMOWEzUHhjaFVpVjJyYkFPUzYzV29RL3BQanFSNUtqNC95T2tIYTIzLzBP?=
 =?utf-8?B?cFV6Mnd4Q0ptZ3ZrQlFrRVRBZ1M3bldIUTk1dG1OSmkxQzQ0NzNjMmxyNVgy?=
 =?utf-8?B?aWdYTVBaSWZuRVA5WlIra2RrUElQT2hzVEtUNHkzQTlVM0JOcVd3TTBvWjk1?=
 =?utf-8?B?QzMrNWg4Qlk3WXIyaFVzSUUzelFSNFBKdWptQjVDc1kvNGdVV1h4N3I4ZkdF?=
 =?utf-8?B?OUYzdFk3bnJtV3ZSN2pwZGU2RFoyRDl6Y0h1S01NNjY1TG5KQkdvU3dXYUFj?=
 =?utf-8?B?UEQyeEF5YlhmVk5sRGdBYkltbWRBN1p5MDMwU1ZRamhQSWpENngzSWhKRTF2?=
 =?utf-8?B?UEs4NjJUZy9kNjczd0tjSk9SZUpnSzhUZ29JWFNlMXhSWXpkSjc1YitROW1D?=
 =?utf-8?B?N3JVWFdkU3p5Q2puYU4xV2VZMmNrdjJvckRHaHQ1Qlp2eG56eHRmeHRMVXJt?=
 =?utf-8?B?RG16ZFlRaDNLOGtGa2VEQmdNOVYreGMyMGdoQkplTTFLaEZiNWl6S2pIaWZl?=
 =?utf-8?B?a2oxWm1tT2FMaGRoWTF2OEFGQ0JKb2VmVkxxSmFTa1BQSGRRR0FEektmWk5H?=
 =?utf-8?B?bXlBRDdvZXVPTVlVVVdiNW5IMlpJSmRJKzZSbjRiYTlXS0RDcllrUHhiZzhx?=
 =?utf-8?B?eFVWRkxzTGdCZVl5R211TEZWZm9hVTZ0RHppMTJNcEs5MFFRZHJMSnl5Szhs?=
 =?utf-8?B?U1NhTmVDamJPTTZkTThjZ2N4a0FCOGgydml0VG5tT2VyRzJuZHFpSWNqRldz?=
 =?utf-8?B?bzljckFtZEN0MHNsaXFqLzk5OHVNdDlzcUlpZElqZTc3S1crMy9JWWFNaE82?=
 =?utf-8?B?L0N3TWlPRFJCWUtmZ0ZJd3ZVbS8rTVhDMUxrb1hTT21rWkRsNXJzZVlyME5E?=
 =?utf-8?B?QXhrNktjUThiVHpKMkhPYmR1aFZ5Q3dRTEFPZXNwdEwxdzVncC93dDRNMXR1?=
 =?utf-8?B?ZnVQY2g0SFZiVmtFODFYV2hxTkR6ZVE0K1BBS2FwbVJobjdQVFc0RG90NmtC?=
 =?utf-8?B?ZlV1dW1GUDFpcERzMDh1cXhkZWY0RTZ4S0oxaXYzdDVDQ1phdWdVdnZucThK?=
 =?utf-8?B?QnMyUUlpUFcrQnhkc1V4dDM4QUVISWRad0FMeHdiVDEraWdEOFhoMkdoQXpi?=
 =?utf-8?Q?TlArVLspvcQ=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?azVJcFAweitnenZ3OUhqdVFNUUpJUWd4QzFXbDVRNDRsK1dTakZuZTd1Q3dY?=
 =?utf-8?B?RG5zVm5YV1NvczBtN0RhVG85UjRTZElCV2hYakZ2dVFBRjNCQUs5S1dHOXcz?=
 =?utf-8?B?UHhCZjl5TkZyaC9iVkVieFZBL3YrVkxyN0wvOVduV0w5RGxoQ0FVWUFDL2ZP?=
 =?utf-8?B?SzlaWE9ZYWtEb3E1MGxUdjF1MmNQNUhHajNRK0FLWUZDbWt1MHhpeTZnbTJN?=
 =?utf-8?B?anVCSDk0TFVYUWFtVVFEcFlJWlVRODhwc3U0OVVNWUtYWDVJLzRCcjI2NDF5?=
 =?utf-8?B?Zm5vdytaZ2xOSUlST3FWd1J1K0xPVTZNdVpZcThBRlgwd0FQS09ROXJKQkor?=
 =?utf-8?B?ajhTeGNEU0hFUkxBQ1QwM3FwYytsa0dacGhhV0hMVWlRdWZpV1l4NE9kdWRV?=
 =?utf-8?B?cHNhWmw3U2VFQ1Nub0M1SGtFSE4zZVlaRUlKWWc1bTFmd1N1RS9tM3haYW05?=
 =?utf-8?B?MDZ0dnk4N2dkaUc2S1o0MjRNYzJXSU9JTkpVbzMxQ3JtWlp3Q09UamdyTHFC?=
 =?utf-8?B?ZnBYK21pcVZidlJPdmZjUEJScjI2UFJqc3pGa3UrWW5xUE8xcWZUNGlrRmF4?=
 =?utf-8?B?eFJ5My9QN2hBeWVqcExrUTQwT21sWmFwYmZpYkRxeHpFNWF6dTZzMDNTemxx?=
 =?utf-8?B?dEVRbXd6MzFyelV3MlFBQ0RzTFp6S0FYcGd0RE1YZ2xlRktWUjFJK3BjNUc3?=
 =?utf-8?B?L3EwZzNDSTRSc3pKdFZvU0s1RjJGZURubHVWMlZEbHJXUUN1REhxRVYyTHQr?=
 =?utf-8?B?MFN3SC80NDRBaTlnalloU3BITDV3T0ZwNVRUb3FHWDVFaE9OcGJvUHN4WG9a?=
 =?utf-8?B?S1g1MWRaNXZHNG5zOE5OYVRqdTBsYW1MRWxMNkJzUzliZTZudWtpZ2F0SGdN?=
 =?utf-8?B?TFM1Wjl3bXR1Vk5uVHdDUHVIOVFocFlpTHFxYW5NTE1aU0JSZnJRZ1hlZGxN?=
 =?utf-8?B?Y3pET2hpQzRHZnI1TWtaSFkzV0M2cG1ZU096VTFMaVhZY0duaFFkZmV0Vmo3?=
 =?utf-8?B?aUtSeDJyV2tGQ05kYnhtZjAxeCtwbjd0TDF4Rk1uNStnVitUNWVFQWs5U2Nk?=
 =?utf-8?B?WEVPcjZiT0x0d25leVNPVGVsczM2V216ZENOVUJUZm5ubjlzcFYvall0TnpU?=
 =?utf-8?B?RFh2Mmk0c1FRbkNDbDBpTER6ckZOb3ZxNDBVaHpUYXZ6UEM4eVV5L0crcktB?=
 =?utf-8?B?b0VJdklaOVFrTXRGRjQvbm1LOHdBamI4YVA1R0lqUXNtSitMWXdmMDdFaXBo?=
 =?utf-8?B?N2pYZ3lZZ3VMVVowODNSTG9GRWV2cHlGQy9PSEZHY1V3Ui9YbHNFdWRVVUo0?=
 =?utf-8?B?eU8rMEQxK3NRL2NJTFZwa1o0bGRkN1FqbER1akJvclllN2dTa1A4ZGpucFds?=
 =?utf-8?B?S2d5MURVK2lZU1BLbDhFOTUwc0Vid2hPQmhmS1pPZUt5S3MzNzkwOGMxakhm?=
 =?utf-8?B?MkVTUk94ZUdOK25qL29CY3FLalRDK29XTTZpTFcxdkdjd0lTdEZtK2FkVlM4?=
 =?utf-8?B?NEh1WXBac3d5aHAwNUVpWWh1ZnUyRXNMM3NkT0xKa0lCWWtyUE4vTXFEN25t?=
 =?utf-8?B?UkNDeHNGSE5jeDJBWjBTcXBGNXE1WkExTXVTUnhoZHFnSzl1cWp6US8rRWJ3?=
 =?utf-8?B?N0UrSlZQbHJXTUNhb0gvb3V1SytrT3FaQ21yd2xpU0drNFNieEJ3TXhwZzhU?=
 =?utf-8?B?Q1g0L2IvSlJ1dUwxaVc0R0pNNGdJcEp5ZnFQVjROcUhpdU56Y21VeHdTc0Ix?=
 =?utf-8?B?a2dGT2JSbTlSZnlQT0YrblpWUFBOWHVNZkUvUlZyalVOZ3MxNi9LeWVtTkNk?=
 =?utf-8?B?SUJVaVJ6RVFaTmhCNmxEdXd0a2lrRWhoMlJGRm1kdU03MkZUeTkzR2xFb200?=
 =?utf-8?B?enY3ejdkVVlBMDZlaE5TYkkxUExkZkhsVkJWckFqcDRGVlg4Y1RXMEpzakNv?=
 =?utf-8?B?bmZrbGhrZ2JYMUhrN1F2ai9UTlZ1M204SXpId0RTUUc1b3Q5WktjY3lackR1?=
 =?utf-8?B?M3NNZ2I4TlVUREQ0Sm81L2diY3ZwRGZNV0hsMkFZT3J0c1pSTnE2cXIwMXJG?=
 =?utf-8?B?V0ZUclZhQ2U2Q202b0R5MWxTbFZ4SGwyT29PYkM1QXRTUjVkdytoZ1lGa3Ny?=
 =?utf-8?Q?Gvw3wR8kc/xKS2eRjIALNpnWU?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	3Qj2rYrXwIeWJ5hqxNsHvoYI9U1CFZgvURkxu/nw0yleFKt9BqnuZ/uL+ZtJgBNcNsE6Ib33S3E07LixUiZdl8AistMYYgu4rdRU26hwtIunlo4Ycw0oyb2gs2XUcskGpPuN4/lS8n2tO1RDPHqOj21gMKV1U78sEEIKV/E0qIP30+x/AkLnEH8+o+09rurHKL41jXWi3+pR2EAO03o2vPrl6jjjJ40g0EHre8r+F/+bD0RpXLyFGvxAmrXHw4asJzDAbMwTI16D1Nse+B8h62aTklpcnX+7u4vUanpkGy4cHjdJQs0NVzUf4RSlQ5QzWbRFjAbm4uQwuuFLXAFV/KtQ5WaNZf2pN7YW+/lrMICUPHo8QU5nKywh9yc6exLaxeJnqAKB1GWdJX5WInu+3NYeMtmng/2Y0KefgTJdfsqKL77N6ALkjSJuGArMGIkomkQnhcZulEPmD/oITjcDRAPv1qV80g+f12I8Wi0nWA9u2tQtuOUM79vqkokRHz2Sr6zdJiNGMDqASXYrqHbCOe5HGs5XQt06okxv6XPTTOrdzKqfnrwJ3lEuI0vqLXp1SIk9RDH1i/798pZbAxLScJWAi2pMhtxP0oF8r1/7aCo=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d03a24b1-10e1-4431-cc4d-08dd7c40a28c
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2025 17:12:00.5861
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zRhrXD9huMIxWNg/BxKFW2ukbuR2PYSFktzdXmaoVmUyEZJbIxZov16sfyWWmyDWsJEuwj+HvzFRYMWRi04FfA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB8077
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-15_07,2025-04-15_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 adultscore=0 phishscore=0
 mlxscore=0 mlxlogscore=999 bulkscore=0 malwarescore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2502280000
 definitions=main-2504150120
X-Proofpoint-GUID: WrzMOBQgLiqv_wh6ogKN9LHK1uj966kY
X-Proofpoint-ORIG-GUID: WrzMOBQgLiqv_wh6ogKN9LHK1uj966kY

On 4/15/25 07:59, Kris Van Hees wrote:

> On Fri, Apr 11, 2025 at 05:20:00PM -0400, Eugene Loh wrote:
>> On 4/11/25 16:48, Kris Van Hees wrote:
>>
>>> Partial comments below (still looking at the provider changes)...
>>>
>>> On Thu, Apr 03, 2025 at 01:02:52AM -0400, eugene.loh@oracle.com wrote:
>>>> From: Eugene Loh <eugene.loh@oracle.com>
>>>>
>>>> The sched provider trampoline for enqueue and dequeue probes had
>>>> pending FIXMEs for providing a cpuinfo_t* for the cpu associated
>>>> with the run queue.  Implement the missing code.
>>>>
>>>> Since the cpu associated with the run queue might be different from
>>>> the cpu where we are running, it becomes necessary to access the
>>>> cpuinfo for some random cpu.  With Linux 5.18, there is a BPF
>>>> helper function map_lookup_percpu_elem() that allows such lookups
>>>> on per-cpu arrays.  To support older kernels, however, we change
>>>> the cpuinfo BPF map from per-cpu to global.  Also, it is a hash
>>>> table rather than an array in case cpus are not numbered consecutively.
>>> I agree with all the above.  Good solution.
>>>
>>>> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
>>>> ---
>>>>    bpf/get_agg.c                     |  2 +-
>>>>    bpf/get_bvar.c                    |  2 +-
>>>>    libdtrace/dt_bpf.c                | 34 ++++++--------
>>>>    libdtrace/dt_cg.c                 |  5 ++-
>>>>    libdtrace/dt_prov_lockstat.c      |  4 +-
>>>>    libdtrace/dt_prov_sched.c         | 74 +++++++++++++++++++++++++------
>>>>    libdtrace/dt_work.c               | 20 +++------
>>>>    test/unittest/sched/tst.enqueue.d |  1 -
>>>>    8 files changed, 89 insertions(+), 53 deletions(-)
>>>>
>>>> diff --git a/bpf/get_agg.c b/bpf/get_agg.c
>>>> index c0eb825f0..e70caa6ef 100644
>>>> --- a/bpf/get_agg.c
>>>> +++ b/bpf/get_agg.c
>>>> @@ -21,7 +21,7 @@ extern struct bpf_map_def cpuinfo;
>>>>     */
>>>>    noinline uint64_t *dt_no_agg(void)
>>>>    {
>>>> -	uint32_t		key = 0;
>>>> +	uint32_t		key = bpf_get_smp_processor_id();
>>>>    	dt_bpf_cpuinfo_t	*ci;
>>>>    	ci = bpf_map_lookup_elem(&cpuinfo, &key);
>>>> diff --git a/bpf/get_bvar.c b/bpf/get_bvar.c
>>>> index d372b3445..d81c3605f 100644
>>>> --- a/bpf/get_bvar.c
>>>> +++ b/bpf/get_bvar.c
>>>> @@ -67,7 +67,7 @@ noinline uint64_t dt_bvar_caller(const dt_dctx_t *dctx)
>>>>    noinline uint64_t dt_bvar_curcpu(const dt_dctx_t *dctx)
>>>>    {
>>>> -	uint32_t	key = 0;
>>>> +	uint32_t	key = bpf_get_smp_processor_id();
>>>>    	void		*val = bpf_map_lookup_elem(&cpuinfo, &key);
>>>>    	if (val == NULL) {
>>>> diff --git a/libdtrace/dt_bpf.c b/libdtrace/dt_bpf.c
>>>> index 6d42a96c7..d6722cbd1 100644
>>>> --- a/libdtrace/dt_bpf.c
>>>> +++ b/libdtrace/dt_bpf.c
>>>> @@ -761,37 +761,29 @@ gmap_create_buffers(dtrace_hdl_t *dtp)
>>>>    static int
>>>>    gmap_create_cpuinfo(dtrace_hdl_t *dtp)
>>>>    {
>>>> -	int			i, rc;
>>>> +	int			i;
>>>>    	uint32_t		key = 0;
>>>>    	dtrace_conf_t		*conf = &dtp->dt_conf;
>>>>    	size_t			ncpus = conf->num_online_cpus;
>>>> -	dt_bpf_cpuinfo_t	*data;
>>>> +	dt_bpf_cpuinfo_t	data;
>>> Not sure about this, because (see below)...
>>>
>>>>    	cpuinfo_t		*ci;
>>>> -	/*
>>>> -	 * num_possible_cpus <= num_online_cpus: see dt_conf_init.
>>>> -	 */
>>>> -	data = dt_calloc(dtp, dtp->dt_conf.num_possible_cpus,
>>>> -			 sizeof(dt_bpf_cpuinfo_t));
>>>> -	if (data == NULL)
>>>> -		return dt_set_errno(dtp, EDT_NOMEM);
>>>> -
>>>> -	for (i = 0, ci = &conf->cpus[0]; i < ncpus; i++, ci++)
>>>> -		memcpy(&data[ci->cpu_id].ci, ci, sizeof(cpuinfo_t));
>>>> -
>>>>    	dtp->dt_cpumap_fd = create_gmap(dtp, "cpuinfo",
>>>> -					BPF_MAP_TYPE_PERCPU_ARRAY,
>>>> +					BPF_MAP_TYPE_HASH,
>>>>    					sizeof(uint32_t),
>>>> -					sizeof(dt_bpf_cpuinfo_t), 1);
>>>> +					sizeof(dt_bpf_cpuinfo_t), ncpus);
>>>>    	if (dtp->dt_cpumap_fd == -1)
>>>>    		return -1;
>>>> -	rc = dt_bpf_map_update(dtp->dt_cpumap_fd, &key, data);
>>>> -	dt_free(dtp, data);
>>>> -	if (rc == -1)
>>>> -		return dt_bpf_error(dtp,
>>>> -				    "cannot update BPF map 'cpuinfo': %s\n",
>>>> -				    strerror(errno));
>>>> +	memset(&data, 0, sizeof(data));
>>> Do we need this, because (see below)....
>>>
>>>> +	for (i = 0, ci = &conf->cpus[0]; i < ncpus; i++, ci++) {
>>>> +		memcpy(&data.ci, ci, sizeof(cpuinfo_t));
>>> Do we need this, because (see below)....
>>>
>>>> +		key = ci->cpu_id;
>>>> +		if (dt_bpf_map_update(dtp->dt_cpumap_fd, &key, &data) == -1)
>>> Why can'you we simply do:
>>>
>>> 		if (dt_bpf_map_update(dtp->dt_cpumap_fd, &key, ci) == -1)
>> I think the problem is that the BPF map has elements with size
>> sizeof(dt_bpf_cpuinfo_t).  Meanwhile, ci has size sizeof(cpuinfo_t), which
>> is smaller.  So if we do an update like that, the map will have stuff where
>> we want it to be initialized to 0.
> Yes, but I am 99% certain that BPF maps are allocated and initialized with
> zeros because doing otherwise would be a major security risk for the kernel.
> So you can count on that (should verify first to make certain but honestly
> it needs to be or else it could leak data which is a big no-no).

I don't think that helps.  We do not feed map_update() a size.  We 
cannot say, "Fill in only the first few bytes of the element."  We just 
point to where the new value is and the BPF function copies as much data 
in as it needs for the map element.  Unless we prepare a zero-padded 
copy of the data, map_update() will overreach and copy in values that 
should be zero but are actually data corresponding to other CPUs.

>>>> +			return dt_bpf_error(dtp,
>>>> +					    "cannot update BPF map 'cpuinfo': %s\n",
>>>> +					    strerror(errno));
>>>> +	}
>>>>    	return 0;
>>>>    }
>>>> diff --git a/libdtrace/dt_cg.c b/libdtrace/dt_cg.c
>>>> index 6dcf4cd3d..d83b1c2ce 100644
>>>> --- a/libdtrace/dt_cg.c
>>>> +++ b/libdtrace/dt_cg.c
>>>> @@ -1243,9 +1243,12 @@ dt_cg_epilogue(dt_pcb_t *pcb)
>>>>    		} else {
>>>>    			idp = dt_dlib_get_map(dtp, "cpuinfo");
>>>>    			assert(idp != NULL);
>>>> +
>>>> +			emit(dlp, BPF_CALL_HELPER(BPF_FUNC_get_smp_processor_id));
>>>> +
>>>>    			dt_cg_xsetx(dlp, idp, DT_LBL_NONE, BPF_REG_1, idp->di_id);
>>>>    			emit(dlp, BPF_LOAD(BPF_DW, BPF_REG_2, BPF_REG_FP, DT_STK_SP));
>>>> -			emit(dlp, BPF_STORE_IMM(BPF_DW, BPF_REG_2, 0, 0));
>>>> +			emit(dlp, BPF_STORE(BPF_DW, BPF_REG_2, 0, BPF_REG_0));
>>>>    			emit(dlp, BPF_CALL_HELPER(BPF_FUNC_map_lookup_elem));
>>>>    			emit(dlp, BPF_BRANCH_IMM(BPF_JEQ, BPF_REG_0, 0, pcb->pcb_exitlbl));
>>>>    			emit(dlp, BPF_MOV_IMM(BPF_REG_1, 1));
>>>> diff --git a/libdtrace/dt_prov_lockstat.c b/libdtrace/dt_prov_lockstat.c
>>>> index c73edf9be..8b2cf4da2 100644
>>>> --- a/libdtrace/dt_prov_lockstat.c
>>>> +++ b/libdtrace/dt_prov_lockstat.c
>>>> @@ -121,11 +121,13 @@ static void get_cpuinfo(dtrace_hdl_t *dtp, dt_irlist_t *dlp, uint_t exitlbl)
>>>>    {
>>>>    	dt_ident_t	*idp = dt_dlib_get_map(dtp, "cpuinfo");
>>>> +	emit(dlp,  BPF_CALL_HELPER(BPF_FUNC_get_smp_processor_id));
>>>> +
>>>>    	assert(idp != NULL);
>>>>    	dt_cg_xsetx(dlp, idp, DT_LBL_NONE, BPF_REG_1, idp->di_id);
>>>>    	emit(dlp, BPF_MOV_REG(BPF_REG_2, BPF_REG_FP));
>>>>    	emit(dlp, BPF_ALU64_IMM(BPF_ADD, BPF_REG_2, DT_TRAMP_SP_BASE));
>>>> -	emit(dlp, BPF_STORE_IMM(BPF_DW, BPF_REG_2, 0, 0));
>>>> +	emit(dlp, BPF_STORE(BPF_DW, BPF_REG_2, 0, BPF_REG_0));
>>>>    	emit(dlp, BPF_CALL_HELPER(BPF_FUNC_map_lookup_elem));
>>>>    	emit(dlp, BPF_BRANCH_IMM(BPF_JEQ, BPF_REG_0, 0, exitlbl));
>>>>    	emit(dlp, BPF_MOV_REG(BPF_REG_6, BPF_REG_0));
>>>> diff --git a/libdtrace/dt_prov_sched.c b/libdtrace/dt_prov_sched.c
>>>> index 3a218f3cb..a548e679f 100644
>>>> --- a/libdtrace/dt_prov_sched.c
>>>> +++ b/libdtrace/dt_prov_sched.c
>>>> @@ -84,6 +84,40 @@ static int populate(dtrace_hdl_t *dtp)
>>>>    			       probe_args, probes);
>>>>    }
>>>> +/*
>>>> + * Get a pointer to the cpuinfo_t structure for the CPU associated
>>>> + * with the runqueue that is in arg0.
>>>> + *
>>>> + * Clobbers %r1 through %r5
>>>> + * Stores pointer to cpuinfo_t struct in %r0
>>>> + */
>>>> +static void get_cpuinfo(dtrace_hdl_t *dtp, dt_irlist_t *dlp, uint_t exitlbl)
>>>> +{
>>>> +	dt_ident_t	*idp = dt_dlib_get_map(dtp, "cpuinfo");
>>>> +
>>>> +	assert(idp != NULL);
>>>> +
>>>> +	/* Put the runqueue pointer from mst->arg0 into %r3. */
>>>> +	emit(dlp, BPF_LOAD(BPF_DW, BPF_REG_3, BPF_REG_7, DMST_ARG(0)));
>>>> +
>>>> +	/* Turn it into a pointer to its cpu member. */
>>>> +	emit(dlp, BPF_ALU64_IMM(BPF_ADD, BPF_REG_3, dt_cg_ctf_offsetof("struct rq", "cpu", NULL, 1)));
>>>> +
>>>> +	/* Call bpf_probe_read_kernel(%fp + DT_TRAMP_SP_SLOT[0], sizeof(int), %r3) */
>>>> +	emit(dlp, BPF_MOV_IMM(BPF_REG_2, (int) sizeof(int)));
>>>> +	emit(dlp, BPF_MOV_REG(BPF_REG_1, BPF_REG_FP));
>>>> +	emit(dlp, BPF_ALU64_IMM(BPF_ADD, BPF_REG_1, DT_TRAMP_SP_SLOT(0)));
>>>> +	emit(dlp, BPF_CALL_HELPER(BPF_FUNC_probe_read_kernel));
>>>> +	emit(dlp, BPF_BRANCH_IMM(BPF_JNE, BPF_REG_0, 0, exitlbl));
>>>> +
>>>> +	/* Now look up the corresponding cpuinfo_t. */
>>>> +	dt_cg_xsetx(dlp, idp, DT_LBL_NONE, BPF_REG_1, idp->di_id);
>>>> +	emit(dlp, BPF_MOV_REG(BPF_REG_2, BPF_REG_FP));
>>>> +	emit(dlp, BPF_ALU64_IMM(BPF_ADD, BPF_REG_2, DT_TRAMP_SP_SLOT(0)));
>>>> +	emit(dlp, BPF_CALL_HELPER(BPF_FUNC_map_lookup_elem));
>>>> +	emit(dlp, BPF_BRANCH_IMM(BPF_JEQ, BPF_REG_0, 0, exitlbl));
>>>> +}
>>>> +
>>>>    /*
>>>>     * Generate a BPF trampoline for a SDT probe.
>>>>     *
>>>> @@ -98,18 +132,39 @@ static int populate(dtrace_hdl_t *dtp)
>>>>     */
>>>>    static int trampoline(dt_pcb_t *pcb, uint_t exitlbl)
>>>>    {
>>>> +	dtrace_hdl_t	*dtp = pcb->pcb_hdl;
>>>>    	dt_irlist_t	*dlp = &pcb->pcb_ir;
>>>>    	dt_probe_t	*prp = pcb->pcb_probe;
>>>>    	if (strcmp(prp->desc->prb, "dequeue") == 0) {
>>>> -		emit(dlp, BPF_LOAD(BPF_DW, BPF_REG_0, BPF_REG_7, DMST_ARG(1)));
>>>> -		emit(dlp, BPF_STORE(BPF_DW, BPF_REG_7, DMST_ARG(0), BPF_REG_0));
>>>>    		/*
>>>> -		 * FIXME: arg1 should be a pointer to cpuinfo_t for the CPU
>>>> -		 *	  associated with the runqueue.
>>>> +		 * Get the runqueue from arg0 and place its cpuinfo_t* into %r0.
>>>> +		 */
>>>> +		get_cpuinfo(dtp, dlp, exitlbl);
>>>> +
>>>> +		/*
>>>> +		 * Copy arg1 into arg0.
>>>>    		 */
>>>> -		emit(dlp, BPF_STORE_IMM(BPF_DW, BPF_REG_7, DMST_ARG(1), 0));
>>>> +		emit(dlp, BPF_LOAD(BPF_DW, BPF_REG_3, BPF_REG_7, DMST_ARG(1)));
>>>> +		emit(dlp, BPF_STORE(BPF_DW, BPF_REG_7, DMST_ARG(0), BPF_REG_3));
>>>> +
>>>> +		/* Store the cpuinfo_t* in %r0 into arg1. */
>>>> +		emit(dlp, BPF_STORE(BPF_DW, BPF_REG_7, DMST_ARG(1), BPF_REG_0));
>>>>    	} else if (strcmp(prp->desc->prb, "enqueue") == 0) {
>>>> +		/*
>>>> +		 * Get the runqueue from arg0 and place its cpuinfo_t* into %r0.
>>>> +		 */
>>>> +		get_cpuinfo(dtp, dlp, exitlbl);
>>>> +
>>>> +		/*
>>>> +		 * Copy arg1 into arg0.
>>>> +		 */
>>>> +		emit(dlp, BPF_LOAD(BPF_DW, BPF_REG_3, BPF_REG_7, DMST_ARG(1)));
>>>> +		emit(dlp, BPF_STORE(BPF_DW, BPF_REG_7, DMST_ARG(0), BPF_REG_3));
>>>> +
>>>> +		/* Store the cpuinfo_t* in %r0 into arg1. */
>>>> +		emit(dlp, BPF_STORE(BPF_DW, BPF_REG_7, DMST_ARG(1), BPF_REG_0));
>>>> +
>>>>    /*
>>>>     * This is ugly but necessary...  enqueue_task() takes a flags argument and the
>>>>     * ENQUEUE_HEAD flag is used to indicate that the task is to be placed at the
>>>> @@ -120,15 +175,6 @@ static int trampoline(dt_pcb_t *pcb, uint_t exitlbl)
>>>>     * outside the kernel source tree.
>>>>     */
>>>>    #define ENQUEUE_HEAD	0x10
>>>> -
>>>> -		emit(dlp, BPF_LOAD(BPF_DW, BPF_REG_0, BPF_REG_7, DMST_ARG(1)));
>>>> -		emit(dlp, BPF_STORE(BPF_DW, BPF_REG_7, DMST_ARG(0), BPF_REG_0));
>>>> -		/*
>>>> -		 * FIXME: arg1 should be a pointer to cpuinfo_t for the CPU
>>>> -		 *	  associated with the runqueue.
>>>> -		 */
>>>> -		emit(dlp, BPF_STORE_IMM(BPF_DW, BPF_REG_7, DMST_ARG(1), 0));
>>>> -
>>>>    		emit(dlp, BPF_LOAD(BPF_DW, BPF_REG_0, BPF_REG_7, DMST_ARG(2)));
>>>>    		emit(dlp, BPF_ALU64_IMM(BPF_AND, BPF_REG_0, ENQUEUE_HEAD));
>>>>    		emit(dlp, BPF_STORE(BPF_DW, BPF_REG_7, DMST_ARG(2), BPF_REG_0));
>>>> diff --git a/libdtrace/dt_work.c b/libdtrace/dt_work.c
>>>> index 498d5332a..2167ed299 100644
>>>> --- a/libdtrace/dt_work.c
>>>> +++ b/libdtrace/dt_work.c
>>>> @@ -37,35 +37,29 @@ END_probe(void)
>>>>    int
>>>>    dt_check_cpudrops(dtrace_hdl_t *dtp, processorid_t cpu, dtrace_dropkind_t what)
>>>>    {
>>>> -	dt_bpf_cpuinfo_t	*ci;
>>>> -	uint32_t		cikey = 0;
>>>> +	dt_bpf_cpuinfo_t	ci;
>>>> +	uint32_t		cikey = cpu;
>>>>    	uint64_t		cnt;
>>>>    	int			rval = 0;
>>>>    	assert(what == DTRACEDROP_PRINCIPAL || what == DTRACEDROP_AGGREGATION);
>>>> -	ci = dt_calloc(dtp, dtp->dt_conf.num_possible_cpus,
>>>> -		       sizeof(dt_bpf_cpuinfo_t));
>>>> -	if (ci == NULL)
>>>> -		return dt_set_errno(dtp, EDT_NOMEM);
>>>> -
>>>> -	if (dt_bpf_map_lookup(dtp->dt_cpumap_fd, &cikey, ci) == -1) {
>>>> +	if (dt_bpf_map_lookup(dtp->dt_cpumap_fd, &cikey, &ci) == -1) {
>>>>    		rval = dt_set_errno(dtp, EDT_BPF);
>>>>    		goto fail;
>>>>    	}
>>>>    	if (what == DTRACEDROP_PRINCIPAL) {
>>>> -		cnt = ci[cpu].buf_drops - dtp->dt_drops[cpu].buf;
>>>> -		dtp->dt_drops[cpu].buf = ci[cpu].buf_drops;
>>>> +		cnt = ci.buf_drops - dtp->dt_drops[cpu].buf;
>>>> +		dtp->dt_drops[cpu].buf = ci.buf_drops;
>>>>    	} else {
>>>> -		cnt = ci[cpu].agg_drops - dtp->dt_drops[cpu].agg;
>>>> -		dtp->dt_drops[cpu].agg = ci[cpu].agg_drops;
>>>> +		cnt = ci.agg_drops - dtp->dt_drops[cpu].agg;
>>>> +		dtp->dt_drops[cpu].agg = ci.agg_drops;
>>>>    	}
>>>>    	rval = dt_handle_cpudrop(dtp, cpu, what, cnt);
>>>>    fail:
>>>> -	dt_free(dtp, ci);
>>>>    	return rval;
>>>>    }
>>>> diff --git a/test/unittest/sched/tst.enqueue.d b/test/unittest/sched/tst.enqueue.d
>>>> index f445ac843..28dcace8c 100644
>>>> --- a/test/unittest/sched/tst.enqueue.d
>>>> +++ b/test/unittest/sched/tst.enqueue.d
>>>> @@ -4,7 +4,6 @@
>>>>     * Licensed under the Universal Permissive License v 1.0 as shown at
>>>>     * http://oss.oracle.com/licenses/upl.
>>>>     */
>>>> -/* @@xfail: dtv2 */
>>>>    #pragma D option switchrate=100hz
>>>>    #pragma D option destructive
>>>> -- 
>>>> 2.43.5
>>>>
