Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7B7520EA55
	for <dtrace@lists.linux.dev>; Fri, 25 Oct 2024 19:57:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729886251; cv=fail; b=nbplgW74WjqgsyRwdbSmt+X6S5E1FfdogBbq4zwY7Gjrl2LPEjUJVK07mmWuD0DSLbddrujoGdFfIl7GUUtLgb1xhg8MOd4o/YfOn7YeS3rJYVe/1zDOiU1eUkn/GtY4zl6iAosKhqhEX+mU1X07rr2FViwIk4gO3tAOrV+QfIY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729886251; c=relaxed/simple;
	bh=OMjj4AbairQmtB60Vh2YJumLZopZu0bFkmfivpkYEk8=;
	h=From:To:Subject:Date:Message-Id:Content-Type:MIME-Version; b=PQnKvSsTtihw2sa7qFcrtdMZTtPsulAZ11w1PR7PKW9IWGIPIGsYnibdQUqfqbg62817wuSDEKO8476fyUFw73j8n7OptaohMJwFYcNKF8grvzmXwT8usehZqQx/HWQdAdV5k9HRFkm5hN+95lrQiDrCG5wZfklbK2plqYFAEQ8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=mVuDJtzb; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=J9+N+jVT; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="mVuDJtzb";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="J9+N+jVT"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49PJeSwF006150
	for <dtrace@lists.linux.dev>; Fri, 25 Oct 2024 19:57:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2023-11-20; bh=AAIDTinXuEY563Kwyns4JFKQZfPJkhQIr/mXBxecD8I=; b=
	mVuDJtzbggfxZrX6ZA3r4Rxorf3WihNnUtVBkvDW1bVYbtYITG1UYGs+ncmjf3/T
	UKlgUaZQmp9Qt8hshAQrbPMVgDlfj996oArrz3/Tv+N+WqFMw5WJQwq2ia916UAc
	PBfpMv4sMIxZYPwNyrbsxoXxvdnwHZ+ybT0cfetuNvgplzwJr2vqmrvwWzwm9UjC
	Rao0Q4THWtNbTYaJW8y+WFfPrmgJilASpmod6Fr85JGDwWnNHb7aQY8HsP8ywi0i
	a23yEwq2iZ02j5SuSWV4QP/x8PEhMX7roMqw202qhWYC8zZA7ejbsOnESXc/X6wF
	rWRl/7rtl7BONfUemesa8Q==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 42c5asnu17-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 25 Oct 2024 19:57:27 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 49PJYXqv020976
	for <dtrace@lists.linux.dev>; Fri, 25 Oct 2024 19:57:26 GMT
Received: from nam04-mw2-obe.outbound.protection.outlook.com (mail-mw2nam04lp2174.outbound.protection.outlook.com [104.47.73.174])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 42emhnt780-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 25 Oct 2024 19:57:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CLLmqr9XmXuA+whsuKH7SRUf9pqBRk4kZpvPa+ev83uZSNmOBlf+ISZCJdqe+FMKuXG44JVkUg4rD7Y4Ft3XRc1t3ErWmbxUPwDVyGKyIJqKHng/O3E8af62dLCfsKRxw4sm9cCFViHMv5mWODEj5Vt4k3ZQAcRtPa2VKkJVXRvxIIhoY1UXo6liCoXtDJNg2qagZxfreLhzA4s3dgnTVYudDiLfRZZKQH5oPaOb6PKMtdo5T/P9VMc9u2yarrJbF0AXXdhJhaED6UsAiQQ8xfHsoafNe+c6idH3LaxNLTLkRktMU/f/WU1wmlrT4L72s7WfQDWP19klglSxT3rWOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AAIDTinXuEY563Kwyns4JFKQZfPJkhQIr/mXBxecD8I=;
 b=Wd7BHA8BfBx6Nu34FqUpzM5JRrGZ2FiuBxf+e2Tuvy/Wvj+9AbQwpdIUZIX/t6tD2C6+EAT7FHNSvNUBJ0yTVNZ9uiYoSUCzOdZe1PhC8btDb0TWoIJjDLy2Bkwh+qd7YHAoz0DZYANz60EuSVYsFlpmW3xJQMHGhVmlTjvzw+4KhuFlZzAIu16YkJ4td16Uqn3c/J2cNmGc6NdGJzqdP6GZboBFKMGZRWicwBVOGd//1iGY/+UNxsGw9xlOoru+CKeAkG0v5Rj9h+Jpo8/vv2Ic5H5qG7QB2YLlJ98UqY/JIXl9h8LxtSz7J7wCvFi9YUTaHbzGuPytoLkL4dh7Ag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AAIDTinXuEY563Kwyns4JFKQZfPJkhQIr/mXBxecD8I=;
 b=J9+N+jVTyudFjI4UcxCX6elb7+ZrCe20ApC9LeLRIkbXdRQhpB+6k9u9dOsUTX8kYp3CNNbaboUEnoZTVc4H/8oVUG4s4fS4s8d2Cfyhqr+r7rJlghQJkw3UgElvMMEEg/PhiuDFAk8tVbbgfKxRKoKwQxFFTDQFFIHl3Gv4tAw=
Received: from SJ0PR10MB5647.namprd10.prod.outlook.com (2603:10b6:a03:3da::17)
 by LV3PR10MB8106.namprd10.prod.outlook.com (2603:10b6:408:27f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.21; Fri, 25 Oct
 2024 19:57:22 +0000
Received: from SJ0PR10MB5647.namprd10.prod.outlook.com
 ([fe80::8db4:df1d:6afd:e4a7]) by SJ0PR10MB5647.namprd10.prod.outlook.com
 ([fe80::8db4:df1d:6afd:e4a7%5]) with mapi id 15.20.8093.014; Fri, 25 Oct 2024
 19:57:22 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH v3 08/19] Support multiple overlying probes in the uprobe trampoline
Date: Fri, 25 Oct 2024 15:57:17 -0400
Message-Id: <20241025195717.26135-1-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
Content-Type: text/plain
X-ClientProxiedBy: LO3P265CA0002.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:bb::7) To SJ0PR10MB5647.namprd10.prod.outlook.com
 (2603:10b6:a03:3da::17)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5647:EE_|LV3PR10MB8106:EE_
X-MS-Office365-Filtering-Correlation-Id: a6f8a1bc-d3ba-4892-e07a-08dcf52f3d6e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?2WFyeU6UqYEuQS1XxeEZmWr4Vv9T9A1kHuFQV6N69IfQuS7ddkg/inJu9EF+?=
 =?us-ascii?Q?wx/RyqnWe93kiXBVXIcPWbGtGZavadCi8r47K6UhWCevx8miDtMSFHO7oyOI?=
 =?us-ascii?Q?RhJLfErsHJCv4A33o2R5dIdF+A8myOpi/PRw4Xn1gXRzKyX7Ohlyr5U95IKG?=
 =?us-ascii?Q?MXzbUiuvKOSRlJvdQIoK1HFmdcOIf+dapAe1ME2B8uH6ul3CyqGPCDNinpWa?=
 =?us-ascii?Q?Bf7IQSqC0DA4uTu5euc2C/lkyDGAhsoB4D1rznxfQmAOT2Fcr4E6xteQxfVT?=
 =?us-ascii?Q?zFsFnJ5+5tZX8RsInqZQStTsxUv14qAfokPqPZhkWl6H23LLurfOnTUWNGlD?=
 =?us-ascii?Q?024Yryaj/zzPyFsmzuUfnDqURs/daT5h0SDEIPU8twawQ7VYDEv1PXKdN7wD?=
 =?us-ascii?Q?VOQ2WlhF9sgDoNIwm4dGpGDgVKZ+gkp72OznxKF/6DYbm/PXWb6/YwW/qobx?=
 =?us-ascii?Q?4RAIbspO08wu6MNIR3EWuA07N08s0db6G+egYP7ZWFqo3qnqdrtMDzhb4lGO?=
 =?us-ascii?Q?qin4M41Oyaq6nxCSqA7zqEgjcOffA5YnXowZFXmm29mlwmqLGoyvCqzoMWip?=
 =?us-ascii?Q?DtvRC/9XF22YS/4UcLdM97/YxL0opeW9ZEv7uLxvp52ZGrtkAjUJ8Q+b5aMr?=
 =?us-ascii?Q?RDCT6XHziXhBvSBT4O+5gnkKxnFAeDtQOlf6lrE2KQn9h7pIwuKaN4kTXfhP?=
 =?us-ascii?Q?7SH8y/XF9Km8mbsHt24OtocPPHd2qJH/oT8SzqaxmSJgPLhUT6huqrkdfDZM?=
 =?us-ascii?Q?aehPvyIrP90ediVAqhKI6xKCXxOOfU9zpzvNQ2L9FyOLC1vKmcm3bgtHR7Sz?=
 =?us-ascii?Q?3/uLMPhKRdcBfwpKCUAYMLGX1x1pgPGnlinaaDlpOCcqutB9w4W5LzP/p/po?=
 =?us-ascii?Q?9Q1QCGDo2+PS6j/7wTMV1azTJ7y01Fh0me1kjM+UlldX6ZRmDPcZspDTiecW?=
 =?us-ascii?Q?2l7kDjOnq/L8ONU52w1Qd1Ic3eBTcWniznNZPB9C9RLwiWGfYDFfdmEAjPGu?=
 =?us-ascii?Q?k0cA0CXMcxrwHdUG1NwIPF6a492hDObE9tSjAzxClvvs+CQXvNwJHlh1DIJU?=
 =?us-ascii?Q?xmXqd28iVGvQcPsOUiwmhfxT5VkX5a4E7qGgXGxNPJQBQpfWIphmCvLUQElo?=
 =?us-ascii?Q?RGW38dP603tLsmxRxQWgzcbJ+OH6ALc6d2rHSmPlMu7DykgryBUrU343Bg+v?=
 =?us-ascii?Q?b4nnut6OlhIp647gP3oyt/ks2SXOJkUzK5UdeA63cFCYbVbsLqdeJYrufzq4?=
 =?us-ascii?Q?47LSNtAs04yO6xX0nkSXRSW0XuVOtQJbTLgjLPz0U44pRg/t7YOwGtluXM/W?=
 =?us-ascii?Q?ihL1OIxkbeP36xDwAM5/QOVj?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB5647.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Rl1UlkVsJiEu45ogdpxfuaG0YKXVaJCuNI1eBjsOXZrVhfNlaMjLJVsyotcf?=
 =?us-ascii?Q?5PDc61k2h4Tjo41Cd+FfdY729ByZecogxbUXGvZUh+6pWBXgW1Xw1K5/nvZh?=
 =?us-ascii?Q?/rAP61HZ1mUXVQIZ1afD1VrnGlEAoiTW0lRRwdvRrTb58Gc9f78UhYChdwj/?=
 =?us-ascii?Q?NodW0NawmPyJeK9cj4yUDq0+BnSnx9wLEG7n8n8G6jr4jYfqPOI5Z666Maxa?=
 =?us-ascii?Q?UY6lCTDmV+OQc1foTAuw98LPkNqTG+tmtRnf3A8yrro8CXsUwZpT8qgmMvTa?=
 =?us-ascii?Q?cxPOUUtqx2K9/JzTZLe1b3xFZt5TghF9whc5b/ra/3mImyUrbaZPd+zjz43m?=
 =?us-ascii?Q?a2R/KGgNvv6/XrD6h/lNGyTDgwJ280sqOJiOLP0fZFbLh3UFXDRfUt6c9Jf2?=
 =?us-ascii?Q?v4GFa9IpuRyoMbkv9e416EP48+4q+yUUA94FQJSA0Rc4dBtgaDzgMb4L/1L3?=
 =?us-ascii?Q?1D/hjG0DDcngfV+ayLs3YxhFTXm/mPT8COUuDtR1XHkAQzC8gFyHcz5K5lEn?=
 =?us-ascii?Q?2lqF4zX6Wpet3KWVxTRUDYPBAZP0wF6elnDeD7ZJ7Mj98VsKEVOhppWtcp3p?=
 =?us-ascii?Q?d0Jg+E/hi1Em3SkNjCYJO+G09xc5rhizr7EdXiiboaRUgdf0K0sRTG/KP2pD?=
 =?us-ascii?Q?/cabcti1Ux7ogJWFsyZe9+sIJc6mBjbBHp0tgGfSoq2+/FPWdn0YOCiKlp0M?=
 =?us-ascii?Q?wL7odh9/WnI3bZksDlEG1q38T3lX8tnSgDRCUb0KCExVVzFnMyRM+sRluvwN?=
 =?us-ascii?Q?fKytFvJc2ejUOilsh5udPwZYAMlEiX+FtFlVJhSknv71XIf2mYBJt+O77NrO?=
 =?us-ascii?Q?dSweryTv1/LdaTSXsGZAKRSOSG8PiMirgU78ur+K0J+pdXbjrT8KdcWze/k3?=
 =?us-ascii?Q?d2Jd494qh8N0UaN/zr5KbSe9RZMK7wsC9MAefpVGOcDEjtbXjldIyM49RpOH?=
 =?us-ascii?Q?acShUmrbRM3tiwU1Z2dU2QetpGL5r9f4ptgNE5dr3v8EdZVHblBuGMl6Ckfx?=
 =?us-ascii?Q?VWGREBDirqTBfDl+RXXPnD8T02SfscDm/DIHb1s0p6RrYHVDIGhSwApWFOjY?=
 =?us-ascii?Q?WAcbZFWTA45LjAZWRNfo5S8O2dpCdv/PqnhIdou0+2C+1SnkKCL3g/pFp4UX?=
 =?us-ascii?Q?fzxDKnskSl/PFOyP3BiRw7bbNY95SGvNhPq1j8UVT43PNOnZjCCq7JQg9FVi?=
 =?us-ascii?Q?0HGWoxxLNjHNuOcpo1vj9XFVjrnr0/wnS68l6aEdGEKbHvF5onisefqIDkvM?=
 =?us-ascii?Q?sF2OdhKSF7+opceoiYCGcD/Cb0YtHrZjZ0QfIaukSOGkEjHRX4FEeSWf48pu?=
 =?us-ascii?Q?T/PdqAhwjmtNRNjTM+Qk///5F2BG6vzNJsT2m0KlDmkCMetNqGEZZ9CB2/Yr?=
 =?us-ascii?Q?g5J6SeOoawhBnmVuJSRWkr4lVqagQhIdTWvKYzPP1SqeOFHay4NCtME6glpW?=
 =?us-ascii?Q?GHbxFW89Y+N6cP/Q5YL64mnUa7JFAPiUgh6MpP0SZjrLzC6iDDyt/BKIzW/v?=
 =?us-ascii?Q?vLImHb5fx6QzHUyBS1s4FSW2fsCA/H/jMsYj1CbkwQHHw7J8vXkr/6HtRs1k?=
 =?us-ascii?Q?ce9DK4Z7MwktAFGMUPtECybIw+vqWxK6jg27Q7zq?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	WzYFieDQI+V0RR4GpQCye3kkl/vkgnbabbsye9U3EHr6wPRXaQ/UuvcPSjx2H4EyTCiu7OMD82MUc5CzJXkuXkTDXPSqA/iOY5lEqqz2dbQCyWiwIHpMrs0v/6x+aTlF0SnIi0zjNSHNxOhOs0ejJBrZ4J52inTfNYTP+K4sLfV/dUa8qiHDcSxG+VQ+kY+E7gULcM0HwfS+v36EOV9xKOV9uCXTh1QIBOg2REyBielSO9mSZ2xD/MOVICv9pySXrzAqBGipqHtQNGhVJ6mxiZ605gHd6MqjdOR0JZ4OAOXTEQ6I03qQupUyfi2V1g6YQga0cqWoraa9mOuMXqEwt/pHBog/PyyjroxqU8u6+Q0DCNSlR0leN7Z/tJnMrBmXW007rm4aelLL5TVRghAelUf17QahS3/DSa/qo8UcqRrTZ4BTxGKtBYJxhW7dQ8/zt3ul9qitEcjZmgol8OFmFKzvtlpQsLlaTf1sqQ+Z6IVFEFYc5EafnMjo3sGdTYW4iBFYv1MbRIn70at47wAKacpTMsmGjmFxhujgOGKIuRpjSMJHPR/T4/RjTjU8gjON6uRES84si6eNT6TCAuJ/XmpR2APjmacKthiKftbnWCA=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a6f8a1bc-d3ba-4892-e07a-08dcf52f3d6e
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB5647.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2024 19:57:22.5029
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rteXY5NktI4J9FAt7mkaRAWg3RPCXwMk02bgEwDhwQcM3AJHCWOZVDMQKfk4VYzpviqPOOlILL6fWX/2/Z5VPg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR10MB8106
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-25_14,2024-10-25_02,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 malwarescore=0 bulkscore=0
 adultscore=0 mlxlogscore=999 mlxscore=0 phishscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2409260000
 definitions=main-2410250153
X-Proofpoint-GUID: DDnGzqRxFvihU9apQ6s_9cZdD0cQ4GZu
X-Proofpoint-ORIG-GUID: DDnGzqRxFvihU9apQ6s_9cZdD0cQ4GZu

From: Eugene Loh <eugene.loh@oracle.com>

An underlying probe could support all sorts of overlying probes:
  - pid entry
  - pid return
  - pid offset
  - USDT
  - USDT is-enabled

The overlying probes belonging to an underlying probe match the
underlying probe -- except possibly in pid.  So, an underlying
probe loops over its overlying probes, looking for a pid match.

The trampoline would look for only one match.

However, more than one overlying probe might match.  Therefore,
change the loop to keep going even after a match has been found.

Incidentally, it is actually only pid offset probes that could
"collide" with any other overlying probes for a given pid:

-)  pid return probes are implemented with uretprobes
    and so cannot "collide" with any other probes

-)  no two USDT probes -- is-enabled or not -- can map
    to the same underlying probe for any pid

-)  no USDT probe -- is-enabled or not -- can map to
    to the same underlying probe as a pid entry

So, possibly one could optimize the trampoline -- e.g., by adding
BPF code to exit once two matches have been made.

Note that the flag we pass in to dt_cg_tramp_copy_args_from_regs()
should depend on whether the overlying probe is a pid or USDT probe.
We used to check PP_IS_FUNCALL, but the upp could be for both.  So
check the provider for the overlying probe instead.  (A later patch
will move USDT probes to a different mechanism anyhow.)

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 libdtrace/dt_prov_uprobe.c          |  43 ++++------
 test/unittest/pid/tst.entry_off0.sh | 125 ++++++++++++++++++++++++++++
 2 files changed, 143 insertions(+), 25 deletions(-)
 create mode 100755 test/unittest/pid/tst.entry_off0.sh

diff --git a/libdtrace/dt_prov_uprobe.c b/libdtrace/dt_prov_uprobe.c
index e0d7da00b..85e309915 100644
--- a/libdtrace/dt_prov_uprobe.c
+++ b/libdtrace/dt_prov_uprobe.c
@@ -754,38 +754,23 @@ static int trampoline(dt_pcb_t *pcb, uint_t exitlbl)
 	 *				//     (%r7 = dctx->mst)
 	 *				//     (%r8 = dctx->ctx)
 	 */
-
 	dt_cg_tramp_copy_regs(pcb);
-	if (upp->flags & PP_IS_RETURN)
-		dt_cg_tramp_copy_rval_from_regs(pcb);
-	else
-		dt_cg_tramp_copy_args_from_regs(pcb,
-						!(upp->flags & PP_IS_FUNCALL));
 
 	/*
-	 * Retrieve the PID of the process that caused the probe to fire.
+	 * Hold the PID of the process that caused the probe to fire in %r6.
 	 */
 	emit(dlp,  BPF_CALL_HELPER(BPF_FUNC_get_current_pid_tgid));
 	emit(dlp,  BPF_ALU64_IMM(BPF_RSH, BPF_REG_0, 32));
+	emit(dlp,  BPF_MOV_REG(BPF_REG_6, BPF_REG_0));
 
 	/*
-	 * Generate a composite conditional clause:
-	 *
-	 *	if (pid == PID1) {
-	 *		dctx->mst->prid = PRID1;
-	 *		< any number of clause calls >
-	 *		goto exit;
-	 *	} else if (pid == PID2) {
-	 *		dctx->mst->prid = PRID2;
-	 *		< any number of clause calls >
-	 *		goto exit;
-	 *	} else if (pid == ...) {
-	 *		< ... >
-	 *	}
+	 * Loop over overlying probes, calling clauses for those that match:
 	 *
-	 * It is valid and safe to use %r0 to hold the pid value because there
-	 * are no assignments to %r0 possible in between the conditional
-	 * statements.
+	 *	for overlying probes (that match except possibly for pid)
+	 *		if (pid matches) {
+	 *			dctx->mst->prid = PRID1;
+	 *			< any number of clause calls >
+	 *		}
 	 */
 	for (pop = dt_list_next(&upp->probes); pop != NULL;
 	     pop = dt_list_next(pop)) {
@@ -800,14 +785,22 @@ static int trampoline(dt_pcb_t *pcb, uint_t exitlbl)
 		idp = dt_dlib_add_probe_var(pcb->pcb_hdl, prp);
 		assert(idp != NULL);
 
+		/*
+		 * Populate probe arguments.
+		 */
+		if (upp->flags & PP_IS_RETURN)
+			dt_cg_tramp_copy_rval_from_regs(pcb);
+		else
+			dt_cg_tramp_copy_args_from_regs(pcb,
+			    prp->prov->impl == &dt_pid ? 1 : 0);
+
 		/*
 		 * Check whether this pid-provider probe serves the current
 		 * process, and emit a sequence of clauses for it when it does.
 		 */
-		emit(dlp,  BPF_BRANCH_IMM(BPF_JNE, BPF_REG_0, pid, lbl_next));
+		emit(dlp,  BPF_BRANCH_IMM(BPF_JNE, BPF_REG_6, pid, lbl_next));
 		emite(dlp, BPF_STORE_IMM(BPF_W, BPF_REG_7, DMST_PRID, prp->desc->id), idp);
 		dt_cg_tramp_call_clauses(pcb, prp, DT_ACTIVITY_ACTIVE);
-		emit(dlp,  BPF_JUMP(lbl_exit));
 		emitl(dlp, lbl_next,
 			   BPF_NOP());
 	}
diff --git a/test/unittest/pid/tst.entry_off0.sh b/test/unittest/pid/tst.entry_off0.sh
new file mode 100755
index 000000000..f1a75b6ae
--- /dev/null
+++ b/test/unittest/pid/tst.entry_off0.sh
@@ -0,0 +1,125 @@
+#!/bin/bash
+#
+# Oracle Linux DTrace.
+# Copyright (c) 2024, Oracle and/or its affiliates. All rights reserved.
+# Licensed under the Universal Permissive License v 1.0 as shown at
+# http://oss.oracle.com/licenses/upl.
+#
+
+dtrace=$1
+
+trig=`pwd`/test/triggers/ustack-tst-basic
+
+DIRNAME="$tmpdir/enter_off0.$$.$RANDOM"
+mkdir -p $DIRNAME
+cd $DIRNAME
+
+# Run DTrace, dumping all probe functions and names, plus PC, in a.out.
+
+$dtrace $dt_flags -c $trig -n '
+pid$target:a.out::
+{
+	@[probefunc, probename, uregs[R_PC]] = count();
+}
+
+profile:::tick-1s
+{
+	exit(0);
+}' > D.out
+if [ $? -ne 0 ]; then
+	echo ERROR: dtrace
+	cat D.out
+	exit 1
+fi
+
+# Generate the expected list of functions for our trigger program.
+
+echo main > expected.tmp
+echo mycallee >> expected.tmp
+for x in 0 1 2 3 4 5 6 7 8 9 \
+         a b c d e f g h i j k l m n o p q r s t u v w x y z \
+         A B C D E F G H I J K L M N O P Q R S T U V W X Y Z; do
+    echo myfunc_$x >> expected.tmp
+done
+sort expected.tmp > expected.txt
+
+# Check output for probe name "0" or "entry".
+
+awk '$2 == "0" || $2 == "entry"' D.out | awk '
+{
+	fun = $1;
+	prb = $2;
+	PC = $3;
+	cnt = $4;
+}
+
+# Check that the count is 1.
+cnt != 1 {
+	print "ERROR: count is not 1";
+	print;
+	exit(1);
+}
+
+# Check that we have not gotten the same (fun,prb) already.
+prb == "0" && fun in PC0 {
+	print "ERROR: already have offset 0 for this func";
+	print;
+	exit(1);
+}
+prb == "entry" && fun in PCentry {
+	print "ERROR: already have entry for this func";
+	print;
+	exit(1);
+}
+
+# Record the PC.
+prb ==   "0"   { PC0[fun] = PC; }
+prb == "entry" { PCentry[fun] = PC; }
+
+# Do final matchup.
+END {
+	# Walk functions for the offset-0 probes.
+	for (fun in PC0) {
+		# Make sure each offset-0 probe has a matching entry probe.
+		if (!(fun in PCentry)) {
+			print "ERROR: func", fun, "has offset-0 but no entry";
+			exit(1);
+		}
+
+		# Make sure the matching probes report the same PC.
+		if (PC0[fun] != PCentry[fun]) {
+			print "ERROR: func", fun, "has mismatching PCs for offset-0 and entry:", PC0[fun], PCentry[fun];
+			exit(1);
+		}
+
+		# Dump the function name and delete these entries.
+		print fun;
+		delete PC0[fun];
+		delete PCentry[fun];
+	}
+
+	# Check if there are any leftover entry probes.
+	for (fun in PCentry) {
+		print "ERROR: func", fun, "has entry but no offset-0";
+		exit(1);
+	}
+}
+' | sort > awk.out
+
+# Report any problems.
+
+if ! diff -q awk.out expected.txt; then
+	echo ERROR: diff failure
+	echo ==== function list
+	cat awk.out
+	echo ==== expected function list
+	cat expected.txt
+	echo ==== diff
+	diff awk.out expected.txt
+	echo ==== DTrace output
+	cat D.out
+	exit 1
+fi
+
+echo success
+exit 0
-- 
2.43.5

