Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39A39289E0B
	for <dtrace@lists.linux.dev>; Thu,  3 Jul 2025 17:48:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751564915; cv=fail; b=hpfJ7PrKCwdKsrT0Jg57In9W/SjV+x3dIfKSFSGTJg/KF/UzcxPa+7Z5pZRYkAQ+VWHrerisWfA+iN5pIwmQ0elgf3eGgmvO9bIc28JPNXoeefUGRaYPGCBJJS6VIR6mRorZY11a7DR3b2r1bdpFeaNRuUUr71D3DWkUmMBrGFE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751564915; c=relaxed/simple;
	bh=OFN20Xbrc/7A1rjqEE4fVfKLbLFCnGEL7n4EAqQsvJU=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=hUePqs2roDZtyCcgr+cvhLLlcP/6XhaDcLmAQE5nODUhlUG2jXp9Ql8OoKo8K2lt/TrTFJgJJhNKiqxts+zxU/zfbAE8G+E0X8LGNmwKsC03oPaIydxEIDOvFyJKtAZliwRvFwsp1EANeJ3Z9nY0Ww0c14Xo1bx7G7o4GtGsPcE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=fVkw6SQQ; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=HMUWkgPu; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="fVkw6SQQ";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="HMUWkgPu"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 563DZ5d0002392
	for <dtrace@lists.linux.dev>; Thu, 3 Jul 2025 16:43:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=Zx0Et4EWBm0x0rtDNsDgxHbmnwlNnNa8iw6ND1byFnE=; b=
	fVkw6SQQXcYH+skcKdrvkFhDVwCK8Lf1W57gc8xvN22STQGx/ixSoIqBEJvpqPmj
	08510Fo2YhcISxGxs9olHHlrs4tqegn6h/w6G0sTaLhCuzOa85J+66i7S0zgi6nX
	QaMRg7y3MRDbT2ZaMQrtv8/B99Ccl2bWKffKLdA5p7kyP92gAOFXwIXW/ZsdVHtY
	2ufMU/KArw+oVAqxxfD8x5gflPiehpJXLs1LPIngJpYR+HuMr9ePBhVoCdYkIhDQ
	AXj83l04V989slEGvmfBImrKZzxHX/2NiOfcFGpgRASVoCSnyqS7lNAE5tAOoEZr
	cDVd5Gfd3alL9hsa7e9Gxg==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47jum80mxh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 03 Jul 2025 16:43:15 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 563FHhLX024205
	for <dtrace@lists.linux.dev>; Thu, 3 Jul 2025 16:43:13 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10on2044.outbound.protection.outlook.com [40.107.92.44])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 47jy1hn8f5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 03 Jul 2025 16:43:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gvl4uoIu+ffjxf2GRpiAF5gAHtf5DokPGjHcjH/NXe3kAXZqcGrJhZwfLvkO+wvD59AiRoMYqH82VQCtvUXECCZuiP7H+V64N+zcU7nNKd9HpKsC2WxkOchWn176KkeUFCfWxGT7tjL//IK5m6cBexIpshTXxEOumPr6mFsE1eRIsHLuINfmPHHtJuex6MxvOSleGPEqs5f8QKPMnVI6m2okbnPGafeFFqUdUYWZFSYntfOyVuPegYVrdM9xreFxcaexsEJIBPPwcWcNMPff8mgkapKB4M46XtIoZ5EHI+BCDyuX92EnYSm/UV/JYfElPyq6s50PaKZkA/WfSo798A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zx0Et4EWBm0x0rtDNsDgxHbmnwlNnNa8iw6ND1byFnE=;
 b=GrNfPCcl8q9UJxUUPvkHRcsK91PXzSvqwHuaU5qHP4gwa2ZwAPkbUaDpkFvO2tz/wHTb1NagKfOfV2nEL3do6WjS0Rjdmk97sHFxCgCO5pDjXQHSe5+PjFyT1RmS/z1RxcS/qB7E9MjoDaUHYncNPz780UfuT0E+ma0/iejsI7jlbCcFDfC4sntY5IR5x/rrujEmClj9lM4tUbrp/KN4kL7dKZuL5xVKNGpMFYoeydffq0EE8VADezVY85xU6yb11fHR8qROMFjfR8Q2S7pVhqZqhscFjXbPknI7yQPdyO9qAk2Pwkd9QI0V6IF1R36h4hDZNuCocU2FDahAeODp2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zx0Et4EWBm0x0rtDNsDgxHbmnwlNnNa8iw6ND1byFnE=;
 b=HMUWkgPuAJ0+jRuWYU4oZBv71poyn8QeP5CC4vNPmtoUssoRM6ajnfKw63Nao/tsulrt2wg+IM11Y/cdB/5KArva9KKNdEBcIsUcCUm4r159M49f5wVcKDY0DBUqNKueiaDdDBb9qUfoeA/K7JyVvnb9z5H8utaJe9ASg+B5gyU=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by DM4PR10MB6693.namprd10.prod.outlook.com (2603:10b6:8:113::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.34; Thu, 3 Jul
 2025 16:43:09 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%2]) with mapi id 15.20.8901.018; Thu, 3 Jul 2025
 16:43:08 +0000
Message-ID: <e660b225-4a3c-209f-fae4-8831f6c3229c@oracle.com>
Date: Thu, 3 Jul 2025 12:43:06 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [DTrace-devel] [PATCH] test/utils: add more reliable "get remote
 address" approach
Content-Language: en-US
To: Alan Maguire <alan.maguire@oracle.com>, dtrace@lists.linux.dev
Cc: dtrace-devel@oss.oracle.com
References: <20250703113345.1273604-1-alan.maguire@oracle.com>
From: Eugene Loh <eugene.loh@oracle.com>
In-Reply-To: <20250703113345.1273604-1-alan.maguire@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PH7PR17CA0042.namprd17.prod.outlook.com
 (2603:10b6:510:323::21) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|DM4PR10MB6693:EE_
X-MS-Office365-Filtering-Correlation-Id: 37e7a7a2-efd7-42ee-c865-08ddba50b0bd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?eHVoMDhHaDU5Q1lPNnhLQ0pyZFdPbjUrampDbXlsWWNjbktQdzI2U1hkVWQv?=
 =?utf-8?B?K2ZBdk9XMmxoUEtZcUdzdXRqRG91RzUxZThZWmQ3NmFBM0NJemV6cGJmWUc5?=
 =?utf-8?B?aVQyRm9iS1JUa3pyODYzYXMzT0diYWVYUTE1c1dCRllxMzdjd3QrK09xOVlw?=
 =?utf-8?B?enNKM2VUSTNhNU52RnNka2UwZjVEZERDZ2RQaXFSR251d0F2bkxxR2RhL1Za?=
 =?utf-8?B?bG15MkRtRFZwdnU0U0ZJQlJOOGZYc1dDZStrWWhRNXRBRmtQMjAvbmo3Y0J5?=
 =?utf-8?B?dEUvYjlocW9kZ2M5TXhtdlUrRGpndENRb09xY2dsVVNlYmN1cFA3NTlrenBJ?=
 =?utf-8?B?K0VRTFptM0ExWVEzazRMd1l0VG43L2cvZEo5SWc5a25XUXhSQmFjUUJXNGhP?=
 =?utf-8?B?K0hGMFZVQ3BOT3VZd05nRGI3NjZ6MWxpVjdWSkpFVERHMER0aDlUendVU2RX?=
 =?utf-8?B?anZ1M3R3MTN6clNvamplKzIxcGFTZ1VlYmFrbmlsVUpxalROYnZIWUlpbXpL?=
 =?utf-8?B?S0NVdEFiZXE4T1AxeU0rNXdaTXRHaXNYK2FrdGp6ZUU3RGkxQXVZRCt4MnY4?=
 =?utf-8?B?dWdmRlpKV1MvL1M4ck9UVGdxbUZab1ZTWUZJenZRVVlGZjhzdXJOVWRNZjla?=
 =?utf-8?B?cHh0a05RcjlUczhqcy80SFpQcG16QzZPQWFiZlNianlGVzJRS1dXbWQ4WExp?=
 =?utf-8?B?WTJsSWZaL3JHcm03V2ltdkdkSUlENzRpTGlSUkxLM1RUU3dmZXF5N3Bwd3Va?=
 =?utf-8?B?MFgxVHpaa1RTakhrWS9qejR6UC9aRG5BUVlCODExMkN6YjFvd0lZc1JRSmsx?=
 =?utf-8?B?VjAzb1c1c1FtSEtDZjlmZlVmbTZ1SW9jUUtRRVRwWFZackhFWjhCV3hBMmRW?=
 =?utf-8?B?bmFNR2c2aTNKODRKakJsRm0ycWhnOXlyRDlCaUlDanJnM1JadHJCN3JScmIy?=
 =?utf-8?B?dUhYYXFQbmlOakh2c2xwNkdTa1F2MjFIWnV4R29WaE5tTlZtNkUrTURDM292?=
 =?utf-8?B?dHk0bk1PWDVRbVBJZlV1cnVGRytSclNQSVdZUlRYM1M4cHBWU0FmMVhPZzhL?=
 =?utf-8?B?aS9keWpqMzI3ajBYdUMvMk5SQmVSTmt3Q29NcFBZQUtUdzVDWVYzSFhPQjI1?=
 =?utf-8?B?VnNXanptV0Jud0hnZ1QvblAzQ01wMS9qZ2k4WkdrdzFvSExBSENYU2JtZk9R?=
 =?utf-8?B?b2tVZG00V3hvS01nUXdIaE5lTVZ1WmJGeEd1UWJKL0hXUFFHSC9MVFMvdnRi?=
 =?utf-8?B?cjBFMkZkeEF3eFNTd0xyeW5YVHc1Y2h6OU1Mc2VueWkxdXphRlVkOVh4eFox?=
 =?utf-8?B?TDNMWkM0NkNFblVGWmx1ZkU5WXJoSHZ2RVdSdUZ6MnRibmJ3SDJ3Z05MMmov?=
 =?utf-8?B?V1RqZ3QwMlNPeHZ2UEt0UDIxcjBNY2lwbWFNdmZuajhQUUt6Mnk3V0dQbHUw?=
 =?utf-8?B?ZG44TjdmeUx6V0JPZG5XUGlLR3Nlc2tQUVhTbmtyeGRQRks2bEZWK3VOMzkz?=
 =?utf-8?B?WXJWUHFVZ2Y4eXk3Z1c3UEpJR05YbEhjcGczc3ZXbkc4b1RiYWdGd04vSmRD?=
 =?utf-8?B?UDFGVnhLQmZxNVl1ZEQ5S1A2Ym5MdzBySXFaRklzUzQ4cWtrcHVpRUgyWjFG?=
 =?utf-8?B?SXJKMUg4Wmd1V1p2dUpKMjBvU0dZc2hDeEJxTnNMVWpWWUpHSVRTZ1BoTzdC?=
 =?utf-8?B?VFkzZE1MSGRXdFFRTE9WWjRLcnFCT3lKcVNXd0JBU1RVQ3NmMStucEhMbm9U?=
 =?utf-8?B?a2d5TTZKNCtYVW0zNEZEUTdWUTVFVXhPRjR2bllWSkxnZDhpK3JlaHJjOE1M?=
 =?utf-8?B?SHdCNHViNnlJQngrcGF1RWtoTjRQaFZyWEFLTDE3U1NNLzUrUW91M1ZuNW82?=
 =?utf-8?B?WTZORjArOXVMSnNHMm8vTm83cVdJUWdVejMvSkNBcXlnU0kvWU1DMjQ4ZE9z?=
 =?utf-8?Q?tw/i/jTThOw=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dlMyYnp1MHZjR0lpWEJGb3BjeDdXcmQzbTBhaS9vcyt3alplUEIwbnl0Ulla?=
 =?utf-8?B?QTgyYjVoUGtkK1NlZEdXaFljd1JzcytjYmdMUjFjcGtSY2FOWWJPV3VmNVRP?=
 =?utf-8?B?elNybyt4aVFwTWJ3aG00NnBJQkNYWDZVaW9XVU96ZUlvL3RJeEVPc0dpUnhO?=
 =?utf-8?B?djBHRGErWVM0RVgzemVNeTA5UFJxenk1TGM1cmh1eW0rUFl1Zm1PNFpCYjh2?=
 =?utf-8?B?dkkrc2NWV3FZWVBaWk84SllzOUJSN29DK1JFdmpKMGVGRWtDZ3RlcHRaUkZt?=
 =?utf-8?B?OERFTXl5V1lzaCtVNTdEUEF3dUd0aTI3MFpJOGtMdTNNeE9sUlhOMjlzK2lp?=
 =?utf-8?B?VEt1RUZ3VHlGbXpEMmtIK3JjTHNBM0hCQ24vVlF1MXpZQU1TNG1rK0d4Ky9p?=
 =?utf-8?B?b3ZuWXphU2NuY29uZC8xVVZqYTB6ck56eU1DY0ZCYUlIVE1CS3M2SW5qRTFU?=
 =?utf-8?B?MTlGcDR3WWhwTmJCdUlYRFA3SGFmbTNGYmJJcC9zdk1zZFAza0lnRlVpZE1U?=
 =?utf-8?B?ekNkL2lHK3dPMVNIM2JKU1o4bkJDdG1XV09tWkFBU1dvMGdab1dpTmtDZ0Fy?=
 =?utf-8?B?WWxUVzJmVlVabzFJRXdBVkxxL0tUdXhwOG02cGZCdzN4dzV4bTBQN2ZqRi94?=
 =?utf-8?B?aENqK1NxSTlHVkhtZkJySzlSdmJaOFpJbUhCbkVrS1hHR3kvS0ttckw1d1p3?=
 =?utf-8?B?L25PTDlBM2dYNTJObFUxY0N1MmI2MFQvRzZkVHFQb0Jpa2tFZTNVUndGS3Nk?=
 =?utf-8?B?d0ZkNmxSUWlBSUxxTHUvUi9Kb0JoRjRHbWxQUlFlQnRoaUVLQ080dmllbWRo?=
 =?utf-8?B?MmxHRkpCN3o1YmwyMDRQa3VWdmxqaDQ2d3Y2YjFWTWJ3UTlpbHlQZmx4Ukp6?=
 =?utf-8?B?R1o5MUx2NlNrdDZaQytNRGlUSUNDZWF1ZjVOQTFqUGllU1cvb3FZZ3pEYWh0?=
 =?utf-8?B?N1p5c0NBb0JYWjFYV2lreG05WEdkUnlGT0s3b2tUVE5PSklKTmk5RlF4b2Rr?=
 =?utf-8?B?N2w2MnhOZ1dvRUFRY2lsYXByT0ZqWEFuUlFDeW90RG1URW16WHZ6K2ZBWTNv?=
 =?utf-8?B?SFdSbXFVUWFjNWk2ZkZtZ28yZ2NZckJEUk04UVY4dEtITW1HdmZKSlZSSC9J?=
 =?utf-8?B?TTV6MFAyaEZWZUNJdGdCQUlWM0V0SjR3UWZGRWFiSFpDa0R1VFkvNytyQWRU?=
 =?utf-8?B?NWxoUW5uZ1BEUVdkZFJnckFrR0U5S3UxYmRnWmIzMlMyQTZDc1JNU2lyVVF3?=
 =?utf-8?B?ekhtQ1JQZEwva01PRW9OaEx0TmJOWlFhQ1IzdkphK29tZnJqbjIzUGppOGNk?=
 =?utf-8?B?aWJ3YTZJeEZKSSs3UGowRUpDUEpCUTAvRlBjUWRseFRvWTZrUzc0Z2RGMFV5?=
 =?utf-8?B?elV4TFNvUDY1VWcrbmpQY08xdjloMU5RejlnTkdpN2RwdWFSa2tITDhTajlV?=
 =?utf-8?B?TVdYSHpLdVlNVWs1dmNDcS84Z0tUVXF2MGtiMG0zVjluWGpYaDUzOHg2KzF4?=
 =?utf-8?B?QnVQSFR4cENDSmo4RTdTQ2g0WVpHRXZpS0FJaGVYc3lwOHdISmh0OHdycnNR?=
 =?utf-8?B?S2YzYnl5Ujk2YVV2NEZabUZ2dUVTYVRvNm5oRjIyRHY4d3RZUDJGNlhwL01i?=
 =?utf-8?B?WXEwdEprSkVXYlVBdE9vdnBObnNtYUg5dnRNZlIyaVh2bUpQN2g0Ujg3OS92?=
 =?utf-8?B?c2NqZ0dqM1E5bDRoaVdBQkNzV3lSNGkyQ2pBUzhGSnMzWG1JZm1nRlhDbk9J?=
 =?utf-8?B?bFdENXJrUGtneVBJYjYrcUZWOW92UGM3Z2k3TVQ0eVRmczNlZVlrM09yWTUv?=
 =?utf-8?B?bmYwV1pISklaaDhOV0xZUGNDbXN0QkR4TFNjSkJYNGpFbHZ2MEdqRVBRYWE1?=
 =?utf-8?B?UFQ3YzVSYkRzbldhYVU5MnZyWExyZE5sNG1iOHBYZEZQaWdkcXJqVEdTWTRN?=
 =?utf-8?B?S0M1UHZCYlBJWU9mZmtCMUttbWdzZStsVGhqTzNQcVNtY3dmQkZ2Y3ZNWFln?=
 =?utf-8?B?MkZ6TnNDUVhXQmJRdFU5NWl2Um5ZcUtma2Fvbkh3c0RlR3MwUkpSYktkRHhN?=
 =?utf-8?B?dFpIclZYUVp2a1VFell6UjhRSGlGZEV0ZnNNcytVNHFicEZlRS80VnJnM2NG?=
 =?utf-8?Q?MtZJSbLPRNxakSIxcQB+5ea3d?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	k2m2nGWZNQ9mSmTFeTpsLyhhSwv4Ue/agsASBIL7xB2wFrHR/vMGoseo3nPDCWP/k++rMmx4g33tfTL1roq4p7CaSYV+X0a7KRZh5YQCYTZOCOvbALY+V7vMv3Vbx4mzMEosKG74z2haGCvIbWqyHFseJNOWS5guy4YuQwRTO8PCWlnf3fjxuJ+CuYCq/w2x+5/5R1GSEf3Xd900AIQqt651G/Dbr6YkBd0OPxlFkVr42T/aMxyPxArcaPIYRjqn52lbn8vixUZ9l2emkEUliGdWF+xIaupzFsYe9fcLCaoorIucSHdX3WV+rJoLHYXfd34rmBlWoOhbAN46ZZ0GHuYm4tSWf8jCZfK4iIgLRUg6m3f0/opzU5k4T2uxpG4nQVLNWToPkQzYRR5zFb78KjiVz6ULXrEuzr08WMX27GuJs4xTQIOTqz9A6EYcRJICG9d8TXnh8V7c1rYtdMPzO9Tn0E/xg79l4voAIHqvko3RTpqZDG75li3rPd9bDJ2EwF8yplA8hToPnIpHa32W+X8oxxC/SKsAWO9TyHQ9Qzs1uKUD02jRMF1veEckhuIfG0RAMe29FZvX/GSGOOMX3BzY8C0q5zub37+jTVj46Xs=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 37e7a7a2-efd7-42ee-c865-08ddba50b0bd
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2025 16:43:08.3516
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rUBr32+BaskthNrR6vJ6wbbf2Zx1fgIz9wZZXNN0In7ddtzYfyniUcXwjNOOjiLt9EXY3gfASxIAwdNpHFBPKw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR10MB6693
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-03_04,2025-07-02_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 mlxscore=0 malwarescore=0
 bulkscore=0 suspectscore=0 mlxlogscore=999 phishscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2507030138
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAzMDEzOCBTYWx0ZWRfX/wg8DGLRsgOJ LxdRSx1vC9rXhclNPX15uD3TrDMxGNgn6qXCBNyQ1492PvynUgN6FxqGuhyZPimAYfaTdGFxYeP p70+mUD9bc0EtVYuDfGsendNHhaZgajtASlrs9ZyVMil3qtrr/7rIVsqIj6o9WfLtk8YE7qtKyn
 OjENN8Tte/KYTly5AuVbXAop0Gzez9dAW+r8zy6QgSHUJhFDSw11kpkASZG0UIXeWIsIA4Pcoa9 PqmaoFsE76IX05BHGbM8DRc0GcOvb2yU1BhAHkpfZ0DKeGpXH+RbT1J9EfS9nN7IZqPVhzHOY81 /hxnfCXMCE+thqMai4vl7oDQx8/dPvhJ7+zbVQxrvka641Xu+lP7GRa7dcsXdeZp5gs0OJXW8Wd UdYE+gXz
X-Authority-Analysis: v=2.4 cv=MvBS63ae c=1 sm=1 tr=0 ts=6866b323 b=1 cx=c_pps a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=jiXUiVsNkgtu4FslNzIA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 cc=ntf awl=host:12058
X-Proofpoint-ORIG-GUID: IuKwoQxcxTdyP9khXaZIIQJKQs51zvmZ
X-Proofpoint-GUID: IuKwoQxcxTdyP9khXaZIIQJKQs51zvmZ

Reviewed-by: Eugene Loh <eugene.loh@oracle.com>

I confess I don't understand all the details, but it seems like a nice 
improvement.  Thanks.

I tested and it looks good (modulo the OL8 UEK6 issue mentioned in the 
patch 3/4 feedback).

I think you need to update Copyright years in the modified files. And...

On 7/3/25 07:33, Alan Maguire via DTrace-devel wrote:

> The current approach of looking for remote addresses
> is brittle and fails in many environments; it checks the
> default route gateway and looks for open ports in the TCP
> case.
>
> We can however achieve the same goal reliably by creating
> a network namespace on the system and configuring either
> IPv4 or IPv6 addresses on the namespaced and local veth
> interfaces that support communication between namespaces.
> If a tcp port is required start sshd to listen on that port.

Maybe a comma after "required"?

> Teardown is managed in runtest.sh as signal handling for
> timeouts within the test scripts is not working; a trap
> function does not trigger for TERM.

I'm having trouble parsing the text before the semicolon.  I think I 
understand it, but cannot seem to figure out the grammar.
