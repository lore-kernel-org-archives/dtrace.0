Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FE4827510E
	for <dtrace@lists.linux.dev>; Fri,  3 Oct 2025 02:05:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759457139; cv=fail; b=PLOumqsTGGTWgcmp6knFF2uxrnzhUj40TVIYJyPg2mO6vYZXzfi+yEJmtmcrs7siO87kFNfeUAa0kGPK6+3/aCb/atFKrojOJDxVEfcp5s3bTa5VY83LdjUbJwIsH30PtlKV5Mng9Hm4ZHh00hAr37XJZIUJR9/QuGj0qsyUjUM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759457139; c=relaxed/simple;
	bh=cWZi3P32ObptM9OO+NUKk/8fy88gIV0exHJeRDjMR1A=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=GRNTN95RKsDscg1ICmc9pY5n/qmiwr/j5+eXwoTi2syxNUjyMUEtp4fYmYEa0aSV6PMlP9a9PydFQcjXKdh21uq+jBdMfKiM2pP/nxcn7fPNgfhm/wdNZYryZpNV21CZtAZnmryMH92YBQxLt5Di/TepRrmPAauQuMYVAwIRSeM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=G5+I6/6L; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=JgOExKY5; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="G5+I6/6L";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="JgOExKY5"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 592J1mwF002989
	for <dtrace@lists.linux.dev>; Fri, 3 Oct 2025 02:05:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=L5irBN2vxZzSXjGXJgk95xidrfV4k3iOAcEzP8Ay9KA=; b=
	G5+I6/6LRVmNRxpux0w5RhYl3gObPVv8ji396e0DFQe/x5GNM3CnnepKbN+PcRdo
	BufpoCw3LbGuweLDAfNT0+yjyCjjta46ekp4X4FKXJ68dPc6X0KhfvwhwaGRsYU+
	xpWOCCBo88wgvQK1yNbgjkACXyEKxZGi1gA7ufZpvC7WQN6pstnnh3dDaYat0RwY
	076eLYd8Hs4sIx/lLVoTnr5onixMXh2cK7+nW70WTApgHUjlaMxroySMCi3LrLT2
	2fkKCHAH6XuQoz15wHyFXIGq2MkDA2z5K+5dhL/au3UVBdxhZvbHyzgnjzYtyx/g
	rluPfdW2XZ8EKcRogoU+CQ==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 49gmf1vcsj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 03 Oct 2025 02:05:31 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 592NUcUg021636
	for <dtrace@lists.linux.dev>; Fri, 3 Oct 2025 02:05:30 GMT
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazon11012004.outbound.protection.outlook.com [52.101.43.4])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 49hw0yqxjx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 03 Oct 2025 02:05:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UX2aaPmrESDRkHbSO2JkUJ4BPLTSikCHT/ze6r9+JoA13jWgA181CzRgAMAWo7DW5CUBzCFew9NsRy7O+sEUGlSaJ0+xgIhu3XrK1mRgV0lYfJjyy+wv2Ro9cMtbOnVDTEcKPt/ODWfxLyW7S6L/Jxzo3i/TIWIjgwWQCYMu3vDOkidyIGelBJ78kt69aMuifWFKcq5VHtK5jonmgevs3+aQKVKGyGPcx6GJBE6/FgxczQjGwSUKcYMlHnJcU5P+YtuxdRF2iE7cl1Ha8Ea7dG8h4UmGiU4zjuazgcWPjto1akXPcKmY9jOHMfkQFATC29Er5zUqAtBqF29kRgzO7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L5irBN2vxZzSXjGXJgk95xidrfV4k3iOAcEzP8Ay9KA=;
 b=KGg2bDYmu1eVMfe2bB9huS4HDrm1I1QaE4S4MKICpO6dGxJ/O4Cwsz5DCEm5hu8wmEVePUAgJDXPQZWI1ID0jEPrFtsaRg7G8nb+QUfLPR7zmRAJew0TeXOW0j7oeiwpKqsJJy+97k9/au/DZbiQZph8niNjxPHVigYqOTRfVaEzVvBhrK/1GhateL1B/RGrumWdQtfi1lWlQK8C+TBHCrvQmOtG5vUbIb46uxvD5r2szgPoyD5a5mfraLKrTZprVD/helYSr6I4cGMlFZUuo0bozQRTcldgxkhQy+kdz3/Y5xzE984KCZuCa7H33+eTeH1MFKbnVvxWTo2/XaHwfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L5irBN2vxZzSXjGXJgk95xidrfV4k3iOAcEzP8Ay9KA=;
 b=JgOExKY5nrS0GwB7AcfNJQpelyEzQm8Qa3HtTspTsVPzLs2bK6LXD/QSC6GmLMhOZfoyjpPkzAn7Wsn4JSCM0cKZCGNsMX+0gl1QM77y4R3QPaUeh3b/QpCAq1Knf8hkscWm3mrqgxTLNysERr6ax9W1R8aWR5qEIvK5NAQ/XHI=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by MW4PR10MB6557.namprd10.prod.outlook.com (2603:10b6:303:22a::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.18; Fri, 3 Oct
 2025 02:05:25 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b%6]) with mapi id 15.20.9160.017; Fri, 3 Oct 2025
 02:05:25 +0000
Message-ID: <c261c363-bac1-3240-5fd5-8c1170da51b6@oracle.com>
Date: Thu, 2 Oct 2025 22:05:23 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [DTrace-devel] [PATCH v2] options: check *frames option values
 against system limit
Content-Language: en-US
To: Kris Van Hees <kris.van.hees@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
References: <SJ0PR10MB5672250D1857696476BB9C3FC2E7A@SJ0PR10MB5672.namprd10.prod.outlook.com>
From: Eugene Loh <eugene.loh@oracle.com>
In-Reply-To: <SJ0PR10MB5672250D1857696476BB9C3FC2E7A@SJ0PR10MB5672.namprd10.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PH7PR13CA0021.namprd13.prod.outlook.com
 (2603:10b6:510:174::29) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|MW4PR10MB6557:EE_
X-MS-Office365-Filtering-Correlation-Id: df4a44ae-f3a8-454d-1882-08de02215146
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SGNMVC9KMWxSZ1dSZ2lnQ3BndFo4bFVBZ1lGakJIZS9Zc2w1WGdWTEtFaHBr?=
 =?utf-8?B?d05IVmRTQ2cxQnNGZThCbzhUOUhHK3RuOTBjeUZLaDVneGp5TmVEeEJiQXBX?=
 =?utf-8?B?czRxdWlrdmRCV2xnTjRRd2xmNHk5cHpCK1J0L0xENVJIVHhMbkRMUWppYVNZ?=
 =?utf-8?B?ak44d09aQnVMMU5nT1ZGV3B4aEJJMGt0N1o1dThORWFjZlJxVis0dzlxR0RI?=
 =?utf-8?B?bzlERFptNk82NW0ySjI4MkNTMGdZdGJadURiRWJ1Mkw4Y1ZxaVNDUTZvZWMy?=
 =?utf-8?B?b0lDL1dtWUhjY0pDazJweHNybFpDNTFQa0cyWWR5U2hydnFJRGtJejd6Ujdi?=
 =?utf-8?B?QmF3UUh0bDNydk9mV2hHVnFQQ3AyMDN5OGpFOWQwQ1hHclJkNlZKTzlqdGVv?=
 =?utf-8?B?ZS85Y01UNzFubmR4d1lhM2RsYlFlQ0U5SGxoVS9uSEJxWUpaSjlNK3lCRTBq?=
 =?utf-8?B?YjhXL1U5UmRDVUFzSTM5MzkyL09ZaXF2S3pvNDk2ai9xMjdGNkRzd1BNbzBh?=
 =?utf-8?B?ZHdhYjhWL1VsVnhsQ3l2aFU0c1hEUEU0dVhTWWhSWXlIRndJblBTeWUyN2F0?=
 =?utf-8?B?UE5LeFRiQmpRRWUrN2RhUkhlVThmenlpTTVBdGExSkZ4RmtXcGZXcFdXUnVz?=
 =?utf-8?B?S095RHE5cUJLTGRaQnZuMUpSRStHaHY3TGdlTWRlVzFsZ0I5c2Z4dGlhcFUr?=
 =?utf-8?B?ejZ3aXp1blMvYmN1RWtQVkViR0ZrR1JRZzFjd3ZaYnZjQWE2eU1MQm9rK3FJ?=
 =?utf-8?B?VDJLTFFFdHJ1NVprWXp2VGQ2MFRsVE5NNXVnWlNib085M1IvSmRERDZBR0pH?=
 =?utf-8?B?YWtvVUxubTNsTmRleGZZb1A0d3IzZ1JldHFLd2V6c2JRbUZPYXIrOCt0QUIw?=
 =?utf-8?B?TmZCU0FRbHpMMWNMTzRjQVNxWC83N2FsVHVNWGIzYVhhSklZdTlHN2FURmtV?=
 =?utf-8?B?N280NXZENkFodjJXSEt5eXV2NHMwK2ZqQ3l0Q2FJeG5rZEs2eTZxaENjdURD?=
 =?utf-8?B?QVZoZDQwdE43NEdkSHUvSnNpMGZWcUJmcU5meENzUUVMNzJTeU0xckQxaVhO?=
 =?utf-8?B?ZTRBUThpakF1U0xmSERCb2VYRmJCU0dqa0psMWFKWVo3VU82NzFFWllwbXdB?=
 =?utf-8?B?ei9EaU9jdE1uRXFzL2MrVGRFL1NzNDRzWXg3eERDckR1ZUtGNDFVUVZGVytx?=
 =?utf-8?B?MkZMMFVGSkswY3BXeDE5eVYvMk15allVNEtEbUdUNWFDMjEwcXpIQ3VBdHBj?=
 =?utf-8?B?eTl1RlB2WWFhNEVpVnZkeDFscm5nbkc0VG9vVGkwV0E0OTNUV0Q1VWlrSE1v?=
 =?utf-8?B?QlMrR25BN1hycTFtWGx4enZXaC90T2Rzc3cxVi9RVklGRFRaWGJEVHVIM2E3?=
 =?utf-8?B?SDJGYmVNTk1WME9KOGNvQjRrNWdQNERCYlpRdmVzaXhMb01LaWI4bG83ODFU?=
 =?utf-8?B?ZW5Bd3pUcDRaTmlmWFk1MGdicDZoUWtBT3BSREd1Zk96VGxWQ1FyUmJ6WHF5?=
 =?utf-8?B?ZjRrSS9MM3lUT1JNc2FFR2lsNFNGR2t0c0RQd1g5L3BKTzNyM3RiTFZ3T0xD?=
 =?utf-8?B?UVlhenZFRm5kZDUyMnpZNGYvR0kzVXZGTHkzODlYaDRjd2VTZnNsY2FoczY3?=
 =?utf-8?B?RXYxVEJEUEJmd1JKOWluSndQblZObW9SVlJwQkVYVmtBMGJnK2szdFAxZjJs?=
 =?utf-8?B?WGVJSkhQVElZR3dVYTJQaVpxZkpURkl4SW1rNm1YcVhvaXc0SkVxOFVMT3V3?=
 =?utf-8?B?REhJRzhabWZmWDhJc0VmN1c5ZkhBODBXQnFFNDlsK0ZVcEM3NjNUY005TFJC?=
 =?utf-8?B?Q3NiWjlnQzlMajU2Q0h6YkQ3SE11bGNKR1ZSRVpnbTJZUUQ0d2Z1cFl4ZkZw?=
 =?utf-8?B?RFFldjljSkZFYUxFNkhVMmpGd29rcHJEa3VDWGQrOW1aVUR0aWtkMzRQV2tI?=
 =?utf-8?B?elgzMjJyS1I0V2tlNmU2SHR3NUhaQVVlVWVjVzRzVitVNTl2SXJSS09Mc2I0?=
 =?utf-8?B?Ti9pb1FMck53PT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ME8zcjgvakhyQjdUcng4RlNWSC80cnQ3ZWtoaWtIbEZka1Q2NS9CaW00UG1v?=
 =?utf-8?B?Q3lTTWtCZW5GK09IOFNVL1dIVnBsVUMyRWpJUmpjancyUGdUR0U4cW9GVVJi?=
 =?utf-8?B?SVFmNjEwSkR3WEx3SnVLeHFzMUtkMGM2MkowS2oybVZ2VFprYjVoaDJ3L0Vz?=
 =?utf-8?B?aTk1end5NWN4UytDM0RJNm9uY0ZZK24vZEFVanlWNVFyUGZNWEFEMDNBK3Iv?=
 =?utf-8?B?dzJIUkR6L0FvVXRheWxyRG94c3N2endScldOM3A0eExib2VOd3IycGpPL3dt?=
 =?utf-8?B?OWdxM2JlcnZ3MXdpYk1QcHJOQTBzMURSRWtvbjVKUG01NVNCRnJUMVBHOWRT?=
 =?utf-8?B?UTNSZmFaZ2pzVzRQcjRNS3Q4ejRuc2lWREpvN3J6b080UnUyRHRPNGtZQzFq?=
 =?utf-8?B?emFKQW81WjdtbFEwYTByOUtPUXg4bVhVSWljSTRQWEhsbG1xaXZEcEZmbkll?=
 =?utf-8?B?N0UvRW1NQVN5aHlCTUgrdDhicWZtRG9XYVRzQ0dva3A2WXgvOU12UFUrdlRU?=
 =?utf-8?B?MUcwa3orVlJQNjJaUEJHSGZPa0lDTFkrWXpucTdKMXMycjM4RTFyU2FWMU1S?=
 =?utf-8?B?UVBYYzloQ3ZyNVpLRWcrQ1VzN0YvRnVkaE9OcEdpeVJsVDlvWC9HWXhuU0tS?=
 =?utf-8?B?NHN5b3kxa1RYcnRoRmhpeDNNTnlpL1RoZXJsSUY1OHF2REMvWjExdXFSWm9z?=
 =?utf-8?B?Nk12VEh2N0h0a3NIMDIrM0JMNGE4cWg3OVBLVHpxdEZmRDQ0VGRCR1I2YXBP?=
 =?utf-8?B?cWxxMjhUOUpKVWFMSi9oSjZGekZwMThneTJJem41NDF0VGlsbCs2enBxZHZK?=
 =?utf-8?B?L2xCVVJRVTIyVm5pZHZjZEtYMDN1UlhzUjhCaXZjL010U0ZzbjF5NndFNWNr?=
 =?utf-8?B?TTcweEZYV3lVM3JQbXB2cU5ycVQzS3RNbHFHUkdFMWEzWVBQaVRwbnVwRFBM?=
 =?utf-8?B?ZXpDT0o0RG1kYkJoUE5yb25pT2FhWWNYYXBkcElCdWh0c3hkc1pUV2FONzV4?=
 =?utf-8?B?MDFFZG11RmViUk1PYm5Yd21BU3MwVjJNTFRMK2N4TU44TFVmZXdBei9OQlFT?=
 =?utf-8?B?dVZmL1NQSXhqV3N6djQrMWtwZjNvRW9lbW1KYXAyMTNYanl0cjd3UmFZUDVW?=
 =?utf-8?B?b0t4bG8zZE45REZBYkM0dU9hbEttU0dtYkFQQUlXbGJKOGVtQkFEbDRVSTJ4?=
 =?utf-8?B?UHU4SXFsTmVyT1RDcG43TWZvNkpaaE9FNXVuVVBKbVcyTEtDcmRsb1JPRitB?=
 =?utf-8?B?c3BHSVROWTR1TXhQeVhMVCszVGZvbThPcldkSkxiR3FtL2p4MzhkbkdwWVM0?=
 =?utf-8?B?VHJjRzRwcEJ4YUpucFAxRzExcG9vS2pRSllLNEZ3Ry9PVW5ublgzbml2UXcz?=
 =?utf-8?B?b1lOa0NteEE1Qm8xNGV2dVZVRFlzR01WQzF6QURONjdoMnYwZ3dJVjIzZjl5?=
 =?utf-8?B?dW1BdTdCOUdpNElNNHBES3EwekxtbG50Vzh5S0FBR1VMemJnblhJQmg3RzRK?=
 =?utf-8?B?UVJUT1I2QU1NL1Z3N0dIcUIvK2lObWNxUnF1Yzh0Q3NLd0MrR1BpUW5GT2N6?=
 =?utf-8?B?RUtVUjZYSW54c29Maks0dm5KWEFGUi9RNkZ1MitSQk1FR1RBZUhxbHArSVU4?=
 =?utf-8?B?aU9sbWMxUU90WnBWWE9PUTdMWTBxR3o2R01ndkpPQWU1MEQzSjk2WmlKN28v?=
 =?utf-8?B?RjBrbHRnS1hEVFlodTBXTWZpbnAxOFllZ1VzRFg2T0ova1hvR3o1all0dGVE?=
 =?utf-8?B?RHJoMnpCRHFVT3RiMjhkUVF5NHJ0VHBONVFHdXpKOXdFQlBUOWlrNEFHUVpa?=
 =?utf-8?B?K1Y3djZIOVc3TVVxeUxDRmNZSGFSd25Dd2ZYWjRRRGYwSmZGaGh0VVNDL09B?=
 =?utf-8?B?cEplY1Q5Q2RyMXpiUjVEOWFJL3dENW1rcUpmNC9tQm4rYmFkNGJTbUtUbmdQ?=
 =?utf-8?B?ekVYYk5rMzYxZ0swdUFmaEx4OE1BMytPU3N4NTgzTC81MU5XcFNYalFaRkJn?=
 =?utf-8?B?MzVFQjRYVXUvWkI4emJqbXMya3JURkZ3Sm9CS3FMdXRyL09PZnFmbWQ2R3JG?=
 =?utf-8?B?NHJ6aGVwdldOS2NUdDVjZkRYdUhGS2ZjblBWNC9kVFd5MEVoSHhmUEdKaFVs?=
 =?utf-8?Q?8A20jt35iofgxYbBhW2HRcHkq?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	Wqhdtm1ninodPT/RxlSjTm+x5a3yN32Ex4ySU3KViamQmJ6g2Tesfb9k7eAqK3ZvOOY6z6WDfseY4DVjE5pF1dbQk1aBMj5xHYr7Gkuf7Hukr2ewxyH1fwoWW33Ln5ZnLA9Jf6XR4m2GeoIVdEj0OT69UF4UbD3MiMI9wXC5LUIG5RRgdHldo3artqLbzx3Fgu6v0acxrM5PJY5IiPqH6XvzRTQfxgnRXjFH/cYxZWCJ4Dl3Hj2CyRSBcCkFUTQdoBLgSlELlDXIhextAHVF6ttPV5zjgFx3Vdk7FnG9E2aJJPB3mv3Lye71i6VZlZ1bIJPKqjucbcxE1A7+2Ij/VEcH5LDLEqXsgZENcxFvlgVnhG4qauqKmR5yGs8/aM2/M3HIYsbhX3qKMgkup70eg+EOVEGlMTpzCz4dJ53n83hYp9NWYd/2T/monyUFHfBIQjA27FdaYHrYzZt20C4xFsIUm2oicPLYVwRYuvj5kuLaIShQMXvMozQLQlLiBznJNR8OawpRjTtXNz/8u6a5SKyUHzRXsrB66J+zKNdsKf83HWc9w2CAObh71/tmYHXAEmOYtOF9dzP7+wfiF5gNxrPkoDjl5TJkZteiAG8gIOo=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: df4a44ae-f3a8-454d-1882-08de02215146
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2025 02:05:25.5770
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XLJtyRD+gJv2/PYT7IVOVHMWem/Nlj7TD7Qv4lLSrjycO+SP+VKsLwPIiF5lclWBJ6AKjKhrfUjZNksnZH/rsg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR10MB6557
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-03_01,2025-10-02_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 phishscore=0 mlxscore=0
 bulkscore=0 spamscore=0 adultscore=0 mlxlogscore=999 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2509150000
 definitions=main-2510030013
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTMwMDE2NyBTYWx0ZWRfX5INsLQOdGO52
 3pO33fIL0qL7CPeKvJBtj7pf3CEi/gIZZpnzTs6otvBP5BIbbXWz05tv0tQrVor27AKUwp0W430
 l4DNxGCitjnV2ZkQ0Kz4VMDoeR8Z8ILtwZCF3ZZZo4HLwfOrADaBIwXPMl+WY7G+VUwU3KjNPGL
 k/qs1mUP1t8ZoLbe+LuGxeP1Q2xZCVVQ14X/EN3VBB9OLCJSySH9Y2L/unb5nwwu+Iw1KrpzVVV
 /n8JE8d3OKhJag2qfsQMgzIagCMTWQEffcFl/0x8FfuwDsWOt/t0arOtAPjflCuFuIGYhlIWsu9
 pZwcJC3dWnIhS/fx1yWcneHHxO5MqWDO/Q/bN5VNcCqFeNxTKOTusB75fDSWxlwg/9B8ybcwS1n
 CpJ33sf85ZaEY3M/2Dwd0SQYvJRwQw==
X-Authority-Analysis: v=2.4 cv=K/cv3iWI c=1 sm=1 tr=0 ts=68df2f6b cx=c_pps
 a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=x6icFKpwvdMA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=kiv0xV0janSLyDW0Mf0A:9
 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: 385qt9sQN1dbejYTGIY-lkLMXkCTLs4J
X-Proofpoint-ORIG-GUID: 385qt9sQN1dbejYTGIY-lkLMXkCTLs4J

Reviewed-by: Eugene Loh <eugene.loh@oracle.com>

On 10/2/25 15:09, Kris Van Hees via DTrace-devel wrote:
> Commit 81e99397d ("Add support for the stack() action") added code to
> retrieve the system limit for stack traces and used that value to set
> the 'maxframes' option.
>
> However, a user can set the 'maxframes' option from the command line,
> which would allow setting the option to value beyond the system limit.
>
> We now record the system limit in dtrace_hdl_t as well as setting the
> 'maxframes' option to this value as a default.  Options processing now
> ensures that *frames options cannot be set beyond the system limit.
>
> Note: If 'stackframes', 'ustackframes', or 'jstackframes' are set
> before 'maxframes' they could be given a value that exceeds 'maxframes'.
> The existing immplementation in the code generator already lowers their
> value to 'maxframes' as needed.
>
> Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
> ---
>   libdtrace/dt_impl.h                           |  1 +
>   libdtrace/dt_open.c                           |  7 +++-
>   libdtrace/dt_options.c                        | 38 +++++--------------
>   .../options/err.jstackframes-negative.d       | 24 ++++++++++++
>   .../options/err.jstackframes-too-high.sh      | 25 ++++++++++++
>   .../unittest/options/err.maxframes-negative.d | 24 ++++++++++++
>   .../options/err.maxframes-too-high.sh         | 25 ++++++++++++
>   .../options/err.stackframes-negative.d        | 24 ++++++++++++
>   .../options/err.stackframes-too-high.sh       | 25 ++++++++++++
>   .../options/err.ustackframes-negative.d       | 24 ++++++++++++
>   .../options/err.ustackframes-too-high.sh      | 25 ++++++++++++
>   11 files changed, 211 insertions(+), 31 deletions(-)
>   create mode 100644 test/unittest/options/err.jstackframes-negative.d
>   create mode 100755 test/unittest/options/err.jstackframes-too-high.sh
>   create mode 100644 test/unittest/options/err.maxframes-negative.d
>   create mode 100755 test/unittest/options/err.maxframes-too-high.sh
>   create mode 100644 test/unittest/options/err.stackframes-negative.d
>   create mode 100755 test/unittest/options/err.stackframes-too-high.sh
>   create mode 100644 test/unittest/options/err.ustackframes-negative.d
>   create mode 100755 test/unittest/options/err.ustackframes-too-high.sh
>
> diff --git a/libdtrace/dt_impl.h b/libdtrace/dt_impl.h
> index 4dc4c9a7..723aac8b 100644
> --- a/libdtrace/dt_impl.h
> +++ b/libdtrace/dt_impl.h
> @@ -310,6 +310,7 @@ struct dtrace_hdl {
>   	uint_t dt_maxtuplesize;	/* largest tuple across programs */
>   	uint_t dt_maxlvaralloc;	/* largest lvar alloc across pcbs */
>   	uint_t dt_maxaggdsize;	/* largest aggregation data size */
> +	uint64_t dt_maxframes;	/* system limit on stack traces */
>   	dt_tstring_t *dt_tstrings; /* temporary string slots */
>   	dt_list_t dt_modlist;	/* linked list of dt_module_t's */
>   	dt_htab_t *dt_mods;	/* hash table of dt_module_t's */
> diff --git a/libdtrace/dt_open.c b/libdtrace/dt_open.c
> index ed0b14a1..ba5463a0 100644
> --- a/libdtrace/dt_open.c
> +++ b/libdtrace/dt_open.c
> @@ -764,13 +764,16 @@ dt_vopen(int version, int flags, int *errp,
>   	dtp->dt_options[DTRACEOPT_SCRATCHSIZE] = sizeof(uint64_t) + _dtrace_scratchsize;
>   
>   	/*
> -	 * Set the default value of maxframes.
> +	 * Set the default value of maxframes.  This is the maximum of stack
> +	 * frames that can be requested from the kernel.  The *frames options
> +	 * cannot be set to a value that exceeds this limit.
>   	 */
>   	fd = fopen("/proc/sys/kernel/perf_event_max_stack", "r");
>   	assert(fd);
> -	if (fscanf(fd, "%lu", &dtp->dt_options[DTRACEOPT_MAXFRAMES]) != 1)
> +	if (fscanf(fd, "%lu", &dtp->dt_maxframes) != 1)
>   		return set_open_errno(dtp, errp, EDT_READMAXSTACK);
>   	fclose(fd);
> +	dtp->dt_options[DTRACEOPT_MAXFRAMES] = dtp->dt_maxframes;
>   
>   	/*
>   	 * Set the default pcap capture size.
> diff --git a/libdtrace/dt_options.c b/libdtrace/dt_options.c
> index 7508f044..97516517 100644
> --- a/libdtrace/dt_options.c
> +++ b/libdtrace/dt_options.c
> @@ -913,40 +913,20 @@ dt_opt_rate(dtrace_hdl_t *dtp, const char *arg, uintptr_t option)
>   }
>   
>   /*
> - * When setting the maxframes option, set the option in the dt_options array
> - * using dt_opt_runtime() as usual, and then update the definition of the CTF
> - * type for "_stack" to be an array of the corresponding size.
> - * If any errors occur, reset dt_options[option] to its previous value.
> + * Set a *frames option, ensuring that its value is within the system
> + * constaints.
>    */
>   static int
> -dt_opt_maxframes(dtrace_hdl_t *dtp, const char *arg, uintptr_t option)
> +dt_opt_frames(dtrace_hdl_t *dtp, const char *arg, uintptr_t option)
>   {
>   	dtrace_optval_t val = dtp->dt_options[option];
> -	ctf_file_t *fp = DT_STACK_CTFP(dtp);
> -	ctf_id_t type = ctf_type_resolve(fp, DT_STACK_TYPE(dtp));
> -	ctf_arinfo_t r;
>   
>   	if (dt_opt_runtime(dtp, arg, option) != 0)
>   		return -1; /* dt_errno is set for us */
>   
> -	if (dtp->dt_options[option] > UINT_MAX) {
> -		dtp->dt_options[option] = val;
> -		return dt_set_errno(dtp, EOVERFLOW);
> -	}
> -
> -	if (ctf_array_info(fp, type, &r) == CTF_ERR) {
> -		dtp->dt_options[option] = val;
> -		dtp->dt_ctferr = ctf_errno(fp);
> -		return dt_set_errno(dtp, EDT_CTF);
> -	}
> -
> -	r.ctr_nelems = (uint_t)dtp->dt_options[option];
> -
> -	if (ctf_set_array(fp, type, &r) == CTF_ERR ||
> -	    ctf_update(fp) == CTF_ERR) {
> +	if (dtp->dt_options[option] > dtp->dt_maxframes) {
>   		dtp->dt_options[option] = val;
> -		dtp->dt_ctferr = ctf_errno(fp);
> -		return dt_set_errno(dtp, EDT_CTF);
> +		return dt_set_errno(dtp, EDT_BADOPTVAL);
>   	}
>   
>   	return 0;
> @@ -1194,19 +1174,19 @@ static const dt_option_t _dtrace_rtoptions[] = {
>   	{ "destructive", dt_opt_runtime, DTRACEOPT_DESTRUCTIVE },
>   	{ "dynvarsize", dt_opt_size, DTRACEOPT_DYNVARSIZE },
>   	{ "grabanon", dt_opt_runtime, DTRACEOPT_GRABANON },
> -	{ "jstackframes", dt_opt_runtime, DTRACEOPT_JSTACKFRAMES },
> +	{ "jstackframes", dt_opt_frames, DTRACEOPT_JSTACKFRAMES },
>   	{ "jstackstrsize", dt_opt_size, DTRACEOPT_JSTACKSTRSIZE },
>   	{ "lockmem", dt_opt_lockmem, DTRACEOPT_LOCKMEM },
> -	{ "maxframes", dt_opt_maxframes, DTRACEOPT_MAXFRAMES },
> +	{ "maxframes", dt_opt_frames, DTRACEOPT_MAXFRAMES },
>   	{ "nusdtprobes", dt_opt_runtime, DTRACEOPT_NUSDTPROBES },
>   	{ "nspec", dt_opt_runtime, DTRACEOPT_NSPEC },
>   	{ "pcapsize", dt_opt_pcapsize, DTRACEOPT_PCAPSIZE },
>   	{ "scratchsize", dt_opt_scratchsize, DTRACEOPT_SCRATCHSIZE },
>   	{ "specsize", dt_opt_size, DTRACEOPT_SPECSIZE },
> -	{ "stackframes", dt_opt_runtime, DTRACEOPT_STACKFRAMES },
> +	{ "stackframes", dt_opt_frames, DTRACEOPT_STACKFRAMES },
>   	{ "statusrate", dt_opt_rate, DTRACEOPT_STATUSRATE },
>   	{ "strsize", dt_opt_strsize, DTRACEOPT_STRSIZE },
> -	{ "ustackframes", dt_opt_runtime, DTRACEOPT_USTACKFRAMES },
> +	{ "ustackframes", dt_opt_frames, DTRACEOPT_USTACKFRAMES },
>   	{ "noresolve", dt_opt_runtime, DTRACEOPT_NORESOLVE },
>   	{ NULL }
>   };
> diff --git a/test/unittest/options/err.jstackframes-negative.d b/test/unittest/options/err.jstackframes-negative.d
> new file mode 100644
> index 00000000..0fdcbb58
> --- /dev/null
> +++ b/test/unittest/options/err.jstackframes-negative.d
> @@ -0,0 +1,24 @@
> +/*
> + * Oracle Linux DTrace.
> + * Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
> + * Licensed under the Universal Permissive License v 1.0 as shown at
> + * http://oss.oracle.com/licenses/upl.
> + */
> +
> +/*
> + * ASSERTION: The -xjstackframes option requires a non-negative value
> + *
> + * SECTION: Options and Tunables/Consumer Options
> + */
> +
> +/* @@runtest-opts: -xjstackframes=-1 */
> +
> +BEGIN
> +{
> +	exit(0);
> +}
> +
> +ERROR
> +{
> +	exit(1);
> +}
> diff --git a/test/unittest/options/err.jstackframes-too-high.sh b/test/unittest/options/err.jstackframes-too-high.sh
> new file mode 100755
> index 00000000..869a3d1f
> --- /dev/null
> +++ b/test/unittest/options/err.jstackframes-too-high.sh
> @@ -0,0 +1,25 @@
> +#!/bin/bash
> +#
> +# Oracle Linux DTrace.
> +# Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
> +# Licensed under the Universal Permissive License v 1.0 as shown at
> +# http://oss.oracle.com/licenses/upl.
> +#
> +
> +dtrace=$1
> +
> +#
> +# ASSERTION: The -xjstackframes option value must be within the system limit.
> +#
> +# SECTION: Options and Tunables/Consumer Options
> +#
> +maxframes=$[ `cat /proc/sys/kernel/perf_event_max_stack` + 1 ]
> +
> +$dtrace $dt_flags -xjstackframes=$maxframes -qn '
> +BEGIN, ERROR
> +{
> +	trace("ERROR: DTrace should fail to start.");
> +	exit(0);
> +}'
> +
> +exit $?
> diff --git a/test/unittest/options/err.maxframes-negative.d b/test/unittest/options/err.maxframes-negative.d
> new file mode 100644
> index 00000000..62e4d21f
> --- /dev/null
> +++ b/test/unittest/options/err.maxframes-negative.d
> @@ -0,0 +1,24 @@
> +/*
> + * Oracle Linux DTrace.
> + * Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
> + * Licensed under the Universal Permissive License v 1.0 as shown at
> + * http://oss.oracle.com/licenses/upl.
> + */
> +
> +/*
> + * ASSERTION: The -xmaxframes option requires a non-negative value
> + *
> + * SECTION: Options and Tunables/Consumer Options
> + */
> +
> +/* @@runtest-opts: -xmaxframes=-1 */
> +
> +BEGIN
> +{
> +	exit(0);
> +}
> +
> +ERROR
> +{
> +	exit(1);
> +}
> diff --git a/test/unittest/options/err.maxframes-too-high.sh b/test/unittest/options/err.maxframes-too-high.sh
> new file mode 100755
> index 00000000..3b2674cf
> --- /dev/null
> +++ b/test/unittest/options/err.maxframes-too-high.sh
> @@ -0,0 +1,25 @@
> +#!/bin/bash
> +#
> +# Oracle Linux DTrace.
> +# Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
> +# Licensed under the Universal Permissive License v 1.0 as shown at
> +# http://oss.oracle.com/licenses/upl.
> +#
> +
> +dtrace=$1
> +
> +#
> +# ASSERTION: The -xmaxframes option value must be within the system limit.
> +#
> +# SECTION: Options and Tunables/Consumer Options
> +#
> +maxframes=$[ `cat /proc/sys/kernel/perf_event_max_stack` + 1 ]
> +
> +$dtrace $dt_flags -xmaxframes=$maxframes -qn '
> +BEGIN, ERROR
> +{
> +	trace("ERROR: DTrace should fail to start.");
> +	exit(0);
> +}'
> +
> +exit $?
> diff --git a/test/unittest/options/err.stackframes-negative.d b/test/unittest/options/err.stackframes-negative.d
> new file mode 100644
> index 00000000..e6c276d7
> --- /dev/null
> +++ b/test/unittest/options/err.stackframes-negative.d
> @@ -0,0 +1,24 @@
> +/*
> + * Oracle Linux DTrace.
> + * Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
> + * Licensed under the Universal Permissive License v 1.0 as shown at
> + * http://oss.oracle.com/licenses/upl.
> + */
> +
> +/*
> + * ASSERTION: The -xstackframes option requires a non-negative value
> + *
> + * SECTION: Options and Tunables/Consumer Options
> + */
> +
> +/* @@runtest-opts: -xstackframes=-1 */
> +
> +BEGIN
> +{
> +	exit(0);
> +}
> +
> +ERROR
> +{
> +	exit(1);
> +}
> diff --git a/test/unittest/options/err.stackframes-too-high.sh b/test/unittest/options/err.stackframes-too-high.sh
> new file mode 100755
> index 00000000..0123f92b
> --- /dev/null
> +++ b/test/unittest/options/err.stackframes-too-high.sh
> @@ -0,0 +1,25 @@
> +#!/bin/bash
> +#
> +# Oracle Linux DTrace.
> +# Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
> +# Licensed under the Universal Permissive License v 1.0 as shown at
> +# http://oss.oracle.com/licenses/upl.
> +#
> +
> +dtrace=$1
> +
> +#
> +# ASSERTION: The -xstackframes option value must be within the system limit.
> +#
> +# SECTION: Options and Tunables/Consumer Options
> +#
> +maxframes=$[ `cat /proc/sys/kernel/perf_event_max_stack` + 1 ]
> +
> +$dtrace $dt_flags -xstackframes=$maxframes -qn '
> +BEGIN, ERROR
> +{
> +	trace("ERROR: DTrace should fail to start.");
> +	exit(0);
> +}'
> +
> +exit $?
> diff --git a/test/unittest/options/err.ustackframes-negative.d b/test/unittest/options/err.ustackframes-negative.d
> new file mode 100644
> index 00000000..ede20425
> --- /dev/null
> +++ b/test/unittest/options/err.ustackframes-negative.d
> @@ -0,0 +1,24 @@
> +/*
> + * Oracle Linux DTrace.
> + * Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
> + * Licensed under the Universal Permissive License v 1.0 as shown at
> + * http://oss.oracle.com/licenses/upl.
> + */
> +
> +/*
> + * ASSERTION: The -xustackframes option requires a non-negative value
> + *
> + * SECTION: Options and Tunables/Consumer Options
> + */
> +
> +/* @@runtest-opts: -xustackframes=-1 */
> +
> +BEGIN
> +{
> +	exit(0);
> +}
> +
> +ERROR
> +{
> +	exit(1);
> +}
> diff --git a/test/unittest/options/err.ustackframes-too-high.sh b/test/unittest/options/err.ustackframes-too-high.sh
> new file mode 100755
> index 00000000..fc362fff
> --- /dev/null
> +++ b/test/unittest/options/err.ustackframes-too-high.sh
> @@ -0,0 +1,25 @@
> +#!/bin/bash
> +#
> +# Oracle Linux DTrace.
> +# Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
> +# Licensed under the Universal Permissive License v 1.0 as shown at
> +# http://oss.oracle.com/licenses/upl.
> +#
> +
> +dtrace=$1
> +
> +#
> +# ASSERTION: The -xustackframes option value must be within the system limit.
> +#
> +# SECTION: Options and Tunables/Consumer Options
> +#
> +maxframes=$[ `cat /proc/sys/kernel/perf_event_max_stack` + 1 ]
> +
> +$dtrace $dt_flags -xustackframes=$maxframes -qn '
> +BEGIN, ERROR
> +{
> +	trace("ERROR: DTrace should fail to start.");
> +	exit(0);
> +}'
> +
> +exit $?
