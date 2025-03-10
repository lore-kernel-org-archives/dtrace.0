Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CF7521A44B
	for <dtrace@lists.linux.dev>; Mon, 10 Mar 2025 22:03:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741644193; cv=fail; b=CV7SNyS42VEeR7CfM0wPe14cmmjbhLCDsB2MLp6uc0h7jFUSee0Fl1+t9TUK/ZXZqTyyxrMGVepaYTFvS86Gr9wPjoeVocNvHL9auavllZwjPd8sfuRDArrmdScTVdWqBrbI1av53KXaxMNQcGSAnjTLjr1tpx4aHEV/169RKk0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741644193; c=relaxed/simple;
	bh=7SsSvINSYisNi+A0qd33zjNvUx8849Iw3jFDyXSngv4=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=QOg+utwoTncxb0AsvQpvOTCT3e7i+vgvw2qD/HwY1EUbmshjj5roohSNEiu3g+CjJT6JjgsNndUtbgkPgdU4SS19h3+KkfsK/h8FDWmDezk5GwjIudMBmVQb2PcXAtpXA7swE4awk+9qatihcDkxUDY2A7mrvRBl2gdGVL7RDcc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=km8SUmoe; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=GPTNOKcu; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="km8SUmoe";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="GPTNOKcu"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52ALfn2N019755
	for <dtrace@lists.linux.dev>; Mon, 10 Mar 2025 22:03:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=LZEVpKaoaEWr3OLD/yYEPXXY/ArTyV/o00k57prNcO0=; b=
	km8SUmoe6dkrCSSudCasZygB1GnlPsqzZNjQj0OmhN3n0xc17YNOi7CEb4UeGfoZ
	qxaJ0sX30um8WO0k6rFMyW/R3jZNbuShlAtcyoSjbdZor16EJtQ5b+SAvQkK555b
	5OK6824HTj4t5a/6Wd3EmeeqShHAdUD6WlvV6ytTf5gBa3I/xeLNZyf+KuMCJIje
	54v17HUDu4JFnC/Pjjrql02BQcwj6QP8rLy7S8HQbVZjJ89VmzJKj+isXN4nzSFI
	IDnLXGP2ia2elBHSJSE8JZm/x5Ye20DEi7JmaAqBlB/kkw8FqNYwAHUXQyGVDyEs
	JGSkqkKHS6s7cqkJRMDqvg==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 458eeu3mrt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 10 Mar 2025 22:03:10 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 52ALUNB1026219
	for <dtrace@lists.linux.dev>; Mon, 10 Mar 2025 22:03:10 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2173.outbound.protection.outlook.com [104.47.56.173])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 458cb870ku-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 10 Mar 2025 22:03:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hHeZ5PhUadYyHvEK5U8qBFopGxP309fLXsPdHozUR+QvHKCg9GTP2r1/yv2irzg2kxhpWUBd068b3WnALq2tv6x6SPCbG3YmloizrcR2BFS/uE+itj3neiRsXrp3194eS6XYN3BETRq81/Mi7wMC+UMjNgY6egw+bVFhn2n4ZDIPfPj1seE+zMPvVXC+UBYiLNXh+UnfRifX9GaQqgXYa6mXPoZkxiwirgCnbL4hFcCLP14Ajqx+lBfeQ1nkx4jkBQJVTzql7YvEqRgVBXZPJFuQ+gCDo3w7P8nEC/a+Q7TrPYhAxjxbnhunuBo5tGHkmw52zeb/8Y0OjaLO04H2kA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LZEVpKaoaEWr3OLD/yYEPXXY/ArTyV/o00k57prNcO0=;
 b=Yg7+JtIeeTAMImrM3U0gBdClTRGGePBEpPbL0Xisnl/AIuMz7a2OKf00xrQm0QDjws/KBPXVJWZg0zf70nrm5SqP0rsRFpBG/Vqff9ClgpkCe3tlS1fhsyoJhy8g8gJLVtSQHvJcs1UnxSal5tWGnRtt5UEpRLxr0wDLk2p/6RAVJhFdlhyIBS2smk0s8bXJsQN8HOZeOY02wZcbJvpW8NwVOAcfXppKJoqllKhgcoVo/4orbqIZtQOD68tRg+PD/tymvLt8KmkgvOhv09BJYYQjo8CDV74xwESN4LlU5Zd7GcN7UmX1siZk7u2uQweBngvkNa6KQZ6upf/Rma7aSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LZEVpKaoaEWr3OLD/yYEPXXY/ArTyV/o00k57prNcO0=;
 b=GPTNOKcuwyJvj3CE7hk2ji4Soww+Po4VZFzc578Gw7CEjo0eoaHRh36aHfyAO7EjPrkKrz+hDV0/ny5MPxPc86cB+nGHM6e1K2xYHxabLToOpDMWelo4pz9O+C2LBtubJSIU/1DU7o49QKP5u97PbF3D1V9mrHbCvJbac4MeVOg=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by PH7PR10MB5674.namprd10.prod.outlook.com (2603:10b6:510:126::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.27; Mon, 10 Mar
 2025 22:03:07 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%5]) with mapi id 15.20.8511.026; Mon, 10 Mar 2025
 22:03:07 +0000
Message-ID: <e87a5ea0-89af-f95d-5b50-c6d3ea71f37c@oracle.com>
Date: Mon, 10 Mar 2025 18:03:03 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 3/8] rawfbt: perform lookup on true symbol names
Content-Language: en-US
To: Kris Van Hees <kris.van.hees@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
References: <20250307213441.9495-1-kris.van.hees@oracle.com>
 <20250307213441.9495-2-kris.van.hees@oracle.com>
From: Eugene Loh <eugene.loh@oracle.com>
In-Reply-To: <20250307213441.9495-2-kris.van.hees@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR02CA0010.namprd02.prod.outlook.com
 (2603:10b6:a02:ee::23) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|PH7PR10MB5674:EE_
X-MS-Office365-Filtering-Correlation-Id: dfab9eb1-f909-415a-4117-08dd601f568f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WmNpQkZMc2NTTWRFSm5IdTMxOUVpT0JieFFVUy9hcFpwcDZKNmNvZldVUmE2?=
 =?utf-8?B?SHJXSkdNZTZSUVVwTi9MZ29jZEI5K3FzM3RrMlltQnRuQTd0citMLzYxT0ZI?=
 =?utf-8?B?c3gvb0Z5MUc1SlpkbzlZazVGZ0lSYlh1UExWYzVJb1FZbHBySm1VdktUMksy?=
 =?utf-8?B?SmFtNGQxQi9FOXUyU0FWSzg0dkthMzZxaDJPQzBSK0ROUEU5eDloQ2hKWHRv?=
 =?utf-8?B?ZTdHMTRSd1o3UHN4cEFROHloOFNEV1c4YU5lZENCYWt0bTJ1WnlBcjhYUUxE?=
 =?utf-8?B?VFFVTlV4c3Z1RnIxZ2Rqa3NobWdhOVhQUFY3Sm1LMDM3bmg2akF1KzBkVVc3?=
 =?utf-8?B?ejZiaEtoVE8vYjRmd2M1WTBRMDNwWC91MHVNMk1FMzRnVFdFY0dab1dncW9y?=
 =?utf-8?B?VEEzeVNaRU93b3RYb3FsaVBIeG1ZdldjTEZzUnQ0RWhGeDI1SkVXcnQxR3RB?=
 =?utf-8?B?c29weGltSmFVaGY4c3c5czl3bnMyVDg1a0lPK0RwS1QyaEE4NWh0ay9KOEpW?=
 =?utf-8?B?UTFvb2oxNVhJYlhlUkhyVmp0Z0JVMnd4MXNaZk92bzZzQTFDZlp0VGtVZEFy?=
 =?utf-8?B?eHB0S3RlYkZRblRFcWU4U2Q1VDVMS0RnSzJwMEZHaklvN3NqNmZuTHJHTndh?=
 =?utf-8?B?aU5OYVFSdVcvNVJqOTBSY0xXVlJmMW1XMGt3ZWk0ZkwwNmFzc1FlVFNNb3Bj?=
 =?utf-8?B?KzVza01QN3NBSkpCWTlTa3hQbWdYS1JQd241SUJHWmZiVVlmKzlGcm1xRE83?=
 =?utf-8?B?eFdEUXlJTHZ5azdncDdLVDBrSmVYMW9IWHZTR2xyRi9NaU1BdGFMOFRnV2hE?=
 =?utf-8?B?OHdsVUJRZFBJVHhhbU02WjRYMm1FQU9Qc2pocnZ0ZDlHeW5menNjU2tRSFl0?=
 =?utf-8?B?cWdNSlBNZmpWV2Z4dWxJeEtkemdvL1VpYXgyYlc0U0dKL1J2ZU1QeURaY0Y2?=
 =?utf-8?B?cnpSQ2t1QTFKVSthaW5iMlgzaFl0WExoNkx6LzJpdFdpc2l6UzVINEdFNFp5?=
 =?utf-8?B?dWxxS0NyS1N0dEdxRW94NkFJMFYzam1WbTRhOUZ2MTdBczlUbEVhd0IwMG41?=
 =?utf-8?B?MHZVN2NBWWQrNDZvTEtES3VRMTBrVk1Bd1BlUitqZkwvUEJRVy9wNHNPV3pK?=
 =?utf-8?B?RzFQT2dBWEJCR0hObEpLZ04yc2hvVnJLQnhkYUVvS1ZWWS8rZEZJVTNZYy8x?=
 =?utf-8?B?QWF4eXJNb01aaTdyRmtyZEVRNWRXSlhzRjVtTDBnWlUrT2F6bTg3TWROM0Fn?=
 =?utf-8?B?YllLVDBCVVZGTTFxbnBCS0J2VGRocldRcTh2ei9kWkNScnRRZFlQV3p3ZEFr?=
 =?utf-8?B?cFoxcUw5WXg1Vnk1N2wyc2tFOEx1N25mQmpOaHBJZzFRNC9ja0I2ckViZ3dN?=
 =?utf-8?B?Rm5mdVUxS0pHM09iU1AxUUxGME92ZDVMTGdqWjhUYzR6T1dRWkVJcXNXeE9I?=
 =?utf-8?B?MWlucm5yczRXd0Z3SzU1Ri9SaWx4QWRpeGdQYzBjU3NSNCtjK29DVXBiZFRR?=
 =?utf-8?B?eGY1U3FCTmFFSHFQZWlGQ3ZRN20yemFSN2FFdTFKR3l3OXdtREIrYXZyS1ox?=
 =?utf-8?B?cm9RWW4zbzlGSWEwRmx2S0tWSXEwOFRHZmR2NlhxMnVRY2JZTUVLTm9Dd3RT?=
 =?utf-8?B?anpNWHduWkdKNTVIVXVITlpkQStUMVc5S0FWZ1dWbFAycmlyVzRUSDZMK2g4?=
 =?utf-8?B?dHdqd2RnRzdwdlBHRXdsWWxpNnEyT3BHS1IvMmlYK3pKbkhVZitlODBCYm9j?=
 =?utf-8?B?dTNCODQrZFgxcDRtRE5vdzZTeXhHcjdWVXZ2Y3VuU0JlejdXaS9sUzUyVnpp?=
 =?utf-8?B?cDRwL2Q3RVJadmFwcHZvVE11enVqMWdLdkczWVdkSzJESEZpeEhKV3Q1bVEz?=
 =?utf-8?Q?FXNs4sHIlMNK9?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?U29RM2s0M2N6S0hQaHNvWFh4T0lvSkNsOUlzeDJBMGRWYXl0K25RN0pwY3Qr?=
 =?utf-8?B?OUFRVmkxR3docHRpMyt0Rm9tNURJVDI2SnFKYTdoTjlSLzJzSlBET1ZTbE5M?=
 =?utf-8?B?cEh0OGlSWnhxUlcrYnVTM3NaSEQ2L2xDK1Z6TmpiVnJDTmxwdmtDMjdXbkJR?=
 =?utf-8?B?aXdFd2ZxbUhMYmJkWlVUeVRRbVFESm1VeFhLVFlQVTZpYTJ5RlZOdEEzRFp0?=
 =?utf-8?B?NFNqaDUvdVdIOWhMRDBaK2NkVno4aHF0ZXJHU2R6L3VLd0VlcUtLcVJvcW9h?=
 =?utf-8?B?SlNaQ0xlc2tnajlaeHI1Z0JpZ0VGWS9ORE54Q1k3MmVGRDVrRGVhRnFpTExs?=
 =?utf-8?B?aWMwdmh0WnJlKzJ5NERxaW9WUEUxc2k2VlYxaGQ5OUlwSHJLdWRBRkFnaXNt?=
 =?utf-8?B?cEdnY25NYXR2L28zbkFmVFQzOXVCSEtwRUZBRit3YVJkN0l2YWhzV2NGa0Yv?=
 =?utf-8?B?NGdxem5jby9lVlh4ZDFhS0xUNkNjaTFyTmVwenNhSDNLQWZxRjVnRXVVV0Rm?=
 =?utf-8?B?anBqMzR3a292MWhHUzUvL0VCcE4vdFBSKzdGY0xyTmJiaGhTRnQrOEJzeFFY?=
 =?utf-8?B?TG81bzVWemFONjZzRW5LUlJOL083STY5d0Nlbnl5T0h0Tng5Q3liV3dWNGpP?=
 =?utf-8?B?M3Zja2VuWnZLR2NKQzhZMzNtcjR6S3VmOW1jSHY3RHVEYXhqdituMFhzU1Rl?=
 =?utf-8?B?VHIvTFliM0tSVHIxOVAyWkRNQmtUNnpWeTBXcDlUYTN2SjYyRU5jQS9yTlJp?=
 =?utf-8?B?THh2b2o5dmJiNGZiMXNVWGtnbUgxdEU0V3FyTkgvZ3ByMHIvdHFDc2pmRjFS?=
 =?utf-8?B?M2ZNeis4bC92NWxBVkpYR1VSR210MGU4U2pFTTU2SDk4Q3ltTjd6YVBBemt1?=
 =?utf-8?B?a2Rua0FvUGdsZFBtaVByVmJSMTd3M2hGbWczaUEya1FrOTYzR1FpdjlyV2RV?=
 =?utf-8?B?eFdYZ3Z0dDJhYkJvLzc3ck1pNXZqQ0FpSFdyVG5vdUJNR0VROVpOaGhMeFRR?=
 =?utf-8?B?cm52U2hnN0JTUm5penQwcDIxN1dwZzZkZzAvNWxlRjJObWxpSWpCb3UvZE4w?=
 =?utf-8?B?SVltZ0xkbFh0ZzlUenh0T3VRYjZOQ3BLQ1BHM1FxS0FkWnZRYkM2ZWZDc2gx?=
 =?utf-8?B?eGFVVmFEMGNsVkdmNnlvdDVMZnQrV21LSTVqNjdlM0wrZW1WSGdhcFVVdkxY?=
 =?utf-8?B?d1dHOUdJK2g1a2J6U2Jhc053bEtKay80bnVBMGdLalhTOC9QRi8wN3JBODVB?=
 =?utf-8?B?dzgrbGdWVkNQWFg0aHlzNEtGVTVnN0NGaDRPcWYxdEcrNG9vdXBpczI3UitY?=
 =?utf-8?B?em5BV2RCelkrSStSV0tEcXdIb3FFeWdzbSsxc2ZaSUNxditVMitPMEJvYVM1?=
 =?utf-8?B?NlNvR1hwaWN6dWxuTWxBQ0JaRi9qUTZlbXYxalRqK09vWUVyY2wyV0FUWUVa?=
 =?utf-8?B?RTd5YlBoV3RYaTd4cXFxS3U4SGU1VENPSlpOazFodE9mZzRnaTdsL2EvOVRC?=
 =?utf-8?B?ZkY5SXpoWHF6NzR1MzJlTkR5OU9td25MV2c2SFFZR1h6RS93UGk4bk9iZzBD?=
 =?utf-8?B?VnM2a0ZsQWJRVnZwNC8wc29DcElYK211NlNnUkV0WFloM1NDbE1XSFMzb3pU?=
 =?utf-8?B?aWp5emVuZ2dnK1EvdnhNSlh4SUlsQ0l0K3BUcEJuZWNNbWI5c3hPSVh6NlIz?=
 =?utf-8?B?K0FYcTNlM09WQzlTMXlMSDdnM3FPcll4b0ZTTjJCck1EVzNlalROekovbCt2?=
 =?utf-8?B?cXJ3cmdxWE1JYzBxVUlyejdqNVN3NFFqaWxocU5yaE9xZkFFeUpOc3JtWU0z?=
 =?utf-8?B?UTRyZXJNazdVcmpiV1kwREVPVXZKRVpKQXdQOXRKMmNjT2pYazB3NmJualdY?=
 =?utf-8?B?QlpLS2FUS29zczBMT3dFUTFyd0poTERTbzFyMWsxcmI3cDZtbnNLb1kraE5I?=
 =?utf-8?B?WndIKzJLTG9qMnVhQkEveEFrMndvT1hpZHo3aUxKYXEvQlluTU0yc1FCZEU4?=
 =?utf-8?B?OS8vUnBFS1hHUkJjWitPbVVWRGJkWVZQblA0OFlzemNmc0lmeEVMRENmQnlE?=
 =?utf-8?B?Q3dEWWZKZkhwcks2QWl4Zk84VWRKYkFoVUJubUs2MlBKdHg4RVJORkVIWHFS?=
 =?utf-8?Q?kGOUOa6dkfpK7Gmwuib4xpZVh?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	b3TzEzKd9SIAe8lIdAFp01Y10QOw5Q7NpPu75xYYryLzI+iEwRAjO0FvISkzCefdEw4bWNZmT7pTO28A6HfmFUx1X4354fUjEH7Oyj1uYf53dl7Yy+DzTiQWn6yuIRd1tdj6dB68N9+CDeDiHvKcgDQ2AUQu/VvKbzJL5tEPcTQDY18+aAhEUd/FNTOS21y7kMk3Gd3x8x9tZA27foQSBQvry/yEfQYZqMxbzQqhPu73vkUQIM3l92+eytrKlHyRgqgzAx3Sdji9CIhHW4BkcodIbBiixfgg46BCLcnfnCgZWCtDL82ydalIqNdusF4yQ/pWqnX1sLo5IVLeIsZKofSAvqG9jdrk9g1k0EUO00MdQFLBb9mO+JOLSrRq3m1tPi5ZCOwJQKmQ/j8A2eoRBpQqFTDWr6iHEbC8jsh0pdukcPObTKnLL7P2nGrPefDxLLANsx5hxr9TKRInqW5xlhyN3VUL7oVjFyoYP2OQ/Tn+iVsu2aGVNV9Srg0CYuzldAufq71Jy1zSHMRezjeUacxnSFS0VwfzdgKF302bJCOnaxZ+sgvTxcEfsYH6jSolFHl7G9aHxPo1oHPLR6rZ5jf/rCfuDUqVhV/mXbEFzlI=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dfab9eb1-f909-415a-4117-08dd601f568f
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2025 22:03:07.0637
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Yl9Xe3cTcLlpWbvkw5w9X8NPbsVNyVwiA9lNKzlfqLjbrTznA6AzFOy0lvINz8V2s3SPunYSsslb6CNECLN5zw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB5674
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-10_08,2025-03-07_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 mlxscore=0 spamscore=0
 adultscore=0 phishscore=0 malwarescore=0 suspectscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2502100000
 definitions=main-2503100167
X-Proofpoint-ORIG-GUID: Pc9vGHsQeNUZ4RCdG6ieS7NivHtC58e6
X-Proofpoint-GUID: Pc9vGHsQeNUZ4RCdG6ieS7NivHtC58e6

Reviewed-by: Eugene Loh <eugene.loh@oracle.com>

On 3/7/25 16:34, Kris Van Hees wrote:
> When encountering a <sym>.<suffix> symbol, a symbol lookup was done for
> <sym> instead of <sym>.<suffix> under the assumption that names with .
> in them were not listed in kallsyms.  But that is not true.
>
> Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
> ---
>   libdtrace/dt_prov_rawfbt.c | 18 ------------------
>   1 file changed, 18 deletions(-)
>
> diff --git a/libdtrace/dt_prov_rawfbt.c b/libdtrace/dt_prov_rawfbt.c
> index 4c8e8130..62f2f4f0 100644
> --- a/libdtrace/dt_prov_rawfbt.c
> +++ b/libdtrace/dt_prov_rawfbt.c
> @@ -122,27 +122,9 @@ static int populate(dtrace_hdl_t *dtp)
>   		 * try to determine the module name.
>   		 */
>   		if (!p) {
> -			char	*q;
> -
> -			/*
> -			 * For synthetic symbol names (those containing '.'),
> -			 * we need to use the base name (before the '.') for
> -			 * module name lookup, because the synthetic forms are
> -			 * not recorded in kallsyms information.
> -			 *
> -			 * We replace the first '.' with a 0 to terminate the
> -			 * string, and after the lookup, we put it back.
> -			 */
> -			q = strchr(buf, '.');
> -			if (q != NULL)
> -				*q = '\0';
> -
>   			if (dtrace_lookup_by_name(dtp, DTRACE_OBJ_KMODS, buf,
>   						  NULL, &sip) == 0)
>   				mod = sip.object;
> -
> -			if (q != NULL)
> -				*q = '.';
>   		} else
>   			mod = p;
>   
