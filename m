Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D9F6272E5E
	for <dtrace@lists.linux.dev>; Thu, 14 Aug 2025 20:54:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755204878; cv=fail; b=Zy9++XdOvh706rq6k9ucV7Xzu5v51YV548HkmqDSoPhU1VmnHa2CUg0X8avqwWtsUBKaVXgOo7JqYZXjH92C90/XoTM1I8HZ/FhDapYcac8le4B2ondX2bGLCSlhV2apt4w0enFUe5krFtfKbrDP0DO8N5D0ORwSEz25Hr1p6GM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755204878; c=relaxed/simple;
	bh=nPQ2cU3GgYxkJ4ZY61on0HcxvSlsFljIxRT/o5dHgwU=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=cjIYVpDtBqFXSCgsk6uD2qJNBn8+DPtd9PZHBLs9FhRY0GAvR9C0JEIX7QyQq9eX/nsXk0uqK60oI221QZ5/bkv84YGM+BJ/DIBJ5RmsPL7SDzN9/PuWDExbXtHwhctwwJ8tlC4dV2KavBIlAECyRSoSufAyrcteeQM0hEQdoJM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=d4pAK/nH; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=n+ME8DQE; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="d4pAK/nH";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="n+ME8DQE"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57EHfwN1020893
	for <dtrace@lists.linux.dev>; Thu, 14 Aug 2025 20:54:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=wdUYIps9hh44scTUEkcQ8G6Kg7+/BwhMobxYN6Go6Hs=; b=
	d4pAK/nHgM9HzSQWdnfCsZEcKq0xBOhwa2e77Q0QnNrBYM9AxFfjOYMzinH+6o6N
	v1oa2iFyzxVtgUk4YOtXMB5k7tqgLN/7Sdasu7zFPiXd6KQsAB/nB8KVz6XnwpDg
	Zxl9ttVnIXu9NaqpiSLKHmYCSTL2t4mVr7SP1N/m0kZlhDIurfOKrv6IzvsFOSFx
	JrMMftxXFC/yjYBby4m2oBesTZbOe/WbG286hvtwCyya2lrUpb41PJiwvYOM5CnX
	ukh2C2laN8f/2N9t1zfkgRl95/JMjt5aQks19eMu+/CXFuvkejaGrgvOs320FKBN
	lVDKFwWcNZ5nftVMpJh79Q==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 48dxcfb2dv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 14 Aug 2025 20:54:35 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 57EJM5QL009648
	for <dtrace@lists.linux.dev>; Thu, 14 Aug 2025 20:54:35 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11on2048.outbound.protection.outlook.com [40.107.220.48])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 48dvskjfx5-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 14 Aug 2025 20:54:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pHM4t3SIhZ3fQsti6srmnV2snz+4b/reaiSs2zWAGiA4KTXXyCp91F+Q/ogJ3kyUtmKJu+Y/gekHNO2B4ktllu2J0rDQ8qnuy7IVPV8t1zFQApsdK/mMZgtH59jXVYZTHsfFvt0WGYJh/qiWT6IHkil238bawQbUcTQ0jK/3H4un4C3O9+o70sYSVsca8JxNbhr8PVTSqeff6yrVVOeL0/c57L2Lo0yqdb7ZB38IjbviwncbVoELLpaMF0nFA1CzSU/djf4hpGCz29Z1mzO1ig5/evmp0jsGJJHTGOsIF8bUfCBc7NI8eLijwlIkiLRvTwd4KvrJiQrF3esoXD3N4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wdUYIps9hh44scTUEkcQ8G6Kg7+/BwhMobxYN6Go6Hs=;
 b=a2/VduQpl8Z7LywQgjcBbrtTMyB2+VwmwqPF1YtsfnCQbpl/AkSMdghBEyZpbC2dayEZfX99XOoFbBhpvepjjKBbM/1D403xRJpiqxKd+wGmO7GJjcNhU8dE1vDl746Kw/NWhaR6MwkSuVK5dDn1p9q7SbEEzm5dhAjnLUuu/kE+RLMCzoY8ky5cLjYGFDWsCFt5a8CouVP4lhVmxtLgVs3k96gK0ea1rmKLf9L9P9Hq/yhlQClCrzgXdx126WAKVNqbz+mAuolOjGRJo/cv4C18i2XlUScyT+OtZH9vvNy0XDQCgy/COMa38v3wy/lbZWBofmQhQlT1DqBOswoGSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wdUYIps9hh44scTUEkcQ8G6Kg7+/BwhMobxYN6Go6Hs=;
 b=n+ME8DQEi30bKzqt271WfC/ql98EYcsnxNTFltHZOJKm33RyNFjVB/TM3294sKbr9d1mxNPm9t0hNXxqDCo3nSPVT48w2s2NZR/gGIC61kkXf7IGMQd5LyQ+DCLIJRgiwyDvP3+llMFq3MRj94gp1Zh/Vg7DhB5Rpv+iAxbHk5w=
Received: from SJ0PR10MB5647.namprd10.prod.outlook.com (2603:10b6:a03:3da::17)
 by PH7PR10MB7720.namprd10.prod.outlook.com (2603:10b6:510:2fe::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.16; Thu, 14 Aug
 2025 20:54:31 +0000
Received: from SJ0PR10MB5647.namprd10.prod.outlook.com
 ([fe80::8db4:df1d:6afd:e4a7]) by SJ0PR10MB5647.namprd10.prod.outlook.com
 ([fe80::8db4:df1d:6afd:e4a7%6]) with mapi id 15.20.9031.012; Thu, 14 Aug 2025
 20:54:30 +0000
Message-ID: <518cd4bd-4c49-0969-3e16-a144d519aba6@oracle.com>
Date: Thu, 14 Aug 2025 16:54:29 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v2 4/7] trace: handle the empty string in a sensible way
Content-Language: en-US
To: Kris Van Hees <kris.van.hees@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
References: <SJ0PR10MB5672990FEC38660C30ED473EC235A@SJ0PR10MB5672.namprd10.prod.outlook.com>
From: Eugene Loh <eugene.loh@oracle.com>
In-Reply-To: <SJ0PR10MB5672990FEC38660C30ED473EC235A@SJ0PR10MB5672.namprd10.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY1P220CA0004.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:59d::15) To SJ0PR10MB5647.namprd10.prod.outlook.com
 (2603:10b6:a03:3da::17)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5647:EE_|PH7PR10MB7720:EE_
X-MS-Office365-Filtering-Correlation-Id: 3b414c03-661d-45b9-9bd4-08dddb74c3fd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TEU2WnJuRDhjblZGNTZxQWMrcDBNd0haMVNwNTJsRXYvUFJxY3JzbXNxUS9j?=
 =?utf-8?B?S0MvMXNSbkp3NTk1anZWSGY0SmU0Qlp6RTBEaUJvRG1LQnhDVXBVMFRvVDlh?=
 =?utf-8?B?TkVzSisyU2tHaTVtL3UzTVJaZGxLb2dkZm1IaWh4YUdQMG9uZ2JGVE9HM2RQ?=
 =?utf-8?B?eGJpaFN2dTByckdZQ1A5M1VHUXZZYys3RjBiUXR0WkV4TFErcU13azB5LzYw?=
 =?utf-8?B?Rnk1TnJsUDNYNFJjVFhIek1WazFhNmF3OTE3T2JxQ0FqT203M3FNNkszYm1n?=
 =?utf-8?B?ZCtEOFdEOEdPSlNQUktGNnJIVEpseWl1d0lvMlM0WWZzOU5BMEUrODk3azFa?=
 =?utf-8?B?T1VtbHFOWER0WGdUWnpBL0Q1VDRUREM0cWxnSG9ESENwZW9zd01rcDhKdmJV?=
 =?utf-8?B?ckQxSDBZdGJZRkUzc3c1RFVYbXJGM09LcjNOcjN0WDhydzFHYVlEVmp1aTBC?=
 =?utf-8?B?akR0M3lxdkJVTlNFeHgyMHo0eGpXb3hKdHF5Ny96cytRbExPcE9hWUxjQWV2?=
 =?utf-8?B?ajYrVnpQSHBreVNzRUJrUjk2cnl6UGFCVGgvZzlDQ2NnajJLMlFTbWxMVUMx?=
 =?utf-8?B?TWFXUEVqN28yN2tIbHBDSjUyc1FPTEg5MFY1STZ6YzEyN3NSSmExemRtdytm?=
 =?utf-8?B?TytqQ3hjSHlWNGRjR1pWK2JVOHBUMjIxcDEweHc3ZmtLNXZwUUcyU1ZTcE16?=
 =?utf-8?B?VThtTXIyMFFzbmZuaTZiaU1oT0ZZSWpZbFNzWDBEdXkzYXNLWS9lYzRYazU2?=
 =?utf-8?B?K2JWMWN0QncvNTYvTDFjbTkxMklvVzJ6eU1PcFAxLzJPeGpQRWNpUFJ6eXAv?=
 =?utf-8?B?VmlwSHdSUktROGd2bGxja3FpRVd3RElMRkRJeVk3cDJlVDM1M3RTUGp2Q1NT?=
 =?utf-8?B?R1ExSTJEN1A3aldqeEVJdUhyL20zL0FpdWltZUxkU0xVdWhnZVNKSFh5NWcw?=
 =?utf-8?B?YXpPbWU0dmNjUllEL1l2SFp4cTJtRmJNeHErK1NCdGl6QndGcXhJa3h6MlVE?=
 =?utf-8?B?enhLais3T1JuR2E3U2RHTERjRzM4V0wyTnkrajdUd1RjRm1QbWZibUtDVWpD?=
 =?utf-8?B?U0I1Q01xczdBSjUyaFNxblB0RWtmSXhJRGRUbS9HQis5ak5TdFJTeXRTbDcy?=
 =?utf-8?B?bnBHcUhKN1JuamFSVDJnQTNMdm5aUU9lQWNhVi8vbGZJUUFBQXVZSkFjNGRx?=
 =?utf-8?B?WmZNTHVDTWVQWUNObWJ0NUR3VjJaZHY1TXM4OGdrMC94WGJHMzh1cExxY2Vk?=
 =?utf-8?B?YU03RHJvUVpqVlVwWmZtaXZiUk91ZjVNcDhuc0t5cWgwNHByQ0dlaExRRUE1?=
 =?utf-8?B?dkJjdFZrUS9TZ2pXbXlETU1RbTFDTytPd2Y4bitSbDFkV3Fpc3NMcEtGT1pw?=
 =?utf-8?B?MWVEZ2Y5Sm00UDdxNlFwZVlBY2xRejFIVXlXMkVHbTZLMUdyQWg0RVVJZjN5?=
 =?utf-8?B?QjhxNDJzYnlyeG94Um4rVzhVZW5BVGU1V3c0UG4yTmk2Nm9kTXFUbUdLUTk1?=
 =?utf-8?B?Uzg2cGo1TGJBc3E1RmlhekE5UUQ2VE8rdjcwR0M3TGNhRmVlbDlReHhiWkwy?=
 =?utf-8?B?Vzd6dDZMbjFZaHVTclc3VVZsaTk4OG9vSTRHWjFTTy9HaGxjeFNiMy8rdHdw?=
 =?utf-8?B?d1RzMWZvZ0FrSy9SY2VGN2N0dnNzSXVJSnhSdi9qWHdBc1JZRkNSbGlnb1pZ?=
 =?utf-8?B?RDFCbTIyS1ZKTEVoVUVqWndVbjI0UDVqRGxRWnhVT3gxcGZ3cDdES0NXejhR?=
 =?utf-8?B?NlFDWkhUajNPaTBQd3JZZzg5bktjajY4clcvNmIrN3dxbVNwRWRKc0FkTHVE?=
 =?utf-8?B?UmpVVmRPY21QaWRtZ0VROUF4eU0xSVpNTGdadTlQdERCN014MFNSNDRVODFB?=
 =?utf-8?B?cHNLdEp0MUkxbHQvMGE1KzZSakJkNWpMWlU5NHd0VHpWOUlrTnY5V2NXd29z?=
 =?utf-8?Q?HSETfohdAQo=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB5647.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WithNXVYcW1GcUVLVTJCaXVaL2xTNGRpamdWM2paenphVUpXckdaYjZsemxI?=
 =?utf-8?B?WXdocGtsS1E3V0EwamZtQ2lXc0RFRUdOZEc2WTBuQWl4TlZCSC95d3kzcWtr?=
 =?utf-8?B?SWRXTFFidEJqRWdYOFZINmllM3F0U2dISjBVRjZEcDlUdUc1OGZuTFdJT09G?=
 =?utf-8?B?ZTJXdDhKaDU5ZEQyVTdUaVlNbWdLbHdYRUxFMUdBaGZTMG9HMHRSRWd5aEdV?=
 =?utf-8?B?TXlIY0VTNldTaEhPT0FpSFRJMjQrTXZ2TlNHa2Y5cEdSY0JIdGhzM3NwVEFz?=
 =?utf-8?B?eXBSNHFkUzlzVGZ1YlBCQmx1NSs5Tlk4UHJaRVlhb01XR3lKV1RjWDBFNU5i?=
 =?utf-8?B?eWg3MFFxN01SeDl2dk0wZFNneGlrNEdBODhuY0YxT05qVmhQUHhETEVSVEFj?=
 =?utf-8?B?NjJqS2wvdUUvK0lvU21FOXNmSm03YnJKOGFqbUFKb2NwOGt1eTJSVURpa0Nk?=
 =?utf-8?B?WExHVnJSUkhLZkVhQkpYeEN0MVV0SHo3NkVSR2lYbFI0KzZjbXVTV2dCZGdr?=
 =?utf-8?B?enJxYkN0V2dGRWZWL2M4anZ1elRCZ3FrUFBvZUl5S0w3UndTbjNJMFFiQUFI?=
 =?utf-8?B?SWw4RWNhbGlSUWpXczlCT3lLN3FEQlFTZmZqMEVrTWFtcUVBZWFNTEdkOWVt?=
 =?utf-8?B?ZXpESmhoSGZ5MkM3UC9qREJhZjk5TTV5cHV3YU14VVBORkprWWJ3L05oYWs1?=
 =?utf-8?B?aTUwSWFlaFNubG1aR1h4UWZxS3BoOERKRCtJOHVzS2FvVitLeTdLNkhNK1pn?=
 =?utf-8?B?UVVZN3lZUDlzdFBkNk85OGxlVEQ0ZEpVcjMrMm5nOVNJaUYxU2doRXFEam8w?=
 =?utf-8?B?ekJZYmJ1UHhaZW9yZXNLdjlaL2ZHVnVNakw1NytrTmluZlljcTIzbkk3a0NG?=
 =?utf-8?B?MEN0Z1VCZmNoUTBUbENpUlJTNHludjFOVkdRbXRzY2VjdUJHYm5HelVIUks3?=
 =?utf-8?B?VGhNU0IzR2NHV3pvNW5ZdWFpSkc2U0htTnNCUURaL3B1NXF5OXFWRk1RdGh0?=
 =?utf-8?B?MEo1dDdEOVJDSk8yZ1N4QVdMbVRuMUVTeTdwdGV2RisvN0xib3VCRG1UckhG?=
 =?utf-8?B?aE9JaURicURUMWl3NUg0cHVWRnU2K3JBeUc1d0FjT3ZiL284cURzQzhZUWZK?=
 =?utf-8?B?eFVCenRuY3ppbmJiMjRsV0ZDS09NRzRLZ0UyVzJ5MHRSN1JkSlRRQlhGbEUv?=
 =?utf-8?B?SGpjMjAybFBIWFlWT2lBZXp5RE5jc3M0ZHhJSEVqYWZ6bWUzVlFoc3AwbWlm?=
 =?utf-8?B?NzBrTE1QeHZPY0R4K242ZWtlSmVXQnBqNmxSdXRYOWwxSVVmWGtOUHN5Mk0x?=
 =?utf-8?B?L0VqSzFNQjJacWdud29hVEhEN245UjZPNjMvSzFqV3lGZmFKTG44NU9MaFRL?=
 =?utf-8?B?eDlmTVBOWFExbUpkaUcyY0VCbzRYZVhMb0FWaE1jRUJ6b1lkVVJHTm9KWXh0?=
 =?utf-8?B?bTNCVllpc2JYRXo0M1IvcjhpVGp0RGtkWnF2MFlMSGN5anQ0Ry9FVk5RL0w1?=
 =?utf-8?B?UHh0NXlvR05tbUZRbVhlSmduaWhYblNYbldWSG5tM0tVUmZoYXc5V1hjL3h5?=
 =?utf-8?B?STVSYTRDTi9GVHdNNGdYSnRyTzJqcDJiN1BBUHR5dHVtblo2bmgrV3VuVHg1?=
 =?utf-8?B?VjNQMDNGZS9IN2NHWW1OY09BeFE2Ujdvb2VqbDJvNVpqeWNOa0QxQVY0eUFL?=
 =?utf-8?B?cHZTbythZzRtU1J1eU8wTTY2YWpFMEZFTzNvSDB2ektzSWIwSFZCeWswQjVY?=
 =?utf-8?B?UlRmcXM3b1B3anVHeWFSZ25XRmM5MS90bkxsMEU2QUtZRldlakRFREkvNFk5?=
 =?utf-8?B?Q2VKTTVTdFhzZTN6NUhpbGtDVktaZmRZcldMZi93SksvekFYL0xZRVN1aUYy?=
 =?utf-8?B?SVdvQ2pUQ0JsVWt1Ky9ocVNFNXoyWk92UFV5V3NKUTJGTHF6bjVzcGJ2M1Ny?=
 =?utf-8?B?cE9QZ2cwdE1jNHlubGJwUGs4elR4a2doeTV1NDR4cW9Wb2NzbjVRT3BURXBY?=
 =?utf-8?B?Sm80cEJHZkMyVDhENWlHNTk0RGpoTDBYNzVHejhVaFJlTWZhZndSL1VoVi9u?=
 =?utf-8?B?QWwwelEvL0lhZU5ZSm5iejJLc1lQaHpmeWF6d3I0aGRKRXhBUnppUHo4V0JY?=
 =?utf-8?Q?UCV3fNz/0t94UE5bz3UBMAa2A?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	YVahMdEEfN5uLbf4EiGNKSVFzHXFgsjo37cQ89lUMdb6wvSpD499mUXe3Ne4K9nf5UWt80ZD/3tsmcU+0cVGvcjooBqQBCv9X0dDKkIpZzkqrSX7o3GKwsSjdZFkJt/UmcEjD0F45f4v3LVwynm8LU+abcZLiCnOSg6FxH9fCS9o35BbScQCpV2yX9HfvIOW+ol9dpjvf2haOdawbQP5TT39Ah0BuGDYyvzTy7u1E/mdgACmzlsx5V61yDQw8xDcEcLrqwP6mNuZcJ//UzACppVtYqia4FYWATI2kW6JBup4yC/DeBMsyCGdAA+osOfLQ4xmSRttAYQVQKK/anwK0pJFW9sb/GMrLj4rwizAyE/J3OZqOmjHzD6MvQ3mCXNwYHOqptMBoyZH5i3KBUXXf6L8CF5lqbx86vMN0+fW1nkOmyYr1w+1qflgDeYKaVTEEgIWobZq9YqKzGflFgYwNfuD8nBx6A6KWzzSC4IZdm29aM5O7myubJqZ9tprlGBfHBiA3KNxRg/7CFRFkJNYxCAmiCAV1a3HOUBA+laBQY4zI11BxPW3vLl0YUkD8U8HjoeY2yuXB5ByCGzc7odK/lD8qjXIEvRw5z5ARVY/9wM=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b414c03-661d-45b9-9bd4-08dddb74c3fd
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB5647.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2025 20:54:30.8898
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V0MorRVkf/AAUAeeyY+zlx2iOrqf/lnERTS0lmaV0oSqdlgZ1WEApZ+hwzdMa3HWgKi68JAu85ZluksaR4GMog==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB7720
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-13_02,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 bulkscore=0
 adultscore=0 mlxscore=0 phishscore=0 spamscore=0 suspectscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2507300000 definitions=main-2508140179
X-Proofpoint-GUID: CbStU7_Lm4dArmBcPuHpQTyVjc8XsQSj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE0MDE3OSBTYWx0ZWRfXx2StCXz6wNGN
 n7GqAmiyiG22oajfIhj5Oc8lQiuGP3OVKhM1ugjoT4ILY74oMM9p5UqGJ9sBFhz/ueGOjvfmF2N
 4G6cMdoy01ljGM1tYD3Aw0SgKeqJdipGO5xfIpxYK3RRhSEVpFRDGbZPVVzP0jDuoaZbSwCIGFS
 qr+r7FVixpyc7XigsGWpZOJjL3qI56YpWpwwnSnnun60eAJSmZOR5uHthklejR765NWPa1tWgp1
 hWbAvlXnSZ/6wi+kBr3jze5NRYdowwZoZxdVh1SJcBbagBV5CjbLUepIy+6TSyG8xRZa0K11Xd3
 zTmC3urJGqzdrK1MTmXn81zX5Tt0awr4nP+Pvx0yDDuSyfoyBPZXSjj5dOmJP0l1w8l3XRloct7
 e/q0vkBun3xQVkwVIlwrdt4bEd7GjfLH1yrHHgjux1n2nwmPyVd582g59HExj5CQ4VxFzc+n
X-Authority-Analysis: v=2.4 cv=W8M4VQWk c=1 sm=1 tr=0 ts=689e4d0b b=1 cx=c_pps
 a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=C2Sdf8qdTLi1s4StpZwA:9
 a=QEXdDO2ut3YA:10 cc=ntf awl=host:12069
X-Proofpoint-ORIG-GUID: CbStU7_Lm4dArmBcPuHpQTyVjc8XsQSj

Reviewed-by: Eugene Loh <eugene.loh@oracle.com>

On 8/14/25 16:33, Kris Van Hees wrote:
> The trace("") action would dump a series of 0x00 bytes (strsize of
> them) rather than printing an empty string.  While that is the legacy
> behaviour, it does not really make any sense to do so.  The trace
> action is described as printing data as a string if possible, and a
> block of 0-bytes can certainly be printed as an empty string.
>
> Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
> ---
>   libdtrace/dt_consume.c                      |  2 +-
>   test/unittest/actions/trace/tst.str-empty.d | 18 ++++++++++++++++++
>   test/unittest/actions/trace/tst.str-empty.r |  5 +++++
>   3 files changed, 24 insertions(+), 1 deletion(-)
>   create mode 100644 test/unittest/actions/trace/tst.str-empty.d
>   create mode 100644 test/unittest/actions/trace/tst.str-empty.r
>
> diff --git a/libdtrace/dt_consume.c b/libdtrace/dt_consume.c
> index edfe5bbae..2dce69d6d 100644
> --- a/libdtrace/dt_consume.c
> +++ b/libdtrace/dt_consume.c
> @@ -991,7 +991,7 @@ dt_print_bytes(dtrace_hdl_t *dtp, FILE *fp, caddr_t addr,
>   		    c[i] == '\b' || c[i] == '\a')
>   			continue;
>   
> -		if (c[i] == '\0' && i > 0) {
> +		if (c[i] == '\0') {
>   			/*
>   			 * This looks like it might be a string.  Before we
>   			 * assume that it is indeed a string, check the
> diff --git a/test/unittest/actions/trace/tst.str-empty.d b/test/unittest/actions/trace/tst.str-empty.d
> new file mode 100644
> index 000000000..38fcb8857
> --- /dev/null
> +++ b/test/unittest/actions/trace/tst.str-empty.d
> @@ -0,0 +1,18 @@
> +/*
> + * Oracle Linux DTrace.
> + * Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
> + * Licensed under the Universal Permissive License v 1.0 as shown at
> + * http://oss.oracle.com/licenses/upl.
> + */
> +
> +/*
> + * ASSERTION: The trace() action prints an empty string value correctly.
> + *
> + * SECTION: Actions and Subroutines/trace()
> + */
> +
> +BEGIN
> +{
> +	trace("");
> +	exit(0);
> +}
> diff --git a/test/unittest/actions/trace/tst.str-empty.r b/test/unittest/actions/trace/tst.str-empty.r
> new file mode 100644
> index 000000000..8c15aa7f5
> --- /dev/null
> +++ b/test/unittest/actions/trace/tst.str-empty.r
> @@ -0,0 +1,5 @@
> +                   FUNCTION:NAME
> +                          :BEGIN
> +
> +-- @@stderr --
> +dtrace: script 'test/unittest/actions/trace/tst.str-empty.d' matched 1 probe
