Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2AD017A316
	for <dtrace@lists.linux.dev>; Tue, 19 Aug 2025 21:58:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755640720; cv=fail; b=tdbCq6rxMqOZCEHAHDEqSVpyUWgzAFT9PZwk2SX87gxA1S4EEMo/IZBmniZrVVDmnrHNA9UabR/wp99Llo5nNnknNvFuVt0F87dxCDY2yAE0QSpwX30budr/H2mXHEVIa+sY+Cg1FSrnmM/Yas1vDi/2qgnfoWAnU02/mjKwH2I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755640720; c=relaxed/simple;
	bh=C6R/pU//5DGX/AsMkmF2xwt5tf+/NAh6fL1VfS9AWk4=;
	h=Message-ID:Date:Subject:From:To:References:In-Reply-To:
	 Content-Type:MIME-Version; b=mzaPVqyPHH7U6QMYEpVefRh3SJ5AlAjTwxHSWEliI3idXT1XI4x+2mZEZ7I9mfiXgUP7FAQOqN83hz4RYuxi0+61XeHQ5vCmYd3d1eyk+b4Mi6TKOrajSPsV5HaHygNCUn2GG2eq/M75fHh94r+RNkbHXEFqZDP+m/IWt7u9PYE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=CMEpIRTk; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=D0faBHUt; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="CMEpIRTk";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="D0faBHUt"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57JLCOEq028404
	for <dtrace@lists.linux.dev>; Tue, 19 Aug 2025 21:58:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=6dejV+0Roy6Mo0ucuSbTO2scI0in+cDcsGPSLP7xstc=; b=
	CMEpIRTkvTaTdvVK/k72b0z62AcVuHKNUBOJQEGa+c+asGhxrev5V1IhuPJobFt8
	LD8DQ/sxDwtBK/XBIRiEZO/ZUiV8LWhAd9NPHHuRUT6+X5BwYZVU9pJ16/KThBr2
	KRo+aGOPLpLfnLZYIlJeOyCLfWqxxxTPquygAW8Eg9Sh6EF2PH8vtmSFCyAJw3B5
	/W2codBXR7/fX0rmOWNsqQ1o6u+A5nB2MXyQ8LY90NuuP61N/YswS8vgA6uRQ/Lv
	ZLFeqMiPIeeDEClrHW7tS7kk6hNvHVPzprVyabKHBovjdKPkamfvIItVK2XjaWbr
	QTpgJ3eZVuwfJ22EQESMKw==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 48n0tt02dq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 19 Aug 2025 21:58:36 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 57JKl7Nt030214
	for <dtrace@lists.linux.dev>; Tue, 19 Aug 2025 21:58:35 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10on2076.outbound.protection.outlook.com [40.107.92.76])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 48my3t5mkk-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 19 Aug 2025 21:58:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pBXPAUbnIpD4Pjv5CuLCtvBN8SXU0XaFfmal0Sl8GEScCjewPdcEdwIqGWEp+xh4ZGH3uO5ksRNBC1qnL2Q7eEkFlHXIfYcwU+nHOEmDU4sR0kMWAeJVC6NTEtfJOnP+abqlgT2AhdIzPGBDqRAZtpyV2wweNQwKKK5t1nBL1DOSHnxBOHZEx+qG131mbuhLThlNaNXGBg72HTE9x4cL/qNCEJ6PHutr8poCM6Gh4NLNOgy2jw+yoGt7tmbzMP5SdfVslIhYm0ZtS/O8si8YY4BAaPKJomx3elZuVvxAFBuAHaAVkkAhORlg2F2HKKzoOad1LkdPOERpEmLJnQKUJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6dejV+0Roy6Mo0ucuSbTO2scI0in+cDcsGPSLP7xstc=;
 b=tcd1A/Jzp3cRgfM4j+lYKRwVymtEyTpgkKu1ybKD0Ax21XlGl3RXRXw/gicA6SJnye0yE8QxGhMe90bYkRcUOj9ZpUcwyribThoRyCFXsG+qH5R+4uAolJMcLDVhpoaz97Y3e3FrNiebwAlGTBqDrzWwmEp4M3ybuVuYgEv76bksIa7l+CVACPFVATDTRfabtBeSwnWIHSPscmAfQm1BkLVfE9Tb7RdSd/Q1apGMEHuq+HgP8wIVaLtnB86S+bt15BQVZwbfx7Q9GDjiq1gA+tOY4vAasQpiQ9LcpgUvkychKeU7mqgJm0H4QwfK9SGEBoRH/dr2b9V1hLK/M9VWPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6dejV+0Roy6Mo0ucuSbTO2scI0in+cDcsGPSLP7xstc=;
 b=D0faBHUtiyiBDu6qdWpQIbEOLBDN9Im9ZSbtZ452iLVHf27EWUjxWAcP+99i5ZwLO91EU0pJ3cchfYRC7YkMJHfeBDx6s9mO/sN2op8/vZsIRexztAPX1geBlMIWUt8TxDBzWB9oQNH8+0MCzAmTkyz8RuQ2wdm4GDKyBqrBmfo=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by IA1PR10MB6099.namprd10.prod.outlook.com (2603:10b6:208:3ac::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.24; Tue, 19 Aug
 2025 21:58:32 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%6]) with mapi id 15.20.9031.024; Tue, 19 Aug 2025
 21:58:32 +0000
Message-ID: <f2793e7a-3b13-d24b-22d7-45646a54e3dd@oracle.com>
Date: Tue, 19 Aug 2025 17:58:28 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 2/2] examples: add more scripts, and a README file
Content-Language: en-US
From: Eugene Loh <eugene.loh@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
References: <20250814222249.13445-1-eugene.loh@oracle.com>
 <20250814222249.13445-2-eugene.loh@oracle.com>
In-Reply-To: <20250814222249.13445-2-eugene.loh@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BL1P223CA0030.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:208:2c4::35) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|IA1PR10MB6099:EE_
X-MS-Office365-Filtering-Correlation-Id: 76cef10b-0643-4c2c-92e2-08dddf6b89ad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MHpORFVLbnhlWHlGS1RBdnQzMFMvT3IvZXVEUXV3NU04MFRJdmNyZjZ2NEFW?=
 =?utf-8?B?SXNSOFhBaCtzbnBzdGl3NkZTVW1mSjhPRGlLYXJXZFZTeFhjZmtuajRhNTVp?=
 =?utf-8?B?WjI1VVV5SkFJTlltUnhZdllLOE5kN0Zpc0tDZWlITjA3Vm9zQWNJR3BEeFo4?=
 =?utf-8?B?TFdPZzRJbnY0clI0cTcwbWZFQjBUZW5Iako3dFRZSi9lQmNENDFQZTZqd3BV?=
 =?utf-8?B?Nmw5MkdudmF6QWpsTVBsWnQvS3BraVZaWFN6Qk41azBxeTNYRTQwdTl1bkcr?=
 =?utf-8?B?ZE0yaWpjQ3V4QzUyVUduM2RQVzlQMXRpNkZDa25POVlsZlROSGVoSHpPTHZ5?=
 =?utf-8?B?TWltaDNxbkxGOWt5NTNtUDRTSXF5Y3RsSm54b0NHQjVEclBUTU00bThqeEpo?=
 =?utf-8?B?ZDRPMVMyWk12dWg1QWtUTCt5cHhWaXhVc240dEQ1UksxdTRiQURYM3BBRkt6?=
 =?utf-8?B?WHljVjNkenFYZTRLTmdyTkNGSTJsdlIzU29jM3lOTno0Qnk3OTNsM0hxNnJR?=
 =?utf-8?B?SzVxTldOMDNwRkdjSFNWS1pTQmZXQmFYSlAwS3B6RmZvb2xKekhwZkYyazhw?=
 =?utf-8?B?Um9YRmprQlBtOHZHYXFEODdNQjNhL0phd0s4T1RCbitHamdEOGRJbURFR01H?=
 =?utf-8?B?RGlPZEpNbTRvZnRPUTZUY3FFU1pYTm1JQWw3bUhyajJHWWZCaGhtaUpYUVkw?=
 =?utf-8?B?enVuNEN5UGFtakJqbkVHcU5vb3FQVERGQmVWZHNvV3F0ZzBZRjcybmptTGtY?=
 =?utf-8?B?Z2VPVDE4U0J2TUNRRTRCVDNzenZLVy9PeSt4WE9vS3dmVFJYSE5EZmxnZU96?=
 =?utf-8?B?WG1sY2dzNXU2OFdNU0l0ZU45eVhCeVA4a2IxYVgzT29adXM1NXZqcHczNG9y?=
 =?utf-8?B?VlZVaTJaS2dmZGYrQlFsUmFULzRTa1pmNW5Sdi83eE1BQUxtV2Z6ZFNnWlZV?=
 =?utf-8?B?VnhnRjV4eE1xck1vVDl2bnpKeXg5dURjRkY4MmFRb2x6bWtseEFuWkw2YkUr?=
 =?utf-8?B?L0VyUXlOOUpITGs4YVZVdEkrRVVnajBuOFJTTzM1QnlLTXErenBUVWE2dnZM?=
 =?utf-8?B?UmlNNzQ1elNQMi81ZGYxdWhlZkg3OVFQeHMyOGFIbmhaOUlkZTVaNWZNbWVP?=
 =?utf-8?B?M0hhbzByM05Vb0srSXdEZWdHVHpKcHM1ZlhSdGdRRU9IN1k5dHU4QUlaWlhD?=
 =?utf-8?B?WTFZeTczZXc1UjcxdUFndEZBVTdTOXJoRi9XbGs4OTZiZ01Sa0hnYWNCRnE5?=
 =?utf-8?B?TmVwd2c5UmovUWQyRkpValNhVkJOaDIrM1VMZmFoczZ4aS93RWhpNkhMSndW?=
 =?utf-8?B?N0lKaWJEdVA3R1ByU2EycTRzaFoxaG52QXJGNDd1T2RBNFZCZmNyNXlkTTFD?=
 =?utf-8?B?ZkFac3kzSm5SZlBDTVJwWmN2WGhkcXJCYklZcnFYdnR4WWdIc1AyT0JuYndT?=
 =?utf-8?B?b29zdG93TXhkWjMxaXlxYzRIQ0I4R1JxZWNmekYxRXBBRkpMZWZFWkJ2ZUFY?=
 =?utf-8?B?eXR6ODlxS0daMW80N3FqVnB2OHRIUUhHYWZSZ1d4SnNNRVdPNEFsRWFLMnZH?=
 =?utf-8?B?d2lVeUtLdTBOM0hSWFFGelBPbUhKNkF1czJ3Sy93OS80OHhDMEFXOW9PK3l5?=
 =?utf-8?B?UjNLMk5sbXFYTHhkYnpFcWIxcnZkTUlwY0FXWGlQZmJxQzlBOFhkeUlpbzIy?=
 =?utf-8?B?aExIRU1XY3JFd2UvSHVQM3VqbmYvYVFPT3MzWHVvWm1Ec1BuUCtqS3h2dEg0?=
 =?utf-8?B?Vmg0M0l2N01hR0NHNHR4d2ZXa2ljdERPbExMaVpWOUhLT1RjbkQrV1VGU1ps?=
 =?utf-8?B?WWZqYjByQkhxVW9adklkUG90bnhLOTRzWkNrK1FuTnNIZ3A3K3BadC9XUi9N?=
 =?utf-8?B?Y3A1MXl4ZXlwVURrQ21LcDlFY0YydVpmdlhKcjZDaEtsRTRSbFY4dTZ1bWNj?=
 =?utf-8?Q?nLMOyG2BxiU=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZDR4OHlKYnpxV3VXOFhtb1I0UGZ4akpncHVTb1hNK3ZWSE1rVERqOURLSjRn?=
 =?utf-8?B?MDg4S2hjcERyZUw4dC9xL2VUSnArUld4c3J1VjI5ckxYbEtYUGpoR0RrckFu?=
 =?utf-8?B?Mm9Sa3krK0pvOHhYaGc2c0pzbWsyOEFBWDhkWGVaU2YzSWlYdy91S1lzTlZC?=
 =?utf-8?B?S05EMlNldm1rM3V1N2doTUFVVW5CSmNEYjMwZUZUTWlTQkxHYXp5eDRBeWxK?=
 =?utf-8?B?ZThTOUk3M1QzWVNRdXdxOXpVSC9oejVxejJFT3ZtSW15aTFVN3c3TjFpWlFR?=
 =?utf-8?B?aEozT0Z3S25ncUxjeEJBSVVWYWtrQXhqQzFSbURyRFk4ZTlxYjdqMUxrZ1Zo?=
 =?utf-8?B?MG1ySi9rMTNNZ3l6c1d4R1VNR3BaelY4UVRJRHJuWGYrc283Q0ZKd3ZkOUZJ?=
 =?utf-8?B?Ty9lNStZVGg0WmVUT1poYnVuMU96UVpYUXRBUXFyOHdJTmJNZlJPbEJyUXRO?=
 =?utf-8?B?YkFJOFFJVHNNVHlMT2cxSlBvVFlXaWs2Ymh0M0tObmVKWTlCV3dWUFVqQXdw?=
 =?utf-8?B?b2hlSDVJWU5FMjN4NEJZRXFtRjIwNFFvd1IyY01GYnVmK0c2MDg5WHdkeVhx?=
 =?utf-8?B?Yi96NU96TGFRQ0VhYy9MUmFkbTJYMUpkKzdpZnhwVStJTGJoeWR3MVdpQyts?=
 =?utf-8?B?ZVpNL2pucThhaFNidGdkNHRiOHNwRUhSZUpBaDlvWGNqeHIyM2pqL2xrZ3JI?=
 =?utf-8?B?UGF5bGpNWWN2NDBLaWFQYjV2N0YycVhla0syaTJtZzhFOTl4RmlCR1l1SVhS?=
 =?utf-8?B?U3dyelNFL0NGeWVCemtmOExoOFpZU0ZaUzBGb1pxQ2hiU2Y5VG8zd25GTytN?=
 =?utf-8?B?b09MdU56aVhlN3ptY3JUYUI4TmJoL2dmKzRVbXpQV3l1c2ZENzhHSm5kVVRx?=
 =?utf-8?B?dXJ5SGhYUUtjQ0VpMG5rUVRSMUNZd3ZTYW1rNXBsNWo1d2g3K2Y0dE96QzUz?=
 =?utf-8?B?dmtXQTcrRURKZEdMVEErUW1HRDFaTXEzeHlvQStYOGdDcitaRG0zenI2UlFT?=
 =?utf-8?B?YUk2QTJZTk40SVB3YWZzckhRcmV4b0puTkg5WHV3RGxDS1JqVXc0VVM0WlRy?=
 =?utf-8?B?Rkt0SjZKV0JIcVRZN1RJUGU4eHBqTnNwaUk2TXp2M01XcktNNndiWHMzTlo0?=
 =?utf-8?B?YTlOTU44eW5tSHVqMGNJbUh5UDZ6NmQ1ZXRKVnpxZjQxU2xyZFd2WHdMNzJL?=
 =?utf-8?B?Zm0wUGQ4L2xidlkyNkREdUhBTUdVRVVlYktmeTJFcDNQSzA2Q1RQbmxET1BT?=
 =?utf-8?B?NjExelprZzZJdVJUSU1kQnZnT0dnM3YxNjdUSklLN0JNTmUydWU4QlBma1di?=
 =?utf-8?B?aXZHNnNscmdJbmhlRWRVd2ZxZlZxaGw0RUVNUlpPYWxwbzlXc2ZSYitRV3Bk?=
 =?utf-8?B?V1NtLzF4YXVlSjZnU2o5M0c5bUE5S2pWYThUNzZQVVNvamI5M3RrNUs2NXZV?=
 =?utf-8?B?MlJRWTZlTEczSFRRanc4V1FQTmNGM09GbjJVYTQycm85NjlSWDJGdzFSZ25m?=
 =?utf-8?B?OUg1ZjFLNnoxa2huTXZORVREWkV0SU5ENVIrNGFEdWo3SUZVekZQK25PUCtv?=
 =?utf-8?B?WHpMc3laWmZCQlcvZEY3VUhCTVBBbCtBTXFzblIrOWlQTGhGSitXMEpXTDJW?=
 =?utf-8?B?VlhybnBETERrS2N5MHBmZXZ5TVhHa20wN0dKYWJzR1JtR21rS1Z3VVJOdWZ4?=
 =?utf-8?B?YWU5ZjVpYmM2QjRDRlo3aCtNRkVYMmhaaENhVHBWWHJ5SFhvdnNIS3hoenV1?=
 =?utf-8?B?SDN1cjhzZmFVM01Mbm0vdElQd3NsdXJRRnVxZlpHSHNXL0t3eiswYmwyU1E2?=
 =?utf-8?B?aTUzNm9wUGxjc0dBR2ZYOEJZdVl3eEtWL21JRnhzajl2RFZ6TUJ5allyTXZW?=
 =?utf-8?B?ZVZzU2dOOUxFVnJzWFRaV29CclJydXV0N00vV1FTbUUwQkNndk9sZTF1dXVE?=
 =?utf-8?B?cnZoVVlYUlhSVG9CQmZLL0RIcENxTWdUcDhEdlNNSUc1dUNhdGkyN21Md21L?=
 =?utf-8?B?NXovUmdlZUxkU3R4MGtqTU9TSTA4NFN4TEkvRExWZExDdHBuU0phWkJSSmFM?=
 =?utf-8?B?OStxTU9rWUJCbnBGZ0daaHR3eVAxeUttWHl1MFNibmNZUzUzYmZBOU9lSGdV?=
 =?utf-8?Q?XGqaYsrmqxTGsMgQ7SP6f3Ou+?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	a0FUU8QpqadWKXr0MMspMz2wuBThtwdAc1xXvzwCF+bynbFoaM4Q9N1yiPQAZqG2wNxnCs2qPHEvgqVtxB7sjO1kaj7bC77e2LyuFHVdrIULiIKZBRloXJPhmPsQ6MwutlEQf/kYDc58mITUwTfHZs4yJxsOXvODUM614bttesoFhGOY8/lkbSuULlSS3JgejKA88IxO71SDobQOGg/Hz11sjy71PZUN+nPHdA5zvjv5zq6uRjSj4OUA2Oz7RziHE3P5kpS2Uf2WsiEheWy/Qz9p+cHy3UkoNdgg6AA/60m1av9t+d3lPCk6iWRnekGaUa4cYXUPCNzzpCILdDAIO6xyppmDV370RwtsPtWDpCsMv+MpfZspc8VOfOUfjhPY0V/wUkO6B0JHgSMesQ3fc1zaUc1rRZe9jI/GMOAl7WiuVI6C8RZKHbI+dmxKyNoUokQhmW/q+IIXPER0qKufGQGaP35ZY19kWY1cpxu+N0C29CdIMHGNLdpf5OYTwkbFzxPHLMnWzCjtOGfPH/w1DLUJ/fH+bI9zn+Mc8g2VdiZSTzdcSfqoTRKkSAiyoApMGA+3hGWwFXHwQuvIS2gqDYUflQVDubBP15Gn1W+sfW8=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 76cef10b-0643-4c2c-92e2-08dddf6b89ad
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2025 21:58:32.2841
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KVUXseDqZXKwIRvS4UnfPyfriuSCo/+HXWsYtzKZquozCRXKOiUhcrZdZQr4RakqjO6yDJngnk33KNnlpGUrWA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB6099
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-19_03,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 suspectscore=0 phishscore=0
 mlxscore=0 adultscore=0 mlxlogscore=999 bulkscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2508110000
 definitions=main-2508190205
X-Authority-Analysis: v=2.4 cv=YvRWh4YX c=1 sm=1 tr=0 ts=68a4f38c b=1 cx=c_pps
 a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=O5o192NJAoO6kLCrIEsA:9
 a=t-i2GgN2tH9isGgi:21 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 cc=ntf
 awl=host:13600
X-Proofpoint-GUID: pPu6uSxAG_ZRsdYprbo_uAaGfd2SnnaX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE5MDE5NiBTYWx0ZWRfXyv2lbs4hqxIC
 8/sO+YpRaxqJFyiUw56bgx9fxjRnDiVNe9NtKi5njCY2aoCVnC+xfO6QOwx2eOt7AjEsRcSc58Q
 QAHNxrG6A5bpuGFFoojo64xP7ZxzxvcBN+XTXv0EXXwtuPOrXT4TMDIxRp73hviKA7IoILAwIdL
 r6QX5T3hch8+crK5tS3i8Tov1XQaS6zjlDLe3w/bnP2VeGmG6+h2fNptMCAKa6MyoInbg3mHF46
 D4H6dFQKlW/xwCVNdxk11d/yVuCUypfM30WUN4guTJCeqBPNzREuv7skikwskSMjFOghMjvfk8r
 5Pl9mH/Tk/Dl9fw7e/SFYu3TpnAc7p4/cqKZIzqZ2rjmwigbN5i1tcNmSM6LMoZkTIjqh2p3weL
 42zP53xVe71ZYdZpjO6ovvyvVsVJR+IcFL5T1j0FjHjSHW7S7Ac=
X-Proofpoint-ORIG-GUID: pPu6uSxAG_ZRsdYprbo_uAaGfd2SnnaX

It's all very wordy, but maybe that's appropriate for this sort of 
material.  I don't know.

Anyhow, the patch looks fine.  I have a lot of picky comments below.  
Incorporate whatever feedback you like.  I expect to R-b the next 
version:  none of the things I mention is major, but look them over and 
see if there are any comments you like.

On 8/14/25 18:22, eugene.loh@oracle.com wrote:

> From: Ruud van der Pas <ruud.vanderpas@oracle.com>
>
> Add six 6 more examples plus a README file with a description
> of each example.  The new scripts provide a variety in
> functionality and target various levels of experience.
>
> dtrace/ChangeLog
> 2025-08-14  Ruud van der Pas  <ruud.vanderpas@oracle.com>
>
> 	* examples/io-cast-net.d: Show how to use wildcards.
> 	* examples/io-stats.d: Display I/O characteristics.
> 	* examples/sched-simple.d: Count on/off the CPU.
> 	* examples/sched-stats.d: Extensive scheduler statistics.
> 	* examples/thread-ids.d: Mapping of thread IDs.
> 	* examples/var-scope.d: Demonstrate scoping rules.
> 	* examples/README.md: Brief description of all examples.
>
> Signed-off-by: Ruud van der Pas <ruud.vanderpas@oracle.com>
> ---
>   examples/README.md      |  71 +++++++++++
>   examples/io-cast-net.d  |  70 +++++++++++
>   examples/io-stats.d     | 268 ++++++++++++++++++++++++++++++++++++++++
>   examples/sched-simple.d |  76 ++++++++++++
>   examples/sched-stats.d  | 182 +++++++++++++++++++++++++++
>   examples/thread-ids.d   | 159 ++++++++++++++++++++++++
>   examples/var-scope.d    | 117 ++++++++++++++++++
>   7 files changed, 943 insertions(+)
>   create mode 100644 examples/README.md
>   create mode 100755 examples/io-cast-net.d
>   create mode 100755 examples/io-stats.d
>   create mode 100755 examples/sched-simple.d
>   create mode 100755 examples/sched-stats.d
>   create mode 100755 examples/thread-ids.d
>   create mode 100755 examples/var-scope.d
>
> diff --git a/examples/README.md b/examples/README.md
> new file mode 100644
> index 000000000..19c693e92
> --- /dev/null
> +++ b/examples/README.md
> @@ -0,0 +1,71 @@
> +## Synopsis
> +
> +This is the README file for the examples directory that is included in the
> +DTrace distribution directory.  These examples are meant to be learned
> +from.  They can also be a starting point to explore changes and enhancements
> +you'd like to make to these scripts.
> +
> +## Target audience
> +
> +The scripts target a wide range of users.  There are examples that are
> +ideally suited for the beginners, but there also scripts that are
> +probably easier to understand once you have some more practical experiences.
> +To make it easier to select a script suitable for your level of experience,
> +we have added a level indicator, but please do not let that withold you from
> +looking at other examples.
> +
> +| Level | Description |
> +| :---: | :----       |
> +| B     | Beginner - Only some basic knowledge of DTrace is assumed. |
> +| M	| Medium  - Some experience with DTrace will be helpful.     |
> +| A     | Advanced - Practical experiences writing scripts is recommended. |

I guess.  The BMA system is hard for me to get used to (I'm 
simple-minded like that).  A 0/1/2 system might be easier for me, but no 
big deal.

> +
> +## Installation
> +
> +There is no need for any additional installation instructions.  Just copy
> +the script to your working directory and either use it as provided, or
> +make changes as you see fit.

I'm left reading between the lines and wondering if I *have* to copy, or 
if I can use in-place.

> +## Usage
> +
> +Each script has a usage line that you can find under SYNPOSIS in the

SYNPOSIS =>
SYNOPSIS

> +top part of the script.  There are also extensive additional comments.
> +
> +In the comments, we often refer to a target application, or command,
> +but most scripts can be used for both, or also on a running process.
> +For the latter you need to change the option on the dtrace command
> +though.  Please check the man page for the `dtrace` command for the
> +details.

What's the difference between application and command here?  Why should 
a reader care?  How do I know which scripts cannot be used for both?  
(Incidentally, s/both/either/?)  And how do I know whether I can use a 
script on a running process?  Instead of referring vaguely to "the man 
page", can you just say here briefly what's involved (change -c to -p?  
hit Ctrl-C to terminate?)? Otherwise, people might not know what to look 
for.

> +## The examples
> +
> +These are the scripts included, plus a brief description.
> +
> +| Script          | Description                | Level |
> +| --------------- | -------------------------- | :---: |
> +| fcalls.d        | List the functions executed by the target application.  |B|
> +|                 | In addition to this, the number of calls to each function |
> +|                 | is printed.  This information is given on a per-thread    |
> +|                 | basis, as well as aggregated over all threads.            |
> +| io-cast-net.d   | For the target application, show a list of all the libc |B|
> +|                 | functions that include one of the selected keywords       |
> +|                 | (open,close,read,write) in their name.
> +| io-stats.d      | Show statistics for the fopen(), fread(), fwrite(),     |A|
> +|                 | pwrite() and read() functions.  There are several probes  |
> +|                 | and you are encouraged to experiment with this script.    |
> +| sched-simple.d  | Use the sched provider to count how often the target    |B|
> +|                 | application, or command, was scheduled on and off the     |
> +|                 | CPU.  The information is given for all individual threads,|
> +|                 | as well as across all the threads.                        |
> +| sched-stats.d   | Display various scheduler statistics for the target     |A|
> +|                 | application, or command.  For each thread, a histogram of |
> +|                 | the time on the CPU is shown.  Plus global statistics,    |
> +|                 | like the total time on the CPU, and the minimum and       |
> +|                 | maximum.  Those threads with an on-CPU time below a user  |
> +|                 | controllable limit are listed.  Also the CPU IDs and the  |
> +|                 | number of times a thread was on/off CPU are given.        |
> +| thread-ids.d    | For a Pthreads application, show the mapping between the|M|
> +|                 | thread IDs as created by the Pthreads system and the      |
> +|                 | thread ID as returned in the DTrace tid variable.         |

Okay, though you really use the return value of clone*, so we just have 
to accept that the D tid is this value (and not, say, the pthr tid).

> +| var-scope.d     | Demonstrate some of the scoping rules for global and    |B|
> +|                 | clause-local variables.                                   |
> diff --git a/examples/io-cast-net.d b/examples/io-cast-net.d
> new file mode 100755
> index 000000000..a8b336b3f
> --- /dev/null
> +++ b/examples/io-cast-net.d
> @@ -0,0 +1,70 @@
> +#!/usr/sbin/dtrace -s
> +
> +/*
> + *  NAME
> + *    io-cast-net.d - get an overview of read and write calls
> + *
> + *  SYNOPSIS
> + *    sudo ./io-cast-net.d -c "<name-of-application> [app options]"
> + *
> + *  DESCRIPTION
> + *    This script lists all the functions in libc that include
> + *    one of the following keywords in their name:
> + *      read, write, open, close
> + *    This is a fairly wide net that is cast to find out which
> + *    libc functions are used to open, or close a file, and which
> + *    functions from libc are used to read from, or write to a
> + *    file.
> + *    The number of calls to each of these functions is counted,
> + *    plus the total of all such calls.
> + *
> + *  NOTES
> + *    - This is an example how you can find out more about a certain
> + *    area of interest.  Wildcards and empty fields in the probe
> + *    definition are ideally suited for this, but be aware not to
> + *    overask and create a huge number of probes.
> + *
> + *    - This script could be the first step to analyze the I/O
> + *    behaviour of an application, or command.  There is another
> + *    much more elaborate example to demonstrate this.

Be more specific:  which example?  How else is the curious reader going 
to find it?

> + *    - Wildcards are used and as a result, more functions may be
> + *    listed than you might be interested in, but in this way
> + *    you will see all of them and can make a selection which
> + *    one(s) to focus on.
> + *
> + *    - There are no print statements in this example, because we
> + *    would like to show the default output from DTrace.  In
> + *    particular, the feature that, when the tracing has finished,
> + *    all aggregations are printed by default.  Since this example
> + *    only uses aggregations, it means that all results are printed
> + *    upon completion.
> + */
> +
> +/*
> + *  These are the probes we use to query the system and see those
> + *  function calls.  The first aggregation has a key that consists
> + *  of 2 fields: the name of the function and the module name.
> + *  Thanks to this key, the results are differentiated by the
> + *  function name and the name of the module.

To me, it's cleaner to keep the same order.  If probe descriptions, 
which you are using, have module before name, then keep that order for 
your aggregation keys and comments.

> + *  The latter is always going to be libc.so, e.g. libc.so.6.  We
> + *  have included it in the key for the aggregation to show how
> + *  to make a script more flexible.  In case the module name is
> + *  left out in the probe definition, or changed, the script will
> + *  still work and print the module name(s) of the probe(s) that
> + *  fired.
> + *
> + *  The second aggregation has no key.  That means that the count
> + *  is incremented each time one of the probes fires.  That will
> + *  give us the total count across all the probes that fired.
> + */
> +
> +pid$target:libc.so:*read*:entry,
> +pid$target:libc.so:*write*:entry,
> +pid$target:libc.so:*open*:entry,
> +pid$target:libc.so:*close*:entry
> +{
> +  @target_calls[probefunc,probemod] = count();
> +  @total_count                      = count();
> +}
> diff --git a/examples/io-stats.d b/examples/io-stats.d
> new file mode 100755
> index 000000000..a9f25e405
> --- /dev/null
> +++ b/examples/io-stats.d
> @@ -0,0 +1,268 @@
> +#!/usr/sbin/dtrace -s
> +
> +/*
> + *  NAME
> + *    io-stats.d - show several I/O related statistics
> + *
> + *  SYNOPSIS
> + *    sudo ./io-stats.d -c "<name-of-application> [app options]"
> + *
> + *  DESCRIPTION
> + *    This script shows several I/O statistics for the target
> + *    application, or command.  Among others, the filename, the
> + *    file descriptor, or stream it is connected to, the number
> + *    of bytes read, written, or both, are printed.
> + *
> + *  NOTES
> + *    - All the probes in this script are based upon the pid
> + *    provider.

fwiw, the END probe is not from the pid provider.

> + *    - This script is quite elaborate and has several probes.
> + *    More specifically, in alphabetical order, these are the
> + *    functions from the libc library that are traced:
> + *     close(),
> + *     fclose(),
> + *     fopen(),
> + *     fread(),
> + *     fwrite()
> + *     open(),
> + *     pwrite(),
> + *     read(),
> + *    In the probes, we rely on the information from the man pages
> + *    for these functions to identify arguments of interest and
> + *    the return values.
> + *
> + *    - Not all of the probes may be relevant to your case.  While
> + *    no harm is done if a probe does not fire, the associated
> + *    aggregation(s) will be empty, but still printed.  You can of

Hmm, okay.  Normally, empty aggregations are not printed.  In this case, 
however, you are explicitly using printa().  So, that's different.

> + *    course always remove such probes and related print statements.
> + *
> + *    - It may also be that some functions that you're interested
> + *    in are missing.  If so, probably an existing probe can be
> + *    used as a basis to add one or more new probes.

The last sentence confused me:  it felt like it was telling me that when 
an existing probe fires some action can be taken to get to missing 
probes.  Now I'm thinking what you meant is that the existing script can 
be modified to add more probe descriptions.

> + *    - A related script is io-cast-net.d.  You may want to run
> + *    this first to cast a fairly wide net and explore which open,
> + *    close, read and write functions are called when executing the
> + *    target.
> + *
> + *    - All print statements are in the END probe.  On purpose
> + *    several different format strings are used.  This is done to
> + *    demonstrate the flexibility in presenting the results.

Well, and END/printa() is not needed at all, since aggregation data will 
be printed by default.

> + */
> +
> +/*
> + *  Suppress the default output from the dtrace command and
> + *  have printa() print the data sorted by the first field.

s/data/aggregation data/

> + */
> +#pragma D option quiet
> +#pragma D option aggsortkey=1
> +#pragma D option aggsortkeypos=0
> +
> +/*
> + *  Capture the name of the file that needs to be opened in the call
> + *  to any function that starts with fopen.  The first argument to
> + *  this function contains the name of the file to be opened.
> + *  As arg0 is of type integer, it is converted to a string and

Yeah, it's also copying from user space.

> + *  stored in the thread-local variable fname_fopen.
> + */
> +pid$target:libc.so:fopen*:entry
> +{
> +  self->fname_fopen = copyinstr(arg0);
> +}
> +/*
> + *  This probe is nearly identical to the one above, but note that
> + *  for this probe, the name of the thread-local variable is slightly
> + *  different and called fname_open.
> + */
> +pid$target:libc.so:open:entry
> +{
> +  self->fname_open = copyinstr(arg0);
> +}
> +
> +/*
> + *  This is the return probe for any of the fopen calls.  The
> + *  predicate ensures that fname_fopen has been set and if so,
> + *  the probe updates the count and stores this in an aggregation
> + *  with 3 fields: the name of the function, the name of the
> + *  file and the return value of the function, which is stored
> + *  in arg1.
> + *  Note that we can indeed access this file name.  Although
> + *  set in the corresponding entry probe, a thread-local
> + *  variable is accessible in the data space of the thread
> + *  and so can be read, or written, here.
> + *  The third field in the aggregation is arg1.  This is
> + *  the return value of the function and is the pointer to the
> + *  stream.
> + *  Since we no longer need variable fname_fopen it is released.
> + */
> +pid$target:libc.so:fopen*:return
> +/ self->fname_fopen != 0/
> +{
> +  @file_pointer[probefunc,self->fname_fopen,arg1] = count();
> +  self->fname_fopen = 0;
> +}
> +
> +/*
> + *  This probe is nearly identical to the previous probe.
> + *  Other than the name of the thread-local variable, the
> + *  difference is in the name of the aggregation.  This is
> + *  because the return value, which is the file descriptor, is of
> + *  type integer.  This means that we need a different format
> + *  string *  when printing this field.
> + */
> +pid$target:libc.so:open:return
> +/ self->fname_open != 0/
> +{
> +  @file_descriptor[probefunc,self->fname_open,arg1] = count();
> +  self->fname_open = 0;
> +}
> +
> +/*
> + *  This probe stores the name of the function, which is fclose,
> + *  and the argument, the pointer to the stream.
> + */
> +pid$target:libc.so:fclose:entry
> +{
> +  @fclose_stream[probefunc,arg0] = count();
> +}
> +
> +/*
> + *  This probe is very similar to the one above.  Again, the
> + *  difference is in the name of the aggregation, and the argument
> + *  which is the file descriptor and of type integer.
> + */
> +pid$target:libc.so:close:entry
> +{
> +  @close_fd[probefunc,arg0] = count();
> +}
> +
> +/*
> + *  One of the functions traced, is pwrite().  The first
> + *  argument, arg0, is the file descriptor.  The third
> + *  argument is arg2.  This contains the number of bytes
> + *  written.

You don't know the number of bytes written until return.  Here, arg2 is 
simply the max requested.

> + *  The aggregation function sum() is used to sum up all
> + *  those byte counts, and as a result, the aggregation contains
> + *  the total number of bytes written to the file connected
> + *  to the file descriptor.
> + */
> +pid$target:libc.so:pwrite:entry
> +{
> +  @pwrite_bytes[probefunc,arg0] = sum(arg2);
> +}
> +
> +/*
> + *  The pwrite() function returns the number of bytes written.
> + *  This value is added to the existing contents of the
> + *  aggregation.  The name of the function, pwrite, is the only
> + *  field in the key, so this aggregation contains the total
> + *  number of bytes written by pwrite().
> + */

Right.  So entry has the requested number and return has the actual number.

> +pid$target:libc.so:pwrite:return
> +{
> +  @pwrite_total_bytes[probefunc] = sum(arg1);
> +}
> +
> +/*
> + *  This probe accumulates the number of bytes the read() function
> + *  requests to be read.  The aggregation is differentiated by the
> + *  file descriptor.  This means that we get the totals on a per
> + *  file descriptor basis.
> + *  We also store the file descriptor in a thread-local variable
> + *  called fd, because we would like to use it in the return probe
> + *  for this function.
> + */
> +pid$target:libc.so:read:entry
> +{
> +  self->fd = arg0;
> +  @bytes_requested[probefunc,self->fd] = sum(arg2);
> +}
> +
> +/*
> + *  This is where things come together.  The read() function returns
> + *  the actual number of bytes read.  These values are accumulated in
> + *  an aggregation that includes the file descriptor in the key.  In
> + *  this way we can print both the number of bytes requested and the
> + *  actual number of bytes read.
> + *  We also accumulate the total number of bytes actually read across
> + *  all the file descriptors.
> + *  Since thread-local variable fd is no longer needed, the storage is
> + *  released.
> + */
> +pid$target:libc.so:read:return
> +{
> +  @bytes_actually_read[probefunc,self->fd] = sum(arg1);
> +  @total_bytes_read                        = sum(arg1);
> +  self->fd = 0;
> +}
> +
> +/*
> + *  This is a shared clause for the probes for the fread() and
> + *  fwrite() functions.  We can share the clause, because the
> + *  arguments and return value are the same for both functions.
> + *  The clause-local variable comment is used to store a dynamically
> + *  generated string.  This string is then concatenated with the
> + *  name of the function, resulting in a string that depends on the
> + *  function name in the probe.
> + *  The aggregation has a key that consists of the pointer to the
> + *  stream and the generated string.  This aggregation accumulates
> + *  the product of the byte size and the number of elements, which
> + *  is the total number of bytes read, or written.
> + */
> +pid$target:libc.so:fread:entry,
> +pid$target:libc.so:fwrite:entry
> +{
> +  this->comment = (probefunc == "fread") ?
> +                   "read by " : "written by ";
> +  this->rw = strjoin(this->comment,probefunc);
> +  @total_byte_count_frw[arg3,this->rw] = sum(arg1*arg2);
> +}
> +
> +/*
> + *  This probe accumulates the return value of the fread() function,
> + *  which is the number of elements read.  This number is accumulated
> + *  across all pointers to streams.
> + */
> +pid$target:libc.so:fread:return
> +{
> +  @fread_total_elements[probefunc] = sum(arg1);
> +}
> +
> +/*
> + *  The output section where all the results are printed.  Note that
> + *  in one case, we use 2 aggregations in the call to printa().
> + *  This is supported if the key is the same.
> + */
> +END
> +{
> +  printf("%8s %20s   %-15s %6s\n",
> +               "Function","Filename","File pointer","Count");
> +  printa("%8s %20s   0x%-13p %@6d\n",@file_pointer);
> +
> +  printf("\n%8s %20s   %-15s %6s\n",
> +               "Function","Filename","File descriptor","Count");
> +  printa("%8s %20s   %-15d %@6d\n",@file_descriptor);
> +
> +  printf("\n%8s   %-16s %7s\n","Function","Stream/FD","Count");
> +  printa("%8s   0x%-14p %@7d\n",@fclose_stream);
> +  printa("%8s   %-16d %@7d\n",@close_fd);
> +
> +  printf("\n");
> +  printf("%8s %5s %14s\n","Function","FD","Bytes written");
> +  printa("%8s %5d %@14d\n",@pwrite_bytes);
> +  printa("Total bytes written by %s: %@ld\n",@pwrite_total_bytes);
> +
> +  printa("\nOn stream %p - Total bytes %s = %@ld\n",
> +                                  @total_byte_count_frw);
> +
> +  printa("Total elements read by %s = %@ld\n",
> +                                  @fread_total_elements);
> +
> +  printf("\n%33s\n","Bytes read");
> +  printf("%8s %6s %10s %10s\n","Function","FD","Requested","Actual");
> +  printa("%8s %6d %@10d %@10d\n",@bytes_requested,
> +                                 @bytes_actually_read);
> +  printa("\nTotal number of bytes read: %@d\n",@total_bytes_read);
> +}
> diff --git a/examples/sched-simple.d b/examples/sched-simple.d
> new file mode 100755
> index 000000000..6f93a5d50
> --- /dev/null
> +++ b/examples/sched-simple.d
> @@ -0,0 +1,76 @@
> +#!/usr/sbin/dtrace -s
> +/*
> + *  NAME
> + *    sched-simple.d - count how often the target was on/off the CPU
> + *
> + *  SYNOPSIS
> + *    sudo ./sched-simple.d -c <target>
> + *
> + *  DESCRIPTION
> + *    This script uses the sched provider to count how often the
> + *    target proces was scheduled on and off the CPU.  The target
> + *    can be an application, or any command.
> + *    The information is given for all individual threads used by
> + *    the target, as well as across all the threads.
> + *
> + *  NOTES
> + *    There are 2 aggregations.  The one with 2 fields in the
> + *    key, thr_count_states, uses the thread ID as the first field.
> + *    By configuring printa() through pragmas to print the data
> + *    sorted by the first field, the results for this aggregation
> + *    are shown on a per thread basis.
> + */
> +
> +/*
> + *  Suppress the default output from the dtrace command and
> + *  have printa() print the data sorted by the first field.

s/data/aggregation data/.  Hopefully that will provide one more cue to 
link text with pragma names.

> + */
> +#pragma D option quiet
> +#pragma D option aggsortkey=1
> +#pragma D option aggsortkeypos=0
> +
> +/*
> + *  These are 2 probes from the sched provider that share a
> + *  clause.  Without a predicate, these probes will fire as
> + *  soon as any process goes on/off the CPU.  That will work
> + *  fine, but in this case we use a predicate to restrict the
> + *  probing to the target application, or command.
> + *
> + *  The clause-local variable state is thread safe.  It is used

The clause-local variable is thread safe?  Uh, I guess, but the 
implication is confusing.  If you want thread-safe, use self->.

The variable state?  What is the state of the variable?  Confusing. 
Maybe, to indicate that "state" is a name of a variable, it should be 
set off in quote marks?  Or rename it to be tmpstr or something, which 
looks more like a variable name and not like a generic English word.

> + *  to demonstrate how to construct a string to be used as a field
> + *  in an aggregation, or for any other purpose.

A clause-local variable is used to demonstrate how to construct a string 
for any purpose?

> + *  We know that the probe name is either on-cpu or off-cpu.  This
> + *  is used to assign a different string to variable state.
> + *
> + *  The 2 aggregations are used to count how often the probes fired.
> + *  The difference is in the key.  The first aggregation,
> + *  count_states, does not use the thread ID in the key.  It counts
> + *  across all threads.  In contrast with this, the second
> + *  aggregation, thr_count_states, differentiates the counts by the
> + *  thread ID.
> + */
> +sched:::on-cpu,
> +sched:::off-cpu
> +/ pid == $target /
> +{
> +  this->state = (probename == "on-cpu") ?
> +                  "scheduled on" : "taken off";
> +  @count_states[this->state]         = count();
> +  @thr_count_states[tid,this->state] = count();
> +}
> +
> +/*
> + *  Print the results.  We use printf() to print a header.
> + *  For both aggregations, a formatted printa() statement
> + *  is used.  The printf() in between the 2 printa()
> + *  statements is used to separate the 2 blocks with results.
> + */

Personally, I think it's great that DTrace prints aggregations by 
default, and I would remind people here that the END clause is not 
included because it's needed to print results but that it is used only 
to illustrate how to control the output format.

> +END
> +{
> +  printf("%8s %-20s %6s\n","TID","State","Count");
> +  printf("====================================\n");
> +  printa("%8d %-12s the CPU %@6d\n",@thr_count_states);
> +  printf("\n");
> +  printa("Total count %12s: %@d\n",@count_states);
> +}
> diff --git a/examples/sched-stats.d b/examples/sched-stats.d
> new file mode 100755
> index 000000000..50b3b263a
> --- /dev/null
> +++ b/examples/sched-stats.d
> @@ -0,0 +1,182 @@
> +#!/usr/sbin/dtrace -s
> +
> +/*
> + *  NAME
> + *    sched-stats.d - display various scheduler statistics
> + *
> + *  SYNOPSIS
> + *    sudo ./sched-stats.d -c "<name-of-app [app options]" <threshold>

"<name-of-app" is missing a closing ">"?

> + *  DESCRIPTION
> + *    This script shows several thread-scheduling statistics that
> + *    were collected while the target application, or command, was
> + *    running.
> + *
> + *    For good performance, a thread should run on the same CPU,
> + *    or at least in the same NUMA node for as long as possible.
> + *    In case it is taken off the CPU, it should be scheduled
> + *    back on the same CPU, or at least in the same NUMA node.
> + *
> + *    The information printed shows the scheduling decisions
> + *    for any (multithreaded) application:
> + *
> + *    - For each thread, a histogram of the on-cpu times is shown.
> + *
> + *    - This is followed by a table with the overall timing
> + *    statistics.  For each thread, the total on-cpu time is
> + *    given, plus the minimum and maximum on-cpu time.
> + *
> + *    - The script takes one parameter.  This is a threshold
> + *    value.  It is a lower limit on the on-cpu times.  For each

What are the units of the value?

> + *    thread it is reported how often the on-cpu time was at, or
> + *    below, this value.
> + *    This table might point at threads that are falling behind
> + *    on a (heavily loaded) system
> + *
> + *    - The last 2 tables give information on the thread affinity.
> + *    The first table of these 2 is sorted by thread ID and
> + *    shows the CPU(s) used by each thread, as well how often
> + *    the thread was scheduled on the CPU, and taken off again.
> + *    The second table of these 2 shows the same information,
> + *    but now from a CPU centric view.
> + *
> + *  NOTES
> + *    This script works with any target application or command.
> + */
> +
> +/*
> + *  Suppress the default output from the dtrace command and
> + *  have printa() print the data sorted by the first field.


s/data/aggregation data/.  Hopefully that will provide one more cue to 
link text with pragma names, printa() name, etc.

> + */
> +
> +#pragma D option quiet
> +#pragma D option aggsortkey=1
> +#pragma D option aggsortkeypos=0
> +
> +/*
> + *  Read the threshold value from the command line and store it in
> + *  a global variable.  By using a global variable, all probes can
> + *  read/write it.  In this case it is used as a read-only variable.
> + */

How does one specify that it is a read-only variable?  Oh, we cannot do 
that.  Oh, and all probes can access $1 anyhow.  How about just 
replacing the whole comment with something like, "Place the argument 
from the command line in a global variable for better readability." Or 
something like that.

> +BEGIN
> +{
> +  time_threshold = $1;
> +}
> +
> +/*
> + *  An on-cpu probe with a predicate to ensure that the probe only
> + *  fires when the target is scheduled on the CPU.
> + *
> + *  Set the base value of the timer.  Since each thread needs

Might as well refer to ts_start as the start time.  Besides, (at least 
to me), "base" time is a little unclear.

> + *  to have its own timer, we use a thread-local variable.
> + *
> + *  There are 2 aggregations.  Both increment their counter each
> + *  time that this probe fires.  The thread ID (in tid) and CPU ID
> + *  (in curcpu->cpu_id) are used to define the key.
> + *
> + *  The difference between the 2 aggregations is that the fields in
> + *  the key have been swapped.  Given that printa() has been
> + *  configured to sort the data by the first column, the first
> + *  aggregation shows a thread centric view, while the second one
> + *  has a CPU ID centric view.
> + */
> +sched:::on-cpu
> +/ pid == $target /
> +{
> +  self->ts_start = timestamp;
> +
> +  @thr_cpu_id_on_cpu[tid,curcpu->cpu_id] = count();
> +  @cpu_id_thr_on_cpu[curcpu->cpu_id,tid] = count();

Okay, but instead of curcpu->cpu_id you could just say "cpu".  In 
libdtrace/sched.d, we see "cpu = curcpu->cpu_id;".  Oddly, we used to 
document "cpu" as a built-in variable, but we no longer do. Dunno.

> +}
> +
> +/*
> + *  This is the first of 2 probes using off-cpu.  In this probe,
> + *  again a predicate is used to restrict the data to the target
> + *  command.
> + *
> + *  Since the process/thread is about to go off CPU, now is the time
> + *  to record how long the thread has been running on the CPU.
> + *  The value is converted to microseconds (us) and stored in a

"converted to microseconds" =>
"converted from nanoseconds to microseconds"

> + *  clause-local variable.
> + *
> + *  This variable is then used to update 4 aggregations: the
> + *  histogram of the on-CPU times, the total on CPU time, plus the
> + *  minimum and maximum time on the CPU.
> + *
> + *  The next 2 aggregations are very similar to those used in the
> + *  on-cpu probe.
> + *
> + *  Last, but not least, the storage for the thread-local variable
> + *  is released, because it is no longer needed.
> + */

You have a monolithic comment block with a concatenated series of 
comments, followed by a bunch of statements.  This means my eye has to 
move back and forth between comments and statements, which I have to 
search out.  I might even have to scroll.  How about breaking the 
comments up so that each comment is by the statement it describes. You 
could then drop some descriptive text like "The next 2 aggregations."

> +sched:::off-cpu
> +/ pid == $target /
> +{
> +  this->time_on_cpu = (timestamp - self->ts_start)/1000;
> +
> +  @timings[tid]    = quantize(this->time_on_cpu);
> +  @total_time[tid] = sum(this->time_on_cpu);
> +  @min_time[tid]   = min(this->time_on_cpu);
> +  @max_time[tid]   = max(this->time_on_cpu);
> +
> +  @thr_cpu_id_off_cpu[tid,curcpu->cpu_id] = count();
> +  @cpu_id_thr_off_cpu[curcpu->cpu_id,tid] = count();
> +
> +  self->ts_start = 0;
> +}
> +
> +/*
> + *  This is the second off-cpu probe.  It has a different and
> + *  somewhat more complicated predicate.
> + *  This probe fires for the target command, but only in case the
> + *  time on the CPU is below the user controllable threshold value.
> + *  We basically record and count the event, but of course any
> + *  other action can be taken here.
> + *  An aggregation is used to store the data.  The thread ID (tid)
> + *  is used as a key and we increment the counter.  This produces
> + *  a count for each thread.
> + */
> +sched:::off-cpu
> +/ pid == $target && this->time_on_cpu <= time_threshold /
> +{
> +  @thr_below[tid] = count();
> +}
> +
> +/*
> + *  This is where all results are printed.  It is all quite
> + *  straightforward, but note that in three cases, multiple
> + *  aggregations are printed with a single printa().  As long as the
> + *  keys are the same, this is supported and makes it possible to
> + *  print multiple columns with values.
> + */

As I say in a different example, it'd be good to remind users that this 
END probe is to pretty-print the format and illustrate printa() for 
pedagogical purposes;  but DTrace by default will print aggregations.

> +END
> +{
> +  printf("Thread times on the CPU (us)\n");
> +  printa(@timings);
> +
> +  printf("\n=====================================\n");
> +  printf("%10s %26s\n","TID", "Times on the CPU (us)");
> +  printf("%21s %6s %8s\n","Total","Min","Max");
> +  printf("=====================================\n");
> +  printa("%10d %@10d %@6d %@8d\n",@total_time,@min_time,@max_time);
> +
> +  printf("\n=====================================\n");
> +  printf("Thread ON CPU time threshold: %d us\n",time_threshold);
> +  printf("=====================================\n");
> +  printf("%8s %26s\n","TID","Count below threshold");
> +  printa("%8d %@14d\n",@thr_below);
> +
> +  printf("\n=====================================\n");
> +  printf("%10s  %8s %11s\n","TID","CPU ID","Count");
> +  printf("%37s\n","On CPU  Off CPU");
> +  printf("=====================================\n");
> +  printa("%10d  %8d %@7d %@8d\n",@thr_cpu_id_on_cpu,
> +                                 @thr_cpu_id_off_cpu);
> +
> +  printf("\n=====================================\n");
> +  printf("%8s  %10s %11s\n","CPU ID","TID","Count");
> +  printf("%37s\n","On CPU  Off CPU");
> +  printf("=====================================\n");
> +  printa("%8d  %10d %@7d %@8d\n",@cpu_id_thr_on_cpu,
> +                                 @cpu_id_thr_off_cpu);
> +}
> diff --git a/examples/thread-ids.d b/examples/thread-ids.d
> new file mode 100755
> index 000000000..38210c4d6
> --- /dev/null
> +++ b/examples/thread-ids.d
> @@ -0,0 +1,159 @@
> +#!/usr/sbin/dtrace -s
> +
> +/*
> + *  NAME
> + *    thread-ids.d - show the mapping between Pthread IDs and tid values
> + *
> + *  SYNOPSIS
> + *    sudo ./thread-ids.d -c "<name-of-application> [app options]"
> + *
> + *  DESCRIPTION
> + *    This script assumes that the target uses the Pthreads library
> + *    to create one or more threads.  It shows the mapping of the
> + *    Pthread thread IDs and the thread ID, as returned in the tid
> + *    built-in variable.
> + *
> + *  NOTES
> + *    - In addition to showing how to uncover this mapping, this
> + *    script also shows a technique how to retrieve a value from
> + *    a pointer argument in a function call.
> + *
> + *    In this case, this is the thread ID that pthread_create()
> + *    returns in its first argument.
> + *
> + *    This is from the man page for pthread_create():
> + *
> + *    int pthread_create(pthread_t *restrict thread,
> + *                        const pthread_attr_t *restrict attr,
> + *                        void *(*start_routine)(void *),
> + *                        void *restrict arg);
> + *
> + *    We need to capture the contents of *thread.
> + *
> + *    In this case, we cannot use the built-in tid variable
> + *    within pthread_create(), because typically, this function
> + *    is executed by one thread, the main thread.  This means
> + *    that the value in tid is the thread ID of this main thread,
> + *    but we need to have the value of the thread that is created
> + *    as a result of calling pthread_create().  As shown below,
> + *    this can be done by tracing clone3, which is called by
> + *    pthread_create().
> +
> + *    - It is assumed that a function called main is executed.
> + *    If this is not the case, this is not a critical error.
> + *    The first probe is used to capture the tid value for the main
> + *    program.  This thread is however not created by function
> + *    pthread_create() and therefore this part of the script is
> + *    not essential.
> + *    This is why this probe and printf statement in the END probe
> + *    can safely be removed, or replaced by a suitable alternative.
> + */
> +
> +/*
> + *  Suppress the default output from the dtrace command.
> + */
> +#pragma D option quiet

FWIW, you could add q to the -s in the shebang line instead.

> +
> +/*
> + *  Declare a global variable.  This is to ensure that the compiler

self->clone_tid is not a global variable.

> + *  sees it before it is referenced.
> + */
> +self int clone_tid;
> +
> +/*
> + *  Store the thread ID of the main thread.
> + */
> +pid$target:a.out:main:entry
> +{
> +  tid_main = tid;
> +}
> +
> +/*
> + *  Two thread-local variables are set here.  The first one is used
> + *  in a predicate on the second probe to ensure that we are only
> + *  tracing the clone* calls executed while within pthread_create().
> + *
> + *  We actually know that clone3 is called.  By using the wildcard
> + *  here, the script still works should this number change in the
> + *  future.
> + *
> + *  Variable pthr_id_p captures the first argument of the call to
> + *  pthread_create().  This is a pointer, but we can't dereference
> + *  it here, because the contents this pointer points to, is only

contents is =>
contents are

> + *  available upon return.
> + *  The way this is solved, is by storing the pointer in this probe.

The way this is solved, is by =>
This is solved by

> + *  In the return probe for this function, we can then dereference
> + *  the pointer.
> + */
> +pid$target:libc.so:pthread_create:entry
> +{
> +  self->in_pthr_create = 1;

Why in_pthr_create?  Why not test for pthr_id_p (!=NULL) instead? Get 
rid of an unnecessary variable.

> +  self->pthr_id_p = (int64_t *) arg0;
> +}
> +
> +/*
> + *  We know that one of the clone functions is called from within
> + *  pthread_create() and it returns the thread ID that DTrace stores
> + *  in the tid variable.
> + *  This is why the return value, which is stored in arg1, is copied
> + *  into a thread-local variable called clone_tid.  This variable is
> + *  then referenced in the return probe for pthread_create().
> + */
> +pid$target:libc.so:clone*:return
> +/ self->in_pthr_create == 1 /
> +{
> +  self->clone_tid = arg1;
> +}
> +
> +/*
> + *  This is where things come together.
> + *
> + *  We already have the value for the thread ID as used by DTrace.
> + *  It is stored in thread-local variable clone_tid.
> + *
> + *  Now we can capture the Pthreads thread ID.
> + *
> + *  We are about to return from pthread_create() and can dereference
> + *  the pointer.
> + *  Before we do so, the data needs to be copied from userland
> + *  into the kernel.  Since this is an address, 8 bytes are copied.
> + *  The value is what pthread_create() returns in its *thread
> + *  first argument, which is the Pthreads thread ID.
> + *  This gives us both thread IDs and they are used in the key
> + *  for aggregation @thread_mapping.
> + *
> + *  There is one more thing to this though.  It is not strictly
> + *  necessary to use an aggregation.  An associative array can
> + *  be used, but that is going to be a problem when it comes
> + *  to printing the results.  There is no printa() equivalent
> + *  for associative arrays, but since we do not know the key(s)
> + *  upfront, we don't know what to print.
> + *  Instead, we use an aggregation, but do not print the result.
> + *
> + *  Last, but not least, at this point we can and should return

s/return/free/

> + *  the storage for the thread-local variables.
> + */
> +pid$target:libc.so:pthread_create:return
> +{
> +  this->pthr_id = *(int64_t *) copyin(*self->pthr_id_p,8);
> +  @thread_mapping[this->pthr_id,self->clone_tid] = count();

This is interesting -- and I, for one, have learned something from this 
-- but it's pretty unnatural.  Count, when the number does not interest 
you?  Instead of using an aggregation, how about simply printing here 
and now the mapping between the two IDs?  Just printf(), no 
aggregation.  No need for an associative array either.

> +  self->pthr_id_p      = 0;
> +  self->clone_tid      = 0;
> +  self->in_pthr_create = 0;
> +}
> +
> +/*
> + *  The aggregation is printed in the END probe.  We use printf()
> + *  statements to print the thread ID of the main program and the
> + *  table header.
> + *  Note that there is no format field for the value for the
> + *  aggregation.  As explained above, the value is not relevant
> + *  in this case.
> + */
> +END
> +{
> +  printf("Thread ID of main program: %d\n\n",tid_main);
> +  printf("%16s <=> %-9s\n\n","Pthreads ID","Thread ID");
> +  printa("%16d <=> %-9d\n",@thread_mapping);
> +}
> diff --git a/examples/var-scope.d b/examples/var-scope.d
> new file mode 100755
> index 000000000..b5317afd2
> --- /dev/null
> +++ b/examples/var-scope.d
> @@ -0,0 +1,117 @@
> +#!/usr/sbin/dtrace -s
> +
> +/*
> + *  NAME
> + *    var-scope.d - initialize, update and print variables
> + *
> + *  SYNOPSIS
> + *    sudo ./var-scope.d -c <target>
> + *
> + *  DESCRIPTION
> + *    This script demonstrates some of the scoping rules.  It
> + *    shows the behaviour of global and clause-local variables.
> + *
> + *  NOTES
> + *    Other than the BEGIN and END probe used here, there are
> + *    2 more probes for the fopen() function, but you can use any
> + *    probe you like, or no additional probes at all.  You are
> + *    encouraged to experiment with this example and make changes.
> + *
> + *    In case this example is used with the date command, you will
> + *    see something like this:
> + *
> + *    $ sudo ./var-scope.d -c date
> + *    In BEGIN
> + *        var_A = 10 var_B = 20

Why var_A and var_B?  How about just A and B?  Alternatively, globalA 
and globalB, but I think A and B would be better.  It emphasizes that 
variables are "by default" global.

> + *        this->C = 60
> + *    In fopen - return
> + *        var_A = 11 var_B = 21
> + *    <output from the date command>
> + *    In END
> + *        var_A = 11 var_B = 21
> + *    $
> + *
> + *    Below, the workings of each probe is explained.  Since the
> + *    results depend on the command that is traced, we base the
> + *    explanations on the output from the above example.
> + */
> +
> +/*
> + *  Suppress the default output from the dtrace command.
> + */
> +#pragma D option quiet
> +
> +/*
> + *  This demonstrates how to declare a variable outside of a clause.
> + *  Variable var_B is declared to be of type int64_t.  This is a
> + *  global variable.  It is initialized to zero by default.
> + */
> +int64_t var_B;
> +
> +/*
> + *  In this clause for the BEGIN probe, var_A is initialized to 10
> + *  and var_B is given a value of 20.  Both are global variables.
> + *  Variable C is a clause-local variable initialized to 30.
> + */
> +BEGIN
> +{
> +  var_A = 10;
> +  var_B = 20;
> +  this->C = 30;
> +}
> +
> +/*
> + *  In this clause for the BEGIN probe, clause-local variable C is
> + *  updated to a value of 60.  This demonstrates that clause-local
> + *  variables are local to the set of clauses executed for a
> + *  particular probe firing.  This set is executed in lexical order.

What is lexical order?  Isn't it the order in some lexicon... probably 
alphabetical order?  Maybe you have to say "in the order they appear in 
the program"?

Demonstrating stuff about clause-local variables is tricky, since they 
start with undefined values.  So, e.g., you could have one clause say 
this->a=31415926 and have a different clause print this->a and see the 
value 31415926.  That would seem to demonstrate that the clause-local 
variable's value was persistent from one clause to an entirely unrelated 
clause, when in fact it simply means that the second clause reused some 
value without resetting it.  Bottom line:  "demonstrating" stuff with 
clause-local variables is tricky.

There are no thread-local variables.

Mostly, what you are doing is demonstrating global variables, which 
might feel rather underwhelming to many readers.  Personally, I am not a 
fan of this example.

> + *  Here, there are 2 sets for the BEGIN probe.
> + *  The printed values in the example above confirm this update
> + *  for C, as well as the initial values for var_A and var_B.
> + */
> +BEGIN
> +{
> +  this->C += 30;
> +  printf("In %s\n",probename);
> +  printf("\tvar_A = %d var_B = %d\n",var_A,var_B);
> +  printf("\tthis->C = %d\n",this->C);
> +}
> +
> +/*
> + *  The clause in this probe updates var_A.  Since this is a global
> + *  variable, this change is visible to all probes that fire after
> + *  this probe has fired.
> + */
> +pid$target::fopen:entry
> +{
> +  var_A += 1;
> +}
> +
> +/*
> + *  The clause in this probe updates var_B and prints both var_A
> + *  and var_B.  The probefunc (fopen) and probename (return) are
> + *  printed first, followed by the values for var_A and var_B.
> + *  We are in the return probe here, so we know that the entry
> + *  probe has fired too.  This means that var_A has been updated
> + *  as well.
> + *  This is exactly what we see in the output above: var_A is 11
> + *  and var_B is 21, as it has just been updated.
> + *  Note that C is not visible here, because it is local to the
> + *  BEGIN probe.
> + */
> +pid$target::fopen:return
> +{
> +  var_B += 1;
> +  printf("In %s - %s\n",probefunc,probename);
> +  printf("\tvar_A = %d var_B = %d\n",var_A,var_B);
> +}
> +
> +/*
> + *  Both var_A and var_B are global variables and are visible
> + *  in the END probe.  The final values are printed here.
> + */
> +END
> +{
> +  printf("In %s\n",probename);
> +  printf("\tvar_A = %d var_B = %d\n",var_A,var_B);
> +}
