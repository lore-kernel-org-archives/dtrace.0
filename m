Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EE952F39BD
	for <dtrace@lists.linux.dev>; Tue, 11 Nov 2025 22:55:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762901757; cv=fail; b=fFURkkM6+5XnXfHhwYFkKg1BybwJFalJ1CUIbue0T9CS08yeU2Jv307lMMxLdugD1bVI6Zs47hHzfb66Kz/ckCcb72RaQVCbtbtD7xbOSbo3iFDPQX82vTQfNB6I4rM4frx4BCywlusCxrRcOgVSnYswBGITQUTtasQa3Uj68i8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762901757; c=relaxed/simple;
	bh=ggbSm+V7rVh78+WVSwPka+3PkKQ1VFSwJxTL6c/VTjU=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=c3jFDByCd/LSDmkKHA3XU3ztfVtHuOBGXD/lh2QqkjZXjW7IxFN1Jj83vhAkYJJU4mE+k9yoccFuzwf3dZtfjNcyBpOYLh3jw401qQEBdsMpnR1mDI3WDxKllILAeFk8EGV4WNyLCSuUmJx+ZrHSk3afdvtsP4IBO36kfw4yFJ8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=k2mT6he9; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=oeovu9Qk; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="k2mT6he9";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="oeovu9Qk"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5ABMOKgo031186
	for <dtrace@lists.linux.dev>; Tue, 11 Nov 2025 22:55:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=+EhFBrYTKhXqA+G4SJM/mntkRK8kqGV95PL1J5ql0BI=; b=
	k2mT6he9GmRZmkF/Ev5FHiPc3lqUbKtfcZOpv90vSEbAxPY41kINpIbfy5p8BEEk
	DBkndwjczlPZzvLJMDRF0z6KElWZfdSYx+DDDp8rY197QNBAXJZaCyuwbRmP6v/D
	2BhlA2J65wR2VHV3OaRdR6AK7n0l9OtC/73IYt97hiihvpAGC4y6dRgaOi5Bhm7B
	4Wh87wxVYczq0A8ye2B9kYGYt+XEFMo1WUpp6X8SX6eYTqq9ao8+AwrXDJ2kyUmh
	6c8aWjoHyPkS/YwJ2ukNEEY6cjvtTnjFVb0DPRpe0viZ3i//VMj+VUiHZYO+6NHS
	xCAGXcOVusaiQObYDA3/5g==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4acbgjr9mu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 11 Nov 2025 22:55:53 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 5ABMsJlF039926
	for <dtrace@lists.linux.dev>; Tue, 11 Nov 2025 22:55:53 GMT
Received: from ch4pr04cu002.outbound.protection.outlook.com (mail-northcentralusazon11013007.outbound.protection.outlook.com [40.107.201.7])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4a9vaa0hw2-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 11 Nov 2025 22:55:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Uv3yC2CmVfs0ih9QbfI21TGeeE1zWQyGMw70+a1isA0Z7lve+lOkGKYrKX6SqA2hntHdJJwIXUX05ts7/jdq01JfBl5ljV8Mgh1Ns5AhvS9JeBNrlvRbe4ifHatRS8VnMrwAz/RYTNNMe3fAJcfjOBZ4dMCLArlR1N9HeAvUAIEbwFs0YZIfFahCXRBLHW8Q56PgocxA9P9hH4m+g0IRbAqT/yWpRcNpR/WzFEp9AQYQOd/MA5cUY1VpwQFu3OWf8jYRr6ngLvO4dCirhGuEpJWTk5kw6viOpCLebSpg3wHuAekNlicsw5ArDCUHTZciZjoTcsP76KPvF+B5W9pCiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+EhFBrYTKhXqA+G4SJM/mntkRK8kqGV95PL1J5ql0BI=;
 b=GKL5pCkFjd+BHcmdpCOA/sN27zJDMY4ZAJB1X5ccjkDkFVrWh/7kAhnO/gNMCjce56ETqFFX1ZS3YO0gxIlYeG4kl4u281gXqsE5S89htJ7CeqXGhAvLvIQHT7vJg/xuV1bU3cKvZQ0H9B2lBRYlOPuruYczoptQxKRDREzrh/ty3XPt9f8FKST+M2VYocHptGH277WIdj450agNazoXfPK1qXiDLG+2rcfSL+TNQmRSGdfi4qvSdJVRRn6XLpzd4D1sdxLll1YZML+4mFLo/J4j6KjXz8pCvEcxv7BSg0itsYNorTUyeRqfPYJzDzoy8umouE2u8qEmJhVM81Bzlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+EhFBrYTKhXqA+G4SJM/mntkRK8kqGV95PL1J5ql0BI=;
 b=oeovu9QkPuUFwexoEQs3MsKDkiRlDWY1phS/E+OnaEooSpp8ZUkTX4ge3Lvw3MTu1AngMzuVna4J8SYM4PqvEasl/iPREi8Dt3YAhZ7N0terwPgwL7u9QdRjDC8wW8Lnzkmyi9xNU0t2rtFDtMBp/ZNdOZDau8jSA1EmsRqXuMM=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by CH0PR10MB5161.namprd10.prod.outlook.com (2603:10b6:610:c3::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.16; Tue, 11 Nov
 2025 22:55:50 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b%6]) with mapi id 15.20.9298.015; Tue, 11 Nov 2025
 22:55:50 +0000
Message-ID: <00c33eaa-f2bf-d884-0552-d32ffe7e6a2c@oracle.com>
Date: Tue, 11 Nov 2025 17:55:48 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 3/4] test: fix tst.depth.sh to use proper trigger
Content-Language: en-US
To: Kris Van Hees <kris.van.hees@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
References: <BY5PR10MB3987726AB973C7AE7CB6D4BDC2CEA@BY5PR10MB3987.namprd10.prod.outlook.com>
 <2f960b99-eaa1-d3f7-11f7-4643adcab8fe@oracle.com>
 <aRKmvyBLFPNRYOM3@oracle.com>
 <67df532b-f980-5ec0-ce0f-998d524829d8@oracle.com>
 <aRO07LKhWrmbhHEM@oracle.com>
From: Eugene Loh <eugene.loh@oracle.com>
In-Reply-To: <aRO07LKhWrmbhHEM@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PH7PR17CA0068.namprd17.prod.outlook.com
 (2603:10b6:510:325::12) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|CH0PR10MB5161:EE_
X-MS-Office365-Filtering-Correlation-Id: 8695994e-b847-4ea9-1e1b-08de2175756b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UFRQRTR2R3ROTFdPYnRxK0RsSkpKSEtFMFVnS010bktCdXZTR3hyQ3FrM3FY?=
 =?utf-8?B?bHBWYk1PdU9ITDJzdUUwVXBOalVwVGM5dFVrL04wMFJRaWFoOVV6dUI4R3FD?=
 =?utf-8?B?RCtBTmVmcmtOTkoxN29YenA2QnNNRkI3UmFPczhqcU00bjNkYUZTVjBkZnZF?=
 =?utf-8?B?OGJUd1RaV3dKY29qaXV6TEo0RWtkK0RwQnFLWTduVE00LzhtRGhFQ25PMW11?=
 =?utf-8?B?UXhyU0EyaHoxdlF3TFBETDNrNUZ3bEFDdzFQaTRFd3VSb2NUL2cwbXJmQXlL?=
 =?utf-8?B?UlFuRHN1R284aUlvbW5INllJL21TbG91cERncExqNmJhQnViL1kwbFhQTlQw?=
 =?utf-8?B?VWl4U0ZES0o3a2dodHBrRlRhZThFQ1FYdlQ3M1V3MHN2VDB5R2picWIycTVI?=
 =?utf-8?B?T1hXaUtkeWdIQXJWRllibExhL1h3SnRaMCtzS25WL3pjaXdPT2swa1NYbnAr?=
 =?utf-8?B?S2d4OHd4Qm41SCtaa1dUdCtnUkhZZnVVbnJXVXFaUERycmF6RWk2Y2YzcWVC?=
 =?utf-8?B?YVhvc0JEWnJ2Q1dXZjQ4Y3pESXBlT2lrZDRXSnRhbmRFZm94YkNmRU96a1FY?=
 =?utf-8?B?bnZNRUVpVFBOK2FYakVSZS9la0R3QWJGMS9HRUJzQ1dsZDF2QXIvc2lsbzM4?=
 =?utf-8?B?ZndXZytUcUVqaERUWUJWSGt0RFRXWVVyaVcwQ2t1OEJqK1UvcEZhdzdLQUNZ?=
 =?utf-8?B?MGVmOFRZbzVSTGtkbnBUdFhvRmk2NGJxKzBwMnFCMGQ1MHRmWlRzU3B0QnRF?=
 =?utf-8?B?WUoybTQxTmN5RDFDQjFLMi84aDY1WFlIeEg0ZUxCVzk5L3YzNTdCWkhwZEp3?=
 =?utf-8?B?Y042RFMrbkhMZkU3dlEwZmFJWHJBTE1WRXNvNHNFanlyUC9CMFR5emNLTkN1?=
 =?utf-8?B?Q3luSGxBNlcwQTl1VmtWUWJ1b09udFdKaGJYeW8yVk5LcGtWM0o3K3NxZ1dE?=
 =?utf-8?B?VUxUZys3ZktGMlpGK2J0OWFRZDlsUHB6NFV1MVZDZU0xcTNHeEsvYWJaTlNK?=
 =?utf-8?B?b2NFV1VRZk16SHJEd2UxcyszUVByRXV2M0RzWUNBY0hGZUFDR2NOU1lMbEUz?=
 =?utf-8?B?UXRFbHJOd2VQNWdGQm5XRUR0Z21GQTBjdUxCbU10U2ZNbjZhUlVMWEZvditN?=
 =?utf-8?B?WCtnT3A2RWgwaXh2NTl2Y0JOZnlYRjhiSlZzR2JrSXI3UjlYeFYxaTZXdTQx?=
 =?utf-8?B?eDN2bXRyZ2hnTXY0bEpLbHFUc2tRc0t1Qm1iRFBubDhhVjhjdzRlUHFwY3gw?=
 =?utf-8?B?Tm5TUTNFb1NJbTVYTDh5TnhFWW9qOElxSmtzV3FzbVA4andabCtqdWZmREhI?=
 =?utf-8?B?WTJFUDdvRzFWZXgrNmVJNjdUMTlKUjFrRHJBcWtiUlR1eEY5WTdtQzRDZzVZ?=
 =?utf-8?B?Vm1hejE5MDNMMDFrSTFaSm1zWllZcGlwSXVSMTdvTFJxNC9xWkc2dW9XdUQr?=
 =?utf-8?B?bi9KejQ5V0JzbUFmSzNuc2ZlenRkcGpjczB1V3NYUmZ5Z1RGazA2dVhmU2pZ?=
 =?utf-8?B?MWxtVHVSelZsYzNWZ1BoU0p0N2NhRS9GTTliclpuYlhrRVlqL2lhRjNVQm11?=
 =?utf-8?B?REhnZ1pXN3FUcFE0V1R5ZWJTZjlhZDUzSFlzQ0xPZFlMTEZpVmtFSmJWMXY3?=
 =?utf-8?B?S3liOE55bzhLMTRUZjg1S3FsMkFxVENoZ3MrdHdESmJubWFIdi83QWY1LzdQ?=
 =?utf-8?B?c2NZaGZKejlwS1NvMWFwTE0rOXFhQzh5ZTAzVnF1NHNsYno4RkZDWHdlU0FS?=
 =?utf-8?B?Qm1KVWgwR1RYVGdIbzZnQW41RGJtSXZ4eG1vc2MxcVNGTFF5R1pnTHY5RVhO?=
 =?utf-8?B?SCtKeldMN0lhSUQ5eXpKbzBFZzh0ZEQ3dTIzbldJNHFkK2VsR04zeFdVTEFO?=
 =?utf-8?B?cUQ0ZjJJdFYxbnAwS3NMZUFjQzZ3cE5xVDA2eFRmN05BNmFRUjBmTi92TFY3?=
 =?utf-8?Q?8mFC24rzHsRLjlr9TiZUZp3koB1KluzP?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?REVPeSt0c2JZZW1wUXlrSzlTOXpwa2QvVS9HNWhIc01xVjRDZnNVbHRUN0ZB?=
 =?utf-8?B?UTI4RWh4WnhzOUFvV0pSNytCVjhDSXVEZWF2VEtHbFRweWJkMEZrbnNyamNU?=
 =?utf-8?B?VFV6OFdSbzJiUGlCYmRLZC80cG1ENTlndldqTmhEQkxWZ2ZMN2o1UWd4M3ov?=
 =?utf-8?B?SkJaYjJuNTNnYTQ2ZVBZVWRiOVJyeXYyVkRhYnRTSlZ4UDMrRTB2SWhvajhX?=
 =?utf-8?B?UXNqUGw3N2VvelAxY2lsYnZpN1F3YytxeVk1U3YwbjJ2SjJ2WHkzRDU2RFNX?=
 =?utf-8?B?NUU4TlY4aU42eXhvWVpUdG5zNUdEc0dUZUtmTlB3aHNRc0hLZ2RPbkZINzhw?=
 =?utf-8?B?elhiVHlmY1gyN1AzeDZzQWpsSWRrUm1xL25GbFllWll3WHZ3NVlDcHNaVTVm?=
 =?utf-8?B?VDlsRnZPdVMwM0JXcUNCVVNSeXNaUmNNMmpndTZtUHJyQngzWmZyeDk1eWI4?=
 =?utf-8?B?QTJ6cDlGc2xqdkVjYXdnblZuZmVJTnJPTWZGeHJuMWUxWVdid0t6QXZ5VklZ?=
 =?utf-8?B?VDBoMUpJTlhZWVBBdkxvY0xRMkFVK2lsM1piaVhiYkNwWklBdUN1U085OU8x?=
 =?utf-8?B?a3FlMjA2dWpyRGl1WGVuVUFIS29Vc0xMTlVOZ3hNUzB6T1o4cmx0UUVzaTNR?=
 =?utf-8?B?NkpjLzd5R2xLendXVTRvbjJuenVPc3hoY3cxWGwyUFA5NW1rQTRNYzE2WG00?=
 =?utf-8?B?S3NoNnc2MDdySkx4aFFjSWlEb0pqZk1TVldIU2RFM3MxOC9CVjFVZS9QNHVt?=
 =?utf-8?B?a3gyZ21uN0pXZXlVVmlGVGpDV0VGR0JqSnY0OUU1MnROYnEwVmdXL3p2M2Fp?=
 =?utf-8?B?OEdMWTl1c0FjSHpUYVVQOHdrTCtBdVJPQVluazBNTUpwOXZDeU9PRE9wbjky?=
 =?utf-8?B?a2pYTFdVZS8xK0szOE84ODlISVFObUNCOENDejRFMlN3WEtqbFdSd2dNYzFp?=
 =?utf-8?B?TjJNL2E0cWxuSVRUZWQ3Z2lHQkF2S0lmNVVBR2tKZGlqS0hFdG5LZlA2OVdU?=
 =?utf-8?B?UWhOVG1iWVJycmhTcGJtdlZMWXdwZ3p0R1FFZXBqSmNpRkJOSkxPUnkzbWNt?=
 =?utf-8?B?N1pUR3J4b0dqdmlrbVIwVWFyODEyUDdacnVsNjQ2Nmx3cWp2M0N6Z0ZXbDF5?=
 =?utf-8?B?elh4aW9nMzFZTG5FZEYxSjl5M3lPVkE5WFdLSXlLMnI4d0piNmhoTmpaZVNi?=
 =?utf-8?B?VjdCV2JZdUt3ZS82YVFzdmJZS1lPZDBkSWdBU2piSE1mQWJVRDBTdS8yR0hE?=
 =?utf-8?B?ODFVOU52b0s3N2JTcHZsa29wNlRVbFVTZ01TYW9LWXJVU25XQTliUUNTN3dH?=
 =?utf-8?B?a3c4SDAreUljSkdkQnVVZGhoSnRNWTZvc0Z4U3hsaWZEcXpkTjdSaXp6WExE?=
 =?utf-8?B?dy9tSS9Idjg0YVhWaEltV0VKS3J3T1F1KzU4UWdoZjdDczJrUWk5K3QvWEZB?=
 =?utf-8?B?WFp1NTg3bDJCVnIzWjFDVFgzNG9KVHhtcWdFaTgwOENndit6ZnV1eDU2eC80?=
 =?utf-8?B?VHBLZVJmNWkzMXFCY01QQmkxTldUb2czU0FYd041MG15T0d4ZVY4a3Mwa3E5?=
 =?utf-8?B?bmg0d3ora0xTaUhHMVdmQ1dUakZrdHlnNEJqSGRtWFBkUm1hRzNCTXBhQ3d5?=
 =?utf-8?B?dGdxYXpCQnk1UXBSRmJEQ3IrYUlydS9UWTBkZ3liU3gxcmF0Q2VaTUh5TXJY?=
 =?utf-8?B?RDZ0b2QzOXNuS1dWTFRwSk4xcmxhMHE0elg0c0FpZWE0WDFPVTk0NzZ5azBG?=
 =?utf-8?B?U2hiaU1Dc1hMcEZVUUJoVTg2MnFIY3NwOE4rME5VNVdZL1NVU0VFZXA0c0Z2?=
 =?utf-8?B?ODJ1bUE2Q0dhL29EdjQ2WHl1MnF3TTFOWHdHSjV6TUV6ZVNNcGVVbW4yeHJp?=
 =?utf-8?B?Z3FKTks5RHE1UFJQTjU1bll0d3VRWGNteHhvQVlaajkyOWJUYll4aDdCdHNF?=
 =?utf-8?B?ek5qUnEzemFUb09mY2RyeE8wMmxmY2ZwQVBKUEhUblZ5enpsZTV4b09qc0Y5?=
 =?utf-8?B?T0lFejhyanB1VzJKdFZaancxSTd5blA2aitjTXZsRWRNa2ZQQWdua05DNVFt?=
 =?utf-8?B?ZmdDOHU2djVodFJad3VTbzFzb0l5aXc3T1RLQVZqNURiTTRFd2VYSGdqVjBU?=
 =?utf-8?Q?4GeGomhAwBwK9Bjj5qjLWmtVP?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	qRKKAuHkpDAmuUmaKBqe3YFOyAm2Cn7jrfdrnI0agu1lewekahCenuMnjB9DOgBTXHIF5mgMvGzawVIOCCaSTFMUUicIRe33FAtwyVTQFrgPSw05jENqXVRt31k/YVv3r/Pl6l2KKHHP1Cxx/u6765jFbo+6EGMDVE0DhARuXnhnSDTJb76ptp/EaRTe56UfsDru0LLqii5swnwZBj6dmwWWLvHpoED9XlKrvIGj3/nHz8mZgparZkZ/EO4y4ngdLrqvjt6P5A8DvwxoDtmm9JJKB/BCvLuJW8h5LjfbV4h7w3TobhM+5Nxm6TKjTsAufltp8zB5mEtBFgU7EFwiu8pJJK22MIq3w0uQOQ1/YGwhfJnU3N5khOwJLZYtu7M8qZgc6bvXDPtpcH3Dc6dMjXKSRWmAKfpbUT1xoMtRTLv0niJmWwiI3BP/oErszyhujA/mnx4UfP0huHZOVbgZGYgbIH+qVRJ/IjVzF9ud08HEYM0O/NkOXxHNxuRNPsFijlv/cbcDUqJOUQDhoA6K/m+KHuQFBjArIB9rPRUC2auNQEtWq7qNH7F//E28tMIgEAN2GQs2cXDwTGdSBPRMRgPhM+UQ7Ef71rc9UeL5mUU=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8695994e-b847-4ea9-1e1b-08de2175756b
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 22:55:50.0405
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Sh8EOo6KvJZoKs5bte65lSwS8XkhD5EOG0fVMwA+ruHBJU2YBnr3vX83CSE+8KEWsZ5iK6qthSDtkz4m5CQuVw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR10MB5161
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-11_05,2025-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 mlxscore=0 phishscore=0
 mlxlogscore=999 spamscore=0 suspectscore=0 bulkscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2510240000
 definitions=main-2511110187
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTExMDE1OSBTYWx0ZWRfXxTZrvhw1GKEt
 xCSmvMZu6pi+2lpUHaofQ7wZZ5TcICK3PEplusofY+K9SYuMrpcy0dza7V/EhbGzYo0DhJegwxr
 p9SIlNtSc43G25YKwHMbWOHbjeUA3MrRScPfH1ZZIin4HbujSBH2WGzggmsTIldQ45HLXoWUdx0
 DfqtM3S4ACNwejTGB0FfcldQNwl6nDYgfV0+hdqEnLZMUYPX/rkZNPB4eyP68D0xt/irT5DeUV8
 YyODMgd5slgxkO5snF5H0V4a1JAgyaxbmJZn2thhuedgbqax9ox4R/6f59JuFT7Y3pqvhyJFw4X
 pRpDupUupw1x8ynwef3mm2aVujVagOS50TNFbFWh52a2hhLU3MpV5gdiMbR6Yj0bF/GmhiYBnpk
 h4ZqkNubR34Ej0CWj1RRl630taAAXQ==
X-Authority-Analysis: v=2.4 cv=P4s3RyAu c=1 sm=1 tr=0 ts=6913befa b=1 cx=c_pps
 a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6UeiqGixMTsA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=yPCof4ZbAAAA:8 a=dKQXvFfqvD5iY1x5nG4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: 6_Uq9KSd7RUIE6zRH-VN_3vjBDIIMATc
X-Proofpoint-GUID: 6_Uq9KSd7RUIE6zRH-VN_3vjBDIIMATc

On 11/11/25 17:13, Kris Van Hees wrote:

> On Tue, Nov 11, 2025 at 03:50:37PM -0500, Eugene Loh wrote:
>> On 11/10/25 22:00, Kris Van Hees wrote:
>>
>>> On Mon, Nov 10, 2025 at 07:10:52PM -0500, Eugene Loh wrote:
>>>> I'm against this patch.
>>>>
>>>> The picky stuff is:
>>>> - the Copyright year should be updated
>>> Easy to fix - done.
>>>
>>>> - the timeout probe could replace
>>>>           tick-1sec /n++ == 10/
>>>>     with simply
>>>>           tick-10sec
>>> Arguably, the two are not identical.  It depends on why one is used over the
>>> other.  Here we could probably go either way, though it might be nice to have
>>> the tick probe firing every second as a way to generate a bit more activity.
>>> Given the frequency of the other probes, not really important though as far as
>>> I can see.  Note that I didn't touch the timeout probe primarily because that
>>> was not the purpose of this patch anyway.
>>>
>>>> - the "delay" env var be set for delaydie???
>>> Why?  We are simply using delaydie to have a trigger executable to execute.
>>> This is a valid use of it (and it is used that same way in other tests also).
>>>
>>>> - the ustacks for delaydie are perhaps not very interesting
>>> That is not the point of the test, and for that matter, I highly doubt that
>>> ustacks from date would have been any more interesting (aside from the fact
>>> that you'd never know because the test didn't even work with date).
>>>
>>>> A little more serious is that all this patch does is swap one failure mode
>>>> for another.  What for?  It's XFAIL anyhow, and we do not check that we're
>>>> getting a particular, expected failure.
>>> The difference is that the pre-patch failure was due to a problem with the
>>> actual test.  But since it is XFAIL that was reported as an expected failure,
>>> which was entirely bogus.  After the patch, it still fails but at least it is
>>> failing for valid reasons.  I.e. now we have a failure we should look into.
>>>
>>>> The real problem, meanwhile, is that this patch leads to lots of test
>>>> failures, at least for me.  Not every VM, but many.  Oh, and I do not mean
>>>> on this test, because this test remains XFAIL anyhow.
>>>>
>>>> Consider a subset of the VMs I run on.  I get these failures on the
>>>> test/unittest/ustack/tst.*.d tests.  Why on these?  Because they run after
>>>> tst.depth.sh.
>>>>
>>>>           +------------------  arm OL8  UEK7
>>>>           | +----------------  x86 OL9  UEK7
>>>>           | | +--------------  arm OL9  UEK7
>>>>           | | | +------------  x86 OL9  UEK8
>>>>           | | | | +----------  arm OL9  UEK8
>>>>           | | | | | +--------  arm OL10 UEK8
>>>>           | | | | | |
>>>>           v v v v v v
>>>>
>>>>           x x x x x x   tst.kthread.d                 FAIL: timed out.
>>>>           x   x   x x   tst.uaddr.d                   FAIL: timed out.
>>>>           x   x   x x   tst.uaddr-pid0.d              FAIL: timed out.
>>>>                   x x   tst.ufunc.d                   FAIL: timed out.
>>>>               x   x x   tst.ufunc-pid0.d              FAIL: timed out.
>>>>                   x x   tst.umod.d                    FAIL: timed out.
>>>>                   x x   tst.ustack25_max95_profile.d  FAIL: timed out.
>>>>                   x x   tst.ustack25_pid.d            FAIL: timed out.
>>>>                   x x   tst.ustack25_profile.d        FAIL: timed out.
>>>>                   x x   tst.ustack95_max25_profile.d  FAIL: timed out.
>>>>                   x x   tst.ustack95_profile.d        FAIL: timed out.
>>>>                   x x   tst.ustack_max25_profile.d    FAIL: timed out.
>>>>                   x x   tst.ustack_profile.d          FAIL: timed out.
>>>>                   x     tst.usym.d                    FAIL: timed out.
>>>>                   x     tst.usym-pid0.d               FAIL: timed out.
>>>>
>>>> I think the problem is that tst.depth.sh -- with this patch, in any case --
>>>> turns on a huge number of probes.  That causes problems for this test, but
>>>> not in the sense of it FAILing since it is marked XFAIL anyhow.  (All this
>>>> patch does is change the FAIL from one problem to another, but we still do
>>>> not specify what failure we expect to see nor check that that is what we
>>>> get.)
>>>>
>>>> So, the problem is not with this test, but that the system is left in some
>>>> whacked state due to having attempted so many probes.  As a result, the
>>>> process "dtrace -o $file -c delaydie" is still around well after the depth
>>>> test has finished, the load average remains high, the pid0 process does not
>>>> run, and many tests time out.  How long (how many seconds or how many tests)
>>>> does this effect last?  It depends, as one can see above.
>>>>
>>>> This raises all sorts of other questions as well, such as whether tests in
>>>> our test suite should be allowed to depend on running on a somewhat idle
>>>> system, whether we (dtrace or the test suite) are cleaning up well enough,
>>>> etc.
>>> There is of course the aspect that this patch is part of a series, and the
>>> next patch in the series should resolve the impact issues of this test.  If
>>> it makes you more happy, I'd happily move this patch to the end of the series.
>>> I don't see how it matters, because this crazy fallout from tst.depth.sh will
>>> be an issue either way until the per-PID uprohes support is applied.
>> I don't get it.
>>
>> First of all, the crazy fallout results with the patch and it doesn't
>> without the patch.  Without the patch the test was basically SKIPing
>> (admittedly as a mistaken side effect of a test defect).
>>
>> Second, the above results, with the crazy fallout, included the entire patch
>> series.  That is, the tip of the branch looked like this:
> Well, it was not clear from your email that you were testing this after you
> applied the entire series.  That of course changes the situation.
>
> Clearly, there may be more wrong with this test.  Or it might be pointing on a
> potential issue where DTrace might leave things hanging in a state that takes
> too long to clean up.  Either way, though, the change in this patch is needed
> to make this test even remotely useful.
>
> If the patch causes the test to trigger other tests to fail, then more work
> is needed.  I would still recommend that we let this patch go through, as it
> *is* a correct fix for a problem.
>
> And then look at what the new issue is that this test brings to light, and fix
> what is needed to fix that.

How about having the patch also SKIP the test and we simply file a bug 
to track the issue.  Otherwise, we're simply invalidating a bunch of 
other tests (in the process, increasing the run time of the test 
suite).  The cascade of FAILs is even longer than I indicated for one of 
the VMs.  The patch is a fix to a problem, but it's only a partial fix 
to what's going on here, a partial fix that sabotages quite a few other 
tests.  The related problems can be tracked much more efficiently and 
directly with a bug ticket.

>> 59a49ce9 (tag: 2.0.4) doc: Add blank line before bold text so it is rendered
>> correctly
>> 61e69762 bpf: fix file descriptor leak
>> 20780963 uprobe: remove unnecessary enable_*() functions
>> 170c4cf9 test: fix tst.depth.sh to use proper trigger
>> cf7ae35b uprobe: Implement PID-specific uprobes
>>
>> If there are other bits/patches I should try, let me know.
>>
>>>> On 11/10/25 10:27, Kris Van Hees wrote:
>>>>> The test used 'date' as its trigger but that caused the test to XFAIL
>>>>> for the wrong reason: date does not have symbols and therefore dtrace
>>>>> failed to enable probes for it.
>>>>>
>>>>> Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
>>>>> ---
>>>>>     test/unittest/ustack/tst.depth.sh | 8 ++++----
>>>>>     1 file changed, 4 insertions(+), 4 deletions(-)
>>>>>
>>>>> diff --git a/test/unittest/ustack/tst.depth.sh b/test/unittest/ustack/tst.depth.sh
>>>>> index dec16a3a..977d1b42 100755
>>>>> --- a/test/unittest/ustack/tst.depth.sh
>>>>> +++ b/test/unittest/ustack/tst.depth.sh
>>>>> @@ -16,7 +16,7 @@ dtrace=$1
>>>>>     rm -f $file
>>>>> -$dtrace $dt_flags -o $file -c date -s /dev/stdin <<EOF
>>>>> +$dtrace $dt_flags -o $file -c test/triggers/delaydie -s /dev/stdin <<EOF
>>>>>     	#pragma D option quiet
>>>>>     	#pragma D option bufsize=1M
>>>>> @@ -45,7 +45,7 @@ $dtrace $dt_flags -o $file -c date -s /dev/stdin <<EOF
>>>>>     EOF
>>>>>     status=$?
>>>>> -if [ "$status" -ne 0 ]; then
>>>>> +if [ $status -ne 0 ]; then
>>>>>     	echo $tst: dtrace failed
>>>>>     	rm -f $file
>>>>>     	exit $status
>>>>> @@ -78,8 +78,8 @@ EOF
>>>>>     status=$?
>>>>> -count=`wc -l $file | cut -f1 -do`
>>>>> -if [ "$count" -lt 1000 ]; then
>>>>> +count=`wc -l $file | cut -f1 -d' '`
>>>>> +if [ $count -lt 1000 ]; then
>>>>>     	echo $tst: output was too short
>>>>>     	status=1
>>>>>     fi
