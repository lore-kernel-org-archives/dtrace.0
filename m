Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB908380FD6
	for <dtrace@lists.linux.dev>; Sat,  3 Oct 2026 08:43:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791017023; cv=fail; b=PrXT+4O/d+caoM10VdWe/n9CzlE/moTinXkWeo4Xg66DOTBtNzMqtimszgSr+cx+2Hb0i5byiud9wRIJCcWM9YkRVDp3BELJGhJAt2rsBkGoejhvCaaGdHB+7KP8jMOWgzGBVR6Lg7r6vxdAf7VpRTAf2j8PabmN6+klWu8Voh4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791017023; c=relaxed/simple;
	bh=4KmS046Y3hc1QvxF//eggdcnrZBxa0gL2dq8/nRgXn0=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=K0MduvJ9Eb3Ho6njFQWN67vDqZAisGBUlYm9S2fUybNcI/AorNYF7GOp9ag3Hwj4gEurlSnhhuNYAx/XyIIKZggece0LVX5duqk7/rOQLi6zI0ivjryoGJe5Hjd2GdMaNiwzhGiM0eMZb8Qup42Ege5BIvHEhk9D9SDtcY15iUU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=bljsvvxr; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=toV5Mg1W; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="bljsvvxr";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="toV5Mg1W"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6936lxP8604319
	for <dtrace@lists.linux.dev>; Sat, 3 Oct 2026 08:43:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=46Ao88Nd7afAh42t2v88ihZKQrc0XLI1dOzRdr86Lew=; b=
	bljsvvxrSol7qfhJkafsq6pD92nm4FUNfsZZsgSVvQ7J9oPCeYRV8/UANAudvkHe
	674LMkvr359fobcjAaSZC2zfH7M8O6c7i8Ir1x62HNbklcd8ns5vuhNtffOmP922
	e+E5VaOk3y7N4MxtmWjb6LgwFGiZhsAE4v4S1loyuW/mPXKk5FCuROYYYcqDiIKE
	DXpebzhhdoKf44Pp+F0izsq5dHPQs5S1Ljpkz+BHIxx23oOCkf8eyqCVqjoPw0MR
	JNp8hxHNB46nXtamiu13Gy/tf2B+o1kawCQr8NPrSbijm6x2w/HkYBBrOaY1M7bz
	0981fuOG+2HdTrW1aMLTpQ==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4h2r4b857r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Sat, 03 Oct 2026 08:43:40 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.7/8.18.1.7) with ESMTP id 6938Yxr8018376
	for <dtrace@lists.linux.dev>; Sat, 3 Oct 2026 08:43:39 GMT
Received: from bl0pr03cu003.outbound.protection.outlook.com (mail-eastusazon11012051.outbound.protection.outlook.com [52.101.53.51])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4h2r58efr0-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <dtrace@lists.linux.dev>; Sat, 03 Oct 2026 08:43:39 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Qhew/BL5mPHd3tz/pK8kuFjw5s3InATlM/ke7Kt+y/D32jwE3b18dM7HZD8++zocO1ONaQBMFj9KQ7W29cZSNHLV5pcUQ/YPrwypU8cKZHqv9OICGw6CDiRWdNeasnGQutaCnU9cVzDaa/35bW41SFvUW+e1AZU+ai1k9YMClMXxOxdOVk7nyudtMfo0dBqcgO+CwZBTpjLZqWizwU8tKUuCJ63ZkMGecmLqzTkYfSQ6J6vB8K7q0EPmH6qWsWaU1GVrqILaiDq3qcLdRw6cYYDtfU9qPsrz2wlIAh4nEyh5LumlnF3NFWg1DszUvd5El7YHepjBsLBdE6fR6P6Rzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=46Ao88Nd7afAh42t2v88ihZKQrc0XLI1dOzRdr86Lew=;
 b=afHIBBAsgkgm6iJxJBt9zf3unIvtjCfux4JG8xGI02AuSgBoRPUi+yovy/MUZ5ywQM9/aLq//NZsSIDFQJ37tx13C8z+j4sUPhRUgQNumkZyPSdPKdUnGyJ14Esmwv+/8EsExjvdGm6CpyOaBDl5GmRHur6UZswIYrYkaTpWZNuZvAiT/OmV9oiNVmN39uBDMdBTUUhgvE2qoZLU5w1kZJlLp5axz2kFM0wULiw8t3q5VbZ+ckhM+IVa6aWbmePNeCjUNGsiCsEcyFf35D2YLD57Lj5Gg5/05T7M8+x9XhO9Q2ph0vPbg6cVjjwvIJNBDkS5+HIOV6yVHah0aIY3cw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=46Ao88Nd7afAh42t2v88ihZKQrc0XLI1dOzRdr86Lew=;
 b=toV5Mg1WBSp6B2TWyLxJDJ1OE+DnG6R2au0AuN1A3tX1+n+dcS7g0cLvsQhIq1RDnvbEMNO0ns+mXLSLjapNWxnQFNbBft7Z+3IY1CBYUfzMRGYGmdlYJMc8uu6wqM7o7NKRIPr7VTRks9zo9B6EFLjBT8G0co5+qGxd4MWnwpE=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oracle.com;
Received: from BLAPR10MB5075.namprd10.prod.outlook.com (2603:10b6:208:322::19)
 by CH3PR10MB7680.namprd10.prod.outlook.com (2603:10b6:610:179::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.13; Sat, 3 Oct
 2026 08:43:36 +0000
Received: from BLAPR10MB5075.namprd10.prod.outlook.com
 ([fe80::8f5:4de9:81ce:f5c6]) by BLAPR10MB5075.namprd10.prod.outlook.com
 ([fe80::8f5:4de9:81ce:f5c6%4]) with mapi id 15.21.0496.008; Sat, 3 Oct 2026
 08:43:36 +0000
Message-ID: <dd35831e-eb4c-4df2-b4a2-9b4b15364d45@oracle.com>
Date: Sat, 3 Oct 2026 02:43:32 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [DTrace-devel] [PATCH 8/8] test: add missing expectations and
 update diagnostics
To: Kris Van Hees <kris.van.hees@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
References: <aa2282debc489ee70f47aa6f2bfe1ba8@oracle.com>
Content-Language: en-US
From: Elena Zannoni <elena.zannoni@oracle.com>
Organization: Oracle USA Inc.
In-Reply-To: <aa2282debc489ee70f47aa6f2bfe1ba8@oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI5PEPF0000097B.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:808:1::809) To BLAPR10MB5075.namprd10.prod.outlook.com
 (2603:10b6:208:322::19)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BLAPR10MB5075:EE_|CH3PR10MB7680:EE_
X-MS-Office365-Filtering-Correlation-Id: 1378e692-61ca-443f-860d-08df212a69f2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|366016|1800799024|56012099006|10067099003|18002099003|22082099003|13003099007|3023799007;
X-Microsoft-Antispam-Message-Info:
	IJbaUt6eFnlUyB7+1t9uyq+VYG9wtnaxnsqkOWoT9g9AKREWCFaMBBMI0mdzx3XppQ4QJh3j2gnGLb9NSt4AIZAWDTEzl/jJoKnyNZQMugX1EPSPlD7G9GdZLUUJfIJkHUuu/S4JfZQjHjc7tAUD+9GbSnOsoHjW/XP5HX7BfLYUa8FFsrNEBhDCwGIDdv8LqPau/NKcL9rEVxRXh7iPq0lObwgAdlnWacqsT9ettn6iaEsm8OJXCsm/1Uam+nXztg7yMu6iprUnHVlmWYDGDo737OwIwKTg43j33yeuPQb/UB5m6BESWEDpalkcjxKZxHdnA00c5NNBPwK6CcCpBa5nJKG3Q1hZBGNMlQ9HXQR/w2txmNAraNIURkO+2Z/q5uBqSjLh6Oti8L9Wrq61jY1igMO1OQ1pPZfybemEgNUJXSRwgz9vCgXcn4BM5NzGt3eVmQ3cq0cGleQOMf6WjRf3n9NiZ9iXwQvzruWo9JmKa7uCqy+J/5VtPDfhp0jRNwZuW/ITvm3OllzjCzgUwvUk15Ux5iytEsfaoO1WJRp0cvREISybJwWvqqnyLe+5qg+DUX2kH21fbxccelyDi4Nnx5z//UHHXqZ2iD2/7sA/ZqW742PXrvUo4PMNNVF9/alkCIVcpPR2N37AayHAcXtCGNAmip+0nmzKV9gunAU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BLAPR10MB5075.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(56012099006)(10067099003)(18002099003)(22082099003)(13003099007)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MnpzcnJlRzhJQStBR2wrS1JLWjlvOHpKVHlObVFEUWhwcXhabHNoOFFuWUpK?=
 =?utf-8?B?LzdJNWh5Y1JLQmIwL2FLZXFoYTY5WkNHMnAzLzg0TFZxTFNITU01NVhoQ0U0?=
 =?utf-8?B?d1RCK0JMYXY4YldsVHJodnZyRnRJQ0ZXNGJPRFYzMHp1M2JCck0xdG5vaklm?=
 =?utf-8?B?d0dBVjlMZkpDYnBaanp0bHVML0ltblgzdENZaWFwTytyZ0JUMURrVStyUS95?=
 =?utf-8?B?STBQVDJYc1VJY0VoNEprdGhRZjFmdElyQTl0YWpCZzhKbEJ2QWM0RVVhcUx3?=
 =?utf-8?B?K0swYzNDZkFscFI3QWs5VzJxaDVsWFAyaVlHOUs5OEJxaG01UTgrUytrWTN2?=
 =?utf-8?B?UE9VMDNhcjhPRk1BTFl1RHN2dFZiS28xTzQwVjN3L2gzcnlYZFRSbk1MekR1?=
 =?utf-8?B?aTEzZi9UZUhsVngrbVVoUVRIRjVKd0swZ3Vqb3UzWFJCZWpvdm1ZdnAwOU5v?=
 =?utf-8?B?ZzQwNXVlRGlROXlJVXBZTkxMdWlza29VTHk4Y3BpUE1jQmZ6a0hOR2NNMnJz?=
 =?utf-8?B?QVNnV1M1U3JIdTh5R21TMG5pN0NpcjBTNHNvN3JVaC9wNmVQeGFXTFJqWjJ2?=
 =?utf-8?B?OXprZk03THl2NGlhTnl5a3NWMldGcHpFTm9YQ3dFYzFSZFp1ZVp4QjBmekJB?=
 =?utf-8?B?MzM0MThtWmwwOFRsdk5ldEt0ZWlCOThtcnlqdWNiUG51UnBmWDFPTDlqTE5C?=
 =?utf-8?B?bE9RMmxhOXBGU1RtZlBrN2oyeEtpdm5FZFh6eCt0bitmWGkxN0NZT3lmR0Rq?=
 =?utf-8?B?M3F0blJ2OC8xTjQ0eC9XTnRDVVduc1pEKzM5YVQvSFB2bmUwanBSYXFwa0FK?=
 =?utf-8?B?MTdnVEh3UlNHd2ZmNGxSSHpGUjYzN0FRT2hGR2dFdS9od0ZvcElnMWd6bWVF?=
 =?utf-8?B?S3d4YXhrbWkvQXZRUHNVcmt4UGxvYnBjcHE3eEtqZU5XZm9adkpSNzR2YXAy?=
 =?utf-8?B?cThKQXllb2ozTHJtSWlVMVFJRUJlc2R0MUpZNHZuL3FzZFhEWldnL3JFc3dD?=
 =?utf-8?B?d3JZc0gvbEVHT3FUZGpiRnBXUTJzUkFIZXA0TDFFcEQ2VVd3RXhaQXZORDA3?=
 =?utf-8?B?WFk4TTJxOTJDbFcrZHdicStRVWtiU1lOT2xGZkJwMUwxYUtJN2YxVjh5Snc2?=
 =?utf-8?B?SDhYWE5QMDBXalgvaGlRU0luNG9KdnVxY1RFTStaRHpGdmVycXByR1hocUJl?=
 =?utf-8?B?NDZnVVFUL3lhRlhXbWhVM1ZVMGdJTXRONnlaSkFwQ09XZGVDL05qQzIrMDV0?=
 =?utf-8?B?ZzJPRmNoK0IzeU1qdmdnamZNa0FHREVzSmVCemVnTyt4bUdZZzlVa0lCZ2hQ?=
 =?utf-8?B?bDN2K2YwV1M1cVVHMHFRNmx0eURtd0ZMbTNBbTFRWHVKbVM2QjJNVDV4cGZI?=
 =?utf-8?B?bzJUaHR5VjJ4UG54cWlFK0J2SEMzM2pxaW5qMEJrWlRqT0hiMzhlWWZXSG0y?=
 =?utf-8?B?QzZKWjA4cXRadk9YMVdpd1JqOVQ2WUhYMzArcmhwL2tnbHFwRzlxTnIyckhn?=
 =?utf-8?B?Zm9ROVQ3dTA3K1h3c1VPa3RreHJaaHc1MFQ0YzN4dnJacUI2VUFmWVRiVHZ3?=
 =?utf-8?B?K0JQOFpVQjhjTzBFT1F2SVd5NE9zTmtjR3pDQWk3YmowUEJub1IxOUdBZEhu?=
 =?utf-8?B?a0hQWXBWckM2WXk3TUZGU3JPNHE0MVhnNnZsb0lka2pJNkxPcktJOERCUnZN?=
 =?utf-8?B?dGRaNmozeEhlbWN6cVZZSFVRSjdvd0ZTbEJjamsyTFk2YlB1dTliT21aay9a?=
 =?utf-8?B?L3pkTHJtcWdyazRPMlFJNE9NZjlJWVJ3aDNnTXpBWWJVcGJjdHQ0RXVOa2E0?=
 =?utf-8?B?eERoaGt6RUhzZFVtRTcrS3I4dGRKbkhya05KZVMzODVDQm02K2diRTI3cDVj?=
 =?utf-8?B?SzJTekRJZHdKOHhPT2dXenJXT0RGYmRzckFRRlVpaEJhRm54cFFsRXUzQXk2?=
 =?utf-8?B?ZzJRVHVReWMyRko2UUVZMWFYanNWNE94MTFDakNUQ3J0Mk5zTDhhbFlGUFRW?=
 =?utf-8?B?SGJPTEF5NmlpWkR5aVVSWExhUXQxSGRGOGVqRm5wclIyVjRsc3RsM0c4MEJU?=
 =?utf-8?B?bURHTXVqaFA2eFBjV1VENDZoZDU2TnNCUzFTWmlzWWpSa3NHVG1JZkhzTjd1?=
 =?utf-8?B?TVptcDZKazBrWlJMREllTzdsaXVFWGxiL1pxZG1WQ3c0QTJKRzIweXB4REZt?=
 =?utf-8?B?cXRWa3BiWU5BY2ZhWVB6aStIdXFpaHpXRDk3WmYzeEhaSUVsTTNjOW5TSWhV?=
 =?utf-8?B?QmtjV1djbDIvM2tKYWdybWlyVHZ0Y1pWcUUwSUVVcVk5STNiYnhyUWhOMytu?=
 =?utf-8?B?ZG9rWHphOUlHd0hqUjJ6TmNiNjNBVmhxQ2E0bS9RTVA5WURhSWNMQT09?=
X-Exchange-RoutingPolicyChecked:
	kQFVyD3Lr76OQVd6TSUsLs567kLiu7PqCq4vXxs2yjZPx8HOs1VBZJ6wkCG+nOm/oFvBVDCsoQJjsCdyXfLs4OW9/frC1baRhOsw4PvneyJCwpTxvmf0a19Pyg0vtiaTH9mNJodr1j1EbuZdsCKWTXmco03jYSlZWKNj9RQ069nsTfYBsDeykWjt/Vdbo+P2muhmG17NSDTmZ9apnVzWozsQAu/EZja5NN5ISEqKIuX52MXfR67+kq98c4uUJBEi0M9Wlu574xDKCg25LC+z6gGlSJmAcN5ARIQRMNOoG5EuTisln8xBSUNx7zDWsQNRXF9ACA6h4QzId5iq5qnoDQ==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	E88hRRV8WOS5q7AaTjdXT16dqIom678x+mhKSoI23I32ZC218/L6an+YJEMaRPszfBhlKz5XZJAtdmhSwxpfbD4UDHfmAYUezb8cXZGVTrCDBaM9gpGoJ/CwBqvauYnqedzPeOp/44+Xo9Qf/DWakQ8F2puqdgDZEj7auMu8fuco6EF2tjhhofCr7dDpibHpWH1O/zFv6etOzUV4nD2FbnE3drgm8aR5G33lKUyhGzzxbkhvJ7nRsWkQRf/00tya+h/sdN6NoYCP4TAGv0cJ9/FEf2mNXbTz1Bm+PfYlIRe3EZEXP3b/I/1PapdBnTI+iAIVbt9qOj+RxWk0g0pA6aVC2jNEzL+4fWKlLhp4Ds4zNDMx04bxauo2hyRFU8r05hF1+KSgpgHoqniXPXPlXsA1b9RdTtECIoO18Bi4yj92iBGfqxs4fyoA3Pl+4HnQEBApN4tWbrqiREu6Q6dHxZOM1HtxFCzG32ZnmJxa3y2gWQ0ZsBmdA6MfyZBya1JVa6QtAAm1H4rdFl9sAy0KiuAdkhE04h2Xw4QGc2Qun+gx9j+uxuDmL/+9boW5clPIOf/TlAbsh2zJxDG9i/SpU8YXoJeL6pSQ6jvz9YVniS0=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1378e692-61ca-443f-860d-08df212a69f2
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB5075.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2026 08:43:36.1629
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5Q8ABSHslPqfyriKZLNzX1cuuGyQLaAaI6wy+OsO7fWptkzHaDOJlzj9sdz4lQQrwLNcJZpD89AVBjDO5lCFbQViD1qq6AbiKP7f5fGjl6A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB7680
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-02_07,2026-10-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 phishscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0
 malwarescore=0 mlxlogscore=999 mlxscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2609040000 definitions=main-2610030034
X-Proofpoint-GUID: lmG_foAlHDJ7JtwCgzhc8OOhy0CmdRKB
X-Proofpoint-ORIG-GUID: lmG_foAlHDJ7JtwCgzhc8OOhy0CmdRKB
X-Authority-Analysis: v=2.4 cv=BIQmP1QG c=1 sm=1 tr=0 ts=6ac0c03c cx=c_pps
 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=jiCTI4zE5U7BLdzWsZGv:22 a=x4eqshVgHu-cdnggieHk:22 a=yPCof4ZbAAAA:8
 a=tP-4YIfkaI5rEOwMlBsA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAzMDAzNCBTYWx0ZWRfX43F08uBDXOmO
 nvwfJenAijai6pjh71qvg/9OZfuXWUFwRfXddbJ+kgrm7aRZ3qy2gslSpIek1W9yqvPCeaVL9fm
 IHVQqQWmzrYsqNRz4M07aYmrxt9tp1x7rRrNPSltGuYjkfL10ZAW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAzMDAzNCBTYWx0ZWRfX2FNc9fk1S4Vj
 yI33uzyj5m7WxnQGVGc86WZ8U7N+EDYv+JWP1umE28F1B02bu/7PyUjT0TO4vr6hII8jit+KPbO
 77YDDv2VKPXVSwrNMs5NrbGfTlQDlwi6j3NAZwTFwwPd5nxqQGdWH1bG7xhU0n0nYp/XSL0xNJt
 U/eLUcIMd9U8Gr/VOkBkxV98fT4ApDLgntczQEDv6+0Djfo76Uev6yedJd/EDu8e2VT01P2snEU
 YVB6gli/+OPVy/hGk4G/2D9WT7UqKV4AD6OzBh6cr0i/ooAncg4ZlI8FOmWUCOjhXGeCh8c3jqY
 lh0NGi8I3DoUfkg2DGIcGhRkVqMqj0X079KRAazOAY+43WDwz9yHRZuCvUdR3e1OAjHZOC4Ydda
 ESJhpPyPzqWm/ln0bijAqjvOuVakagKKSChwgj/4vMyG7g0/RMVsVb8OqisD6NvcQEhmOkZm5TD
 nHJ1Gk7Pri88h99KNuA==

Reviewed-by: Elena Zannoni <elena.zannoni@oracle.com>

On 9/28/26 12:02 PM, Kris Van Hees via DTrace-devel wrote:

> 
> Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
> ---
>  test/unittest/lexer/tst.keyword-member.d      |  2 ++
>  test/unittest/lexer/tst.keyword-member.r      |  1 +
>  test/unittest/lexer/tst.keyword-member.r.p    | 22 +++++++++++++++++++
>  .../unittest/types/err.D_CAST_INVAL.badcast.r |  2 ++
>  .../unittest/types/err.D_DECL_SCOPE.badenum.d | 19 ++++++++++++++++
>  .../types/err.D_DECL_SCOPE.badstruct.d        | 17 ++++++++++++++
>  test/unittest/types/err.D_SYNTAX.badenum.d    |  7 +++---
>  test/unittest/types/err.D_SYNTAX.badenum.r    |  2 +-
>  test/unittest/types/err.D_SYNTAX.badid.d      |  3 +--
>  test/unittest/types/err.D_SYNTAX.badstruct.d  |  7 +++---
>  test/unittest/types/err.D_SYNTAX.badstruct.r  |  2 +-
>  test/unittest/types/err.unloaded_var.r        |  2 +-
>  12 files changed, 73 insertions(+), 13 deletions(-)
>  create mode 100644 test/unittest/lexer/tst.keyword-member.r
>  create mode 100755 test/unittest/lexer/tst.keyword-member.r.p
>  create mode 100644 test/unittest/types/err.D_CAST_INVAL.badcast.r
>  create mode 100644 test/unittest/types/err.D_DECL_SCOPE.badenum.d
>  create mode 100644 test/unittest/types/err.D_DECL_SCOPE.badstruct.d
> 
> diff --git a/test/unittest/lexer/tst.keyword-member.d b/test/unittest/lexer/tst.keyword-member.d
> index 0c3650e3..18d78c70 100644
> --- a/test/unittest/lexer/tst.keyword-member.d
> +++ b/test/unittest/lexer/tst.keyword-member.d
> @@ -11,6 +11,8 @@
>   *      after -> and after ., even with comments interjected.
>   */
>  
> +#pragma D option quiet
> +
>  BEGIN
>  {
>  	printf("%p\n", &(*(struct cgroup_root *)&`cgrp_dfl_root).cgrp.self);
> diff --git a/test/unittest/lexer/tst.keyword-member.r b/test/unittest/lexer/tst.keyword-member.r
> new file mode 100644
> index 00000000..808ef419
> --- /dev/null
> +++ b/test/unittest/lexer/tst.keyword-member.r
> @@ -0,0 +1 @@
> +All pointers are identical (as expected).
> diff --git a/test/unittest/lexer/tst.keyword-member.r.p b/test/unittest/lexer/tst.keyword-member.r.p
> new file mode 100755
> index 00000000..4eb25f23
> --- /dev/null
> +++ b/test/unittest/lexer/tst.keyword-member.r.p
> @@ -0,0 +1,22 @@
> +#!/usr/bin/gawk -f
> +
> +NR == 1 {
> +	val = $1;
> +}
> +
> +NF > 0 {
> +	if ($1 != val) {
> +		print "Output line " NR ": Expected " val ", got " $1;
> +		fail++;
> +	}
> +}
> +
> +END {
> +	if (fail) {
> +		print fail " failures";
> +		exit(1);
> +	} else {
> +		print "All pointers are identical (as expected).";
> +		exit(0);
> +	}
> +}
> diff --git a/test/unittest/types/err.D_CAST_INVAL.badcast.r b/test/unittest/types/err.D_CAST_INVAL.badcast.r
> new file mode 100644
> index 00000000..0c62733f
> --- /dev/null
> +++ b/test/unittest/types/err.D_CAST_INVAL.badcast.r
> @@ -0,0 +1,2 @@
> +-- @@stderr --
> +dtrace: failed to compile script test/unittest/types/err.D_CAST_INVAL.badcast.d: [D_CAST_INVAL] line 14: invalid cast expression: "void" to "struct task_struct"
> diff --git a/test/unittest/types/err.D_DECL_SCOPE.badenum.d b/test/unittest/types/err.D_DECL_SCOPE.badenum.d
> new file mode 100644
> index 00000000..77e3d68d
> --- /dev/null
> +++ b/test/unittest/types/err.D_DECL_SCOPE.badenum.d
> @@ -0,0 +1,19 @@
> +/*
> + * Oracle Linux DTrace.
> + * Copyright (c) 2006, Oracle and/or its affiliates. All rights reserved.
> + * Licensed under the Universal Permissive License v 1.0 as shown at
> + * http://oss.oracle.com/licenses/upl.
> + */
> +
> +/*
> + * ASSERTION:
> + *   Test a bogus enum declaration using an invalid identifer.
> + *
> + * SECTION: Type and Constant Definitions/Enumerations
> + */
> +
> +
> +enum foo`bar
> +{
> +
> +};
> diff --git a/test/unittest/types/err.D_DECL_SCOPE.badstruct.d b/test/unittest/types/err.D_DECL_SCOPE.badstruct.d
> new file mode 100644
> index 00000000..f8b1884d
> --- /dev/null
> +++ b/test/unittest/types/err.D_DECL_SCOPE.badstruct.d
> @@ -0,0 +1,17 @@
> +/*
> + * Oracle Linux DTrace.
> + * Copyright (c) 2006, Oracle and/or its affiliates. All rights reserved.
> + * Licensed under the Universal Permissive License v 1.0 as shown at
> + * http://oss.oracle.com/licenses/upl.
> + */
> +
> +/*
> + * ASSERTION:
> + *   Attempt a bogus struct declaration using an invalid identifer.
> + *
> + * SECTION: Structs and Unions/Structs
> + */
> +
> +struct foo`bar {
> +
> +};
> diff --git a/test/unittest/types/err.D_SYNTAX.badenum.d b/test/unittest/types/err.D_SYNTAX.badenum.d
> index 77e3d68d..6717dd84 100644
> --- a/test/unittest/types/err.D_SYNTAX.badenum.d
> +++ b/test/unittest/types/err.D_SYNTAX.badenum.d
> @@ -1,19 +1,18 @@
>  /*
>   * Oracle Linux DTrace.
> - * Copyright (c) 2006, Oracle and/or its affiliates. All rights reserved.
> + * Copyright (c) 2006, 2026, Oracle and/or its affiliates. All rights reserved.
>   * Licensed under the Universal Permissive License v 1.0 as shown at
>   * http://oss.oracle.com/licenses/upl.
>   */
>  
>  /*
> - * ASSERTION:
> - *   Test a bogus enum declaration using an invalid identifer.
> + * ASSERTION: Test a bogus enum declaration using an invalid identifer.
>   *
>   * SECTION: Type and Constant Definitions/Enumerations
>   */
>  
>  
> -enum foo`bar
> +enum foo.bar
>  {
>  
>  };
> diff --git a/test/unittest/types/err.D_SYNTAX.badenum.r b/test/unittest/types/err.D_SYNTAX.badenum.r
> index 834c2b1c..9a14d317 100644
> --- a/test/unittest/types/err.D_SYNTAX.badenum.r
> +++ b/test/unittest/types/err.D_SYNTAX.badenum.r
> @@ -1,2 +1,2 @@
>  -- @@stderr --
> -dtrace: failed to compile script test/unittest/types/err.D_SYNTAX.badenum.d: [D_SYNTAX] line 19: syntax error near "}"
> +dtrace: failed to compile script test/unittest/types/err.D_SYNTAX.badenum.d: [D_SYNTAX] line 15: syntax error near "."
> diff --git a/test/unittest/types/err.D_SYNTAX.badid.d b/test/unittest/types/err.D_SYNTAX.badid.d
> index 23d026f3..8f234539 100644
> --- a/test/unittest/types/err.D_SYNTAX.badid.d
> +++ b/test/unittest/types/err.D_SYNTAX.badid.d
> @@ -6,8 +6,7 @@
>   */
>  
>  /*
> - * ASSERTION:
> - *	Identifiers cannot begin with a digit
> + * ASSERTION: Identifiers cannot begin with a digit
>   *
>   * SECTION: Types, Operators, and Expressions/Identifier Names and Keywords
>   */
> diff --git a/test/unittest/types/err.D_SYNTAX.badstruct.d b/test/unittest/types/err.D_SYNTAX.badstruct.d
> index f8b1884d..a4c8149c 100644
> --- a/test/unittest/types/err.D_SYNTAX.badstruct.d
> +++ b/test/unittest/types/err.D_SYNTAX.badstruct.d
> @@ -1,17 +1,16 @@
>  /*
>   * Oracle Linux DTrace.
> - * Copyright (c) 2006, Oracle and/or its affiliates. All rights reserved.
> + * Copyright (c) 2006, 2026, Oracle and/or its affiliates. All rights reserved.
>   * Licensed under the Universal Permissive License v 1.0 as shown at
>   * http://oss.oracle.com/licenses/upl.
>   */
>  
>  /*
> - * ASSERTION:
> - *   Attempt a bogus struct declaration using an invalid identifer.
> + * ASSERTION: Attempt a bogus struct declaration using an invalid identifer.
>   *
>   * SECTION: Structs and Unions/Structs
>   */
>  
> -struct foo`bar {
> +struct foo.bar {
>  
>  };
> diff --git a/test/unittest/types/err.D_SYNTAX.badstruct.r b/test/unittest/types/err.D_SYNTAX.badstruct.r
> index da798f0e..37ff0051 100644
> --- a/test/unittest/types/err.D_SYNTAX.badstruct.r
> +++ b/test/unittest/types/err.D_SYNTAX.badstruct.r
> @@ -1,2 +1,2 @@
>  -- @@stderr --
> -dtrace: failed to compile script test/unittest/types/err.D_SYNTAX.badstruct.d: [D_SYNTAX] line 17: syntax error near "}"
> +dtrace: failed to compile script test/unittest/types/err.D_SYNTAX.badstruct.d: [D_SYNTAX] line 14: syntax error near "."
> diff --git a/test/unittest/types/err.unloaded_var.r b/test/unittest/types/err.unloaded_var.r
> index ac7972c7..d8c59c5e 100644
> --- a/test/unittest/types/err.unloaded_var.r
> +++ b/test/unittest/types/err.unloaded_var.r
> @@ -1,2 +1,2 @@
>  -- @@stderr --
> -dtrace: failed to compile script test/unittest/types/err.unloaded_var.d: line 21: failed to resolve gfs2`gfs2_control_wq: Module is no longer loaded
> +dtrace: failed to compile script test/unittest/types/err.unloaded_var.d: line 21: failed to resolve gfs2`gfs2_control_wq: Unknown module name
> -- 
> 2.52.0
> 
> 
> _______________________________________________
> DTrace-devel mailing list
> DTrace-devel@oss.oracle.com
> https://oss.oracle.com/mailman/listinfo/dtrace-devel
> 

